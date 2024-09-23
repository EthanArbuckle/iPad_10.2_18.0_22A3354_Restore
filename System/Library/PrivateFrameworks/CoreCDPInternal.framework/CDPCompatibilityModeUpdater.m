@implementation CDPCompatibilityModeUpdater

+ (BOOL)setSOSCompatibilityMode:(BOOL)a3 context:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v31;
  uint8_t buf[4];
  _BYTE v33[18];
  __int16 v34;
  int v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (!objc_msgSend(MEMORY[0x24BE1A4A0], "deferSOSFromSignIn")
    || !+[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled](CDPDOctagonTrustProxyImpl, "octagonIsSOSFeatureEnabled"))
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"DeferSOSFromSignIn is false or platform does not support SOS, SOSCCSetCompatibilityMode will not be called.\", buf, 2u);
    }

    if (a5)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = -5004;
LABEL_21:
      objc_msgSend(v20, "cdp_errorWithCode:", v21);
      LOBYTE(v15) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_36:
    LOBYTE(v15) = 0;
    goto LABEL_37;
  }
  if (!v6 && !objc_msgSend(a1, "_onlyOctagonRKNotSetWithContext:", v8))
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Ignore disable SOSCCSetCompatibilityMode\", buf, 2u);
    }

    if (a5)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = -5315;
      goto LABEL_21;
    }
    goto LABEL_36;
  }
  v31 = 0;
  _CDPSignpostLogSystem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SOSCCSetCompatibilityMode", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v33 = v10;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCCSetCompatibilityMode  enableTelemetry=YES ", buf, 0xCu);
  }

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v33 = v6;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Setting SOSCCSetCompatibilityMode: %d\", buf, 8u);
  }

  v15 = SOSCCSetCompatibilityMode();
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = v15;
    *(_WORD *)&v33[4] = 2112;
    *(_QWORD *)&v33[6] = v31;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Set compatibility mode initial success state: %d, error: %@\", buf, 0x12u);
  }

  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Successfully set SOSCCSetCompatibilityMode\", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:context:error:].cold.1((uint64_t *)&v31, v18);
  }

  v22 = v31;
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = objc_msgSend(v22, "code");
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v33 = v26;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v25, OS_SIGNPOST_INTERVAL_END, v10, "SOSCCSetCompatibilityMode", " releaseError=%{public,signpost.telemetry:number1,name=releaseError}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v22, "code");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v33 = v10;
    *(_WORD *)&v33[8] = 2048;
    *(double *)&v33[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v34 = 1026;
    v35 = v28;
    _os_log_impl(&dword_20DB2C000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCCSetCompatibilityMode  releaseError=%{public,signpost.telemetry:number1,name=releaseError}d ", buf, 0x1Cu);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v22);

LABEL_37:
  return v15;
}

+ (BOOL)_onlyOctagonRKNotSetWithContext:(id)a3
{
  id v3;
  CDPRecoveryKeyStatusProvider *v4;
  _BOOL4 v5;
  id v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[CDPRecoveryKeyStatusProvider initWithContext:]([CDPRecoveryKeyStatusProvider alloc], "initWithContext:", v3);

  if (-[CDPRecoveryKeyStatusProvider idmsHasRK](v4, "idmsHasRK"))
  {
    v13 = 0;
    v5 = -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:](v4, "isRecoveryKeySetInOctagonWithError:", &v13);
    v6 = v13;
    v12 = 0;
    v7 = -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:](v4, "isRecoveryKeySetInOctagonWithError:", &v12);
    v8 = v12;
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110146;
      v15 = 1;
      v16 = 1024;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      v20 = 1024;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_debug_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEBUG, "\"_onlyOctagonHasMissingRKWithContext idMSHasRK: %d, octagonHasRK: %d, octagonError: %@, sosHasRK: %d, sosError: %@\", buf, 0x28u);
    }

    v10 = v7 && !v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)setSOSCompatibilityMode:(uint64_t *)a1 context:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to update SOSCCSetCompatibilityMode with error: %@\", (uint8_t *)&v3, 0xCu);
}

@end

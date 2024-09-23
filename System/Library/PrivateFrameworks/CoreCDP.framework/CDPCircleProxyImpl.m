@implementation CDPCircleProxyImpl

- (CDPCircleProxyImpl)initWithContext:(id)a3 clique:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CDPCircleProxyImpl *v10;
  id *p_isa;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CDPCircleProxyImpl *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "dsid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)CDPCircleProxyImpl;
    v10 = -[CDPCircleProxyImpl init](&v19, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_cdpContext, a3);
      objc_storeStrong(p_isa + 1, a4);
    }
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "appleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dsid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "type");
      *(_DWORD *)buf = 141559042;
      v21 = 1752392040;
      v22 = 2112;
      v23 = v13;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"CDPCircleProxyImpl: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld\", buf, 0x34u);

    }
    self = p_isa;
    v16 = self;
  }
  else
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[CDPCircleProxyImpl initWithContext:clique:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (CDPCircleProxyImpl)initWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CDPCircleProxyImpl *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "cliqueConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDE84B0]);
    objc_msgSend(v4, "cliqueConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithContextData:", v7);
    self = -[CDPCircleProxyImpl initWithContext:clique:](self, "initWithContext:clique:", v4, v8);

    v9 = self;
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[CDPCircleProxyImpl initWithContext:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_clique, 0);
}

- (void)didJoinCircleAfterRecovery:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clique, a3);
    v5 = v6;
  }

}

- (unint64_t)cachedCliqueStatus:(id *)a3
{
  NSObject *v5;
  OTClique *clique;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (self->_clique)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDE84D8]);
    -[NSObject setUseCachedAccountStatus:](v5, "setUseCachedAccountStatus:", 1);
    clique = self->_clique;
    v14 = 0;
    v7 = -[OTClique fetchCliqueStatus:error:](clique, "fetchCliqueStatus:error:", v5, &v14);
    v8 = v14;
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CDPCircleProxyImpl cachedCliqueStatus:].cold.2();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"Call to cachedCliqueStatus returned a status: %@\", buf, 0xCu);

    }
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    v11 = -[CDPCircleProxyImpl cdpStatusFromOT:](self, "cdpStatusFromOT:", v7);
  }
  else
  {
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("CDPContext was missing DSID when CircleProxyImpl was initialized. Its OTClique was not created.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
      v11 = -1;
      goto LABEL_15;
    }
    _CDPStateError(-5003, (uint64_t)v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl cachedCliqueStatus:].cold.1();
    v11 = -1;
  }

LABEL_15:
  return v11;
}

- (BOOL)platformSupportsSOS
{
  return objc_msgSend(MEMORY[0x24BDE84B0], "platformSupportsSOS");
}

- (unint64_t)combinedCachedCircleStatus:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t Nanoseconds;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  os_signpost_id_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _CDPSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _CDPSignpostCreate(v5);
  v8 = v7;

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CachedCircleStatus", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = v6;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CachedCircleStatus  enableTelemetry=YES ", (uint8_t *)&v18, 0xCu);
  }

  v12 = -[CDPCircleProxyImpl cachedCliqueStatus:](self, "cachedCliqueStatus:", a3);
  if (!+[CDPUtilities deferSOSFromSignIn](CDPUtilities, "deferSOSFromSignIn") && v12 == 1)
  {
    if (-[CDPCircleProxyImpl platformSupportsSOS](self, "platformSupportsSOS"))
      v12 = -[CDPCircleProxyImpl cdpStatusFromSOS:](self, "cdpStatusFromSOS:", -[CDPCircleProxyImpl cachedSOSCircleStatus:](self, "cachedSOSCircleStatus:", a3));
    else
      v12 = 1;
  }
  Nanoseconds = _CDPSignpostGetNanoseconds(v6, v8);
  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v18 = 67240192;
    LODWORD(v19) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v15, OS_SIGNPOST_INTERVAL_END, v6, "CachedCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 8u);
  }

  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134218496;
    v19 = v6;
    v20 = 2048;
    v21 = (double)Nanoseconds / 1000000000.0;
    v22 = 1026;
    v23 = v12;
    _os_log_impl(&dword_20D7E6000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CachedCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 0x1Cu);
  }

  return v12;
}

- (int)cachedSOSCircleStatus:(id *)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v9[2];
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[CDPContext isBeneficiaryAccount](self->_cdpContext, "isBeneficiaryAccount"))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Beneficiary account detected. Faking cached SOS circle status.\", (uint8_t *)v9, 2u);
    }

    return 0;
  }
  else
  {
    v9[0] = 0;
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Checking circle status with SOSCCThisDeviceIsInCircle\", buf, 2u);
    }

    v5 = SOSCCThisDeviceIsInCircle();
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v5;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Call to SOSCCThisDeviceIsInCircle returned a status: %d\", buf, 8u);
    }

    if (a3)
      *a3 = v9[0];
  }
  return v5;
}

- (unint64_t)combinedCircleStatus:(id *)a3
{
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking combined circle status\", buf, 2u);
  }

  v6 = -[CDPCircleProxyImpl _authenticatedCliqueStatus:](self, "_authenticatedCliqueStatus:", a3);
  if (+[CDPUtilities deferSOSFromSignIn](CDPUtilities, "deferSOSFromSignIn")
    || v6
    || !-[CDPCircleProxyImpl platformSupportsSOS](self, "platformSupportsSOS"))
  {
    return -[CDPCircleProxyImpl cdpStatusFromOT:](self, "cdpStatusFromOT:", v6);
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Checking SOS status.\", v9, 2u);
  }

  return -[CDPCircleProxyImpl cdpStatusFromSOS:](self, "cdpStatusFromSOS:", -[CDPCircleProxyImpl _sos_circleStatus:](self, "_sos_circleStatus:", a3));
}

- (void)waitForUpdate
{
  NSObject *v3;
  OTClique *clique;
  int v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint8_t buf[4];
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v13 = "-[CDPCircleProxyImpl waitForUpdate]";
    *(_WORD *)&v13[8] = 1024;
    *(_DWORD *)&v13[10] = 147;
    _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", buf, 0x12u);
  }

  if (-[CDPContext isiCDPEligible](self->_cdpContext, "isiCDPEligible"))
  {
    clique = self->_clique;
    v11 = 0;
    v5 = -[OTClique waitForOctagonUpgrade:](clique, "waitForOctagonUpgrade:", &v11);
    v6 = v11;
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v13 = v5;
    *(_WORD *)&v13[4] = 2114;
    *(_QWORD *)&v13[6] = v6;
    v8 = "\"Clique waitForOctagonUpgrade %{BOOL}d with error %{public}@\";
    v9 = v7;
    v10 = 18;
LABEL_8:
    _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_9;
  }
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPContext altDSID](self->_cdpContext, "altDSID");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    *(_QWORD *)v13 = 1752392040;
    *(_WORD *)&v13[8] = 2112;
    *(_QWORD *)&v13[10] = v7;
    v8 = "\"Account for %{mask.hash}@ is not eligible for iCDP, not calling waitForOctagonUpgrade\";
    v9 = v6;
    v10 = 22;
    goto LABEL_8;
  }
LABEL_10:

}

- (void)reportSuccess
{
  NSObject *v3;
  OTClique *clique;
  OTClique *v5;
  void *v6;
  int v7;
  OTClique *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clique = self->_clique;
    v7 = 138412290;
    v8 = clique;
    _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, "\"Reporting success for %@\", (uint8_t *)&v7, 0xCu);
  }

  v5 = self->_clique;
  -[CDPCircleProxyImpl contextType](self, "contextType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique performedSuccessfulCDPStateMachineRun:reply:](v5, "performedSuccessfulCDPStateMachineRun:reply:", v6, &__block_literal_global);

}

- (void)reportFailure:(id)a3
{
  id v4;
  NSObject *v5;
  OTClique *clique;
  OTClique *v7;
  void *v8;
  int v9;
  OTClique *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clique = self->_clique;
    v9 = 138412290;
    v10 = clique;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Reporting failure for %@\", (uint8_t *)&v9, 0xCu);
  }

  v7 = self->_clique;
  -[CDPCircleProxyImpl contextType](self, "contextType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique performedFailureCDPStateMachineRun:error:reply:](v7, "performedFailureCDPStateMachineRun:error:reply:", v8, v4, &__block_literal_global_26);

}

- (id)contextType
{
  int64_t v2;
  id *v3;

  v2 = -[CDPContext type](self->_cdpContext, "type");
  if ((unint64_t)(v2 - 1) > 6)
    v3 = (id *)MEMORY[0x24BDE8500];
  else
    v3 = (id *)qword_24C7C0FA0[v2 - 1];
  return *v3;
}

- (unint64_t)cdpStatusFromSOS:(int)a3
{
  if ((a3 + 1) > 4)
    return 0;
  else
    return qword_20D830F00[a3 + 1];
}

- (unint64_t)cdpStatusFromOT:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5)
    return 0;
  else
    return qword_20D830F28[a3 + 1];
}

- (int64_t)cliqueStatus:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  OTClique *clique;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  unint64_t Nanoseconds;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  _CDPSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _CDPSignpostCreate(v5);
  v8 = v7;

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CircleStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = v6;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CircleStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  clique = self->_clique;
  if (clique)
  {
    v13 = clique;
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = (os_signpost_id_t)v13;
      _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "\"Checking clique status with fetchCliqueStatus from %@\", buf, 0xCu);
    }

    v25 = 0;
    v15 = -[NSObject fetchCliqueStatus:](v13, "fetchCliqueStatus:", &v25);
    v16 = v25;
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CDPCircleProxyImpl cliqueStatus:].cold.2();
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEFAULT, "\"Call to fetchCliqueStatus returned a status: %@\", buf, 0xCu);

    }
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    Nanoseconds = _CDPSignpostGetNanoseconds(v6, v8);
    _CDPSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v27) = v15;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v22, OS_SIGNPOST_INTERVAL_END, v6, "CircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", buf, 8u);
    }

    _CDPSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v27 = v6;
      v28 = 2048;
      v29 = (double)Nanoseconds / 1000000000.0;
      v30 = 1026;
      v31 = v15;
      _os_log_impl(&dword_20D7E6000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", buf, 0x1Cu);
    }

  }
  else
  {
    v32 = *MEMORY[0x24BDD0FC8];
    v33[0] = CFSTR("CDPContext was missing DSID when CircleProxyImpl was initialized. Its OTClique was not created.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
      v15 = -1;
      goto LABEL_27;
    }
    _CDPStateError(-5003, (uint64_t)v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl cachedCliqueStatus:].cold.1();
    v15 = -1;
  }

LABEL_27:
  return v15;
}

- (int64_t)_authenticatedCliqueStatus:(id *)a3
{
  int64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v4 = -[CDPCircleProxyImpl cliqueStatus:](self, "cliqueStatus:", &v9);
  v5 = v9;
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Got authenticated clique status %lu with error: %@\", buf, 0x16u);
  }

  return v4;
}

- (int)_sos_authenticatedCircleStatus:(id *)a3
{
  int v5;
  id v6;
  id v8;
  id v10;
  id v11;

  v11 = 0;
  v5 = -[CDPCircleProxyImpl _sos_circleStatus:](self, "_sos_circleStatus:", &v11);
  v6 = v11;
  if ((v5 + 1) <= 4 && ((1 << (v5 + 1)) & 0x15) != 0)
  {
    if (!-[CDPCircleProxyImpl tryRegisteringCredentials](self, "tryRegisteringCredentials"))
      -[CDPCircleProxyImpl registerCredentials](self, "registerCredentials");
    v10 = v6;
    v5 = -[CDPCircleProxyImpl _sos_circleStatus:](self, "_sos_circleStatus:", &v10);
    v8 = v10;

    v6 = v8;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (int)_sos_circleStatus:(id *)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  int v18;
  os_signpost_id_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[CDPContext isBeneficiaryAccount](self->_cdpContext, "isBeneficiaryAccount"))
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Beneficiary account detected. Faking non-cached SOS circle status.\", (uint8_t *)&v18, 2u);
    }
    v6 = 0;
  }
  else
  {
    _CDPSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _CDPSignpostCreate(v7);
    v10 = v9;

    _CDPSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SOSCircleStatus", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
    }

    _CDPSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v8;
      _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCircleStatus  enableTelemetry=YES ", (uint8_t *)&v18, 0xCu);
    }

    v6 = -[CDPCircleProxyImpl nonCachedSOSCircleStatus:](self, "nonCachedSOSCircleStatus:", a3);
    Nanoseconds = _CDPSignpostGetNanoseconds(v8, v10);
    _CDPSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = 67240192;
      LODWORD(v19) = v6;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v16, OS_SIGNPOST_INTERVAL_END, v8, "SOSCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 8u);
    }

    _CDPSignpostLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218496;
      v19 = v8;
      v20 = 2048;
      v21 = (double)Nanoseconds / 1000000000.0;
      v22 = 1026;
      v23 = v6;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 0x1Cu);
    }
  }

  return v6;
}

- (int)nonCachedSOSCircleStatus:(id *)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Checking circle status with SOSCCThisDeviceIsInCircle\", buf, 2u);
  }

  v5 = SOSCCThisDeviceIsInCircleNonCached();
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v5;
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Call to SOSCCThisDeviceIsInCircle returned a status: %d\", buf, 8u);
  }

  if (a3)
    *a3 = 0;
  return v5;
}

- (id)peerId
{
  return (id)-[OTClique cliqueMemberIdentifier](self->_clique, "cliqueMemberIdentifier");
}

- (id)peerDeviceNamesByPeerID
{
  OTClique *clique;
  uint64_t v4;

  clique = self->_clique;
  v4 = 0;
  -[OTClique peerDeviceNamesByPeerID:](clique, "peerDeviceNamesByPeerID:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)SecRKCreateRecoveryKeyString();
}

- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4
{
  return (id)SecRKCopyAccountRecoveryVerifier();
}

- (BOOL)waitForInitialSync:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Calling waitForPriorityViewKeychainDataRecovery\", v13, 2u);
  }

  v6 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPCircleProxyImpl cdpContext](self, "cdpContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsEventWithContext:eventName:category:", v7, CFSTR("com.apple.corecdp.waitForPriorityViewKeychainDataRecovery"), 0x24C7D2420);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[OTClique waitForPriorityViewKeychainDataRecovery:](self->_clique, "waitForPriorityViewKeychainDataRecovery:", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDFC328]);

  if (a3)
    objc_msgSend(v8, "populateUnderlyingErrorsStartingWithRootError:", *a3);
  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", v8);

  return v9;
}

- (BOOL)synchronizeCircleViews
{
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  _BYTE v24[18];
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  _CDPSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = _CDPSignpostCreate(v3);
  v6 = v5;

  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SynchronizeCircleViews", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v24 = v4;
    _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SynchronizeCircleViews  enableTelemetry=YES ", buf, 0xCu);
  }

  if (-[CDPCircleProxyImpl combinedCircleStatus:](self, "combinedCircleStatus:", 0) == 1)
  {
    v22 = 0;
    v10 = -[CDPCircleProxyImpl waitForInitialSync:](self, "waitForInitialSync:", &v22);
    v11 = v22;
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v24 = v10;
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = v11;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Finished calling SOSCCWaitForInitialSync didSync=%i error=%@\", buf, 0x12u);
    }

    if (!v10)
    {
      v21 = 0;
      v13 = -[CDPCircleProxyImpl removeThisDeviceFromCircle:](self, "removeThisDeviceFromCircle:", &v21);
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[CDPCircleProxyImpl synchronizeCircleViews].cold.1();
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[CDPCircleProxyImpl synchronizeCircleViews].cold.2();
      }

    }
  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"Skipping initial sync because we are not in a circle\", buf, 2u);
    }
    v10 = 1;
  }

  Nanoseconds = _CDPSignpostGetNanoseconds(v4, v6);
  _CDPSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v24 = v10;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v18, OS_SIGNPOST_INTERVAL_END, v4, "SynchronizeCircleViews", " didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v24 = v4;
    *(_WORD *)&v24[8] = 2048;
    *(double *)&v24[10] = (double)Nanoseconds / 1000000000.0;
    v25 = 1026;
    v26 = v10;
    _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SynchronizeCircleViews  didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 0x1Cu);
  }

  return v10;
}

- (BOOL)removeThisDeviceFromCircle:(id *)a3
{
  NSObject *v5;
  OTClique *clique;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  id v13;
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting to remove self from circle\", buf, 2u);
  }

  clique = self->_clique;
  v13 = 0;
  v7 = -[OTClique leaveClique:](clique, "leaveClique:", &v13);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"Removed device from circle successfully\", v12, 2u);
    }
  }
  else
  {
    *a3 = objc_retainAutorelease(v8);
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl removeThisDeviceFromCircle:].cold.1();
  }

  return v7;
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  NSObject *v5;

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPCircleProxyImpl requestToJoinCircle:].cold.1();

  return -[OTClique requestToJoinCircle:](self->_clique, "requestToJoinCircle:", a3);
}

- (BOOL)requestToJoinCircleAfterRestore:(id *)a3
{
  NSObject *v5;

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPCircleProxyImpl requestToJoinCircleAfterRestore:].cold.1();

  return -[OTClique joinAfterRestore:](self->_clique, "joinAfterRestore:", a3);
}

- (id)requestToResetProtectedData:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  -[CDPContext cliqueConfiguration](self->_cdpContext, "cliqueConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext passwordEquivToken](self->_cdpContext, "passwordEquivToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasswordEquivalentToken:", v6);

  -[CDPContext appleID](self->_cdpContext, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthenticationAppleID:", v7);

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDE84B0], "resetProtectedData:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = 0;
    if (a3 && v9)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v9);
    }
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  return -[OTClique fetchUserControllableViewsSyncingEnabled:](self->_clique, "fetchUserControllableViewsSyncingEnabled:", a3);
}

- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4
{
  id v6;
  OTClique *clique;
  void *v8;
  char v9;

  v6 = a3;
  if (MEMORY[0x212BA92A4]())
  {
    clique = self->_clique;
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[OTClique peersHaveViewsEnabled:error:](clique, "peersHaveViewsEnabled:error:", v8, a4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)hasNonViewAwarePeers
{
  OTClique *clique;
  void *v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  id v8;

  clique = self->_clique;
  v8 = 0;
  v3 = (void *)-[OTClique copyViewUnawarePeerInfo:](clique, "copyViewUnawarePeerInfo:", &v8);
  v4 = v8;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl hasNonViewAwarePeers].cold.1();

  }
  v6 = objc_msgSend(v3, "count") != 0;

  return v6;
}

- (BOOL)removeNonViewAwarePeers:(id *)a3
{
  OTClique *clique;
  void *v6;
  id v7;
  void *v8;
  OTClique *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  id v16;

  -[CDPCircleProxyImpl registerCredentials](self, "registerCredentials");
  clique = self->_clique;
  v16 = 0;
  v6 = (void *)-[OTClique copyViewUnawarePeerInfo:](clique, "copyViewUnawarePeerInfo:", &v16);
  v7 = v16;
  v8 = v7;
  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (v6)
  {
    v9 = self->_clique;
    v15 = 0;
    v10 = -[OTClique removeFriendsInClique:error:](v9, "removeFriendsInClique:error:", v6, &v15);
    v11 = v15;
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CDPCircleProxyImpl removeNonViewAwarePeers:].cold.2();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[CDPCircleProxyImpl removeNonViewAwarePeers:].cold.3();
    }

    if (a3)
    {
      v11 = objc_retainAutorelease(v11);
      *a3 = v11;
    }
  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPCircleProxyImpl removeNonViewAwarePeers:].cold.1();
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isLastBackupMakingPeer:(id *)a3
{
  return 0;
}

- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4
{
  return -[OTClique setUserControllableViewsSyncStatus:error:](self->_clique, "setUserControllableViewsSyncStatus:error:", a3, a4);
}

- (BOOL)registerCredentialsIfMissing
{
  return -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:](self, "_registerCredentialsOnlyIfNeeded:", 1);
}

- (BOOL)registerCredentials
{
  return -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:](self, "_registerCredentialsOnlyIfNeeded:", 0);
}

- (BOOL)_registerCredentialsOnlyIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  CDPContext *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  OTClique *clique;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  unint64_t Nanoseconds;
  NSObject *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  int v42;
  id v43[2];
  _BYTE buf[12];
  __int16 v45;
  double v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x24BDAC8D0];
  v5 = self->_cdpContext;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPContext appleID](v5, "appleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext dsid](v5, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141559042;
    *(_QWORD *)&buf[4] = 1752392040;
    v45 = 2112;
    v46 = *(double *)&v7;
    v47 = 2160;
    v48 = 1752392040;
    v49 = 2112;
    v50 = v8;
    v51 = 2048;
    v52 = -[CDPContext type](v5, "type");
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"_registerCredentialsOnlyIfNeeded: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld\", buf, 0x34u);

  }
  -[CDPContext appleID](v5, "appleID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_11;
  v10 = (void *)v9;
  -[CDPContext password](v5, "password");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

LABEL_11:
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:].cold.1();
    goto LABEL_13;
  }
  v12 = (void *)v11;
  -[CDPContext dsid](v5, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_11;
  if (v3 && -[CDPCircleProxyImpl canAuthenticate](self, "canAuthenticate"))
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "\"Security indicated that no credential is needed nor did we force\", buf, 2u);
    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v17, OS_LOG_TYPE_DEFAULT, "\"Calling Clique setUserCredentialsAndDSID\", buf, 2u);
  }

  -[CDPContext password](v5, "password");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = _CDPSignpostCreate(v20);
  v23 = v22;

  _CDPSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SetUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_20D7E6000, v26, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  v43[1] = 0;
  if (+[CDPUtilities deferSOSFromSignIn](CDPUtilities, "deferSOSFromSignIn")
    && SOSCCFetchCompatibilityMode())
  {
    _CDPLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v27, OS_LOG_TYPE_DEFAULT, "\"Calling SOSCCSetUserCredentialsAndDSID\", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    -[CDPContext appleID](v5, "appleID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext dsid](v5, "dsid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v15 = SOSCCSetUserCredentialsAndDSID();

    if ((v15 & 1) == 0)
    {
      _CDPLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:].cold.2();

    }
    v14 = 0;
  }
  else
  {
    clique = self->_clique;
    -[CDPContext dsid](v5, "dsid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = 0;
    v34 = -[OTClique setUserCredentialsAndDSID:password:error:](clique, "setUserCredentialsAndDSID:password:error:", v33, v19, v43);
    v14 = v43[0];

    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7E6000, v36, OS_LOG_TYPE_DEFAULT, "\"Credentials set through Clique setUserCredentialsAndDSID\", buf, 2u);
      }

      v15 = 1;
    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:].cold.3();

      v15 = 0;
    }
  }
  Nanoseconds = _CDPSignpostGetNanoseconds(v21, v23);
  _CDPSignpostLogSystem();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    v40 = -[NSObject code](v14, "code");
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v40;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v39, OS_SIGNPOST_INTERVAL_END, v21, "SetUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = -[NSObject code](v14, "code");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v21;
    v45 = 2048;
    v46 = (double)Nanoseconds / 1000000000.0;
    v47 = 1026;
    LODWORD(v48) = v42;
    _os_log_impl(&dword_20D7E6000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

LABEL_14:
  return v15;
}

- (BOOL)tryRegisteringCredentials
{
  CDPContext *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  OTClique *clique;
  int v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t Nanoseconds;
  NSObject *v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  int v35;
  id v37;
  uint8_t v38[8];
  uint64_t v39;
  _BYTE buf[12];
  __int16 v41;
  double v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = self->_cdpContext;
  -[CDPContext appleID](v3, "appleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CDPContext dsid](v3, "dsid");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[CDPContext password](v3, "password");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[CDPContext password](v3, "password");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataUsingEncoding:", 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CDPContext dsid](v3, "dsid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _CDPSignpostLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = _CDPSignpostCreate(v13);
        v16 = v15;

        _CDPSignpostLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_20D7E6000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
        }

        _CDPSignpostLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
        }

        v39 = 0;
        if (+[CDPUtilities deferSOSFromSignIn](CDPUtilities, "deferSOSFromSignIn")
          && SOSCCFetchCompatibilityMode())
        {
          *(_QWORD *)buf = 0;
          -[CDPContext appleID](v3, "appleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDPContext dsid](v3, "dsid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringValue");
          v22 = SOSCCTryUserCredentialsAndDSID();

          _CDPLogSystem();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if ((v22 & 1) != 0)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v38 = 0;
              _os_log_impl(&dword_20D7E6000, v24, OS_LOG_TYPE_DEFAULT, "\"Registered credentials through try attempt\", v38, 2u);
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            -[CDPCircleProxyImpl tryRegisteringCredentials].cold.2();
          }

          v25 = 0;
        }
        else
        {
          clique = self->_clique;
          v37 = 0;
          v27 = -[OTClique tryUserCredentialsAndDSID:password:error:](clique, "tryUserCredentialsAndDSID:password:error:", v12, v10, &v37);
          v25 = v37;
          _CDPLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D7E6000, v29, OS_LOG_TYPE_DEFAULT, "\"Registered credentials through OT tryUserCredentialsAndDSID\", buf, 2u);
            }

            v22 = 1;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CDPCircleProxyImpl tryRegisteringCredentials].cold.3();

            v22 = 0;
          }
        }
        Nanoseconds = _CDPSignpostGetNanoseconds(v14, v16);
        _CDPSignpostLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          v33 = -[NSObject code](v25, "code");
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v33;
          _os_signpost_emit_with_name_impl(&dword_20D7E6000, v32, OS_SIGNPOST_INTERVAL_END, v14, "TryUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
        }

        _CDPSignpostLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = -[NSObject code](v25, "code");
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)&buf[4] = v14;
          v41 = 2048;
          v42 = (double)Nanoseconds / 1000000000.0;
          v43 = 1026;
          v44 = v35;
          _os_log_impl(&dword_20D7E6000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
        }

        goto LABEL_34;
      }
    }
    else
    {

    }
  }
  _CDPLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[CDPCircleProxyImpl tryRegisteringCredentials].cold.1();
  v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)canAuthenticate
{
  char v2;
  NSObject *v3;

  v2 = -[OTClique accountUserKeyAvailable](self->_clique, "accountUserKeyAvailable");
  if ((v2 & 1) == 0)
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl canAuthenticate].cold.1();

  }
  return v2;
}

- (id)pairingChannelInitiator
{
  OTClique *clique;
  void *v3;
  void *v4;

  clique = self->_clique;
  -[CDPCircleProxyImpl _pairingChannelContext](self, "_pairingChannelContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique setupPairingChannelAsInitiator:](clique, "setupPairingChannelAsInitiator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pairingChannelAcceptor
{
  OTClique *clique;
  void *v3;
  void *v4;

  clique = self->_clique;
  -[CDPCircleProxyImpl _pairingChannelContext](self, "_pairingChannelContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique setupPairingChannelAsAcceptor:](clique, "setupPairingChannelAsAcceptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pairingChannelContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BE5E6D8]);
  +[CDPLocalDevice sharedInstance](CDPLocalDevice, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModel:", v5);

  +[CDPLocalDevice sharedInstance](CDPLocalDevice, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModelVersion:", v7);

  +[CDPLocalDevice sharedInstance](CDPLocalDevice, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModelClass:", v9);

  +[CDPLocalDevice sharedInstance](CDPLocalDevice, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "osVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOsVersion:", v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFlowID:", v12);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceSessionID:", v13);

  }
  return v3;
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[8];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPCircleProxyImpl cdpContext](self, "cdpContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsEventWithContext:eventName:category:", v9, CFSTR("com.apple.corecdp.custodianRecovery"), 0x24C7D2420);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "recordBuildVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("recordBuildVersion"));

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __66__CDPCircleProxyImpl_recoverOctagonUsingCustodianInfo_completion___block_invoke;
  v21[3] = &unk_24C7C0F80;
  v12 = v10;
  v22 = v12;
  v13 = v7;
  v23 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA9A30](v21);
  v20 = 0;
  -[CDPCircleProxyImpl _initializeRecoveryKeyWithInfo:error:](self, "_initializeRecoveryKeyWithInfo:error:", v6, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl recoverOctagonUsingCustodianInfo:completion:].cold.1();

    ((void (**)(_QWORD, id))v14)[2](v14, v16);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEFAULT, "\"Attempting to recover octagon usign custodian recovery key\", v19, 2u);
    }

    -[CDPCircleProxyImpl _recoverOctagonUsingRecoveryKey:completion:](self, "_recoverOctagonUsingRecoveryKey:completion:", v15, v14);
  }

}

void __66__CDPCircleProxyImpl_recoverOctagonUsingCustodianInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("didSucceed"));
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("didSucceed"));
  }
  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_recoverOctagonUsingRecoveryKey:(id)a3 completion:(id)a4
{
  void *v5;
  CDPContext *cdpContext;
  id v7;
  id v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDE84B0];
  cdpContext = self->_cdpContext;
  v7 = a4;
  v8 = a3;
  -[CDPContext cliqueConfiguration](cdpContext, "cliqueConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverOctagonUsingCustodianRecoveryKey:custodianRecoveryKey:reply:", v9, v8, v7);

}

- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPCircleProxyImpl _initializeRecoveryKeyWithInfo:error:].cold.1(v5, v6);

  v7 = objc_alloc(MEMORY[0x24BE6E0F0]);
  objc_msgSend(v5, "wrappedRKC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wrappingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "custodianUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithWrappedKey:wrappingKey:uuid:error:", v8, v9, v10, a4);

  return v11;
}

- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4
{
  return objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySet:error:", a3, a4);
}

+ (unint64_t)syncingStatusForAltDSID:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  CDPCircleProxyImpl *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[CDPCircleProxyImpl syncingStatusForAltDSID:].cold.2((uint64_t)v3, v4, v5);

  +[CDPContext contextForAccountWithAltDSID:](CDPContext, "contextForAccountWithAltDSID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPCircleProxyImpl initWithContext:]([CDPCircleProxyImpl alloc], "initWithContext:", v6);
  v12 = 0;
  v8 = -[CDPCircleProxyImpl combinedCircleStatus:](v7, "combinedCircleStatus:", &v12);
  v9 = v12;
  if (v9)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CDPCircleProxyImpl syncingStatusForAltDSID:].cold.1();

  }
  return v8;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)initWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CircleProxyImpl init is missing required cliqueConfiguration. Problems lie ahead …\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithContext:clique:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CircleProxyImpl init is missing required dsid. Barring no primary account, problems lie ahead …\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cachedCliqueStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Circle status check failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)cachedCliqueStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to retrieve cachedCliqueStatus: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)cachedSOSCircleStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to check circle status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)cliqueStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to check circle status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)synchronizeCircleViews
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"We failed to sync and now we failed to remove self form circle, nothing good will happen here\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeThisDeviceFromCircle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to remove self from circle - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)requestToJoinCircle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Requesting to join circle with OT requestToJoinCircle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)requestToJoinCircleAfterRestore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Requesting to join circle with OT joinAfterRestore\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)hasNonViewAwarePeers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to check for non-view-aware peers with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_1(&dword_20D7E6000, v0, v1, "\"Failed to check for non-view-aware peers before removing them from circle with error %@\", v2);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_1(&dword_20D7E6000, v0, v1, "\"Removed old peers from circle: %@\", v2);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v1, (uint64_t)v1, "\"Failed to remove old peers from circle with error %@ (peers: %@)\", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Skipping registering credentials, insufficient parameters\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to call SOSCCSetUserCredentialsAndDSID with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed Clique setUserCredentialsAndDSID with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)tryRegisteringCredentials
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed OT tryUserCredentialsAndDSID with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)canAuthenticate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"Security requires credentials...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)recoverOctagonUsingCustodianInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to obtain custodian recovery key from security with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_initializeRecoveryKeyWithInfo:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "custodianUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_1(&dword_20D7E6000, a2, v4, "\"Obtaining recovery key from security for custodian recovery with UUID: %@\", v5);

}

+ (void)syncingStatusForAltDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"CDPDFollowUpController: Error fetching OT Status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)syncingStatusForAltDSID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 141558274;
  v4 = 1752392040;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_6(&dword_20D7E6000, a2, a3, "\"CDPCircleProxyImpl: fetching OT Status for altDSID: %{mask.hash}@\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end

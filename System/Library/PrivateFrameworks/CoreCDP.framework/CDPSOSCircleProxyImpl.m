@implementation CDPSOSCircleProxyImpl

- (CDPSOSCircleProxyImpl)initWithContext:(id)a3
{
  id v5;
  void *v6;
  CDPSOSCircleProxyImpl *v7;
  CDPSOSCircleProxyImpl *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CDPSOSCircleProxyImpl *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)CDPSOSCircleProxyImpl;
    v7 = -[CDPSOSCircleProxyImpl init](&v16, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_cdpContext, a3);
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "appleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dsid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "type");
      *(_DWORD *)buf = 141559042;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v10;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v11;
      v25 = 2048;
      v26 = v12;
      _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "\"CDPSOSCircleProxyImpl: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld\", buf, 0x34u);

    }
    self = v8;
    v13 = self;
  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[CDPSOSCircleProxyImpl initWithContext:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (unint64_t)cdpStatusFromSOS:(int)a3
{
  if ((a3 + 1) > 4)
    return 0;
  else
    return qword_20D830F98[a3 + 1];
}

- (void)waitForUpdate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"This is probably a no op here...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (unint64_t)combinedCircleStatus:(id *)a3
{
  return -[CDPSOSCircleProxyImpl cdpStatusFromSOS:](self, "cdpStatusFromSOS:", -[CDPSOSCircleProxyImpl _authenticatedCircleStatus:](self, "_authenticatedCircleStatus:", a3));
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

- (unint64_t)combinedCachedCircleStatus:(id *)a3
{
  return -[CDPSOSCircleProxyImpl cdpStatusFromSOS:](self, "cdpStatusFromSOS:", -[CDPSOSCircleProxyImpl cachedSOSCircleStatus:](self, "cachedSOSCircleStatus:", a3));
}

- (int)_circleStatus:(id *)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  os_signpost_id_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[CDPContext isBeneficiaryAccount](self->_cdpContext, "isBeneficiaryAccount"))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Beneficiary account detected. Faking non-cached SOS circle status.\", buf, 2u);
    }

    return 0;
  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Checking circle status with SOSCCThisDeviceIsInCircle\", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _CDPSignpostCreate(v7);
    v10 = v9;

    _CDPSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SOSCircleStatus", " enableTelemetry=YES ", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v8;
      _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCircleStatus  enableTelemetry=YES ", buf, 0xCu);
    }

    v5 = SOSCCThisDeviceIsInCircleNonCached();
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v5;
      _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "\"Call to SOSCCThisDeviceIsInCircle returned a status: %d\", buf, 8u);
    }

    if (a3)
      *a3 = 0;
    Nanoseconds = _CDPSignpostGetNanoseconds(v8, v10);
    _CDPSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v21) = v5;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v17, OS_SIGNPOST_INTERVAL_END, v8, "SOSCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", buf, 8u);
    }

    _CDPSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v21 = v8;
      v22 = 2048;
      v23 = (double)Nanoseconds / 1000000000.0;
      v24 = 1026;
      v25 = v5;
      _os_log_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", buf, 0x1Cu);
    }

  }
  return v5;
}

- (int)_authenticatedCircleStatus:(id *)a3
{
  int v5;
  id v6;
  id v8;
  id v10;
  id v11;

  v11 = 0;
  v5 = -[CDPSOSCircleProxyImpl _circleStatus:](self, "_circleStatus:", &v11);
  v6 = v11;
  if ((v5 + 1) <= 4 && ((1 << (v5 + 1)) & 0x15) != 0)
  {
    if (!-[CDPSOSCircleProxyImpl tryRegisteringCredentials](self, "tryRegisteringCredentials"))
      -[CDPSOSCircleProxyImpl registerCredentials](self, "registerCredentials");
    v10 = v6;
    v5 = -[CDPSOSCircleProxyImpl _circleStatus:](self, "_circleStatus:", &v10);
    v8 = v10;

    v6 = v8;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (id)peerId
{
  uint64_t v2;
  const void *v3;
  void *v4;
  NSObject *v5;

  v2 = SOSCCCopyMyPeerInfo();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend((id)SOSPeerInfoGetPeerID(), "copy");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPSOSCircleProxyImpl peerId].cold.1();

    CFRelease(0);
  }
  return v4;
}

- (unint64_t)peerCount
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;

  v2 = (const __CFArray *)SOSCCCopyPeerPeerInfo();
  if (!v2)
    return 0;
  v3 = v2;
  Count = CFArrayGetCount(v2);
  CFRelease(v3);
  return Count;
}

- (id)peerDeviceNamesByPeerID
{
  void *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFArray *)SOSCCCopyPeerPeerInfo();
  if (v3)
  {
    v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      v5 = 0;
      do
      {
        CFArrayGetValueAtIndex(v4, v5);
        SOSPeerInfoGetPeerName();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        SOSPeerInfoGetPeerID();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v2, "setObject:forKey:", v8, v7);

        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }
  return v2;
}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)SecRKCreateRecoveryKeyString();
}

- (id)generateVerifierWithRcoveryKey:(id)a3 error:(id *)a4
{
  return (id)SecRKCopyAccountRecoveryVerifier();
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
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  _BYTE v26[18];
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
    *(_QWORD *)v26 = v4;
    _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SynchronizeCircleViews  enableTelemetry=YES ", buf, 0xCu);
  }

  v10 = -[CDPSOSCircleProxyImpl combinedCircleStatus:](self, "combinedCircleStatus:", 0);
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Calling SOSCCWaitForInitialSync to wait for views to sync\", buf, 2u);
    }

    v24 = 0;
    v13 = -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_14, &v24);
    v12 = v24;
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v26 = v13;
      *(_WORD *)&v26[4] = 2112;
      *(_QWORD *)&v26[6] = v12;
      _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "\"Finished calling SOSCCWaitForInitialSync didSync=%i error=%@\", buf, 0x12u);
    }

    if (!v13)
    {
      v23 = 0;
      v15 = -[CDPSOSCircleProxyImpl removeThisDeviceFromCircle:](self, "removeThisDeviceFromCircle:", &v23);
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[CDPSOSCircleProxyImpl synchronizeCircleViews].cold.1();
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[CDPCircleProxyImpl synchronizeCircleViews].cold.2();
      }

    }
    Nanoseconds = _CDPSignpostGetNanoseconds(v4, v6);
    _CDPSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v26 = v13;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v20, OS_SIGNPOST_INTERVAL_END, v4, "SynchronizeCircleViews", " didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 8u);
    }

    _CDPSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v26 = v4;
      *(_WORD *)&v26[8] = 2048;
      *(double *)&v26[10] = (double)Nanoseconds / 1000000000.0;
      v27 = 1026;
      v28 = v13;
      _os_log_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SynchronizeCircleViews  didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 0x1Cu);
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPSOSCircleProxyImpl synchronizeCircleViews].cold.3();
    LOBYTE(v13) = 1;
  }

  return v13;
}

uint64_t __47__CDPSOSCircleProxyImpl_synchronizeCircleViews__block_invoke()
{
  return SOSCCWaitForInitialSync();
}

- (BOOL)removeThisDeviceFromCircle:(id *)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting to remove self from circle\", buf, 2u);
  }

  v6 = -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_12, a3);
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Removed device from circle successfully\", v10, 2u);
    }
LABEL_11:

    return v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CDPSOSCircleProxyImpl removeThisDeviceFromCircle:].cold.2();

  if (a3)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl removeThisDeviceFromCircle:].cold.1();
    goto LABEL_11;
  }
  return v6;
}

uint64_t __52__CDPSOSCircleProxyImpl_removeThisDeviceFromCircle___block_invoke()
{
  return SOSCCRemoveThisDeviceFromCircle();
}

- (BOOL)resetToOffering:(id *)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting to reset to offering\", buf, 2u);
  }

  v6 = -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_13, a3);
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Reset to offering succeeded.\", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[CDPSOSCircleProxyImpl resetToOffering:].cold.1();
  }

  return v6;
}

uint64_t __41__CDPSOSCircleProxyImpl_resetToOffering___block_invoke()
{
  return SOSCCResetToOffering();
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  return -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_14, a3);
}

uint64_t __45__CDPSOSCircleProxyImpl_requestToJoinCircle___block_invoke()
{
  return SOSCCRequestToJoinCircle();
}

- (BOOL)requestToJoinCircleAfterRestore:(id *)a3
{
  return -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_15, a3);
}

uint64_t __57__CDPSOSCircleProxyImpl_requestToJoinCircleAfterRestore___block_invoke()
{
  return SOSCCRequestToJoinCircleAfterRestore();
}

- (BOOL)requestToResetCircle:(id *)a3
{
  return -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", &__block_literal_global_16, a3);
}

uint64_t __46__CDPSOSCircleProxyImpl_requestToResetCircle___block_invoke()
{
  return SOSCCResetToEmpty();
}

- (BOOL)requestToResetCloudKitDataForReason:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t *v11;
  id v12;
  NSObject *v13;
  char v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint8_t buf[8];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v5 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDE8458], "controlObject:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v6)
  {
    v8 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__CDPSOSCircleProxyImpl_requestToResetCloudKitDataForReason_error___block_invoke;
    v16[3] = &unk_24C7C2020;
    v18 = &v22;
    v19 = &v28;
    v9 = v8;
    v17 = v9;
    objc_msgSend(v6, "rpcResetCloudKit:reason:reply:", 0, v5, v16);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"CKKS control unavailable\", buf, 2u);
    }

    v11 = v23;
    v12 = v7;
    v9 = v11[5];
    v11[5] = (uint64_t)v12;
  }

  if (v23[5])
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPSOSCircleProxyImpl requestToResetCloudKitDataForReason:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v23[5]);
  }
  v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __67__CDPSOSCircleProxyImpl_requestToResetCloudKitDataForReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Cloud data reset!\", v6, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)viewMemberForPCSMaster:(id *)a3
{
  return -[CDPSOSCircleProxyImpl _viewMemberForView:error:](self, "_viewMemberForView:error:", *MEMORY[0x24BDE8F10], a3);
}

- (BOOL)viewMemberForAutofillPasswords:(id *)a3
{
  return -[CDPSOSCircleProxyImpl _viewMemberForView:error:](self, "_viewMemberForView:error:", *MEMORY[0x24BDE8F00], a3);
}

- (BOOL)_viewMemberForView:(__CFString *)a3 error:(id *)a4
{
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint8_t buf[4];
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = SOSCCView();
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 1)
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v14 = a3;
    *(_WORD *)&v14[8] = 2112;
    *(_QWORD *)&v14[10] = 0;
    v9 = "\"Calling SOSCCView for view %@ reported device is MEMBER - (error: %@)\";
    v10 = v7;
    v11 = 22;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v14 = v6;
    *(_WORD *)&v14[4] = 2112;
    *(_QWORD *)&v14[6] = a3;
    *(_WORD *)&v14[14] = 2112;
    *(_QWORD *)&v14[16] = 0;
    v9 = "\"Calling SOSCCView returned status %i for view %@ - (error: %@)\";
    v10 = v7;
    v11 = 28;
  }
  _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  if (a4)
    *a4 = 0;
  return v6 == 1;
}

- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__CDPSOSCircleProxyImpl_anyPeerHasEnabledViewsInSet_error___block_invoke;
  v9[3] = &unk_24C7C0D38;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[CDPSOSCircleProxyImpl _performSOSCBlock:error:](self, "_performSOSCBlock:error:", v9, a4);

  return (char)a4;
}

BOOL __59__CDPSOSCircleProxyImpl_anyPeerHasEnabledViewsInSet_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  return SOSCCPeersHaveViewsEnabled() == *MEMORY[0x24BDBD270];
}

- (BOOL)hasNonViewAwarePeers
{
  const __CFArray *v2;
  BOOL v3;

  v2 = (const __CFArray *)SOSCCCopyViewUnawarePeerInfo();
  if (!v2)
    return 0;
  v3 = CFArrayGetCount(v2) > 0;
  CFRelease(v2);
  return v3;
}

- (BOOL)removeNonViewAwarePeers:(id *)a3
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  -[CDPSOSCircleProxyImpl registerCredentials](self, "registerCredentials");
  v4 = SOSCCCopyViewUnawarePeerInfo();
  if (v4)
  {
    v5 = (const void *)v4;
    LODWORD(v6) = SOSCCRemovePeersFromCircle();

    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((_DWORD)v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CDPSOSCircleProxyImpl removeNonViewAwarePeers:].cold.2();
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[CDPSOSCircleProxyImpl removeNonViewAwarePeers:].cold.3();
    }

    CFRelease(v5);
    if (a3)
LABEL_12:
      *a3 = objc_retainAutorelease(0);
  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPSOSCircleProxyImpl removeNonViewAwarePeers:].cold.1();

    LOBYTE(v6) = 0;
    if (a3)
      goto LABEL_12;
  }

  return (char)v6;
}

- (BOOL)isLastBackupMakingPeer:(id *)a3
{
  return 0;
}

- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = _os_activity_create(&dword_20D7E6000, "cdp: Updating keychain views", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDE8F20], *MEMORY[0x24BDE8F00], *MEMORY[0x24BDE8F18], *MEMORY[0x24BDE8F08], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v8;
  }
  v11 = v10;
  v12 = -[CDPSOSCircleProxyImpl setViewsWithEnableSet:disableSet:](self, "setViewsWithEnableSet:disableSet:", v9, v10);
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 1024;
    v21 = v12;
    _os_log_debug_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEBUG, "\"Calling SOSCCViewSet with enable=%@ disable=%@ returned success=%i\", buf, 0x1Cu);
  }

  os_activity_scope_leave(&state);
  return v12;
}

- (BOOL)setViewsWithEnableSet:(id)a3 disableSet:(id)a4
{
  return SOSCCViewSet();
}

- (BOOL)_performSOSCBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, CFErrorRef *);
  char v7;
  const __CFString *v8;
  const __CFString *Domain;
  CFErrorRef err;

  v6 = (uint64_t (**)(id, CFErrorRef *))a3;
  err = 0;
  if ((v6[2](v6, &err) & 1) != 0)
  {
    v7 = 1;
  }
  else if (err
         && (v8 = (const __CFString *)*MEMORY[0x24BDE8EF8],
             Domain = CFErrorGetDomain(err),
             CFStringCompare(v8, Domain, 0) == kCFCompareEqualTo)
         && (CFErrorGetCode(err) == 1 || CFErrorGetCode(err) == 2)
         && -[CDPSOSCircleProxyImpl registerCredentials](self, "registerCredentials"))
  {
    CFRelease(err);
    err = 0;
    v7 = v6[2](v6, &err);
  }
  else
  {
    v7 = 0;
  }
  if (a4)
  {
    *a4 = err;
  }
  else if (err)
  {
    CFRelease(err);
  }

  return v7;
}

- (BOOL)registerCredentials
{
  return -[CDPSOSCircleProxyImpl _registerCredentialsOnlyIfNeeded:](self, "_registerCredentialsOnlyIfNeeded:", 0);
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
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  unint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  int v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
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
    v38 = 1752392040;
    v39 = 2112;
    v40 = *(double *)&v7;
    v41 = 2160;
    v42 = 1752392040;
    v43 = 2112;
    v44 = v8;
    v45 = 2048;
    v46 = -[CDPContext type](v5, "type");
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
      -[CDPSOSCircleProxyImpl _registerCredentialsOnlyIfNeeded:].cold.1();
    goto LABEL_13;
  }
  v12 = (void *)v11;
  -[CDPContext dsid](v5, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_11;
  if (v3 && -[CDPSOSCircleProxyImpl canAuthenticate](self, "canAuthenticate"))
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
    _os_log_impl(&dword_20D7E6000, v17, OS_LOG_TYPE_DEFAULT, "\"Calling SOSCCSetUserCredentialsAndDSID\", buf, 2u);
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
    v38 = v21;
    _os_log_impl(&dword_20D7E6000, v26, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPContext appleID](v5, "appleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext dsid](v5, "dsid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringValue");
  v15 = SOSCCSetUserCredentialsAndDSID();

  if ((v15 & 1) == 0)
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:].cold.2();

  }
  v30 = 0;
  Nanoseconds = _CDPSignpostGetNanoseconds(v21, v23);
  _CDPSignpostLogSystem();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    v34 = objc_msgSend(v30, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v38) = v34;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v33, OS_SIGNPOST_INTERVAL_END, v21, "SetUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = objc_msgSend(v30, "code");
    *(_DWORD *)buf = 134218496;
    v38 = v21;
    v39 = 2048;
    v40 = (double)Nanoseconds / 1000000000.0;
    v41 = 1026;
    LODWORD(v42) = v36;
    _os_log_impl(&dword_20D7E6000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

LABEL_14:
  return v15;
}

- (BOOL)tryRegisteringCredentials
{
  CDPContext *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  uint8_t buf[4];
  os_signpost_id_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = self->_cdpContext;
  -[CDPContext appleID](v2, "appleID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CDPContext dsid](v2, "dsid");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[CDPContext password](v2, "password");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CDPContext password](v2, "password");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dataUsingEncoding:", 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        _CDPSignpostLogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = _CDPSignpostCreate(v10);
        v13 = v12;

        _CDPSignpostLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_20D7E6000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
        }

        _CDPSignpostLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v32 = v11;
          _os_log_impl(&dword_20D7E6000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
        }

        -[CDPContext appleID](v2, "appleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPContext dsid](v2, "dsid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringValue");
        v19 = SOSCCTryUserCredentialsAndDSID();

        _CDPLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v19 & 1) != 0)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEFAULT, "\"Registered credentials through try attempt\", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          -[CDPCircleProxyImpl tryRegisteringCredentials].cold.2();
        }

        v23 = 0;
        Nanoseconds = _CDPSignpostGetNanoseconds(v11, v13);
        _CDPSignpostLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          v27 = objc_msgSend(v23, "code");
          *(_DWORD *)buf = 67240192;
          LODWORD(v32) = v27;
          _os_signpost_emit_with_name_impl(&dword_20D7E6000, v26, OS_SIGNPOST_INTERVAL_END, v11, "TryUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
        }

        _CDPSignpostLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(v23, "code");
          *(_DWORD *)buf = 134218496;
          v32 = v11;
          v33 = 2048;
          v34 = (double)Nanoseconds / 1000000000.0;
          v35 = 1026;
          v36 = v29;
          _os_log_impl(&dword_20D7E6000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
        }

        goto LABEL_24;
      }
    }
    else
    {

    }
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[CDPSOSCircleProxyImpl tryRegisteringCredentials].cold.1();

  v19 = 0;
LABEL_24:

  return v19;
}

- (BOOL)canAuthenticate
{
  char v2;
  NSObject *v3;

  v2 = SOSCCCanAuthenticate();
  if ((v2 & 1) == 0)
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CDPCircleProxyImpl canAuthenticate].cold.1();

  }
  return v2;
}

- (void)reportSuccess
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[CDPSOSCircleProxyImpl reportSuccess]";
    v5 = 1024;
    v6 = 544;
    _os_log_impl(&dword_20D7E6000, v2, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", (uint8_t *)&v3, 0x12u);
  }

}

- (void)reportFailure:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CDPSOSCircleProxyImpl reportFailure:]";
    v6 = 1024;
    v7 = 550;
    _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", (uint8_t *)&v4, 0x12u);
  }

}

+ (unint64_t)syncingStatusForAltDSID:(id)a3
{
  id v3;
  int v4;
  void *v5;
  CDPSOSCircleProxyImpl *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  v4 = SOSCCFetchCompatibilityMode();
  +[CDPContext contextForAccountWithAltDSID:](CDPContext, "contextForAccountWithAltDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = -[CDPSOSCircleProxyImpl initWithContext:]([CDPSOSCircleProxyImpl alloc], "initWithContext:", v5);
    v11 = 0;
    v7 = -[CDPSOSCircleProxyImpl combinedCircleStatus:](v6, "combinedCircleStatus:", &v11);
    v8 = v11;
    if (v8)
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:].cold.1();

    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:].cold.2();
    v7 = 0;
  }

  return v7;
}

- (int64_t)cliqueStatus:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)cachedCliqueStatus:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)pairingChannelAcceptor
{
  return 0;
}

- (id)pairingChannelInitiator
{
  return 0;
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = a4;
    objc_msgSend(v5, "cdp_errorWithCode:", -5004);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (BOOL)registerCredentialsIfMissing
{
  return 0;
}

- (id)requestToResetProtectedData:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

- (void)initWithContext:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_FAULT, "\"CDPSOSCircleProxyImpl init is missing required dsid. Barring no primary account, problems lie ahead…\", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)peerId
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
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to get peer ID: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)peerCount
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
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to get peer info from circle: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)peerDeviceNamesByPeerID
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
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to get peer info to find device names: %@\", v2, v3, v4, v5, v6);
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

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Skipping call to SOSCCWaitForInitialSync because circle status is not kSOSCCInCircle (%lu)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeThisDeviceFromCircle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to remove self from circle - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)resetToOffering:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to reset to offering - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)requestToResetCloudKitDataForReason:error:.cold.1()
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
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to reset cloud data with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
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

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to check for non-view-aware peers with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Failed to check for non-view-aware peers before removing them from circle with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Removed old peers from circle: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeNonViewAwarePeers:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20D7E6000, v1, OS_LOG_TYPE_ERROR, "\"Failed to remove old peers from circle with error %@ (peers: %@)\", v2, 0x16u);
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

- (void)tryRegisteringCredentials
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Skipping try registering credentials, insufficient parameters\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"CDPDFollowUpController: Error fetching SOS Status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)syncingStatusForAltDSID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"CDPDFollowUpController: Cannot fetch sos status because SOS Compatibility mode is disabled\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

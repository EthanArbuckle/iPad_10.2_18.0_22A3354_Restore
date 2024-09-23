@implementation CDPDOctagonTrustProxyImpl

- (CDPDOctagonTrustProxyImpl)initWithContext:(id)a3
{
  id v5;
  CDPDOctagonTrustProxyImpl *v6;
  CDPDOctagonTrustProxyImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPDOctagonTrustProxyImpl;
  v6 = -[CDPDOctagonTrustProxyImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cdpContext, a3);

  return v7;
}

- (void)fetchEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  -[CDPDOctagonTrustProxyImpl fetchEscrowRecords:source:completion:](self, "fetchEscrowRecords:source:completion:", a3, v5, a5);
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v25;
  CDPContext *cdpContext;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  uint8_t buf[4];
  os_signpost_id_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDE84B8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setContext:", *MEMORY[0x24BDE8508]);
  -[CDPContext altDSID](self->_cdpContext, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAltDSID:", v12);

  objc_msgSend(MEMORY[0x24BE6E100], "dictionaryToEscrowAuthenticationInfo:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setEscrowAuth:", v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFlowID:", v14);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceSessionID:", v15);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setEscrowFetchSource:", a4);
  _CDPSignpostLogSystem();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _CDPSignpostCreate();
  v19 = v18;

  _CDPSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v17;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A698], *MEMORY[0x24BE1A860]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE1A688]);

  v25 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke;
  v29[3] = &unk_24C81C720;
  v32 = v17;
  v33 = v19;
  v30 = v23;
  v31 = v8;
  v27 = v8;
  v28 = v23;
  -[CDPExponentialRetryScheduler retryFetchEscrowRecord:cdpContext:completionHandler:](v25, "retryFetchEscrowRecord:cdpContext:completionHandler:", v11, cdpContext, v29);

}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t Nanoseconds;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (v8)
    v10 = MEMORY[0x24BDBD1C8];
  else
    v10 = MEMORY[0x24BDBD1C0];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDFC328]);
  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v7);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", *(_QWORD *)(a1 + 32));

  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v25 = 67240192;
    LODWORD(v26) = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v14, OS_SIGNPOST_INTERVAL_END, v15, "FetchEscrowRecords", " fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 8u);
  }

  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v18 = *(_QWORD *)(a1 + 48);
    v19 = objc_msgSend(v7, "code");
    v25 = 134218496;
    v26 = v18;
    v27 = 2048;
    v28 = v17;
    v29 = 1026;
    v30 = v19;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 0x1Cu);
  }

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_2();

  if (v9)
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_1();

    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_24:
      v23();
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_24;
    }
  }

}

- (void)fetchAllEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  -[CDPDOctagonTrustProxyImpl fetchAllEscrowRecords:source:completion:](self, "fetchAllEscrowRecords:source:completion:", a3, v5, a5);
}

- (void)fetchAllEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v25;
  CDPContext *cdpContext;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  uint8_t buf[4];
  os_signpost_id_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDE84B8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setContext:", *MEMORY[0x24BDE8508]);
  -[CDPContext altDSID](self->_cdpContext, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAltDSID:", v12);

  objc_msgSend(MEMORY[0x24BE6E100], "dictionaryToEscrowAuthenticationInfo:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setEscrowAuth:", v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFlowID:", v14);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceSessionID:", v15);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setEscrowFetchSource:", a4);
  _CDPSignpostLogSystem();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _CDPSignpostCreate();
  v19 = v18;

  _CDPSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v17;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A698], *MEMORY[0x24BE1A860]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE1A688]);

  v25 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke;
  v29[3] = &unk_24C81C720;
  v32 = v17;
  v33 = v19;
  v30 = v23;
  v31 = v8;
  v27 = v8;
  v28 = v23;
  -[CDPExponentialRetryScheduler retryFetchAllEscrowRecord:cdpContext:completionHandler:](v25, "retryFetchAllEscrowRecord:cdpContext:completionHandler:", v11, cdpContext, v29);

}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t Nanoseconds;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (v8)
    v10 = MEMORY[0x24BDBD1C8];
  else
    v10 = MEMORY[0x24BDBD1C0];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDFC328]);
  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v7);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", *(_QWORD *)(a1 + 32));

  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v25 = 67240192;
    LODWORD(v26) = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v14, OS_SIGNPOST_INTERVAL_END, v15, "FetchEscrowRecords", " fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 8u);
  }

  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v18 = *(_QWORD *)(a1 + 48);
    v19 = objc_msgSend(v7, "code");
    v25 = 134218496;
    v26 = v18;
    v27 = 2048;
    v28 = v17;
    v29 = 1026;
    v30 = v19;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 0x1Cu);
  }

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_2();

  if (v9)
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_1();

    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_24:
      v23();
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_24;
    }
  }

}

- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 error:(id *)a5
{
  return -[CDPDOctagonTrustProxyImpl tlkRecoverabilityForEscrow:record:source:error:](self, "tlkRecoverabilityForEscrow:record:source:error:", a3, a4, 0, a5);
}

- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 source:(int64_t)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t Nanoseconds;
  NSObject *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v37;
  uint8_t buf[4];
  os_signpost_id_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDE84B8];
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v13, "setContext:", *MEMORY[0x24BDE8508]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFlowID:", v14);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeviceSessionID:", v15);

  }
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryAccountAltDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAltDSID:", v17);
  objc_msgSend(MEMORY[0x24BE6E100], "dictionaryToEscrowAuthenticationInfo:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setEscrowAuth:", v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "setEscrowFetchSource:", a5);
  _CDPSignpostLogSystem();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "TLKRecoverability", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v20;
    _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TLKRecoverability  enableTelemetry=YES ", buf, 0xCu);
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84B0]), "initWithContextData:", v13);
  v37 = 0;
  objc_msgSend(v24, "tlkRecoverabilityForEscrowRecord:error:", v11, &v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v37;
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    v30 = objc_msgSend(v26, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v39) = v30;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v29, OS_SIGNPOST_INTERVAL_END, v20, "TLKRecoverability", " resultError=%{public,signpost.telemetry:number1,name=resultError}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v26, "code");
    *(_DWORD *)buf = 134218496;
    v39 = v20;
    v40 = 2048;
    v41 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v42 = 1026;
    v43 = v32;
    _os_log_impl(&dword_20DB2C000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TLKRecoverability  resultError=%{public,signpost.telemetry:number1,name=resultError}d ", buf, 0x1Cu);
  }

  _CDPLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[CDPDOctagonTrustProxyImpl tlkRecoverabilityForEscrow:record:source:error:].cold.2();

  if (v26 || !v25)
  {
    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CDPDOctagonTrustProxyImpl tlkRecoverabilityForEscrow:record:source:error:].cold.1();

    v34 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v26);
  }
  else
  {
    v34 = v25;
  }

  return v34;
}

- (BOOL)disableRecoveryKey:(id *)a3
{
  void *v4;
  void *v5;

  -[CDPContext cliqueConfiguration](self->_cdpContext, "cliqueConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84B0]), "initWithContextData:", v4);
  LOBYTE(a3) = objc_msgSend(v5, "removeRecoveryKey:error:", v4, a3);

  return (char)a3;
}

- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4
{
  return objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInOctagon:error:", a3, a4);
}

- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  +[CDPRecoveryKeyCache sharedInstance](CDPRecoveryKeyCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext altDSID](self->_cdpContext, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "cacheRecoveryKey:forAltDSID:error:", v7, v9, a5);

  return (char)a5;
}

- (BOOL)registerRecoveryKey:(id)a3 error:(id *)a4
{
  CDPContext *cdpContext;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  cdpContext = self->_cdpContext;
  v6 = a3;
  -[CDPContext octagonConfigurationContext](cdpContext, "octagonConfigurationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", *MEMORY[0x24BDE8508]);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 141558274;
    v14 = 1752392040;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Registering recovery key with context %{mask.hash}@\", (uint8_t *)&v13, 0x16u);
  }

  v9 = objc_msgSend(MEMORY[0x24BDE84B0], "registerRecoveryKeyWithContext:recoveryKey:error:", v7, v6, a4);
  if (v9)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Successfully registered recovery key\", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v11)
        -[CDPDOctagonTrustProxyImpl registerRecoveryKey:error:].cold.2((uint64_t *)a4, v10);
    }
    else if (v11)
    {
      -[CDPDOctagonTrustProxyImpl registerRecoveryKey:error:].cold.1(v10);
    }
  }

  return v9;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)setCdpContext:(id)a3
{
  objc_storeStrong((id *)&self->_cdpContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Fetched escrow records error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Fetched escrow records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"fetchAllEscrowRecords failed, error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Fetched all escrow records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tlkRecoverabilityForEscrow:record:source:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"checkForRecoverability failed, error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tlkRecoverabilityForEscrow:record:source:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Checked for recoverability: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)registerRecoveryKey:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Failed to register recovery key\", v1, 2u);
}

- (void)registerRecoveryKey:(uint64_t *)a1 error:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 141558274;
  v4 = 1752392040;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to register recovery key with error: %{mask.hash}@\", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end

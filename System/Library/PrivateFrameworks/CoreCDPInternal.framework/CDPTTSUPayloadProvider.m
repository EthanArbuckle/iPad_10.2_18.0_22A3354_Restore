@implementation CDPTTSUPayloadProvider

- (CDPTTSUPayloadProvider)initWithCircleProxy:(id)a3
{
  id v5;
  CDPTTSUPayloadProvider *v6;
  CDPTTSUPayloadProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPTTSUPayloadProvider;
  v6 = -[CDPTTSUPayloadProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_circleProxy, a3);

  return v7;
}

- (id)initiatingPayload:(id *)a3
{
  void *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  KCPairingChannel *v11;
  KCPairingChannel *pairingChannel;
  NSObject *v13;
  KCPairingChannel *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  _CDPSignpostLogSystem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TTSUInitiatingPayload", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v6;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TTSUInitiatingPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  if (!self->_pairingChannel)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Creating an initiating pairing channel...\", buf, 2u);
    }

    -[CDPDCircleProxy pairingChannelInitiator](self->_circleProxy, "pairingChannelInitiator");
    v11 = (KCPairingChannel *)objc_claimAutoreleasedReturnValue();
    pairingChannel = self->_pairingChannel;
    self->_pairingChannel = v11;

  }
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Creating initiating TTSU payload\", buf, 2u);
  }

  v26 = 0;
  v14 = self->_pairingChannel;
  v25 = 0;
  -[KCPairingChannel exchangePacket:complete:error:](v14, "exchangePacket:complete:error:", 0, &v26, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = (os_signpost_id_t)v16;
    _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Created initiating TTSU payload with error: %@\", buf, 0xCu);
  }

  self->_complete = v26;
  if (a3)
    *a3 = objc_retainAutorelease(v16);
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v21 = objc_msgSend(v16, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v28) = v21;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v20, OS_SIGNPOST_INTERVAL_END, v6, "TTSUInitiatingPayload", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v16, "code");
    *(_DWORD *)buf = 134218496;
    v28 = v6;
    v29 = 2048;
    v30 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v31 = 1026;
    v32 = v23;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TTSUInitiatingPayload  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  return v15;
}

- (id)processIncomingPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  KCPairingChannel *v14;
  KCPairingChannel *pairingChannel;
  NSObject *v16;
  KCPairingChannel *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  id *v28;
  NSObject *v29;
  KCPairingChannel *v30;
  KCPairingChannel *v31;
  KCPairingChannel *v32;
  uint64_t v33;
  id v34;
  _BOOL4 v35;
  uint64_t Nanoseconds;
  NSObject *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  os_signpost_id_t v43;
  id v44;
  id v45;
  BOOL v46;
  uint8_t buf[4];
  os_signpost_id_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TTSUProcessIncomingPayload", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = v8;
    _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TTSUProcessIncomingPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  if (!self->_pairingChannel)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Creating an accepting pairing channel...\", buf, 2u);
    }

    -[CDPDCircleProxy pairingChannelAcceptor](self->_circleProxy, "pairingChannelAcceptor");
    v14 = (KCPairingChannel *)objc_claimAutoreleasedReturnValue();
    pairingChannel = self->_pairingChannel;
    self->_pairingChannel = v14;

  }
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Processing incoming TTSU payload\", buf, 2u);
  }

  v46 = 0;
  v17 = self->_pairingChannel;
  v45 = 0;
  -[KCPairingChannel exchangePacket:complete:error:](v17, "exchangePacket:complete:error:", v6, &v46, &v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v45;
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (!v21)
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v48 = (os_signpost_id_t)v19;
    v22 = "\"Processed incoming TTSU payload with error: %@\";
    v23 = v20;
    v24 = 12;
  }
  else
  {
    if (!v21)
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v22 = "\"Processing the incoming TTSU payload was successful.\";
    v23 = v20;
    v24 = 2;
  }
  _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_18:

  objc_msgSend(v19, "domain");
  v25 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToString:](v25, "isEqualToString:", *MEMORY[0x24BE5E6E0]))
  {
    v26 = objc_msgSend(v19, "code");

    if (v26 != 2)
      goto LABEL_27;
    v43 = v8;
    v27 = v8 - 1;
    v28 = a4;
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Detected a stale channel, re-initializing...\", buf, 2u);
    }

    -[CDPDCircleProxy pairingChannelAcceptor](self->_circleProxy, "pairingChannelAcceptor");
    v30 = (KCPairingChannel *)objc_claimAutoreleasedReturnValue();
    v31 = self->_pairingChannel;
    self->_pairingChannel = v30;

    v32 = self->_pairingChannel;
    v44 = v19;
    -[KCPairingChannel exchangePacket:complete:error:](v32, "exchangePacket:complete:error:", v6, &v46, &v44);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v44;

    _CDPLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        *(_DWORD *)buf = 138412290;
        v48 = (os_signpost_id_t)v34;
        _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"After re-initialization, processed incoming TTSU payload with error: %@\", buf, 0xCu);
      }
    }
    else
    {
      if (v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"After re-initialization, processing the incoming TTSU payload was successful.\", buf, 2u);
      }
      v34 = 0;
    }
  }
  else
  {
    v43 = v8;
    v27 = v8 - 1;
    v28 = a4;
    v34 = v19;
    v33 = (uint64_t)v18;
  }

  v19 = v34;
  v18 = (void *)v33;
  a4 = v28;
  v11 = v27;
  v8 = v43;
LABEL_27:
  self->_complete = v46;
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    v39 = objc_msgSend(v19, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v48) = v39;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v38, OS_SIGNPOST_INTERVAL_END, v8, "TTSUProcessIncomingPayload", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = objc_msgSend(v19, "code");
    *(_DWORD *)buf = 134218496;
    v48 = v8;
    v49 = 2048;
    v50 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v51 = 1026;
    v52 = v41;
    _os_log_impl(&dword_20DB2C000, v40, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TTSUProcessIncomingPayload  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  return v18;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (BOOL)requiresInitialSync
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = -[KCPairingChannel needInitialSync](self->_pairingChannel, "needInitialSync");
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Pairing channel indicated initial sync requirement: %{BOOL}d\", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_pairingChannel, 0);
}

@end

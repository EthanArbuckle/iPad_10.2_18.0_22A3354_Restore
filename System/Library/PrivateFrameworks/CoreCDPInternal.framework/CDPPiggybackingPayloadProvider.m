@implementation CDPPiggybackingPayloadProvider

+ (id)proxyWithSession:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  CDPPiggybackingPayloadProvider *v7;
  KCJoiningRequestAccountCircleDelegate *v8;
  KCJoiningRequestAccountCircleDelegate *delegate;
  KCJoiningRequestAccountCircleDelegate *v10;
  uint64_t v11;
  id v12;
  KCJoiningRequestCircleSession *session;
  CDPPiggybackingPayloadProvider *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Creating a piggybacking data provider with session: %@\", buf, 0xCu);
  }

  v7 = objc_alloc_init(CDPPiggybackingPayloadProvider);
  v8 = (KCJoiningRequestAccountCircleDelegate *)objc_alloc_init(MEMORY[0x24BE5E6C8]);
  delegate = v7->_delegate;
  v7->_delegate = v8;

  v10 = v7->_delegate;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE5E6D0], "sessionWithCircleDelegate:session:error:", v10, v5, &v16);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v16;
  session = v7->_session;
  v7->_session = (KCJoiningRequestCircleSession *)v11;

  if (v12)
  {
    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v14 = v7;
  }

  return v14;
}

- (id)initiatingPayload:(id *)a3
{
  return (id)-[KCJoiningRequestCircleSession initialMessage:](self->_session, "initialMessage:", a3);
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
  void *v13;
  uint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v27;
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "KCJoiningRequestProcessMessage", " enableTelemetry=YES ", (uint8_t *)&v27, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 134217984;
    v28 = v8;
    _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: KCJoiningRequestProcessMessage  enableTelemetry=YES ", (uint8_t *)&v27, 0xCu);
  }

  -[KCJoiningRequestCircleSession processMessage:error:](self->_session, "processMessage:error:", v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && *a4)
  {
    Nanoseconds = _CDPSignpostGetNanoseconds();
    _CDPSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v17 = objc_msgSend(*a4, "code");
      v27 = 67240192;
      LODWORD(v28) = v17;
      _os_signpost_emit_with_name_impl(&dword_20DB2C000, v16, OS_SIGNPOST_INTERVAL_END, v8, "KCJoiningRequestProcessMessage", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v27, 8u);
    }

    _CDPSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(*a4, "code");
      v27 = 134218496;
      v28 = v8;
      v29 = 2048;
      v30 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v31 = 1026;
      v32 = v19;
      v20 = "END [%lld] %fs: KCJoiningRequestProcessMessage  Error=%{public,signpost.telemetry:number1,name=Error}d ";
      v21 = v18;
      v22 = 28;
LABEL_18:
      _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    }
  }
  else
  {
    v23 = _CDPSignpostGetNanoseconds();
    _CDPSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_20DB2C000, v25, OS_SIGNPOST_INTERVAL_END, v8, "KCJoiningRequestProcessMessage", ", (uint8_t *)&v27, 2u);
    }

    _CDPSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134218240;
      v28 = v8;
      v29 = 2048;
      v30 = (double)(unint64_t)v23 / 1000000000.0;
      v20 = "END [%lld] %fs: KCJoiningRequestProcessMessage ";
      v21 = v18;
      v22 = 22;
      goto LABEL_18;
    }
  }

  return v13;
}

- (BOOL)isComplete
{
  return -[KCJoiningRequestCircleSession isDone](self->_session, "isDone");
}

- (BOOL)requiresInitialSync
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

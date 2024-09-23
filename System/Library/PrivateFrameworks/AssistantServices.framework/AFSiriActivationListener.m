@implementation AFSiriActivationListener

- (AFSiriActivationListener)initWithServicePort:(int64_t)a3
{
  AFSiriActivationListener *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  NSXPCListener *xpcListener;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)AFSiriActivationListener;
  v4 = -[AFSiriActivationListener init](&v25, sel_init);
  if (v4)
  {
    if (AFLogInitIfNeeded_once != -1)
      dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFSiriActivationListener initWithServicePort:]";
      v28 = 2048;
      v29 = (__CFString *)v4;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    if ((unint64_t)(a3 - 1) > 2)
    {
      if (AFIsHorseman_onceToken != -1)
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
      if (AFIsHorseman_isHorseman)
        v9 = 2;
      else
        v9 = 1;
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        if ((unint64_t)a3 > 3)
          v12 = CFSTR("(unknown)");
        else
          v12 = off_1E3A2D978[a3];
        v13 = v12;
        *(_DWORD *)buf = 136315394;
        v27 = "-[AFSiriActivationListener initWithServicePort:]";
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming)", buf, 0x16u);

        v10 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = v10;
        v15 = off_1E3A2D978[v9];
        *(_DWORD *)buf = 136315394;
        v27 = "-[AFSiriActivationListener initWithServicePort:]";
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s servicePort = %@ (effective)", buf, 0x16u);

      }
      a3 = v9;
    }
    else
    {
      v6 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        v8 = off_1E3A2D978[a3];
        *(_DWORD *)buf = 136315394;
        v27 = "-[AFSiriActivationListener initWithServicePort:]";
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming, effective)", buf, 0x16u);

      }
    }
    AFSiriActivationServiceGetMachServiceName(a3);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFSiriActivationListener initWithServicePort:]";
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s machServiceName = %@", buf, 0x16u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INTERACTIVE, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = dispatch_queue_create("com.apple.siri.activation.listener", v19);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v16);
    xpcListener = v4->_xpcListener;
    v4->_xpcListener = (NSXPCListener *)v22;

    -[NSXPCListener _setQueue:](v4->_xpcListener, "_setQueue:", v4->_queue);
    -[NSXPCListener setDelegate:](v4->_xpcListener, "setDelegate:", v4);

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFSiriActivationListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFSiriActivationListener dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  -[AFSiriActivationListener _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AFSiriActivationListener;
  -[AFSiriActivationListener dealloc](&v4, sel_dealloc);
}

- (void)startWithDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AFSiriActivationListener_startWithDelegate___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AFSiriActivationListener_stop__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AFSiriActivationListener_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  AFSiriActivationListener *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_xpcListener != a3)
    goto LABEL_2;
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.siri.activation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_7;
  v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v14 = v10;
    v15 = 136315906;
    v16 = "-[AFSiriActivationListener listener:shouldAcceptNewConnection:]";
    v17 = 2048;
    v18 = self;
    v19 = 1026;
    v20 = objc_msgSend(v7, "processIdentifier");
    v21 = 2112;
    v22 = CFSTR("com.apple.siri.activation");
    _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s %p Client with pid %{public}d does not have entitlement %@.", (uint8_t *)&v15, 0x26u);

  }
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.siri.external_request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_7:
    objc_msgSend(v7, "setRemoteObjectInterface:", 0);
    AFSiriActivationServiceGetXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v12);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "resume");
    v8 = 1;
  }
  else
  {
LABEL_2:
    v8 = 0;
  }

  return v8;
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315906;
    v10 = "-[AFSiriActivationListener notifyObserver:didChangeStateFrom:to:]";
    v11 = 2112;
    v12 = v7;
    v13 = 2048;
    v14 = a4;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s notifyObserver = %@, fromState = %llu, toState = %llu", (uint8_t *)&v9, 0x2Au);
  }

}

- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AFSiriActivationListener *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]";
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AFSiriActivationListener *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]";
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  AFSiriActivationListener *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    if ((unint64_t)a3 > 0x14)
      v14 = CFSTR("(unknown)");
    else
      v14 = off_1E3A31D98[a3];
    v15 = v14;
    AFSiriDeactivationOptionsGetNames(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v26 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]";
    v27 = 2048;
    v28 = self;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s %p reason = %@, options = %@, context = %@", buf, 0x34u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E3A32DD8;
  v23 = a3;
  v24 = a4;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v18 = v11;
  v19 = v10;
  dispatch_async(queue, block);

}

- (void)handleContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFSiriActivationListener *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[AFSiriActivationListener handleContext:completion:]";
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AFSiriActivationListener *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]";
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p intent = %@, bundleIdentifier = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s intentForwardingAction = %@, bundleIdentifier = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)_startWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  AFSiriActivationListener *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[AFSiriActivationListener _startWithDelegate:]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p delegate = %@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeWeak((id *)&self->_delegate, v4);
  -[NSXPCListener resume](self->_xpcListener, "resume");

}

- (void)_stop
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  AFSiriActivationListener *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFSiriActivationListener _stop]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[NSXPCListener suspend](self->_xpcListener, "suspend");
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_invalidate
{
  NSObject *v3;
  NSXPCListener *xpcListener;
  int v5;
  const char *v6;
  __int16 v7;
  AFSiriActivationListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFSiriActivationListener _invalidate]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AFOneArgumentSafetyBlock *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AFOneArgumentSafetyBlock *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  AFOneArgumentSafetyBlock *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  AFSiriActivationListener *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]";
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  v12 = [AFOneArgumentSafetyBlock alloc];
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke;
  v22[3] = &unk_1E3A32F48;
  v22[4] = self;
  v14 = v10;
  v23 = v14;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2508);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v12, "initWithBlock:defaultValue:", v22, v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    v19 = 2506;
LABEL_8:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFOneArgumentSafetyBlock invokeWithValue:](v16, "invokeWithValue:", v18);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = 2507;
    goto LABEL_8;
  }
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke_39;
  v20[3] = &unk_1E3A36A00;
  v21 = v16;
  objc_msgSend(WeakRetained, "siriActivationListener:prewarmWithRequestInfo:context:completion:", self, v8, v9, v20);
  v18 = v21;
LABEL_9:

}

- (void)_activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AFOneArgumentSafetyBlock *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AFOneArgumentSafetyBlock *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  AFOneArgumentSafetyBlock *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  AFSiriActivationListener *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]";
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  v12 = [AFOneArgumentSafetyBlock alloc];
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke;
  v22[3] = &unk_1E3A32F48;
  v22[4] = self;
  v14 = v10;
  v23 = v14;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2508);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v12, "initWithBlock:defaultValue:", v22, v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    v19 = 2506;
LABEL_8:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFOneArgumentSafetyBlock invokeWithValue:](v16, "invokeWithValue:", v18);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = 2507;
    goto LABEL_8;
  }
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke_42;
  v20[3] = &unk_1E3A36A00;
  v21 = v16;
  objc_msgSend(WeakRetained, "siriActivationListener:activateWithRequestInfo:context:completion:", self, v8, v9, v20);
  v18 = v21;
LABEL_9:

}

- (void)_deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  AFOneArgumentSafetyBlock *v17;
  uint64_t v18;
  id v19;
  void *v20;
  AFOneArgumentSafetyBlock *v21;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  AFOneArgumentSafetyBlock *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  AFSiriActivationListener *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    if ((unint64_t)a3 > 0x14)
      v14 = CFSTR("(unknown)");
    else
      v14 = off_1E3A31D98[a3];
    v15 = v14;
    AFSiriDeactivationOptionsGetNames(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v30 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]";
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s %p reason = %@, options = %@, context = %@", buf, 0x34u);

  }
  v17 = [AFOneArgumentSafetyBlock alloc];
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke;
  v27[3] = &unk_1E3A32F48;
  v27[4] = self;
  v19 = v11;
  v28 = v19;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2508);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v17, "initWithBlock:defaultValue:", v27, v20);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    v24 = 2506;
LABEL_11:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFOneArgumentSafetyBlock invokeWithValue:](v21, "invokeWithValue:", v23);
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v24 = 2507;
    goto LABEL_11;
  }
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke_45;
  v25[3] = &unk_1E3A36A00;
  v26 = v21;
  objc_msgSend(WeakRetained, "siriActivationListener:deactivateForReason:options:context:completion:", self, a3, a4, v10, v25);
  v23 = v26;
LABEL_12:

}

- (void)_deliverButtonEventFromContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AFOneArgumentSafetyBlock *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AFOneArgumentSafetyBlock *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  AFOneArgumentSafetyBlock *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFSiriActivationListener *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  v9 = [AFOneArgumentSafetyBlock alloc];
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke;
  v19[3] = &unk_1E3A32F48;
  v19[4] = self;
  v11 = v7;
  v20 = v11;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2508);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v9, "initWithBlock:defaultValue:", v19, v12);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    v16 = 2506;
LABEL_8:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFOneArgumentSafetyBlock invokeWithValue:](v13, "invokeWithValue:", v15);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v16 = 2507;
    goto LABEL_8;
  }
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke_48;
  v17[3] = &unk_1E3A36A00;
  v18 = v13;
  objc_msgSend(WeakRetained, "siriActivationListener:handleButtonEventFromContext:completion:", self, v6, v17);
  v15 = v18;
LABEL_9:

}

- (void)_myriadEventWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AFOneArgumentSafetyBlock *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AFOneArgumentSafetyBlock *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  AFOneArgumentSafetyBlock *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  AFSiriActivationListener *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]";
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  v12 = [AFOneArgumentSafetyBlock alloc];
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke;
  v22[3] = &unk_1E3A32F48;
  v22[4] = self;
  v14 = v10;
  v23 = v14;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2508);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v12, "initWithBlock:defaultValue:", v22, v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    v19 = 2506;
LABEL_8:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFOneArgumentSafetyBlock invokeWithValue:](v16, "invokeWithValue:", v18);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = 2507;
    goto LABEL_8;
  }
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke_51;
  v20[3] = &unk_1E3A36A00;
  v21 = v16;
  objc_msgSend(WeakRetained, "siriActivationListener:myriadEventWithRequestInfo:context:completion:", self, v8, v9, v20);
  v18 = v21;
LABEL_9:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke_51(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke_48(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke_42(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]_block_invoke";
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_1E3A32F20;
    v5 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    objc_msgSend(WeakRetained, "siriActivationListener:handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:", v3, v4, v5, v8);

  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completi"
            "onHandler:]_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Intent handling is not supported on this platform", buf, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionH"
         "andler:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s intentForwardingActionResponse = %@", (uint8_t *)&v6, 0x16u);
  }

}

void __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2;
    v11[3] = &unk_1E3A32EF8;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v6;
    objc_msgSend(WeakRetained, "siriActivationListener:handleIntent:inBackgroundAppWithBundleId:reply:", v3, v4, v5, v11);
    v7 = v12;
  }
  else
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 1316);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v7);
  }

}

void __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  if (v5)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke_2";
      v14 = 2048;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p intentResponse = %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if (v6)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      v14 = 2048;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v12, 0x20u);
    }
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v40[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2;
  v40[3] = &unk_1E3A32E28;
  v40[4] = v3;
  v41 = v4;
  v42 = *(id *)(a1 + 48);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v40);
  v37[0] = v2;
  v37[1] = 3221225472;
  v37[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_14;
  v37[3] = &unk_1E3A32E28;
  v6 = *(void **)(a1 + 40);
  v37[4] = *(_QWORD *)(a1 + 32);
  v38 = v6;
  v39 = *(id *)(a1 + 48);
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v37);
  v34[0] = v2;
  v34[1] = 3221225472;
  v34[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_17;
  v34[3] = &unk_1E3A32E50;
  v8 = *(void **)(a1 + 40);
  v34[4] = *(_QWORD *)(a1 + 32);
  v35 = v8;
  v36 = *(id *)(a1 + 48);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v34);
  v31[0] = v2;
  v31[1] = 3221225472;
  v31[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_21;
  v31[3] = &unk_1E3A32E78;
  v31[4] = *(_QWORD *)(a1 + 32);
  v33 = *(id *)(a1 + 48);
  v32 = *(id *)(a1 + 40);
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v31);
  v24 = v2;
  v25 = 3221225472;
  v26 = __53__AFSiriActivationListener_handleContext_completion___block_invoke_25;
  v27 = &unk_1E3A32E28;
  v11 = *(void **)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = v11;
  v30 = *(id *)(a1 + 48);
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](&v24);
  AFSiriActivationCreateRequestInfoFromContext(*(void **)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v44 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v45 = 2048;
    v46 = v15;
    v47 = 2112;
    v48 = v13;
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@", buf, 0x20u);
  }
  v16 = objc_msgSend(*(id *)(a1 + 40), "source");
  v17 = objc_msgSend(*(id *)(a1 + 40), "event");
  if (v16 == 4)
  {
    if (v17 <= 8)
    {
      if (v17 == 1 || v17 == 8)
      {
        objc_msgSend(*(id *)(a1 + 40), "userInfo", v5, v24, v25, v26, v27, v28, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("isCancellationDoubleTapEvent"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("hasPlayedStartAlert"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (!v19 && (v22 & 1) != 0 || v19 && (objc_msgSend(v19, "BOOLValue") & 1) == 0)
        {
          ((void (**)(_QWORD, void *))v7)[2](v7, v13);
        }
        else
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) != 0)
          {
            v5 = (void (**)(_QWORD, _QWORD))v23;
            (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v13);
            goto LABEL_22;
          }
          v9[2](v9, 1, 0);
        }
        v5 = (void (**)(_QWORD, _QWORD))v23;
LABEL_22:

        goto LABEL_19;
      }
      goto LABEL_16;
    }
    if (v17 == 9)
    {
      v10[2](v10, *(_QWORD *)(a1 + 40));
      goto LABEL_19;
    }
  }
  if (v17 == 16)
  {
    ((void (**)(_QWORD, void *))v12)[2](v12, v13);
    goto LABEL_19;
  }
LABEL_16:
  if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) != 0)
    ((void (**)(_QWORD, void *))v5)[2](v5, v13);
  else
    ((void (**)(_QWORD, void *))v7)[2](v7, v13);
LABEL_19:

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke_2";
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p Handling as prewarming...", buf, 0x16u);
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_11;
  v11[3] = &unk_1E3A32E00;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v8;
  v11[4] = v9;
  v12 = v10;
  objc_msgSend(v6, "_prewarmWithRequestInfo:context:completion:", v3, v7, v11);

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p Handling as activation...", buf, 0x16u);
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_15;
  v11[3] = &unk_1E3A32E00;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v8;
  v11[4] = v9;
  v12 = v10;
  objc_msgSend(v6, "_activateWithRequestInfo:context:completion:", v3, v7, v11);

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v18 = 2048;
    v19 = v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p Handling as deactivation...", buf, 0x16u);
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_18;
  v13[3] = &unk_1E3A32E00;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v15 = v10;
  v13[4] = v11;
  v14 = v12;
  objc_msgSend(v8, "_deactivateForReason:options:context:completion:", a2, a3, v9, v13);

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v15 = 2048;
    v16 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p Delivering button event ...", buf, 0x16u);
  }
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_22;
  v10[3] = &unk_1E3A32E00;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12 = v7;
  v10[4] = v8;
  v11 = v9;
  objc_msgSend(v6, "_deliverButtonEventFromContext:completion:", v3, v10);

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p Handling myriad event...", buf, 0x16u);
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_26;
  v11[3] = &unk_1E3A32E00;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v8;
  v11[4] = v9;
  v12 = v10;
  objc_msgSend(v6, "_myriadEventWithRequestInfo:context:completion:", v3, v7, v11);

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_26(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_27;
    v12[3] = &unk_1E3A32DB0;
    v13 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v12);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as myriad event due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_27(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 6);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_22(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_23;
    v12[3] = &unk_1E3A32DB0;
    v13 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v12);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to deliver button event from context %@ due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_23(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 3);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_18(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_19;
    v12[3] = &unk_1E3A32DB0;
    v13 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v12);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as deactivation due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_19(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 2);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_15(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_16;
    v12[3] = &unk_1E3A32DB0;
    v13 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v12);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as activation due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 1);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_11(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_12;
    v12[3] = &unk_1E3A32DB0;
    v13 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v12);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as prewarming due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 5);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_2;
  v7[3] = &unk_1E3A32F48;
  v6 = *(id *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "_deactivateForReason:options:context:completion:", v3, v2, v5, v7);

}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_3;
    v11[3] = &unk_1E3A32DB0;
    v12 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v11);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke_2";
      v15 = 2048;
      v16 = v7;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke";
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke";
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 2);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_1E3A32F48;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_activateWithRequestInfo:context:completion:", v3, v4, v6);

}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3;
    v11[3] = &unk_1E3A32DB0;
    v12 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v11);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke_2";
      v15 = 2048;
      v16 = v7;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke";
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke";
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }

}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 1);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v4[3] = &unk_1E3A35B08;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_prewarmWithRequestInfo:context:completion:", v2, v3, v4);

}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_3;
    v8[3] = &unk_1E3A32DB0;
    v9 = v3;
    v5 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v8);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke_2";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  v7 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke";
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
  }

}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 5);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

uint64_t __38__AFSiriActivationListener_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __32__AFSiriActivationListener_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

uint64_t __46__AFSiriActivationListener_startWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithDelegate:", *(_QWORD *)(a1 + 40));
}

@end

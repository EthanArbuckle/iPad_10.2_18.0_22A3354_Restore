@implementation _EXSceneSession

- (_EXSceneSession)initWithExtension:(id)a3
{
  id v4;
  _EXSceneSession *v5;
  NSObject *v6;
  uint64_t v7;
  NSXPCListener *sceneConnectionListener;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSceneSession;
  v5 = -[_EXSceneSession init](&v10, sel_init);
  if (v5)
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_EXSceneSession initWithExtension:].cold.1();

    objc_storeWeak((id *)&v5->_extension, v4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v7 = objc_claimAutoreleasedReturnValue();
    sceneConnectionListener = v5->_sceneConnectionListener;
    v5->_sceneConnectionListener = (NSXPCListener *)v7;

    -[NSXPCListener setDelegate:](v5->_sceneConnectionListener, "setDelegate:", v5);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_190C25000, v1, OS_LOG_TYPE_DEBUG, "%@ deallocated with identifier: '%{public}@'", v2, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCListener *v7;
  NSObject *v8;
  NSXPCListener *sceneConnectionListener;
  NSObject *v10;
  BOOL v11;

  v6 = a4;
  v7 = (NSXPCListener *)a3;
  _EXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_EXSceneSession listener:shouldAcceptNewConnection:].cold.2(v6, v8);

  sceneConnectionListener = self->_sceneConnectionListener;
  if (sceneConnectionListener == v7
    && (-[_EXSceneSession setSceneXPCConnection:](self, "setSceneXPCConnection:", v6),
        (objc_opt_respondsToSelector() & 1) != 0)
    && -[_EXScene shouldAcceptConnection:](self->_scene, "shouldAcceptConnection:", v6))
  {
    _EXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_EXSceneSession listener:shouldAcceptNewConnection:].cold.1();

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id buf[2];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionXPCConnection);

  if (!WeakRetained)
  {
    _EXSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject signpost](v7, "signpost"))
    {
      v8 = os_signpost_enabled(v6);

      if (!v8)
      {
LABEL_8:

        objc_msgSend(v4, "setExportedObject:", self);
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE212618);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setExportedInterface:", v11);

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE21C9B8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setRemoteObjectInterface:", v12);

        objc_msgSend(v4, "_setQueue:", MEMORY[0x1E0C80D38]);
        objc_initWeak(buf, self);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __45___EXSceneSession_shouldAcceptXPCConnection___block_invoke;
        v14[3] = &unk_1E2CFC8B8;
        objc_copyWeak(&v15, buf);
        objc_msgSend(v4, "setInvalidationHandler:", v14);
        -[_EXSceneSession setSessionXPCConnection:](self, "setSessionXPCConnection:", v4);
        objc_msgSend(v4, "activate");
        objc_destroyWeak(&v15);
        objc_destroyWeak(buf);
        goto LABEL_9;
      }
      v7 = v6;
      +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "signpost");

      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v7, OS_SIGNPOST_EVENT, v10, "extensionkit-lifecycle", "-[EXSceneSession shouldAcceptXPCConnection:]", (uint8_t *)buf, 2u);
      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return WeakRetained == 0;
}

- (id)makeConfigurationWithParameters:(id)a3
{
  id v3;
  _EXSceneConfiguration *v4;

  v3 = a3;
  v4 = -[_EXSceneConfiguration initWithParameters:]([_EXSceneConfiguration alloc], "initWithParameters:", v3);

  return v4;
}

- (id)makeSceneWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id result;

  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_EXSceneSession makeSceneWithError:].cold.10();

  -[_EXSceneSession configuration](self, "configuration");
  v5 = objc_claimAutoreleasedReturnValue();
  -[_EXSceneSession extension](self, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForSceneConnectionWithConfiguration:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = class_conformsToProtocol((Class)-[NSObject sceneClass](v5, "sceneClass"), (Protocol *)&unk_1EE215250);
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_EXSceneSession makeSceneWithError:].cold.7(v5, v9);

      v10 = objc_alloc_init((Class)-[NSObject sceneClass](v5, "sceneClass"));
      _EXDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_EXSceneSession makeSceneWithError:].cold.6();

      if (v10)
      {
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE215250) & 1) != 0)
        {
          if (!-[NSObject sceneDelegateClass](v5, "sceneDelegateClass") || (objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_19;
          _EXDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[_EXSceneSession makeSceneWithError:].cold.4(v5, v12);

          v13 = objc_alloc_init((Class)-[NSObject sceneDelegateClass](v5, "sceneDelegateClass"));
          _EXDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[_EXSceneSession makeSceneWithError:].cold.3();

          if (v13)
          {
            objc_msgSend(v10, "setDelegate:", v13);

LABEL_19:
            return v10;
          }
        }
        else
        {
          _EXDefaultLog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
            -[_EXSceneSession makeSceneWithError:].cold.5();

          __break(1u);
        }
        _EXDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[_EXSceneSession makeSceneWithError:].cold.2(v5);
      }
      else
      {
        _EXDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[_EXSceneSession makeSceneWithError:].cold.1(v5);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[_EXSceneSession makeSceneWithError:].cold.8(v5);
    }
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXSceneSession makeSceneWithError:].cold.9((uint64_t)v5, v9);
  }

  __break(1u);
  return result;
}

- (void)connectToScene:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[_EXSceneSession scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    v4 = v8;
    if ((v6 & 1) != 0)
    {
      -[_EXSceneSession scene](self, "scene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectToSession:", self);

      v4 = v8;
    }
  }

}

- (id)makeConnectionResponse
{
  _EXSceneSessionConnectionResponse *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_EXSceneSessionConnectionResponse);
  -[_EXSceneSession sceneConnectionListener](self, "sceneConnectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXSceneSessionConnectionResponse setSceneEndpoint:](v3, "setSceneEndpoint:", v5);

  return v3;
}

- (void)connectSceneSessionWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSUUID *v8;
  NSUUID *identifier;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSUUID *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  os_signpost_id_t v19;
  NSUUID *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  _EXSceneConfiguration *v25;
  _EXSceneConfiguration *configuration;
  NSXPCListenerEndpoint *v27;
  NSXPCListenerEndpoint *hostEndpoint;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  NSXPCConnection **p_sessionXPCConnection;
  id WeakRetained;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  NSUUID *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "identifier");
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v8;

  _EXSignpostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self->_identifier);
  if (v11)
  {
    v12 = v10;
    v13 = v12;
    if (v11 != -1 && os_signpost_enabled(v12))
    {
      v14 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v58 = v14;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "extensionkit-lifecycle", "ID: %@", buf, 0xCu);
    }

  }
  self->_signpost = v11;
  _EXSignpostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject signpost](v16, "signpost"))
    goto LABEL_11;
  v17 = os_signpost_enabled(v15);

  if (v17)
  {
    v16 = v15;
    +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "signpost");

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v20 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v58 = v20;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v16, OS_SIGNPOST_EVENT, v19, "extensionkit-lifecycle", "Begin session: %@", buf, 0xCu);
    }
LABEL_11:

  }
  _EXSignpostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v21))
  {
    v22 = v21;
    v23 = -[_EXSceneSession signpost](self, "signpost");
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v22, OS_SIGNPOST_EVENT, v23, "extensionkit-lifecycle", "-[EXSceneSession shouldAcceptXPCConnection:]", buf, 2u);
    }

  }
  objc_msgSend(v6, "parameters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXSceneSession makeConfigurationWithParameters:](self, "makeConfigurationWithParameters:", v24);
  v25 = (_EXSceneConfiguration *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  self->_configuration = v25;

  objc_msgSend(v6, "hostEndpoint");
  v27 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue();
  hostEndpoint = self->_hostEndpoint;
  self->_hostEndpoint = v27;

  -[_EXSceneSession extension](self, "extension");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "prepareForSceneConnectionWithConfiguration:", self->_configuration);

  +[_EXSceneSessionManager sharedInstance](_EXSceneSessionManager, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSession:", self);

  _EXSignpostLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v31))
  {
    v32 = v31;
    v33 = -[_EXSceneSession signpost](self, "signpost");
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v32, OS_SIGNPOST_EVENT, v33, "extensionkit-lifecycle", "PRE: -[EXSceneSession makeSceneWithError:]", buf, 2u);
    }

  }
  v56 = 0;
  -[_EXSceneSession makeSceneWithError:](self, "makeSceneWithError:", &v56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v56;
  _EXSignpostLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v36))
  {
    v37 = v36;
    v38 = -[_EXSceneSession signpost](self, "signpost");
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v37, OS_SIGNPOST_EVENT, v38, "extensionkit-lifecycle", "POST: -[EXSceneSession makeSceneWithError:]", buf, 2u);
    }

  }
  if (v34)
  {
    -[_EXSceneSession setScene:](self, "setScene:", v34);
    _EXSignpostLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v39))
    {
      v40 = v39;
      v41 = -[_EXSceneSession signpost](self, "signpost");
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v40, OS_SIGNPOST_EVENT, v41, "extensionkit-lifecycle", "PRE: -[EXSceneSession connectToScene:]", buf, 2u);
      }

    }
    -[_EXSceneSession connectToScene:](self, "connectToScene:", v34);
    _EXSignpostLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v42))
    {
      v43 = v42;
      v44 = -[_EXSceneSession signpost](self, "signpost");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v43, OS_SIGNPOST_EVENT, v44, "extensionkit-lifecycle", "POST: -[EXSceneSession connectToScene:]", buf, 2u);
      }

    }
    -[NSXPCListener resume](self->_sceneConnectionListener, "resume");
    -[_EXSceneSession makeConnectionResponse](self, "makeConnectionResponse");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _EXSignpostLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v46))
    {
      v47 = v46;
      v48 = -[_EXSceneSession signpost](self, "signpost");
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v47, OS_SIGNPOST_EVENT, v48, "extensionkit-lifecycle", "Initialized", buf, 2u);
      }

    }
    v7[2](v7, v45, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v7)[2](v7, 0, v35);
    _EXSignpostLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v49))
    {
      v50 = v49;
      v51 = -[_EXSceneSession signpost](self, "signpost");
      if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v50, OS_SIGNPOST_EVENT, v51, "extensionkit-lifecycle", "Failure", buf, 2u);
      }

    }
    p_sessionXPCConnection = &self->_sessionXPCConnection;
    objc_copyWeak((id *)buf, (id *)p_sessionXPCConnection);
    WeakRetained = objc_loadWeakRetained((id *)p_sessionXPCConnection);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __56___EXSceneSession_connectSceneSessionWithRequest_reply___block_invoke;
    v54[3] = &unk_1E2CFC8B8;
    objc_copyWeak(&v55, (id *)buf);
    objc_msgSend(WeakRetained, "addBarrierBlock:", v54);

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);
  }

}

- (NSString)role
{
  return -[_EXSceneConfiguration role](self->_configuration, "role");
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[_EXSceneSession hostEndpoint](self, "hostEndpoint", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  id WeakRetained;
  uint8_t v8[16];

  _EXSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[_EXSceneSession signpost](self, "signpost") && os_signpost_enabled(v3))
  {
    v4 = v3;
    v5 = -[_EXSceneSession signpost](self, "signpost");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v8 = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v4, OS_SIGNPOST_EVENT, v6, "extensionkit-lifecycle", "invalidate", v8, 2u);
      }
    }

  }
  -[NSXPCListener invalidate](self->_sceneConnectionListener, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionXPCConnection);
  objc_msgSend(WeakRetained, "invalidate");

}

- (_EXSceneConfiguration)configuration
{
  return (_EXSceneConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (_EXScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (NSXPCListener)sceneConnectionListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSceneConnectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSXPCConnection)sessionXPCConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_sessionXPCConnection);
}

- (void)setSessionXPCConnection:(id)a3
{
  objc_storeWeak((id *)&self->_sessionXPCConnection, a3);
}

- (NSXPCConnection)sceneXPCConnection
{
  return self->_sceneXPCConnection;
}

- (void)setSceneXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_sceneXPCConnection, a3);
}

- (_EXExtension)extension
{
  return (_EXExtension *)objc_loadWeakRetained((id *)&self->_extension);
}

- (NSXPCListenerEndpoint)hostEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)hasSwiftUIContent
{
  return self->_hasSwiftUIContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostEndpoint, 0);
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong((id *)&self->_sceneXPCConnection, 0);
  objc_destroyWeak((id *)&self->_sessionXPCConnection);
  objc_storeStrong((id *)&self->_sceneConnectionListener, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "%{public}@ allocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "XPC interface successfully configured for session %{public}@, accepting connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_debug_impl(&dword_190C25000, a2, OS_LOG_TYPE_DEBUG, "Session connection request from '%d': Received ", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)makeSceneWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromClass((Class)objc_msgSend(a1, "sceneClass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_1(&dword_190C25000, v2, v3, "%s - %s:%d: Failed to create scene of class '%{public}@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8_1();
}

- (void)makeSceneWithError:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromClass((Class)objc_msgSend(a1, "sceneDelegateClass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_1(&dword_190C25000, v2, v3, "%s - %s:%d: Failed to create UI scene delegate of class '%{public}@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8_1();
}

- (void)makeSceneWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "UI scene delegate is: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)makeSceneWithError:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromClass((Class)objc_msgSend(a1, "sceneDelegateClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, a2, v4, "Making UI scene delegate of class '%{public}@'", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)makeSceneWithError:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromProtocol((Protocol *)&unk_1EE215250);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1();

  OUTLINED_FUNCTION_6_0();
}

- (void)makeSceneWithError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Scene is: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)makeSceneWithError:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromClass((Class)objc_msgSend(a1, "sceneClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, a2, v4, "Making scene of class '%{public}@'", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)makeSceneWithError:(void *)a1 .cold.8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sceneClass");
  NSStringFromProtocol((Protocol *)&unk_1EE215250);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1();

  OUTLINED_FUNCTION_6_0();
}

- (void)makeSceneWithError:(uint64_t)a1 .cold.9(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  _DWORD v8[7];
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136316162;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  v8[6] = 125;
  v9 = 2114;
  v10 = v4;
  v11 = 2114;
  v12 = v7;
  _os_log_fault_impl(&dword_190C25000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected configuration class '%{public}@' expected '%{public}@'", (uint8_t *)v8, 0x30u);

  OUTLINED_FUNCTION_6_0();
}

- (void)makeSceneWithError:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Preparing for connection scene session extension: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end

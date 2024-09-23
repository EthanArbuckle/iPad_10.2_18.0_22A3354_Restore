@implementation AFUISiriRemoteSceneViewController

- (AFUISiriRemoteSceneViewController)init
{
  AFUISiriRemoteSceneViewController *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFUISiriRemoteSceneViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriRemoteSceneViewController;
  v2 = -[AFUISceneHostingViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[AFUISiriRemoteSceneViewController init]";
      v8 = 2112;
      v9 = v2;
      _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
  }
  return v2;
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AFUISiriRemoteSceneViewController invalidate]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Asked to invalidate XPC connection to Siri.app", (uint8_t *)&v4, 0xCu);
  }
  -[NSXPCConnection invalidate](self->_remoteConnection, "invalidate");
}

- (id)_connection
{
  NSXPCConnection *remoteConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  id v8;
  NSXPCConnection *v9;
  uint64_t v10;
  id v11;
  NSXPCConnection *v12;
  id v13;
  NSXPCConnection *v14;
  void *v15;
  NSXPCConnection *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  remoteConnection = self->_remoteConnection;
  if (!remoteConnection)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[AFUISiriRemoteSceneViewController _connection]";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Setting up new XPC connection to Siri.app", buf, 0xCu);
    }
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.app"), 0);
    v6 = self->_remoteConnection;
    self->_remoteConnection = v5;

    self->_connectionHasBeenResumed = 0;
    objc_initWeak((id *)buf, self);
    v7 = (void *)MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    v9 = self->_remoteConnection;
    v10 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke;
    v25[3] = &unk_24D7A1CF0;
    v11 = v7;
    v26 = v7;
    objc_copyWeak(&v27, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v25);
    v12 = self->_remoteConnection;
    v19 = v10;
    v20 = 3221225472;
    v21 = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_3;
    v22 = &unk_24D7A1CF0;
    v13 = v7;
    v23 = v7;
    objc_copyWeak(&v24, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", &v19);
    v14 = self->_remoteConnection;
    objc_msgSend((id)objc_opt_class(), "remoteObjectInterface", v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v14, "setRemoteObjectInterface:", v15);

    v16 = self->_remoteConnection;
    objc_msgSend((id)objc_opt_class(), "exportedInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v17);

    -[NSXPCConnection setExportedObject:](self->_remoteConnection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:](self->_remoteConnection, "_setQueue:", MEMORY[0x24BDAC9B8]);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    remoteConnection = self->_remoteConnection;
  }
  return remoteConnection;
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_2;
  block[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidated");

}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_4;
  block[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_interrupted");

}

+ (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F11CE0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_serviceStartRequestWithOptions_, 0, 0);
  return v2;
}

+ (id)remoteObjectInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F35E10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F14658);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_setSession_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_siriSessionGetRequestContextWithCompletionHandler_, 0, 1);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_siriSessionDidUpdateRecognitionWithPhrases_utterances_refId_, 0, 0);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_siriSessionDidUpdateRecognitionWithPhrases_utterances_refId_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_siriSessionDidInitializeSessionInfo_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_siriSessionDidUpdateSessionInfo_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_siriSessionDidReceivePlayContentCommand_completion_, 0, 0);

  return v2;
}

- (id)serviceViewControllerProxy
{
  void *v2;
  void *v3;

  -[AFUISiriRemoteSceneViewController _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)serviceViewControllerProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24D7A1D18;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_invalidated
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSXPCConnection processIdentifier](self->_remoteConnection, "processIdentifier");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Connection to Siri.app was invalidated pid=%d _remoteConnection=%@"), v3, self->_remoteConnection);
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFUISiriRemoteSceneViewController _invalidated]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp %@", buf, 0x16u);
  }
  -[NSXPCConnection setExportedObject:](self->_remoteConnection, "setExportedObject:", 0);
  -[AFUISceneHostingViewController invalidateSceneForReason:explanation:](self, "invalidateSceneForReason:explanation:", 5, v4);

}

- (void)_interrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s #xpcSiriApp %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke;
  v10[3] = &unk_24D7A1D40;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)AFUISiriRemoteSceneViewController;
  -[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:](&v9, sel_startHostingSceneForConfiguration_withCompletionBlock_, v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v7);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);

}

void __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WeakRetained[1136])
  {
    WeakRetained[1136] = 1;
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[AFUISiriRemoteSceneViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp resuming connection after startHostingSceneForConfiguration", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(v2, "resume");
  }

}

- (void)sceneController:(id)a3 willInvalidateScene:(id)a4 forReason:(unint64_t)a5
{
  if (a5 <= 5)
    self->_expectingInvalidation = 0x1010100uLL >> (8 * a5);
}

- (void)_handleInvalidationForReason:(unint64_t)a3 explanation:(id)a4
{
  id v6;
  id v7;
  id v8[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v7 = v6;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

void __78__AFUISiriRemoteSceneViewController__handleInvalidationForReason_explanation___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *((unsigned __int8 *)WeakRetained + 1152);
      v5 = *(_QWORD *)(a1 + 48);
      v6 = v3;
      +[AFUISceneConfiguration stringForInvalidationReason:](AFUISceneConfiguration, "stringForInvalidationReason:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 136315906;
      v12 = "-[AFUISiriRemoteSceneViewController _handleInvalidationForReason:explanation:]_block_invoke";
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp expectingInvalidation=%i reason=%@ explanation=%@", (uint8_t *)&v11, 0x26u);

    }
    objc_msgSend(WeakRetained[148], "invalidate");
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (*((_BYTE *)WeakRetained + 1152))
    {
      objc_msgSend(v9, "siriRemoteViewControllerDidFinishDismissing:", WeakRetained);
      *((_BYTE *)WeakRetained + 1152) = 0;
    }
    else
    {
      objc_msgSend(v9, "siriRemoteViewController:invalidatedForReason:explanation:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }

  }
}

- (void)_audioCategoriesDisablingVolumeHUDDidChangeTo:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray *audioCategoriesDisablingVolumeHUD;
  NSArray *v8;
  id v9;
  id location;

  v5 = (NSArray *)a3;
  v6 = v5;
  audioCategoriesDisablingVolumeHUD = self->_audioCategoriesDisablingVolumeHUD;
  if (v5 && audioCategoriesDisablingVolumeHUD)
  {
    if (-[NSArray isEqualToArray:](v5, "isEqualToArray:"))
      goto LABEL_7;
    goto LABEL_6;
  }
  if (audioCategoriesDisablingVolumeHUD != v5)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, a3);
    objc_initWeak(&location, self);
    objc_copyWeak(&v9, &location);
    v8 = v6;
    SiriUIInvokeOnMainQueue();

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
LABEL_7:

}

void __83__AFUISiriRemoteSceneViewController__audioCategoriesDisablingVolumeHUDDidChangeTo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "siriRemoteViewController:didUpdateAudioCategoriesDisablingVolumeHUD:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)_handleSceneDidActivateWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __75__AFUISiriRemoteSceneViewController__handleSceneDidActivateWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "siriRemoteViewController:sceneDidActivateWithIdentifier:", v5, *(_QWORD *)(a1 + 32));

      WeakRetained = v5;
    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriRemoteSceneViewController;
  -[AFUISiriRemoteSceneViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[AFUISiriRemoteSceneViewController viewDidAppear:]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s AFUIRemoteViewController's view did appear", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[AFUISiriRemoteSceneViewController viewDidDisappear:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)AFUISiriRemoteSceneViewController;
  -[AFUISiriRemoteSceneViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (id)sessionDelegate
{
  return -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_2);
}

void __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke_cold_1();

}

- (void)serviceRequestsActivationSourceWithReplyHandler:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(v6, "siriRemoteViewControllerRequestsActivationSource:", self));

  }
}

- (void)serviceRequestsDismissalWithUserInfo:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SASDismissalReasonGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[AFUISiriRemoteSceneViewController serviceRequestsDismissalWithUserInfo:withReason:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation %@", (uint8_t *)&v11, 0x16u);

  }
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissSiriRemoteViewController:userInfo:withReason:", self, v6, a4);

}

- (void)serviceStartGuidedAccess
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startGuidedAccessForRemoteViewController:", self);

}

- (void)serviceBulletinWithIdentifier:(id)a3 replyHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a4)
  {
    v7 = a4;
    v8 = a3;
    -[AFUISiriRemoteSceneViewController dataSource](self, "dataSource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriRemoteViewController:bulletinWithIdentifier:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))a4 + 2))(v7, v9);
  }
}

- (void)serviceStartRequestWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:startRequestWithOptions:", self, v4);

}

- (void)serviceUserRelevantEventDidOccur
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userRelevantEventDidOccurInSiriRemoteViewController:", self);

}

- (void)serviceDidRequestCurrentTextInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:didRequestCurrentTextInputWithReplyHandler:", self, v4);

}

- (void)siriIdleAndQuietStatusDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:siriIdleAndQuietStatusDidChange:", self, v3);

}

- (void)setStatusViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setStatusViewHidden:", self, v3);

}

- (void)setTypeToSiriViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setTypeToSiriViewHidden:", self, v3);

}

- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriRemoteViewController:setFullScreenDimmingLayerVisible:animated:", self, v5, v4);

}

- (void)inputTypeDidChange:(int64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:inputTypeDidChange:", self, a3);

}

- (void)setStatusViewDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setStatusViewDisabled:", self, v3);

}

- (void)setStatusViewUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setStatusViewUserInteractionEnabled:", self, v3);

}

- (void)serviceWillPresentViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:willPresentViewControllerWithStatusBarStyle:", self, a3);

}

- (void)serviceDidPresentViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:didPresentViewControllerWithStatusBarStyle:", self, a3);

}

- (void)serviceWillDismissViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:willDismissViewControllerWithStatusBarStyle:", self, a3);

}

- (void)serviceDidDismissViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:didDismissViewControllerWithStatusBarStyle:", self, a3);

}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriRemoteViewController:setStatusBarHidden:animated:", self, v5, v4);

}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriRemoteViewController:setStatusBarHidden:animated:completion:", self, v6, v5, v8);

}

- (void)setHelpButtonEmphasized:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setHelpButtonEmphasized:", self, v3);

}

- (void)setBugReportingAvailable:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setBugReportingAvailable:", self, v3);

}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:setRequestHandlingStatus:", self, a3);

}

- (void)getScreenshotWithReplyHandler:(id)a3
{
  void (**v3)(id, void *);
  const void *v4;
  void *v5;
  UIImage *v6;

  if (a3)
  {
    v3 = (void (**)(id, void *))a3;
    v4 = (const void *)UICreateScreenImage();
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", v4);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v5);

    if (v4)
      CFRelease(v4);

  }
}

- (void)handlePasscodeUnlockWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:handlePasscodeUnlockWithCompletion:", self, v4);

}

- (void)pulseHelpButton
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerPulseHelpButton:", self);

}

- (void)serviceDidRequestKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:didRequestKeyboard:", self, v3);

}

- (void)serviceDidRequestKeyboard:(BOOL)a3 minimized:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriRemoteViewController:didRequestKeyboard:minimized:", self, v5, v4);

}

- (void)serviceDidResetTextInput
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidResetTextInput:", self);

}

- (void)serviceViewControllerRequestsKeyboardWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:requestsKeyboardWithCompletion:", self, v4);

}

- (void)serviceWillBeginEditing
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerWillBeginEditing:", self);

}

- (void)serviceDidEndEditing
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidEndEditing:", self);

}

- (void)serviceRequestsHIDEventDefferal
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerRequestsHIDEventDefferal:", self);

}

- (void)serviceCancelHIDEventDefferal
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerCancelHIDEventDefferal:", self);

}

- (void)serviceDidEnterUITrackingMode
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidEnterUITrackingMode:", self);

}

- (void)serviceDidExitUITrackingMode
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidExitUITrackingMode:", self);

}

- (void)serviceDidPresentUserInterface
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidPresentUserInterface:", self);

}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openURL:bundleId:inPlace:completion:", v12, v11, v6, v10);

}

- (void)serviceDidDetectMicButtonTap
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidDetectMicButtonTap:", self);

}

- (void)serviceDidDetectMicButtonLongPressBegan
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidDetectMicButtonLongPressBegan:", self);

}

- (void)serviceDidDetectMicButtonLongPressEnded
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidDetectMicButtonLongPressEnded:", self);

}

- (void)servicePresentationDidChangePeekMode:(unint64_t)a3
{
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:didChangePresentationPeekMode:", self, a3);

}

- (void)servicePresentationDidChangeVisualState:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriRemoteViewController:didChangePresentationVisualState:", self, a3);

  }
}

- (void)serviceDidPresentConversationFromBreadcrumb
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidPresentConversationFromBreadcrumb:", self);

}

- (void)serviceDidDetectAudioRoutePickerTap
{
  id v3;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriRemoteViewControllerDidDetectAudioRoutePickerTap:", self);

}

- (void)serviceViewControllerRequestsPresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:requestsPresentation:", self, v4);

}

- (void)serviceViewControllerRequestsDismissalWithDismissalReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SASDismissalReasonGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[AFUISiriRemoteSceneViewController serviceViewControllerRequestsDismissalWithDismissalReason:completion:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v11, 0x16u);

  }
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siriRemoteViewController:requestsDismissalWithReason:withCompletion:", self, a3, v6);

}

- (void)servicePresentedIntentWithBundleId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:presentedIntentWithBundleId:", self, v4);

}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForTapOutsideContent:", v3);

  }
}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForTapsOutsideContent:", v3);

  }
}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForSwipesOutsideContent:", v3);

  }
}

- (void)requestHostBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  id v5;
  id v6;

  v6 = a5;
  v5 = v6;
  SiriUIInvokeOnMainQueue();

}

void __73__AFUISiriRemoteSceneViewController_requestHostBlurVisible_reason_fence___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestBlurVisible:reason:fence:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)reduceOrbOpacity:(BOOL)a3
{
  SiriUIInvokeOnMainQueue();
}

void __54__AFUISiriRemoteSceneViewController_reduceOrbOpacity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriRemoteViewController:reduceOrbOpacity:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldPassTouchesThroughToSpringBoard:", v3);

  }
}

- (void)requestSystemApertureCollapse
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSystemApertureCollapse");

  }
}

- (void)invalidateSystemApertureAssertion
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateSystemApertureAssertion");

  }
}

- (void)presentationDidPresentKeyboard
{
  AFUISiriRemoteSceneViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "siriRemoteViewControllerDidPresentKeyboard:", self);

  }
}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v10 = a3;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke;
  v17[3] = &unk_24D7A1E00;
  v18 = v10;
  v11 = v10;
  v12 = a6;
  v13 = a4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
    v16 = v12;
  else
    v16 = &__block_literal_global_162;
  objc_msgSend(v14, "updateToPresentationWithIdentifier:presentationProperties:animated:completion:", v11, v13, v7, v16);

}

void __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke_cold_1();

}

- (void)updateRemoteSceneWithFrontMostAppInterfaceOrientation:(int64_t)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_163);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostFrontMostAppOrientation:", a3);

}

void __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke_cold_1();

}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  void *v4;
  id v5;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_164);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostFrontMostAppOrientation:", objc_msgSend(v4, "_frontMostAppOrientation"));

  objc_msgSend(v5, "siriWillActivateFromSource:", a3);
}

void __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke_cold_1();

}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_166);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDidActivateFromSource:", a3);

}

void __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke_cold_1();

}

- (void)setRequestOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke;
  v7[3] = &unk_24D7A1E00;
  v8 = v4;
  v5 = v4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestOptions:", v5);

}

void __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke_cold_1();

}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke;
  v7[3] = &unk_24D7A1E00;
  v8 = v4;
  v5 = v4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preloadPresentationBundleWithIdentifier:", v5);

}

void __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke_cold_1();

}

- (void)preloadPluginBundles
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_167);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preloadPluginBundles");

}

void __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke_cold_1();

}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke;
  v12[3] = &unk_24D7A1E00;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showPresentationWithIdentifier:properties:lockState:", v10, v9, a5);

}

void __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke_cold_1();

}

- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke;
  v10[3] = &unk_24D7A1E00;
  v11 = v6;
  v7 = v6;
  v8 = a4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showAppUnlockForAppId:completion:", v7, v8);

}

void __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke_cold_1();

}

- (void)siriWillBePresented:(int64_t)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_168);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriWillBePresented:", a3);

}

void __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke_cold_1();

}

- (void)siriDidDeactivate
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke;
  v15[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v16, &location);
  v4 = (void *)MEMORY[0x219A0D984](v15);
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriRemoteViewControllerDidDeactivateScene:", self);

  }
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2;
  v13[3] = &unk_24D7A1D18;
  v8 = v4;
  v14 = v8;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHostFrontMostAppOrientation:", 0);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_173;
  v11[3] = &unk_24D7A1BA8;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "siriDidDeactivateWithCompletion:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(v2, "invalidateSceneForReason:explanation:", 1, CFSTR("Invalidating because [AFUISiriRemoteSceneViewController siriDidDeactivate]"));
    WeakRetained = v2;
  }

}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_174);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveOrbViewTapToCancelRequest");

}

void __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke_cold_1();

}

- (void)siriWillShowPasscodeUnlock
{
  -[AFUISiriRemoteSceneViewController siriWillShowPasscodeUnlockAndCancelRequest:](self, "siriWillShowPasscodeUnlockAndCancelRequest:", 1);
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_175);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriWillShowPasscodeUnlockAndCancelRequest:", v3);

}

void __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke_cold_1();

}

- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_176);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriWillHidePasscodeUnlockForResult:", a3);

}

void __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke_cold_1();

}

- (void)siriDidHidePasscodeUnlock
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_177);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriDidHidePasscodeUnlock");

}

void __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke_cold_1();

}

- (void)startRequestForText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_178);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startRequestForText:", v4);

}

void __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke_cold_1();

}

- (void)siriKeyboardViewDidChange:(id *)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_179);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriKeyboardViewDidChange:", a3);

}

void __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke_cold_1();

}

- (void)setStatusBarFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_180);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStatusBarFrameValue:", v7);

}

void __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke_cold_1();

}

- (void)setStatusViewHeight:(double)a3
{
  void *v4;
  id v5;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_182);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatusViewHeightNumber:", v4);

}

void __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke_cold_1();

}

- (void)setBottomContentInset:(double)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_184);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBottomContentInset:", a3);

}

void __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke_cold_1();

}

- (void)setSystemContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_185);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemContentFrame:", x, y, width, height);

}

void __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke_cold_1();

}

- (void)setSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_186);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSession:", v4);

}

void __48__AFUISiriRemoteSceneViewController_setSession___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __48__AFUISiriRemoteSceneViewController_setSession___block_invoke_cold_1();

}

- (void)didReceiveHelpAction
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_187);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveHelpAction");

}

void __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke_cold_1();

}

- (void)didReceiveReportBugAction
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_188);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveReportBugAction");

}

void __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke_cold_1();

}

- (void)didReceiveBugButtonLongPress
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_189);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveBugButtonLongPress");

}

void __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke_cold_1();

}

- (void)didReceiveShortTapActionWithRequestOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_190);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveShortTapActionWIthRequestOptions:", v4);

}

void __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke_cold_1();

}

- (void)applicationWillResignActive
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_191);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostApplicationWillResignActive");

}

void __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke_cold_1();

}

- (void)applicationWillEnterForeground
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_192);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostApplicationWillEnterForeground");

}

void __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke_cold_1();

}

- (void)applicationDidBecomeActive
{
  id v2;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_193);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostApplicationDidBecomeActive");

}

void __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke_cold_1();

}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_194);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWaitingForTelephonyToStart:", v3);

}

void __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke_cold_1();

}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[6];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke;
  v14[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  *(double *)&v14[4] = x;
  *(double *)&v14[5] = y;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_196;
  v12[3] = &unk_24D7A2188;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "hasContentAtPoint:completion:", v10, v12);

}

void __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_cold_1(a1, v2);
}

uint64_t __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  void *v6;
  _QWORD v7[6];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke;
  v7[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v7[4] = a3;
  v7[5] = a4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didDetectGestureEvent:inRegion:", a3, a4);

}

void __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke_cold_1(a1, v4, (uint64_t)v3);

}

- (void)orientationWillChangeTo:(int64_t)a3
{
  id v4;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_197);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orientationWillChangeTo:", a3);

}

void __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke_cold_1();

}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a3;
  v6 = a4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:", a3, v6);

}

void __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke_cold_1(a1, v4, a2);
}

- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  id v6;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_199);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostApplicationPresentationStateUpdatedFromPresentationState:toPresentationState:", a3, a4);

}

void __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke_cold_1();

}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  id v6;

  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_200);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animatedDisappearanceDidBeginWithDuration:reason:", a4, a3);

}

void __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke_cold_1();

}

- (void)serviceViewControllerWillChangeKeyboardVisibility:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AFUISiriRemoteSceneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriRemoteViewController:willChangeKeyboardVisibility:", self, v3);

}

- (void)emitUIStateTransitionForSiriDismissalWithDismissalReason:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  int v9;

  v4 = *(_QWORD *)&a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke;
  v8[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  v9 = a3;
  v6 = a4;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:completion:", v4, v6);

}

void __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_202);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostApplicationRequestsEmitInstrumentationEvent:", v4);

}

void __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke_cold_1();

}

- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_203);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostApplicationRequestsEmitInstrumentationEvent:atTime:", v6, a4);

}

void __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke_cold_1();

}

- (void)didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_204);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:", v4);

}

void __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke_cold_1();

}

- (void)takeScreenshotWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriRemoteSceneViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_205);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostApplicationRequestsScreenshotWithCompletion:", v4);

}

void __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke_cold_1();

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFUISiriRemoteSceneViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFUISiriRemoteSceneViewController dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriRemoteSceneViewController;
  -[AFUISiriRemoteSceneViewController dealloc](&v4, sel_dealloc);
}

- (AFUISiriRemoteSceneViewControllerDataSource)dataSource
{
  return (AFUISiriRemoteSceneViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (AFUISiriRemoteSceneViewControllerDelegate)delegate
{
  return (AFUISiriRemoteSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AFApplicationInfo)viewServiceApplicationInfo
{
  return self->_viewServiceApplicationInfo;
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remoteConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConnection, 0);
  objc_storeStrong((id *)&self->_viewServiceApplicationInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
}

void __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_217514000, v3, v5, "%s error talking to remote proxy: %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_6();
}

void __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to perform operation on session delegate: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Unable to update service view controller with new presentation identifier %@: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about updated frontMostAppOrientation: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about willActivate: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about didActivate: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Unable to set service view controller request options %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Unable to instruct service view controller to preloadPresentationBundleWithIdentifier: \"%{public}@\", error: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to instruct service view controller to preloadPluginBundles, error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Unable to instruct service view controller to show the presentation \"%{public}@\": %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_9(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Unable to instruct service view controller to show app unlock for appId \"%@\": %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about siriWillBePresented: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about didDeactivate: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about didReceiveOrbViewTapToCancelRequest: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about showing passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about will hide passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about did hide passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about starting text request: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Type2Siri: Unable to notify service view controller about keyboard info: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to set service view controller's status bar frame: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to set service view controller's status view height: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s #compact Unable to set service view controller's bottom content inset: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s #compact Unable to set service view controller's system content frame: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __48__AFUISiriRemoteSceneViewController_setSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to set session of service view controller: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to send help action: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to report bug: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to send bug button long press: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to send short tap action: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about hostApplicationWillResignActive: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about hostApplicationWillEnterForeground: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about hostApplicationDidBecomeActive: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about setWaitingForTelephonyToStart: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  CGFloat v2;
  CGFloat v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[6];
  uint64_t v8;
  CGPoint v9;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(double *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = a2;
  v9.x = v2;
  v9.y = v3;
  NSStringFromCGPoint(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_217514000, v4, v6, "%s Unable to check if there is content at point: %@", (uint8_t *)v7);

}

void __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  SiriSharedUIGestureEventDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SiriSharedUIGestureEventRegionDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315906;
  v8 = "-[AFUISiriRemoteSceneViewController didDetectGestureEvent:inRegion:]_block_invoke";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2114;
  v14 = a3;
  _os_log_error_impl(&dword_217514000, v4, OS_LOG_TYPE_ERROR, "%s #dismissal Unable to notify service view controller of gesture event %@ in region %@ with error: %{public}@", (uint8_t *)&v7, 0x2Au);

}

void __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to invalidate assertion for orientation if needed for this siri request: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[AFUISiriRemoteSceneViewController siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:]_block_invoke";
  v9 = 2048;
  v10 = v4;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_217514000, v5, OS_LOG_TYPE_ERROR, "%s Unable to notify service view controller about siriWillBeginTearDownForDismissalReason:%lu error:%@", (uint8_t *)&v7, 0x20u);

}

void __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about presentationStateUpdatedFromPresentationState:toPresentationState: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller of animatedDisappearanceDidBeginWithDuration: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[AFUISiriRemoteSceneViewController emitUIStateTransitionForSiriDismissalWithDismissalReason:completion:]_block_invoke";
  v6 = 1024;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_217514000, log, OS_LOG_TYPE_ERROR, "%s Unable to notify service view controller about emitUIStateTransitionForSiriDismissal:%d: %{public}@", (uint8_t *)&v4, 0x1Cu);
  OUTLINED_FUNCTION_6();
}

void __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about emitInstrumentationEvent: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about emitInstrumentationEvent: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about didSuccessfullyHandleCommandsInDelayedActionCommand : %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unable to notify service view controller about takeScreenshot: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end

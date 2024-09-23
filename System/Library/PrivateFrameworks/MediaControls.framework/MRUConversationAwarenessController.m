@implementation MRUConversationAwarenessController

- (BOOL)isConversationAwarenessSupported
{
  return self->_conversationAwarenessSupported;
}

- (MRUConversationAwarenessController)initWithOutputDeviceRouteController:(id)a3
{
  id v5;
  MRUConversationAwarenessController *v6;
  MRUConversationAwarenessController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUConversationAwarenessController;
  v6 = -[MRUConversationAwarenessController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    -[MRUSystemOutputDeviceRouteController addObserver:](v7->_outputDeviceRouteController, "addObserver:", v7);
    -[MRUConversationAwarenessController updateConversationAwarenessSupported](v7, "updateConversationAwarenessSupported");
    -[MRUConversationAwarenessController updateConversationAwarenessEnabled](v7, "updateConversationAwarenessEnabled");
  }

  return v7;
}

- (void)setConversationAwarenessEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_conversationAwarenessEnabled != v4)
  {
    self->_conversationAwarenessEnabled = v4;
    -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logicalLeaderOutputDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MCLogCategoryVolume();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v18 = objc_opt_class();
      v19 = 1024;
      v20 = v4;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection enabled changed: %{BOOL}u | device: %{public}@", buf, 0x1Cu);
    }

    objc_initWeak((id *)buf, self);
    -[MRUSystemOutputDeviceRouteController systemRoute](self->_outputDeviceRouteController, "systemRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "routeUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C80D38];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__MRUConversationAwarenessController_setConversationAwarenessEnabled_completion___block_invoke;
    v14[3] = &unk_1E5819AC8;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v6;
    objc_msgSend(v11, "setConversationDetectionEnabled:outputDeviceUID:queue:completion:", v4, v12, MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
}

void __81__MRUConversationAwarenessController_setConversationAwarenessEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(a2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "code");
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "updateConversationAwarenessEnabled");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3
{
  -[MRUConversationAwarenessController updateConversationAwarenessSupported](self, "updateConversationAwarenessSupported", a3);
  -[MRUConversationAwarenessController updateConversationAwarenessEnabled](self, "updateConversationAwarenessEnabled");
}

- (void)updateConversationAwarenessSupported
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute"))
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "supportsConversationDetection");
  if (self->_conversationAwarenessSupported != (_DWORD)v5)
  {
    self->_conversationAwarenessSupported = v5;
    MCLogCategoryVolume();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543874;
      v9 = objc_opt_class();
      v10 = 1024;
      v11 = v5;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection supported: %{BOOL}u | device: %{public}@", (uint8_t *)&v8, 0x1Cu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "conversationAwarenessController:didChangeConversationAwarenessSupported:", self, v5);

  }
}

- (void)updateConversationAwarenessEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConversationDetectionEnabled");
  if (self->_conversationAwarenessEnabled != (_DWORD)v5)
  {
    v6 = v5;
    self->_conversationAwarenessEnabled = v5;
    MCLogCategoryVolume();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543874;
      v10 = objc_opt_class();
      v11 = 1024;
      v12 = v6;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection enabled: %{BOOL}u | device: %{public}@", (uint8_t *)&v9, 0x1Cu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "conversationAwarenessController:didChangeConversationAwarenessEnabled:", self, v6);

  }
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUConversationAwarenessControllerDelegate)delegate
{
  return (MRUConversationAwarenessControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isConversationAwarenessEnabled
{
  return self->_conversationAwarenessEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end

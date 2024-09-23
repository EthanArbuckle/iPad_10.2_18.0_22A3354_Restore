@implementation RPBroadcastController

- (RPBroadcastController)init
{
  return -[RPBroadcastController initWithExtensionBundleID:broadcastURL:](self, "initWithExtensionBundleID:broadcastURL:", 0, 0);
}

- (RPBroadcastController)initWithExtensionBundleID:(id)a3 broadcastURL:(id)a4
{
  id v7;
  id v8;
  RPBroadcastController *v9;
  RPBroadcastController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPBroadcastController;
  v9 = -[RPBroadcastController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_broadcastExtensionBundleID, a3);
    +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBroadcastURL:", v8);

  }
  return v10;
}

- (RPBroadcastController)initWithCurrentSession
{
  RPBroadcastController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPBroadcastController;
  v2 = -[RPBroadcastController init](&v5, sel_init);
  if (v2)
  {
    +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActiveBroadcastController:", v2);

  }
  return v2;
}

- (BOOL)isBroadcasting
{
  void *v2;
  char v3;

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (NSURL)broadcastURL
{
  void *v2;
  void *v3;

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setBroadcastURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBroadcastURL:", v3);

}

- (void)startBroadcastWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = handler;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveBroadcastController:", self);

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__RPBroadcastController_startBroadcastWithHandler___block_invoke;
  v8[3] = &unk_24D15D9B8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startInAppBroadcastWithHandler:", v8);

}

uint64_t __51__RPBroadcastController_startBroadcastWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pauseBroadcast
{
  void *v3;
  id v4;

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveBroadcastController:", self);

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseInAppBroadcast");

}

- (void)resumeBroadcast
{
  void *v3;
  id v4;

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveBroadcastController:", self);

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeInAppBroadcast");

}

- (void)finishBroadcastWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = handler;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__RPBroadcastController_finishBroadcastWithHandler___block_invoke;
  v7[3] = &unk_24D15E328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopInAppBroadcastWithHandler:", v7);

}

void __52__RPBroadcastController_finishBroadcastWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveBroadcastController:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setServiceInfo:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)startSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveBroadcastController:", self);

  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__RPBroadcastController_startSystemBroadcastWithHandler___block_invoke;
  v8[3] = &unk_24D15D9B8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startSystemBroadcastWithHandler:", v8);

}

uint64_t __57__RPBroadcastController_startSystemBroadcastWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__RPBroadcastController_finishSystemBroadcastWithHandler___block_invoke;
  v7[3] = &unk_24D15E328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopSystemBroadcastWithHandler:", v7);

}

void __58__RPBroadcastController_finishSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveBroadcastController:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setServiceInfo:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (void)setServiceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serviceInfo, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSString)broadcastExtensionBundleID
{
  return self->_broadcastExtensionBundleID;
}

- (NSString)broadcastExtensionBundleIdentifier
{
  return self->_broadcastExtensionBundleIdentifier;
}

- (void)setBroadcastExtensionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastExtensionBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_broadcastExtensionBundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end

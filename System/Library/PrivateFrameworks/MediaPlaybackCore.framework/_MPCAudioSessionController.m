@implementation _MPCAudioSessionController

- (_MPCAudioSessionController)init
{
  _MPCAudioSessionController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MPCAudioSessionController;
  v2 = -[_MPCAudioSessionController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCAudioSessionController setAudioSession:](v2, "setAudioSession:", v3);

    -[_MPCAudioSessionController setupObservations](v2, "setupObservations");
  }
  return v2;
}

- (void)setupObservations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDB1608];
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47___MPCAudioSessionController_setupObservations__block_invoke;
  v14[3] = &unk_24CAB3FB0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, v4, 0, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController setLostObserver:](self, "setLostObserver:", v7);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDB1610];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __47___MPCAudioSessionController_setupObservations__block_invoke_2;
  v12[3] = &unk_24CAB3FB0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, v9, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController setResetObserver:](self, "setResetObserver:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setResetObserver:(id)a3
{
  objc_storeStrong(&self->_resetObserver, a3);
}

- (void)setLostObserver:(id)a3
{
  objc_storeStrong(&self->_lostObserver, a3);
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[_MPCAudioSessionController tearDownObservations](self, "tearDownObservations");
  v3.receiver = self;
  v3.super_class = (Class)_MPCAudioSessionController;
  -[_MPCAudioSessionController dealloc](&v3, sel_dealloc);
}

- (void)tearDownObservations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController lostObserver](self, "lostObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController resetObserver](self, "resetObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", v5);

}

- (id)resetObserver
{
  return self->_resetObserver;
}

- (id)lostObserver
{
  return self->_lostObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetObserver, 0);
  objc_storeStrong(&self->_lostObserver, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)updateAudioSession:(id)a3 options:(unint64_t)a4 routeSharingPolicy:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCategory:mode:routeSharingPolicy:options:error:", v8, *MEMORY[0x24BDB1618], a5, a4, 0);

}

- (void)snapshotSessionSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController setCategory:](self, "setCategory:", v4);

  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController setCategoryOptions:](self, "setCategoryOptions:", objc_msgSend(v5, "categoryOptions"));

  -[_MPCAudioSessionController audioSession](self, "audioSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController setRouteSharingPolicy:](self, "setRouteSharingPolicy:", objc_msgSend(v6, "routeSharingPolicy"));

}

- (void)restoreSessionSettingsFromSnapshot
{
  id v3;

  -[_MPCAudioSessionController category](self, "category");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPCAudioSessionController updateAudioSession:options:routeSharingPolicy:](self, "updateAudioSession:options:routeSharingPolicy:", v3, -[_MPCAudioSessionController categoryOptions](self, "categoryOptions"), -[_MPCAudioSessionController routeSharingPolicy](self, "routeSharingPolicy"));

}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  self->_category = (NSString *)a3;
}

- (unint64_t)categoryOptions
{
  return self->_categoryOptions;
}

- (void)setCategoryOptions:(unint64_t)a3
{
  self->_categoryOptions = a3;
}

- (unint64_t)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (void)setRouteSharingPolicy:(unint64_t)a3
{
  self->_routeSharingPolicy = a3;
}

@end

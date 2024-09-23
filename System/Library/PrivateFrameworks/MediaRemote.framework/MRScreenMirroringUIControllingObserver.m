@implementation MRScreenMirroringUIControllingObserver

- (MRScreenMirroringUIControllingObserver)init
{
  MRScreenMirroringUIControllingObserver *v2;
  uint64_t v3;
  MRScreenMirroringObserver *internalObserver;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MRScreenMirroringUIControllingObserver;
  v2 = -[MRScreenMirroringUIControllingObserver init](&v9, sel_init);
  if (v2)
  {
    objc_initWeak(location, v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__MRScreenMirroringUIControllingObserver_init__block_invoke;
    v7[3] = &unk_1E30C6850;
    objc_copyWeak(&v8, location);
    +[MRScreenMirroringObserver observerWithStateChangeCallback:](MRScreenMirroringObserver, "observerWithStateChangeCallback:", v7);
    v3 = objc_claimAutoreleasedReturnValue();
    internalObserver = v2->_internalObserver;
    v2->_internalObserver = (MRScreenMirroringObserver *)v3;

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  _MRLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 134217984;
    *(id *)((char *)location + 4) = v2;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] <%p> Initialized.", (uint8_t *)location, 0xCu);
  }

  return v2;
}

void __46__MRScreenMirroringUIControllingObserver_init__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__MRScreenMirroringUIControllingObserver_init__block_invoke_2;
    v7[3] = &unk_1E30C6828;
    v8 = v4;
    v9 = a2;
    MRMediaRemoteGetExternalScreenType(v6, v7);

  }
}

uint64_t __46__MRScreenMirroringUIControllingObserver_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mirrorStateChanged:screenType:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MRScreenMirroringUIControllingObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRScreenMirroringUIControllingObserver;
  -[MRScreenMirroringObserver dealloc](&v4, sel_dealloc);
}

- (void)_mirrorStateChanged:(BOOL)a3 screenType:(unsigned int)a4
{
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = v5;
    v13 = 1024;
    v14 = a4;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] Mirroring enabled: %{BOOL}u for screen type: %u", (uint8_t *)v12, 0xEu);
  }

  -[MRScreenMirroringUIControllingObserver uiController](self, "uiController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1 && v5)
  {
    if (!v8)
    {
      +[MRUIControllerProvider screenMirroringControllerWithDelegate:](MRUIControllerProvider, "screenMirroringControllerWithDelegate:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRScreenMirroringUIControllingObserver setUiController:](self, "setUiController:", v9);

      -[MRScreenMirroringUIControllingObserver uiController](self, "uiController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "acquireScreenMirroringQuickControlsAssertion");

    }
  }
  else if (v8)
  {
    -[MRScreenMirroringUIControllingObserver uiController](self, "uiController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "releaseScreenMirroringQuickControlsAssertion");

    -[MRScreenMirroringUIControllingObserver setUiController:](self, "setUiController:", 0);
  }
}

- (MRScreenMirroringQuickControlsUIControllable)uiController
{
  return self->_uiController;
}

- (void)setUiController:(id)a3
{
  objc_storeStrong((id *)&self->_uiController, a3);
}

- (MRScreenMirroringObserver)internalObserver
{
  return self->_internalObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalObserver, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
}

@end

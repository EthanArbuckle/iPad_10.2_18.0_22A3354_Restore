@implementation MKPlaceCardRemoteUIHostViewController

- (MKPlaceCardRemoteUIHostViewController)initWithSceneIdentifier:(id)a3 remoteObjectInterface:(id)a4 placeholderView:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKPlaceCardRemoteUIHostViewController *v12;
  MKPlaceCardRemoteUIHostViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  v12 = -[_EXHostViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v13->_remoteObjectInterface, a4);
    -[_EXHostViewController setDelegate:](v13, "setDelegate:", v13);
    -[_EXHostViewController setPlaceholderView:](v13, "setPlaceholderView:", v11);
    -[MKPlaceCardRemoteUIHostViewController _startSession](v13, "_startSession");
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[_EXHostViewController setSession:](self, "setSession:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  -[_EXHostViewController dealloc](&v3, sel_dealloc);
}

- (void)_startSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location[2];

  objc_msgSend(MEMORY[0x1E0CAA538], "mkRemoteUIIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(location, self);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA550]), "initWithExtensionIdentity:", v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA610]), "initWithSceneIdentifier:", self->_sceneIdentifier);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_69);
    v6 = (void *)MEMORY[0x1E0CAA608];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke_6;
    v8[3] = &unk_1E20DBF98;
    objc_copyWeak(&v9, location);
    objc_msgSend(v6, "sessionWithProcessConfiguration:configuration:completion:", v4, v5, v8);
    objc_destroyWeak(&v9);

    objc_destroyWeak(location);
  }
  else
  {
    MKGetMKRemoteUILog_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "host connection identity crisis", (uint8_t *)location, 2u);
    }

  }
}

void __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  MKGetMKRemoteUILog_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18B0B0000, v0, OS_LOG_TYPE_INFO, "host connection session invalidated", v1, 2u);
  }

}

void __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 132, a2);
    v13 = 0;
    objc_msgSend(v4, "_makeXPCConnectionWithError:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v8;
    if (!v7 || v8)
    {
      MKGetMKRemoteUILog_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "host connection error: %{public}@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v7, "setRemoteObjectInterface:", v6[130]);
      objc_storeStrong(v6 + 133, v7);
      MKGetMKRemoteUILog_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "host connection resume", buf, 2u);
      }

      objc_msgSend(v7, "resume");
      MKGetMKRemoteUILog_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_INFO, "host connection _configureConnection", buf, 2u);
      }

      objc_msgSend(v6, "_configureConnection:", v7);
      objc_msgSend(v6, "_resolvePreferredContentSizeIfNeeded");
    }

  }
}

- (void)_resolvePreferredContentSizeIfNeeded
{
  NSObject *v3;
  double preferredWidth;
  void *v5;
  double v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_preferredWidth > 0.0 && self->_connection)
  {
    MKGetMKRemoteUILog_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      preferredWidth = self->_preferredWidth;
      *(_DWORD *)buf = 134217984;
      v10 = preferredWidth;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "host connection resolve preferred content size %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_preferredWidth;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke;
    v7[3] = &unk_1E20DBFC0;
    objc_copyWeak(&v8, (id *)buf);
    objc_msgSend(v5, "fetchPreferredContentSizeForWidth:completionHandler:", v7, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke(uint64_t a1, double a2, double a3)
{
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9[3];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MKGetMKRemoteUILog_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&a2, *(_QWORD *)&a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "host connection content size completion %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke_8;
  block[3] = &unk_1E20D86F0;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)&a2;
  v9[2] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v9);
}

void __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "placeCardContentSizeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "placeCardContentSizeDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "placeCardPreferredContentSizeDidChange:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    }
    MKGetMKRemoteUILog_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "host set session", v8, 2u);
    }

    objc_msgSend(v3, "setSession:", v3[132]);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;
  CGRect v14;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  -[MKPlaceCardRemoteUIHostViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  MKGetMKRemoteUILog_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[MKPlaceCardRemoteUIHostViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "host view did appear %@", buf, 0xCu);

  }
  -[MKPlaceCardRemoteUIHostViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  self->_preferredWidth = CGRectGetWidth(v14);

  -[MKPlaceCardRemoteUIHostViewController _resolvePreferredContentSizeIfNeeded](self, "_resolvePreferredContentSizeIfNeeded");
}

- (void)hostViewControllerDidActivate:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  MKGetMKRemoteUILog_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "host VC did activate", v4, 2u);
  }

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  NSObject *v5;
  NSXPCConnection *connection;
  uint8_t v7[16];

  MKGetMKRemoteUILog_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "host connection invalidate: VC will deactivate", v7, 2u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)_configureConnection:(id)a3
{
  -[MKPlaceCardRemoteUIHostViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate
{
  return (MKPlaceCardContentSizeDelegate *)objc_loadWeakRetained((id *)&self->_placeCardContentSizeDelegate);
}

- (void)setPlaceCardContentSizeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardContentSizeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeCardContentSizeDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end

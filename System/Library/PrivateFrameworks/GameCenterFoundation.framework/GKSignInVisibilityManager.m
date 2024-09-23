@implementation GKSignInVisibilityManager

- (GKSignInVisibilityManager)initWithPersistence
{
  return -[GKSignInVisibilityManager initWithFullscreenDefaultsKey:bannerDefaultsKey:](self, "initWithFullscreenDefaultsKey:bannerDefaultsKey:", CFSTR("GKFullscreenSignInPresentationDataKey"), CFSTR("GKSignInBannerPresentationDataKey"));
}

- (GKSignInVisibilityManager)initWithoutPersistence
{
  return -[GKSignInVisibilityManager initWithFullscreenDefaultsKey:bannerDefaultsKey:](self, "initWithFullscreenDefaultsKey:bannerDefaultsKey:", 0, 0);
}

- (GKSignInVisibilityManager)initWithFullscreenDefaultsKey:(id)a3 bannerDefaultsKey:(id)a4
{
  id v6;
  id v7;
  GKSignInVisibilityManager *v8;
  GKLimitedPresentationManager *v9;
  GKLimitedPresentationManager *fullscreenManager;
  GKLimitedPresentationManager *v11;
  GKLimitedPresentationManager *bannerManager;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKSignInVisibilityManager;
  v8 = -[GKSignInVisibilityManager init](&v14, sel_init);
  if (v8)
  {
    v9 = -[GKLimitedPresentationManager initWithDefaultsKey:]([GKLimitedPresentationManager alloc], "initWithDefaultsKey:", v6);
    fullscreenManager = v8->_fullscreenManager;
    v8->_fullscreenManager = v9;

    v11 = -[GKLimitedPresentationManager initWithDefaultsKey:]([GKLimitedPresentationManager alloc], "initWithDefaultsKey:", v7);
    bannerManager = v8->_bannerManager;
    v8->_bannerManager = v11;

  }
  return v8;
}

- (void)promptsDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__GKSignInVisibilityManager_promptsDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E75B15F8;
  v9 = v6;
  v7 = v6;
  -[GKSignInVisibilityManager promptsDisabledWithConfig:scope:handler:](self, "promptsDisabledWithConfig:scope:handler:", a3, 0, v8);

}

uint64_t __63__GKSignInVisibilityManager_promptsDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptsDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke;
  v12[3] = &unk_1E75B1648;
  objc_copyWeak(v15, &location);
  v10 = v8;
  v13 = v10;
  v15[1] = (id)a4;
  v11 = v9;
  v14 = v11;
  -[GKSignInVisibilityManager loginDisabledWithConfig:scope:handler:](self, "loginDisabledWithConfig:scope:handler:", v10, a4, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke_2;
  v7[3] = &unk_1E75B1620;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  objc_msgSend(WeakRetained, "bannerDisabledWithConfig:scope:handler:", v6, v5, v7);

}

uint64_t __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)bannerDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__GKSignInVisibilityManager_bannerDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E75B1670;
  v9 = v6;
  v7 = v6;
  -[GKSignInVisibilityManager bannerDisabledWithConfig:scope:handler:](self, "bannerDisabledWithConfig:scope:handler:", a3, 0, v8);

}

uint64_t __62__GKSignInVisibilityManager_bannerDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)bannerDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  GKLimitedPresentationContext *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = -[GKLimitedPresentationContext initWithScope:elementType:]([GKLimitedPresentationContext alloc], "initWithScope:elementType:", a4, 1);
  -[GKSignInVisibilityManager bannerManager](self, "bannerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bannerConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__GKSignInVisibilityManager_bannerDisabledWithConfig_scope_handler___block_invoke;
  v14[3] = &unk_1E75B1670;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "presentationDisabledWithConfig:context:completionHandler:", v12, v10, v14);

}

uint64_t __68__GKSignInVisibilityManager_bannerDisabledWithConfig_scope_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loginDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__GKSignInVisibilityManager_loginDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E75B1670;
  v9 = v6;
  v7 = v6;
  -[GKSignInVisibilityManager loginDisabledWithConfig:scope:handler:](self, "loginDisabledWithConfig:scope:handler:", a3, 0, v8);

}

uint64_t __61__GKSignInVisibilityManager_loginDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loginDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  GKLimitedPresentationContext *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = -[GKLimitedPresentationContext initWithScope:elementType:]([GKLimitedPresentationContext alloc], "initWithScope:elementType:", a4, 2);
  -[GKSignInVisibilityManager fullscreenManager](self, "fullscreenManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sheetConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__GKSignInVisibilityManager_loginDisabledWithConfig_scope_handler___block_invoke;
  v14[3] = &unk_1E75B1670;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "presentationDisabledWithConfig:context:completionHandler:", v12, v10, v14);

}

uint64_t __67__GKSignInVisibilityManager_loginDisabledWithConfig_scope_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reset
{
  void *v3;
  id v4;

  -[GKSignInVisibilityManager bannerManager](self, "bannerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetWithCompletionHandler:", &__block_literal_global_3);

  -[GKSignInVisibilityManager fullscreenManager](self, "fullscreenManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetWithCompletionHandler:", &__block_literal_global_23);

}

- (void)didShowBanner
{
  id v2;

  -[GKSignInVisibilityManager bannerManager](self, "bannerManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPresentWithCompletionHandler:", &__block_literal_global_24);

}

- (void)didShowFullscreen
{
  id v2;

  -[GKSignInVisibilityManager fullscreenManager](self, "fullscreenManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPresentWithCompletionHandler:", &__block_literal_global_25);

}

- (GKLimitedPresentationManager)fullscreenManager
{
  return (GKLimitedPresentationManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFullscreenManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (GKLimitedPresentationManager)bannerManager
{
  return (GKLimitedPresentationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBannerManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_fullscreenManager, 0);
}

@end

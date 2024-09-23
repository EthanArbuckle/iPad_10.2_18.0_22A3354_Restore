@implementation GKNotificationBannerWindow

+ (id)bannerWindow
{
  id v2;

  objc_sync_enter(CFSTR("GKNotificationBannerSyncObject"));
  v2 = (id)sBannerWindow;
  objc_sync_exit(CFSTR("GKNotificationBannerSyncObject"));
  return v2;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKNotificationBannerWindow;
  return -[GKNotificationBannerWindow _canBecomeKeyWindow](&v3, sel__canBecomeKeyWindow);
}

- (GKNotificationBannerWindow)init
{
  void *v3;
  GKNotificationBannerWindow *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  GKNotificationBannerViewController *v14;
  GKNotificationBannerViewController *currentBannerViewController;
  void *v16;
  dispatch_semaphore_t v17;
  OS_dispatch_semaphore *bannerSemaphore;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  objc_super v26;

  if (GKApplicationLinkedOnOrAfter())
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26.receiver = self;
    v26.super_class = (Class)GKNotificationBannerWindow;
    v4 = (GKNotificationBannerWindow *)-[GKNotificationBannerWindow _initWithOrientation:](&v26, sel__initWithOrientation_, objc_msgSend(v3, "interfaceOrientation"));

    if (!v4)
      return v4;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)GKNotificationBannerWindow;
    v4 = -[GKNotificationBannerWindow init](&v25, sel_init);
    if (!v4)
      return v4;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[GKNotificationBannerWindow setFrame:](v4, "setFrame:", v7, v9, v11, v13);
  -[GKNotificationBannerWindow setOpaque:](v4, "setOpaque:", 0);
  -[GKNotificationBannerWindow setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
  -[GKNotificationBannerWindow setHidden:](v4, "setHidden:", 0);
  v14 = objc_alloc_init(GKNotificationBannerViewController);
  currentBannerViewController = v4->_currentBannerViewController;
  v4->_currentBannerViewController = v14;

  -[GKNotificationBannerWindow setRootViewController:](v4, "setRootViewController:", v4->_currentBannerViewController);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v4, sel_handlePan_);
  -[GKNotificationBannerWindow addGestureRecognizer:](v4, "addGestureRecognizer:", v16);

  v17 = dispatch_semaphore_create(1);
  bannerSemaphore = v4->_bannerSemaphore;
  v4->_bannerSemaphore = (OS_dispatch_semaphore *)v17;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_appAdoptsUISceneLifecycle");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "keyWindow");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNotificationBannerWindow setWindowScene:](v4, "setWindowScene:", v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNotificationBannerWindow setScreen:](v4, "setScreen:", v21);
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerWindow;
  -[GKNotificationBannerWindow dealloc](&v4, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "windowPointInside:withEvent:", v7, x, y);

  return v9;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowTouchesEnded:withEvent:", v7, v6);

}

- (void)handleSingleTap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleWindowSingleTap:", v4);

}

- (void)handlePan:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleWindowPan:", v4);

}

- (void)_showBanner:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBannerView:", v4);

  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showCurrentBanner");

}

- (void)_hideBanner:(id)a3 quickly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[GKNotificationBannerWindow currentBannerViewController](self, "currentBannerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideBannerQuickly:", v4);

}

- (BOOL)isSemaphoreValid
{
  OS_dispatch_semaphore *bannerSemaphore;
  OS_dispatch_semaphore *v4;
  OS_dispatch_semaphore *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];

  bannerSemaphore = self->_bannerSemaphore;
  if (!bannerSemaphore)
  {
    v4 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v5 = self->_bannerSemaphore;
    self->_bannerSemaphore = v4;

    v6 = (NSObject **)MEMORY[0x1E0D25460];
    v7 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v8 = (id)GKOSLoggers();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "Notification banner semaphore unexpectedly null. Recreating...", v10, 2u);
    }
    bannerSemaphore = self->_bannerSemaphore;
  }
  return bannerSemaphore != 0;
}

+ (id)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_30);
  return (id)queue_sQueue;
}

void __35__GKNotificationBannerWindow_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.GameKit.banner", v2);
  v1 = (void *)queue_sQueue;
  queue_sQueue = (uint64_t)v0;

}

+ (void)enqueBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke;
  v6[3] = &unk_1E59C6850;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke(uint64_t a1)
{
  GKNotificationBannerWindow *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  if (GKAtomicIncrement32() == 1)
  {
    objc_sync_enter(CFSTR("GKNotificationBannerSyncObject"));
    v2 = objc_alloc_init(GKNotificationBannerWindow);
    v3 = (void *)sBannerWindow;
    sBannerWindow = (uint64_t)v2;

    objc_sync_exit(CFSTR("GKNotificationBannerSyncObject"));
  }
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_2;
  block[3] = &unk_1E59C4148;
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  if (objc_msgSend((id)sBannerWindow, "isSemaphoreValid"))
  {
    objc_msgSend((id)sBannerWindow, "bannerSemaphore");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  }
  v3 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKNotificationBanner_iOS.m", 366, "+[GKNotificationBannerWindow enqueBanner:]_block_invoke_2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchGroupWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "playerAvatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_3;
    v11[3] = &unk_1E59C4A28;
    v12 = v6;
    objc_msgSend(v5, "perform:", v11);

  }
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_5;
  v9[3] = &unk_1E59C4148;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "notifyOnMainQueueWithBlock:", v9);

}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_4;
  v6[3] = &unk_1E59C4DA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "refreshImageWithCompletionHandler:", v6);

}

uint64_t __42__GKNotificationBannerWindow_enqueBanner___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__GKNotificationBannerWindow_enqueBanner___block_invoke_5(uint64_t a1)
{
  return objc_msgSend((id)sBannerWindow, "_showBanner:", *(_QWORD *)(a1 + 32));
}

- (GKNotificationBannerViewController)currentBannerViewController
{
  return self->_currentBannerViewController;
}

- (void)setCurrentBannerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentBannerViewController, a3);
}

- (OS_dispatch_semaphore)bannerSemaphore
{
  return self->_bannerSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBannerViewController, 0);
  objc_storeStrong((id *)&self->_bannerSemaphore, 0);
}

@end

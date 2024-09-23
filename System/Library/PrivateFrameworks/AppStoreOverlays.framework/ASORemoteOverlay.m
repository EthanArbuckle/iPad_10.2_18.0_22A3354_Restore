@implementation ASORemoteOverlay

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)log_log;
}

void __23__ASORemoteOverlay_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreOverlays", "ASORemoteOverlay");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (ASORemoteOverlay)initWithOverlay:(id)a3 contextProvider:(id)a4 hostSpan:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASORemoteOverlay *v12;
  ASORemoteOverlay *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASORemoteOverlay;
  v12 = -[ASORemoteOverlay init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_overlay, a3);
    objc_storeWeak((id *)&v13->_contextProvider, v10);
    objc_storeStrong((id *)&v13->_hostSpan, a5);
    *(_WORD *)&v13->_isLoaded = 256;
  }

  return v13;
}

- (void)finishWithError:(id)a3
{
  ASOOverlayTransitionContext *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  ASOOverlayTransitionContext *v19;
  id v20;

  v20 = a3;
  if (-[ASORemoteOverlay isActive](self, "isActive"))
  {
    if (-[ASORemoteOverlay isLoaded](self, "isLoaded"))
    {
      v4 = [ASOOverlayTransitionContext alloc];
      -[ASORemoteOverlay presentationTransitionContext](self, "presentationTransitionContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endFrameInternal");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[ASORemoteOverlay presentationTransitionContext](self, "presentationTransitionContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startFrameInternal");
      v19 = -[ASOOverlayTransitionContext initWithStartFrame:endFrame:](v4, "initWithStartFrame:endFrame:", v7, v9, v11, v13, v15, v16, v17, v18);

      -[ASORemoteOverlay remoteStoreOverlayWillStartDismissing:executeBlock:](self, "remoteStoreOverlayWillStartDismissing:executeBlock:", v19, &__block_literal_global_3);
      -[ASORemoteOverlay remoteStoreOverlayDidFinishDismissal:](self, "remoteStoreOverlayDidFinishDismissal:", v19);

    }
    else
    {
      -[ASORemoteOverlay remoteStoreOverlayDidFailToLoadWithError:](self, "remoteStoreOverlayDidFailToLoadWithError:", v20);
    }
    -[ASORemoteOverlay setIsActive:](self, "setIsActive:", 0);
  }

}

- (id)presentOverlayOperation
{
  return -[ASOPresentRemoteOverlayOperation initWithRemoteOverlay:]([ASOPresentRemoteOverlayOperation alloc], "initWithRemoteOverlay:", self);
}

+ (id)dismissOverlayOperationWithContextProvider:(id)a3
{
  id v3;
  ASODismissRemoteOverlayOperation *v4;

  v3 = a3;
  v4 = -[ASODismissRemoteOverlayOperation initWithContextProvider:]([ASODismissRemoteOverlayOperation alloc], "initWithContextProvider:", v3);

  return v4;
}

- (id)context
{
  void *v2;
  void *v3;

  -[ASORemoteOverlay contextProvider](self, "contextProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostContextForOverlayViewService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ASOOverlayConfiguration)overlayConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ASORemoteOverlay overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);

  -[ASORemoteOverlay hostSpan](self, "hostSpan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalValue:forKey:", v6, CFSTR("ASOOverlayConfigurationParameterHostSignpostSpan"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalValue:forKey:", v9, CFSTR("ASOOverlayConfigurationParameterHostIdiom"));

  return (ASOOverlayConfiguration *)v5;
}

- (void)remoteStoreOverlayDidFailToLoadWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[ASORemoteOverlay log](ASORemoteOverlay, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_DEFAULT, "Store overlay did fail to load with error: %@", buf, 0xCu);
  }

  -[ASORemoteOverlay setIsActive:](self, "setIsActive:", 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ASORemoteOverlay_remoteStoreOverlayDidFailToLoadWithError___block_invoke;
  v7[3] = &unk_24C7D7F08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __61__ASORemoteOverlay_remoteStoreOverlayDidFailToLoadWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFailToLoadWithError:", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeOverlay:didFailToLoadWithError:", v8, *(_QWORD *)(a1 + 40));

    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D888000, v9, OS_LOG_TYPE_INFO, "Delegate didFailToLoadWithError: returned", v10, 2u);
    }

  }
}

- (void)remoteStoreOverlayWillStartPresenting:(id)a3 executeBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ASORemoteOverlay setIsLoaded:](self, "setIsLoaded:", 1);
  -[ASORemoteOverlay setPresentationTransitionContext:](self, "setPresentationTransitionContext:", v6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke;
  block[3] = &unk_24C7D80A0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  objc_msgSend(a1[4], "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_INFO, "Calling delegate willStartPresentation:", buf, 2u);
    }

    objc_msgSend(a1[4], "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeOverlay:willStartPresentation:", v8, a1[5]);

    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v9, OS_LOG_TYPE_INFO, "Delegate willStartPresentation: returned", buf, 2u);
    }

  }
  objc_msgSend(a1[4], "contextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willStartPresentingOverlay:transitionContext:", a1[4], a1[5]);

  +[ASORemoteOverlay log](ASORemoteOverlay, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_cold_1(v11);

  objc_msgSend(a1[4], "contextProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteViewControllerForOverlayViewService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_13;
  v14[3] = &unk_24C7D8078;
  v16 = a1[6];
  v15 = a1[5];
  objc_msgSend(v13, "synchronizeAnimationsInActions:", v14);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint8_t buf[16];

  +[ASORemoteOverlay log](ASORemoteOverlay, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, v2, OS_LOG_TYPE_INFO, "Calling view service present execute block", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_15;
  v3[3] = &unk_24C7D7E08;
  v4 = *(id *)(a1 + 32);
  +[ASOOverlayAnimator performAnimations:completion:](ASOOverlayAnimator, "performAnimations:completion:", v3, 0);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_15(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "animationBlocks", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)remoteStoreOverlayDidFinishPresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[ASORemoteOverlay setPresentationTransitionContext:](self, "setPresentationTransitionContext:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__ASORemoteOverlay_remoteStoreOverlayDidFinishPresentation___block_invoke;
  v6[3] = &unk_24C7D7F08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __60__ASORemoteOverlay_remoteStoreOverlayDidFinishPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFinishPresentation:", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeOverlay:didFinishPresentation:", v8, *(_QWORD *)(a1 + 40));

    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D888000, v9, OS_LOG_TYPE_INFO, "Delegate didFinishPresentation: returned", v10, 2u);
    }

  }
}

- (void)remoteStoreOverlayWillStartDismissing:(id)a3 executeBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke;
  block[3] = &unk_24C7D80A0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  objc_msgSend(a1[4], "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_INFO, "Calling delegate willStartDismissal:", buf, 2u);
    }

    objc_msgSend(a1[4], "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeOverlay:willStartDismissal:", v8, a1[5]);

    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v9, OS_LOG_TYPE_INFO, "Delegate willStartDismissal: returned", buf, 2u);
    }

  }
  +[ASORemoteOverlay log](ASORemoteOverlay, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, v10, OS_LOG_TYPE_INFO, "Starting dismissal synchronized animations", buf, 2u);
  }

  objc_msgSend(a1[4], "contextProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteViewControllerForOverlayViewService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_20;
  v13[3] = &unk_24C7D8078;
  v15 = a1[6];
  v14 = a1[5];
  objc_msgSend(v12, "synchronizeAnimationsInActions:", v13);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint8_t buf[16];

  +[ASORemoteOverlay log](ASORemoteOverlay, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, v2, OS_LOG_TYPE_INFO, "Calling view service dismiss execute block", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_21;
  v3[3] = &unk_24C7D7E08;
  v4 = *(id *)(a1 + 32);
  +[ASOOverlayAnimator performAnimations:completion:](ASOOverlayAnimator, "performAnimations:completion:", v3, 0);

}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_21(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "animationBlocks", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)remoteStoreOverlayDidFinishDismissal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  ASORemoteOverlay *v11;
  id v12;

  v4 = a3;
  -[ASORemoteOverlay setIsActive:](self, "setIsActive:", 0);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __57__ASORemoteOverlay_remoteStoreOverlayDidFinishDismissal___block_invoke;
  v10 = &unk_24C7D7F08;
  v11 = self;
  v12 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], &v7);
  -[ASORemoteOverlay contextProvider](self, "contextProvider", v7, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didFinishDismissingOverlay:", self);

}

void __57__ASORemoteOverlay_remoteStoreOverlayDidFinishDismissal___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFinishDismissal:", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeOverlay:didFinishDismissal:", v8, *(_QWORD *)(a1 + 40));

    +[ASORemoteOverlay log](ASORemoteOverlay, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D888000, v9, OS_LOG_TYPE_INFO, "Delegate didFinishDismissal: returned", v10, 2u);
    }

  }
}

- (ASORemoteOverlayHost)contextProvider
{
  return (ASORemoteOverlayHost *)objc_loadWeakRetained((id *)&self->_contextProvider);
}

- (void)setContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_contextProvider, a3);
}

- (ASOOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (ASCSignpostSpan)hostSpan
{
  return self->_hostSpan;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (ASOOverlayTransitionContext)presentationTransitionContext
{
  return self->_presentationTransitionContext;
}

- (void)setPresentationTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTransitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationTransitionContext, 0);
  objc_storeStrong((id *)&self->_hostSpan, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_contextProvider);
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D888000, log, OS_LOG_TYPE_DEBUG, "Starting presentation synchronized animations", v1, 2u);
}

@end

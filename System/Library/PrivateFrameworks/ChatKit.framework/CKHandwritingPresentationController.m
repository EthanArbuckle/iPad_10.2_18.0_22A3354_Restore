@implementation CKHandwritingPresentationController

- (CKHandwritingPresentationController)init
{
  CKHandwritingPresentationController *v2;
  CKScheduledUpdater *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKHandwritingPresentationController;
  v2 = -[CKHandwritingPresentationController init](&v7, sel_init);
  if (v2)
  {
    v3 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v2, sel__updateVisibilityState);
    -[CKHandwritingPresentationController setAnimationScheduledUpdater:](v2, "setAnimationScheduledUpdater:", v3);

    -[CKHandwritingPresentationController animationScheduledUpdater](v2, "animationScheduledUpdater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUpdateSynchronouslyIfPossible:", 1);

    -[CKHandwritingPresentationController setForegrounded:](v2, "setForegrounded:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKHandwritingPresentationController animationScheduledUpdater](self, "animationScheduledUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)CKHandwritingPresentationController;
  -[CKHandwritingPresentationController dealloc](&v5, sel_dealloc);
}

- (void)setSendDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKHandwritingPresentationController setCachedSendDelegate:](self, "setCachedSendDelegate:", v4);
  -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSendDelegate:", v4);

}

- (void)setPluginPayload:(id)a3
{
  -[CKHandwritingPresentationController setCachedPluginPayload:](self, "setCachedPluginPayload:", a3);
  -[CKHandwritingPresentationController _loadCachedPayloadIntoBrowser](self, "_loadCachedPayloadIntoBrowser");
}

- (CKBrowserItemPayload)pluginPayload
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "supportsResumablePayload"))
      {
        objc_msgSend(v6, "resumablePayload");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    -[CKHandwritingPresentationController setCachedPluginPayload:](self, "setCachedPluginPayload:", v7);
  }
  else
  {
    -[CKHandwritingPresentationController cachedPluginPayload](self, "cachedPluginPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CKBrowserItemPayload *)v7;
}

- (void)setVisible:(BOOL)a3
{
  -[CKHandwritingPresentationController setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (-[CKHandwritingPresentationController requestedVisibility](self, "requestedVisibility") != a3)
  {
    -[CKHandwritingPresentationController setRequestedVisibility:](self, "setRequestedVisibility:", v5);
    -[CKHandwritingPresentationController setRequestedVisibilityShouldBeAnimated:](self, "setRequestedVisibilityShouldBeAnimated:", v4);
    -[CKHandwritingPresentationController animationScheduledUpdater](self, "animationScheduledUpdater");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsUpdate");

  }
}

- (NSString)pluginBundleID
{
  return (NSString *)(id)*MEMORY[0x1E0D375C0];
}

- (BOOL)isHandwritingLandscape
{
  void *v3;
  void *v4;
  int v5;

  -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  -[CKHandwritingPresentationController setForegrounded:](self, "setForegrounded:", 1);
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  -[CKHandwritingPresentationController setForegrounded:](self, "setForegrounded:", 0);
  -[CKHandwritingPresentationController _flushHandwritingWindowCacheIfNeeded](self, "_flushHandwritingWindowCacheIfNeeded");
}

- (void)_updateVisibilityState
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  _QWORD v42[6];
  _QWORD v43[5];
  _QWORD aBlock[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *(*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _OWORD v51[3];
  _QWORD v52[5];
  _QWORD v53[5];
  CGAffineTransform v54;
  CGAffineTransform v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  BOOL v59;

  v4 = -[CKHandwritingPresentationController requestedVisibility](self, "requestedVisibility");
  if (v4 != -[CKHandwritingPresentationController actualVisibility](self, "actualVisibility"))
  {
    v5 = -[CKHandwritingPresentationController requestedVisibility](self, "requestedVisibility");
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v59 = -[CKHandwritingPresentationController requestedVisibilityShouldBeAnimated](self, "requestedVisibilityShouldBeAnimated");
    if (!v5)
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x3032000000;
      v48 = __Block_byref_object_copy__67;
      v49 = __Block_byref_object_dispose__67;
      v50 = 0;
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_58;
      aBlock[3] = &unk_1E27590C0;
      aBlock[4] = self;
      aBlock[5] = &v56;
      v50 = _Block_copy(aBlock);
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "viewWillDisappear:", *((unsigned __int8 *)v57 + 24));

      -[CKHandwritingPresentationController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[CKHandwritingPresentationController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handwritingPresentationControllerWillHideHandwriting:", self);

      }
      if (*((_BYTE *)v57 + 24))
      {
        -[CKHandwritingPresentationController animationScheduledUpdater](self, "animationScheduledUpdater");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "beginHoldingUpdatesForKey:", CFSTR("UpdatingVisibility"));

        v43[1] = 3221225472;
        v43[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2_63;
        v43[3] = &unk_1E274A208;
        v43[4] = self;
        v42[0] = v19;
        v42[1] = 3221225472;
        v42[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_3;
        v42[3] = &unk_1E27590E8;
        v42[5] = &v45;
        v43[0] = v19;
        v42[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v43, v42, 0.25);
      }
      else
      {
        (*(void (**)(void))(v46[5] + 16))();
      }
      _Block_object_dispose(&v45, 8);

      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableInterfaceAutorotation:", 1);

    -[CKHandwritingPresentationController deviceOrientationManager](self, "deviceOrientationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKHandwritingPresentationController.m"), 161, CFSTR("Please set a device orientation manager on %@ before setting it to be visible"), self);

    }
    -[CKHandwritingPresentationController deviceOrientationManager](self, "deviceOrientationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginListeningForOrientationEventsWithKey:", CFSTR("HandwritingVisible"));

    -[CKHandwritingPresentationController _doInitialization](self, "_doInitialization");
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    if (!-[CKHandwritingPresentationController suppressAppearanceCallbacksBecauseOfFirstInitialization](self, "suppressAppearanceCallbacksBecauseOfFirstInitialization"))
    {
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewWillAppear:", *((unsigned __int8 *)v57 + 24));

    }
    -[CKHandwritingPresentationController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CKHandwritingPresentationController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handwritingPresentationControllerWillShowHandwriting:", self);

    }
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEatOrientationEvents:", 0);

    if (-[CKHandwritingPresentationController initialInterfaceOrientation](self, "initialInterfaceOrientation"))
    {
      v15 = -[CKHandwritingPresentationController initialInterfaceOrientation](self, "initialInterfaceOrientation");
      if (v15 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setOrientation:", 3);

        -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_updateInterfaceOrientationFromDeviceOrientation:", 0);

        -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEatOrientationEvents:", 1);
      }
      else
      {
        if (v15 != 4)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOrientation:", 4);

        -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_updateInterfaceOrientationFromDeviceOrientation:", 0);

        -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEatOrientationEvents:", 1);
      }

    }
LABEL_21:
    if (*((_BYTE *)v57 + 24))
    {
      -[CKHandwritingPresentationController animationScheduledUpdater](self, "animationScheduledUpdater");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "beginHoldingUpdatesForKey:", CFSTR("UpdatingVisibility"));

      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 0.0);

      CGAffineTransformMakeScale(&v55, 0.800000012, 0.800000012);
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v55;
      objc_msgSend(v31, "setTransform:", &v54);

      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke;
      v53[3] = &unk_1E274A208;
      v53[4] = self;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2;
      v52[3] = &unk_1E274A1B8;
      v52[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v53, v52, 0.25);
    }
    else
    {
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAlpha:", 1.0);

      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v51[0] = *MEMORY[0x1E0C9BAA8];
      v51[1] = v36;
      v51[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v35, "setTransform:", v51);

      -[CKHandwritingPresentationController setActualVisibility:](self, "setActualVisibility:", 1);
      if (-[CKHandwritingPresentationController suppressAppearanceCallbacksBecauseOfFirstInitialization](self, "suppressAppearanceCallbacksBecauseOfFirstInitialization"))
      {
        -[CKHandwritingPresentationController setSuppressAppearanceCallbacksBecauseOfFirstInitialization:](self, "setSuppressAppearanceCallbacksBecauseOfFirstInitialization:", 0);
      }
      else
      {
        -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "viewDidAppear:", 0);

      }
      -[CKHandwritingPresentationController delegate](self, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_opt_respondsToSelector();

      if ((v39 & 1) != 0)
      {
        -[CKHandwritingPresentationController delegate](self, "delegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handwritingPresentationControllerDidShowHandwriting:", self);

      }
    }
LABEL_28:
    _Block_object_dispose(&v56, 8);
  }
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "browserViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "browserViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "setTransform:", v7);

}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setActualVisibility:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "suppressAppearanceCallbacksBecauseOfFirstInitialization");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setSuppressAppearanceCallbacksBecauseOfFirstInitialization:", 0);
  }
  else
  {
    objc_msgSend(v3, "browserViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewDidAppear:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handwritingPresentationControllerDidShowHandwriting:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "animationScheduledUpdater");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endHoldingUpdatesForKey:", CFSTR("UpdatingVisibility"));

}

uint64_t __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_58(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "handwritingWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "browserViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidDisappear:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handwritingPresentationControllerDidHideHandwriting:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "deviceOrientationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endListeningForOrientationEventsWithKey:", CFSTR("HandwritingVisible"));

  objc_msgSend(*(id *)(a1 + 32), "setActualVisibility:", 0);
  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disableInterfaceAutorotation:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "_flushHandwritingWindowCacheIfNeeded");
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2_63(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(*(id *)(a1 + 32), "browserViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v7, 0.800000012, 0.800000012);
  objc_msgSend(*(id *)(a1 + 32), "browserViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v5, "setTransform:", &v6);

}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_3(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "animationScheduledUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingUpdatesForKey:", CFSTR("UpdatingVisibility"));

}

- (void)_flushHandwritingWindowCacheIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[CKHandwritingPresentationController foregrounded](self, "foregrounded")
    && !-[CKHandwritingPresentationController actualVisibility](self, "actualVisibility")
    && !-[CKHandwritingPresentationController requestedVisibility](self, "requestedVisibility"))
  {
    -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CKHandwritingPresentationController setBrowserViewController:](self, "setBrowserViewController:", 0);
      -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRootViewController:", 0);

    }
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[CKHandwritingPresentationController setHandwritingWindow:](self, "setHandwritingWindow:", 0);
  }
}

- (void)_doInitialization
{
  void *v3;
  CKHandwritingWindow *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CKHandwritingWindow *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CKHandwritingWindow alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = -[CKHandwritingWindow initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, v7);
    -[CKHandwritingPresentationController setHandwritingWindow:](self, "setHandwritingWindow:", v9);

    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLevel:", 1.79769313e308);

    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setWindowControlsStatusBarOrientation:", 0);

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScreen:", v12);

    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentationControllerWindowLevel");
    objc_msgSend(v14, "setWindowLevel:");

    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWindowScene:", v18);

  }
  -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKHandwritingPresentationController pluginBundleID](self, "pluginBundleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "balloonPluginForBundleID:", v21);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc((Class)objc_msgSend(v33, "browserClass"));
    -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
      v25 = objc_msgSend(v22, "initWithBalloonPlugin:dataSource:", v33, 0);
    else
      v25 = objc_msgSend(v22, "initWithBalloonPlugin:", v33);
    v26 = (void *)v25;
    -[CKHandwritingPresentationController setBrowserViewController:](self, "setBrowserViewController:", v25);
    -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rootViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28 != v29)
    {
      -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKHandwritingPresentationController handwritingWindow](self, "handwritingWindow");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setRootViewController:", v30);

      -[CKHandwritingPresentationController setSuppressAppearanceCallbacksBecauseOfFirstInitialization:](self, "setSuppressAppearanceCallbacksBecauseOfFirstInitialization:", 1);
    }
    -[CKHandwritingPresentationController _loadCachedPayloadIntoBrowser](self, "_loadCachedPayloadIntoBrowser");
    -[CKHandwritingPresentationController cachedSendDelegate](self, "cachedSendDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSendDelegate:", v32);

  }
}

- (void)_loadCachedPayloadIntoBrowser
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKHandwritingPresentationController browserViewController](self, "browserViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsResumablePayload"))
    {
      -[CKHandwritingPresentationController cachedPluginPayload](self, "cachedPluginPayload");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setResumablePayload:", v5);

    }
  }
}

- (CKHandwritingPresentationControllerDelegate)delegate
{
  return (CKHandwritingPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKDeviceOrientationManager)deviceOrientationManager
{
  return self->_deviceOrientationManager;
}

- (void)setDeviceOrientationManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOrientationManager, a3);
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (CKHandwritingWindow)handwritingWindow
{
  return self->_handwritingWindow;
}

- (void)setHandwritingWindow:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingWindow, a3);
}

- (CKHandwritingBrowserViewControllerProtocol)browserViewController
{
  return self->_browserViewController;
}

- (void)setBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_browserViewController, a3);
}

- (CKScheduledUpdater)animationScheduledUpdater
{
  return self->_animationScheduledUpdater;
}

- (void)setAnimationScheduledUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_animationScheduledUpdater, a3);
}

- (BOOL)requestedVisibility
{
  return self->_requestedVisibility;
}

- (void)setRequestedVisibility:(BOOL)a3
{
  self->_requestedVisibility = a3;
}

- (BOOL)actualVisibility
{
  return self->_actualVisibility;
}

- (void)setActualVisibility:(BOOL)a3
{
  self->_actualVisibility = a3;
}

- (BOOL)requestedVisibilityShouldBeAnimated
{
  return self->_requestedVisibilityShouldBeAnimated;
}

- (void)setRequestedVisibilityShouldBeAnimated:(BOOL)a3
{
  self->_requestedVisibilityShouldBeAnimated = a3;
}

- (CKHandwritingViewControllerSendDelegate)cachedSendDelegate
{
  return (CKHandwritingViewControllerSendDelegate *)objc_loadWeakRetained((id *)&self->_cachedSendDelegate);
}

- (void)setCachedSendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cachedSendDelegate, a3);
}

- (CKBrowserItemPayload)cachedPluginPayload
{
  return self->_cachedPluginPayload;
}

- (void)setCachedPluginPayload:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPluginPayload, a3);
}

- (BOOL)suppressAppearanceCallbacksBecauseOfFirstInitialization
{
  return self->_suppressAppearanceCallbacksBecauseOfFirstInitialization;
}

- (void)setSuppressAppearanceCallbacksBecauseOfFirstInitialization:(BOOL)a3
{
  self->_suppressAppearanceCallbacksBecauseOfFirstInitialization = a3;
}

- (BOOL)foregrounded
{
  return self->_foregrounded;
}

- (void)setForegrounded:(BOOL)a3
{
  self->_foregrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPluginPayload, 0);
  objc_destroyWeak((id *)&self->_cachedSendDelegate);
  objc_storeStrong((id *)&self->_animationScheduledUpdater, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_handwritingWindow, 0);
  objc_storeStrong((id *)&self->_deviceOrientationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation GKNotificationBannerViewController

- (BOOL)useShortBanner
{
  void *v2;
  char v3;

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useShortBanner");

  return v3;
}

- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GKNotificationBannerViewController view](self, "view", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "presentationLayer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hitTest:", x, y);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (void)windowTouchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GKNotificationBannerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v18, "layer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "presentationLayer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "hitTest:", v9, v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v18, "touchHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v18, "_wasTouched:", v24);
              -[GKNotificationBannerViewController hideBannerQuickly:](self, "hideBannerQuickly:", 0);
            }
          }
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

- (void)handleWindowSingleTap:(id)a3
{
  if (-[GKNotificationBannerViewController bannerVisible](self, "bannerVisible", a3))
    -[GKNotificationBannerViewController hideBannerQuickly:](self, "hideBannerQuickly:", 1);
}

- (void)handleWindowPan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if (-[GKNotificationBannerViewController bannerVisible](self, "bannerVisible"))
  {
    -[GKNotificationBannerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "translationInView:", v4);
    v6 = v5;

    if (v6 < 0.0)
      -[GKNotificationBannerViewController hideBannerQuickly:](self, "hideBannerQuickly:", 1);
  }

}

- (void)addBannerView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKNotificationBannerViewController setBannerYPositionConstraint:](self, "setBannerYPositionConstraint:", 0);
    -[GKNotificationBannerViewController setBannerWidthConstraint:](self, "setBannerWidthConstraint:", 0);
    -[GKNotificationBannerViewController bannerView](self, "bannerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[GKNotificationBannerViewController setBannerView:](self, "setBannerView:", 0);
  }
  -[GKNotificationBannerViewController setBannerView:](self, "setBannerView:", v8);
  -[GKNotificationBannerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[GKNotificationBannerViewController addConstraintsForBannerView](self, "addConstraintsForBannerView");
}

- (void)showCurrentBanner
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if ((v6 & 1) == 0)
  {
    -[GKNotificationBannerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3);

  }
  -[GKNotificationBannerViewController setBannerAnimating:](self, "setBannerAnimating:", 1);
  -[GKNotificationBannerViewController setBannerVisible:](self, "setBannerVisible:", 1);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke;
  aBlock[3] = &unk_1E59C4708;
  aBlock[4] = self;
  v9 = v3;
  v22 = v9;
  v10 = _Block_copy(aBlock);
  -[GKNotificationBannerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  v12 = (void *)MEMORY[0x1E0DC3F10];
  v18 = v10;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_3;
  v19[3] = &unk_1E59C4708;
  v19[4] = self;
  v20 = v9;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_4;
  v17[3] = &unk_1E59C4458;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 38, v19, v17, 0.3, 0.0);

  v15 = dispatch_time(0, 1000000000);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_5;
  v16[3] = &unk_1E59C4148;
  v16[4] = self;
  dispatch_after(v15, MEMORY[0x1E0C80D38], v16);

}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setBannerAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 40), "duration");
  v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_2;
  block[3] = &unk_1E59C4148;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "bannerVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "hideBannerQuickly:", 0);
  return result;
}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "_visibleBannerCenterPosition:", v3, v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "bannerYPositionConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

uint64_t __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__GKNotificationBannerViewController_showCurrentBanner__block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canTransitionToPlayerAvatar");

  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "transitionToPlayerAvatar");
  else
    objc_msgSend(v4, "setCanTransitionToPlayerAvatar:", 1);

}

- (void)hideBannerQuickly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;

  v3 = a3;
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController setBannerAnimating:](self, "setBannerAnimating:", 1);
  -[GKNotificationBannerViewController setBannerVisible:](self, "setBannerVisible:", 0);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke;
  aBlock[3] = &unk_1E59C4708;
  aBlock[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  -[GKNotificationBannerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  v10 = (void *)MEMORY[0x1E0DC3F10];
  if (v3)
    v11 = 0.1;
  else
    v11 = 0.3;
  v15 = v8;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_3;
  v16[3] = &unk_1E59C4708;
  v16[4] = self;
  v17 = v7;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_4;
  v14[3] = &unk_1E59C4458;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 38, v16, v14, v11, 0.0);

}

void __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setBannerAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 40), "callCompletionHandler");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setBannerView:", 0);
  v2 = dispatch_time(0, 500000000);
  dispatch_after(v2, MEMORY[0x1E0C80D38], &__block_literal_global_186);
}

uint64_t __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_2()
{
  void *v0;
  NSObject *v1;
  uint64_t result;
  void *v3;

  objc_msgSend((id)sBannerWindow, "bannerSemaphore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    objc_msgSend((id)sBannerWindow, "bannerSemaphore");
    v1 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v1);

  }
  result = GKAtomicDecrement32();
  if (!(_DWORD)result)
  {
    objc_sync_enter(CFSTR("GKNotificationBannerSyncObject"));
    v3 = (void *)sBannerWindow;
    sBannerWindow = 0;

    return objc_sync_exit(CFSTR("GKNotificationBannerSyncObject"));
  }
  return result;
}

void __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "_hiddenBannerPosition:", v3, v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "bannerYPositionConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

uint64_t __56__GKNotificationBannerViewController_hideBannerQuickly___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKNotificationBannerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v10)
  {

  }
  else
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "rootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "rootViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "supportedInterfaceOrientations");

      if (v14)
        goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v15, "supportedInterfaceOrientationsForWindow:", v8);

  if (!v14)
  {
LABEL_8:
    -[GKNotificationBannerViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom"))
      v14 = 30;
    else
      v14 = 26;
LABEL_11:

  }
  return v14;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[7];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKNotificationBannerViewController;
  -[GKNotificationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__GKNotificationBannerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E59C5870;
    v10[4] = self;
    *(double *)&v10[5] = width;
    *(double *)&v10[6] = height;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
  }

}

void __89__GKNotificationBannerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "bannerWidthConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bannerWidthForViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "bannerWidthConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConstant:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "bannerYPositionConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "bannerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "_hiddenBannerPosition:", v11, v12);
  v14 = v13;

  if (v8 != v14)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "bannerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "_visibleBannerCenterPosition:", v17, v18);
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 32), "bannerYPositionConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConstant:", v20);

  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutIfNeeded");

}

- (double)bannerWidthForViewSize:(CGSize)a3
{
  double width;
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  width = a3.width;
  v5 = -[GKNotificationBannerViewController useShortBanner](self, "useShortBanner", a3.width, a3.height);
  v6 = 30.0;
  if (v5)
    v6 = 15.0;
  v7 = width - v6;
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredBannerWidth");
  v10 = v9;

  if (v7 <= v10)
    return v7;
  else
    return v10;
}

- (void)addConstraintsForTVOSBannerView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  double v10;
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
  void *v22;
  void *v23;
  id v24;

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKNotificationBannerViewController useShortBanner](self, "useShortBanner"))
  {
    v6 = 0x4044000000000000;
LABEL_10:
    v10 = *(double *)&v6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 1 || (*MEMORY[0x1E0D253F8] ? (v9 = *MEMORY[0x1E0D25B68] == 0) : (v9 = 0), v9))
  {
    v6 = 0x4050000000000000;
    goto LABEL_10;
  }
  v10 = 66.0;
LABEL_11:
  objc_msgSend(v5, "constraintEqualToConstant:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 640.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[GKNotificationBannerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[GKNotificationBannerViewController view](self, "view");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

}

- (void)addConstraintsForBannerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if ((GKApplicationLinkedOnOrAfter() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "statusBarOrientation") - 3;

    if (v9 >= 2)
      v10 = v7;
    else
      v10 = v5;
    if (v9 < 2)
      v5 = v7;
    v7 = v10;
  }
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKNotificationBannerViewController bannerWidthForViewSize:](self, "bannerWidthForViewSize:", v5, v7);
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, 0, 0, 1.0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController setBannerWidthConstraint:](self, "setBannerWidthConstraint:", v16);

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController bannerWidthConstraint](self, "bannerWidthConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraint:", v18);

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3718];
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKNotificationBannerViewController useShortBanner](self, "useShortBanner"))
  {
    *(double *)&v22 = 40.0;
LABEL_14:
    v25 = *(double *)&v22;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if (v24 != 1 || (v25 = 66.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
  {
    *(double *)&v22 = 64.0;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 8, 0, 0, 0, 1.0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v26);

  -[GKNotificationBannerViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3718];
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 9, 0, v30, 9, 1.0, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraint:", v31);

  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  -[GKNotificationBannerViewController _hiddenBannerPosition:](self, "_hiddenBannerPosition:", v33, v34);
  v36 = v35;

  v37 = (void *)MEMORY[0x1E0CB3718];
  -[GKNotificationBannerViewController bannerView](self, "bannerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 10, 0, v39, 3, 1.0, v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController setBannerYPositionConstraint:](self, "setBannerYPositionConstraint:", v40);

  -[GKNotificationBannerViewController view](self, "view");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerViewController bannerYPositionConstraint](self, "bannerYPositionConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addConstraint:", v41);

}

- (CGPoint)_hiddenBannerPosition:(CGSize)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat MidX;
  double MinY;
  BOOL v15;
  double v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  double v20;
  double v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[GKNotificationBannerViewController view](self, "view", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  MinY = CGRectGetMinY(v24);
  v15 = -[GKNotificationBannerViewController useShortBanner](self, "useShortBanner");
  v16 = 20.0;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if (v18 != 1 || (*MEMORY[0x1E0D253F8] ? (v19 = *MEMORY[0x1E0D25B68] == 0) : (v19 = 0), v19))
      v16 = 32.0;
    else
      v16 = 33.0;
  }
  v20 = MinY - floor(v16);
  v21 = MidX;
  result.y = v20;
  result.x = v21;
  return result;
}

- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  CGFloat MidX;
  double MinY;
  double v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  double v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  double v26;
  double v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;

  -[GKNotificationBannerViewController view](self, "view", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[GKNotificationBannerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  v15 = v14;

  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  MinY = CGRectGetMinY(v30);
  v18 = 20.0;
  if (!-[GKNotificationBannerViewController useShortBanner](self, "useShortBanner"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if (v20 != 1 || (v18 = 33.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      v18 = 32.0;
  }
  v21 = -[GKNotificationBannerViewController useShortBanner](self, "useShortBanner");
  v22 = 21.0;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 21.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    v22 = 8.0;
    if (v24 == 1)
    {
      if (*MEMORY[0x1E0D25B68])
        v25 = 1;
      else
        v25 = *MEMORY[0x1E0D253F8] == 0;
      if (v25)
        v22 = 16.0;
    }
  }
  v26 = v15 + MinY + floor(v18) + v22;
  v27 = MidX;
  result.y = v26;
  result.x = v27;
  return result;
}

- (GKNotificationBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (BOOL)bannerVisible
{
  return self->_bannerVisible;
}

- (void)setBannerVisible:(BOOL)a3
{
  self->_bannerVisible = a3;
}

- (BOOL)bannerAnimating
{
  return self->_bannerAnimating;
}

- (void)setBannerAnimating:(BOOL)a3
{
  self->_bannerAnimating = a3;
}

- (NSLayoutConstraint)bannerYPositionConstraint
{
  return self->_bannerYPositionConstraint;
}

- (void)setBannerYPositionConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, a3);
}

- (NSLayoutConstraint)bannerWidthConstraint
{
  return self->_bannerWidthConstraint;
}

- (void)setBannerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end

@implementation GKNotificationBanner

+ (BOOL)isWelcomeOrSignInBannerEnqueued
{
  char v2;

  objc_sync_enter(CFSTR("GKNotificationBannerSyncObject"));
  v2 = _isWelcomeOrSignInBannerEnqueued;
  objc_sync_exit(CFSTR("GKNotificationBannerSyncObject"));
  return v2;
}

+ (void)setIsWelcomeOrSignInBannerEnqueued:(BOOL)a3
{
  objc_sync_enter(CFSTR("GKNotificationBannerSyncObject"));
  _isWelcomeOrSignInBannerEnqueued = a3;
  objc_sync_exit(CFSTR("GKNotificationBannerSyncObject"));
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:actionMessage:shortBanner:", v12, v11, v10, v9, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:actionMessage:shortBanner:", v15, v14, v13, v12, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7 shortBanner:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  GKNotificationBannerView *v18;
  GKNotificationBannerView *v19;
  GKNotificationBannerView *v20;
  GKNotificationBannerView *v21;
  void *v23;
  void *v24;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    v18 = -[GKNotificationBannerView initWithTitle:image:message:useShortBanner:]([GKNotificationBannerView alloc], "initWithTitle:image:message:useShortBanner:", v13, v14, v16, v8);
  }
  else
  {
    v19 = [GKNotificationBannerView alloc];
    v20 = v19;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "eventIconImage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[GKNotificationBannerView initWithTitle:image:message:useShortBanner:](v20, "initWithTitle:image:message:useShortBanner:", v13, v24, v16, v8);

      goto LABEL_6;
    }
    v18 = -[GKNotificationBannerView initWithTitle:player:leadingAccessoryView:message:useShortBanner:](v19, "initWithTitle:player:leadingAccessoryView:message:useShortBanner:", v13, v15, 0, v16, v8);
  }
  v21 = v18;
LABEL_6:

  return v21;
}

+ (void)showWelcomeBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:actionMessage:shortBanner:", v12, 0, 0, v11, 0, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTouchHandler:", v10);
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.GKNotificationBannerView.WelcomeBanner"));
  objc_msgSend(v13, "showPlayerAvatarAnimationWithCompletionHandler:", v9);

}

+ (void)showBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v12, 0, 0, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTouchHandler:", v10);
  objc_msgSend(v13, "showWithCompletionHandler:", v9);

}

+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message completionHandler:(void *)completionHandler
{
  void *v7;
  NSString *v8;
  NSString *v9;
  id v10;

  v7 = completionHandler;
  v8 = message;
  v9 = title;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v9, 0, 0, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "showWithCompletionHandler:", v7);
}

+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler
{
  void *v9;
  NSString *v10;
  NSString *v11;
  id v12;

  v9 = completionHandler;
  v10 = message;
  v11 = title;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v11, 0, 0, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDuration:", duration);
  objc_msgSend(v12, "showWithCompletionHandler:", v9);

}

+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v12, v11, 0, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "showWithCompletionHandler:", v9);
}

+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v12, v11, 0, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "showWithTouchHandler:", v9);
}

+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v12, 0, v11, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "showWithCompletionHandler:", v9);
}

+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:", v12, 0, v11, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "showWithTouchHandler:", v9);
}

+ (BOOL)isBannerVisible
{
  void *v2;
  void *v3;
  char v4;

  +[GKNotificationBannerWindow bannerWindow](GKNotificationBannerWindow, "bannerWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentBannerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bannerVisible");

  return v4;
}

+ (id)bannerViewWithTitle:(id)a3 message:(id)a4 actionMessage:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "bannerViewWithTitle:image:player:message:actionMessage:", v9, 0, 0, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)showAchievementBannerWithTitle:(id)a3 achievementImage:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC12GameCenterUI35AchievementBannerImageContainerView *v12;
  GKNotificationBannerView *v13;
  id v14;

  v14 = a4;
  v9 = a6;
  if (v14)
  {
    v10 = a5;
    v11 = a3;
    v12 = -[AchievementBannerImageContainerView initWithAchievementImage:]([_TtC12GameCenterUI35AchievementBannerImageContainerView alloc], "initWithAchievementImage:", v14);
    v13 = -[GKNotificationBannerView initWithTitle:player:leadingAccessoryView:message:useShortBanner:]([GKNotificationBannerView alloc], "initWithTitle:player:leadingAccessoryView:message:useShortBanner:", v11, 0, v12, v10, 0);

    -[GKNotificationBannerView showWithTouchHandler:](v13, "showWithTouchHandler:", v9);
  }
  else
  {
    v13 = (GKNotificationBannerView *)a5;
    v12 = (_TtC12GameCenterUI35AchievementBannerImageContainerView *)a3;
    objc_msgSend((id)objc_opt_class(), "showBannerWithTitle:image:message:touchHandler:", v12, 0, v13, v9);
  }

}

@end

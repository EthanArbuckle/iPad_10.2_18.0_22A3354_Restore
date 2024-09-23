@implementation CNVisualIdentityAvatarViewController

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3
{
  return -[CNVisualIdentityAvatarViewController initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:](self, "initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:", a3, 0, 0);
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4
{
  return -[CNVisualIdentityAvatarViewController initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:](self, "initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:", a3, a4, 0);
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNVisualIdentityAvatarViewController *v12;
  CNVisualIdentityAvatarViewController *v13;
  CNVisualIdentityContactAvatarProvider *v14;
  CNVisualIdentityContactAvatarProvider *avatarProvider;
  CNVisualIdentityAvatarLayoutManager *v16;
  CNVisualIdentityAvatarLayoutManager *avatarLayoutManager;
  void *v18;
  void *v19;
  uint64_t v20;
  CNScheduler *renderingQueue;
  uint64_t v22;
  CNScheduler *callbackQueue;
  CNVisualIdentityAvatarViewController *v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNVisualIdentityAvatarViewController;
  v12 = -[CNVisualIdentityAvatarViewController init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_visualIdentity, a3);
    v14 = -[CNVisualIdentityContactAvatarProvider initWithSettings:]([CNVisualIdentityContactAvatarProvider alloc], "initWithSettings:", v11);
    avatarProvider = v13->_avatarProvider;
    v13->_avatarProvider = v14;

    v16 = objc_alloc_init(CNVisualIdentityAvatarLayoutManager);
    avatarLayoutManager = v13->_avatarLayoutManager;
    v13->_avatarLayoutManager = v16;

    objc_storeStrong((id *)&v13->_primaryAvatarProvider, a4);
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultSchedulerProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "newSerialSchedulerWithName:", CFSTR("com.apple.contactsui.visualIdentityAvatarView.renderingQueue"));
    renderingQueue = v13->_renderingQueue;
    v13->_renderingQueue = (CNScheduler *)v20;

    objc_msgSend(v19, "mainThreadScheduler");
    v22 = objc_claimAutoreleasedReturnValue();
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (CNScheduler *)v22;

    v24 = v13;
  }

  return v13;
}

- (CNVisualIdentityAvatarViewController)initWithVisualIdentity:(id)a3 primaryAvatarProvider:(id)a4 avatarImageRendererSettings:(id)a5 avatarLayoutType:(unint64_t)a6
{
  CNVisualIdentityAvatarViewController *v7;
  CNVisualIdentityAvatarLayoutManager *v8;
  CNVisualIdentityAvatarLayoutManager *avatarLayoutManager;
  CNVisualIdentityAvatarViewController *v10;

  v7 = -[CNVisualIdentityAvatarViewController initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:](self, "initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:", a3, a4, a5);
  if (v7)
  {
    v8 = -[CNVisualIdentityAvatarLayoutManager initWithLayoutType:]([CNVisualIdentityAvatarLayoutManager alloc], "initWithLayoutType:", a6);
    avatarLayoutManager = v7->_avatarLayoutManager;
    v7->_avatarLayoutManager = v8;

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactChangesNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:forContact:", self, 0);

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityAvatarViewController;
  -[CNVisualIdentityAvatarViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  CNVisualIdentityAvatarContainerView *v3;
  void *v4;
  CNVisualIdentityAvatarContainerView *v5;

  v3 = [CNVisualIdentityAvatarContainerView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CNVisualIdentityAvatarContainerView initWithFrame:](v3, "initWithFrame:");

  -[CNVisualIdentityAvatarContainerView setDelegate:](v5, "setDelegate:", self);
  -[CNVisualIdentityAvatarViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNVisualIdentityAvatarViewController;
  -[CNVisualIdentityAvatarViewController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CNVisualIdentityAvatarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[CNVisualIdentityAvatarViewController setContentView:](self, "setContentView:", v5);

  -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[CNVisualIdentityAvatarViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[CNVisualIdentityAvatarViewController updateContactChangesNotifierRegistration](self, "updateContactChangesNotifierRegistration");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v11;
  int64_t v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  int64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CNVisualIdentityAvatarViewController;
  -[CNVisualIdentityAvatarViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[CNVisualIdentityAvatarViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[CNVisualIdentityAvatarViewController previousSize](self, "previousSize");
  if (v9 == v5 && v8 == v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
      -[CNVisualIdentityAvatarViewController containingCellView](self, "containingCellView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_debug_impl(&dword_18AC56000, v11, OS_LOG_TYPE_DEBUG, "Skipping layout - no change in view size, itemCount:%lu, containingCell:%{public}@", buf, 0x16u);

    }
    -[CNVisualIdentityAvatarViewController logSublayersContent](self, "logSublayersContent");
  }
  else
  {
    -[CNVisualIdentityAvatarViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
    -[CNVisualIdentityAvatarViewController layoutAvatars](self, "layoutAvatars");
    if (-[CNVisualIdentityAvatarViewController shouldUseBadgeButton](self, "shouldUseBadgeButton"))
    {
      -[CNVisualIdentityAvatarViewController updateBadgeButtonFrame](self, "updateBadgeButtonFrame");
    }
    else
    {
      -[CNVisualIdentityAvatarViewController updateBadgeViewFrame](self, "updateBadgeViewFrame");
      -[CNVisualIdentityAvatarViewController updateBadgeStyling](self, "updateBadgeStyling");
      -[CNVisualIdentityAvatarViewController updateMediaContextBadgeFrame](self, "updateMediaContextBadgeFrame");
    }
  }
}

- (BOOL)shouldUseBadgeButton
{
  return 0;
}

- (void)removeAllSublayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarLayerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "avatarLayerItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperlayer");

      ++v8;
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "avatarLayerItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v8 < v15);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setBadgeStyleSettings:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[CNBadgingAvatarBadgeStyleSettings isEqual:](self->_badgeStyleSettings, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
    -[CNVisualIdentityAvatarViewController badgeImage](self, "badgeImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[CNVisualIdentityAvatarViewController updateBadgeStyling](self, "updateBadgeStyling");
  }

}

- (void)updateBadgeStyling
{
  -[CNVisualIdentityAvatarViewController updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
  -[CNVisualIdentityAvatarViewController updateBadgeTintColor](self, "updateBadgeTintColor");
  -[CNVisualIdentityAvatarViewController updateBadgeCropStyle](self, "updateBadgeCropStyle");
  -[CNVisualIdentityAvatarViewController updateBadgeImageViewBackgroundColor](self, "updateBadgeImageViewBackgroundColor");
  -[CNVisualIdentityAvatarViewController updateBadgeImageViewContentMode](self, "updateBadgeImageViewContentMode");
}

- (void)updateBadgeTintColor
{
  void *v3;
  void *v4;
  id v5;

  -[CNVisualIdentityAvatarViewController badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)updateBadgeCropStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D13C80];
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropAvatarBadgeLayer:withCropStyle:", v4, objc_msgSend(v5, "cropStyle"));

}

- (void)updateBadgeImageViewBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNVisualIdentityAvatarViewController badgeImage](self, "badgeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNVisualIdentityAvatarViewController badgeStyleSettings](self, "badgeStyleSettings");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v6);
  }

}

- (void)updateBadgeImageViewContentMode
{
  uint64_t v3;
  void *v4;
  id v5;

  -[CNVisualIdentityAvatarViewController badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "contentMode");
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", v3);

}

- (void)updateBadgeImageViewPosition
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;

  -[CNVisualIdentityAvatarViewController view](self, "view");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "effectiveUserInterfaceLayoutDirection");

  LOBYTE(v4) = -[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage");
  -[CNVisualIdentityAvatarViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController avatarFrameForFocusedAvatarInView:](self, "avatarFrameForFocusedAvatarInView:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if ((v4 & 1) == 0 && -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount") >= 2)
  {
    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adHocAvatarFrameInView:forItemCount:", v16, -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount"));
    v8 = v17;
    v12 = v18;

  }
  v19 = (void *)MEMORY[0x1E0D13C80];
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CNVisualIdentityAvatarViewController badgeStyleSettings](self, "badgeStyleSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "cnuiBadgePosition");
  -[CNVisualIdentityAvatarViewController mediaContextBadge](self, "mediaContextBadge");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "frame");
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D648];
    v32 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v33 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v34 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(v19, "frameForBadgeWithFrame:onAvatarFrame:withPosition:mediaContextFrame:isRTL:", v29, v5 == 1, v21, v23, v25, v27, v8, v10, v12, v14, v31, v32, v33, v34);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

  if (v30)
}

- (void)setBadgeImage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    -[CNVisualIdentityAvatarViewController setBadgeViewImage:](self, "setBadgeViewImage:");
    -[CNVisualIdentityAvatarViewController updateBadgeImageViewBackgroundColor](self, "updateBadgeImageViewBackgroundColor");
  }
  else
  {
    -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (void)setBadgeViewImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[CNVisualIdentityAvatarViewController setBadgeImageView:](self, "setBadgeImageView:", v6);

    -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

  }
  -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityAvatarViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:aboveSubview:", v10, v11);

  }
  else
  {
    objc_msgSend(v9, "addSubview:", v10);
  }

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v4);

  -[CNVisualIdentityAvatarViewController updateBadgeViewFrame](self, "updateBadgeViewFrame");
}

- (void)setBadgeTarget:(id)a3 action:(SEL)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0DC3D80];
  v7 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithTarget:action:", v7, a4);

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", v10);

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

  -[CNVisualIdentityAvatarViewController setBadgeTapGestureRecognizer:](self, "setBadgeTapGestureRecognizer:", v10);
}

- (void)removeBadgeTapGestureRecognizer
{
  void *v3;
  void *v4;

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController badgeTapGestureRecognizer](self, "badgeTapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  -[CNVisualIdentityAvatarViewController setBadgeTapGestureRecognizer:](self, "setBadgeTapGestureRecognizer:", 0);
}

- (void)updateBadgeViewFrame
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  -[CNVisualIdentityAvatarViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection") == 1;

  v5 = (void *)MEMORY[0x1E0D13C80];
  -[CNVisualIdentityAvatarViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController avatarFrameForFocusedAvatarInView:](self, "avatarFrameForFocusedAvatarInView:", v6);
  objc_msgSend(v5, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 1, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[CNVisualIdentityAvatarViewController updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
}

- (UIImage)badgeImage
{
  void *v2;
  void *v3;

  -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setMediaContextBadge:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_mediaContextBadge) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaContextBadge, a3);
    -[CNVisualIdentityAvatarViewController updateMediaContextBadgeImage](self, "updateMediaContextBadgeImage");
  }

}

- (void)updateMediaContextBadgeImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  -[CNVisualIdentityAvatarViewController mediaContextBadge](self, "mediaContextBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaContextBadge:", v3);

  -[CNVisualIdentityAvatarViewController mediaContextBadge](self, "mediaContextBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CNVisualIdentityAvatarViewController setMediaContextBadgeView:](self, "setMediaContextBadgeView:", v9);

      -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNVisualIdentityAvatarViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CNVisualIdentityAvatarViewController badgeImageView](self, "badgeImageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSubview:belowSubview:", v12, v13);

      }
      else
      {
        objc_msgSend(v11, "addSubview:", v12);
      }

    }
    -[CNVisualIdentityAvatarViewController updateMediaContextBadgeFrame](self, "updateMediaContextBadgeFrame");
    -[CNVisualIdentityAvatarViewController avatarProvider](self, "avatarProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController mediaContextBadge](self, "mediaContextBadge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v7, "imageForAvatarAccessoryView:withSize:", v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v18);

  }
  else
  {
    objc_msgSend(v6, "setImage:", 0);
  }

  -[CNVisualIdentityAvatarViewController layoutAvatars](self, "layoutAvatars");
  -[CNVisualIdentityAvatarViewController updateBadgeViewFrame](self, "updateBadgeViewFrame");
}

- (void)updateMediaContextBadgeFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;

  -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarFrameForFocusedAvatarInView:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    if (!-[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage"))
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "adHocAvatarFrameInView:forItemCount:", v17, -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount"));
      v9 = v18;
      v13 = v19;

      if (v5 != 1)
        v9 = v9 + v13 * 0.15;
    }
    v20 = (void *)MEMORY[0x1E0D13C80];
    -[CNVisualIdentityAvatarViewController mediaContextBadge](self, "mediaContextBadge");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", objc_msgSend(v30, "badgeType"), v5 == 1, v9, v11, v13, v15);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CNVisualIdentityAvatarViewController mediaContextBadgeView](self, "mediaContextBadgeView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  }
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  void *v4;
  void (**v5)(void);

  if (self->_isPerformingTransition != a3)
  {
    self->_isPerformingTransition = a3;
    if (!a3)
    {
      -[CNVisualIdentityAvatarViewController pendingViewUpdate](self, "pendingViewUpdate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[CNVisualIdentityAvatarViewController pendingViewUpdate](self, "pendingViewUpdate");
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v5[2]();

      }
    }
  }
}

- (void)updateContactChangesNotifierRegistration
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CNVisualIdentityAvatarViewController_updateContactChangesNotifierRegistration__block_invoke;
  v5[3] = &unk_1E204F670;
  v5[4] = self;
  objc_msgSend(v4, "_cn_each:", v5);

}

- (void)contactDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (-[CNVisualIdentityAvatarViewController isPerformingTransition](self, "isPerformingTransition"))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__CNVisualIdentityAvatarViewController_contactDidChange___block_invoke;
    v5[3] = &unk_1E204F910;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[CNVisualIdentityAvatarViewController setPendingViewUpdate:](self, "setPendingViewUpdate:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CNVisualIdentityAvatarViewController updateViewForContact:](self, "updateViewForContact:", v4);
  }

}

- (void)updateViewForContact:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v37 = a3;
  -[CNVisualIdentityAvatarViewController setPendingViewUpdate:](self, "setPendingViewUpdate:", 0);
  if (-[CNVisualIdentityAvatarViewController itemCount](self, "itemCount") == 1)
  {
    objc_msgSend(v37, "imageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageData:", v4);

    objc_msgSend(v37, "cropRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCropRect:", v7, v9, v11, v13);

    objc_msgSend(v37, "thumbnailImageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setThumbnailImageData:", v15);

    objc_msgSend(v37, "fullscreenImageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFullscreenImageData:", v17);

    if (-[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage"))
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "avatarLayerItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 == 1)
      {
        -[CNVisualIdentityAvatarViewController removeAllSublayers](self, "removeAllSublayers");
        -[CNVisualIdentityAvatarViewController updatePrimaryAvatar](self, "updatePrimaryAvatar");
      }
      -[CNVisualIdentityAvatarViewController updateImageForPrimaryAvatar](self, "updateImageForPrimaryAvatar");
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "avatarLayerItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (!v25)
      goto LABEL_13;
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contacts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__CNVisualIdentityAvatarViewController_updateViewForContact___block_invoke;
    v38[3] = &unk_1E2050520;
    v39 = v37;
    v22 = objc_msgSend(v27, "_cn_indexOfFirstObjectPassingTest:", v38);

  }
  -[CNVisualIdentityAvatarViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "avatarLayerItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v22 < v32)
      {
        -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "avatarLayerItems");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v22);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNVisualIdentityAvatarViewController updateImageForLayerItem:atIndex:includePlaceholder:animated:](self, "updateImageForLayerItem:atIndex:includePlaceholder:animated:", v35, v22, 0, 0);
        -[CNVisualIdentityAvatarViewController view](self, "view");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNeedsLayout");

      }
    }
  }
LABEL_13:

}

- (id)containingCellView
{
  void *v2;
  uint64_t v3;

  -[CNVisualIdentityAvatarViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)logSublayersContent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_debug_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEBUG, "Sublayers content: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)layoutAvatars
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
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
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  int v57;
  int64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (-[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage")
    || -[CNVisualIdentityAvatarViewController usingDropAppearance](self, "usingDropAppearance"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
      -[CNVisualIdentityAvatarViewController containingCellView](self, "containingCellView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 134218242;
      v58 = v4;
      v59 = 2114;
      v60 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Laying out avatars with primary avatar image, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v57, 0x16u);

    }
    if (-[CNVisualIdentityAvatarViewController itemCount](self, "itemCount") < 2)
    {
      -[CNVisualIdentityAvatarViewController removeAllSublayers](self, "removeAllSublayers");
      -[CNVisualIdentityAvatarViewController updatePrimaryAvatar](self, "updatePrimaryAvatar");
    }
    else
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
      -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateAvatarLayersWithPrimaryAvatarForItemCount:inView:", v7, v8);

      -[CNVisualIdentityAvatarViewController updateAvatarSublayersAndAddToView](self, "updateAvatarSublayersAndAddToView");
      -[CNVisualIdentityAvatarViewController updatePrimaryAvatar](self, "updatePrimaryAvatar");
      -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutPrimaryAvatar");

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
      -[CNVisualIdentityAvatarViewController containingCellView](self, "containingCellView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 134218242;
      v58 = v11;
      v59 = 2114;
      v60 = v12;
      _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, "Laying out avatars with no primary avatar image, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v57, 0x16u);

    }
    -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewForPrimaryAvatar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

    }
    else
    {
      -[CNVisualIdentityAvatarViewController layerForPrimaryAvatar](self, "layerForPrimaryAvatar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperlayer");

      -[CNVisualIdentityAvatarViewController layerForPrimaryAvatar](self, "layerForPrimaryAvatar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContents:", 0);
    }

    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
    -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateAvatarLayersForItemCount:inView:", v18, v19);

    -[CNVisualIdentityAvatarViewController updateAvatarSublayersAndAddToView](self, "updateAvatarSublayersAndAddToView");
  }
  v20 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
  -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 == 1)
  {

    if (!v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[CNVisualIdentityAvatarViewController setAvatarAlternativeImageView:](self, "setAvatarAlternativeImageView:", v23);

      -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContentMode:", 2);

      v25 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      -[CNVisualIdentityAvatarViewController setAvatarAlternativeImageViewClippingLayer:](self, "setAvatarAlternativeImageViewClippingLayer:", v25);

      -[CNVisualIdentityAvatarViewController avatarAlternativeImageViewClippingLayer](self, "avatarAlternativeImageViewClippingLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMask:", v26);

    }
    -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    if (-[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage"))
    {
      -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "frame");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;
    }
    else
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "avatarLayerItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "frame");
      v34 = v43;
      v36 = v44;
      v38 = v45;
      v40 = v46;

    }
    -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v34, v36, v38, v40);

    v48 = (void *)MEMORY[0x1E0DC3508];
    -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");
    v51 = v50;
    -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    objc_msgSend(v48, "bezierPathWithOvalInRect:", 0.0, 0.0, v51);
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55 = objc_msgSend(v54, "CGPath");
    -[CNVisualIdentityAvatarViewController avatarAlternativeImageViewClippingLayer](self, "avatarAlternativeImageViewClippingLayer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setPath:", v55);

  }
  else
  {
    objc_msgSend(v21, "removeFromSuperview");
  }

}

- (void)updateAvatarSublayersAndAddToView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
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
  unint64_t v20;

  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarLayerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarLayerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "avatarLayerItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "superlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSublayer:", v17);

      }
      -[CNVisualIdentityAvatarViewController updateImageForLayerItem:atIndex:includePlaceholder:animated:](self, "updateImageForLayerItem:atIndex:includePlaceholder:animated:", v12, v9, v5 == 1, v14 == 0);

      ++v9;
      -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "avatarLayerItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v9 < v20);
  }
}

- (void)updatePrimaryAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!-[CNVisualIdentityAvatarViewController usingDropAppearance](self, "usingDropAppearance"))
  {
    -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "viewForPrimaryAvatar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityAvatarViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        -[CNVisualIdentityAvatarViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertSubview:belowSubview:", v5, v9);
LABEL_7:

      }
    }
    else
    {
      -[CNVisualIdentityAvatarViewController layerForPrimaryAvatar](self, "layerForPrimaryAvatar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "superlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityAvatarViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v12)
      {
        -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSublayer:", v5);
        goto LABEL_7;
      }
    }

    -[CNVisualIdentityAvatarViewController updateImageForPrimaryAvatar](self, "updateImageForPrimaryAvatar");
    -[CNVisualIdentityAvatarViewController layoutPrimaryAvatar](self, "layoutPrimaryAvatar");
  }
}

- (void)createPrimaryAvatarLayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setZPosition:", (double)(objc_msgSend(v4, "maxAvatarCount") + 1));

    objc_msgSend(v8, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C78]), "initWithLayer:", v8);
    -[CNVisualIdentityAvatarViewController setAvatarLayerItem:](self, "setAvatarLayerItem:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CNVisualIdentityAvatarViewController setAvatarClippingLayer:](self, "setAvatarClippingLayer:", v6);

    -[CNVisualIdentityAvatarViewController avatarClippingLayer](self, "avatarClippingLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", v7);

  }
}

- (void)updateImageForPrimaryAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && !-[CNVisualIdentityAvatarViewController usingDropAppearance](self, "usingDropAppearance"))
  {
    -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityAvatarViewController renderingQueue](self, "renderingQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke;
    v8[3] = &unk_1E2050400;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "performBlock:", v8);

  }
}

- (void)layoutPrimaryAvatar
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "avatarFrameForFocusedAvatarInView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v3)
  {
    -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewForPrimaryAvatar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
  }
  else
  {
    -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);

    v17 = (void *)MEMORY[0x1E0DC3508];
    -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v19 = v18;
    -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    objc_msgSend(v17, "bezierPathWithOvalInRect:", 0.0, 0.0, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "CGPath");
    -[CNVisualIdentityAvatarViewController avatarClippingLayer](self, "avatarClippingLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPath:", v21);

  }
}

- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5
{
  -[CNVisualIdentityAvatarViewController updateImageForLayerItem:atIndex:includePlaceholder:animated:](self, "updateImageForLayerItem:atIndex:includePlaceholder:animated:", a3, a4, a5, 1);
}

- (void)updateImageForLayerItem:(id)a3 atIndex:(int64_t)a4 includePlaceholder:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  uint64_t *v38;
  id v39;
  id v40;
  BOOL v41;
  id location;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  int64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v7 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3042000000;
  v46 = __Block_byref_object_copy__15824;
  v47 = __Block_byref_object_dispose__15825;
  v48 = 0;
  objc_msgSend(v10, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;

  v20 = v16;
  v21 = floorf(v20);
  v22 = v19;
  v23 = floorf(v22);
  if (*MEMORY[0x1E0C9D820] == v21 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v23)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
      -[CNVisualIdentityAvatarViewController containingCellView](self, "containingCellView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v50 = v31;
      v51 = 2114;
      v52 = v32;
      _os_log_impl(&dword_18AC56000, v30, OS_LOG_TYPE_INFO, "Skipping image update for layer with size zero, itemCount: %lu, containingCell:%{public}@", buf, 0x16u);

    }
    -[CNVisualIdentityAvatarViewController logSublayersContent](self, "logSublayersContent");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D13D18], "publicFingerprintForContact:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = (int64_t)v26;
      _os_log_impl(&dword_18AC56000, v25, OS_LOG_TYPE_INFO, "Fetching image for contact %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v10);
    -[CNVisualIdentityAvatarViewController avatarProvider](self, "avatarProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke;
    v36 = &unk_1E2049A90;
    objc_copyWeak(&v39, (id *)buf);
    objc_copyWeak(&v40, &location);
    v38 = &v43;
    v37 = v13;
    v41 = a6;
    objc_msgSend(v27, "avatarImageForContact:withSize:includePlaceholder:imageHandler:", v37, v7, &v33, v21, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAvatarImageRendererToken:", v28, v33, v34, v35, v36);

    objc_msgSend(v10, "avatarImageRendererToken");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(v44 + 5, v29);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v43, 8);
  objc_destroyWeak(&v48);

}

- (int64_t)itemCount
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxAvatarCount");

  -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
    return v7;
  else
    return v4;
}

- (id)layerForPrimaryAvatar
{
  void *v3;
  void *v4;
  void *v5;

  -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CNVisualIdentityAvatarViewController createPrimaryAvatarLayerIfNeeded](self, "createPrimaryAvatarLayerIfNeeded");
    -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)beginDropAppearance
{
  if (!-[CNVisualIdentityAvatarViewController usingDropAppearance](self, "usingDropAppearance")
    && -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount") >= 2)
  {
    -[CNVisualIdentityAvatarViewController setUsingDropAppearance:](self, "setUsingDropAppearance:", 1);
    -[CNVisualIdentityAvatarViewController layoutAvatars](self, "layoutAvatars");
  }
}

- (void)endDropAppearance
{
  if (-[CNVisualIdentityAvatarViewController usingDropAppearance](self, "usingDropAppearance"))
  {
    -[CNVisualIdentityAvatarViewController setUsingDropAppearance:](self, "setUsingDropAppearance:", 0);
    -[CNVisualIdentityAvatarViewController layoutAvatars](self, "layoutAvatars");
  }
}

- (BOOL)shouldDisplayPrimaryAvatarImage
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "primaryAvatarShouldDisplay");
  }
  else
  {
    -[CNVisualIdentityAvatarViewController visualIdentity](self, "visualIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasImageDataAvailable");
  }
  v6 = v5;

  return v6;
}

- (void)visualIdentityDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNVisualIdentityAvatarViewController setVisualIdentity:](self, "setVisualIdentity:");
  -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVisualIdentityAvatarViewController primaryAvatarProvider](self, "primaryAvatarProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatePrimaryAvatarForVisualIdentity:", v7);

  }
  -[CNVisualIdentityAvatarViewController layoutAvatars](self, "layoutAvatars");
  if (-[CNVisualIdentityAvatarViewController shouldUseBadgeButton](self, "shouldUseBadgeButton"))
  {
    -[CNVisualIdentityAvatarViewController updateBadgeButtonFrame](self, "updateBadgeButtonFrame");
  }
  else
  {
    -[CNVisualIdentityAvatarViewController updateMediaContextBadgeFrame](self, "updateMediaContextBadgeFrame");
    -[CNVisualIdentityAvatarViewController updateBadgeViewFrame](self, "updateBadgeViewFrame");
  }
  -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

}

- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarFrameForFocusedAvatarInView:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)primaryAvatarSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CNVisualIdentityAvatarViewController avatarAlternativeImageView](self, "avatarAlternativeImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)estimatedSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[CNVisualIdentityAvatarViewController itemCount](self, "itemCount");
  if (v6 <= 0)
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v7 = v6;
    v8 = -[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage");
    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "avatarFrameInBounds:forItemCount:", v7, 0.0, 0.0, width, height);
    else
      objc_msgSend(v9, "adHocAvatarFrameInBounds:forItemCount:", v7, 0.0, 0.0, width, height);
    v13 = v11;
    v14 = v12;

  }
  v15 = v13;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)primaryAvatarLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CNVisualIdentityAvatarViewController avatarLayerItem](self, "avatarLayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNVisualIdentityAvatarViewController shouldDisplayPrimaryAvatarImage](self, "shouldDisplayPrimaryAvatarImage"))
  {
    -[CNVisualIdentityAvatarViewController avatarLayoutManager](self, "avatarLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarLayerItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (CNVisualIdentityAvatarLayoutManager)avatarLayoutManager
{
  return self->_avatarLayoutManager;
}

- (void)setAvatarLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarLayoutManager, a3);
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CNVisualIdentityPrimaryAvatarProvider)primaryAvatarProvider
{
  return self->_primaryAvatarProvider;
}

- (void)setPrimaryAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAvatarProvider, a3);
}

- (CNScheduler)renderingQueue
{
  return self->_renderingQueue;
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (CNVisualIdentityContactAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avatarProvider, a3);
}

- (UIImageView)mediaContextBadgeView
{
  return self->_mediaContextBadgeView;
}

- (void)setMediaContextBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadgeView, a3);
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (UITapGestureRecognizer)badgeTapGestureRecognizer
{
  return self->_badgeTapGestureRecognizer;
}

- (void)setBadgeTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTapGestureRecognizer, a3);
}

- (id)pendingViewUpdate
{
  return self->_pendingViewUpdate;
}

- (void)setPendingViewUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (CNUIAvatarLayoutLayerItem)avatarLayerItem
{
  return self->_avatarLayerItem;
}

- (void)setAvatarLayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_avatarLayerItem, a3);
}

- (UIImageView)avatarAlternativeImageView
{
  return self->_avatarAlternativeImageView;
}

- (void)setAvatarAlternativeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarAlternativeImageView, a3);
}

- (CAShapeLayer)avatarClippingLayer
{
  return self->_avatarClippingLayer;
}

- (void)setAvatarClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarClippingLayer, a3);
}

- (CAShapeLayer)avatarAlternativeImageViewClippingLayer
{
  return self->_avatarAlternativeImageViewClippingLayer;
}

- (void)setAvatarAlternativeImageViewClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarAlternativeImageViewClippingLayer, a3);
}

- (CGSize)previousSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousSize.width;
  height = self->_previousSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (BOOL)usingDropAppearance
{
  return self->_usingDropAppearance;
}

- (void)setUsingDropAppearance:(BOOL)a3
{
  self->_usingDropAppearance = a3;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_visualIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_avatarAlternativeImageViewClippingLayer, 0);
  objc_storeStrong((id *)&self->_avatarClippingLayer, 0);
  objc_storeStrong((id *)&self->_avatarAlternativeImageView, 0);
  objc_storeStrong((id *)&self->_avatarLayerItem, 0);
  objc_storeStrong(&self->_pendingViewUpdate, 0);
  objc_storeStrong((id *)&self->_badgeTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_mediaContextBadgeView, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_primaryAvatarProvider, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_avatarLayoutManager, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
}

void __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke_2;
  v6[3] = &unk_1E2049A68;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v4 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v3;
  v12 = *(_BYTE *)(a1 + 64);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __100__CNVisualIdentityAvatarViewController_updateImageForLayerItem_atIndex_includePlaceholder_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  NSSize v30;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v3, "avatarImageRendererToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "avatarImageRendererToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  if (v4)
    v7 = v5 == v6;
  else
    v7 = 1;
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D13D18], "publicFingerprintForContact:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "size");
    NSStringFromSize(v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v10;
    v25 = 2114;
    v26 = v11;
    v27 = 1024;
    v28 = v8;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_INFO, "Received image for contact %{public}@, image size:%{public}@, shouldRender:%d", (uint8_t *)&v23, 0x1Cu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (!v8)
      goto LABEL_18;
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v23) = 0;
  }

  if (v8)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v13 = *MEMORY[0x1E0CD2F90];
    objc_msgSend(v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsGravity:", v13);

    objc_msgSend(*(id *)(a1 + 40), "scale");
    v16 = v15;
    objc_msgSend(v3, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentsScale:", v16);

    v18 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
    objc_msgSend(v3, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContents:", v18);

    objc_msgSend(v3, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsEdgeAntialiasing:", 1);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if (objc_msgSend(WeakRetained, "shouldDisplayPrimaryAvatarImage") && *(_BYTE *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDuration:", 0.3);
      objc_msgSend(v21, "setFromValue:", &unk_1E20D2DF0);
      objc_msgSend(v21, "setToValue:", &unk_1E20D2E08);
      objc_msgSend(v21, "setRemovedOnCompletion:", 1);
      objc_msgSend(v3, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAnimation:forKey:", v21, 0);

    }
  }
LABEL_18:

}

void __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "avatarImage");

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke_2;
  v7[3] = &unk_1E2050400;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performBlock:", v7);

}

void __67__CNVisualIdentityAvatarViewController_updateImageForPrimaryAvatar__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "visualIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarImage");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(v3, "CGImage"));

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "itemCount");
    objc_msgSend(*(id *)(a1 + 40), "containingCellView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Updating image for primary avatar, itemCount: %lu, containingCell:%{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "visualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
    }

  }
}

id __59__CNVisualIdentityAvatarViewController_logSublayersContent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSSize v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "size");
  NSStringFromSize(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("Layer size:%@, contents:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__CNVisualIdentityAvatarViewController_updateViewForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void __57__CNVisualIdentityAvatarViewController_contactDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateViewForContact:", *(_QWORD *)(a1 + 32));

}

void __80__CNVisualIdentityAvatarViewController_updateContactChangesNotifierRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactChangesNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  +[CNVisualIdentity descriptorForImageKeys](CNVisualIdentity, "descriptorForImageKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:forContact:keysToFetch:", v6, v3, v9);

}

+ (id)log
{
  if (log_cn_once_token_1_15882 != -1)
    dispatch_once(&log_cn_once_token_1_15882, &__block_literal_global_15883);
  return (id)log_cn_once_object_1_15884;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_15879 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_15879, &__block_literal_global_13);
  return (id)descriptorForRequiredKeys_cn_once_object_2_15880;
}

+ (unint64_t)maxContactAvatars
{
  return objc_msgSend(MEMORY[0x1E0D13C80], "maxAvatarCountForType:", 0);
}

void __65__CNVisualIdentityAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNVisualIdentity descriptorForRequiredKeys](CNVisualIdentity, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNVisualIdentityAvatarViewController descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_15880;
  descriptorForRequiredKeys_cn_once_object_2_15880 = v4;

}

void __43__CNVisualIdentityAvatarViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNVisualIdentityAvatarViewController");
  v1 = (void *)log_cn_once_object_1_15884;
  log_cn_once_object_1_15884 = (uint64_t)v0;

}

@end

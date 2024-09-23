@implementation HUQuickControlMediaPlayerViewController

- (HUQuickControlMediaPlayerViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12;
  HUQuickControlMediaPlayerViewController *v13;
  HUQuickControlMediaPlayerViewController *v14;
  NSArray *mediaControlViewControllerConstraints;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *mediaRoutingIdentifier;
  void *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v12 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HUQuickControlMediaPlayerViewController;
  v13 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v27, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, v12, a4, a5, a6, a7);
  v14 = v13;
  if (v13)
  {
    mediaControlViewControllerConstraints = v13->_mediaControlViewControllerConstraints;
    v13->_mediaControlViewControllerConstraints = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mediaProfileContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hf_mediaRouteIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    mediaRoutingIdentifier = v14->_mediaRoutingIdentifier;
    v14->_mediaRoutingIdentifier = (NSString *)v18;

    if (!v14->_mediaRoutingIdentifier)
    {
      objc_msgSend(v16, "mediaRoutingIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v16, "mediaRoutingIdentifier");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v14->_mediaRoutingIdentifier;
        v14->_mediaRoutingIdentifier = (NSString *)v21;

      }
    }
    v14->_mediaAccessoryItemType = objc_msgSend(v16, "mediaAccessoryItemType");
    objc_msgSend(v16, "mediaProfileContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accessories");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "anyObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v14->_siriEndPointAccessory = objc_msgSend(v25, "hf_isSiriEndpoint");
    v14->_speakerAccessory = objc_msgSend(v25, "hf_isDumbSpeaker");

  }
  return v14;
}

uint64_t __117__HUQuickControlMediaPlayerViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[HUHomePodMediaUIVendor sharedInstance](HUHomePodMediaUIVendor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNowPlayingViewController:", 0);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlMediaPlayerViewController;
  -[HUQuickControlMediaPlayerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlMediaPlayerViewController;
  -[HUQuickControlMediaPlayerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUQuickControlMediaPlayerViewController _addMediaControlView](self, "_addMediaControlView");
}

- (id)title
{
  return (id)HFLocalizedString();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlMediaPlayerViewController;
  -[HUQuickControlMediaPlayerViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    -[HUQuickControlMediaPlayerViewController _updateConstraints](self, "_updateConstraints");
}

+ (id)controlItemPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSingleControlView
{
  return 1;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v7)
  {
    objc_msgSend(v7, "layoutFrame");
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.width = 0.0;
    v32.size.height = 0.0;
    v14 = CGRectEqualToRect(v29, v32);
    if (v10)
      goto LABEL_12;
LABEL_15:
    LOBYTE(v15) = 0;
    if (v13)
      goto LABEL_13;
    goto LABEL_16;
  }
  v14 = 0;
  if (!v10)
    goto LABEL_15;
LABEL_12:
  objc_msgSend(v10, "layoutFrame");
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 0.0;
  v33.size.height = 0.0;
  v15 = !CGRectEqualToRect(v30, v33);
  if (v13)
  {
LABEL_13:
    objc_msgSend(v13, "bounds");
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = 0.0;
    v34.size.height = 0.0;
    v16 = !CGRectEqualToRect(v31, v34);
    goto LABEL_17;
  }
LABEL_16:
  LOBYTE(v16) = 0;
LABEL_17:
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = v5;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "^^^^ preferredFrameLayoutGuide: [%@] newLayoutGuide: [%@] currentLayoutGuide: [%@] currentLayoutGuideView: [%@] ^^^^^", buf, 0x2Au);
  }

  -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v18) & 1) != 0)
  {

  }
  else
  {
    if (v14)
    {

      if (v15 || v16)
        goto LABEL_26;
    }
    else
    {

    }
    v19.receiver = self;
    v19.super_class = (Class)HUQuickControlMediaPlayerViewController;
    -[HUQuickControlViewController setPreferredFrameLayoutGuide:](&v19, sel_setPreferredFrameLayoutGuide_, v5);
    -[HUQuickControlMediaPlayerViewController _updateConstraints](self, "_updateConstraints");
  }
LABEL_26:

}

- (void)platterViewController:(id)a3 didUpdateEndpointWithReason:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Media player view %@ updated endpoint with reason %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)platterViewController:(id)a3 didReceiveInteractionEvent:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Media player view %@ received interaction event from %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  -[HUQuickControlViewController itemUpdater](self, "itemUpdater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "invalidateLayout");
  -[HUQuickControlMediaPlayerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

  v14 = (void *)MEMORY[0x1E0CEABB0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke;
  v19[3] = &unk_1E6F4D3E8;
  v19[4] = self;
  v20 = v7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2;
  v17[3] = &unk_1E6F4D410;
  v17[4] = self;
  v18 = v8;
  v15 = v7;
  v16 = v8;
  objc_msgSend(v14, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v19, v17, 0.7, 0.0, 0.8165, 0.0);

}

uint64_t __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraints");
}

uint64_t __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "mediaControlsNowPlayingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    objc_msgSend(*(id *)(v2 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    result = *(_QWORD *)(v2 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)nowPlayingViewControllerDidChangeLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_opt_class();
  -[HUQuickControlViewController itemUpdater](self, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "collectionViewLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invalidateLayout");
}

- (void)_addMediaControlView
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUQuickControlMediaPlayerViewController mediaRoutingIdentifier](self, "mediaRoutingIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Media Route %@; showing quick controls",
      (uint8_t *)&v31,
      0xCu);

  }
  v5 = objc_alloc(MEMORY[0x1E0D47BD0]);
  -[HUQuickControlMediaPlayerViewController mediaRoutingIdentifier](self, "mediaRoutingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRouteUID:", v6);
  -[HUQuickControlMediaPlayerViewController setMediaControlsNowPlayingViewController:](self, "setMediaControlsNowPlayingViewController:", v7);

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayout:", 2);

  if (-[HUQuickControlMediaPlayerViewController isSiriEndPointAccessory](self, "isSiriEndPointAccessory")
    && !-[HUQuickControlMediaPlayerViewController isSpeakerAccessory](self, "isSpeakerAccessory"))
  {
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLayout:", 4);

  }
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSupportsHorizontalLayout:", 1);

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContext:", 3);

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hostProcess");

  if (v15 == 100)
  {
    objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", 8, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47BD8]), "initWithVisualStylingProvider:", v16);
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStylingProvider:", v17);

  }
  else
  {
    v16 = (void *)objc_opt_new();
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStylingProvider:", v16);
  }

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentEdgeInsets:", 24.0, 40.0, 24.0, 40.0);

  -[HUQuickControlMediaPlayerViewController traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlMediaPlayerViewController _updateMediaControlAppearanceForTraitCollection:](self, "_updateMediaControlAppearanceForTraitCollection:", v20);

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlMediaPlayerViewController addChildViewController:](self, "addChildViewController:", v21);

  -[HUQuickControlMediaPlayerViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v24);

  -[HUQuickControlMediaPlayerViewController _updateConstraints](self, "_updateConstraints");
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "didMoveToParentViewController:", self);

  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v28;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "Setting HUHomePodMediaUIVendor to ->  self.mediaControlsNowPlayingViewController = %@", (uint8_t *)&v31, 0xCu);

  }
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomePodMediaUIVendor sharedInstance](HUHomePodMediaUIVendor, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNowPlayingViewController:", v29);

}

- (void)_updateMediaControlAppearanceForTraitCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  -[HUQuickControlMediaPlayerViewController mediaControlViewController](self, "mediaControlViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 2)
  {
    objc_msgSend(v5, "setStyle:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
  }
  else
  {
    objc_msgSend(v5, "setStyle:", 4);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_mediaPlatterBackgroundColor");
  }
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v11, "CGColor");
  -[HUQuickControlMediaPlayerViewController mediaControlViewController](self, "mediaControlViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v7);

}

- (void)_updateConstraints
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;
  CGSize v79;
  CGRect v80;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlMediaPlayerViewController mediaControlViewControllerConstraints](self, "mediaControlViewControllerConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  -[HUQuickControlMediaPlayerViewController viewHeightConstraint](self, "viewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hostProcess") == 100)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hostProcess");

    if (v9 != 3)
    {
      v20 = 3.40282347e38;
      goto LABEL_9;
    }
  }
  -[HUQuickControlMediaPlayerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fixedCoordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  if (v12 <= v16)
    v17 = 2.0;
  else
    v17 = 4.0;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19 + v17 * -20.0;

LABEL_9:
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlMediaPlayerViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  objc_msgSend(v22, "sizeThatFits:", v24, v20);
  v26 = v25;
  v28 = v27;

  HFLogForCategory();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v79.width = v26;
    v79.height = v28;
    NSStringFromCGSize(v79);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    NSStringFromCGRect(v80);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v73 = v30;
    v74 = 2112;
    v75 = v31;
    v76 = 2112;
    v77 = v33;
    _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "** Inside _updateConstraints. self.mediaControlsNowPlayingViewController = %@, sizeThatFits returned by mediaControlsNowPlayingViewController = %@; self.view.bounds.size = %@",
      buf,
      0x20u);

  }
  -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v36;
      _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "*** self.preferredFrameLayoutGuide = %@ ***", buf, 0xCu);

    }
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "view");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "safeAreaLayoutGuide");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v64;
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToConstant:", v28);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v60;
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController view](self, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "safeAreaLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v54);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v37;
    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController setMediaControlViewControllerConstraints:](self, "setMediaControlViewControllerConstraints:", v45);

    -[HUQuickControlMediaPlayerViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlMediaPlayerViewController setViewHeightConstraint:](self, "setViewHeightConstraint:", v48);

    -[HUQuickControlMediaPlayerViewController viewHeightConstraint](self, "viewHeightConstraint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    v3 = 0x1E0CB3000;
  }
  else
  {
    -[HUQuickControlMediaPlayerViewController setMediaControlViewControllerConstraints:](self, "setMediaControlViewControllerConstraints:", MEMORY[0x1E0C9AA60]);
  }
  HFLogForCategory();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    -[HUQuickControlMediaPlayerViewController mediaControlViewControllerConstraints](self, "mediaControlViewControllerConstraints");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v73 = v51;
    _os_log_impl(&dword_1B8E1E000, v50, OS_LOG_TYPE_DEFAULT, "*** Activating constraints = %@ ***", buf, 0xCu);

  }
  v52 = *(void **)(v3 + 1816);
  -[HUQuickControlMediaPlayerViewController mediaControlViewControllerConstraints](self, "mediaControlViewControllerConstraints");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v53);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[HUQuickControlMediaPlayerViewController _updateMediaControlAppearanceForTraitCollection:](self, "_updateMediaControlAppearanceForTraitCollection:", v8);
    v7 = v8;
    goto LABEL_5;
  }
  -[HUQuickControlMediaPlayerViewController mediaControlViewController](self, "mediaControlViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
    goto LABEL_4;
LABEL_5:

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;

  -[HUQuickControlMediaPlayerViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    v5 = v4;
    objc_msgSend(v4, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlMediaPlayerViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      if (v4)
        goto LABEL_5;
      goto LABEL_7;
    }
    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v7);
  if (v4)
  {
LABEL_5:
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;

    -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_7:
  -[HUQuickControlMediaPlayerViewController mediaControlsNowPlayingViewController](self, "mediaControlsNowPlayingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

- (MRPlatterViewController)mediaControlViewController
{
  return self->_mediaControlViewController;
}

- (void)setMediaControlViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlViewController, a3);
}

- (MRUNowPlayingViewController)mediaControlsNowPlayingViewController
{
  return self->_mediaControlsNowPlayingViewController;
}

- (void)setMediaControlsNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlsNowPlayingViewController, a3);
}

- (NSArray)mediaControlViewControllerConstraints
{
  return self->_mediaControlViewControllerConstraints;
}

- (void)setMediaControlViewControllerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlViewControllerConstraints, a3);
}

- (NSLayoutConstraint)viewHeightConstraint
{
  return self->_viewHeightConstraint;
}

- (void)setViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_viewHeightConstraint, a3);
}

- (NSString)mediaRoutingIdentifier
{
  return self->_mediaRoutingIdentifier;
}

- (void)setMediaRoutingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRoutingIdentifier, a3);
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (BOOL)isSiriEndPointAccessory
{
  return self->_siriEndPointAccessory;
}

- (void)setSiriEndPointAccessory:(BOOL)a3
{
  self->_siriEndPointAccessory = a3;
}

- (BOOL)isSpeakerAccessory
{
  return self->_speakerAccessory;
}

- (void)setSpeakerAccessory:(BOOL)a3
{
  self->_speakerAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_viewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mediaControlViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_mediaControlsNowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_mediaControlViewController, 0);
}

@end

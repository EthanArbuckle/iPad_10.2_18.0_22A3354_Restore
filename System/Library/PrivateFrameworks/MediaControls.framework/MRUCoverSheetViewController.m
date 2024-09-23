@implementation MRUCoverSheetViewController

- (void)loadView
{
  MRUCoverSheetView *v3;

  v3 = objc_alloc_init(MRUCoverSheetView);
  -[MRUCoverSheetViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  MediaControlsInteractionRecognizer *v3;
  MediaControlsInteractionRecognizer *interactionRecognizer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRUCoordinatedUpdateController *v12;
  MRUCoordinatedUpdateController *coordinatedUpdateController;
  objc_class *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MRUCoverSheetViewController;
  -[MRUCoverSheetViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = -[MediaControlsInteractionRecognizer initWithTarget:action:]([MediaControlsInteractionRecognizer alloc], "initWithTarget:action:", self, sel_didReceiveInteraction_);
  interactionRecognizer = self->_interactionRecognizer;
  self->_interactionRecognizer = v3;

  -[MediaControlsInteractionRecognizer setCancelsTouchesInView:](self->_interactionRecognizer, "setCancelsTouchesInView:", 0);
  -[MediaControlsInteractionRecognizer setDelegate:](self->_interactionRecognizer, "setDelegate:", self);
  -[MRUCoverSheetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_interactionRecognizer);

  -[MRUCoverSheetViewController nowPlayingViewController](self, "nowPlayingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[MRUCoverSheetViewController nowPlayingViewController](self, "nowPlayingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCoverSheetViewController addChildViewController:](self, "addChildViewController:", v7);

  -[MRUCoverSheetViewController nowPlayingViewController](self, "nowPlayingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCoverSheetViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentView:", v9);

  -[MRUCoverSheetViewController nowPlayingViewController](self, "nowPlayingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didMoveToParentViewController:", self);

  v12 = objc_alloc_init(MRUCoordinatedUpdateController);
  coordinatedUpdateController = self->_coordinatedUpdateController;
  self->_coordinatedUpdateController = v12;

  -[MRUCoordinatedUpdateController setCadence:](self->_coordinatedUpdateController, "setCadence:", 0.25);
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCoordinatedUpdateController setContext:](self->_coordinatedUpdateController, "setContext:", v15);

  -[MRUCoordinatedUpdateController setDelegate:](self->_coordinatedUpdateController, "setDelegate:", self);
  -[MRUCoverSheetViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  -[MRUCoverSheetViewController updateRestrictedRects](self, "updateRestrictedRects");
  -[MRUCoverSheetViewController updateVisualStyling](self, "updateVisualStyling");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUCoverSheetViewController;
  -[MRUCoverSheetViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[MRUCoverSheetViewController updateRestrictedRects](self, "updateRestrictedRects");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUCoverSheetViewController;
  -[MRUCoverSheetViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  -[MRUCoverSheetViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[MRUCoverSheetViewController updateVisualStyling](self, "updateVisualStyling");
  objc_msgSend(v4, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCoverSheetViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v10)
    -[MRUCoverSheetViewController updatePreferredContentSize](self, "updatePreferredContentSize");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)layout
{
  return -[MRUNowPlayingViewController isShowingMediaSuggestions](self->_nowPlayingViewController, "isShowingMediaSuggestions");
}

- (MRUNowPlayingViewController)nowPlayingViewController
{
  MRUNowPlayingViewController *nowPlayingViewController;
  void *v4;
  MRUNowPlayingController *v5;
  MRUNowPlayingViewController *v6;
  MRUNowPlayingViewController *v7;

  nowPlayingViewController = self->_nowPlayingViewController;
  if (!nowPlayingViewController)
  {
    +[MRUEndpointController proactiveEndpointController](MRUEndpointController, "proactiveEndpointController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v4);
    v6 = -[MRUNowPlayingViewController initWithController:routeControlsPresentation:]([MRUNowPlayingViewController alloc], "initWithController:routeControlsPresentation:", v5, 1);
    v7 = self->_nowPlayingViewController;
    self->_nowPlayingViewController = v6;

    -[MRUNowPlayingViewController setContext:](self->_nowPlayingViewController, "setContext:", 2);
    -[MRUNowPlayingViewController setLayout:](self->_nowPlayingViewController, "setLayout:", 4);

    nowPlayingViewController = self->_nowPlayingViewController;
  }
  return nowPlayingViewController;
}

- (void)didReceiveInteraction:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "coverSheetViewController:didReceiveInteractionEvent:", self, v5);

}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id WeakRetained;
  const void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[MRUCoverSheetViewController layout](self, "layout");
  if (objc_msgSend(v14, "isShowingMediaSuggestions")
    && !objc_msgSend(v14, "shouldShowMediaSuggestions"))
  {
    v10 = 0;
  }
  else if (objc_msgSend(v14, "shouldShowMediaSuggestions")
         && !objc_msgSend(v14, "isShowingMediaSuggestions"))
  {
    v10 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v9)
      v12 = v9;
    else
      v12 = &__block_literal_global_30;
    v13 = _Block_copy(v12);
    objc_msgSend(WeakRetained, "coverSheetViewController:willChangeToLayout:animations:completion:", self, v10, v8, v13);

  }
  else
  {
    -[MRUCoordinatedUpdateController addUpdate:completion:](self->_coordinatedUpdateController, "addUpdate:completion:", v8, v9);
  }

}

- (void)coordinatedUpdateController:(id)a3 processCoordinatedUpdates:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke;
  v14[3] = &unk_1E58194F0;
  v14[4] = self;
  v15 = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke_2;
  v12[3] = &unk_1E5819D58;
  v12[4] = self;
  v13 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "mru_animateUsingType:animations:completion:", 0, v14, v12);

}

void __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateRestrictedRects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E5878510;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v5;
  MRUVisualStylingProvider *v6;

  v5 = a3;
  v6 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v5);

  -[MRUCoverSheetViewController setStylingProvider:](self, "setStylingProvider:", v6);
  -[MRUCoverSheetViewController updateVisualStyling](self, "updateVisualStyling");
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_nowPlayingViewController)
  {
    v4[0] = self->_nowPlayingViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v13);

  -[MRUCoverSheetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGSize v22;
  CGSize v23;

  v21 = *MEMORY[0x1E0C80C00];
  -[MRUCoverSheetViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  v6 = v5;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v22.width = v4;
    v22.height = v6;
    NSStringFromCGSize(v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCoverSheetViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v23.width = v11;
    v23.height = v12;
    NSStringFromCGSize(v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ preferred content size: %{public}@ | current: %{public}@", (uint8_t *)&v15, 0x20u);

  }
  -[MRUCoverSheetViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "coverSheetViewController:didUpdatePreferredContentSize:", self, v4, v6);

}

- (void)updateRestrictedRects
{
  void *v3;
  id v4;

  -[MRUCoverSheetViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRUNowPlayingViewController restrictedRects](self->_nowPlayingViewController, "restrictedRects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetViewController:didUpdateRestrictedRects:", self, v3);

  }
}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;
  MRUVisualStylingProvider *v5;
  void *v6;
  id v7;

  if (+[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled"))
  {
    v3 = (void *)MEMORY[0x1E0D474B8];
    -[MRUCoverSheetViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v4, "userInterfaceStyle"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v7);
    -[MRUCoverSheetViewController nowPlayingViewController](self, "nowPlayingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStylingProvider:", v5);

  }
  else
  {
    -[MRUCoverSheetViewController stylingProvider](self, "stylingProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUNowPlayingViewController setStylingProvider:](self->_nowPlayingViewController, "setStylingProvider:");
  }

}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, a3);
}

- (MRUCoverSheetViewControllerDelegate)delegate
{
  return (MRUCoverSheetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)preferredContentSizeBlock
{
  return self->_preferredContentSizeBlock;
}

- (void)setPreferredContentSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProvider, a3);
}

- (MRUCoordinatedUpdateController)coordinatedUpdateController
{
  return self->_coordinatedUpdateController;
}

- (void)setCoordinatedUpdateController:(id)a3
{
  objc_storeStrong((id *)&self->_coordinatedUpdateController, a3);
}

- (MediaControlsInteractionRecognizer)interactionRecognizer
{
  return self->_interactionRecognizer;
}

- (void)setInteractionRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_interactionRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionRecognizer, 0);
  objc_storeStrong((id *)&self->_coordinatedUpdateController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong(&self->_preferredContentSizeBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
}

@end

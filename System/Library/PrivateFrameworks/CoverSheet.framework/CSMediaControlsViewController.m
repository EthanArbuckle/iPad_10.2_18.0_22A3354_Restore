@implementation CSMediaControlsViewController

- (CSMediaControlsViewController)init
{
  CSMediaControlsViewController *v2;
  MRUCoverSheetViewController *v3;
  MRUCoverSheetViewController *mediaRemoteViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMediaControlsViewController;
  v2 = -[CSMediaControlsViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (MRUCoverSheetViewController *)objc_alloc_init(MEMORY[0x1E0D47BC8]);
    mediaRemoteViewController = v2->_mediaRemoteViewController;
    v2->_mediaRemoteViewController = v3;

    -[MRUCoverSheetViewController setDelegate:](v2->_mediaRemoteViewController, "setDelegate:", v2);
    v2->_mediaRemoteLayout = -[MRUCoverSheetViewController layout](v2->_mediaRemoteViewController, "layout");
  }
  return v2;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  void *v3;
  MRUCoverSheetViewController *mediaRemoteViewController;
  id v5;
  objc_super v6;
  _QWORD v7[5];
  id v8;

  -[MRUCoverSheetViewController view](self->_mediaRemoteViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRemoteViewController = self->_mediaRemoteViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CSMediaControlsViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E8E2DF58;
  v7[4] = self;
  v8 = v3;
  v5 = v3;
  -[CSMediaControlsViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", mediaRemoteViewController, 0, v7);
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v5, 2);
  v6.receiver = self;
  v6.super_class = (Class)CSMediaControlsViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);

}

void __44__CSMediaControlsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "_layoutMediaControls");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", *(_QWORD *)(a1 + 40));

  v5[2]();
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSMediaControlsViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSMediaControlsViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_mediaRemoteViewController, 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSMediaControlsViewController;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CSMediaControlsViewController _layoutMediaControls](self, "_layoutMediaControls");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (int64_t)presentationType
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 5;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  CSMediaControlsViewController *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSMediaControlsViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v10, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 25)
    {
      v7 = self;
      v8 = 0;
    }
    else
    {
      if (v6 != 24)
      {
LABEL_9:
        v5 = 0;
        goto LABEL_10;
      }
      v7 = self;
      v8 = 1;
    }
    -[CSMediaControlsViewController _updatePersistentUpdatesEnabled:](v7, "_updatePersistentUpdatesEnabled:", v8);
    goto LABEL_9;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_10:

  return v5;
}

- (void)coverSheetViewController:(id)a3 didReceiveInteractionEvent:(id)a4
{
  id v5;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v5);

}

- (void)coverSheetViewController:(id)a3 willChangeToLayout:(int64_t)a4 animations:(id)a5 completion:(id)a6
{
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  void (**v17)(_QWORD);

  v9 = (void (**)(_QWORD))a5;
  v10 = (void (**)(_QWORD))a6;
  if (_os_feature_enabled_impl())
  {
    self->_mediaRemoteLayout = a4;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke;
    v16[3] = &unk_1E8E2DF80;
    v16[4] = self;
    v17 = v9;
    v12 = (void *)MEMORY[0x1D17E1614](v16);
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke_2;
    v14[3] = &unk_1E8E2DFA8;
    v15 = v10;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v12, v14, 0.5);

  }
  else
  {
    v9[2](v9);
    v10[2](v10);
  }

}

uint64_t __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
  objc_msgSend(*(id *)(a1 + 32), "_layoutMediaControls");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    -[CSMediaControlsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRUCoverSheetViewController visualStylingProviderForCategory:](self->_mediaRemoteViewController, "visualStylingProviderForCategory:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRUCoverSheetViewController requiredVisualStyleCategories](self->_mediaRemoteViewController, "requiredVisualStyleCategories");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MRUCoverSheetViewController setVisualStylingProvider:forCategory:](self->_mediaRemoteViewController, "setVisualStylingProvider:forCategory:", v6, a4);

}

- (double)_preferredMediaRemoteHeight
{
  int64_t mediaRemoteLayout;
  void *v3;
  double v4;
  double v5;

  mediaRemoteLayout = self->_mediaRemoteLayout;
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl() && mediaRemoteLayout)
    objc_msgSend(v3, "nowPlayingHeightExpanded");
  else
    objc_msgSend(v3, "nowPlayingHeightCompact");
  v5 = v4;

  return v5;
}

- (void)_layoutMediaControls
{
  id v3;

  -[MRUCoverSheetViewController view](self->_mediaRemoteViewController, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSMediaControlsViewController _suggestedFrameForMediaControls](self, "_suggestedFrameForMediaControls");
  objc_msgSend(v3, "setFrame:");

}

- (void)_updatePersistentUpdatesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  MRUCoverSheetViewController *v6;

  v3 = a3;
  v6 = self->_mediaRemoteViewController;
  v5 = -[CSMediaControlsViewController _appearState](self, "_appearState") == 2 && v3;
  -[CSMediaControlsViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v6, v5);

}

- (void)_updatePreferredContentSize
{
  double v3;

  -[CSMediaControlsViewController _preferredMediaRemoteHeight](self, "_preferredMediaRemoteHeight");
  -[CSMediaControlsViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_containerSize.width, v3);
}

- (CGRect)_suggestedFrameForMediaControls
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CSMediaControlsViewController _preferredMediaRemoteHeight](self, "_preferredMediaRemoteHeight");
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteViewController, 0);
}

@end

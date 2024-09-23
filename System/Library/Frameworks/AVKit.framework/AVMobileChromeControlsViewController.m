@implementation AVMobileChromeControlsViewController

- (AVPlaybackControlsController)playbackControlsController
{
  AVPlaybackControlsController *playbackControlsController;
  AVPlaybackControlsController *v4;
  id WeakRetained;
  AVPlaybackControlsController *v6;
  AVPlaybackControlsController *v7;

  playbackControlsController = self->_playbackControlsController;
  if (!playbackControlsController)
  {
    v4 = [AVPlaybackControlsController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);
    v6 = -[AVPlaybackControlsController initWithPlayerViewController:](v4, "initWithPlayerViewController:", WeakRetained);
    v7 = self->_playbackControlsController;
    self->_playbackControlsController = v6;

    playbackControlsController = self->_playbackControlsController;
  }
  return playbackControlsController;
}

- (void)setIncludedControls:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (-[AVMobileControlsViewController includedControls](self, "includedControls") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AVMobileChromeControlsViewController;
    -[AVMobileControlsViewController setIncludedControls:](&v8, sel_setIncludedControls_, a3);
    -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaybackControlsIncludeTransportControls:", (a3 & 0x19) != 0);

    -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackControlsIncludeDisplayModeControls:", (a3 >> 2) & 1);

    -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackControlsIncludeVolumeControls:", (a3 >> 1) & 1);

  }
}

- (AVPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (AVTurboModePlaybackControlsPlaceholderView)turboModeControlsView
{
  return self->_turboModeControlsView;
}

- (void)setPrefersCompactFullScreenControls:(BOOL)a3
{
  if (self->_prefersCompactFullScreenControls != a3)
  {
    self->_prefersCompactFullScreenControls = a3;
    -[AVMobileChromeControlsViewController _updateStyleSheet](self, "_updateStyleSheet");
  }
}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEnteringFullScreen:", v3);

}

- (void)setEmbeddedInlineLayoutMargins:(id)a3
{
  NSValue *v5;

  v5 = (NSValue *)a3;
  if (self->_embeddedInlineLayoutMargins != v5)
  {
    objc_storeStrong((id *)&self->_embeddedInlineLayoutMargins, a3);
    -[AVPlaybackControlsView setOverrideLayoutMarginsWhenEmbeddedInline:](self->_playbackControlsView, "setOverrideLayoutMarginsWhenEmbeddedInline:", v5);
  }

}

- (void)setVolumeController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  v4 = a3;
  -[AVMobileControlsViewController setVolumeController:](&v6, sel_setVolumeController_, v4);
  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVolumeController:", v4);

}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  v4 = a3;
  -[AVMobileControlsViewController setTransportBarCustomMenuItems:](&v6, sel_setTransportBarCustomMenuItems_, v4);
  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransportBarCustomMenuItems:", v4);

}

- (void)setTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transformForProminentPlayButton.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transformForProminentPlayButton.c = v4;
  *(_OWORD *)&self->_transformForProminentPlayButton.tx = v3;
}

- (void)setRoutingConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  v4 = a3;
  -[AVMobileControlsViewController setRoutingConfiguration:](&v6, sel_setRoutingConfiguration_, v4);
  -[AVPlaybackControlsView routePickerView](self->_playbackControlsView, "routePickerView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoutingConfiguration:", v4);

}

- (void)setControlItems:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  v4 = a3;
  -[AVMobileControlsViewController setControlItems:](&v6, sel_setControlItems_, v4);
  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomControlItems:", v4);

}

- (AVMobileChromeControlsViewController)initWithPlayerViewController:(id)a3
{
  id v4;
  AVMobileChromeControlsViewController *v5;
  AVMobileChromeControlsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromeControlsViewController;
  v5 = -[AVMobileChromeControlsViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playerViewController, v4);

  return v6;
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsViewController;
  -[AVMobileControlsViewController setOptimizeForPerformance:](&v4, sel_setOptimizeForPerformance_, a3);
  -[AVMobileChromeControlsViewController _loadControlsViewIfNeeded]((uint64_t)self);
}

- (void)_loadControlsViewIfNeeded
{
  void *v2;
  void *v3;
  AVMobileChromeControlsStyleSheet *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  AVTurboModePlaybackControlsPlaceholderView *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  if (a1)
  {
    objc_msgSend((id)a1, "viewIfLoaded");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2 || *(_QWORD *)(a1 + 1176))
      goto LABEL_15;
    v14 = v2;
    if (!*(_QWORD *)(a1 + 1152))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__updateStyleSheet, *MEMORY[0x1E0DC48E8], 0);

      v4 = [AVMobileChromeControlsStyleSheet alloc];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[AVMobileChromeControlsStyleSheet initWithTraitCollection:shouldUseCompactFullScreenSize:](v4, "initWithTraitCollection:shouldUseCompactFullScreenSize:", v6, *(unsigned __int8 *)(a1 + 1160));
      v8 = *(void **)(a1 + 1152);
      *(_QWORD *)(a1 + 1152) = v7;

    }
    if ((objc_msgSend((id)a1, "optimizeForPerformance") & 1) != 0)
    {
      v2 = v14;
      if (*(_QWORD *)(a1 + 1184))
      {
LABEL_15:

        return;
      }
      if (*(_QWORD *)(a1 + 1176))
      {
        _AVLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Never load the turboModePlaybackControlsPlaceholderView when the playbackControlsView is already loaded!", buf, 2u);
        }

      }
      v10 = [AVTurboModePlaybackControlsPlaceholderView alloc];
      objc_msgSend(*(id *)(a1 + 1136), "bounds");
      v11 = -[AVTurboModePlaybackControlsPlaceholderView initWithFrame:styleSheet:](v10, "initWithFrame:styleSheet:", *(_QWORD *)(a1 + 1152));
      v12 = *(void **)(a1 + 1184);
      *(_QWORD *)(a1 + 1184) = v11;

      objc_msgSend((id)a1, "playbackControlsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "turboModePlaybackControlsPlaceholderViewDidLoad:", *(_QWORD *)(a1 + 1184));

      objc_msgSend(*(id *)(a1 + 1136), "setActivePlaybackControlsView:", *(_QWORD *)(a1 + 1184));
    }
    else
    {
      -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded](a1);
    }
    v2 = v14;
    goto LABEL_15;
  }
}

- (void)_loadPlaybackControlsViewIfNeeded
{
  AVPlaybackControlsView *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 1176))
    {
      v2 = [AVPlaybackControlsView alloc];
      objc_msgSend(*(id *)(a1 + 1136), "bounds");
      v3 = -[AVPlaybackControlsView initWithFrame:styleSheet:](v2, "initWithFrame:styleSheet:", *(_QWORD *)(a1 + 1152));
      v4 = *(void **)(a1 + 1176);
      *(_QWORD *)(a1 + 1176) = v3;

      objc_msgSend(*(id *)(a1 + 1176), "setOverrideLayoutMarginsWhenEmbeddedInline:", *(_QWORD *)(a1 + 1168));
      objc_msgSend(*(id *)(a1 + 1176), "routePickerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "routingConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRoutingConfiguration:", v6);

      objc_msgSend((id)a1, "playbackControlsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackControlsViewDidLoad:", *(_QWORD *)(a1 + 1176));

      objc_msgSend(*(id *)(a1 + 1136), "setActivePlaybackControlsView:", *(_QWORD *)(a1 + 1176));
      v8 = *(void **)(a1 + 1184);
      *(_QWORD *)(a1 + 1184) = 0;

    }
  }
}

- (void)flashControlsWithDuration:(double)a3
{
  id v4;

  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashPlaybackControlsWithDuration:", a3);

}

- (void)loadView
{
  AVMobileChromeControlsView *v3;
  AVMobileChromeControlsView *controlsView;
  AVMobileChromeControlsView *v5;
  void *v6;

  v3 = objc_alloc_init(AVMobileChromeControlsView);
  controlsView = self->_controlsView;
  self->_controlsView = v3;

  v5 = self->_controlsView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromeControlsView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[AVMobileChromeControlsViewController setView:](self, "setView:", self->_controlsView);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_styleSheet)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsViewController;
  -[AVMobileChromeControlsViewController dealloc](&v4, sel_dealloc);
}

- (id)displayModeControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  return -[AVPlaybackControlsView screenModeControls](self->_playbackControlsView, "screenModeControls");
}

- (id)transportControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  return -[AVPlaybackControlsView transportControlsView](self->_playbackControlsView, "transportControlsView");
}

- (id)volumeControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  return -[AVPlaybackControlsView volumeControls](self->_playbackControlsView, "volumeControls");
}

- (BOOL)showsFullScreenControl
{
  void *v2;
  char v3;

  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsEnteringFullScreen");

  return v3;
}

- (void)didBeginIndirectUserInteraction
{
  id v2;

  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginShowingItemsDueToIndirectUserInteraction");

}

- (void)didEndIndirectUserInteraction
{
  id v2;

  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endShowingItemsDueToIndirectUserInteraction");

}

- (void)toggleVisibility:(id)a3
{
  id v3;

  -[AVMobileChromeControlsViewController playbackControlsController](self, "playbackControlsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "togglePlaybackControlsVisibility");

}

- (void)_updateStyleSheet
{
  AVMobileChromeControlsStyleSheet *v3;
  void *v4;
  void *v5;
  AVMobileChromeControlsStyleSheet *v6;
  AVMobileChromeControlsStyleSheet *styleSheet;

  v3 = [AVMobileChromeControlsStyleSheet alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVMobileChromeControlsStyleSheet initWithTraitCollection:shouldUseCompactFullScreenSize:](v3, "initWithTraitCollection:shouldUseCompactFullScreenSize:", v5, self->_prefersCompactFullScreenControls);
  styleSheet = self->_styleSheet;
  self->_styleSheet = v6;

  -[AVPlaybackControlsView setStyleSheet:](self->_playbackControlsView, "setStyleSheet:", self->_styleSheet);
  -[AVTurboModePlaybackControlsPlaceholderView setStyleSheet:](self->_turboModeControlsView, "setStyleSheet:", self->_styleSheet);
}

- (NSValue)embeddedInlineLayoutMargins
{
  return self->_embeddedInlineLayoutMargins;
}

- (BOOL)prefersCompactFullScreenControls
{
  return self->_prefersCompactFullScreenControls;
}

- (CGAffineTransform)transformForProminentPlayButton
{
  __int128 v3;

  v3 = *(_OWORD *)&self[25].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[24].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[25].d;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turboModeControlsView, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_storeStrong((id *)&self->_embeddedInlineLayoutMargins, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_playbackControlsController, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_destroyWeak((id *)&self->_playerViewController);
}

@end

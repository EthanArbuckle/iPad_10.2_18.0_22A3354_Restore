@implementation AVSeymourBehaviorContext

- (void)didRemoveBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel_seymourBehaviorContextDidReceiveButtonTap_, 64);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doneButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", v12, sel_doneButtonTapped_, 64);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controlsViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAction:withTarget:forEvent:", sel_seymourBehaviorContextDidReceiveButtonTap_, self, CFSTR("AVChromelessControlsDoneButtonPressedEvent"));

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlsViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:withTarget:forEvent:", sel_doneButtonTapped_, v16, CFSTR("AVChromelessControlsDoneButtonPressedEvent"));

}

- (AVSeymourBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVSeymourBehaviorContext *v5;
  AVSeymourBehaviorContext *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVSeymourBehaviorContext;
  v5 = -[AVSeymourBehaviorContext init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_playerViewController, v4);
    objc_msgSend(v4, "setSpeeds:", MEMORY[0x1E0C9AA60]);

  }
  return v6;
}

- (void)viewDidLoad
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVideoGravityButton:", 0);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackControlsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsExternalPlaybackButtonShown:", 0);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackControlsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doneButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeTarget:action:forControlEvents:", 0, sel_doneButtonTapped_, 64);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playbackControlsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doneButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_seymourBehaviorContextDidReceiveButtonTap_, 64);

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "controlsViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAction:withTarget:forEvent:", sel_doneButtonTapped_, v17, CFSTR("AVChromelessControlsDoneButtonPressedEvent"));

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "controlsViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:withTarget:forEvent:", sel_seymourBehaviorContextDidReceiveButtonTap_, self, CFSTR("AVChromelessControlsDoneButtonPressedEvent"));

  -[AVSeymourBehaviorContext _updateLegibleContentInsets](self, "_updateLegibleContentInsets");
}

- (void)setLegibleContentInsets:(NSEdgeInsets)a3
{
  self->_legibleContentInsets = a3;
  -[AVSeymourBehaviorContext _updateLegibleContentInsets](self, "_updateLegibleContentInsets");
}

- (void)_updateLegibleContentInsets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackContentContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerLayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVSeymourBehaviorContext legibleContentInsets](self, "legibleContentInsets");
  objc_msgSend(v8, "setLegibleContentInsets:");

}

- (void)hidePlaybackControlsImmediately
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVSeymourBehaviorContext hidePlaybackControlsImmediately]";
    v8 = 1024;
    v9 = 102;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  -[AVSeymourBehaviorContext playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackControlsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flashPlaybackControlsWithDuration:", 0.0);

}

- (void)seymourBehaviorContextDidReceiveButtonTap:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AVSeymourBehaviorContext behavior](self, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__AVSeymourBehaviorContext_seymourBehaviorContextDidReceiveButtonTap___block_invoke;
  v6[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "seymourBehaviorContext:didRecieveDoneButtonTapWithDismissalBlock:", self, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (id)behavior
{
  return objc_loadWeakRetained(&self->_behavior);
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak(&self->_behavior, a3);
}

- (NSEdgeInsets)legibleContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_legibleContentInsets.top;
  left = self->_legibleContentInsets.left;
  bottom = self->_legibleContentInsets.bottom;
  right = self->_legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __70__AVSeymourBehaviorContext_seymourBehaviorContextDidReceiveButtonTap___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "playerViewController");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject doneButtonTapped:](v3, "doneButtonTapped:", 0);
  }
  else
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "AVSeymourBehaviorContext is no longer around, playerViewController will not be dismissed.", v4, 2u);
    }
  }

}

@end

@implementation HUCameraPlayerAVBehavior

- (HUCameraPlayerAVBehavior)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPlayerAVBehavior.m"), 15, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraPlayerAVBehavior init]",
    v5);

  return 0;
}

- (HUCameraPlayerAVBehavior)initWithDelegate:(id)a3
{
  id v4;
  HUCameraPlayerAVBehavior *v5;
  HUCameraPlayerAVBehavior *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  v5 = -[HUCameraPlayerAVBehavior init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidToggleMuted:](&v8, sel_playbackControlsDidToggleMuted_);
  -[HUCameraPlayerAVBehavior delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HUCameraPlayerAVBehavior delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackControlsDidToggleMuted:", v3);

  }
}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidUpdateVisibilityOfLoadingIndicator:](&v8, sel_playbackControlsDidUpdateVisibilityOfLoadingIndicator_);
  -[HUCameraPlayerAVBehavior delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HUCameraPlayerAVBehavior delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackControlsDidUpdateVisibilityOfLoadingIndicator:", v3);

  }
}

- (void)pictureInPictureActionButtonTapped
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HUCameraPlayerAVBehavior *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ pictureInPictureActionButtonTapped.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior pictureInPictureActionButtonTapped](&v7, sel_pictureInPictureActionButtonTapped);
  -[HUCameraPlayerAVBehavior delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUCameraPlayerAVBehavior delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pictureInPictureDidToggleMicrophone");

  }
}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  void *v5;
  int v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidChangePlayerVolume:](&v8, sel_playbackControlsDidChangePlayerVolume_);
  -[HUCameraPlayerAVBehavior delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");

    if (!v6)
      return;
    -[HUCameraPlayerAVBehavior delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = a3;
    objc_msgSend(v5, "playbackControlsDidChangePlayerVolume:", v7);
  }

}

- (void)beginScrubbing
{
  NSObject *v3;
  void *v4;
  int v5;
  HUCameraPlayerAVBehavior *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEBUG, "%@ beginScrubbing", (uint8_t *)&v5, 0xCu);
  }

  -[AVHomeIPCameraBehavior behaviorContext](self, "behaviorContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginScrubbing");

}

- (void)endScrubbingWithTargetTime:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HUCameraPlayerAVBehavior *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "%@ endScrubbingWithTargetTime: %.3f", (uint8_t *)&v8, 0x16u);
  }

  -[AVHomeIPCameraBehavior behaviorContext](self, "behaviorContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrubToTime:resolution:", a3, 0.0);

  -[AVHomeIPCameraBehavior behaviorContext](self, "behaviorContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endScrubbing");

}

- (void)scrubToTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  int v10;
  HUCameraPlayerAVBehavior *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HUCameraPlayerAVBehavior delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentScrubberResolutionForBehavior:", self);
  v7 = v6;

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = v7;
    _os_log_debug_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEBUG, "%@ scrubToTime: %.3f (resolution: %f)", (uint8_t *)&v10, 0x20u);
  }

  -[AVHomeIPCameraBehavior behaviorContext](self, "behaviorContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrubToTime:resolution:", a3, v7);

}

- (HUCameraPlayerAVBehaviorDelegate)delegate
{
  return (HUCameraPlayerAVBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

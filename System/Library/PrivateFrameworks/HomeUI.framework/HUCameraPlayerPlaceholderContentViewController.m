@implementation HUCameraPlayerPlaceholderContentViewController

- (HUCameraPlayerPlaceholderContentViewController)initWithPlaybackEngine:(id)a3
{
  id v4;
  HUCameraPlayerPlaceholderContentViewController *v5;
  HUCameraPlayerPlaceholderContentViewController *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCameraPlayerPlaceholderContentViewController;
  v5 = -[HUCameraPlayerPlaceholderContentViewController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(MEMORY[0x1E0D31250], "defaultOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:withOptions:", v6, v8);

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUCameraPlayerPlaceholderContentViewController;
  -[HUCameraPlayerPlaceholderContentViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HUCameraPlayerPlaceholderContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[HUCameraPlayerPlaceholderContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerPlaceholderContentViewController placeholderImageView](self, "placeholderImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naui_addAutoLayoutSubview:", v5);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraPlayerPlaceholderContentViewController placeholderImageView](self, "placeholderImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerPlaceholderContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v9);

  -[HUCameraPlayerPlaceholderContentViewController updatePlaceholderContent](self, "updatePlaceholderContent");
}

- (void)setCameraPlayerHasContentToShow:(BOOL)a3
{
  if (self->_cameraPlayerHasContentToShow != a3)
  {
    self->_cameraPlayerHasContentToShow = a3;
    -[HUCameraPlayerPlaceholderContentViewController updatePlaceholderContent](self, "updatePlaceholderContent");
  }
}

- (BOOL)shouldShowPlaceholderContent
{
  BOOL v3;
  char v4;

  v3 = -[HUCameraPlayerPlaceholderContentViewController _shouldShowDefaultPlaceholderContent](self, "_shouldShowDefaultPlaceholderContent");
  v4 = -[HUCameraPlayerPlaceholderContentViewController _shouldShowPlaceholderContentForUserScrubbing](self, "_shouldShowPlaceholderContentForUserScrubbing")|| v3;
  return v4 & ~-[HUCameraPlayerPlaceholderContentViewController _shouldHidePlaceholderContentForCurrentAccessMode](self, "_shouldHidePlaceholderContentForCurrentAccessMode");
}

- (void)updatePlaceholderContent
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _DWORD v19[2];
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[HUCameraPlayerPlaceholderContentViewController shouldShowPlaceholderContent](self, "shouldShowPlaceholderContent");
  if (v5)
  {
    -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipPlaybackDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findClipPositionForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentClip");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "offset");
      objc_msgSend(v9, "cachedPosterFrameImageForClip:offset:requestor:", v14, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentClip");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "representativeImageForClip:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109376;
    v19[1] = v5;
    v20 = 1024;
    v21 = v15 != 0;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Placeholder - should show:%{BOOL}d has image:%{BOOL}d", (uint8_t *)v19, 0xEu);
  }

  -[HUCameraPlayerPlaceholderContentViewController updatePlaceholderImage:](self, "updatePlaceholderImage:", v15);
}

- (void)updatePlaceholderImage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke;
  v6[3] = &unk_1E6F4C638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "placeholderImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke_2;
  v6[3] = &unk_1E6F4C638;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.3);

}

void __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "placeholderImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

  if (*(_QWORD *)(a1 + 40))
    v4 = (double)(objc_msgSend(*(id *)(a1 + 32), "_shouldHidePlaceholderContentForCurrentAccessMode") ^ 1);
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "placeholderImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (BOOL)_shouldShowPlaceholderContentForUserScrubbing
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUserScrubbing"))
  {
    -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "timelineState") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldHidePlaceholderContentForCurrentAccessMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  BOOL v11;

  -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentAccessMode");

  -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "engineMode");
  if (v6)
    v9 = v6 == 3;
  else
    v9 = 1;
  v10 = v9;
  if (v8)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (BOOL)_shouldShowDefaultPlaceholderContent
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "contentType") == 1)
  {
    -[HUCameraPlayerPlaceholderContentViewController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "timeControlStatus") == 1)
      v6 = !-[HUCameraPlayerPlaceholderContentViewController cameraPlayerHasContentToShow](self, "cameraPlayerHasContentToShow");
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (UIImageView)placeholderImageView
{
  UIImageView *placeholderImageView;
  UIImageView *v4;
  UIImageView *v5;

  placeholderImageView = self->_placeholderImageView;
  if (!placeholderImageView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
    v5 = self->_placeholderImageView;
    self->_placeholderImageView = v4;

    placeholderImageView = self->_placeholderImageView;
  }
  return placeholderImageView;
}

- (BOOL)cameraPlayerHasContentToShow
{
  return self->_cameraPlayerHasContentToShow;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (HMCameraClip)lastRequestedClip
{
  return self->_lastRequestedClip;
}

- (void)setLastRequestedClip:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestedClip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestedClip, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end

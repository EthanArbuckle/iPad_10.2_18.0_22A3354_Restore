@implementation AVPlaybackControlsController

- (void)_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  BOOL v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  _BOOL4 v49;

  v3 = a3;
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v3;
  if (objc_msgSend(v6, "isPresenting"))
  {
    -[AVPlaybackControlsController playerViewController](self, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (unint64_t)(objc_msgSend(v9, "finalInterfaceOrientation") - 1) < 2;

  }
  else
  {
    v48 = 0;
  }

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isRotated");
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v13 & 1) != 0)
    v20 = objc_msgSend(v18, "verticalSizeClass");
  else
    v20 = objc_msgSend(v18, "horizontalSizeClass");
  v21 = v20;

  v22 = -[AVPlaybackControlsController shouldShowVolumeControlInTransportBar](self, "shouldShowVolumeControlInTransportBar");
  if (-[AVPlaybackControlsController playbackControlsIncludeVolumeControls](self, "playbackControlsIncludeVolumeControls"))
  {
    v23 = v21 == 1 && v48;
    v24 = 0;
    if (-[AVPlaybackControlsController volumeControlsCanShowSlider](self, "volumeControlsCanShowSlider") && !v23)
    {
      -[AVPlaybackControlsController volumeController](self, "volumeController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "currentRouteHasVolumeControl"))
      {
        -[AVPlaybackControlsController playerController](self, "playerController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v26, "isPlayingOnExternalScreen") & 1) != 0)
        {
          v24 = 0;
        }
        else
        {
          -[AVPlaybackControlsController playerController](self, "playerController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_msgSend(v27, "isPlayingOnSecondScreen") & 1) == 0
             && -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea") != 1;

        }
      }
      else
      {
        v24 = 0;
      }

    }
  }
  else
  {
    v24 = 0;
  }
  if (-[AVPlaybackControlsController playbackControlsIncludeVolumeControls](self, "playbackControlsIncludeVolumeControls"))
  {
    v28 = v22 ^ 1;
  }
  else
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "customAudioItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count"))
      v28 = 0;
    else
      v28 = v22 ^ 1;

  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "transportControlsView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTransportViewIncludesVolumeController:", v22);

  if (v24)
    v33 = v49 & (v22 ^ 1);
  else
    v33 = 0;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "volumeSlider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v33 == objc_msgSend(v35, "isIncluded"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "volumeButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isIncluded");

    if ((_DWORD)v28 == v38)
      goto LABEL_52;
  }
  else
  {

  }
  if ((_DWORD)v33)
  {
    -[AVPlaybackControlsController volumeController](self, "volumeController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "volume");
    -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);

  }
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "volumeControls");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isHiddenOrHasHiddenAncestor") & 1) != 0)
    {
      v42 = 0;
    }
    else
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "volumeControls");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "_isInAWindow")
        && !-[AVPlaybackControlsController isResumingUpdates](self, "isResumingUpdates"))
      {
        -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "avkit_wantsAnimatedViewTransitions"))
        {
          -[AVPlaybackControlsController playerViewController](self, "playerViewController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v46, "hasActiveTransition") ^ 1;

        }
        else
        {
          v42 = 0;
        }

      }
      else
      {
        v42 = 0;
      }

    }
  }
  else
  {
    v42 = 0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setPrefersVolumeSliderExpanded:prefersVolumeButtonIncluded:animated:", v33, v28, v42);

LABEL_52:
  -[AVPlaybackControlsController _updateVolumeButtonGlyph](self, "_updateVolumeButtonGlyph");
}

- (AVPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (id)playerViewControllerContentViewOverrideLayoutClass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasActiveTransition"))
  {
    objc_msgSend(v4, "sourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "initialInterfaceOrientation");

    objc_msgSend(v4, "currentTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "finalInterfaceOrientation");

    v10 = objc_msgSend(v4, "isPresenting");
    v11 = objc_msgSend(v4, "isDismissing");
    objc_msgSend(v4, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transitionCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCancelled");

    objc_msgSend(v4, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isInteractive");

    if (v14 | v17)
      v18 = v10;
    else
      v18 = v11;
    if (!v5)
      v18 = 0;
    if ((v18 & 1) != 0)
    {
      v19 = &unk_1E5BF3858;
    }
    else
    {
      if (v14 | v17)
        v20 = v7;
      else
        v20 = v9;
      if ((unint64_t)(v20 - 1) >= 2)
        v21 = &unk_1E5BF3888;
      else
        v21 = &unk_1E5BF3870;
      v19 = v21;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)playerViewControllerContentViewHasActiveTransition:(id)a3
{
  void *v3;
  char v4;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActiveTransition");

  return v4;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (BOOL)volumeControlsCanShowSlider
{
  return self->_volumeControlsCanShowSlider;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

void __109__AVPlaybackControlsController__observeBoolForKeyPath_usingKeyValueObservationController_observationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a4, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v5, "BOOLValue"));

}

- (BOOL)shouldShowVolumeControlInTransportBar
{
  return 0;
}

- (id)_volumeButtonMicaPackageState
{
  void *v2;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;
  int v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  double v15;

  if (-[AVPlaybackControlsController prefersMuted](self, "prefersMuted"))
    goto LABEL_15;
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "currentRouteHasVolumeControl");

  v6 = &AVVolumeGlyphStateNameMax;
  if (!(_DWORD)v5)
    return *v6;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !-[AVPlaybackControlsController isResumingUpdates](self, "isResumingUpdates"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeSlider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isHiddenOrHasHiddenAncestor") & 1) == 0)
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "volumeSlider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v11 = v14;

      goto LABEL_11;
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "volume");
  v11 = v10;

  if (v8)
  {
LABEL_11:

  }
  if (v11 <= 0.0)
  {
LABEL_15:
    v6 = AVVolumeGlyphStateNameMuted;
    return *v6;
  }
  v15 = v11;
  if (v11 >= 0.33)
  {
    if (v15 >= 0.66)
    {
      if (v15 < 0.95)
        v6 = AVVolumeGlyphStateNameHigh;
    }
    else
    {
      v6 = AVVolumeGlyphStateNameMedium;
    }
  }
  else
  {
    v6 = AVVolumeGlyphStateNameLow;
  }
  return *v6;
}

- (AVVolumeController)volumeController
{
  return self->_volumeController;
}

- (BOOL)prefersMuted
{
  return self->_prefersMuted;
}

- (void)_updateVolumeButtonGlyph
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVPlaybackControlsController _volumeButtonMicaPackageState](self, "_volumeButtonMicaPackageState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMicaPackageStateName:", v6);

  -[AVPlaybackControlsController turboModePlaybackControlsPlaceholderView](self, "turboModePlaybackControlsPlaceholderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVolumeButtonMicaPackageStateName:", v6);

}

- (AVTurboModePlaybackControlsPlaceholderView)turboModePlaybackControlsPlaceholderView
{
  return (AVTurboModePlaybackControlsPlaceholderView *)objc_loadWeakRetained((id *)&self->_turboModePlaybackControlsPlaceholderView);
}

- (BOOL)_prefersVolumeSliderExpandedAutomatically
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  char v23;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 == 2)
  {
    -[AVPlaybackControlsController pendingOrientationChange](self, "pendingOrientationChange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)(objc_msgSend(v10, "integerValue") - 3) < 0xFFFFFFFFFFFFFFFELL;

  }
  else
  {
    v11 = 0;
  }
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (v15 == 1)
  {
    -[AVPlaybackControlsController pendingOrientationChange](self, "pendingOrientationChange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (unint64_t)(objc_msgSend(v16, "integerValue") - 3) < 2;

  }
  else
  {
    v17 = 0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "customAudioItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
    goto LABEL_8;
  v21 = -[AVPlaybackControlsController volumeControlsCanShowSlider](self, "volumeControlsCanShowSlider");
  if (!v21)
    return v21;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isPlayingOnExternalScreen");

  if ((v23 & 1) != 0)
  {
LABEL_8:
    LOBYTE(v21) = 0;
  }
  else
  {
    LOBYTE(v21) = -[AVPlaybackControlsController isFullScreen](self, "isFullScreen");
    if (v21 && v5 != 2)
      LOBYTE(v21) = v17 || v11;
  }
  return v21;
}

- (BOOL)isFullScreen
{
  return -[AVPlaybackControlsController playerViewControllerIsPresentingFullScreen](self, "playerViewControllerIsPresentingFullScreen")|| -[AVPlaybackControlsController playerViewControllerIsPresentedFullScreen](self, "playerViewControllerIsPresentedFullScreen")|| -[AVPlaybackControlsController isCoveringWindow](self, "isCoveringWindow");
}

- (BOOL)playerViewControllerIsPresentingFullScreen
{
  return self->_playerViewControllerIsPresentingFullScreen;
}

- (BOOL)playerViewControllerIsPresentedFullScreen
{
  return self->_playerViewControllerIsPresentedFullScreen;
}

- (BOOL)isCoveringWindow
{
  return self->_coveringWindow;
}

void __71__AVPlaybackControlsController__bindInclusionOfControlItems_toKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  id *v8;
  uint64_t i;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v19 = a1;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    v8 = (id *)(a1 + 40);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "setIncluded:", a2, v19);
        WeakRetained = objc_loadWeakRetained(v8);
        objc_msgSend(WeakRetained, "playbackControlsView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "transportControlsView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "isDescendantOfView:", v13);

        v6 |= v10;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v14 = objc_loadWeakRetained((id *)(v19 + 40));
  objc_msgSend(v14, "playbackControlsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsLayout");

  if ((v6 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)(v19 + 40));
    objc_msgSend(v16, "playbackControlsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transportControlsView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_18(uint64_t a1, uint64_t a2)
{
  id *v4;
  id v5;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  if ((_DWORD)a2
    && (v4 = (id *)(a1 + 32),
        v5 = objc_loadWeakRetained((id *)(a1 + 32)),
        objc_msgSend(v5, "loadingIndicatorTimerDelay"),
        v7 = v6,
        v5,
        v7 > 0.0))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = (void *)MEMORY[0x1E0C99E88];
    v10 = WeakRetained;
    objc_msgSend(v10, "loadingIndicatorTimerDelay");
    v12 = v11;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_19;
    v18[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v19, v4);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v18, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoadingIndicatorTimer:", v13);

    objc_destroyWeak(&v19);
  }
  else
  {
    v14 = (id *)(a1 + 32);
    v15 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v15, "loadingIndicatorTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    v17 = objc_loadWeakRetained(v14);
    objc_msgSend(v17, "setShowsLoadingIndicator:", a2);

  }
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateOrCreateTimeResolverIfNeeded");

}

- (double)loadingIndicatorTimerDelay
{
  return self->_loadingIndicatorTimerDelay;
}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateOrCreateTimeResolverIfNeeded");
}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateVideoGravityButtonType");
}

- (NSTimer)loadingIndicatorTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_loadingIndicatorTimer);
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateControlInclusion");

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContainerInclusion");

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_11(uint64_t a1, uint64_t a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v4, "_prefersVolumeSliderExpandedAutomatically"));

  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", a2);

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_10(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContainerInclusion");

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersSystemVolumeHUDHidden:", a2);

  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "setFullScreen:", a2);

  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v9, "_prefersVolumeSliderExpandedAutomatically"));

  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "playbackControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(v4);
  objc_msgSend(v10, "setPrefersVolumeSliderExpandedAutomatically:", objc_msgSend(v11, "_prefersVolumeSliderExpandedAutomatically"));

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "prominentPlayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
    v5 = CFSTR("pause.fill");
  else
    v5 = CFSTR("play.fill");
  objc_msgSend(v3, "setAlternateImageName:", v5);

}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setLoadingIndicatorTimerDelay:", 0.75);

  }
}

- (void)setLoadingIndicatorTimer:(id)a3
{
  objc_storeWeak((id *)&self->_loadingIndicatorTimer, a3);
}

- (BOOL)isScrubbingOrSeeking
{
  return self->_scrubbingOrSeeking;
}

- (CGRect)playbackViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_playbackViewFrame.origin.x;
  y = self->_playbackViewFrame.origin.y;
  width = self->_playbackViewFrame.size.width;
  height = self->_playbackViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showsTransportControls
{
  if (-[AVPlaybackControlsController isFullScreen](self, "isFullScreen"))
    return 1;
  if (-[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea") == 2)
    return 0;
  return !-[AVPlaybackControlsController shouldEnterFullScreenWhenPlaybackBegins](self, "shouldEnterFullScreenWhenPlaybackBegins");
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_showsPlaybackControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPlaybackControlsController setShowsPlaybackControls:]";
      v11 = "showsPlaybackControls";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_showsPlaybackControls = v3;
    -[AVPlaybackControlsController _updatePlaybackControlsVisibleAndObservingUpdates](self, "_updatePlaybackControlsVisibleAndObservingUpdates");
    -[AVPlaybackControlsController turboModePlaybackControlsPlaceholderView](self, "turboModePlaybackControlsPlaceholderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", !v3);

  }
}

- (void)setHasCustomPlaybackControls:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_hasCustomPlaybackControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlaybackControlsController setHasCustomPlaybackControls:]";
      v10 = "hasCustomPlaybackControls";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_hasCustomPlaybackControls = v3;
  }
}

- (BOOL)playerViewControllerContentViewShouldApplyAutomaticVideoGravity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  BOOL IsEmpty;
  double Width;
  double Height;
  BOOL v34;
  BOOL v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v4 = a3;
  if (!objc_msgSend(v4, "canAutomaticallyZoomLetterboxVideos"))
    goto LABEL_16;
  if (!objc_msgSend(v4, "isCoveringWindow"))
    goto LABEL_16;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayCornerRadius");
  v7 = v6;

  if (v7 <= 0.0)
    goto LABEL_16;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentDimensions");
  v10 = v9;
  v12 = v11;

  v13 = v12 <= 0.0 ? NAN : v10 / v12;
  objc_msgSend(v4, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v4, "edgeInsetsForLetterboxedContent");
  v24 = v21 - (v22 + v23);
  v27 = v19 - (v25 + v26);
  v28 = v17 + v22;
  v29 = v15 + v25;
  v37.origin.x = v29;
  v37.origin.y = v28;
  v37.size.width = v27;
  v37.size.height = v24;
  if (CGRectIsEmpty(v37))
    goto LABEL_16;
  objc_msgSend(v4, "bounds");
  if (CGRectIsEmpty(v38))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "nativeBounds");
  IsEmpty = CGRectIsEmpty(v39);

  if (IsEmpty)
    goto LABEL_16;
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v40);
  objc_msgSend(v4, "bounds");
  Height = CGRectGetHeight(v41);
  v42.origin.x = v29;
  v42.origin.y = v28;
  v42.size.width = v27;
  v42.size.height = v24;
  if (CGRectGetMinY(v42) <= 0.0)
  {
LABEL_16:
    v35 = 0;
  }
  else
  {
    v34 = v13 > 1.0;
    if (v13 < Width / Height)
      v34 = 0;
    v35 = v13 / (Width / Height) < 1.15 && v34;
  }

  return v35;
}

- (void)setShowsPictureInPictureButton:(BOOL)a3
{
  if (self->_showsPictureInPictureButton != a3)
  {
    self->_showsPictureInPictureButton = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)setShowsDoneButtonWhenFullScreen:(BOOL)a3
{
  if (self->_showsDoneButtonWhenFullScreen != a3)
  {
    self->_showsDoneButtonWhenFullScreen = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)setPlayerViewControllerIsPresentingFullScreen:(BOOL)a3
{
  if (self->_playerViewControllerIsPresentingFullScreen != a3)
  {
    self->_playerViewControllerIsPresentingFullScreen = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)setPlayerViewControllerIsPresentedFullScreen:(BOOL)a3
{
  if (self->_playerViewControllerIsPresentedFullScreen != a3)
  {
    self->_playerViewControllerIsPresentedFullScreen = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)setPlayerViewControllerHasInvalidViewControllerHierarchy:(BOOL)a3
{
  self->_playerViewControllerHasInvalidViewControllerHierarchy = a3;
}

- (BOOL)isStartRightwardContentTransitionButtonEnabled
{
  return self->_startRightwardContentTransitionButtonEnabled;
}

- (BOOL)isStartLeftwardContentTransitionButtonEnabled
{
  return self->_startLeftwardContentTransitionButtonEnabled;
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 != 1)
  {
    if (v7 == 2)
    {
      objc_msgSend(v10, "setLoadingIndicatorTimerDelay:", 0.0666666667);
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", objc_msgSend(v9, "status") == 2, v7, 0);

}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id WeakRetained;
  id v12;
  id v13;
  double v14;
  id v15;
  id v16;
  char v17;
  void *v18;
  double v19;
  id v20;

  v5 = a4;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "oldValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "setTimeControlStatus:", v7);

  v12 = objc_loadWeakRetained(v10);
  if (!objc_msgSend(v12, "hasPlaybackBegunSincePlayerControllerBecameReadyToPlay"))
  {
LABEL_4:

    v14 = 3.0;
    if (v7 == 2)
      goto LABEL_13;
    goto LABEL_12;
  }
  v13 = objc_loadWeakRetained(v10);
  if (objc_msgSend(v13, "isShowingPlaybackControls"))
  {

    goto LABEL_4;
  }
  v15 = objc_loadWeakRetained(v10);
  if (!objc_msgSend(v15, "isShowingPlaybackControls") && v9 == 2 && v7 == 1)
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v14 = v19;

LABEL_13:
    v20 = objc_loadWeakRetained(v10);
    objc_msgSend(v20, "flashPlaybackControlsWithDuration:", v14);

    return;
  }
  v16 = objc_loadWeakRetained(v10);
  v17 = objc_msgSend(v16, "isShowingPlaybackControls");

  if ((v17 & 1) == 0 && !v7)
    goto LABEL_12;
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVPlaybackControlsController flashPlaybackControlsWithDuration:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s duration: %f", (uint8_t *)&v8, 0x16u);
  }

  if (!-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isPlayingOnExternalScreen"))
    {

    }
    else
    {
      v7 = -[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls");

      if (v7)
      {
        -[AVPlaybackControlsController showPlaybackControls:immediately:](self, "showPlaybackControls:immediately:", 1, 0);
        -[AVPlaybackControlsController _autoHideControlsAfterDelay:](self, "_autoHideControlsAfterDelay:", a3);
      }
    }
  }
}

- (void)setTimeControlStatus:(int64_t)a3
{
  self->_timeControlStatus = a3;
}

- (void)_updateScrubberAndTimeLabels
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
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
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  int v87;
  int v88;
  int v89;
  double v90;
  id v91;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControlsView");
  v91 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[AVPlaybackControlsController needsTimeResolver](self, "needsTimeResolver")
    || (-[AVPlaybackControlsController timeResolver](self, "timeResolver"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v16 = 0;
    if (v17)
      goto LABEL_26;
    goto LABEL_18;
  }
  -[AVPlaybackControlsController maximumTime](self, "maximumTime");
  v6 = v5;
  -[AVPlaybackControlsController minimumTime](self, "minimumTime");
  v8 = v6 - v7;
  -[AVPlaybackControlsController elapsedTimeFormatter](self, "elapsedTimeFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFormatTemplate:", v8);

  -[AVPlaybackControlsController remainingTimeFormatter](self, "remainingTimeFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFormatTemplate:", v8);

  if (objc_msgSend(v91, "liveStreamingControlsIncludeScrubber"))
  {
    -[AVPlaybackControlsController elapsedTimeFormatter](self, "elapsedTimeFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController minimumTime](self, "minimumTime");
    v13 = v12;
    -[AVPlaybackControlsController maximumTime](self, "maximumTime");
    objc_msgSend(v11, "stringFromSeconds:", v13 - v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &stru_1E5BB5F88;
  }
  else
  {
    if (-[AVPlaybackControlsController showsTimecodes](self, "showsTimecodes")
      && (-[AVPlaybackControlsController playerController](self, "playerController"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "hasReadableTimecodes"),
          v18,
          v19))
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timecodeForCurrentTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVPlaybackControlsController playerController](self, "playerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "maxTimecode");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AVPlaybackControlsController elapsedTimeFormatter](self, "elapsedTimeFormatter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackControlsController targetTime](self, "targetTime");
      objc_msgSend(v22, "stringFromSeconds:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVPlaybackControlsController remainingTimeFormatter](self, "remainingTimeFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackControlsController maximumTime](self, "maximumTime");
      v24 = v23;
      -[AVPlaybackControlsController targetTime](self, "targetTime");
      objc_msgSend(v11, "stringFromSeconds:", v24 - v25);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (__CFString *)v21;
  }

  -[AVPlaybackControlsController minimumTime](self, "minimumTime");
  -[AVPlaybackControlsController minimumTime](self, "minimumTime");
  if (fabs(v26) == INFINITY)
    goto LABEL_18;
  -[AVPlaybackControlsController maximumTime](self, "maximumTime");
  -[AVPlaybackControlsController maximumTime](self, "maximumTime");
  if (fabs(v27) == INFINITY)
    goto LABEL_18;
  -[AVPlaybackControlsController currentTime](self, "currentTime");
  -[AVPlaybackControlsController currentTime](self, "currentTime");
  if (fabs(v28) == INFINITY)
    goto LABEL_18;
  -[AVPlaybackControlsController maximumTime](self, "maximumTime");
  v30 = v29;
  -[AVPlaybackControlsController minimumTime](self, "minimumTime");
  if (v30 - v31 <= 0.0
    || (-[AVPlaybackControlsController currentTime](self, "currentTime"),
        v33 = v32,
        -[AVPlaybackControlsController minimumTime](self, "minimumTime"),
        v33 < v34)
    && (-[AVPlaybackControlsController currentTime](self, "currentTime"),
        v36 = v35,
        -[AVPlaybackControlsController maximumTime](self, "maximumTime"),
        v36 > v37))
  {
LABEL_18:
    -[AVPlaybackControlsController elapsedTimeFormatter](self, "elapsedTimeFormatter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringFromSeconds:", NAN);
    v39 = objc_claimAutoreleasedReturnValue();

    -[AVPlaybackControlsController remainingTimeFormatter](self, "remainingTimeFormatter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringFromSeconds:", NAN);
    v41 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "scrubber");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 0;
    objc_msgSend(v42, "setMinimumValue:", v43);

    objc_msgSend(v91, "scrubber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = 0;
    objc_msgSend(v44, "setValue:animated:", 0, v45);

    objc_msgSend(v91, "scrubber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1.0;
    objc_msgSend(v46, "setMaximumValue:", v47);
    v16 = (__CFString *)v41;
    v15 = (void *)v39;
    goto LABEL_19;
  }
  -[AVPlaybackControlsController minimumTime](self, "minimumTime");
  v72 = v71;
  -[AVPlaybackControlsController maximumTime](self, "maximumTime");
  v74 = v73;
  objc_msgSend(v91, "scrubber");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v76 = v72;
  objc_msgSend(v75, "setMinimumValue:", v76);

  objc_msgSend(v91, "scrubber");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v78 = v74;
  objc_msgSend(v77, "setMaximumValue:", v78);

  objc_msgSend(v91, "scrubber");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v46, "isTracking") & 1) == 0)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v79, "isPlayingOnExternalScreen") & 1) != 0)
    {
      objc_msgSend(v91, "scrubber");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "timeIntervalSinceTrackingEnded");
      v82 = v81;

      if (v82 <= 0.5)
        goto LABEL_20;
    }
    else
    {

    }
    -[AVPlaybackControlsController targetTime](self, "targetTime");
    v84 = v83;
    -[AVPlaybackControlsController playerController](self, "playerController");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "hasSeekableLiveStreamingContent"))
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "isPlaying");

      v88 = v87 ^ 1;
    }
    else
    {
      v88 = 1;
    }

    if (v84 < v74 + -5.0)
      v89 = 1;
    else
      v89 = v88;
    if (v89)
      v74 = v84;
    objc_msgSend(v91, "scrubber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v90 = v74;
    objc_msgSend(v46, "setValue:animated:", 0, v90);
  }
LABEL_19:

LABEL_20:
  if (v15 && v16)
  {
    objc_msgSend(v91, "elapsedTimeLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "text");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "elapsedTimeLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "text");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "elapsedTimeLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setText:", v15);

    objc_msgSend(v91, "timeRemainingLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setText:", v16);

    v54 = objc_msgSend(v49, "length");
    if (v54 != objc_msgSend(v15, "length")
      || (v55 = objc_msgSend(v51, "length"), v55 != -[__CFString length](v16, "length")))
    {
      objc_msgSend(v91, "setNeedsLayout");
    }

  }
LABEL_26:
  -[AVPlaybackControlsController playerController](self, "playerController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_34;
  }
  -[AVPlaybackControlsController playerController](self, "playerController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "interstitialController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "currentInterstitialTimeRange");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
LABEL_34:
    objc_msgSend(v91, "scrubber");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    v70 = 0;
    goto LABEL_35;
  }
  -[AVPlaybackControlsController playerController](self, "playerController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "player");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "currentItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "interstitialTimeRanges");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v63, "count"))
  {
LABEL_31:

    v66 = v91;
    goto LABEL_32;
  }
  objc_msgSend(v91, "scrubber");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "interstitialDisplayTimes");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v91;
  if (!v65)
  {
    objc_msgSend(v91, "scrubber");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController playerController](self, "playerController");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "player");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "currentItem");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "interstitialTimeRanges");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setInterstitialDisplayTimes:", v67);

    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(v66, "scrubber");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  v70 = 1;
LABEL_35:
  objc_msgSend(v68, "setShowsTimelineMarkers:", v70);

}

- (double)maximumTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 2)
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxTime");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

- (double)currentTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 2)
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTime");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

- (double)minimumTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 2)
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minTime");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

- (AVPlayerControllerTimeResolver)timeResolver
{
  return self->_timeResolver;
}

- (BOOL)showsProminentPlayButton
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = -[AVPlaybackControlsController shouldEnterFullScreenWhenPlaybackBegins](self, "shouldEnterFullScreenWhenPlaybackBegins")|| -[AVPlaybackControlsController showsMinimalPlaybackControlsWhenEmbeddedInline](self, "showsMinimalPlaybackControlsWhenEmbeddedInline");
  if (-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
    || !-[AVPlaybackControlsController playbackControlsIncludeTransportControls](self, "playbackControlsIncludeTransportControls")|| -[AVPlaybackControlsController hasPlaybackBegunSincePlayerControllerBecameReadyToPlay](self, "hasPlaybackBegunSincePlayerControllerBecameReadyToPlay")&& !v3)
  {
    goto LABEL_27;
  }
  -[AVPlaybackControlsController pictureInPictureController](self, "pictureInPictureController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isPictureInPictureActive") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "status") == 3)
    {
      v5 = 0;
    }
    else
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isPlayingOnExternalScreen") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        -[AVPlaybackControlsController playerController](self, "playerController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "hasVideo") & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          -[AVPlaybackControlsController playerController](self, "playerController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v9, "hasEnabledAudio") ^ 1;

        }
      }

    }
  }

  if (-[AVPlaybackControlsController playButtonsShowPauseGlyph](self, "playButtonsShowPauseGlyph"))
    goto LABEL_20;
  if (!v3)
  {
    -[AVPlaybackControlsController playButtonHandlerForLazyPlayerLoading](self, "playButtonHandlerForLazyPlayerLoading");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          -[AVPlaybackControlsController playerController](self, "playerController"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "status"),
          v12,
          v11,
          v13))
    {
LABEL_20:
      if (-[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea") == 2)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if (!-[AVPlaybackControlsController hasPlaybackBegunSincePlayerControllerBecameReadyToPlay](self, "hasPlaybackBegunSincePlayerControllerBecameReadyToPlay"))return v5 & ~-[AVPlaybackControlsController playButtonsShowPauseGlyph](self, "playButtonsShowPauseGlyph");
LABEL_27:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (AVPlayerController)playerController
{
  return (AVPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (BOOL)hasPlaybackBegunSincePlayerControllerBecameReadyToPlay
{
  return self->_hasPlaybackBegunSincePlayerControllerBecameReadyToPlay;
}

- (AVPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

- (BOOL)shouldEnterFullScreenWhenPlaybackBegins
{
  _BOOL4 v3;

  v3 = -[AVPlaybackControlsController entersFullScreenWhenPlaybackBegins](self, "entersFullScreenWhenPlaybackBegins");
  if (v3)
  {
    if (-[AVPlaybackControlsController hasPlaybackBegunSincePlayerControllerBecameReadyToPlay](self, "hasPlaybackBegunSincePlayerControllerBecameReadyToPlay"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[AVPlaybackControlsController playerViewControllerHasInvalidViewControllerHierarchy](self, "playerViewControllerHasInvalidViewControllerHierarchy");
    }
  }
  return v3;
}

- (BOOL)entersFullScreenWhenPlaybackBegins
{
  return self->_entersFullScreenWhenPlaybackBegins;
}

- (BOOL)playButtonsShowPauseGlyph
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char v8;
  BOOL v9;
  char v10;
  char v11;
  BOOL v12;
  char v13;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeRate");
  v5 = v4;
  if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
  {
    objc_msgSend(v3, "suspendedRate");
    v7 = v6;
    v8 = objc_msgSend(v3, "isPlaybackSuspended");
    v9 = v7 > 0.0 || v7 < 0.0;
    v10 = v8 & v9;
  }
  else
  {
    v10 = 0;
  }
  if (-[AVPlaybackControlsController timeControlStatus](self, "timeControlStatus"))
  {
    v11 = 1;
  }
  else
  {
    v12 = -[AVPlaybackControlsController isPlaybackSuspendedForScrubbing](self, "isPlaybackSuspendedForScrubbing");
    v13 = v5 != 0.0 || v12;
    v11 = v13 | v10;
  }

  return v11;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (double)targetTime
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double result;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTracking");

  if (v5)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrubber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v9 = v8;

LABEL_5:
    return v9;
  }
  -[AVPlaybackControlsController playerController](self, "playerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "externalPlaybackType");

  if (v11 == 1)
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentTime");
    v9 = v12;
    goto LABEL_5;
  }
  -[AVPlaybackControlsController currentTime](self, "currentTime");
  return result;
}

- (AVTimeFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (void)playerViewControllerContentViewDidLayoutSubviews:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsPlaybackControls");
  objc_msgSend(v4, "volumeControlsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCollapsed");

  objc_msgSend(v4, "volumeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isTracking") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "volumeSlider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isTracking");

  }
  if ((v5 ^ 1 | v7) == 1)
    v11 = -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically") | v9;
  else
    v11 = 1;
  if ((objc_msgSend(v15, "avkit_isDescendantOfNonPagingScrollView") & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v15, "isCoveringWindow");
  -[AVPlaybackControlsController setCoveringWindow:](self, "setCoveringWindow:", v12);
  -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", v11);
  objc_msgSend(v15, "playbackContentContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[AVPlaybackControlsController setPlaybackViewFrame:](self, "setPlaybackViewFrame:");

  -[AVPlaybackControlsController pictureInPictureController](self, "pictureInPictureController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSourceVideoRectInWindowChanged");

  -[AVPlaybackControlsController _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled");
}

- (void)setTimeResolver:(id)a3
{
  objc_storeStrong((id *)&self->_timeResolver, a3);
}

- (void)setPlaybackViewFrame:(CGRect)a3
{
  self->_playbackViewFrame = a3;
}

- (AVTimeFormatter)elapsedTimeFormatter
{
  return self->_elapsedTimeFormatter;
}

- (void)setCoveringWindow:(BOOL)a3
{
  if (self->_coveringWindow != a3)
  {
    self->_coveringWindow = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)_updatePlaybackControlsVisibleAndObservingUpdates
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AVObservationController *v8;
  BOOL v9;
  id v10;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls")
    && !-[AVPlaybackControlsController playerViewControllerIsBeingTransitionedWithResizing](self, "playerViewControllerIsBeingTransitionedWithResizing")&& !-[AVPlaybackControlsController forcePlaybackControlsHidden](self, "forcePlaybackControlsHidden")&& (-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")|| -[AVPlaybackControlsController canIncludePlaybackControlsWhenInline](self, "canIncludePlaybackControlsWhenInline")))
  {
    if (!v10)
      goto LABEL_13;
    v3 = 1;
  }
  else
  {
    if (!-[AVPlaybackControlsController hasCustomPlaybackControls](self, "hasCustomPlaybackControls") || !v10)
      goto LABEL_23;
    v3 = 0;
  }
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
      goto LABEL_13;
LABEL_23:
    if (!-[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition"))
      -[AVPlaybackControlsController beginHidingItemsForTransition](self, "beginHidingItemsForTransition");
    goto LABEL_25;
  }
  v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
  -[AVPlaybackControlsController setPlaybackControlsObservationController:](self, "setPlaybackControlsObservationController:", v8);

  -[AVPlaybackControlsController _startObservingForPlaybackViewUpdates](self, "_startObservingForPlaybackViewUpdates");
  if ((v3 & 1) == 0)
    goto LABEL_23;
LABEL_13:
  objc_msgSend(v10, "setHidden:", 0);
  -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", -[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls"));
  if (-[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition"))
  {
    if (!-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
      || -[AVPlaybackControlsController timeControlStatus](self, "timeControlStatus") != 2)
    {
      goto LABEL_20;
    }
    -[AVPlaybackControlsController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPlayingOnExternalScreen") & 1) == 0)
    {
      -[AVPlaybackControlsController playerViewController](self, "playerViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isAudioOnlyContent"))
      {
        v9 = -[AVPlaybackControlsController canHidePlaybackControls](self, "canHidePlaybackControls");

        if (v9)
        {
          v7 = 0;
          goto LABEL_21;
        }
LABEL_20:
        v7 = -[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive") ^ 1;
LABEL_21:
        -[AVPlaybackControlsController endHidingItemsForTransitionAndShowImmediately:](self, "endHidingItemsForTransitionAndShowImmediately:", v7);
        goto LABEL_25;
      }

    }
    goto LABEL_20;
  }
LABEL_25:
  -[AVPlaybackControlsController _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled");

}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)_updateRouteDetectionEnabled
{
  id v3;

  -[AVPlaybackControlsController routeDetectorCoordinator](self, "routeDetectorCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRouteDetectionEnabled:", -[AVPlaybackControlsController _wantsRouteDetectionEnabled](self, "_wantsRouteDetectionEnabled"));

}

- (AVRouteDetectorCoordinator)routeDetectorCoordinator
{
  return self->_routeDetectorCoordinator;
}

- (BOOL)_wantsRouteDetectionEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  _BOOL4 v9;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBeingPresented"))
  {

  }
  else
  {
    -[AVPlaybackControlsController playerViewController](self, "playerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBeingPresented");

    if ((v6 & 1) == 0)
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "avkit_isInAWindowAndVisible");

      if (!v8)
      {
        LOBYTE(v9) = 0;
        return v9;
      }
    }
  }
  v9 = -[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls");
  if (v9)
    LOBYTE(v9) = -[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
              || -[AVPlaybackControlsController canIncludePlaybackControlsWhenInline](self, "canIncludePlaybackControlsWhenInline");
  return v9;
}

- (BOOL)playerViewControllerIsBeingTransitionedWithResizing
{
  return self->_playerViewControllerIsBeingTransitionedWithResizing;
}

- (void)_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  -[AVPlaybackControlsController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPlayingOnExternalScreen");

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAudioOnlyContent");

  if ((-[AVPlaybackControlsController isUserInteracting](self, "isUserInteracting") || v3)
    && !-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    v9 = 1;
    if (v3)
      goto LABEL_17;
  }
  else
  {
    v9 = v6 | v8;
    if (v3)
      goto LABEL_17;
  }
  if (!-[AVPlaybackControlsController isUserInteracting](self, "isUserInteracting")
    && !-[AVPlaybackControlsController isPopoverBeingPresented](self, "isPopoverBeingPresented")
    && !-[AVPlaybackControlsController showsLoadingIndicator](self, "showsLoadingIndicator")
    && !-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive")
    && (!-[AVPlaybackControlsController canHidePlaybackControls](self, "canHidePlaybackControls") | v6 | v8) != 1)
  {
    goto LABEL_27;
  }
  if (!-[AVPlaybackControlsController isPopoverBeingPresented](self, "isPopoverBeingPresented")
    && !-[AVPlaybackControlsController showsLoadingIndicator](self, "showsLoadingIndicator")
    && -[AVPlaybackControlsController canHidePlaybackControls](self, "canHidePlaybackControls"))
  {
    if (!(_DWORD)v9)
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_17:
  if (-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isPlayingOnExternalScreen"))
    {

      goto LABEL_21;
    }
    -[AVPlaybackControlsController playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAudioOnlyContent");

    if ((v12 & 1) != 0)
      goto LABEL_21;
LABEL_27:
    v9 = 0;
    goto LABEL_24;
  }
LABEL_21:
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "showsAudioControls");

  if ((v14 & 1) == 0)
    -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));
  v9 = 1;
LABEL_24:
  _AVLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136317442;
    v17 = "-[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:]";
    v18 = 1024;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    v22 = 1024;
    v23 = -[AVPlaybackControlsController isUserInteracting](self, "isUserInteracting");
    v24 = 1024;
    v25 = -[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive");
    v26 = 1024;
    v27 = v6;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = -[AVPlaybackControlsController isPopoverBeingPresented](self, "isPopoverBeingPresented");
    v32 = 1024;
    v33 = -[AVPlaybackControlsController showsLoadingIndicator](self, "showsLoadingIndicator");
    v34 = 1024;
    v35 = -[AVPlaybackControlsController canHidePlaybackControls](self, "canHidePlaybackControls");
    _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s shouldShowPlaybackControls: %d {\n\twantsPlaybackControlsVisible: %d\n\tisUserInteracting: %d\n\tisPictureInPictureActive: %d\n\tplayingOnExternalScreen: %d\n\taudioOnlyContent: %d\n\tisPopoverBeingPresented: %d\n\tshowsLoadingIndicator: %d\n\tcanHidePlaybackControls: %d\n}", (uint8_t *)&v16, 0x42u);
  }

  -[AVPlaybackControlsController showPlaybackControls:immediately:](self, "showPlaybackControls:immediately:", v9, 0);
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (BOOL)isUserInteracting
{
  return -[AVPlaybackControlsController userInteractingCount](self, "userInteractingCount") != 0;
}

- (unint64_t)userInteractingCount
{
  return self->_userInteractingCount;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[AVPlaybackControlsController playbackControlsVisibilityTimer](self, "playbackControlsVisibilityTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[AVPlaybackControlsController showPlaybackControls:immediately:]";
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = v4;
    v16 = 1024;
    v17 = -[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition");
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s shouldShowPlaybackControls: %d {\n\tshowImmediately: %d\n\tisHidingItemsForTransition: %d}", (uint8_t *)&v10, 0x1Eu);
  }

  if (!-[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition"))
  {
    -[AVPlaybackControlsController setShowingPlaybackControls:](self, "setShowingPlaybackControls:", v5);
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showPlaybackControls:immediately:", v5, v4);

  }
}

- (BOOL)isHidingItemsForTransition
{
  return self->_hidingItemsForTransition;
}

- (NSTimer)playbackControlsVisibilityTimer
{
  return self->_playbackControlsVisibilityTimer;
}

- (void)setShowingPlaybackControls:(BOOL)a3
{
  self->_showingPlaybackControls = a3;
}

- (BOOL)isPopoverBeingPresented
{
  return self->_popoverIsBeingPresented;
}

- (BOOL)canHidePlaybackControls
{
  return self->_canHidePlaybackControls;
}

- (BOOL)canIncludePlaybackControlsWhenInline
{
  return self->_canIncludePlaybackControlsWhenInline;
}

- (BOOL)forcePlaybackControlsHidden
{
  return self->_forcePlaybackControlsHidden;
}

- (BOOL)showsTimecodes
{
  return self->_showsTimecodes;
}

- (void)_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3 playing:(BOOL)a4 userDidEndTappingProminentPlayButton:(BOOL)a5
{
  if (a4 || a5 || !a3)
    -[AVPlaybackControlsController setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:](self, "setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:", a3);
}

- (void)setPlaybackControlsObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControlsObservationController, a3);
}

- (void)setLoadingIndicatorTimerDelay:(double)a3
{
  self->_loadingIndicatorTimerDelay = a3;
}

- (BOOL)isShowingPlaybackControls
{
  return self->_showingPlaybackControls;
}

- (BOOL)hasCustomPlaybackControls
{
  return self->_hasCustomPlaybackControls;
}

- (void)beginHidingItemsForTransition
{
  -[AVPlaybackControlsController showPlaybackControls:immediately:](self, "showPlaybackControls:immediately:", 0, 1);
  -[AVPlaybackControlsController setHidingItemsForTransition:](self, "setHidingItemsForTransition:", 1);
}

- (BOOL)canShowLoadingIndicator
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[AVPlaybackControlsController isResumingUpdates](self, "isResumingUpdates")
    || -[AVPlaybackControlsController playerViewControllerIsBeingTransitionedWithResizing](self, "playerViewControllerIsBeingTransitionedWithResizing"))
  {
    return 0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "status") == 1
      || -[AVPlaybackControlsController timeControlStatus](self, "timeControlStatus") == 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateOrCreateTimeResolverIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  double Width;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  AVPlayerControllerTimeResolver *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  AVPlayerControllerTimeResolver *v32;
  _QWORD v33[5];
  AVPlayerControllerTimeResolver *v34;
  CGRect v35;

  if (!-[AVPlaybackControlsController needsTimeResolver](self, "needsTimeResolver"))
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPlayerController:", 0);

    -[AVPlaybackControlsController setTimeResolver:](self, "setTimeResolver:", 0);
    return;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrubber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0;
  if ((objc_msgSend(v5, "isTracking") & 1) == 0)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "volumeSlider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isTracking");

    if ((v9 & 1) != 0)
      goto LABEL_6;
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transportControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    Width = CGRectGetWidth(v35);
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v6 = Width * v13;

  }
LABEL_6:
  v14 = 1.0;
  if (-[AVPlaybackControlsController showsTimecodes](self, "showsTimecodes"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasReadableTimecodes");

    if (v16)
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timecodeObservationInterval");
      v14 = v18;

    }
  }
  -[AVPlaybackControlsController timeResolver](self, "timeResolver");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playerController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerController](self, "playerController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 != v21)
  {
    v22 = objc_alloc_init(AVPlayerControllerTimeResolver);
    -[AVPlaybackControlsController playerController](self, "playerController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerControllerTimeResolver setPlayerController:](v22, "setPlayerController:", v23);

    -[AVPlayerControllerTimeResolver setResolution:](v22, "setResolution:", v6);
    -[AVPlayerControllerTimeResolver setInterval:](v22, "setInterval:", v14);
    v24 = (void *)MEMORY[0x1E0DC3F10];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __67__AVPlaybackControlsController__updateOrCreateTimeResolverIfNeeded__block_invoke;
    v33[3] = &unk_1E5BB3D20;
    v33[4] = self;
    v34 = v22;
    v32 = v22;
    objc_msgSend(v24, "performWithoutAnimation:", v33);

LABEL_17:
    return;
  }
  -[AVPlaybackControlsController timeResolver](self, "timeResolver");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resolution");
  if (v27 != v6)
  {

    goto LABEL_16;
  }
  -[AVPlaybackControlsController timeResolver](self, "timeResolver");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "interval");
  v30 = vabdd_f64(v29, v14);

  if (v30 >= 2.22044605e-16)
  {
LABEL_16:
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setResolution:", v6);

    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v32 = (AVPlayerControllerTimeResolver *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerControllerTimeResolver setInterval:](v32, "setInterval:", v14);
    goto LABEL_17;
  }
}

- (BOOL)needsTimeResolver
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "showsPlaybackControls"))
      v5 = !-[AVPlaybackControlsController isResumingUpdates](self, "isResumingUpdates");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isResumingUpdates
{
  return self->_resumingUpdates;
}

uint64_t __57__AVPlaybackControlsController__updateContainerInclusion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateControlInclusion");
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  self->_showsLoadingIndicator = a3;
}

- (void)playbackControlsViewDidLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AVRouteDetectorCoordinator *v7;
  AVRouteDetectorCoordinator *routeDetectorCoordinator;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id WeakRetained;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  AVTimeFormatter *v106;
  AVTimeFormatter *elapsedTimeFormatter;
  AVTimeFormatter *v108;
  AVTimeFormatter *remainingTimeFormatter;
  uint64_t v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t);
  void *v113;
  id v114;
  AVPlaybackControlsController *v115;
  _OWORD v116[3];
  _QWORD v117[4];
  id v118;
  id location[2];

  v4 = a3;
  -[AVPlaybackControlsController setResumingUpdates:](self, "setResumingUpdates:", 1);
  -[AVPlaybackControlsController setPlaybackControlsView:](self, "setPlaybackControlsView:", v4);
  if (!self->_showsPlaybackControls
    && !-[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition"))
  {
    -[AVPlaybackControlsController beginHidingItemsForTransition](self, "beginHidingItemsForTransition");
  }
  -[AVPlaybackControlsController turboModePlaybackControlsPlaceholderView](self, "turboModePlaybackControlsPlaceholderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[AVPlaybackControlsController playerController](self, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", objc_msgSend(v6, "isPlaying"));

  v7 = objc_alloc_init(AVRouteDetectorCoordinator);
  routeDetectorCoordinator = self->_routeDetectorCoordinator;
  self->_routeDetectorCoordinator = v7;

  -[AVPlaybackControlsController startUpdatesIfNeeded](self, "startUpdatesIfNeeded");
  objc_msgSend(v4, "setFullScreen:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playbackContentContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  -[AVPlaybackControlsController setPlaybackViewFrame:](self, "setPlaybackViewFrame:");

  objc_msgSend(v4, "setPreferredUnobscuredArea:", -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea"));
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibilityDelegate:", v12);

  objc_msgSend(v4, "standardPlayPauseButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImageName:", CFSTR("play.fill"));

  objc_msgSend(v4, "standardPlayPauseButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlternateImageName:", CFSTR("pause.fill"));

  objc_msgSend(v4, "standardPlayPauseButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC1438];
  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B50], *MEMORY[0x1E0DC1438]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlternateFullScreenFont:", v17);

  objc_msgSend(v4, "standardPlayPauseButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFullscreenAlternateImagePadding:", 1.0);

  objc_msgSend(v4, "standardPlayPauseButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");
  v23 = 0.5;
  if (v22 == 5)
    v23 = 0.0;
  objc_msgSend(v19, "setAlternateImagePadding:", v23);

  objc_msgSend(v4, "prominentPlayButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImageName:", CFSTR("play.fill"));

  objc_msgSend(v4, "prominentPlayButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4AE8], v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInlineFont:", v26);

  objc_msgSend(v4, "prominentPlayButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMultipleTouchesEndsTracking:", 1);

  objc_msgSend(v4, "skipBackButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImageName:", CFSTR("gobackward.15"));

  objc_msgSend(v4, "skipForwardButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setImageName:", CFSTR("goforward.15"));

  objc_msgSend(v4, "skipForwardButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlternateImageName:", CFSTR("forward.end.alt.fill"));

  objc_msgSend(v4, "skipForwardButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlternateFullScreenFont:", v32);

  objc_msgSend(v4, "startLeftwardContentTransitionButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setImageName:", CFSTR("backward.end.fill"));

  objc_msgSend(v4, "startRightwardContentTransitionButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setImageName:", CFSTR("forward.end.fill"));

  objc_msgSend(v4, "mediaSelectionButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setImageName:", CFSTR("captions.bubble"));

  objc_msgSend(v4, "pictureInPictureButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setImageName:", CFSTR("pip.enter"));

  objc_msgSend(v4, "fullScreenButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setImageName:", CFSTR("arrow.up.left.and.arrow.down.right"));

  objc_msgSend(v4, "doneButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImageName:", CFSTR("xmark"));

  objc_msgSend(v4, "volumeButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController _volumeButtonMicaPackageState](self, "_volumeButtonMicaPackageState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMicaPackageStateName:", v40);

  objc_msgSend(v4, "routePickerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDelegate:", self);

  objc_msgSend(v4, "controlOverflowButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setDelegate:", self);

  objc_msgSend(v4, "doneButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addTarget:action:forControlEvents:", v44, sel_doneButtonTapped_, 64);

  objc_msgSend(v4, "fullScreenButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addTarget:action:forControlEvents:", v46, sel_enterFullScreen_, 64);

  objc_msgSend(v4, "videoGravityButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addTarget:action:forControlEvents:", v48, sel_videoGravityButtonTapped_, 64);

  objc_msgSend(v4, "standardPlayPauseButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addTarget:action:forControlEvents:", v50, sel_togglePlayback_, 64);

  objc_msgSend(v4, "pictureInPictureButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addTarget:action:forControlEvents:", v52, sel_pictureInPictureButtonTapped_, 64);

  objc_msgSend(v4, "mediaSelectionButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addTarget:action:forControlEvents:", v54, sel_mediaSelectionButtonTapped_, 64);

  objc_initWeak(location, self);
  v55 = (void *)MEMORY[0x1E0DC3428];
  v56 = MEMORY[0x1E0C809B0];
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke;
  v117[3] = &unk_1E5BB3918;
  objc_copyWeak(&v118, location);
  objc_msgSend(v55, "actionWithHandler:", v117);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "playbackSpeedButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setImageName:", CFSTR("speedometer"));

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "playbackSpeedButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(WeakRetained, "playbackRateMenuController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "menu");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setMenu:", v64);

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "playbackSpeedButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addAction:forControlEvents:", v57, 0x4000);

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "playbackSpeedButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addTarget:action:forControlEvents:", self, sel_playbackSpeedButtonTapped_, 64);

  objc_msgSend(v4, "skipBackButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addTarget:action:forControlEvents:", self, sel_skipButtonTouchUpInside_, 64);

  objc_msgSend(v4, "skipForwardButton");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addTarget:action:forControlEvents:", self, sel_skipButtonTouchUpInside_, 64);

  objc_msgSend(v4, "skipBackButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addTarget:action:forControlEvents:", self, sel_skipButtonLongPressTriggered_, 0x400000);

  objc_msgSend(v4, "skipForwardButton");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addTarget:action:forControlEvents:", self, sel_skipButtonLongPressTriggered_, 0x400000);

  objc_msgSend(v4, "skipBackButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addTarget:action:forControlEvents:", self, sel_skipButtonLongPressEnded_, 0x800000);

  objc_msgSend(v4, "skipForwardButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addTarget:action:forControlEvents:", self, sel_skipButtonLongPressEnded_, 0x800000);

  objc_msgSend(v4, "skipBackButton");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addTarget:action:forControlEvents:", self, sel_skipButtonForcePressChanged_, 0x2000000);

  objc_msgSend(v4, "skipForwardButton");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addTarget:action:forControlEvents:", self, sel_skipButtonForcePressChanged_, 0x2000000);

  -[AVPlaybackControlsController _updateSkipButtonsEnableLongPress](self, "_updateSkipButtonsEnableLongPress");
  objc_msgSend(v4, "startLeftwardContentTransitionButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addTarget:action:forControlEvents:", self, sel_startContentTransitionButtonTouchUpInside_, 64);

  objc_msgSend(v4, "startRightwardContentTransitionButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addTarget:action:forControlEvents:", self, sel_startContentTransitionButtonTouchUpInside_, 64);

  objc_msgSend(v4, "prominentPlayButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addTarget:action:forControlEvents:", self, sel_prominentPlayButtonTouchUpInside_, 64);

  objc_msgSend(v4, "volumeButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addTarget:action:forControlEvents:", self, sel_volumeButtonTapTriggered_, 0x400000);

  objc_msgSend(v4, "volumeButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addTarget:action:forControlEvents:", self, sel_beginChangingVolume, 0x1000000);

  objc_msgSend(v4, "volumeButton");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addTarget:action:forControlEvents:", self, sel_volumeButtonLongPressTriggered_, 0x800000);

  objc_msgSend(v4, "volumeButton");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addTarget:action:forControlEvents:", self, sel_volumeButtonPanChanged_, 0x2000000);

  objc_msgSend(v4, "volumeButton");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addTarget:action:forControlEvents:", self, sel_endChangingVolume, 0x4000000);

  objc_msgSend(v4, "volumeSlider");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addTarget:action:forControlEvents:", self, sel_beginChangingVolume, 1);

  objc_msgSend(v4, "volumeSlider");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "addTarget:action:forControlEvents:", self, sel_endChangingVolume, 448);

  objc_msgSend(v4, "volumeSlider");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "addTarget:action:forControlEvents:", self, sel_volumeSliderValueDidChange_, 4096);

  objc_msgSend(v4, "transportControlsView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setDelegate:", self);

  objc_msgSend(v4, "standardPlayPauseButton");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setTintEffectStyle:", 0);

  objc_msgSend(v4, "prominentPlayButton");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTintEffectStyle:", 0);

  objc_msgSend(v4, "skipBackButton");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTintEffectStyle:", 0);

  objc_msgSend(v4, "skipForwardButton");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTintEffectStyle:", 0);

  objc_msgSend(v4, "startLeftwardContentTransitionButton");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setTintEffectStyle:", 0);

  objc_msgSend(v4, "startRightwardContentTransitionButton");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setTintEffectStyle:", 0);

  -[AVPlaybackControlsController customControlItems](self, "customControlItems");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomControlItems:animations:", v95, &__block_literal_global_162);

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96;
  if (v96)
    objc_msgSend(v96, "overrideTransformForProminentPlayButton");
  else
    memset(v116, 0, sizeof(v116));
  objc_msgSend(v4, "setOverrideTransformForProminentPlayButton:", v116);

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "overrideLayoutMarginsWhenEmbeddedInline");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideLayoutMarginsWhenEmbeddedInline:", v99);

  v100 = (void *)MEMORY[0x1E0DC3F10];
  v110 = v56;
  v111 = 3221225472;
  v112 = __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke_3;
  v113 = &unk_1E5BB3D20;
  v101 = v4;
  v114 = v101;
  v115 = self;
  objc_msgSend(v100, "performWithoutAnimation:", &v110);
  -[AVPlaybackControlsController volumeController](self, "volumeController", v110, v111, v112, v113);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController uniqueIdentifer](self, "uniqueIdentifer");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController windowSceneSessionIdentifier](self, "windowSceneSessionIdentifier");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setClientWithIdentifier:forWindowSceneSessionWithIdentifier:", v103, v104);

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setPrefersSystemVolumeHUDHidden:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));

  if (!self->_remainingTimeFormatter || !self->_elapsedTimeFormatter)
  {
    v106 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    elapsedTimeFormatter = self->_elapsedTimeFormatter;
    self->_elapsedTimeFormatter = v106;

    -[AVTimeFormatter setStyle:](self->_elapsedTimeFormatter, "setStyle:", 1);
    v108 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    remainingTimeFormatter = self->_remainingTimeFormatter;
    self->_remainingTimeFormatter = v108;

    -[AVTimeFormatter setStyle:](self->_remainingTimeFormatter, "setStyle:", 2);
  }
  objc_msgSend(v101, "setupInitialLayout");
  objc_msgSend(v101, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));
  -[AVPlaybackControlsController _updatePlaybackControlsVisibleAndObservingUpdates](self, "_updatePlaybackControlsVisibleAndObservingUpdates");
  -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
  -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  -[AVPlaybackControlsController _updateScrubberAndTimeLabels](self, "_updateScrubberAndTimeLabels");
  -[AVPlaybackControlsController _updateVolumeControllerView](self, "_updateVolumeControllerView");
  -[AVPlaybackControlsController _updateTransportBarCustomMenuItemsIfNeeded](self, "_updateTransportBarCustomMenuItemsIfNeeded");

  objc_destroyWeak(&v118);
  objc_destroyWeak(location);

}

- (void)setResumingUpdates:(BOOL)a3
{
  self->_resumingUpdates = a3;
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_20(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_msgSend(v2, "shouldIgnoreTimeResolverUpdates") & 1) == 0)
    objc_msgSend(v2, "_updateScrubberAndTimeLabels");

}

- (BOOL)shouldIgnoreTimeResolverUpdates
{
  return self->_shouldIgnoreTimeResolverUpdates;
}

- (void)_updateControlInclusion
{
  void *v3;
  void *v4;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v4, "isIncluded"));

  -[AVPlaybackControlsController _showOrHideDisplayModeControls](self, "_showOrHideDisplayModeControls");
}

- (AVMobilePlaybackRateMenuController)playbackRateMenuController
{
  return self->_playbackRateMenuController;
}

- (void)playerViewControllerContentViewDidMoveToSuperviewOrWindow:(id)a3
{
  id v4;
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
  NSObject *v16;
  uint8_t v17[16];

  v4 = a3;
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performInitialSetupIfNeededAndPossible");

  -[AVPlaybackControlsController pictureInPictureController](self, "pictureInPictureController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSourceVideoRectInWindowChanged");

  -[AVPlaybackControlsController windowSceneSessionIdentifier](self, "windowSceneSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController setWindowSceneSessionIdentifier:](self, "setWindowSceneSessionIdentifier:", v11);

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController uniqueIdentifer](self, "uniqueIdentifer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientWithIdentifier:forWindowSceneSessionWithIdentifier:", v13, v7);

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPrefersSystemVolumeHUDHidden:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));

  objc_msgSend(v4, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
  {
    _AVLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "*** AVPlayerViewController cannot update status bar visibility while hosted in view service. ***", v17, 2u);
    }

  }
  -[AVPlaybackControlsController _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled");

}

- (NSString)windowSceneSessionIdentifier
{
  return self->_windowSceneSessionIdentifier;
}

- (NSString)uniqueIdentifer
{
  return self->_uniqueIdentifer;
}

- (void)setWindowSceneSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, a3);
}

- (void)_updateTransportBarCustomMenuItemsIfNeeded
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSArray *v23;
  unint64_t v24;
  unint64_t v25;
  int *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AVPlaybackControlsController *v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = self;
  v3 = self->_transportBarCustomMenuItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    v7 = 0x1E0DC3000uLL;
    v8 = &OBJC_IVAR___AVPictureInPictureSampleBufferDisplayLayerView__PIPModeEnabled;
    v9 = 0x1E0DC3000uLL;
    do
    {
      v10 = 0;
      v32 = v5;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8 + 546, "buttonWithAccessibilityIdentifier:isSecondGeneration:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "image");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "image");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setImage:forState:", v16, 0);

          }
          objc_msgSend(v12, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "title");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setTitle:forState:", v18, 0);

          }
          objc_msgSend(v14, "addAction:forControlEvents:", v12, 0x2000);
          objc_msgSend(v12, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setMenuElementIdentifier:", v19);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_16;
          v20 = v8 + 546;
          v21 = v11;
          objc_msgSend(v21, "title");
          v22 = v6;
          v23 = v3;
          v24 = v7;
          v25 = v9;
          v26 = v8;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "buttonWithAccessibilityIdentifier:isSecondGeneration:", v27, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v26;
          v9 = v25;
          v7 = v24;
          v3 = v23;
          v6 = v22;
          v5 = v32;
          objc_msgSend(v21, "image");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setImage:forState:", v28, 0);

          objc_msgSend(v14, "setMenu:", v21);
          objc_msgSend(v14, "setShowsMenuAsPrimaryAction:", 1);
          objc_msgSend(v21, "identifier");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "setMenuElementIdentifier:", v12);
        }

        if (v14)
        {
          objc_msgSend(v33, "addObject:", v14);

        }
LABEL_16:
        ++v10;
      }
      while (v5 != v10);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v5);
  }

  -[AVPlaybackControlsController playbackControlsView](v31, "playbackControlsView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "transportControlsView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCustomMenuItemsViews:", v33);

}

- (void)_updateSkipButtonsEnableLongPress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "skipBackButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTreatsForcePressAsLongPress:", (objc_opt_respondsToSelector() & 1) == 0);

    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "skipForwardButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTreatsForcePressAsLongPress:", (objc_opt_respondsToSelector() & 1) == 0);

  }
}

- (void)setPlaybackControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControlsView, a3);
}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (void)_updateContainerInclusion
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[5];

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[AVPlaybackControlsController showsProminentPlayButton](self, "showsProminentPlayButton");
    v5 = -[AVPlaybackControlsController playbackControlsIncludeTransportControls](self, "playbackControlsIncludeTransportControls");
    v6 = -[AVPlaybackControlsController playbackControlsIncludeDisplayModeControls](self, "playbackControlsIncludeDisplayModeControls");
    v7 = -[AVPlaybackControlsController playbackControlsIncludeVolumeControls](self, "playbackControlsIncludeVolumeControls");
    if (!-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
      && -[AVPlaybackControlsController showsMinimalPlaybackControlsWhenEmbeddedInline](self, "showsMinimalPlaybackControlsWhenEmbeddedInline"))
    {
      if (v4)
      {
        v8 = 2;
        goto LABEL_22;
      }
      v8 = 0;
LABEL_17:
      if (!-[AVPlaybackControlsController shouldShowVolumeControlInTransportBar](self, "shouldShowVolumeControlInTransportBar"))
      {
        -[AVPlaybackControlsController playerController](self, "playerController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasEnabledAudio"))
        {

        }
        else
        {
          v10 = -[AVPlaybackControlsController showsVolumeControlsForContentWithNoAudio](self, "showsVolumeControlsForContentWithNoAudio");

          if (!v10)
            goto LABEL_22;
        }
        v8 |= 0x10uLL;
      }
LABEL_22:
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__AVPlaybackControlsController__updateContainerInclusion__block_invoke;
      v12[3] = &unk_1E5BB4CA0;
      v12[4] = self;
      objc_msgSend(v11, "setIncludedContainers:animations:", v8, v12);

      return;
    }
    if (v4)
      v8 = 2;
    else
      v8 = 0;
    if (v5)
    {
      v8 |= 4uLL;
      if (!v6)
        goto LABEL_11;
    }
    else if (!v6)
    {
LABEL_11:
      if (!v7)
        goto LABEL_22;
      goto LABEL_17;
    }
    v8 |= 8uLL;
    if (!v7)
      goto LABEL_22;
    goto LABEL_17;
  }
}

- (void)_showOrHideDisplayModeControls
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  _BOOL4 v33;
  id v34;

  if (-[AVPlaybackControlsController playbackControlsIncludeDisplayModeControls](self, "playbackControlsIncludeDisplayModeControls")|| (-[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "customDisplayModeItems"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "count"), v4, v3, !v5))
  {
    v7 = !-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
      && -[AVPlaybackControlsController allowsEnteringFullScreen](self, "allowsEnteringFullScreen");
    if (-[AVPlaybackControlsController showsDoneButtonWhenFullScreen](self, "showsDoneButtonWhenFullScreen"))
      v8 = -[AVPlaybackControlsController isFullScreen](self, "isFullScreen");
    else
      v8 = 0;
    v6 = -[AVPlaybackControlsController showsPictureInPictureButton](self, "showsPictureInPictureButton");
    v9 = -[AVPlaybackControlsController canIncludeVideoGravityButton](self, "canIncludeVideoGravityButton");
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullScreenButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v11, "isIncluded"))
    goto LABEL_16;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doneButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != objc_msgSend(v13, "isIncluded"))
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  v32 = v8;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v14 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pictureInPictureButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v14;
  if (v14 != objc_msgSend(v16, "isIncluded"))
  {

    v8 = v32;
    v6 = v33;
    goto LABEL_15;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "videoGravityButton");
  v31 = v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isIncluded");

  v9 = v31;
  v8 = v32;
  v6 = v33;
  if (v31 != v30)
  {
LABEL_17:
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      return;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fullScreenButton");
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v23);

      if (!v22)
      {
LABEL_20:
        if (!v6)
          goto LABEL_21;
        goto LABEL_26;
      }
    }
    else if (!v8)
    {
      goto LABEL_20;
    }
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doneButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v25);

    if (!v6)
    {
LABEL_21:
      if (!v9)
      {
LABEL_23:
        -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateDisplayControlsVisibilityIncludedButtons:", v34);

        return;
      }
LABEL_22:
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "videoGravityButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v19);

      goto LABEL_23;
    }
LABEL_26:
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pictureInPictureButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v27);

    if (!v9)
      goto LABEL_23;
    goto LABEL_22;
  }
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (BOOL)showsPictureInPictureButton
{
  return self->_showsPictureInPictureButton;
}

- (BOOL)showsDoneButtonWhenFullScreen
{
  return self->_showsDoneButtonWhenFullScreen;
}

- (BOOL)canIncludeVideoGravityButton
{
  return self->_canIncludeVideoGravityButton;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
{
  self->_playbackControlsIncludeVolumeControls = a3;
  -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
{
  self->_playbackControlsIncludeTransportControls = a3;
  -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
{
  self->_playbackControlsIncludeDisplayModeControls = a3;
  -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
}

void __70__AVPlaybackControlsController__bindEnabledStateOfControls_toKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setEnabled:", a2, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)showsRoutePickerView
{
  void *v3;
  BOOL v4;

  if (!-[AVPlaybackControlsController multipleRoutesDetected](self, "multipleRoutesDetected"))
    return 0;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowsExternalPlayback"))
    v4 = -[AVPlaybackControlsController wantsExternalPlaybackButtonShown](self, "wantsExternalPlaybackButtonShown");
  else
    v4 = 0;

  return v4;
}

- (BOOL)multipleRoutesDetected
{
  return self->_multipleRoutesDetected;
}

- (void)startUpdatesIfNeeded
{
  void *v3;
  AVObservationController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  if (!-[AVPlaybackControlsController hasStartedUpdates](self, "hasStartedUpdates"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[AVPlaybackControlsController setHasStartedUpdates:](self, "setHasStartedUpdates:", 1);
      v4 = self->_observationController;
      objc_initWeak(&location, self);
      -[AVPlaybackControlsController _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled");
      -[AVPlaybackControlsController routeDetectorCoordinator](self, "routeDetectorCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackControlsController setMultipleRoutesDetected:](self, "setMultipleRoutesDetected:", objc_msgSend(v5, "multipleRoutesDetected"));

      v6 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke;
      v21[3] = &unk_1E5BB2ED0;
      objc_copyWeak(&v22, &location);
      -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v4, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVRouteDetectorCoordinatorMultipleRoutesDetectedDidChangeNotification"), 0, 0, v21);
      -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v4, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVVolumeControllerVolumeChangedNotification"), 0, 0, &__block_literal_global_15394);
      -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v4, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification"), 0, 0, &__block_literal_global_20_15396);
      -[AVPlaybackControlsController playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[AVPlaybackControlsController _startObservingPotentiallyUnimplementedPlayerControllerProperties](self, "_startObservingPotentiallyUnimplementedPlayerControllerProperties");
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_4;
      v19[3] = &unk_1E5BB4688;
      objc_copyWeak(&v20, &location);
      -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("scrubbingOrSeeking"), v4, v19);
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_5;
      v17[3] = &unk_1E5BB2F58;
      objc_copyWeak(&v18, &location);
      v8 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](v4, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("timeControlStatus"), 1, v17);
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_6;
      v15[3] = &unk_1E5BB2F58;
      objc_copyWeak(&v16, &location);
      v9 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](v4, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.status"), 1, v15);
      v10 = v6;
      v11 = 3221225472;
      v12 = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_7;
      v13 = &unk_1E5BB4688;
      objc_copyWeak(&v14, &location);
      -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("needsTimeResolver"), v4, &v10);
      -[AVPlaybackControlsController _updatePlaybackControlsVisibleAndObservingUpdates](self, "_updatePlaybackControlsVisibleAndObservingUpdates", v10, v11, v12, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
  }
}

- (BOOL)hasStartedUpdates
{
  return self->_hasStartedUpdates;
}

- (void)_startObservingPotentiallyUnimplementedPlayerControllerProperties
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  if (!-[AVPlaybackControlsController hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties](self, "hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties"))
  {
    -[AVPlaybackControlsController setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:](self, "setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:", 1);
    objc_initWeak(&location, self);
    -[AVPlaybackControlsController playerController](self, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[AVPlaybackControlsController observationController](self, "observationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke;
      v25[3] = &unk_1E5BB4688;
      objc_copyWeak(&v26, &location);
      -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.hasSeekableLiveStreamingContent"), v5, v25);

      objc_destroyWeak(&v26);
    }
    -[AVPlaybackControlsController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[AVPlaybackControlsController observationController](self, "observationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_2;
        v23[3] = &unk_1E5BB4688;
        objc_copyWeak(&v24, &location);
        -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.seeking"), v9, v23);

        -[AVPlaybackControlsController observationController](self, "observationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_3;
        v21[3] = &unk_1E5BB4688;
        objc_copyWeak(&v22, &location);
        -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.scrubbing"), v11, v21);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);
      }
    }
    else
    {

    }
    -[AVPlaybackControlsController playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[AVPlaybackControlsController observationController](self, "observationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_4;
      v19[3] = &unk_1E5BB2F58;
      v15 = &v20;
      objc_copyWeak(&v20, &location);
      v16 = (id)objc_msgSend(v14, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.timeControlStatus"), 1, v19);
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_5;
      v17[3] = &unk_1E5BB4688;
      v15 = &v18;
      objc_copyWeak(&v18, &location);
      -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.playing"), v14, v17);
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (BOOL)hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties
{
  return self->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties;
}

- (void)setMultipleRoutesDetected:(BOOL)a3
{
  self->_multipleRoutesDetected = a3;
}

- (void)setHasStartedUpdates:(BOOL)a3
{
  self->_hasStartedUpdates = a3;
}

- (void)setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:(BOOL)a3
{
  self->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties = a3;
}

- (void)_startObservingForPlaybackViewUpdates
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  id from;
  _QWORD v110[4];
  _QWORD v111[3];
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[2];
  _QWORD v116[2];
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _QWORD v121[3];
  _QWORD v122[2];
  _QWORD v123[6];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v73;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Called %@ before creating playback controls view!", (uint8_t *)location, 0xCu);

    }
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v6);

  objc_initWeak(&from, self);
  -[AVPlaybackControlsController setResumingUpdates:](self, "setResumingUpdates:", 1);
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke;
  v107[3] = &unk_1E5BB4688;
  objc_copyWeak(&v108, location);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("prominentPlayButtonCanShowPauseGlyph"), v7, v107);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v8;
  v105[1] = 3221225472;
  v105[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_2;
  v105[3] = &unk_1E5BB4688;
  objc_copyWeak(&v106, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("showsProminentPlayButton"), v9, v105);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v8;
  v102[1] = 3221225472;
  v102[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_3;
  v102[3] = &unk_1E5BB3088;
  objc_copyWeak(&v103, location);
  objc_copyWeak(&v104, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playButtonsShowPauseGlyph"), v10, v102);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v8;
  v100[1] = 3221225472;
  v100[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_4;
  v100[3] = &unk_1E5BB4688;
  objc_copyWeak(&v101, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.muted"), v11, v100);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v8;
  v98[1] = 3221225472;
  v98[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_5;
  v98[3] = &unk_1E5BB4688;
  objc_copyWeak(&v99, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.hasEnabledAudio"), v12, v98);

  -[AVPlaybackControlsController playerController](self, "playerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[AVPlaybackControlsController observationController](self, "observationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.currentAssetIfReady"), 1, &__block_literal_global_198);

  }
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v8;
  v95[1] = 3221225472;
  v95[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_7;
  v95[3] = &unk_1E5BB3088;
  objc_copyWeak(&v96, &from);
  objc_copyWeak(&v97, location);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("prefersMuted"), v17, v95);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v8;
  v92[1] = 3221225472;
  v92[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_10;
  v92[3] = &unk_1E5BB3088;
  objc_copyWeak(&v93, &from);
  objc_copyWeak(&v94, location);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("fullScreen"), v18, v92);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v8;
  v90[1] = 3221225472;
  v90[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_11;
  v90[3] = &unk_1E5BB4688;
  objc_copyWeak(&v91, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.playingOnExternalScreen"), v19, v90);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v8;
  v87[1] = 3221225472;
  v87[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_12;
  v87[3] = &unk_1E5BB3088;
  objc_copyWeak(&v88, location);
  objc_copyWeak(&v89, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.hasLiveStreamingContent"), v20, v87);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v8;
  v84[1] = 3221225472;
  v84[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_13;
  v84[3] = &unk_1E5BB3088;
  objc_copyWeak(&v85, location);
  objc_copyWeak(&v86, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("hasSeekableLiveStreamingContent"), v21, v84);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v8;
  v82[1] = 3221225472;
  v82[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_14;
  v82[3] = &unk_1E5BB4688;
  objc_copyWeak(&v83, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("playerController.playingOnMatchPointDevice"), v22, v82);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v8;
  v79[1] = 3221225472;
  v79[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_15;
  v79[3] = &unk_1E5BB3120;
  objc_copyWeak(&v80, location);
  objc_copyWeak(&v81, &from);
  v24 = (id)objc_msgSend(v23, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.loadedTimeRanges"), 1, v79);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v8;
  v76[1] = 3221225472;
  v76[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_16;
  v76[3] = &unk_1E5BB3088;
  objc_copyWeak(&v77, location);
  objc_copyWeak(&v78, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("showsLoadingIndicator"), v25, v76);

  v123[0] = CFSTR("playerController.contentDimensions");
  v123[1] = CFSTR("fullScreen");
  v123[2] = CFSTR("playerController.playingOnExternalScreen");
  v123[3] = CFSTR("playbackViewFrame");
  v123[4] = CFSTR("playerController.hasVideo");
  v123[5] = CFSTR("hasBecomeReadyToPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v26, 0, &__block_literal_global_226);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v8;
  v74[1] = 3221225472;
  v74[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_18;
  v74[3] = &unk_1E5BB4688;
  objc_copyWeak(&v75, &from);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", CFSTR("canShowLoadingIndicator"), v29, v74);

  -[AVPlaybackControlsController _updateVideoGravityButtonType](self, "_updateVideoGravityButtonType");
  if (v5)
  {
    objc_msgSend(v5, "standardPlayPauseButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v30;
    objc_msgSend(v5, "volumeButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindEnabledStateOfControls:toKeyPath:](self, "_bindEnabledStateOfControls:toKeyPath:", v32, CFSTR("playerController.canTogglePlayback"));

    objc_msgSend(v5, "scrubber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v33;
    objc_msgSend(v5, "skipBackButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v34;
    objc_msgSend(v5, "skipForwardButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindEnabledStateOfControls:toKeyPath:](self, "_bindEnabledStateOfControls:toKeyPath:", v36, CFSTR("seekingEnabled"));

    objc_msgSend(v5, "startLeftwardContentTransitionButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindEnabledStateOfControls:toKeyPath:](self, "_bindEnabledStateOfControls:toKeyPath:", v38, CFSTR("startLeftwardContentTransitionButtonEnabled"));

    objc_msgSend(v5, "startRightwardContentTransitionButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindEnabledStateOfControls:toKeyPath:](self, "_bindEnabledStateOfControls:toKeyPath:", v40, CFSTR("startRightwardContentTransitionButtonEnabled"));

    objc_msgSend(v5, "scrubber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindEnabledStateOfControls:toKeyPath:](self, "_bindEnabledStateOfControls:toKeyPath:", v42, CFSTR("isSeekingEnabled"));

    objc_msgSend(v5, "transportControlsView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v44, CFSTR("showsTransportControls"));

    objc_msgSend(v5, "skipBackButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v45;
    objc_msgSend(v5, "skipForwardButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v47, CFSTR("showsSkipButtons"));

    objc_msgSend(v5, "startLeftwardContentTransitionButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v48;
    objc_msgSend(v5, "startRightwardContentTransitionButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v50, CFSTR("showsStartContentTransitionButtons"));

    objc_msgSend(v5, "routePickerView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v52, CFSTR("showsRoutePickerView"));

    objc_msgSend(v5, "mediaSelectionButton");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v54, CFSTR("showsMediaSelectionButton"));

    objc_msgSend(v5, "playbackSpeedButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _bindInclusionOfControlItems:toKeyPath:](self, "_bindInclusionOfControlItems:toKeyPath:", v56, CFSTR("showsPlaybackSpeedButton"));

  }
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = CFSTR("minimumTime");
  v111[1] = CFSTR("maximumTime");
  v111[2] = CFSTR("currentTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v57, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v58, 1, &__block_literal_global_255);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5668], 0, 0, &__block_literal_global_256);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5620], 0, 0, &__block_literal_global_257);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackRateMenuController](self, "playbackRateMenuController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_msgSend(v62, "startObserving:keyPath:observationHandler:", v63, CFSTR("menu"), &__block_literal_global_261);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (id)objc_msgSend(v65, "startObserving:keyPath:observationHandler:", self, CFSTR("showsMediaSelectionButton"), &__block_literal_global_262);

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playerController](self, "playerController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = CFSTR("audioMediaSelectionOptions");
  v110[1] = CFSTR("legibleMediaSelectionOptions");
  v110[2] = CFSTR("currentAudioMediaSelectionOption");
  v110[3] = CFSTR("currentLegibleMediaSelectionOption");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (id)objc_msgSend(v67, "startObserving:keyPaths:observationHandler:", v68, v69, &__block_literal_global_271);

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "volume");
  -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setHidden:", 0);

  -[AVPlaybackControlsController setResumingUpdates:](self, "setResumingUpdates:", 0);
  objc_destroyWeak(&v75);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&v94);
  objc_destroyWeak(&v93);
  objc_destroyWeak(&v97);
  objc_destroyWeak(&v96);
  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v104);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v106);
  objc_destroyWeak(&v108);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

- (AVObservationController)playbackControlsObservationController
{
  return self->_playbackControlsObservationController;
}

- (void)_bindInclusionOfControlItems:(id)a3 toKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AVPlaybackControlsController__bindInclusionOfControlItems_toKeyPath___block_invoke;
  v10[3] = &unk_1E5BB3038;
  v9 = v6;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", v7, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_bindEnabledStateOfControls:(id)a3 toKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__AVPlaybackControlsController__bindEnabledStateOfControls_toKeyPath___block_invoke;
  v10[3] = &unk_1E5BB3010;
  v11 = v6;
  v9 = v6;
  -[AVPlaybackControlsController _observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:](self, "_observeBoolForKeyPath:usingKeyValueObservationController:observationHandler:", v7, v8, v10);

}

- (void)_updateVideoGravityButtonType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v17;
  BOOL v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  BOOL v43;
  uint64_t v44;
  double MinY;
  double MinX;
  _QWORD v47[6];
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  if (!-[AVPlaybackControlsController showsVideoGravityButton](self, "showsVideoGravityButton"))
    goto LABEL_9;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "hasVideo")
    || !-[AVPlaybackControlsController isFullScreen](self, "isFullScreen"))
  {
    goto LABEL_6;
  }
  -[AVPlaybackControlsController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPlayingOnExternalScreen"))
  {

    goto LABEL_6;
  }
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentTransitioningDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentDimensions");
    v12 = v11;
    v14 = v13;

    if (-[AVPlaybackControlsController hasBecomeReadyToPlay](self, "hasBecomeReadyToPlay"))
    {
      v17 = ((*(_QWORD *)&v14 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v14 >= 0.0
         || (unint64_t)(*(_QWORD *)&v14 - 1) < 0xFFFFFFFFFFFFFLL;
      v19 = (v12 < 0.0 || ((*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
         && (unint64_t)(*(_QWORD *)&v12 - 1) > 0xFFFFFFFFFFFFELL;
      v5 = 1;
      if (!v19 && v17)
      {
        -[AVPlaybackControlsController playerViewController](self, "playerViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "contentView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "bounds");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v29 = v12 / v14;
        objc_msgSend(v3, "frame");
        UIRectGetCenter();
        v31 = v30;
        v33 = v32;
        objc_msgSend(v3, "cacheLargestInscribedRect");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "getLargestInscribableRectForView:withCenter:aspectRatio:", v3, v31, v33, v29);
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;

        v48.origin.x = v36;
        v48.origin.y = v38;
        v48.size.width = v40;
        v48.size.height = v42;
        MinX = CGRectGetMinX(v48);
        v49.origin.x = v36;
        v49.origin.y = v38;
        v49.size.width = v40;
        v49.size.height = v42;
        MinY = CGRectGetMinY(v49);
        v50.origin.x = v36;
        v50.origin.y = v38;
        v50.size.width = v40;
        v50.size.height = v42;
        v52.origin.x = v22;
        v52.origin.y = v24;
        v52.size.width = v26;
        v52.size.height = v28;
        if (!CGRectEqualToRect(v50, v52))
        {
          v51.origin.x = v36;
          v51.origin.y = v38;
          v51.size.width = v40;
          v51.size.height = v42;
          if (CGRectGetMinX(v51) <= 0.0)
          {
            v5 = 1;
            if (MinX != 0.0 || MinY <= 0.0)
              goto LABEL_7;
            v43 = !-[AVPlaybackControlsController isVideoScaled](self, "isVideoScaled", MinY);
            v44 = 1;
          }
          else
          {
            v43 = !-[AVPlaybackControlsController isVideoScaled](self, "isVideoScaled");
            v44 = 3;
          }
          if (v43)
            v5 = v44;
          else
            v5 = v44 + 1;
LABEL_7:

          goto LABEL_10;
        }
LABEL_6:
        v5 = 0;
        goto LABEL_7;
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
LABEL_9:
    v5 = 0;
  }
LABEL_10:
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __61__AVPlaybackControlsController__updateVideoGravityButtonType__block_invoke;
  v47[3] = &unk_1E5BB4660;
  v47[4] = self;
  v47[5] = v5;
  v8 = MEMORY[0x1AF43E9B8](v47);
  v9 = (void (**)(_QWORD))v8;
  if (v5)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    -[AVPlaybackControlsController setCanIncludeVideoGravityButton:](self, "setCanIncludeVideoGravityButton:", 1);
  }
  else
  {
    -[AVPlaybackControlsController setCanIncludeVideoGravityButton:](self, "setCanIncludeVideoGravityButton:", 0);
    v9[2](v9);
  }

}

void __61__AVPlaybackControlsController__updateVideoGravityButtonType__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (objc_msgSend(*(id *)(a1 + 32), "videoGravityButtonType") != *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setVideoGravityButtonType:");
  v2 = objc_msgSend(*(id *)(a1 + 32), "videoGravityButtonType");
  if (v2 > 4)
    v8 = 0;
  else
    v8 = *off_1E5BB3280[v2];
  objc_msgSend(*(id *)(a1 + 32), "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoGravityButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackControlsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoGravityButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageName:", v8);

  }
}

- (int64_t)videoGravityButtonType
{
  return self->_videoGravityButtonType;
}

- (BOOL)showsVideoGravityButton
{
  return self->_showsVideoGravityButton;
}

- (void)setCanIncludeVideoGravityButton:(BOOL)a3
{
  if (self->_canIncludeVideoGravityButton != a3)
  {
    self->_canIncludeVideoGravityButton = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)_observeBoolForKeyPath:(id)a3 usingKeyValueObservationController:(id)a4 observationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)-[AVPlaybackControlsController valueForKeyPath:](self, "valueForKeyPath:", v8);
  v12 = (void *)objc_msgSend(v10, "copy");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __109__AVPlaybackControlsController__observeBoolForKeyPath_usingKeyValueObservationController_observationHandler___block_invoke;
  v15[3] = &unk_1E5BB3060;
  v13 = v12;
  v16 = v13;
  v14 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", self, v8, 1, v15);

}

- (void)_updateVolumeSliderValueWithSystemVolume:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  id v12;

  v4 = a4;
  v7 = 0.0;
  if (!-[AVPlaybackControlsController prefersMuted](self, "prefersMuted"))
  {
    -[AVPlaybackControlsController volumeController](self, "volumeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentRouteHasVolumeControl");

    if (v9)
      v7 = a3;
    else
      v7 = 1.0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "volumeSlider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = v7;
  objc_msgSend(v10, "setValue:animated:", v4, v11);

}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrubbingOrSeeking:", objc_msgSend(v3, "isScrubbing") | a2);

}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_3(uint64_t a1, int a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    objc_msgSend(WeakRetained, "setScrubbingOrSeeking:", 1);
  }
  else
  {
    v4 = objc_loadWeakRetained(v3);
    objc_msgSend(v4, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setScrubbingOrSeeking:", objc_msgSend(v5, "isSeeking"));

  }
}

- (void)setScrubbingOrSeeking:(BOOL)a3
{
  self->_scrubbingOrSeeking = a3;
}

- (BOOL)showsMediaSelectionButton
{
  void *v2;
  char v3;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMediaSelectionOptions");

  return v3;
}

- (BOOL)showsStartContentTransitionButtons
{
  _BOOL4 v3;

  v3 = -[AVPlaybackControlsController isFullScreen](self, "isFullScreen");
  if (v3)
    LOBYTE(v3) = -[AVPlaybackControlsController playbackControlsIncludeStartContentTransitionButtons](self, "playbackControlsIncludeStartContentTransitionButtons");
  return v3;
}

- (AVPlaybackControlsController)initWithPlayerViewController:(id)a3
{
  id v4;
  AVPlaybackControlsController *v5;
  AVPlaybackControlsController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifer;
  AVObservationController *v12;
  AVObservationController *observationController;
  AVMobilePlaybackRateMenuController *v14;
  AVMobilePlaybackRateMenuController *playbackRateMenuController;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackControlsController;
  v5 = -[AVPlaybackControlsController init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
    objc_msgSend(v4, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_playerController, v7);

    v6->_showsVideoGravityButton = 1;
    -[AVPlaybackControlsController playerViewController](v6, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_showsPlaybackControls = objc_msgSend(v8, "showsPlaybackControls");

    *(_WORD *)&v6->_playbackControlsIncludeTransportControls = 257;
    v6->_playbackControlsIncludeVolumeControls = 1;
    v6->_allowsEnteringFullScreen = 1;
    *(_WORD *)&v6->_startRightwardContentTransitionButtonEnabled = 257;
    v6->_volumeControlsCanShowSlider = 1;
    *(_DWORD *)&v6->_forcePlaybackControlsHidden = 16842752;
    *(_WORD *)&v6->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties = 0;
    v6->_loadingIndicatorTimerDelay = 1.0;
    v6->_canIncludePlaybackControlsWhenInline = objc_msgSend(v4, "canIncludePlaybackControlsWhenInline");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "globallyUniqueString");
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifer = v6->_uniqueIdentifer;
    v6->_uniqueIdentifer = (NSString *)v10;

    v12 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v6);
    observationController = v6->_observationController;
    v6->_observationController = v12;

    v14 = objc_alloc_init(AVMobilePlaybackRateMenuController);
    playbackRateMenuController = v6->_playbackRateMenuController;
    v6->_playbackRateMenuController = v14;

    -[AVPlaybackControlsController _handlePhotosensitiveRegions](v6, "_handlePhotosensitiveRegions");
    _AVLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[AVPlaybackControlsController initWithPlayerViewController:]";
      v21 = 1024;
      v22 = 219;
      _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
    }

  }
  return v6;
}

- (void)_handlePhotosensitiveRegions
{
  void *v3;
  char v4;
  id v5;
  id v6;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVPlaybackControlsController observationController](self, "observationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.photosensitivityRegions"), 1, &__block_literal_global_302);

  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_12(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsLiveStreamingControls:", a2);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "_updatePlaybackSpeedControlInclusion");

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_13(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLiveStreamingControlsIncludeScrubber:", a2);

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "skipForwardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasAlternateAppearance:", a2);

  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "_updatePlaybackSpeedControlInclusion");

}

- (void)setPlaybackSpeedCollection:(id)a3
{
  AVPlaybackSpeedCollection *v5;
  id selectedPlaybackSpeedObservationToken;
  void *v7;
  AVPlaybackSpeedCollection *v8;

  v5 = (AVPlaybackSpeedCollection *)a3;
  if (self->_playbackSpeedCollection != v5)
  {
    v8 = v5;
    if (self->_selectedPlaybackSpeedObservationToken)
    {
      -[AVObservationController stopObserving:](self->_observationController, "stopObserving:");
      selectedPlaybackSpeedObservationToken = self->_selectedPlaybackSpeedObservationToken;
      self->_selectedPlaybackSpeedObservationToken = 0;

    }
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    -[AVPlaybackControlsController playbackRateMenuController](self, "playbackRateMenuController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackSpeedCollection:", v8);

    -[AVPlaybackControlsController _updatePlaybackSpeedControlInclusion](self, "_updatePlaybackSpeedControlInclusion");
    v5 = v8;
  }

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlaybackSpeedControlInclusion");

}

- (BOOL)isSeekingEnabled
{
  void *v4;
  char v5;

  if (-[AVPlaybackControlsController requiresLinearPlayback](self, "requiresLinearPlayback"))
    return 0;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSeek");

  return v5;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (void)_updatePlaybackSpeedControlInclusion
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasLiveStreamingContent"))
    v3 = objc_msgSend(v7, "hasSeekableLiveStreamingContent");
  else
    v3 = 1;
  -[AVPlaybackControlsController playbackSpeedCollection](self, "playbackSpeedCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "playbackSpeedControlEnabled"))
      v6 = v3 & ~objc_msgSend(v7, "isPlayingOnMatchPointDevice");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  if ((_DWORD)v6 != -[AVPlaybackControlsController showsPlaybackSpeedButton](self, "showsPlaybackSpeedButton"))
    -[AVPlaybackControlsController setShowsPlaybackSpeedButton:](self, "setShowsPlaybackSpeedButton:", v6);

}

- (BOOL)showsPlaybackSpeedButton
{
  return self->_showsPlaybackSpeedButton;
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (void)setShowsPlaybackSpeedButton:(BOOL)a3
{
  self->_showsPlaybackSpeedButton = a3;
}

- (void)_hideContextMenusIfPresented
{
  void *v2;
  void *v3;
  id v4;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlOverflowButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissMenu");

}

+ (id)keyPathsForValuesAffectingShowsMediaSelectionButton
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playerController.hasMediaSelectionOptions"));
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_16(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsLoadingIndicator:", a2);

  v6 = (id *)(a1 + 40);
  v7 = objc_loadWeakRetained(v6);
  LODWORD(v5) = objc_msgSend(v7, "showsLoadingIndicator");

  v8 = objc_loadWeakRetained(v6);
  v9 = v8;
  if ((_DWORD)v5)
  {
    objc_msgSend(v8, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", 1);
  }
  else
  {
    objc_msgSend(v8, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 3.0;
    if ((objc_msgSend(v10, "isPlaying") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSince1970");
      v11 = v13;

    }
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "_autoHideControlsAfterDelay:", v11);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained(v6);
  v18 = CFSTR("AVPlaybackControlsControllerShowsLoadingIndicatorValueKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("AVPlaybackControlsControllsShowsLoadingIndicatorNotification"), v15, v17);

}

- (void)_autoHideControlsAfterDelay:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[AVPlaybackControlsController _autoHideControlsAfterDelay:]";
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s delay: %f", buf, 0x16u);
  }

  -[AVPlaybackControlsController playbackControlsVisibilityTimer](self, "playbackControlsVisibilityTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__AVPlaybackControlsController__autoHideControlsAfterDelay___block_invoke;
  v9[3] = &unk_1E5BB49A8;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController setPlaybackControlsVisibilityTimer:](self, "setPlaybackControlsVisibilityTimer:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)setPlaybackControlsVisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControlsVisibilityTimer, a3);
}

- (void)playerViewControllerContentViewDidChangeVideoGravity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoGravity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVPlaybackControlsController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoGravity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController setVideoScaled:](self, "setVideoScaled:", objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A6D8]) ^ 1);

  }
  -[AVPlaybackControlsController _updateVideoGravityButtonType](self, "_updateVideoGravityButtonType");
}

- (void)setVideoScaled:(BOOL)a3
{
  self->_videoScaled = a3;
}

- (BOOL)showsSkipButtons
{
  BOOL v3;
  void *v5;

  if (!-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
    || -[AVPlaybackControlsController playbackControlsIncludeStartContentTransitionButtons](self, "playbackControlsIncludeStartContentTransitionButtons")|| -[AVPlaybackControlsController playerViewControllerIsBeingTransitionedWithResizing](self, "playerViewControllerIsBeingTransitionedWithResizing"))
  {
    return 0;
  }
  if (!-[AVPlaybackControlsController isSeekingEnabled](self, "isSeekingEnabled"))
  {
    if (!-[AVPlaybackControlsController requiresLinearPlayback](self, "requiresLinearPlayback"))
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "status") != 2;

      return v3;
    }
    return 0;
  }
  return 1;
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasSeekableLiveStreamingContent:", a2);

}

- (void)setHasSeekableLiveStreamingContent:(BOOL)a3
{
  self->_hasSeekableLiveStreamingContent = a3;
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPrefersMuted:", a2);

}

- (void)setPrefersMuted:(BOOL)a3
{
  self->_prefersMuted = a3;
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_preferredUnobscuredArea != a3)
  {
    self->_preferredUnobscuredArea = a3;
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredUnobscuredArea:", a3);

    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  if (self->_allowsEnteringFullScreen != a3)
  {
    self->_allowsEnteringFullScreen = a3;
    -[AVPlaybackControlsController _updateControlInclusion](self, "_updateControlInclusion");
  }
}

- (void)setVolumeController:(id)a3
{
  AVVolumeController *v5;
  void *v6;
  AVVolumeController *v7;

  v7 = (AVVolumeController *)a3;
  v5 = self->_volumeController;
  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_volumeController, a3);
    if (-[AVPlaybackControlsController isFullScreen](self, "isFullScreen"))
    {
      -[AVVolumeController setPrefersSystemVolumeHUDHidden:](v5, "setPrefersSystemVolumeHUDHidden:", 0);
      -[AVPlaybackControlsController volumeController](self, "volumeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPrefersSystemVolumeHUDHidden:", 1);

    }
  }

}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  NSArray *v4;
  NSArray *transportBarCustomMenuItems;
  void *v6;
  void *v7;
  void *v8;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlOverflowButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateContextMenu");

  -[AVPlaybackControlsController _updateTransportBarCustomMenuItemsIfNeeded](self, "_updateTransportBarCustomMenuItemsIfNeeded");
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "playbackControlsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlOverflowButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContextMenu");

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "playbackControlsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlOverflowButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContextMenu");

}

- (void)setCustomControlItems:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *customControlItems;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_customControlItems, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    customControlItems = self->_customControlItems;
    self->_customControlItems = v5;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_customControlItems;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "setSecondGenerationControl:", 0);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__AVPlaybackControlsController_setCustomControlItems___block_invoke;
    v14[3] = &unk_1E5BB4CA0;
    v14[4] = self;
    objc_msgSend(v12, "setCustomControlItems:animations:", v4, v14);

    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));

  }
}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_showsMinimalPlaybackControlsWhenEmbeddedInline != a3)
  {
    v3 = a3;
    self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlaybackControlsController setShowsMinimalPlaybackControlsWhenEmbeddedInline:]";
      v10 = "showsMinimalPlaybackControlsWhenEmbeddedInline";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
  }
}

- (void)endHidingItemsForTransitionAndShowImmediately:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[AVPlaybackControlsController setHidingItemsForTransition:](self, "setHidingItemsForTransition:", 0);
  -[AVPlaybackControlsController showPlaybackControls:immediately:](self, "showPlaybackControls:immediately:", v3, 1);
  -[AVPlaybackControlsController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeControlStatus");

  if (v6 == 2 && v3)
    -[AVPlaybackControlsController flashPlaybackControlsWithDuration:](self, "flashPlaybackControlsWithDuration:", 3.0);
}

- (void)setHidingItemsForTransition:(BOOL)a3
{
  self->_hidingItemsForTransition = a3;
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrubber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(v8, "hasSeekableLiveStreamingContent"))
  {
    objc_msgSend(v7, "setLoadedTimeRanges:", 0);
  }
  else
  {
    objc_msgSend(v10, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLoadedTimeRanges:", v9);

  }
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return self->_hasSeekableLiveStreamingContent;
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  id v13;

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "prominentPlayButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "standardPlayPauseButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasAlternateAppearance:", a2);

  v13 = objc_loadWeakRetained(v4);
  objc_msgSend(v13, "prominentPlayButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)a2)
  {
    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    if (objc_msgSend(v11, "prominentPlayButtonCanShowPauseGlyph"))
      v12 = CFSTR("pause.fill");
    else
      v12 = CFSTR("play.fill");
    objc_msgSend(v10, "setImageName:", v12);

  }
  else
  {
    objc_msgSend(v9, "setImageName:", CFSTR("play.fill"));
  }

}

- (BOOL)prominentPlayButtonCanShowPauseGlyph
{
  return -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea") == 2;
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue") == 2;
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "playerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", v8, objc_msgSend(v10, "isPlaying"), 0);

  v11 = objc_loadWeakRetained(v4);
  objc_msgSend(v11, "playerController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "status");

  if (v13 == 2)
  {
    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "setHasBecomeReadyToPlay:", 1);

  }
}

- (void)setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3
{
  self->_hasPlaybackBegunSincePlayerControllerBecameReadyToPlay = a3;
}

- (void)setHasBecomeReadyToPlay:(BOOL)a3
{
  self->_hasBecomeReadyToPlay = a3;
}

- (void)setPlayerController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  void *v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[AVPlaybackControlsController volumeAnimator](self, "volumeAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restoreVolumeIfNeeded");

    -[AVPlaybackControlsController setVolumeAnimator:](self, "setVolumeAnimator:", 0);
    v7 = objc_storeWeak((id *)&self->_playerController, obj);

    if (obj)
      -[AVPlaybackControlsController _startObservingPotentiallyUnimplementedPlayerControllerProperties](self, "_startObservingPotentiallyUnimplementedPlayerControllerProperties");
    -[AVPlaybackControlsController volumeController](self, "volumeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[AVPlaybackControlsController volumeController](self, "volumeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_playerController);
      objc_msgSend(v10, "setPlayerController:", v11);

    }
    -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
    -[AVPlaybackControlsController _updateSkipButtonsEnableLongPress](self, "_updateSkipButtonsEnableLongPress");
    -[AVPlaybackControlsController turboModePlaybackControlsPlaceholderView](self, "turboModePlaybackControlsPlaceholderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlayerController:", obj);

    v5 = obj;
  }

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  AVPlayerControllerVolumeAnimator *v17;
  id v18;
  void *v19;
  AVPlayerControllerVolumeAnimator *v20;
  id v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  AVDisplayLink *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "volumeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isChangingVolume") & 1) == 0)
  {
    v7 = (id *)(a1 + 40);
    v8 = objc_loadWeakRetained(v7);
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
    v10 = objc_loadWeakRetained(v7);
    objc_msgSend(v10, "volumeSlider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isHiddenOrHasHiddenAncestor") ^ 1;

    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "volumeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    objc_msgSend(WeakRetained, "_updateVolumeSliderValueWithSystemVolume:animated:", v12);

  }
LABEL_5:
  v13 = objc_loadWeakRetained(v4);
  objc_msgSend(v13, "_updateVolumeButtonGlyph");

  v14 = objc_loadWeakRetained(v4);
  objc_msgSend(v14, "volumeAnimator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "restoreVolumeIfNeeded");

  v16 = objc_loadWeakRetained(v4);
  objc_msgSend(v16, "setVolumeAnimator:", 0);

  v17 = [AVPlayerControllerVolumeAnimator alloc];
  v18 = objc_loadWeakRetained(v4);
  objc_msgSend(v18, "playerController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AVPlayerControllerVolumeAnimator initWithPlayerController:](v17, "initWithPlayerController:", v19);

  v21 = objc_loadWeakRetained(v4);
  objc_msgSend(v21, "playerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isMuted") & a2;

  if ((_DWORD)a2)
  {
    v24 = -[AVPlayerControllerVolumeAnimator canAnimateVolumeTowardsZero](v20, "canAnimateVolumeTowardsZero");
    LOBYTE(v25) = 0;
  }
  else
  {
    v26 = objc_loadWeakRetained(v4);
    objc_msgSend(v26, "playerController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v27, "isMuted") ^ 1;

    v24 = -[AVPlayerControllerVolumeAnimator canAnimateVolumeAwayFromZero](v20, "canAnimateVolumeAwayFromZero");
  }
  v28 = objc_loadWeakRetained(v4);
  v29 = v28;
  if (((v23 | v25) & 1) != 0 || !v24)
  {
    objc_msgSend(v28, "playerController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMuted:", a2);

  }
  else
  {
    objc_msgSend(v28, "setVolumeAnimator:", v20);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_loadWeakRetained(v4);
    objc_msgSend(v31, "setPlayerMuteFadeAnimationID:", v30);

    v32 = objc_loadWeakRetained(v4);
    objc_msgSend(v32, "volumeAnimator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((_DWORD)a2)
      objc_msgSend(v33, "setProgressTowardsZero:", 0.0);
    else
      objc_msgSend(v33, "setProgressAwayFromZero:", 0.0);

    v36 = objc_alloc_init(AVDisplayLink);
    v37 = objc_loadWeakRetained(v4);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_8;
    v38[3] = &unk_1E5BB30F8;
    v29 = v30;
    v39 = v29;
    objc_copyWeak(&v40, v4);
    v41 = a2;
    -[AVDisplayLink startDisplayLinkUpdatesForObserver:framesPerSecond:usingBlock:](v36, "startDisplayLinkUpdatesForObserver:framesPerSecond:usingBlock:", v37, 36, v38);

    objc_destroyWeak(&v40);
  }

}

- (AVPlayerControllerVolumeAnimator)volumeAnimator
{
  return self->_volumeAnimator;
}

- (void)setVolumeAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeAnimator, a3);
}

uint64_t __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "transportControlsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customContentTransitioningInfoPanel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomContentTransitioningInfoPanel:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(*(id *)(a1 + 40), "_prefersVolumeSliderExpandedAutomatically"));
}

void __67__AVPlaybackControlsController__updateOrCreateTimeResolverIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setTimeResolver:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "playbackControlsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportControlsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

+ (id)keyPathsForValuesAffectingProminentPlayButtonCanShowPauseGlyph
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("preferredUnobscuredArea");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsStartContentTransitionButtons
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackControlsIncludeStartContentTransitionButtons");
  v6[1] = CFSTR("fullScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingSeekingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerController.canSeek");
  v6[1] = CFSTR("requiresLinearPlayback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingMinimumTime
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerController.status");
  v6[1] = CFSTR("timeResolver.minTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingMaximumTime
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerController.status");
  v6[1] = CFSTR("timeResolver.maxTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingCurrentTime
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerController.status");
  v6[1] = CFSTR("timeResolver.targetTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsTransportControls
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("preferredUnobscuredArea");
  v6[1] = CFSTR("shouldEnterFullScreenWhenPlaybackBegins");
  v6[2] = CFSTR("fullScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsRoutePickerView
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("multipleRoutesDetected");
  v6[1] = CFSTR("playerController.allowsExternalPlayback");
  v6[2] = CFSTR("wantsExternalPlaybackButtonShown");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShouldEnterFullScreenWhenPlaybackBegins
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("entersFullScreenWhenPlaybackBegins");
  v6[1] = CFSTR("hasPlaybackBegunSincePlayerControllerBecameReadyToPlay");
  v6[2] = CFSTR("playerViewControllerHasInvalidViewControllerHierarchy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingNeedsTimeResolver
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackControlsView");
  v6[1] = CFSTR("resumingUpdates");
  v6[2] = CFSTR("playbackControlsView.showsPlaybackControls");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingFullScreen
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerViewControllerIsPresentingFullScreen");
  v6[1] = CFSTR("playerViewControllerIsPresentedFullScreen");
  v6[2] = CFSTR("coveringWindow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingPlayButtonsShowPauseGlyph
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("timeControlStatus");
  v6[1] = CFSTR("playerController.activeRate");
  v6[2] = CFSTR("playerController.suspendedRate");
  v6[3] = CFSTR("playerController.playbackSuspended");
  v6[4] = CFSTR("playbackSuspendedForScrubbing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingCanShowLoadingIndicator
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playerController.status");
  v6[1] = CFSTR("playbackControlsView");
  v6[2] = CFSTR("playerViewControllerIsBeingTransitionedWithResizing");
  v6[3] = CFSTR("resumingUpdates");
  v6[4] = CFSTR("timeControlStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsSkipButtons
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("seekingEnabled");
  v6[1] = CFSTR("playerController.status");
  v6[2] = CFSTR("playerViewControllerIsBeingTransitionedWithResizing");
  v6[3] = CFSTR("requiresLinearPlayback");
  v6[4] = CFSTR("playbackControlsIncludeStartContentTransitionButtons");
  v6[5] = CFSTR("fullScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsProminentPlayButton
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("playbackControlsIncludeTransportControls");
  v6[1] = CFSTR("hasPlaybackBegunSincePlayerControllerBecameReadyToPlay");
  v6[2] = CFSTR("fullScreen");
  v6[3] = CFSTR("shouldEnterFullScreenWhenPlaybackBegins");
  v6[4] = CFSTR("pictureInPictureController.pictureInPictureActive");
  v6[5] = CFSTR("preferredUnobscuredArea");
  v6[6] = CFSTR("playerController.playingOnExternalScreen");
  v6[7] = CFSTR("playerController.hasVideo");
  v6[8] = CFSTR("playerController.hasEnabledAudio");
  v6[9] = CFSTR("playButtonsShowPauseGlyph");
  v6[10] = CFSTR("playerController");
  v6[11] = CFSTR("playButtonHandlerForLazyPlayerLoading");
  v6[12] = CFSTR("showsMinimalPlaybackControlsWhenEmbeddedInline");
  v6[13] = CFSTR("playerController.status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPictureInPictureController:(id)a3
{
  objc_storeStrong((id *)&self->_pictureInPictureController, a3);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AVPlaybackControlsController dealloc]";
    v12 = 1024;
    v13 = 227;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  -[AVPlaybackControlsController playbackControlsObservationController](self, "playbackControlsObservationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllObservation");

  -[AVPlaybackControlsController observationController](self, "observationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAllObservation");

  -[AVPlaybackControlsController setShowsTimecodes:](self, "setShowsTimecodes:", 0);
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersSystemVolumeHUDHidden:", 0);

  -[AVPlaybackControlsController timeResolver](self, "timeResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayerController:", 0);

  -[AVPlaybackControlsController routeDetectorCoordinator](self, "routeDetectorCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRouteDetectionEnabled:", 0);

  -[AVPlaybackControlsController setPlayerController:](self, "setPlayerController:", 0);
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackControlsController;
  -[AVPlaybackControlsController dealloc](&v9, sel_dealloc);
}

- (void)toggleMuted
{
  -[AVPlaybackControlsController setPrefersMuted:](self, "setPrefersMuted:", -[AVPlaybackControlsController prefersMuted](self, "prefersMuted") ^ 1);
}

- (void)setPlayerViewControllerIsBeingTransitionedWithResizing:(BOOL)a3
{
  if (self->_playerViewControllerIsBeingTransitionedWithResizing != a3)
  {
    self->_playerViewControllerIsBeingTransitionedWithResizing = a3;
    -[AVPlaybackControlsController _updatePlaybackControlsVisibleAndObservingUpdates](self, "_updatePlaybackControlsVisibleAndObservingUpdates");
  }
}

- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_canIncludePlaybackControlsWhenInline != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlaybackControlsController setCanIncludePlaybackControlsWhenInline:]";
      v10 = "canIncludePlaybackControlsWhenInline";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_canIncludePlaybackControlsWhenInline = v3;
  }
}

- (void)setVolumeControlsCanShowSlider:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_volumeControlsCanShowSlider != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlaybackControlsController setVolumeControlsCanShowSlider:]";
      v10 = "volumeControlsCanShowSlider";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_volumeControlsCanShowSlider = v3;
    -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", v3);
  }
}

- (void)setShowsVolumeControlsForContentWithNoAudio:(BOOL)a3
{
  if (self->_showsVolumeControlsForContentWithNoAudio != a3)
  {
    self->_showsVolumeControlsForContentWithNoAudio = a3;
    -[AVPlaybackControlsController _updateContainerInclusion](self, "_updateContainerInclusion");
  }
}

- (void)setShowsVideoGravityButton:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_showsVideoGravityButton != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlaybackControlsController setShowsVideoGravityButton:]";
      v10 = "showsVideoGravityButton";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_showsVideoGravityButton = v3;
    -[AVPlaybackControlsController _updateVideoGravityButtonType](self, "_updateVideoGravityButtonType");
  }
}

- (void)setShowsTimecodes:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_showsTimecodes != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPlaybackControlsController setShowsTimecodes:]";
      v11 = "showsTimecodes";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_showsTimecodes = v3;
    -[AVPlaybackControlsController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hasReadableTimecodes");

    -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
    -[AVPlaybackControlsController _updateScrubberAndTimeLabels](self, "_updateScrubberAndTimeLabels");
  }
}

- (BOOL)entersFullScreenWhenTapped
{
  _BOOL4 v3;

  v3 = -[AVPlaybackControlsController showsMinimalPlaybackControlsWhenEmbeddedInline](self, "showsMinimalPlaybackControlsWhenEmbeddedInline");
  if (v3)
  {
    if (-[AVPlaybackControlsController showsProminentPlayButton](self, "showsProminentPlayButton"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = -[AVPlaybackControlsController allowsEnteringFullScreen](self, "allowsEnteringFullScreen");
      if (v3)
        LOBYTE(v3) = !-[AVPlaybackControlsController isFullScreen](self, "isFullScreen");
    }
  }
  return v3;
}

- (void)setWantsExternalPlaybackButtonShown:(BOOL)a3
{
  if (self->_wantsExternalPlaybackButtonShown != a3)
    self->_wantsExternalPlaybackButtonShown = a3;
}

- (BOOL)tapGestureRecognizersCanReceiveTouches
{
  _BOOL4 v3;

  if (-[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls")
    || (v3 = -[AVPlaybackControlsController hasCustomPlaybackControls](self, "hasCustomPlaybackControls")))
  {
    LOBYTE(v3) = !-[AVPlaybackControlsController showsProminentPlayButton](self, "showsProminentPlayButton");
  }
  return v3;
}

- (void)turboModePlaybackControlsPlaceholderViewDidLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];

  v4 = a3;
  -[AVPlaybackControlsController setTurboModePlaybackControlsPlaceholderView:](self, "setTurboModePlaybackControlsPlaceholderView:", v4);
  objc_msgSend(v4, "setPreferredUnobscuredArea:", -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea"));
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "overrideTransformForProminentPlayButton");
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(v4, "setOverrideTransformForProminentPlayButton:", v10);

  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideLayoutMarginsWhenEmbeddedInline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideLayoutMarginsWhenEmbeddedInline:", v8);

  objc_msgSend(v4, "setHidden:", -[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls") ^ 1);
  -[AVPlaybackControlsController playerController](self, "playerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerController:", v9);

}

- (void)playerViewControllerContentViewPlaybackContentContainerViewChanged:(id)a3
{
  id v3;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeContentViewDidChange");

}

- (BOOL)playerViewControllerContentViewIsBeingTransitionedFromFullScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullScreenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[AVPlaybackControlsController playerViewController](self, "playerViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "isBeingDismissed");
  return v9;
}

- (void)playerViewControllerContentViewDidUpdateScrollingStatus:(id)a3
{
  id v3;

  -[AVPlaybackControlsController playerViewController](self, "playerViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performInitialSetupIfNeededAndPossible");

}

- (CGSize)playerViewControllerContentViewContentDimensions:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[AVPlaybackControlsController playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDimensions");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)transportControlsNeedsLayoutIfNeeded:(id)a3
{
  void *v4;
  id v5;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)transportControls:(id)a3 scrubberDidBeginScrubbing:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVPlaybackControlsController beginScrubbing](self, "beginScrubbing");
  -[AVPlaybackControlsController playerController](self, "playerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nominalFrameRate");
  objc_msgSend(v5, "setEstimatedFrameRate:");

}

- (void)transportControls:(id)a3 scrubberDidScrub:(id)a4
{
  float v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "value");
  v6 = v5;
  if ((objc_msgSend(v12, "isTracking") & 1) != 0)
  {
    objc_msgSend(v12, "resolution");
    v8 = v7;
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    -[AVPlaybackControlsController scrubToTime:resolution:](self, "scrubToTime:resolution:", v6, v8 * v11);

  }
  else
  {
    -[AVPlaybackControlsController scrubToTime:resolution:](self, "scrubToTime:resolution:", v6, 0.0);
  }

}

- (void)transportControls:(id)a3 scrubberDidEndScrubbing:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endScrubbing:", v5);

  -[AVPlaybackControlsController setPlaybackSuspendedForScrubbing:](self, "setPlaybackSuspendedForScrubbing:", 0);
  -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
  -[AVPlaybackControlsController setShouldIgnoreTimeResolverUpdates:](self, "setShouldIgnoreTimeResolverUpdates:", 0);
}

- (id)volumeControlsController:(id)a3 volumeButtonControl:(id)a4 viewContainingVolumeSlider:(id)a5
{
  return 0;
}

- (void)beginScrubbing
{
  void *v3;

  -[AVPlaybackControlsController setShouldIgnoreTimeResolverUpdates:](self, "setShouldIgnoreTimeResolverUpdates:", 1);
  -[AVPlaybackControlsController setPlaybackSuspendedForScrubbing:](self, "setPlaybackSuspendedForScrubbing:", -[AVPlaybackControlsController playButtonsShowPauseGlyph](self, "playButtonsShowPauseGlyph"));
  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginScrubbing:", self);

  -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
}

- (void)scrubToTime:(double)a3 resolution:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasSeekableLiveStreamingContent") & 1) != 0)
  {
    -[AVPlaybackControlsController timeResolver](self, "timeResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "seekableTimeRangeDuration");
  }
  else
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentDuration");
  }
  v10 = v9;

  -[AVPlaybackControlsController timeResolver](self, "timeResolver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetTime");
  v13 = v12;

  v14 = v10 / a4;
  v15 = 0.0;
  if (a4 > 0.0)
    v15 = v14;
  if (vabdd_f64(a3, v13) > v15)
  {
    if (a4 > 0.0
      && (-[AVPlaybackControlsController playerController](self, "playerController"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_opt_respondsToSelector(),
          v16,
          (v17 & 1) != 0))
    {
      v18 = v14 * 10.0;
      if (v14 * 10.0 > 15.0)
        v18 = 15.0;
      v19 = (a3 - v13) * 0.5;
      v20 = fmax(v19, 0.0);
      if (v20 >= v18)
        v21 = v18;
      else
        v21 = v20;
      if (v19 > 0.0)
        v19 = 0.0;
      v22 = -v19;
      if (v18 <= v22)
        v23 = v18;
      else
        v23 = v22;
      -[AVPlaybackControlsController playerController](self, "playerController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "seekToTime:toleranceBefore:toleranceAfter:", a3, v21, v23);
    }
    else
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "seekToTime:", a3);
    }

  }
  -[AVPlaybackControlsController _updateScrubberAndTimeLabels](self, "_updateScrubberAndTimeLabels");
}

- (void)endScrubbing
{
  void *v3;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endScrubbing:", self);

  -[AVPlaybackControlsController setPlaybackSuspendedForScrubbing:](self, "setPlaybackSuspendedForScrubbing:", 0);
  -[AVPlaybackControlsController _updateOrCreateTimeResolverIfNeeded](self, "_updateOrCreateTimeResolverIfNeeded");
  -[AVPlaybackControlsController setShouldIgnoreTimeResolverUpdates:](self, "setShouldIgnoreTimeResolverUpdates:", 0);
}

- (void)handleVolumeChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  char v23;

  v4 = a3;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "currentRouteHasVolumeControl"));

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volume");
  v10 = v9;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "volumeSlider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isTracking"))
  {

  }
  else
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "volumeButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isTracking");

    if ((v15 & 1) == 0)
    {
      LODWORD(v16) = v10;
      -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0, v16);
    }
  }
  -[AVPlaybackControlsController _updateVolumeButtonGlyph](self, "_updateVolumeButtonGlyph");
  objc_msgSend(v4, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AVVolumeControllerVolumeDidChangeNotificationIsInitialValueKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) == 0)
  {
    if (-[AVPlaybackControlsController isFullScreen](self, "isFullScreen")
      || (-[AVPlaybackControlsController volumeController](self, "volumeController"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isChangingVolume"),
          v20,
          v21))
    {
      -[AVPlaybackControlsController setPrefersMuted:](self, "setPrefersMuted:", 0);
      -[AVPlaybackControlsController playerViewController](self, "playerViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isBeingPresented");

      if ((v23 & 1) == 0)
        -[AVPlaybackControlsController flashVolumeControlsWithDuration:](self, "flashVolumeControlsWithDuration:", 2.0);
    }
  }
}

- (void)handleCurrentRouteSupportsVolumeControlChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeSlider");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setEnabled:", objc_msgSend(v6, "currentRouteHasVolumeControl"));

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "currentRouteHasVolumeControl");

  if ((v5 & 1) == 0)
  {
    -[AVPlaybackControlsController volumeController](self, "volumeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v8, "currentRouteHasVolumeControl"));

  }
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "volume");
  -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);

}

- (void)volumeSliderValueDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  double v8;

  v4 = a3;
  -[AVPlaybackControlsController beginChangingVolume](self, "beginChangingVolume");
  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = v6;

  LODWORD(v8) = v7;
  objc_msgSend(v5, "setTargetVolume:", v8);

  -[AVPlaybackControlsController _updateVolumeButtonGlyph](self, "_updateVolumeButtonGlyph");
}

- (void)volumeButtonTapTriggered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AVPlaybackControlsController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleMuted:", v4);

  -[AVPlaybackControlsController turboModePlaybackControlsPlaceholderView](self, "turboModePlaybackControlsPlaceholderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[AVPlaybackControlsController _updateVolumeButtonGlyph](self, "_updateVolumeButtonGlyph");
}

- (void)volumeButtonLongPressTriggered:(id)a3
{
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", 1);
}

- (void)beginChangingVolume
{
  id v2;

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginChangingVolume");

}

- (void)endChangingVolume
{
  id v2;

  -[AVPlaybackControlsController volumeController](self, "volumeController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endChangingVolume");

}

- (void)volumeButtonPanChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", 1);
  -[AVPlaybackControlsController setPrefersMuted:](self, "setPrefersMuted:", 0);
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volumeSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController updateVolumeSliderValue:volumeButtonControl:](self, "updateVolumeSliderValue:volumeButtonControl:", v5, v4);

}

- (void)updateVolumeSliderValue:(id)a3 volumeButtonControl:(id)a4
{
  id v6;
  double Width;
  double v8;
  void *v9;
  int v10;
  float v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  float v24;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26 = a3;
  v6 = a4;
  objc_msgSend(v26, "frame");
  Width = CGRectGetWidth(v27);
  if (Width > 0.0)
  {
    v8 = Width;
    -[AVPlaybackControlsController volumeController](self, "volumeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "currentRouteHasVolumeControl");

    if (v10)
    {
      objc_msgSend(v26, "value");
      v12 = v11;
      objc_msgSend(v6, "translationOfPanFromPreviousTouch");
      v14 = v13 / v8;
      objc_msgSend(v6, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      MaxX = CGRectGetMaxX(v28);
      objc_msgSend(v6, "locationOfTouchInWindow");
      v18 = v17;

      if (objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection") == 1)
      {
        objc_msgSend(v6, "locationOfTouchInWindow");
        v21 = v20;
        objc_msgSend(v6, "window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bounds");
        v23 = v21 - CGRectGetMinX(v29);

        v14 = -v14;
      }
      else
      {
        v23 = MaxX - v18;
      }
      if (v14 > 0.0 && v23 > 0.0)
      {
        v19 = fmin(fmax(v8 * (1.0 - v12) / v23, 1.0), 3.0) * v14;
        v14 = v19;
      }
      v24 = fminf(fmaxf(v12 + v14, 0.0), 1.0);
      *(float *)&v19 = v24;
      objc_msgSend(v26, "setValue:", v19);
      if (v12 != v24 && (v24 == 0.0 || v24 == 1.0))
        objc_msgSend(v6, "triggerSelectionChangedFeedback");
      -[AVPlaybackControlsController volumeSliderValueDidChange:](self, "volumeSliderValueDidChange:", v26);
    }
  }

}

- (void)routePickerViewWillBeginPresentingRoutes:(id)a3
{
  -[AVPlaybackControlsController setPopoverIsBeingPresented:](self, "setPopoverIsBeingPresented:", 1);
}

- (void)routePickerViewDidEndPresentingRoutes:(id)a3
{
  -[AVPlaybackControlsController setPopoverIsBeingPresented:](self, "setPopoverIsBeingPresented:", 0);
}

- (void)mediaSelectionMenuController:(id)a3 didSelectOption:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "audibleOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v10);

  -[AVPlaybackControlsController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setCurrentAudioMediaSelectionOption:", v10);
  else
    objc_msgSend(v8, "setCurrentLegibleMediaSelectionOption:", v10);

}

- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3
{
  void *v3;
  char v4;

  -[AVPlaybackControlsController playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "closedCaptionsEnabled");

  return v4;
}

- (id)overflowMenuItemsForControlOverflowButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  AVMediaSelectionMenuController *mediaSelectionMenuController;
  AVMediaSelectionMenuController *v14;
  AVMediaSelectionMenuController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSArray *transportBarCustomMenuItems;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaSelectionButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isIncluded"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaSelectionButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCollapsed");

    if (!v10)
      goto LABEL_11;
    -[AVPlaybackControlsController playerController](self, "playerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioMediaSelectionOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPlaybackControlsController playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "legibleMediaSelectionOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mediaSelectionMenuController = self->_mediaSelectionMenuController;
    v61 = v4;
    if (mediaSelectionMenuController)
    {
      -[AVMediaSelectionMenuController setAudibleOptions:](mediaSelectionMenuController, "setAudibleOptions:", v6);
      -[AVMediaSelectionMenuController setLegibleOptions:](self->_mediaSelectionMenuController, "setLegibleOptions:", v7);
    }
    else
    {
      v14 = -[AVMediaSelectionMenuController initWithAudibleOptions:legibleOptions:]([AVMediaSelectionMenuController alloc], "initWithAudibleOptions:legibleOptions:", v6, v7);
      v15 = self->_mediaSelectionMenuController;
      self->_mediaSelectionMenuController = v14;

      -[AVMediaSelectionMenuController setDelegate:](self->_mediaSelectionMenuController, "setDelegate:", self);
    }
    -[AVPlaybackControlsController playerController](self, "playerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "audioMediaSelectionOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController playerController](self, "playerController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentAudioMediaSelectionOption");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "indexOfObject:", v19);

    -[AVPlaybackControlsController playerController](self, "playerController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "legibleMediaSelectionOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsController playerController](self, "playerController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentLegibleMediaSelectionOption");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "indexOfObject:", v24);

    -[AVMediaSelectionMenuController setCurrentAudibleOptionIndex:](self->_mediaSelectionMenuController, "setCurrentAudibleOptionIndex:", v20);
    -[AVMediaSelectionMenuController setCurrentLegibleOptionIndex:](self->_mediaSelectionMenuController, "setCurrentLegibleOptionIndex:", v25);
    -[AVMediaSelectionMenuController audibleOptionsMenu](self->_mediaSelectionMenuController, "audibleOptionsMenu");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[AVMediaSelectionMenuController audibleOptionsMenu](self->_mediaSelectionMenuController, "audibleOptionsMenu");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v27);

    }
    -[AVMediaSelectionMenuController legibleOptionsMenu](self->_mediaSelectionMenuController, "legibleOptionsMenu");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v61;
    if (v28)
    {
      -[AVMediaSelectionMenuController legibleOptionsMenu](self->_mediaSelectionMenuController, "legibleOptionsMenu");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v29);

    }
  }

LABEL_11:
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "playbackSpeedButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isIncluded"))
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "playbackSpeedButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isCollapsed");

    if (!v34)
      goto LABEL_15;
    -[AVPlaybackControlsController playbackRateMenuController](self, "playbackRateMenuController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "menu");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);
  }

LABEL_15:
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "routePickerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isIncluded") & 1) != 0)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "routePickerView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isCollapsed");

    if (v39)
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "routePickerView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_OVERFLOW_MENU_ITEM_TITLE"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "avkit_imageWithSymbolNamed:textStyle:scale:", CFSTR("airplayvideo"), *MEMORY[0x1E0DC4A88], -1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isAirPlayActive"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.5, 0.86, 1.0, 1.0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "imageWithTintColor:renderingMode:", v44, 1);
        v45 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v45;
      }
      objc_initWeak(&location, self);
      v46 = (void *)MEMORY[0x1E0DC3428];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke;
      v64[3] = &unk_1E5BB2FA0;
      v47 = v41;
      v65 = v47;
      objc_copyWeak(&v66, &location);
      objc_msgSend(v46, "actionWithTitle:image:identifier:handler:", v42, v43, 0, v64);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v48);

      objc_destroyWeak(&v66);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
  if (self->_transportBarCustomMenuItems)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "transportControlsView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "customMenuItemsViews");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_181);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "filteredArrayUsingPredicate:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
    v56 = (void *)MEMORY[0x1E0CB3880];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_3;
    v62[3] = &unk_1E5BB2FE8;
    v63 = v53;
    v57 = v53;
    objc_msgSend(v56, "predicateWithBlock:", v62);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](transportBarCustomMenuItems, "filteredArrayUsingPredicate:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v59);
  }

  return v5;
}

- (void)playbackSpeedButtonTapped:(id)a3
{
  id v4;

  -[AVPlaybackControlsController playbackSpeedCollection](self, "playbackSpeedCollection", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectNextPlaybackSpeed:", self);

}

- (void)prominentPlayButtonTouchUpInside:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  id v14;

  v14 = a3;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "canTogglePlayback") & 1) != 0)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPlaying");

    if ((v6 & 1) == 0)
    {
      -[AVPlaybackControlsController playerViewController](self, "playerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "togglePlayback:", v14);

      -[AVPlaybackControlsController _updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:](self, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", 1, 1, 1);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (!-[AVPlaybackControlsController isFullScreen](self, "isFullScreen"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "status"))
    {

    }
    else
    {
      -[AVPlaybackControlsController playButtonHandlerForLazyPlayerLoading](self, "playButtonHandlerForLazyPlayerLoading");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[AVPlaybackControlsController startUpdatesIfNeeded](self, "startUpdatesIfNeeded");
        -[AVPlaybackControlsController playButtonHandlerForLazyPlayerLoading](self, "playButtonHandlerForLazyPlayerLoading");
        v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v13[2]();

        goto LABEL_9;
      }
    }
  }
  -[AVPlaybackControlsController playerController](self, "playerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "status") == 2;
  -[AVPlaybackControlsController playerController](self, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsController _updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:](self, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", v10, objc_msgSend(v11, "isPlaying"), 1);

LABEL_9:
}

- (void)skipButtonTouchUpInside:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "wasLongPressed") & 1) == 0)
  {
    objc_msgSend(v16, "maximumForceSinceTrackingBegan");
    v5 = v4;
    objc_msgSend(v16, "forceThreshold");
    if (v5 < v6)
    {
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "skipForwardButton");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v16)
      {
        -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transportControlsView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "liveStreamingControlsIncludeScrubber");

        if (v11)
        {
          -[AVPlaybackControlsController playerController](self, "playerController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "gotoEndOfSeekableRanges:", v16);

          goto LABEL_10;
        }
      }
      else
      {

      }
      -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "skipForwardButton");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v15 = -15.0;
      if (v14 == v16)
        v15 = 15.0;
      -[AVPlaybackControlsController _seekByTimeInterval:toleranceBefore:toleranceAfter:](self, "_seekByTimeInterval:toleranceBefore:toleranceAfter:", v15, 0.5, 0.5);
    }
  }
LABEL_10:

}

- (void)skipButtonLongPressTriggered:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipBackButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v10)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginScanningBackward:", v10);
    goto LABEL_5;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "skipForwardButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7 == v10)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginScanningForward:", v10);
LABEL_5:

    v8 = v10;
  }

}

- (void)skipButtonLongPressEnded:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipBackButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v10)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endScanningBackward:", v10);
    goto LABEL_5;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "skipForwardButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7 == v10)
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endScanningForward:", v10);
LABEL_5:

    v8 = v10;
  }

}

- (void)skipButtonForcePressChanged:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "maximumForceSinceTrackingBegan");
  v5 = v4;
  objc_msgSend(v11, "forceThreshold");
  if (v5 >= v6)
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "skipForwardButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[AVPlaybackControlsController playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "force");
    if (v8 != v11)
      v10 = -v10;
    objc_msgSend(v9, "setRateWithForce:", v10);

  }
}

- (void)startContentTransitionButtonTouchUpInside:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;

  v14 = a3;
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startLeftwardContentTransitionButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v14)
  {
    if (v5)
      v11 = 1;
    else
      v11 = 2;
  }
  else
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startRightwardContentTransitionButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 1;
    if (v5)
      v10 = 2;
    if (v9 == v14)
      v11 = v10;
    else
      v11 = 0;
  }
  -[AVPlaybackControlsController contentTransitionAction](self, "contentTransitionAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AVPlaybackControlsController contentTransitionAction](self, "contentTransitionAction");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, v11);

  }
}

- (void)_seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  void *v9;
  char v10;
  double v11;
  id v12;

  -[AVPlaybackControlsController playerController](self, "playerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[AVPlaybackControlsController playerController](self, "playerController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v12, "seekByTimeInterval:toleranceBefore:toleranceAfter:", a3, a4, a5);
  }
  else
  {
    -[AVPlaybackControlsController currentTime](self, "currentTime");
    objc_msgSend(v12, "seekToTime:", v11 + a3);
  }

}

- (void)setForcePlaybackControlsHidden:(BOOL)a3
{
  if (self->_forcePlaybackControlsHidden != a3)
  {
    self->_forcePlaybackControlsHidden = a3;
    -[AVPlaybackControlsController _updatePlaybackControlsVisibleAndObservingUpdates](self, "_updatePlaybackControlsVisibleAndObservingUpdates");
  }
}

- (void)togglePlaybackControlsVisibility
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));

  -[AVPlaybackControlsController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPlaying"))
  {
    v5 = -[AVPlaybackControlsController isShowingPlaybackControls](self, "isShowingPlaybackControls");

    if (!v5)
    {
      -[AVPlaybackControlsController flashPlaybackControlsWithDuration:](self, "flashPlaybackControlsWithDuration:", 3.0);
      return;
    }
  }
  else
  {

  }
  -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", -[AVPlaybackControlsController isShowingPlaybackControls](self, "isShowingPlaybackControls") ^ 1);
}

- (void)flashVolumeControlsWithDuration:(double)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeControlsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "isIncluded") & 1) != 0
    || -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically");
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", v6);

  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsAudioControls:", 1);

  -[AVPlaybackControlsController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPlaying"))
  {

  }
  else
  {
    -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "showsPlaybackControls");

    if ((v10 & 1) != 0)
      return;
  }
  -[AVPlaybackControlsController _autoHideControlsAfterDelay:](self, "_autoHideControlsAfterDelay:", 2.0);
}

- (void)beginShowingItemsDueToIndirectUserInteraction
{
  if (!-[AVPlaybackControlsController isPopoverBeingPresented](self, "isPopoverBeingPresented")
    && !-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPlaybackControlsController flashPlaybackControlsWithDuration:](self, "flashPlaybackControlsWithDuration:", 3.0);
  }
}

- (void)endShowingItemsDueToIndirectUserInteraction
{
  void *v3;
  _BOOL4 v4;
  id v5;

  if (!-[AVPlaybackControlsController isPopoverBeingPresented](self, "isPopoverBeingPresented")
    && !-[AVPlaybackControlsController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isPlayingOnExternalScreen"))
    {
      -[AVPlaybackControlsController playerViewController](self, "playerViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isAudioOnlyContent"))
      {
        v4 = -[AVPlaybackControlsController canHidePlaybackControls](self, "canHidePlaybackControls");

        if (v4)
          -[AVPlaybackControlsController showPlaybackControls:immediately:](self, "showPlaybackControls:immediately:", 0, 0);
        return;
      }

    }
  }
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  if (self->_pictureInPictureActive != a3)
  {
    self->_pictureInPictureActive = a3;
    if (a3)
    {
      v4 = 0;
    }
    else
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isPlaying") ^ 1;

    }
    -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", v4);
  }
}

- (void)setPopoverIsBeingPresented:(BOOL)a3
{
  void *v4;
  int v5;

  if (self->_popoverIsBeingPresented != a3)
  {
    self->_popoverIsBeingPresented = a3;
    if (a3)
    {
      -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", 1);
    }
    else
    {
      -[AVPlaybackControlsController playerController](self, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isPlaying");

      if (v5)
        -[AVPlaybackControlsController flashPlaybackControlsWithDuration:](self, "flashPlaybackControlsWithDuration:", 3.0);
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  if (-[AVPlaybackControlsController isHidingItemsForTransition](self, "isHidingItemsForTransition"))
    return 1;
  else
    return !-[AVPlaybackControlsController isShowingPlaybackControls](self, "isShowingPlaybackControls");
}

- (void)beginUserInteraction
{
  id v3;

  -[AVPlaybackControlsController setUserInteractingCount:](self, "setUserInteractingCount:", -[AVPlaybackControlsController userInteractingCount](self, "userInteractingCount") + 1);
  -[AVPlaybackControlsController playbackControlsVisibilityTimer](self, "playbackControlsVisibilityTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)endUserInteraction
{
  void *v3;
  int v4;

  -[AVPlaybackControlsController setUserInteractingCount:](self, "setUserInteractingCount:", -[AVPlaybackControlsController userInteractingCount](self, "userInteractingCount") - 1);
  if (!-[AVPlaybackControlsController userInteractingCount](self, "userInteractingCount"))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaying");

    if (v4)
      -[AVPlaybackControlsController _autoHideControlsAfterDelay:](self, "_autoHideControlsAfterDelay:", 3.0);
  }
}

- (void)_updatePhotosensitivityRegions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (_AXSPhotosensitiveMitigationEnabled()
    && (-[AVPlaybackControlsController playerController](self, "playerController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    -[AVPlaybackControlsController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosensitivityRegions");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrubber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhotosensitiveDisplayTimes:", v9);

}

- (BOOL)playerViewControllerHasInvalidViewControllerHierarchy
{
  return self->_playerViewControllerHasInvalidViewControllerHierarchy;
}

- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)a3
{
  self->_entersFullScreenWhenPlaybackBegins = a3;
}

- (BOOL)showsVolumeControlsForContentWithNoAudio
{
  return self->_showsVolumeControlsForContentWithNoAudio;
}

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (BOOL)playbackControlsIncludeStartContentTransitionButtons
{
  return self->_playbackControlsIncludeStartContentTransitionButtons;
}

- (void)setPlaybackControlsIncludeStartContentTransitionButtons:(BOOL)a3
{
  self->_playbackControlsIncludeStartContentTransitionButtons = a3;
}

- (BOOL)wantsExternalPlaybackButtonShown
{
  return self->_wantsExternalPlaybackButtonShown;
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  return self->_playButtonHandlerForLazyPlayerLoading;
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setStartLeftwardContentTransitionButtonEnabled:(BOOL)a3
{
  self->_startLeftwardContentTransitionButtonEnabled = a3;
}

- (void)setStartRightwardContentTransitionButtonEnabled:(BOOL)a3
{
  self->_startRightwardContentTransitionButtonEnabled = a3;
}

- (id)contentTransitionAction
{
  return self->_contentTransitionAction;
}

- (void)setContentTransitionAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (AVNowPlayingInfoController)nowPlayingInfoControllerIfLoaded
{
  return self->_nowPlayingInfoControllerIfLoaded;
}

- (void)setCanHidePlaybackControls:(BOOL)a3
{
  self->_canHidePlaybackControls = a3;
}

- (void)setTurboModePlaybackControlsPlaceholderView:(id)a3
{
  objc_storeWeak((id *)&self->_turboModePlaybackControlsPlaceholderView, a3);
}

- (UIAlertController)routePickerAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_routePickerAlertController);
}

- (void)setRoutePickerAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_routePickerAlertController, a3);
}

- (void)setRouteDetectorCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_routeDetectorCoordinator, a3);
}

- (id)AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver
{
  return self->_AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver;
}

- (void)setAVRouteDetectorCoordinatorMultipleRoutesDetectedObserver:(id)a3
{
  objc_storeStrong(&self->_AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver, a3);
}

- (UIViewPropertyAnimator)collapseExpandSliderAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_collapseExpandSliderAnimator);
}

- (void)setCollapseExpandSliderAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_collapseExpandSliderAnimator, a3);
}

- (NSUUID)playerMuteFadeAnimationID
{
  return self->_playerMuteFadeAnimationID;
}

- (void)setPlayerMuteFadeAnimationID:(id)a3
{
  objc_storeStrong((id *)&self->_playerMuteFadeAnimationID, a3);
}

- (AVMediaSelectionMenuController)mediaSelectionMenuController
{
  return self->_mediaSelectionMenuController;
}

- (void)setMediaSelectionMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSelectionMenuController, a3);
}

- (void)setPlaybackRateMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackRateMenuController, a3);
}

- (NSNumber)pendingOrientationChange
{
  return self->_pendingOrientationChange;
}

- (void)setPendingOrientationChange:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOrientationChange, a3);
}

- (BOOL)hasBecomeReadyToPlay
{
  return self->_hasBecomeReadyToPlay;
}

- (BOOL)isPlaybackSuspendedForScrubbing
{
  return self->_playbackSuspendedForScrubbing;
}

- (void)setPlaybackSuspendedForScrubbing:(BOOL)a3
{
  self->_playbackSuspendedForScrubbing = a3;
}

- (void)setShouldIgnoreTimeResolverUpdates:(BOOL)a3
{
  self->_shouldIgnoreTimeResolverUpdates = a3;
}

- (void)setVideoGravityButtonType:(int64_t)a3
{
  self->_videoGravityButtonType = a3;
}

- (BOOL)isVideoScaled
{
  return self->_videoScaled;
}

- (void)setUserInteractingCount:(unint64_t)a3
{
  self->_userInteractingCount = a3;
}

- (void)setShowingVolumeControlInTransportBar:(BOOL)a3
{
  self->_showingVolumeControlInTransportBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackControlsVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifer, 0);
  objc_storeStrong((id *)&self->_pendingOrientationChange, 0);
  objc_storeStrong((id *)&self->_playbackRateMenuController, 0);
  objc_storeStrong((id *)&self->_mediaSelectionMenuController, 0);
  objc_storeStrong((id *)&self->_playerMuteFadeAnimationID, 0);
  objc_storeStrong((id *)&self->_volumeAnimator, 0);
  objc_destroyWeak((id *)&self->_collapseExpandSliderAnimator);
  objc_destroyWeak((id *)&self->_loadingIndicatorTimer);
  objc_storeStrong(&self->_AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver, 0);
  objc_storeStrong((id *)&self->_routeDetectorCoordinator, 0);
  objc_destroyWeak((id *)&self->_routePickerAlertController);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeResolver, 0);
  objc_storeStrong((id *)&self->_playbackControlsObservationController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_turboModePlaybackControlsPlaceholderView);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_destroyWeak((id *)&self->_playerViewController);
  objc_storeStrong((id *)&self->_nowPlayingInfoControllerIfLoaded, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_pictureInPictureController, 0);
  objc_storeStrong(&self->_contentTransitionAction, 0);
  objc_storeStrong(&self->_playButtonHandlerForLazyPlayerLoading, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong(&self->_selectedPlaybackSpeedObservationToken, 0);
}

uint64_t __60__AVPlaybackControlsController__handlePhotosensitiveRegions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePhotosensitivityRegions");
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_5(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2)
    v6 = 2;
  else
    v6 = 0;
  objc_msgSend(WeakRetained, "setTimeControlStatus:", v6);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 3.0;
  if ((objc_msgSend(v8, "isPlaying") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v9 = v11;

  }
  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "flashPlaybackControlsWithDuration:", v9);

}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "playbackControlsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlOverflowButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContextMenu");

}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_22(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPendingOrientationChange:", 0);
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5648]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPendingOrientationChange:", v7);

  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    objc_msgSend(v13, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v13, "_prefersVolumeSliderExpandedAutomatically"));
    objc_msgSend(v13, "playbackControlsView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrefersVolumeSliderExpandedAutomatically:", objc_msgSend(v13, "_prefersVolumeSliderExpandedAutomatically"));

  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "isValid"))
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "setShowsLoadingIndicator:", objc_msgSend(v3, "canShowLoadingIndicator"));

  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  float v11;
  float v12;
  void *v13;
  id *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  char v31;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "runningTime");
  v8 = v7 / 0.3;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = v8;
  objc_msgSend(v9, "_solveForInput:", v10);
  v12 = v11;
  v13 = *(void **)(a1 + 32);
  v14 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playerMuteFadeAnimationID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v16)
  {
    objc_msgSend(v6, "invalidate");
    v17 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v17, "volumeAnimator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "restoreVolumeIfNeeded");

    v19 = objc_loadWeakRetained(v14);
    objc_msgSend(v19, "setVolumeAnimator:", 0);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v6, "runningTime");
  if (v20 < 0.3)
  {
    v21 = *(unsigned __int8 *)(a1 + 48);
    v19 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v19, "volumeAnimator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v12;
    if (v21)
      objc_msgSend(v22, "setProgressTowardsZero:", v24);
    else
      objc_msgSend(v22, "setProgressAwayFromZero:", v24);

    goto LABEL_10;
  }
  objc_msgSend(v6, "invalidate");
  objc_msgSend(v5, "playerController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (*(_BYTE *)(a1 + 48))
  {
    v27 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v26, "setMuted:", objc_msgSend(v27, "prefersMuted"));

  }
  else
  {
    objc_msgSend(v25, "setMuted:", 0);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_9;
  block[3] = &unk_1E5BB30D0;
  v29 = *(id *)(a1 + 32);
  objc_copyWeak(&v30, (id *)(a1 + 40));
  v31 = *(_BYTE *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v30);

LABEL_11:
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_9(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playerMuteFadeAnimationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v6 = objc_loadWeakRetained(v3);
      v7 = objc_msgSend(v6, "prefersMuted");

      if (v7)
      {
        v8 = objc_loadWeakRetained(v3);
        objc_msgSend(v8, "playerController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMuted:", 1);

      }
    }
    v10 = objc_loadWeakRetained(v3);
    objc_msgSend(v10, "volumeAnimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "restoreVolumeIfNeeded");

    v12 = objc_loadWeakRetained(v3);
    objc_msgSend(v12, "setPlayerMuteFadeAnimationID:", 0);

    v13 = objc_loadWeakRetained(v3);
    objc_msgSend(v13, "setVolumeAnimator:", 0);

  }
}

void __60__AVPlaybackControlsController__autoHideControlsAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", 0);
    WeakRetained = v2;
  }

}

void __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "presentRoutePicker:", WeakRetained);

}

BOOL __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "menuElementIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
        {
          v15 = v5;

          v9 = v15;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 != 0;
}

uint64_t __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isIncluded"))
    v8 = objc_msgSend(v7, "isCollapsed");
  else
    v8 = 0;

  return v8;
}

void __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackRateMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "playbackControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackSpeedButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenu:", v7);

}

uint64_t __54__AVPlaybackControlsController_setCustomControlItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateControlInclusion");
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "routeDetectorCoordinator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMultipleRoutesDetected:", objc_msgSend(v1, "multipleRoutesDetected"));

}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a4;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(v8, "handleCurrentRouteSupportsVolumeControlChanged:", v5);

}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a4;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(v8, "handleVolumeChange:", v5);

}

@end

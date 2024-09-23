@implementation AVMobileChromelessControlsViewController

- (void)_updateControlsViewLayoutConfiguration
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  char v13;
  id v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[7];
  uint64_t v23;
  uint64_t v24;
  id v25;
  char v26;
  BOOL v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  if (a1)
  {
    objc_msgSend((id)a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    v4 = *(id *)(a1 + 1688);
    v5 = -[AVMobileChromelessControlsViewController _preferredAuxiliaryControlsPlacement]((void *)a1);
    objc_msgSend(*(id *)(a1 + 1152), "standardPaddingFullScreen");
    v7 = v6;
    objc_msgSend(v4, "presentationHeight");
    v9 = v8;
    v10 = objc_msgSend((id)a1, "includedControls");
    if (v4)
      v11 = objc_msgSend(v4, "state") == 2;
    else
      v11 = 0;
    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 1152), "standardPaddingInline");
      v7 = v12;
      v10 &= ~0x40uLL;
    }
    v13 = *(_BYTE *)(a1 + 1504);
    v14 = *(id *)(a1 + 1168);
    v15 = *(_BYTE *)(a1 + 1648);
    v16 = objc_msgSend(*(id *)(a1 + 1688), "contentTabsLayout");

    v17 = *(void **)(a1 + 1160);
    v20 = v10;
    v21 = v13;
    memset(v22, 0, sizeof(v22));
    v23 = v7;
    v24 = v5;
    v18 = v14;
    v19 = v18;
    v25 = v18;
    v26 = v15;
    v27 = v11;
    v28 = 0;
    v29 = 0;
    v30 = v16;
    v31 = v9;
    if (v17)
      objc_msgSend(v17, "setLayoutConfiguration:", &v20);
    else

  }
}

- (AVMobileContentTabPresentationContext)contentTabPresentationContext
{
  return self->_contentTabPresentationContext;
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[AVMobileControlsViewController playbackSpeedCollection](self, "playbackSpeedCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setPlaybackSpeedCollection:](&v6, sel_setPlaybackSpeedCollection_, v4);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobilePlaybackRateMenuController setPlaybackSpeedCollection:](self->_playbackSpeedMenuController, "setPlaybackSpeedCollection:", v4);
        -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }

}

- (void)setIncludedControls:(unint64_t)a3
{
  objc_super v5;

  if (-[AVMobileControlsViewController includedControls](self, "includedControls") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setIncludedControls:](&v5, sel_setIncludedControls_, a3);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
      }
    }
  }
}

- (void)setExcludedControls:(unint64_t)a3
{
  objc_super v5;

  if (-[AVMobileControlsViewController excludedControls](self, "excludedControls") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setExcludedControls:](&v5, sel_setExcludedControls_, a3);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateTitleBarViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setPlayerController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[AVMobileControlsViewController playerController](self, "playerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[AVMobileControlsViewController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avkit_setWebKitDelegate:", 0);

    v8.receiver = self;
    v8.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setPlayerController:](&v8, sel_setPlayerController_, v4);
    -[AVMobileControlsViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avkit_setWebKitDelegate:", self);

    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVPlayerControllerTimeResolver setPlayerController:](self->_timeResolver, "setPlayerController:", v4);
        -[AVMobileChromelessControlsViewController _updateWebKitExcludedObservationState]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)self);
      }
    }
  }

}

- (void)fullscreenControllerDidChangePresentationState:(id)a3
{
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateLayoutMargins](self);
  -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 0);
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
}

- (void)_updateVolumeControllerClient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "volumeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClientWithIdentifier:forWindowSceneSessionWithIdentifier:", *(_QWORD *)(a1 + 1384), v6);

    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden]((_QWORD *)a1);
  }
}

- (void)_updateTimelineLabelPositions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1[145], "timelineView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    if (v3 == 2)
      v4 = objc_msgSend(a1, "prefersFullScreenStyleForEmbeddedMode");
    else
      v4 = 1;
    if (objc_msgSend(v5, "labelPosition") != v4)
    {
      objc_msgSend(v5, "setLabelPosition:", v4);
      objc_msgSend(a1[145], "setNeedsLayout");
    }

  }
}

- (void)_updateSecondaryPlaybackControlsTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  if (a1)
  {
    objc_msgSend(a1[145], "playbackControlsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1, "secondaryPlaybackControlsType");
    if (v3 == 1)
    {
      objc_msgSend(v2, "setBackwardSecondaryControlIcon:", 1);
      v4 = v2;
      v5 = 1;
    }
    else
    {
      if (v3)
      {
        _AVLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v7 = 0;
          _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Error: Unrecognized AVMobileSecondaryPlaybackControlsType", v7, 2u);
        }

        goto LABEL_10;
      }
      objc_msgSend(v2, "setBackwardSecondaryControlIcon:", 0);
      v4 = v2;
      v5 = 0;
    }
    objc_msgSend(v4, "setForwardSecondaryControlIcon:", v5);
LABEL_10:

  }
}

- (void)_updatePrefersVolumeSliderIncludedAnimated:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  BOOL v20;
  id location;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "volumeControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "fullscreenController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "presentationState");

    objc_msgSend((id)a1, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExternalPlaybackActive");

    if (v8)
    {
      if ((objc_msgSend(v4, "prefersVolumeSliderIncluded") & 1) != 0)
      {
        v9 = 0;
        goto LABEL_12;
      }
LABEL_18:

      return;
    }
    if ((!-[AVMobileChromelessControlsViewController _isLandscape](a1) || v6 == 2)
      && ((objc_msgSend((id)a1, "traitCollection"),
           v10 = (void *)objc_claimAutoreleasedReturnValue(),
           v11 = objc_msgSend(v10, "userInterfaceIdiom"),
           v10,
           v11 != 1)
       || v6 == 2))
    {
      v9 = *(_BYTE *)(a1 + 1344) != 0;
      if (objc_msgSend(v4, "prefersVolumeSliderIncluded") == v9)
        goto LABEL_18;
    }
    else
    {
      if ((objc_msgSend(v4, "prefersVolumeSliderIncluded") & 1) != 0)
        goto LABEL_18;
      v9 = 1;
    }
LABEL_12:
    if (a2)
    {
      v12 = 0.0;
      if (objc_msgSend(*(id *)(a1 + 1360), "isRunning"))
      {
        if (objc_msgSend(*(id *)(a1 + 1360), "isInterruptible"))
        {
          objc_msgSend(*(id *)(a1 + 1360), "fractionComplete");
          v12 = v13;
          objc_msgSend(*(id *)(a1 + 1360), "stopAnimation:", 1);
          objc_msgSend(*(id *)(a1 + 1360), "finishAnimationAtPosition:", 2);
          v14 = *(void **)(a1 + 1360);
          *(_QWORD *)(a1 + 1360) = 0;

        }
      }
      objc_initWeak(&location, (id)a1);
      v15 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __87__AVMobileChromelessControlsViewController__updatePrefersVolumeSliderIncludedAnimated___block_invoke;
      v18[3] = &unk_1E5BB4CC8;
      objc_copyWeak(&v19, &location);
      v20 = v9;
      v16 = objc_msgSend(v15, "initWithDuration:curve:animations:", 3, v18, (1.0 - v12) * 0.1);
      v17 = *(void **)(a1 + 1360);
      *(_QWORD *)(a1 + 1360) = v16;

      objc_msgSend(*(id *)(a1 + 1360), "startAnimation");
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v4, "setPrefersVolumeSliderIncluded:", v9);
    }
    goto LABEL_18;
  }
}

- (_QWORD)_updateLayoutMargins
{
  id *v1;
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
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

  if (result)
  {
    v1 = (id *)result;
    v2 = *((double *)result + 166);
    objc_msgSend(result, "fullscreenController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "presentationState");

    if (v4 == 2)
      v5 = objc_msgSend(v1, "prefersFullScreenStyleForEmbeddedMode");
    else
      v5 = 1;
    objc_msgSend(v1[144], "playbackControlsViewLayoutMarginsForView:keyboardHeight:isFullScreen:", v1[145], v5, v2);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    result = (_QWORD *)objc_msgSend(v1[145], "layoutMargins");
    if (v17 != v9 || v14 != v7 || v16 != v13 || v15 != v11)
    {
      objc_msgSend(v1[145], "setLayoutMargins:", v7, v9, v11, v13);
      return (_QWORD *)objc_msgSend(v1[145], "setNeedsLayout");
    }
  }
  return result;
}

- (void)_updateFullScreenButtonIcon
{
  void *v2;
  unint64_t v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[145], "displayModeControlsView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    if (v3 <= 2)
      objc_msgSend(v4, "setFullscreenIcon:", qword_1AC5F80F8[v3]);

  }
}

- (void)_updateDisplayModeControlsButtonsInclusion
{
  __int16 v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  uint64_t shouldIncludeRoutePicker;
  id v12;

  if (a1)
  {
    objc_msgSend(a1[145], "displayModeControlsView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(a1, "excludedControls");
    if (+[AVPictureInPictureController isPictureInPictureSupported](AVPictureInPictureController, "isPictureInPictureSupported"))
    {
      objc_msgSend(a1, "pipController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isPictureInPicturePossible");
      if ((v2 & 0x100) != 0)
        v5 = 0;
      else
        v5 = v4;

    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(a1, "fullscreenController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "presentationState"))
    {
      objc_msgSend(a1, "fullscreenController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "presentationState") == 1 && (objc_msgSend(a1, "excludedControls") & 0x80) == 0;

    }
    else
    {
      v8 = (objc_msgSend(a1, "excludedControls") & 0x80) == 0;
    }

    if (objc_msgSend(a1, "showsFullScreenControl"))
    {
      objc_msgSend(a1, "fullscreenController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "presentationState") == 2 && (objc_msgSend(a1, "excludedControls") & 0x40) == 0;

    }
    else
    {
      v10 = 0;
    }
    shouldIncludeRoutePicker = -[AVMobileChromelessControlsViewController _shouldIncludeRoutePickerButton](a1);
    objc_msgSend(v12, "setIncludesFullscreenControl:", v10 | v8);
    objc_msgSend(v12, "setIncludesPictureInPictureControl:", v5);
    objc_msgSend(v12, "setIncludesRoutePickerControl:", shouldIncludeRoutePicker);

  }
}

- (void)_updatePrefersSystemVolumeHUDHidden
{
  void *v2;
  int v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  id v11;

  if (a1)
  {
    if ((objc_msgSend(a1, "excludedControls") & 0x200) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(a1, "pipController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "isPictureInPictureActive");

      v4 = objc_msgSend(a1, "includedControls");
      objc_msgSend(a1, "fullscreenController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "presentationState");

      if (v6 == 2 || (v3 & 1) != 0 || (v4 & 2) == 0)
      {
        v8 = a1[183];
        objc_msgSend(a1, "fullscreenController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "presentationState") == 2;

        v7 = v10 & ~v3 & (v8 >> 1) & 1;
      }
      else
      {
        v7 = 1;
      }
    }
    objc_msgSend(a1, "volumeController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrefersSystemVolumeHUDHidden:", v7);

  }
}

- (void)_updatePinnedAuxiliaryControlsIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    objc_msgSend((id)a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    objc_msgSend(*(id *)(a1 + 1160), "bounds");
    v7 = v6;
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 1160), "bounds");
    v11 = v10;
    objc_msgSend((id)a1, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = v14;
    if (v3 != 2)
    {
      v17 = v7 <= v9 || v13 != 0;
      v18 = v11 > 600.0 && v5 == 1;
      if (v18 || !v17)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(*(id *)(a1 + 1160), "auxiliaryControlsView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "controls");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v19);
              v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((objc_msgSend(v29, "canOnlyAppearInOverflowMenu") & 1) == 0)
                objc_msgSend(v15, "addObject:", v29);
            }
            v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v26);
        }
        goto LABEL_35;
      }
      if (*(_QWORD *)(a1 + 1216))
        objc_msgSend(v14, "addObject:");
    }
    if (*(_QWORD *)(a1 + 1208))
      objc_msgSend(v15, "addObject:");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = *(id *)(a1 + 1584);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v15, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), (_QWORD)v31);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v21);
    }
LABEL_35:

    v30 = *(void **)(a1 + 1168);
    *(_QWORD *)(a1 + 1168) = v15;

    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
  }
}

- (void)_updateAuxiliaryControls
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "auxiliaryControlsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(void **)(a1 + 1584);
    if (v4 && objc_msgSend(v4, "count"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v5 = *(id *)(a1 + 1584);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v7);
      }

    }
    objc_msgSend((id)a1, "transportBarCustomMenuItems");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend((id)a1, "transportBarCustomMenuItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend((id)a1, "transportBarCustomMenuItems", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              -[AVMobileChromelessControlsViewController _identifierForMenuElement:](*(void **)(*((_QWORD *)&v24 + 1)
                                                                                              + 8 * j));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setIncluded:", 1);
              objc_msgSend(v3, "addObject:", v20);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v16);
        }

      }
    }
    if (*(_QWORD *)(a1 + 1208))
      objc_msgSend(v3, "addObject:");
    if (*(_QWORD *)(a1 + 1216))
    {
      objc_msgSend((id)a1, "fullscreenController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "presentationState");

      v23 = *(_QWORD *)(a1 + 1216);
      if (v22 == 2)
        objc_msgSend(v3, "addObject:", v23);
      else
        objc_msgSend(v3, "insertObject:atIndex:", v23, 0);
    }
    if (*(_QWORD *)(a1 + 1200))
      objc_msgSend(v3, "addObject:");
    if (*(_BYTE *)(a1 + 1708) && *(_QWORD *)(a1 + 1184))
      objc_msgSend(v3, "addObject:");
    if (*(_QWORD *)(a1 + 1192))
      objc_msgSend(v3, "addObject:");
    if (*(_QWORD *)(a1 + 1224))
      objc_msgSend(v3, "addObject:");
    if (*(_QWORD *)(a1 + 1232))
      objc_msgSend(v3, "addObject:");
    if (*(_QWORD *)(a1 + 1240))
      objc_msgSend(v3, "addObject:");
    objc_msgSend(v2, "setControls:", v3);
    objc_msgSend(v2, "updateOverflowMenu");
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);

  }
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[AVMobileControlsViewController transportBarCustomMenuItems](self, "transportBarCustomMenuItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setTransportBarCustomMenuItems:](&v6, sel_setTransportBarCustomMenuItems_, v4);
    if (self)
    {
      if (self->_hasBeenSetUp)
        -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
    }
  }

}

- (void)_updateAuxiliaryControlSpacing
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1[145], "auxiliaryControlsView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    if (v3 == 2)
    {
      objc_msgSend(a1[144], "standardPaddingInline");
      v5 = v4;
    }
    else if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)a1))
    {
      v5 = 26.0;
    }
    else
    {
      v5 = 13.0;
    }
    objc_msgSend(v7, "controlSpacing");
    if (v6 != v5)
    {
      objc_msgSend(v7, "setControlSpacing:", v5);
      objc_msgSend(a1[145], "setNeedsLayout");
    }

  }
}

- (uint64_t)_shouldIncludeRoutePickerButton
{
  char v2;
  void *v3;
  unsigned int v4;

  v2 = objc_msgSend(a1, "excludedControls");
  objc_msgSend(a1, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsExternalPlayback");

  if ((v2 & 0x10) != 0)
    return 0;
  else
    return v4;
}

- (void)_setNeedsControlsVisibilityStateUpdate
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 1480))
  {
    if (*(_BYTE *)(a1 + 1144))
    {
      *(_BYTE *)(a1 + 1480) = 1;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4[0] = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "performSelector:target:argument:order:modes:", sel__updateControlsVisibilityStateIfNeededAnimated_, a1, MEMORY[0x1E0C9AAB0], 0, v3);

    }
  }
}

- (void)setSecondaryPlaybackControlsType:(unint64_t)a3
{
  objc_super v5;

  if (-[AVMobileControlsViewController secondaryPlaybackControlsType](self, "secondaryPlaybackControlsType") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setSecondaryPlaybackControlsType:](&v5, sel_setSecondaryPlaybackControlsType_, a3);
    if (self)
    {
      if (self->_hasBeenSetUp)
        -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
    }
  }
}

- (void)setVolumeController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[AVMobileControlsViewController volumeController](self, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVMobileControlsViewController volumeController](self, "volumeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrefersSystemVolumeHUDHidden:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileControlsViewController setVolumeController:](&v7, sel_setVolumeController_, v4);
  if (self && self->_hasBeenSetUp)
  {
    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:]((id *)&self->super.super.super.super.super.isa, 0);
    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState]((id *)&self->super.super.super.super.super.isa);
    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](self);
    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewUserInteractionEnablementState]((id *)&self->super.super.super.super.super.isa);
  }

}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  if (-[AVMobileControlsViewController showsFullScreenControl](&v6, sel_showsFullScreenControl) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setShowsFullScreenControl:](&v5, sel_setShowsFullScreenControl_, v3);
    if (self)
    {
      if (self->_hasBeenSetUp)
        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
    }
  }
}

- (void)setRoutingConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[AVMobileControlsViewController routingConfiguration](self, "routingConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setRoutingConfiguration:](&v7, sel_setRoutingConfiguration_, v4);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsView displayModeControlsView](self->_view, "displayModeControlsView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setRoutingConfiguration:", v4);

        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }

}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AVMobileControlsViewController requiresLinearPlayback](self, "requiresLinearPlayback") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setRequiresLinearPlayback:](&v5, sel_setRequiresLinearPlayback_, v3);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateTimelineSliderEnablementState](self);
      }
    }
  }
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AVMobileControlsViewController optimizeForPerformance](self, "optimizeForPerformance") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setOptimizeForPerformance:](&v5, sel_setOptimizeForPerformance_, v3);
    -[AVMobileChromelessControlsViewController _attemptSetupIfNeeded](self);
  }
}

- (void)setFullscreenController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessControlsViewController;
  v4 = a3;
  -[AVMobileControlsViewController setFullscreenController:](&v5, sel_setFullscreenController_, v4);
  objc_msgSend(v4, "setDelegate:", self, v5.receiver, v5.super_class);

}

- (void)setControlItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileControlsViewController controlItems](&v17, sel_controlItems);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12.receiver = self;
    v12.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController controlItems](&v12, sel_controlItems);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "setDelegate:", 0);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

    v11.receiver = self;
    v11.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setControlItems:](&v11, sel_setControlItems_, v4);
    if (self && self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlsForControlItems](self);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsForControlItems]((id *)&self->super.super.super.super.super.isa);
    }
  }

}

- (AVMobileChromelessControlsViewController)init
{
  char *v2;
  AVMobileChromelessControlsViewController *v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromelessControlsViewController;
  v2 = -[AVMobileControlsViewController init](&v9, sel_init);
  v3 = (AVMobileChromelessControlsViewController *)v2;
  if (v2)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v2 + 1608) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v2 + 1624) = v4;
    v2[1708] = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globallyUniqueString");
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v6;

  }
  return v3;
}

- (void)updateVisibilityPolicy:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v7;
  unint64_t v8;
  objc_super v9;

  v7 = -[AVMobileControlsViewController visibilityPolicy](self, "visibilityPolicy");
  if (v7 != a3)
  {
    v8 = v7;
    v9.receiver = self;
    v9.super_class = (Class)AVMobileChromelessControlsViewController;
    -[AVMobileControlsViewController setVisibilityPolicy:](&v9, sel_setVisibilityPolicy_, a3);
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        if (a3 == 2)
        {
          if (v8 == 1)
          {
            -[AVMobileChromelessControlsViewController _hideControlsIfPossible]((uint64_t)self);
          }
          else if (!v8)
          {
            objc_msgSend((id)objc_opt_class(), "autoHideInterval");
            -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
          }
        }
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        if (!a4)
          -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateIfNeededAnimated:](self, "_updateControlsVisibilityStateIfNeededAnimated:", MEMORY[0x1E0C9AAA0]);
      }
    }
  }
}

- (void)setCustomInfoViewControllers:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_customInfoViewControllers != v5)
  {
    objc_storeStrong((id *)&self->_customInfoViewControllers, a3);
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _updateContentTabViewControllers]((uint64_t)self);
      -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
    }
  }

}

- (UIPanGestureRecognizer)contentTabPanGestureRecognizer
{
  -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded](self);
  return self->_contentTabPanGestureRecognizer;
}

- (void)_setUpPanGestureRecognizerIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    if (!a1[214])
    {
      v2 = (void *)a1[205];
      if (v2)
      {
        if (objc_msgSend(v2, "count") && a1[145])
        {
          objc_msgSend(a1, "fullscreenController");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v3, "presentationState");

          if (v4 != 2)
          {
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", a1, sel__contentTabPanGestureRecognizerTriggered_);
            objc_msgSend(v5, "setEnabled:", 1);
            objc_msgSend(v5, "setDelegate:", a1);
            v6 = (void *)a1[214];
            a1[214] = v5;

          }
        }
      }
    }
  }
}

- (id)controlsView
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_styleSheet)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  }
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  -[AVMobileControlsViewController volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersSystemVolumeHUDHidden:", 0);

  -[AVMobileControlsViewController volumeController](self, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientWithIdentifier:forWindowSceneSessionWithIdentifier:", 0, 0);

  -[AVMobileChromelessControlsViewController _cancelOutstandVisibilityUpdates]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController dealloc](&v6, sel_dealloc);
}

- (CGRect)unobscuredContentArea
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;
  CGRect v42;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[AVMobileChromelessControlsViewController _volumeControlsView]((id *)&self->super.super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v41.origin.x = v8;
  v41.origin.y = v9;
  v41.size.width = v10;
  v41.size.height = v11;
  v35.origin.x = v3;
  v35.origin.y = v4;
  v35.size.width = v5;
  v35.size.height = v6;
  v36 = CGRectUnion(v35, v41);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;

  -[AVMobileChromelessControlsViewController _displayModeControlsView]((id *)&self->super.super.super.super.super.isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v42.origin.x = v17;
  v42.origin.y = v18;
  v42.size.width = v19;
  v42.size.height = v20;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v38 = CGRectUnion(v37, v42);
  v21 = v38.origin.x;
  v22 = v38.origin.y;
  v23 = v38.size.width;
  v24 = v38.size.height;

  -[AVMobileChromelessControlsView bounds](self->_view, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v39.origin.x = v21;
  v39.origin.y = v22;
  v39.size.width = v23;
  v39.size.height = v24;
  MaxY = CGRectGetMaxY(v39);
  v32 = v30 - MaxY;
  v33 = v26;
  v34 = v28;
  result.size.height = v32;
  result.size.width = v34;
  result.origin.y = MaxY;
  result.origin.x = v33;
  return result;
}

- (id)displayModeControlsLayoutItem
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  UILayoutGuide *v6;
  UILayoutGuide *displayModeControlsLayoutGuide;
  void *v8;

  if (self)
  {
    -[AVMobileChromelessControlsView displayModeControlsView](self->_view, "displayModeControlsView");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (self->_view)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (!v5 && !-[AVMobileControlsViewController optimizeForPerformance](self, "optimizeForPerformance"))
    {
      v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      displayModeControlsLayoutGuide = self->_displayModeControlsLayoutGuide;
      self->_displayModeControlsLayoutGuide = v6;

      -[AVMobileChromelessControlsView addLayoutGuide:](self->_view, "addLayoutGuide:", self->_displayModeControlsLayoutGuide);
      -[UILayoutGuide avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:](self->_displayModeControlsLayoutGuide, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);

    }
  }
  return self->_displayModeControlsLayoutGuide;
}

- (void)setShowsAnalysisControl:(BOOL)a3
{
  if (self->_showsAnalysisControl != a3)
  {
    self->_showsAnalysisControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpAnalysisControlIfNeeded](self);
      -[AVMobileChromelessControlsViewController _updateAnalysisControlInclusionIfNeeded]((uint64_t)self);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)self);
    }
  }
}

- (void)setShowsCopySubjectControl:(BOOL)a3
{
  AVMobileAuxiliaryControl *copySubjectControl;

  if (self->_showsCopySubjectControl != a3)
  {
    self->_showsCopySubjectControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpCopySubjectControlIfNeeded](self);
      copySubjectControl = self->_copySubjectControl;
      if (copySubjectControl)
        -[AVMobileAuxiliaryControl setIncluded:](copySubjectControl, "setIncluded:", self->_showsCopySubjectControl);
    }
  }
}

- (void)setShowsVisualLookupControl:(BOOL)a3
{
  AVMobileAuxiliaryControl *v4;
  _BOOL4 showsVisualLookupControl;
  AVMobileAuxiliaryControl *v6;

  if (self->_showsVisualLookupControl != a3)
  {
    self->_showsVisualLookupControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpVisualLookupControlIfNeeded](self);
      v4 = self->_visualLookupControl;
      showsVisualLookupControl = self->_showsVisualLookupControl;
      v6 = v4;
      if (showsVisualLookupControl != -[AVMobileAuxiliaryControl isIncluded](v4, "isIncluded"))
        -[AVMobileAuxiliaryControl setIncluded:](v6, "setIncluded:", self->_showsVisualLookupControl);

    }
  }
}

- (void)setShowsAudioTrackSelectionMenu:(BOOL)a3
{
  if (self->_showsAudioTrackSelectionMenu != a3)
  {
    self->_showsAudioTrackSelectionMenu = a3;
    if (self->_hasBeenSetUp)
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
  }
}

- (id)transportControlsLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v9;
  void *v10;
  UILayoutGuide *v11;
  UILayoutGuide *transportControlsLayoutGuide;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *titlebarViewTopAnchorConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *timelineTopAnchorConstraint;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *auxiliaryControlsViewTopAnchorConstraint;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *defaultTopAnchorConstraint;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[AVMobileChromelessControlsView auxiliaryControlsView](self->_view, "auxiliaryControlsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsView timelineView](self->_view, "timelineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsView titlebarView](self->_view, "titlebarView");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self->_view)
      v7 = v4 == 0;
    else
      v7 = 1;
    v9 = v7 || v3 == 0 || v5 == 0;
    if (!v9 && !-[AVMobileControlsViewController optimizeForPerformance](self, "optimizeForPerformance"))
    {
      -[AVMobileChromelessControlsView layoutMarginsGuide](self->_view, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      transportControlsLayoutGuide = self->_transportControlsLayoutGuide;
      self->_transportControlsLayoutGuide = v11;

      -[AVMobileChromelessControlsView addLayoutGuide:](self->_view, "addLayoutGuide:", self->_transportControlsLayoutGuide);
      -[UILayoutGuide topAnchor](self->_transportControlsLayoutGuide, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      titlebarViewTopAnchorConstraint = self->_titlebarViewTopAnchorConstraint;
      self->_titlebarViewTopAnchorConstraint = v15;

      -[UILayoutGuide topAnchor](self->_transportControlsLayoutGuide, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      timelineTopAnchorConstraint = self->_timelineTopAnchorConstraint;
      self->_timelineTopAnchorConstraint = v19;

      -[UILayoutGuide topAnchor](self->_transportControlsLayoutGuide, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      auxiliaryControlsViewTopAnchorConstraint = self->_auxiliaryControlsViewTopAnchorConstraint;
      self->_auxiliaryControlsViewTopAnchorConstraint = v23;

      -[UILayoutGuide topAnchor](self->_transportControlsLayoutGuide, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      defaultTopAnchorConstraint = self->_defaultTopAnchorConstraint;
      self->_defaultTopAnchorConstraint = v27;

      v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[UILayoutGuide leadingAnchor](self->_transportControlsLayoutGuide, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v41);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v40;
      -[UILayoutGuide trailingAnchor](self->_transportControlsLayoutGuide, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v10;
      objc_msgSend(v10, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v30;
      -[UILayoutGuide bottomAnchor](self->_transportControlsLayoutGuide, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v29, "initWithArray:", v34);

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
      -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded]((id *)&self->super.super.super.super.super.isa);

    }
  }
  return self->_transportControlsLayoutGuide;
}

- (unint64_t)visibileControls
{
  return self->_currentVisibilityState.visibleControls;
}

- (id)volumeControlsLayoutItem
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  UILayoutGuide *v6;
  UILayoutGuide *volumeControlsLayoutGuide;
  void *v8;

  if (self)
  {
    -[AVMobileChromelessControlsView volumeControlsView](self->_view, "volumeControlsView");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (self->_view)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (!v5 && !-[AVMobileControlsViewController optimizeForPerformance](self, "optimizeForPerformance"))
    {
      v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      volumeControlsLayoutGuide = self->_volumeControlsLayoutGuide;
      self->_volumeControlsLayoutGuide = v6;

      -[AVMobileChromelessControlsView addLayoutGuide:](self->_view, "addLayoutGuide:", self->_volumeControlsLayoutGuide);
      -[UILayoutGuide avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:](self->_volumeControlsLayoutGuide, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);

    }
  }
  return self->_volumeControlsLayoutGuide;
}

- (void)setExtendedDynamicRangeGain:(double)a3
{
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    -[AVMobileChromelessControlsViewController _updateExtendedDynamicRangeGain]((uint64_t)self);
  }
}

- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3
{
  if (self->_prefersFullScreenStyleForEmbeddedMode != a3)
  {
    self->_prefersFullScreenStyleForEmbeddedMode = a3;
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
    -[AVMobileChromelessControlsViewController _updateExtendedDynamicRangeGain]((uint64_t)self);
    -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
  }
}

- (void)dismissCustomInfoViewControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  AVMobileContentTabPresentationContext *v5;
  BOOL v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  AVMobileContentTabPresentationContext *v10;

  v3 = a3;
  v5 = self->_contentTabPresentationContext;
  v10 = v5;
  if (v5)
  {
    v6 = -[AVMobileContentTabPresentationContext state](v5, "state") == 0;
    v5 = v10;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (-[AVMobileContentTabPresentationContext state](v5, "state") == 2)
  {
    -[AVMobileContentTabPresentationContext transitionContext](v10, "transitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "direction") == 0;

  }
  else
  {
    v9 = 0;
  }
  if ((v7 | v9) == 1)
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)self, 0, v3);

}

- (void)flashControlsWithDuration:(double)a3
{
  NSTimer *visibilityTimer;
  void *v6;
  char v7;
  void *v8;
  int v9;
  AVMobileContentTabPresentationContext *contentTabPresentationContext;
  BOOL v11;
  void *v12;
  NSTimer *v13;
  NSTimer *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (self)
  {
    -[NSTimer invalidate](self->_visibilityTimer, "invalidate");
    visibilityTimer = self->_visibilityTimer;
    self->_visibilityTimer = 0;

  }
  -[AVMobileControlsViewController pipController](self, "pipController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPictureInPictureActive");

  if ((v7 & 1) == 0)
  {
    -[AVMobileControlsViewController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPlaying");

    if (self
      && (contentTabPresentationContext = self->_contentTabPresentationContext) != 0
      && -[AVMobileContentTabPresentationContext state](contentTabPresentationContext, "state") != 1)
    {
      v11 = -[AVMobileContentTabPresentationContext contentTabsLayout](self->_contentTabPresentationContext, "contentTabsLayout") == 0;
      if (!v9)
      {
LABEL_12:
        self->_temporarilyVisibile = 1;
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        return;
      }
    }
    else
    {
      v11 = 0;
      if (!v9)
        goto LABEL_12;
    }
    if (!v11)
    {
      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x1E0C99E88];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__AVMobileChromelessControlsViewController_flashControlsWithDuration___block_invoke;
      v15[3] = &unk_1E5BB49A8;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, a3);
      v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v14 = self->_visibilityTimer;
      self->_visibilityTimer = v13;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    goto LABEL_12;
  }
}

- (void)didBeginIndirectUserInteraction
{
  objc_msgSend((id)objc_opt_class(), "autoHideInterval");
  -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
}

- (void)toggleVisibility:(id)a3
{
  if (self->_temporarilyVisibile)
  {
    -[AVMobileChromelessControlsViewController _hideControlsIfPossible]((uint64_t)self);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)loadView
{
  _BOOL8 v3;
  AVMobileContentTabPresentationContext *contentTabPresentationContext;
  AVMobileChromelessControlsView *obj;

  obj = objc_alloc_init(AVMobileChromelessControlsView);
  -[AVMobileChromelessControlsView setDelegate:](obj, "setDelegate:", self);
  -[AVMobileChromelessControlsView setPreservesSuperviewLayoutMargins:](obj, "setPreservesSuperviewLayoutMargins:", 0);
  -[AVMobileChromelessControlsView setInsetsLayoutMarginsFromSafeArea:](obj, "setInsetsLayoutMarginsFromSafeArea:", 0);
  v3 = 1;
  -[AVView setHidden:](obj, "setHidden:", 1);
  -[AVView setAutomaticallyUpdatesSubviewContentIntersections:](obj, "setAutomaticallyUpdatesSubviewContentIntersections:", 1);
  -[AVMobileChromelessControlsViewController setView:](self, "setView:", obj);
  objc_storeStrong((id *)&self->_view, obj);
  contentTabPresentationContext = self->_contentTabPresentationContext;
  if (contentTabPresentationContext)
    v3 = -[AVMobileContentTabPresentationContext state](contentTabPresentationContext, "state") == 1;
  -[AVView setIgnoresTouches:](self->_view, "setIgnoresTouches:", v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;
  _QWORD block[4];
  id v5;
  id location;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self && !self->_needsTimeResolverUpdate)
  {
    self->_needsTimeResolverUpdate = 1;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__AVMobileChromelessControlsViewController__setNeedsTimeResolverUpdate__block_invoke;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded]((id *)&self->super.super.super.super.super.isa);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (self && self->_hasBeenSetUp)
    -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _attemptSetupIfNeeded](self);
}

- (void)viewSafeAreaInsetsDidChange
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController viewSafeAreaInsetsDidChange](&v6, sel_viewSafeAreaInsetsDidChange);
  if (self)
  {
    if (self->_hasBeenSetUp)
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __71__AVMobileChromelessControlsViewController_viewSafeAreaInsetsDidChange__block_invoke;
      v3[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v4, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  AVMobileContentTabPresentationContext *v8;
  AVMobileContentTabPresentationContext *v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self && self->_hasBeenSetUp)
  {
    -[UIPanGestureRecognizer setEnabled:](self->_contentTabPanGestureRecognizer, "setEnabled:", 0);
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
    v8 = self->_contentTabPresentationContext;
    v9 = v8;
    if (self->_contentTabViewPresentationAnimator && -[AVMobileContentTabPresentationContext state](v8, "state") == 2)
    {
      -[UIViewPropertyAnimator stopAnimation:](self->_contentTabViewPresentationAnimator, "stopAnimation:", 0);
      -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_contentTabViewPresentationAnimator, "finishAnimationAtPosition:", -[UIViewPropertyAnimator isReversed](self->_contentTabViewPresentationAnimator, "isReversed"));
    }

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__AVMobileChromelessControlsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E5BB35A8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (self)
  {
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _updateStyleSheet](self, "_updateStyleSheet");
      -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
    }
  }
}

- (void)controlItemDidUpdateVisualConfiguration:(id)a3
{
  id v3;

  if (self)
  {
    -[AVMobileChromelessControlsView auxiliaryControlsView](self->_view, "auxiliaryControlsView", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateOverflowMenu");

  }
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

  -[AVMobileControlsViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setCurrentAudioMediaSelectionOption:", v10);
  else
    objc_msgSend(v8, "setCurrentLegibleMediaSelectionOption:", v10);

}

- (void)mediaSelectionMenuController:(id)a3 didSelectEnhanceDialogueOption:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[AVMobileChromelessControlsViewController enhanceDialogueController](self, "enhanceDialogueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentLevel:", a4);

  objc_msgSend(v6, "setCurrentEnhanceDialogueOption:", a4);
  -[AVMenuButton updateContextMenu](self->_audibleMediaSelectionButton, "updateContextMenu");
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
}

- (id)mediaSelectionMenuController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[AVMobileControlsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AVMobileControlsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlsViewController:displayNameForMediaSelectionOption:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3
{
  void *v3;
  char v4;

  -[AVMobileControlsViewController playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "closedCaptionsEnabled");

  return v4;
}

- (id)menuForMenuButton:(id)a3
{
  AVMenuButton *v4;
  AVMenuButton *v5;
  void *v6;
  uint64_t v7;

  v4 = (AVMenuButton *)a3;
  v5 = v4;
  if (self->_playbackSpeedButton == v4)
  {
    -[AVMobilePlaybackRateMenuController menu](self->_playbackSpeedMenuController, "menu");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v7;
    goto LABEL_9;
  }
  if (self->_audibleMediaSelectionButton == v4)
  {
    -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    -[AVMediaSelectionMenuController audibleOptionsMenu](self->_mediaSelectionMenuController, "audibleOptionsMenu");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (self->_legibleMediaSelectionButton == v4)
  {
    -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    -[AVMediaSelectionMenuController legibleOptionsMenu](self->_mediaSelectionMenuController, "legibleOptionsMenu");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)auxiliaryControlsView:(id)a3 menuElementForControl:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  AVMobileAuxiliaryControl *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  char *j;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  _QWORD v42[5];
  id location[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48[14];

  v48[12] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (self
    && (-[AVMobileControlsViewController transportBarCustomMenuItems](self, "transportBarCustomMenuItems"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v45 = 0u;
    v46 = 0u;
    *(_OWORD *)location = 0u;
    v44 = 0u;
    -[AVMobileControlsViewController transportBarCustomMenuItems](self, "transportBarCustomMenuItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", location, v47, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v44 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)*((_QWORD *)location[1] + i);
          -[AVMobileChromelessControlsViewController _identifierForMenuElement:](v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == v6)
          {
            v15 = v13;

            v9 = v15;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", location, v47, 16);
      }
      while (v10);
    }

  }
  else
  {
    v9 = 0;
  }

  v16 = (AVMobileAuxiliaryControl *)v5;
  if (self)
  {
    v45 = 0u;
    v46 = 0u;
    *(_OWORD *)location = 0u;
    v44 = 0u;
    -[AVMobileControlsViewController controlItems](self, "controlItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", location, v47, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v17);
          v21 = (void *)*((_QWORD *)location[1] + (_QWORD)j);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVMobileAuxiliaryControl identifier](v16, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v22 == v23;

          if (v24)
          {
            objc_msgSend(v21, "action");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = (void *)MEMORY[0x1E0DC3428];
              objc_msgSend(v21, "title");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "image");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[AVMobileAuxiliaryControl identifier](v16, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __71__AVMobileChromelessControlsViewController__menuElementForControlItem___block_invoke;
              v42[3] = &unk_1E5BB3990;
              v42[4] = v21;
              objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v27, v28, v29, v42);
              v18 = (char *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v21, "isEnabled") & 1) == 0)
                objc_msgSend(v18, "setAttributes:", 1);
            }
            else
            {
              objc_msgSend(v21, "menu");
              v18 = (char *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v21, "menu");
                v18 = (char *)objc_claimAutoreleasedReturnValue();
              }
            }
            goto LABEL_29;
          }
        }
        v18 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", location, v47, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_29:

  }
  else
  {
    v18 = 0;
  }

  if (self->_audibleMediaSelectionControl == v16)
  {
    -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    -[AVMediaSelectionMenuController audibleOptionsOverflowMenu](self->_mediaSelectionMenuController, "audibleOptionsOverflowMenu");
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  if (self->_legibleMediaSelectionControl == v16)
  {
    -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    -[AVMediaSelectionMenuController legibleOptionsMenu](self->_mediaSelectionMenuController, "legibleOptionsMenu");
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  if (self->_playbackSpeedControl == v16)
  {
    -[AVMobilePlaybackRateMenuController menu](self->_playbackSpeedMenuController, "menu");
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  if (self->_routePickerControl != v16)
  {
    if (self->_analysisControl == v16)
    {
      v39 = 1304;
    }
    else if (self->_copySubjectControl == v16)
    {
      v39 = 1312;
    }
    else if (self->_visualLookupControl == v16)
    {
      v39 = 1320;
    }
    else
    {
      if (self->_jumpToLiveControl != v16)
      {
        if (v9)
        {
          v30 = v9;
        }
        else
        {
          if (!v18)
          {
            v38 = 0;
            goto LABEL_52;
          }
          v30 = v18;
        }
        goto LABEL_51;
      }
      v39 = 1296;
    }
    v30 = (char *)*(id *)((char *)&self->super.super.super.super.super.isa + v39);
LABEL_51:
    v38 = v30;
    goto LABEL_52;
  }
  -[AVMobileChromelessControlsView displayModeControlsView](self->_view, "displayModeControlsView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "routePickerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_OVERFLOW_MENU_ITEM_TITLE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "avkit_imageWithSymbolNamed:textStyle:scale:", CFSTR("airplayvideo"), *MEMORY[0x1E0DC4A90], 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "isAirPlayActive"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.5, 0.86, 1.0, 1.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithTintColor:renderingMode:", v35, 1);
    v36 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v36;
  }
  objc_initWeak(location, self);
  v37 = (void *)MEMORY[0x1E0DC3428];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __70__AVMobileChromelessControlsViewController__menuElementForRoutePicker__block_invoke;
  v47[3] = &unk_1E5BB3918;
  objc_copyWeak(v48, location);
  objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v33, v34, 0, v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v48);
  objc_destroyWeak(location);

LABEL_52:
  v40 = v38;

  return v40;
}

- (void)volumeControlsViewInteractionDidBegin:(id)a3
{
  NSTimer *volumeEmphasisAnimationDelayTimer;
  void *v5;

  -[AVMobileChromelessControlsViewController _incrementUserInteractionCount]((uint64_t)self);
  if (self)
  {
    -[NSTimer invalidate](self->_volumeEmphasisAnimationDelayTimer, "invalidate");
    volumeEmphasisAnimationDelayTimer = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = 0;

    -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:]((id *)&self->super.super.super.super.super.isa, 1);
  }
  -[AVMobileControlsViewController volumeController](self, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginChangingVolume");

  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 1);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4
{
  void *v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)self);
  -[AVMobileControlsViewController volumeController](self, "volumeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a4;
  objc_msgSend(v6, "setTargetVolume:", v7);

  -[AVMobileControlsViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMuted");

  if (v9)
  {
    -[AVMobileControlsViewController playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMuted:", 0);

    objc_msgSend(v11, "setMute:", 0);
  }

}

- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4 withUpdateSource:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AVMobileControlsViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)self);
  if (a5 != 2)
  {
    -[AVMobileControlsViewController volumeController](self, "volumeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginChangingVolume");

    -[AVMobileControlsViewController volumeController](self, "volumeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = a4;
    objc_msgSend(v10, "setTargetVolume:", v11);

    -[AVMobileControlsViewController volumeController](self, "volumeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endChangingVolume");

  }
  if (objc_msgSend(v8, "isMuted"))
  {
    objc_msgSend(v8, "setMuted:", 0);
    objc_msgSend(v13, "setMute:", 0);
  }

}

- (void)volumeControlsViewInteractionDidEnd:(id)a3
{
  NSTimer *volumeEmphasisAnimationDelayTimer;
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[AVMobileChromelessControlsViewController _decrementUserInteractionCount](self);
  if (self)
  {
    -[NSTimer invalidate](self->_volumeEmphasisAnimationDelayTimer, "invalidate");
    volumeEmphasisAnimationDelayTimer = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = 0;

    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __80__AVMobileChromelessControlsViewController__volumeControlsViewInteractionDidEnd__block_invoke;
    v12 = &unk_1E5BB49A8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v9, 3.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v7 = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  -[AVMobileControlsViewController volumeController](self, "volumeController", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endChangingVolume");

  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 1);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (void)volumeControlsViewButtonWasTapped:(id)a3
{
  void *v4;

  -[AVMobileControlsViewController eventManager](self, "eventManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendActionsForEvent:", CFSTR("AVChromelessControlsVolumeButtonPressedEvent"));

  if (self)
  {
    if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)self))
    {
      -[AVMobileChromelessControlsViewController _handleMuteStateToggle](self);
    }
    else
    {
      if (self->_volumeSliderTemporarilyVisibileInFullscreen)
        -[AVMobileChromelessControlsViewController _handleMuteStateToggle](self);
      -[AVMobileChromelessControlsViewController _temporarilyShowVolumeSlider]((uint64_t)self);
    }
  }
}

- (void)displayModeControlsViewFullscreenButtonWasPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "fullscreenIcon") == 1)
  {
    -[AVMobileControlsViewController fullscreenController](self, "fullscreenController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enterFullscreen:", self);
LABEL_5:

    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "fullscreenIcon"))
  {
    -[AVMobileControlsViewController eventManager](self, "eventManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendActionsForEvent:", CFSTR("AVChromelessControlsDoneButtonPressedEvent"));
    goto LABEL_5;
  }
LABEL_6:
  -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon]((id *)&self->super.super.super.super.super.isa);

}

- (void)displayModeControlsViewPictureInPictureButtonWasPressed:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[AVMobileControlsViewController pipController](self, "pipController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPictureInPicturePossible");

  if (v5)
  {
    -[AVMobileControlsViewController pipController](self, "pipController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPictureInPictureActive");

    -[AVMobileControlsViewController pipController](self, "pipController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "stopPictureInPicture");
    else
      objc_msgSend(v8, "startPictureInPicture");

    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](self);
  }
}

- (void)displayModeControlsView:(id)a3 layoutWithHiddenIdentifiers:(id)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSArray *overflowDisplayModeControls;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[AVMobileAuxiliaryControl identifier](self->_routePickerControl, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          -[NSArray addObject:](v6, "addObject:", self->_routePickerControl);
        }
        else
        {
          -[AVMobileChromelessControlsViewController _auxiliaryControlForIdentifier:]((uint64_t)self, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            -[NSArray addObject:](v6, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  overflowDisplayModeControls = self->_overflowDisplayModeControls;
  self->_overflowDisplayModeControls = v6;

  -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateControlItemsInclusionState]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);

}

- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3
{
  void *v4;
  void *v5;

  -[AVMobileControlsViewController eventManager](self, "eventManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendActionsForEvent:", CFSTR("AVChromelessControlsPlayPauseButtonPressedEvent"));

  -[AVMobileControlsViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "togglePlayback:", self);

  if (self)
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "backwardSecondaryControlIcon"))
  {
    if (objc_msgSend(v6, "backwardSecondaryControlIcon") != 1)
      goto LABEL_7;
    -[AVMobileControlsViewController eventManager](self, "eventManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendActionsForEvent:", CFSTR("AVChromelessControlsSkipBackwardPressedEvent"));
  }
  else
  {
    -[AVMobileControlsViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekByTimeInterval:", -10.0);

    -[AVMobileControlsViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "chromelessControlsViewControllerDidPressSkipBackButton:", self);
  }

LABEL_7:
  if (self)
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }

}

- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "forwardSecondaryControlIcon"))
  {
    if (objc_msgSend(v6, "forwardSecondaryControlIcon") == 1)
    {
      -[AVMobileControlsViewController eventManager](self, "eventManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sendActionsForEvent:", CFSTR("AVChromelessControlsSkipForwardPressedEvent"));
    }
    else
    {
      if (objc_msgSend(v6, "forwardSecondaryControlIcon") != 2)
        goto LABEL_9;
      -[AVMobileControlsViewController playerController](self, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "seekToEnd:", self);
    }
  }
  else
  {
    -[AVMobileControlsViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekByTimeInterval:", 10.0);

    -[AVMobileControlsViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "chromelessControlsViewControllerDidPressSkipForwardButton:", self);
  }

LABEL_9:
  if (self)
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }

}

- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  self->_sliderEdgeInsets = a4;
}

- (void)sliderDidBeginTracking:(id)a3
{
  id v4;

  -[AVMobileControlsViewController playerController](self, "playerController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginPlaybackSuspension");
  objc_msgSend(v4, "beginScrubbing:", self);
  -[AVMobileChromelessControlsViewController _timelineSliderTrackingStateDidChange](self, "_timelineSliderTrackingStateDidChange");
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _incrementUserInteractionCount]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);

}

- (void)sliderWillEndTracking:(id)a3
{
  id v4;

  -[AVMobileControlsViewController playerController](self, "playerController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endScrubbing:", self);
  objc_msgSend(v4, "endPlaybackSuspension");

}

- (void)sliderDidEndTracking:(id)a3
{
  -[AVMobileChromelessControlsViewController _timelineSliderTrackingStateDidChange](self, "_timelineSliderTrackingStateDidChange", a3);
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _decrementUserInteractionCount](self);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (void)slider:(id)a3 didUpdateFrame:(CGRect)a4 forSliderMark:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;

  if (self->_liveEdgeSliderMark == a5)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    -[AVMobileChromelessControlsView liveEdgeContentTagView](self->_view, "liveEdgeContentTagView", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v10, "setFrame:", -[AVMobileChromelessControlsViewController _frameForLiveEdgeMarkContentTag:]((uint64_t)self, x, y, width, height));

  }
}

- (void)contentTabsViewController:(id)a3 didChangeSelectedCustomInfoViewController:(id)a4 withReason:(unint64_t)a5
{
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (self)
  {
    -[AVMobileChromelessContentTabsViewController selectedCustomInfoViewController](self->_contentTabsViewController, "selectedCustomInfoViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)self, v9, 1);
    if (!a5)
    {
      objc_msgSend((id)objc_opt_class(), "autoHideInterval");
      -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
    }
  }
  if (v7)
  {
    objc_msgSend(v7, "avkit_infoPanelKindIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("Kind");
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("AVPlayerViewControllerDidShowInfoViewControllerNotification"), v7, v12);

  }
}

- (void)webkitPlayerController:(id)a3 didChangeScrubbingStateTo:(BOOL)a4
{
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updateTimelineEmphasisStateIfNeeded]((id *)&self->super.super.super.super.super.isa);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if ((UIPanGestureRecognizer *)self->_contentTabTapGestureRecognizer == v4)
  {
    -[UIPanGestureRecognizer view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsView contentTabsView](self->_view, "contentTabsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", v8);
    objc_msgSend(v7, "hitTest:withEvent:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9 == 0;
  }
  else
  {
    v6 = 1;
    if (self->_contentTabPanGestureRecognizer == v4)
    {
      if ((-[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", self->_view), !self->_contentTabPresented)
        && v10 > 0.0
        || self->_contentTabViewPresentationAnimator)
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3
{
  if (self->_needsControlsVisibilityStateUpdate)
    -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)self, objc_msgSend(a3, "BOOLValue"));
}

- (void)_contentTabPanGestureRecognizerTriggered:(id)a3
{
  uint64_t v4;
  UIViewPropertyAnimator *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AVMobileChromelessControlsView *view;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v23;
  AVMobileContentTabPresentationContext *contentTabPresentationContext;
  AVMobileContentTabPresentationContext *v25;
  uint64_t v26;
  AVMobileContentTabPresentationContext *v27;
  AVMobileContentTabPresentationContext *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  UIViewPropertyAnimator *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;

  v39 = a3;
  v4 = objc_msgSend(v39, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    if (!self)
      goto LABEL_26;
    view = self->_view;
    v15 = v39;
    objc_msgSend(v15, "velocityInView:", view);
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(v15, "state");

    v21 = v17 * 0.05;
    v23 = v19 < 0.0 || v20 == 4;
    contentTabPresentationContext = self->_contentTabPresentationContext;
    if (!contentTabPresentationContext)
      goto LABEL_19;
    if (!-[AVMobileContentTabPresentationContext state](contentTabPresentationContext, "state"))
      goto LABEL_18;
    v25 = self->_contentTabPresentationContext;
    if (v25)
    {
      v26 = -[AVMobileContentTabPresentationContext state](v25, "state");
      v27 = self->_contentTabPresentationContext;
      v28 = v27;
      if (v26 == 2)
      {
        -[AVMobileContentTabPresentationContext transitionContext](v27, "transitionContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "direction");

        if (v30)
        {
LABEL_21:
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:initialVelocity:", 1.0, v21, v19 * 0.05);
          -[UIViewPropertyAnimator setReversed:](self->_contentTabViewPresentationAnimator, "setReversed:", v23);
          -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self->_contentTabViewPresentationAnimator, "continueAnimationWithTimingParameters:durationFactor:", v31, 1.0);

          goto LABEL_26;
        }
LABEL_18:
        v23 = v23 ^ 1;
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
      v28 = 0;
    }

    goto LABEL_21;
  }
  if (v4 == 2)
  {
    if (self)
    {
      v32 = self->_contentTabViewPresentationAnimator;
      v33 = v39;
      -[UIViewPropertyAnimator pauseAnimation](v32, "pauseAnimation");
      objc_msgSend(v33, "velocityInView:", self->_view);
      -[AVMobileChromelessControlsViewController _transitionContentTabIfNeccesary:](self, v34, v35);
      objc_msgSend(v33, "translationInView:", self->_view);
      v37 = v36;

      v38 = v37 / self->_contentTabPanGestureTranslationScaleFactor;
      if (self->_contentTabPresented)
        v38 = -v38;
      -[UIViewPropertyAnimator setFractionComplete:](v32, "setFractionComplete:", v38 + self->_contentTabInteractivePresentationInitialFractionComplete);

    }
  }
  else if (v4 == 1 && self)
  {
    v5 = self->_contentTabViewPresentationAnimator;
    v6 = v39;
    -[UIViewPropertyAnimator pauseAnimation](v5, "pauseAnimation");
    objc_msgSend(v6, "velocityInView:", self->_view);
    v8 = v7;
    v10 = v9;

    -[AVMobileChromelessControlsViewController _transitionContentTabIfNeccesary:](self, v8, v10);
    -[AVMobileChromelessControlsView bounds](self->_view, "bounds");
    self->_contentTabPanGestureTranslationScaleFactor = v11 / 3.0;
    -[UIViewPropertyAnimator fractionComplete](v5, "fractionComplete");
    v13 = v12;

    self->_contentTabInteractivePresentationInitialFractionComplete = v13;
  }
LABEL_26:

}

- (void)_contentTabTapGestureRecognizerTriggered:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state") - 1;
  v5 = v7;
  if (v4 <= 2)
  {
    v6 = v7;
    if (self)
    {
      if (-[AVMobileContentTabPresentationContext contentTabsLayout](self->_contentTabPresentationContext, "contentTabsLayout"))
      {
        -[AVMobileChromelessControlsViewController toggleVisibility:](self, "toggleVisibility:", self);
      }
      else
      {
        -[AVMobileChromelessControlsViewController dismissCustomInfoViewControllerAnimated:](self, "dismissCustomInfoViewControllerAnimated:", 1);
      }
    }

    v5 = v7;
  }

}

- (void)_updateStyleSheet
{
  void *v3;
  void *v4;
  void *v5;
  AVMobileChromelessControlsStyleSheet *v6;
  AVMobileChromelessControlsStyleSheet *styleSheet;
  id v8;

  -[AVMobileChromelessControlsViewController _timelineView]((id *)&self->super.super.super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController _titlebarView]((id *)&self->super.super.super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AVMobileChromelessControlsStyleSheet initWithTraitCollection:]([AVMobileChromelessControlsStyleSheet alloc], "initWithTraitCollection:", v5);
  styleSheet = self->_styleSheet;
  self->_styleSheet = v6;

  objc_msgSend(v8, "setStyleSheet:", self->_styleSheet);
  objc_msgSend(v3, "setStyleSheet:", self->_styleSheet);
  -[AVMobileChromelessControlsViewController _updateLayoutMargins](self);
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);

}

- (void)_enumerateControlItemsOfTypes:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVMobileControlsViewController controlItems](self, "controlItems");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__AVMobileChromelessControlsViewController__enumerateControlItemsOfTypes_usingBlock___block_invoke;
  v11[3] = &unk_1E5BB3968;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

- (void)_handleJumpToLiveAction
{
  id v3;

  -[AVMobileControlsViewController playerController](self, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seekToEnd:", self);

}

- (void)_timelineSliderDidChangeValue:(id)a3
{
  AVPlayerControllerTimeResolver *timeResolver;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  id v11;

  v11 = a3;
  timeResolver = self->_timeResolver;
  if (timeResolver)
  {
    -[AVPlayerControllerTimeResolver minTime](timeResolver, "minTime");
    v6 = v5;
    -[AVPlayerControllerTimeResolver maxTime](self->_timeResolver, "maxTime");
    v8 = v7;
    if (fabs(v6) != INFINITY && fabs(v7) != INFINITY)
    {
      -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      -[AVPlayerControllerTimeResolver setTargetTime:](self->_timeResolver, "setTargetTime:", v6 + (v8 - v6) * v10);

    }
  }
  -[AVMobileChromelessControlsViewController _updateTimelineValues]((uint64_t)self);

}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (BOOL)prefersFullScreenStyleForEmbeddedMode
{
  return self->_prefersFullScreenStyleForEmbeddedMode;
}

- (BOOL)showsAnalysisControl
{
  return self->_showsAnalysisControl;
}

- (BOOL)showsCopySubjectControl
{
  return self->_showsCopySubjectControl;
}

- (BOOL)showsVisualLookupControl
{
  return self->_showsVisualLookupControl;
}

- (BOOL)showsAudioTrackSelectionMenu
{
  return self->_showsAudioTrackSelectionMenu;
}

- (AVEnhanceDialogueController)enhanceDialogueController
{
  return self->_enhanceDialogueController;
}

- (void)setEnhanceDialogueController:(id)a3
{
  objc_storeStrong((id *)&self->_enhanceDialogueController, a3);
}

- (double)extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhanceDialogueController, 0);
  objc_storeStrong((id *)&self->_contentTabPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentTabTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentTabPresentationContext, 0);
  objc_storeStrong((id *)&self->_contentTabsViewController, 0);
  objc_storeStrong((id *)&self->_contentTabViewPresentationAnimator, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_liveEdgeSliderMark, 0);
  objc_storeStrong((id *)&self->_timelineSliderEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsForControlItems, 0);
  objc_storeStrong((id *)&self->_defaultTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_timelineTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titlebarViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_currentTransportControlsTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_volumeControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_displayModeControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_visibilityAnimator, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_loadingAnimator, 0);
  objc_storeStrong((id *)&self->_mediaSelectionMenuController, 0);
  objc_storeStrong((id *)&self->_playbackSpeedMenuController, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeResolver, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeSliderTemporarilyVisibleTimer, 0);
  objc_storeStrong((id *)&self->_volumeEmphasisAnimationDelayTimer, 0);
  objc_storeStrong((id *)&self->_volumeControlsSliderAnimator, 0);
  objc_storeStrong((id *)&self->_volumeControlsEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, 0);
  objc_storeStrong((id *)&self->_visualLookupAction, 0);
  objc_storeStrong((id *)&self->_copySubjectAction, 0);
  objc_storeStrong((id *)&self->_analysisToggleAction, 0);
  objc_storeStrong((id *)&self->_jumpToLiveAction, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_jumpToLiveButton, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionMenu, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionMenu, 0);
  objc_storeStrong((id *)&self->_visualLookupControl, 0);
  objc_storeStrong((id *)&self->_copySubjectControl, 0);
  objc_storeStrong((id *)&self->_analysisControl, 0);
  objc_storeStrong((id *)&self->_jumpToLiveControl, 0);
  objc_storeStrong((id *)&self->_routePickerControl, 0);
  objc_storeStrong((id *)&self->_playbackSpeedControl, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionControl, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionControl, 0);
  objc_storeStrong((id *)&self->_overflowDisplayModeControls, 0);
  objc_storeStrong((id *)&self->_pinnedAuxiliaryControls, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_webKitExcludedObservationController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
}

- (void)_updateTimelineEmphasisStateIfNeeded
{
  uint64_t v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  char v25;
  id location;

  if (a1)
  {
    v2 = -[AVMobileChromelessControlsViewController _isScrubbing](a1);
    objc_msgSend(a1[145], "timelineView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2 != objc_msgSend(v3, "isEmphasized"))
    {
      objc_msgSend(v3, "prepareForDeemphasisIfNeeded");
      objc_msgSend(v3, "setEmphasized:", v2);
      v4 = a1[199];
      v5 = 1.0;
      v6 = 1.0;
      if (v4 && objc_msgSend(v4, "isRunning") && objc_msgSend(a1[199], "isInterruptible"))
      {
        objc_msgSend(a1[199], "fractionComplete");
        v6 = v7;
        objc_msgSend(a1[199], "stopAnimation:", 1);
        objc_msgSend(a1[199], "finishAnimationAtPosition:", 2);
        v8 = a1[199];
        a1[199] = 0;

      }
      if (v6 <= 1.0)
        v9 = v6 * 0.2;
      else
        v9 = 0.2;
      if ((_DWORD)v2)
      {
        v10 = 288.0;
      }
      else
      {
        v5 = 2.0;
        v10 = 500.0;
      }
      if ((_DWORD)v2)
        v11 = 26.5;
      else
        v11 = 40.0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", v5, v10, v11, 0.0, 0.0);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v12, v9);
      v14 = a1[199];
      a1[199] = (id)v13;

      objc_initWeak(&location, a1);
      v15 = a1[199];
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke;
      v23[3] = &unk_1E5BB4CC8;
      objc_copyWeak(&v24, &location);
      v25 = v2;
      objc_msgSend(v15, "addAnimations:", v23);
      v17 = a1[199];
      v18 = v16;
      v19 = 3221225472;
      v20 = __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke_2;
      v21 = &unk_1E5BB38A0;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v17, "addCompletion:", &v18);
      objc_msgSend(a1[199], "startAnimation", v18, v19, v20, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }
}

- (uint64_t)_isScrubbing
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;

  objc_msgSend(a1, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTracking");

  if ((v4 & 1) != 0 || (objc_msgSend(v2, "isScrubbing") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v2, "avkit_webkitIsScrubbing");

  return v5;
}

void __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[145], "timelineView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmphasized:", *(unsigned __int8 *)(a1 + 40));

    objc_msgSend(v5[145], "timelineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    WeakRetained = v5;
  }

}

void __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[199];
    WeakRetained[199] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (id)_timelineSlider
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "timelineView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "slider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_updateTimelineValues
{
  void *v2;
  float v3;
  float v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __CFString *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  BOOL v19;
  double v20;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint16x4_t v30;
  id v31;

  if (a1)
  {
    -[AVMobileChromelessControlsViewController _timelineSlider](a1);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "timelineView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "value");
    v4 = v3;
    v5 = *(void **)(a1 + 1160);
    if (v5 && *(_BYTE *)(a1 + 1144) && (objc_msgSend(v5, "isHidden") & 1) == 0 && (v6 = *(void **)(a1 + 1392)) != 0)
    {
      objc_msgSend(v6, "minTime");
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 1392), "maxTime");
      v10 = v9;
      v11 = 0;
      v12 = 0;
      if (fabs(v8) != INFINITY)
      {
        if (fabs(v9) == INFINITY)
        {
          v12 = 0;
        }
        else
        {
          v13 = v9 - v8;
          objc_msgSend((id)a1, "playerController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "avkit_webkitSeekToTime");
          v16 = v15;

          v17 = (unint64_t)(COERCE__INT64(fabs(v10 - v8)) - 0x10000000000000) >> 53;
          v19 = (COERCE__INT64(v10 - v8) < 0 || v17 > 0x3FE)
             && (unint64_t)(COERCE__INT64(v10 - v8) - 1) > 0xFFFFFFFFFFFFELL;
          v20 = fabs(v16);
          if (!v19 && v20 != INFINITY)
          {
            v23 = (v16 - v8) / v13;
            v4 = v23;
          }
          objc_msgSend(*(id *)(a1 + 1400), "setFormatTemplate:", v10 - v8);
          objc_msgSend(*(id *)(a1 + 1408), "setFormatTemplate:", v10 - v8);
          objc_msgSend((id)a1, "playerController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "currentOrEstimatedDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "hasSeekableLiveStreamingContent") && v25)
          {
            objc_msgSend(v25, "dateByAddingTimeInterval:", -(v13 - v16));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 1416), "stringFromDate:", v26);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = &stru_1E5BB5F88;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 1400), "stringFromSeconds:", v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 1408), "stringFromSeconds:", v10 - v16);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

        }
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    objc_msgSend(v2, "leadingTimeText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    objc_msgSend(v2, "trailingTimeText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v12 != 0) == v28 || (v11 != 0) == (v29 == 0))
      objc_msgSend(*(id *)(a1 + 1160), "setNeedsLayout");
    if ((objc_msgSend(v31, "isTracking") & 1) == 0)
    {
      v30 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1608), *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1624), *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL));
      if ((vminv_u16(v30) & 1) != 0)
      {
        *(float *)v30.i32 = v4;
        objc_msgSend(v31, "setValue:", *(double *)&v30);
      }
    }
    objc_msgSend(v2, "setLeadingTimeText:", v12);
    objc_msgSend(v2, "setTrailingTimeText:", v11);

  }
}

void __85__AVMobileChromelessControlsViewController__enumerateControlItemsOfTypes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    v6 = *(_QWORD *)(a1 + 40);

    if (v6)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {

  }
}

- (id)_timelineView
{
  if (a1)
  {
    objc_msgSend(a1[145], "timelineView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_titlebarView
{
  if (a1)
  {
    objc_msgSend(a1[145], "titlebarView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_preferredAuxiliaryControlsPlacement
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fullscreenController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationState");

  if (v3 == 2)
    return objc_msgSend(a1, "prefersFullScreenStyleForEmbeddedMode") ^ 1;
  else
    return 0;
}

- (void)_transitionContentTabIfNeccesary:(double)a3
{
  void *v6;

  v6 = (void *)a1[211];
  if ((!v6 || objc_msgSend(v6, "state") != 2) && fabs(a3) > fabs(a2))
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    objc_msgSend(a1, "flashControlsWithDuration:");
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)a1, a3 < 0.0, 1);
  }
}

- (void)_setContentTabPresented:(int)a3 animated:
{
  AVMobileContentTabPresentationContext *v5;
  void *v6;
  uint64_t v7;
  AVPlayerViewControllerAnimationCoordinator *v8;
  _BOOL8 v9;
  AVMobileContentTabTransitionContext *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  id v23;
  void *v24;
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
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  AVMobileContentTabPresentationContext *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[2];
  id location;
  _QWORD v63[4];
  id v64[14];

  v64[12] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1 || *(unsigned __int8 *)(a1 + 1648) == a2)
    return;
  *(_BYTE *)(a1 + 1648) = a2;
  -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded]((_QWORD *)a1);
  -[AVMobileChromelessControlsViewController _setUpTapGestureRecognizerIfNeeded](a1);
  v5 = (AVMobileContentTabPresentationContext *)*(id *)(a1 + 1688);
  objc_msgSend(*(id *)(a1 + 1680), "selectedCustomInfoViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    v7 = 2;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v7 = *(_BYTE *)(a1 + 1648) == 0;
    if (!v5)
LABEL_8:
      v5 = objc_alloc_init(AVMobileContentTabPresentationContext);
  }
  -[AVMobileContentTabPresentationContext setState:](v5, "setState:", v7);
  -[AVMobileContentTabPresentationContext setCustomInfoViewController:](v5, "setCustomInfoViewController:", v6);
  if (a3)
  {
    v8 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
    v9 = *(_BYTE *)(a1 + 1648) == 0;
    v10 = objc_alloc_init(AVMobileContentTabTransitionContext);
    -[AVMobileContentTabTransitionContext setDirection:](v10, "setDirection:", v9);
    -[AVMobileContentTabTransitionContext setAnimationCoordinator:](v10, "setAnimationCoordinator:", v8);
    -[AVMobileContentTabPresentationContext setTransitionContext:](v5, "setTransitionContext:", v10);

  }
  v11 = *(void **)(a1 + 1688);
  *(_QWORD *)(a1 + 1688) = v5;
  v57 = v5;

  v12 = *(void **)(a1 + 1688);
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "state") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v14 = 0;
      v15 = 0.0;
    }
    else
    {
      objc_msgSend((id)a1, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      memset(v61, 0, sizeof(v61));
      v16 = *(id *)(a1 + 1640);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (v17)
      {
        v19 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v60 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v21, "preferredContentSize", v56, v57, (_QWORD)v59);
            objc_msgSend(v21, "preferredContentSize");
            if (v18 < v22)
              v18 = v22;
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v17);
      }

      v23 = *(id *)(a1 + 1160);
      objc_msgSend(v23, "contentTabsView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutMargins");
      v26 = v25;
      objc_msgSend(v24, "intrinsicContentSize");
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 1160), "bounds");
      v30 = v29;
      v32 = v31;
      objc_msgSend(*(id *)(a1 + 1160), "safeAreaInsets");
      v34 = v33;

      v35 = v56;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v36 = 16.0;
        if (v30 > v32)
          v36 = 14.0;
        v37 = 28.0;
        if (v26 <= 28.0)
          v37 = v26;
        if (v34 >= v37)
          v37 = v34;
        v38 = objc_msgSend(v56, "chromelessControlsViewController:contentTabPresentationInfoWithPreferredHeight:", a1, v18 + v28 + v36 + v37, v56);
        v14 = v39;
      }
      else
      {
        v14 = 0;
        v38 = 0;
      }

      v15 = *(double *)&v38;
    }
    objc_msgSend(v13, "setPresentationHeight:", v15, v56);
    objc_msgSend(v13, "setContentTabsLayout:", v14);

  }
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
  objc_msgSend(*(id *)(a1 + 1488), "invalidate");
  v40 = *(void **)(a1 + 1488);
  *(_QWORD *)(a1 + 1488) = 0;

  v58 = *(id *)(a1 + 1688);
  objc_msgSend((id)a1, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 1648) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v41, "chromelessControlsViewController:willBeginPresentingContentTabWithContext:", a1, v58);
  if (!*(_BYTE *)(a1 + 1648) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v41, "chromelessControlsViewController:willBeginDismissingContentTabWithContext:", a1, v58);
  if (a3)
  {
    v42 = objc_msgSend(*(id *)(a1 + 1712), "state") != 1 && objc_msgSend(*(id *)(a1 + 1712), "state") != 2;
    if (*(_BYTE *)(a1 + 1648) && !v42)
      objc_msgSend(*(id *)(a1 + 1680), "selectInitialCustomInfoViewController");
    v44 = *(id *)(a1 + 1672);
    v45 = 0.0;
    if (objc_msgSend(v44, "isRunning") && objc_msgSend(v44, "isInterruptible"))
    {
      objc_msgSend(v44, "fractionComplete");
      v45 = v46;
      objc_msgSend(v44, "stopAnimation:", 1);
      objc_msgSend(v44, "finishAnimationAtPosition:", 2);
      v47 = *(void **)(a1 + 1672);
      *(_QWORD *)(a1 + 1672) = 0;

    }
    objc_msgSend(*(id *)(a1 + 1160), "bounds");
    v49 = (1.0 - v45) * (v48 / 0.15 * 0.15);
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 250.0, 30.0, 0.0, 0.0);
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v50, v49);

    objc_initWeak(&location, (id)a1);
    v52 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke;
    v63[3] = &unk_1E5BB4A40;
    objc_copyWeak(v64, &location);
    objc_msgSend(v51, "addAnimations:", v63);
    *(_QWORD *)&v59 = v52;
    *((_QWORD *)&v59 + 1) = 3221225472;
    *(_QWORD *)&v60 = __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke_2;
    *((_QWORD *)&v60 + 1) = &unk_1E5BB38A0;
    objc_copyWeak((id *)v61, &location);
    objc_msgSend(v51, "addCompletion:", &v59);
    objc_storeStrong((id *)(a1 + 1672), v51);
    v53 = *(void **)(a1 + 1672);
    if (!v53)
    {
      objc_msgSend(*(id *)(a1 + 1680), "updateSelectedCustomInfoViewController");
      v53 = *(void **)(a1 + 1672);
    }
    objc_msgSend(v53, "startAnimation");
    objc_destroyWeak((id *)v61);
    objc_destroyWeak(v64);
    objc_destroyWeak(&location);

  }
  else
  {
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
    if (!*(_QWORD *)(a1 + 1672))
      objc_msgSend(*(id *)(a1 + 1680), "updateSelectedCustomInfoViewController");
    if (!*(_BYTE *)(a1 + 1648))
    {
      v43 = *(void **)(a1 + 1688);
      *(_QWORD *)(a1 + 1688) = 0;

      objc_msgSend((id)objc_opt_class(), "autoHideInterval");
      objc_msgSend((id)a1, "flashControlsWithDuration:");
    }
  }
  v54 = *(void **)(a1 + 1688);
  if (v54)
    v55 = objc_msgSend(v54, "state") == 1;
  else
    v55 = 1;
  objc_msgSend(*(id *)(a1 + 1160), "setIgnoresTouches:", v55);

}

- (void)_setUpTapGestureRecognizerIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (!*(_QWORD *)(a1 + 1696) && *(_BYTE *)(a1 + 1648) && *(_QWORD *)(a1 + 1160))
  {
    objc_msgSend((id)a1, "fullscreenController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    if (v3 != 2)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", a1, sel__contentTabTapGestureRecognizerTriggered_);
      objc_msgSend(v4, "setDelegate:", a1);
      objc_msgSend(v4, "setEnabled:", 1);
      objc_msgSend(v4, "setNumberOfTapsRequired:", 1);
      objc_msgSend(*(id *)(a1 + 1160), "addGestureRecognizer:", v4);
      v5 = *(void **)(a1 + 1696);
      *(_QWORD *)(a1 + 1696) = v4;

    }
  }
}

void __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[211], "transitionContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "animationCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v5);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)v5, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "performCoordinatedAnimations");

    WeakRetained = v5;
  }

}

void __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  id *v11;
  id v12;
  id *v13;
  id v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;
  id *v18;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_20;
  v18 = WeakRetained;
  v4 = WeakRetained[211];
  objc_msgSend(v4, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "direction");
  if (a2)
  {
    if (v7)
    {
      v8 = v18;
      *((_BYTE *)v18 + 1648) = 1;
      v9 = v18[211];
      if (v9)
      {
        objc_msgSend(v9, "state");
        v8 = v18;
      }
      objc_msgSend(v8[145], "setIgnoresTouches:");
      goto LABEL_9;
    }
    v12 = v18[211];
    v18[211] = 0;

    v11 = v18;
    *((_BYTE *)v18 + 1648) = 0;
LABEL_11:
    objc_msgSend(v11[210], "invalidateContentTabsSelection");
    v13 = v18;
    v14 = v18[211];
    if (v14)
    {
      v15 = objc_msgSend(v14, "state");
      v13 = v18;
      v16 = v15 == 1;
    }
    else
    {
      v16 = 1;
    }
    objc_msgSend(v13[145], "setIgnoresTouches:", v16);
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    objc_msgSend(v18, "flashControlsWithDuration:");
    goto LABEL_15;
  }
  if (v7)
  {
    v10 = v18[211];
    v18[211] = 0;

    v11 = v18;
    goto LABEL_11;
  }
LABEL_9:
  objc_msgSend(v4, "setState:", 0);
  objc_msgSend(v4, "setTransitionContext:", 0);
LABEL_15:
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v18);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v18);
  objc_msgSend(v18[145], "setNeedsLayout");
  objc_msgSend(v18[145], "layoutIfNeeded");
  v17 = v18[209];
  v18[209] = 0;

  if (!v18[209])
    objc_msgSend(v18[210], "updateSelectedCustomInfoViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "didFinishAnimations:", a2 == 0);

  WeakRetained = v18;
LABEL_20:

}

- (void)_updateControlsVisibilityStateAnimated:(uint64_t)a1
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  char v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  _BOOL4 v22;
  BOOL v23;
  uint64_t v24;
  int v25;
  char v26;
  char v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  BOOL v36;
  void *v37;
  int v38;
  void *v39;
  AVMobileContentTagView *v40;
  void *v41;
  AVMobileContentTagView *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  AVPlayerViewControllerAnimationCoordinator *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  id v62;
  double v63;
  uint64_t v64;
  AVPlayerViewControllerAnimationCoordinator *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  AVPlayerViewControllerAnimationCoordinator *v69;
  int v70;
  uint64_t v71;
  _BOOL4 v72;
  uint64_t v73;
  void *v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[4];
  AVPlayerViewControllerAnimationCoordinator *v79;
  id v80[3];
  _QWORD v81[4];
  AVPlayerViewControllerAnimationCoordinator *v82;
  id v83[3];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  -[AVMobileChromelessControlsViewController _cancelOutstandVisibilityUpdates](a1);
  *(_BYTE *)(a1 + 1480) = 0;
  v76 = *(void **)(a1 + 1464);
  v77 = *(_QWORD *)(a1 + 1472);
  if (objc_msgSend((id)a1, "visibilityPolicy") != 1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "volumeControlsView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)a1, "excludedControls");
    v6 = objc_msgSend((id)a1, "includedControls");
    v7 = objc_msgSend(v75, "isTracking");
    v8 = -[AVMobileChromelessControlsViewController _isScrubbing]((void *)a1);
    objc_msgSend((id)a1, "fullscreenController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "presentationState");

    v11 = *(unsigned __int8 *)(a1 + 1648);
    objc_msgSend((id)a1, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasLiveStreamingContent"))
      v13 = objc_msgSend(v12, "canSeek");
    else
      v13 = 1;
    v73 = v13;
    v71 = -[AVMobileChromelessControlsViewController _preferredAuxiliaryControlsPlacement]((void *)a1);
    if (v11)
      v14 = objc_msgSend(*(id *)(a1 + 1688), "contentTabsLayout") != 0;
    else
      v14 = 1;
    v15 = v10 != 2;
    if (v10 == 2)
      v16 = 1;
    else
      v16 = v7;
    if ((v16 & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 1344))
        v15 = 1;
      else
        v15 = *(_BYTE *)(a1 + 1648) != 0;
    }
    v72 = v14;
    if (v8 && objc_msgSend(v12, "hasSeekableLiveStreamingContent"))
      v70 = objc_msgSend(v12, "isAtLiveEdge") ^ 1;
    else
      v70 = 0;
    v17 = objc_msgSend((id)a1, "visibilityPolicy");
    if (v17)
    {
      v18 = (void *)v17;
      if (v17 != 2)
      {
        if (v17 == 1)
        {
          v19 = 0;
LABEL_31:
          v21 = 1;
          if ((v15 || v19) && (v5 & 0x200) == 0)
            v21 = objc_msgSend(v12, "hasEnabledAudio") ^ 1;
          if (v19)
          {
            v22 = (v5 & 8) == 0;
            v23 = 1;
          }
          else
          {
            v23 = *(_BYTE *)(a1 + 1648) != 0;
            if ((v5 & 8) != 0)
              v22 = 0;
            else
              v22 = v8;
            if (!*(_BYTE *)(a1 + 1648))
            {
              LODWORD(v24) = 1;
              goto LABEL_41;
            }
          }
          v24 = (v5 >> 5) & 1;
LABEL_41:
          v25 = !v19;
          v26 = (~(_WORD)v5 & 0x1C00) == 0 || !v19;
          if ((v6 & 0x10) == 0)
            v25 = 1;
          if ((v6 & 0x20) == 0)
            v26 = 1;
          v27 = v26 | v8;
          if (v10 == 2)
            v27 = 1;
          if (v11)
            v27 = 1;
          if (v71)
            v28 = 0;
          else
            v28 = v8;
          v29 = !v22;
          v30 = v25 | v28;
          if (v11)
            v30 = 1;
          if ((v6 & 1) == 0)
            v29 = 1;
          if (v11)
            v29 = 1;
          v36 = v29 == 0;
          v31 = v73;
          if (!v36)
            v31 = 0;
          if ((v6 & 2) == 0)
            v21 = 1;
          if (v21 | v8)
            v32 = v31;
          else
            v32 = v31 | 2;
          v33 = v32 | 4;
          if (v8)
            v33 = v31;
          if (v23 && (v6 & 4) != 0)
            v32 = v33;
          if (!v8)
            v31 = v32 | 8;
          if (((v19 && v72) & (v6 >> 3) & 1) != 0)
            v32 = v31;
          if (!v30)
            v32 |= 0x10uLL;
          v34 = v32 | 0x20;
          if ((v27 & 1) != 0)
            v34 = v32;
          if (v10 != 2)
            v32 = v34 | 0x40;
          if ((v6 & 0x40) == 0)
            LODWORD(v24) = 1;
          if (v24 | v8)
            v4 = (void *)v34;
          else
            v4 = (void *)v32;
          v35 = (v11 == 0) << 8;
          if (!v70)
            v35 = 0;
          v3 = ((_DWORD)v4 << 8) & v35 | (unint64_t)(v19 & (v8 ^ 1u));

          goto LABEL_90;
        }
        _AVLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = v18;
          _os_log_error_impl(&dword_1AC4B1000, v20, OS_LOG_TYPE_ERROR, "Error: Unrecognized AVControlsVisibilityPolicy %ld", (uint8_t *)location, 0xCu);
        }

      }
      if (!*(_BYTE *)(a1 + 1505))
      {
        v19 = *(_QWORD *)(a1 + 1512) > 0;
        goto LABEL_31;
      }
    }
    v19 = 1;
    goto LABEL_31;
  }
  v3 = 0;
  v4 = 0;
LABEL_90:
  if (*(_QWORD *)(a1 + 1160))
  {
    v36 = v76 == v4 && ((v3 ^ v77) & 1) == 0;
    if (!v36)
    {
      if ((v3 & 0x100) != 0)
      {
        objc_msgSend((id)a1, "playerController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "hasSeekableLiveStreamingContent");

        objc_msgSend(*(id *)(a1 + 1160), "liveEdgeContentTagView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
          v38 = 0;

        if (v38 == 1)
        {
          v40 = [AVMobileContentTagView alloc];
          +[AVMobileContentTag liveEdgeContentTag](AVMobileContentTag, "liveEdgeContentTag");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[AVMobileContentTagView initWithContentTag:withStyleSheet:](v40, "initWithContentTag:withStyleSheet:", v41, *(_QWORD *)(a1 + 1152));

          -[AVMobileChromelessControlsViewController _timelineSlider](a1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "frameForSliderMark:", *(_QWORD *)(a1 + 1600));
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;

          -[AVMobileContentTagView setFrame:](v42, "setFrame:", -[AVMobileChromelessControlsViewController _frameForLiveEdgeMarkContentTag:](a1, v45, v47, v49, v51));
          objc_msgSend(*(id *)(a1 + 1160), "setLiveEdgeContentTagView:", v42);

        }
      }
      v52 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
      objc_msgSend(*(id *)(a1 + 1160), "timelineView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "delegate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        objc_msgSend((id)a1, "delegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_opt_respondsToSelector();

        if ((v56 & 1) != 0)
        {
          objc_msgSend((id)a1, "delegate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "controlsViewController:willBeginUpdatingVisibleControlsTo:withAnimationCoordinator:", a1, v4, v52);

        }
      }
      if ((v4 != 0) == (objc_msgSend((id)a1, "visibileControls") == 0))
      {
        -[AVMobileChromelessControlsViewController _updateTimeResolver](a1);
        if (v4)
          objc_msgSend(v53, "layoutIfNeeded");
        -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:](a1, 0);
      }
      if (((objc_msgSend((id)a1, "visibileControls") ^ v4) & 2) != 0)
        -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden]((_QWORD *)a1);
      objc_msgSend(*(id *)(a1 + 1160), "setHidden:", 0);

      if (a2)
      {
        v58 = *(void **)(a1 + 1496);
        v59 = 1.0;
        if (v58
          && objc_msgSend(v58, "isRunning")
          && objc_msgSend(*(id *)(a1 + 1496), "isInterruptible"))
        {
          objc_msgSend(*(id *)(a1 + 1496), "fractionComplete");
          v59 = v60;
          objc_msgSend(*(id *)(a1 + 1496), "stopAnimation:", 1);
          objc_msgSend(*(id *)(a1 + 1496), "finishAnimationAtPosition:", 2);
          v61 = *(void **)(a1 + 1496);
          *(_QWORD *)(a1 + 1496) = 0;

        }
        objc_initWeak(location, (id)a1);
        v62 = objc_alloc(MEMORY[0x1E0DC3F38]);
        if (v59 <= 1.0)
          v63 = v59 * 0.15;
        else
          v63 = 0.15;
        v64 = MEMORY[0x1E0C809B0];
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke;
        v81[3] = &unk_1E5BB38C8;
        objc_copyWeak(v83, location);
        v83[1] = v4;
        v83[2] = (id)v3;
        v65 = v52;
        v82 = v65;
        v66 = objc_msgSend(v62, "initWithDuration:curve:animations:", 3, v81, v63);
        v67 = *(void **)(a1 + 1496);
        *(_QWORD *)(a1 + 1496) = v66;

        v68 = *(void **)(a1 + 1496);
        v78[0] = v64;
        v78[1] = 3221225472;
        v78[2] = __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke_2;
        v78[3] = &unk_1E5BB38F0;
        v69 = v65;
        v79 = v69;
        objc_copyWeak(v80, location);
        v80[1] = v4;
        v80[2] = (id)v3;
        objc_msgSend(v68, "addCompletion:", v78);
        *(_BYTE *)(a1 + 1504) = v4 == 0;
        objc_msgSend(*(id *)(a1 + 1496), "startAnimation");
        *(_QWORD *)(a1 + 1464) = v4;
        *(_QWORD *)(a1 + 1472) = v3;
        -[AVMobileChromelessControlsViewController _didBeginUpdatingControlsVisibilityStateFromState:toState:withAnimationCoordinator:]((id *)a1, (char)v76, v77, (uint64_t)v4, v3, v69);
        objc_destroyWeak(v80);

        objc_destroyWeak(v83);
        objc_destroyWeak(location);
      }
      else
      {
        *(_BYTE *)(a1 + 1504) = v4 == 0;
        -[AVMobileChromelessControlsViewController _updateViewVisibilityStatesTo:](a1, (int)v4, v3);
        -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
        -[AVPlayerViewControllerAnimationCoordinator performCoordinatedAnimations](v52, "performCoordinatedAnimations");
        *(_QWORD *)(a1 + 1464) = v4;
        *(_QWORD *)(a1 + 1472) = v3;
        -[AVMobileChromelessControlsViewController _didBeginUpdatingControlsVisibilityStateFromState:toState:withAnimationCoordinator:]((id *)a1, (char)v76, v77, (uint64_t)v4, v3, v52);
        -[AVPlayerViewControllerAnimationCoordinator didFinishAnimations:](v52, "didFinishAnimations:", 1);
        -[AVMobileChromelessControlsViewController _didEndUpdatingControlsVisibilityStateTo:completed:]((id *)a1, (uint64_t)v4, v3, 1);
      }

    }
  }
}

- (void)_cancelOutstandVisibilityUpdates
{
  id v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelPerformSelector:target:argument:", sel__updateControlsVisibilityStateIfNeededAnimated_, a1, 0);

  }
}

uint64_t __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[AVMobileChromelessControlsViewController _updateViewVisibilityStatesTo:]((uint64_t)WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v4 = objc_loadWeakRetained(v2);
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "performCoordinatedAnimations");
}

uint64_t __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BOOL8 v3;
  id *WeakRetained;

  v3 = a2 == 0;
  objc_msgSend(*(id *)(a1 + 32), "didFinishAnimations:", v3);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[AVMobileChromelessControlsViewController _didEndUpdatingControlsVisibilityStateTo:completed:](WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);

  return objc_msgSend(*(id *)(a1 + 32), "didFinishAnimations:", v3);
}

- (void)_didBeginUpdatingControlsVisibilityStateFromState:(uint64_t)a3 toState:(uint64_t)a4 withAnimationCoordinator:(uint64_t)a5
{
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a6;
  objc_msgSend(a1, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "controlsViewController:didBeginUpdatingVisibleControlsTo:withAnimationCoordinator:", a1, a4, v16);

    }
  }
  -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded](a1);
  if ((a2 & 0x10) != 0 && (a4 & 0x10) == 0)
  {
    objc_msgSend(a1[145], "auxiliaryControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interruptActiveInteractions");

  }
  if ((a2 & 4) != 0 && (a4 & 4) == 0)
  {
    objc_msgSend(a1[145], "displayModeControlsView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interruptActiveInteractions");

  }
  if ((a2 & 2) != 0 && (a4 & 2) == 0)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interruptActiveInteractions");

  }
}

- (void)_updateViewVisibilityStatesTo:(__int16)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "auxiliaryControlsView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "contentTabsView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "backgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "displayModeControlsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "liveEdgeContentTagView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "playbackControlsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "timelineView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "titlebarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1160), "volumeControlsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (a3 & 1) == 0;
    if ((a2 & 1) != 0)
      v12 = 1.0;
    else
      v12 = 0.0;
    if ((a2 & 0x40) != 0)
      v13 = 1.0;
    else
      v13 = 0.0;
    v14 = v11 & ((a2 & 2) >> 1);
    v15 = a2 & v11;
    if ((a2 & 2) != 0)
      v16 = 1.0;
    else
      v16 = 0.0;
    if ((a2 & 4) != 0)
      v17 = 1.0;
    else
      v17 = 0.0;
    if ((a2 & 8) != 0)
      v18 = 1.0;
    else
      v18 = 0.0;
    if ((a2 & 0x10) != 0)
      v19 = 1.0;
    else
      v19 = 0.0;
    if ((a2 & 0x20) != 0)
      v20 = 1.0;
    else
      v20 = 0.0;
    if ((a3 & 0x100) != 0)
      v21 = 1.0;
    else
      v21 = 0.0;
    objc_msgSend(v8, "setAlpha:", v12);
    objc_msgSend(v22, "setAlpha:", v13);
    objc_msgSend(v10, "setAlpha:", v16);
    objc_msgSend(v6, "setAlpha:", v17);
    objc_msgSend(v7, "setAlpha:", v18);
    objc_msgSend(v25, "setAlpha:", v19);
    objc_msgSend(v9, "setAlpha:", v20);
    objc_msgSend(v23, "setAlpha:", v21);
    objc_msgSend(v24, "setActive:", a3 & 1);
    objc_msgSend(v8, "setDrawsShadow:", v15);
    objc_msgSend(v10, "setDrawsShadow:", v14);

  }
}

- (id)_didEndUpdatingControlsVisibilityStateTo:(uint64_t)a3 completed:(int)a4
{
  char v4;
  uint64_t v5;

  if (!result || !a4)
    return result;
  v4 = a2;
  v5 = (uint64_t)result;
  if (!a2)
    objc_msgSend(result[145], "setHidden:", 1);
  -[AVMobileChromelessControlsViewController _updateTimeResolver](v5);
  -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden]((_QWORD *)v5);
  result = *(id **)(v5 + 1688);
  if (!result)
  {
    if ((v4 & 0x40) != 0)
      return result;
    return (id *)objc_msgSend(*(id *)(v5 + 1680), "invalidateContentTabsSelection");
  }
  result = (id *)objc_msgSend(result, "state");
  if (result != (id *)2 && (v4 & 0x40) == 0)
    return (id *)objc_msgSend(*(id *)(v5 + 1680), "invalidateContentTabsSelection");
  return result;
}

- (void)_updateTimeResolver
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a1 && *(_QWORD *)(a1 + 1392))
  {
    v2 = *(void **)(a1 + 1160);
    if (v2 && *(_BYTE *)(a1 + 1144) && (objc_msgSend(v2, "isHidden") & 1) == 0)
    {
      -[AVMobileChromelessControlsViewController _timelineSlider](a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayScale");
      v8 = v7;

      objc_msgSend(v5, "bounds");
      v10 = fmax(v8 * v9, 1.0);
      objc_msgSend((id)a1, "playerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "interstitialController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "currentInterstitialTimeRange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v12, "interstitialTimingController");
      else
        objc_msgSend((id)a1, "playerController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 1392), "setResolution:", v10);

    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(*(id *)(a1 + 1392), "playerController");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v14;
    if (v3 != v14)
    {
      objc_msgSend(*(id *)(a1 + 1392), "setPlayerController:", v14);
      -[AVMobileChromelessControlsViewController _updateTimelineValues](a1);
      v4 = v14;
    }

  }
}

- (void)_updateTransportControlsLayoutGuidesConstraintsIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  char v12;
  id v13;
  double v14;
  double v16;
  BOOL v17;
  id v18;
  double v19;
  id v20;
  id v21;
  id v22;
  CGRect v23;

  if (a1)
  {
    v2 = a1[145];
    if (v2)
    {
      if (a1[194] && a1[195] && a1[196])
      {
        objc_msgSend(v2, "auxiliaryControlsView");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[145], "timelineView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[145], "titlebarView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "frame");
        v6 = v5;
        objc_msgSend(v3, "frame");
        v8 = v7;
        objc_msgSend(v22, "frame");
        v10 = v9;
        objc_msgSend(a1[145], "frame");
        Height = CGRectGetHeight(v23);
        v12 = objc_msgSend(v4, "isHidden");
        v13 = 0;
        if (v4 && (v12 & 1) == 0)
        {
          objc_msgSend(v4, "alpha");
          if (v14 != 1.0 || Height <= v6)
          {
            v13 = 0;
          }
          else
          {
            v13 = a1[194];
            Height = v6;
          }
        }
        if ((objc_msgSend(v3, "isHidden") & 1) != 0
          || !v3
          || ((objc_msgSend(v3, "alpha"), v16 == 1.0) ? (v17 = Height <= v8) : (v17 = 1), v17))
        {
          v8 = Height;
        }
        else
        {
          v18 = a1[195];

          v13 = v18;
        }
        if ((objc_msgSend(v22, "isHidden") & 1) == 0)
        {
          if (v22)
          {
            objc_msgSend(v22, "alpha");
            if (v19 == 1.0 && v8 > v10)
            {
              v20 = a1[196];

              v13 = v20;
            }
          }
        }
        if (!v13)
          v13 = a1[197];
        v21 = a1[193];
        if (v21 != v13)
        {
          objc_msgSend(v21, "setActive:", 0);
          objc_storeStrong(a1 + 193, v13);
          objc_msgSend(a1[193], "setActive:", 1);
        }

      }
    }
  }
}

- (BOOL)_isLandscape
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 1160), "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientation");

  return (unint64_t)(v3 - 3) < 2;
}

void __87__AVMobileChromelessControlsViewController__updatePrefersVolumeSliderIncludedAnimated___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _volumeControlsView](WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersVolumeSliderIncluded:", *(unsigned __int8 *)(a1 + 40));

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (id)_volumeControlsView
{
  if (a1)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (double)_frameForLiveEdgeMarkContentTag:(double)a3
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(*(id *)(a1 + 1160), "liveEdgeContentTagView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController _timelineSlider](a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toView:", *(_QWORD *)(a1 + 1160), a2, a3, a4, a5);
  v13 = v12;
  v15 = v14;

  objc_msgSend(v10, "intrinsicContentSize");
  v17 = v16;

  return v13 + v15 * 0.5 - v17 * 0.5;
}

- (void)_decrementUserInteractionCount
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  if (a1)
  {
    v2 = a1[189];
    if (v2 > 0)
      goto LABEL_6;
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Error: calls to decrementUserInteractionCount must be matched with calls to incrementUserInteractionCount", v5, 2u);
    }

    v2 = a1[189];
    if (v2 >= 1)
    {
LABEL_6:
      v4 = v2 - 1;
      a1[189] = v4;
      if (!v4)
      {
        objc_msgSend((id)objc_opt_class(), "autoHideInterval");
        objc_msgSend(a1, "flashControlsWithDuration:");
      }
    }
  }
}

- (void)_incrementUserInteractionCount
{
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1512);
    if (!v2)
    {
      -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
      v2 = *(_QWORD *)(a1 + 1512);
    }
    *(_QWORD *)(a1 + 1512) = v2 + 1;
  }
}

- (id)_auxiliaryControlsView
{
  if (a1)
  {
    objc_msgSend(a1[145], "auxiliaryControlsView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_identifierForMenuElement:(void *)a1
{
  id v1;
  void *v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_updatePlayPauseButtonIcon
{
  void *v2;
  _BOOL4 v3;
  double v4;
  double v5;
  int v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1[145], "playbackControlsView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "timeControlStatus"))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v2, "rate");
      v3 = v4 == 0.0;
    }
    if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
    {
      objc_msgSend(v2, "suspendedRate");
      v6 = objc_msgSend(v2, "isPlaybackSuspended") ^ 1 | (v5 == 0.0);
    }
    else
    {
      v6 = 1;
    }
    objc_msgSend(v7, "setPlayPauseButtonShowsPlayIcon:", v3 & v6);

  }
}

- (id)_auxiliaryControlForIdentifier:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 1584);
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "identifier", (_QWORD)v11);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v3)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_updateRoutePickerControlInclusionState
{
  id *v1;
  uint64_t shouldIncludeRoutePicker;
  int v3;
  void *v4;

  if (result)
  {
    v1 = result;
    shouldIncludeRoutePicker = -[AVMobileChromelessControlsViewController _shouldIncludeRoutePickerButton](result);
    v3 = objc_msgSend(v1[147], "containsObject:", v1[151]);
    objc_msgSend(v1[145], "displayModeControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIncludesRoutePickerControl:", shouldIncludeRoutePicker);

    return (id *)objc_msgSend(v1[151], "setIncluded:", shouldIncludeRoutePicker & v3);
  }
  return result;
}

- (void)_updateControlItemsInclusionState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "controlItems", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          -[AVMobileChromelessControlsViewController _auxiliaryControlForControlItem:]((uint64_t)a1, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "type");
          if ((unint64_t)(v9 - 1) >= 2)
          {
            if (v9)
              v10 = 0;
            else
              v10 = objc_msgSend(a1[147], "containsObject:", v8);
          }
          else
          {
            v10 = 1;
          }
          objc_msgSend(v8, "setIncluded:", v10);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
}

- (id)_auxiliaryControlForControlItem:(uint64_t)a1
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController _auxiliaryControlForIdentifier:](a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handleMuteStateToggle
{
  float v2;
  float v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "volumeController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volume");
  v3 = v2;
  objc_msgSend(a1, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMuted");

  if (v3 != 0.0
    || (objc_msgSend(v8, "beginChangingVolume"),
        LODWORD(v6) = 1036831949,
        objc_msgSend(v8, "setTargetVolume:", v6),
        objc_msgSend(v8, "endChangingVolume"),
        v5))
  {
    objc_msgSend(a1, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toggleMuted:", a1);

    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState]((id *)a1);
  }

}

- (void)_temporarilyShowVolumeSlider
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[AVMobileChromelessControlsViewController _resetVolumeSliderTemporarilyVisibleTimer](a1);
  if (!*(_BYTE *)(a1 + 1344))
  {
    *(_BYTE *)(a1 + 1344) = 1;
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:](a1, 1);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
  }
  objc_initWeak(&location, (id)a1);
  v2 = (void *)MEMORY[0x1E0C99E88];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVMobileChromelessControlsViewController__temporarilyShowVolumeSlider__block_invoke;
  v5[3] = &unk_1E5BB49A8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 2.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 1376);
  *(_QWORD *)(a1 + 1376) = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_resetVolumeSliderTemporarilyVisibleTimer
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 1376);
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = *(void **)(a1 + 1376);
    *(_QWORD *)(a1 + 1376) = 0;

  }
}

void __72__AVMobileChromelessControlsViewController__temporarilyShowVolumeSlider__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1344] = 0;
    v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)WeakRetained, 1);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);
    WeakRetained = v2;
  }

}

- (void)_updateVolumeControlsViewMutedState
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isMuted");

    objc_msgSend(v4, "setMute:", v3);
  }
}

void __80__AVMobileChromelessControlsViewController__volumeControlsViewInteractionDidEnd__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](WeakRetained, 0);

  v3 = objc_loadWeakRetained(v1);
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)v3);

}

- (void)_animateVolumeEmphasisTo:(id *)a1
{
  void *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;

  if (a1)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEmphasized") != a2)
    {
      v5 = 0.0;
      if (objc_msgSend(a1[169], "isRunning"))
      {
        if (objc_msgSend(a1[169], "isInterruptible"))
        {
          objc_msgSend(a1[169], "fractionComplete");
          v5 = v6;
          objc_msgSend(a1[169], "stopAnimation:", 1);
          objc_msgSend(a1[169], "finishAnimationAtPosition:", 2);
          v7 = a1[169];
          a1[169] = 0;

        }
      }
      objc_initWeak(&location, a1);
      v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __69__AVMobileChromelessControlsViewController__animateVolumeEmphasisTo___block_invoke;
      v11[3] = &unk_1E5BB4CC8;
      objc_copyWeak(&v12, &location);
      v13 = a2;
      v9 = objc_msgSend(v8, "initWithDuration:curve:animations:", 3, v11, (1.0 - v5) * 0.2);
      v10 = a1[169];
      a1[169] = (id)v9;

      objc_msgSend(a1[169], "startAnimation");
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_resetVolumeControlsEmphasisDelayTimer
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1368), "invalidate");
    v2 = *(void **)(a1 + 1368);
    *(_QWORD *)(a1 + 1368) = 0;

  }
}

void __69__AVMobileChromelessControlsViewController__animateVolumeEmphasisTo___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _volumeControlsView](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEmphasized:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_updateAudibleMediaSelectionMenu
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioMediaSelectionOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentAudioMediaSelectionOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "indexOfObject:", v3);

    -[AVMobileChromelessControlsViewController _setUpMediaSelectionMenuControllerIfNeeded]((uint64_t)a1);
    objc_msgSend(a1[180], "setAudibleOptions:", v2);
    objc_msgSend(a1[180], "setCurrentAudibleOptionIndex:", v4);
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v5, "enhanceDialogueEnabled");

    if ((_DWORD)v4)
    {
      objc_msgSend(a1, "enhanceDialogueController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "currentLevel");

      objc_msgSend(a1, "enhanceDialogueController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "availableLevels");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "enhanceDialogueController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "currentContentSupported");

      objc_msgSend(a1[180], "setCurrentEnhanceDialogueOption:", v7);
      objc_msgSend(a1[180], "setEnhanceDialogueOptions:", v9);
      objc_msgSend(a1[180], "setShouldEnableEnhanceDialogueOptions:", v11);

    }
  }
}

- (void)_updateLegibleMediaSelectionMenu
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "legibleMediaSelectionOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLegibleMediaSelectionOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "indexOfObject:", v3);

    -[AVMobileChromelessControlsViewController _setUpMediaSelectionMenuControllerIfNeeded]((uint64_t)a1);
    objc_msgSend(a1[180], "setLegibleOptions:", v2);
    objc_msgSend(a1[180], "setCurrentLegibleOptionIndex:", v4);

  }
}

void __70__AVMobileChromelessControlsViewController__menuElementForRoutePicker__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[145], "displayModeControlsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "routePickerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "presentRoutePicker:", v4);
    WeakRetained = v4;
  }

}

- (uint64_t)_setUpMediaSelectionMenuControllerIfNeeded
{
  uint64_t v1;
  AVMediaSelectionMenuController *v2;
  void *v3;

  if (!*(_QWORD *)(result + 1440))
  {
    v1 = result;
    v2 = -[AVMediaSelectionMenuController initWithAudibleOptions:legibleOptions:enhanceDialogueOptions:]([AVMediaSelectionMenuController alloc], "initWithAudibleOptions:legibleOptions:enhanceDialogueOptions:", 0, 0, 0);
    v3 = *(void **)(v1 + 1440);
    *(_QWORD *)(v1 + 1440) = v2;

    return objc_msgSend(*(id *)(v1 + 1440), "setDelegate:", v1);
  }
  return result;
}

void __71__AVMobileChromelessControlsViewController__menuElementForControlItem___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "action");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

void __95__AVMobileChromelessControlsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissCustomInfoViewControllerAnimated:", 1);
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing](WeakRetained);
    -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)WeakRetained);
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)WeakRetained, 1);
    objc_msgSend(WeakRetained[214], "setEnabled:", 1);
  }

}

void __71__AVMobileChromelessControlsViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  id *v1;
  unsigned __int8 *WeakRetained;
  int v3;
  _QWORD *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[1144];

    if (v3)
    {
      v4 = objc_loadWeakRetained(v1);
      -[AVMobileChromelessControlsViewController _updateLayoutMargins](v4);

    }
  }
}

- (void)_attemptSetupIfNeeded
{
  _QWORD v2[4];
  id v3;
  id location;

  if (a1)
  {
    if (-[AVMobileChromelessControlsViewController _canPerformSetup]((uint64_t)a1))
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __65__AVMobileChromelessControlsViewController__attemptSetupIfNeeded__block_invoke;
      v2[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_canPerformSetup
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend((id)a1, "optimizeForPerformance") & 1) != 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 1160), "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v2 = *(_BYTE *)(a1 + 1144) == 0;
  else
    v2 = 0;

  return v2;
}

void __65__AVMobileChromelessControlsViewController__attemptSetupIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  _BOOL4 canPerform;
  void *v4;
  id v5;
  void *v6;
  AVMobileChromelessBackgroundGradientView *v7;
  id v8;
  void *v9;
  AVMobileChromelessDisplayModeControlsView *v10;
  void *v11;
  id v12;
  void *v13;
  AVMobileChromelessPlaybackControlsView *v14;
  int v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  AVMobileChromelessTimelineView *v20;
  id v21;
  void *v22;
  AVMobileTitlebarView *v23;
  id *v24;
  uint64_t v25;
  id v26;
  id *v27;
  AVMobilePlaybackRateMenuController *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  AVMobileChromelessVolumeControlsView *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  AVPlayerControllerTimeResolver *v59;
  id v60;
  id v61;
  void *v62;
  AVObservationController *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  id *val;
  id *vala;
  id location;
  const __CFString *block;
  uint64_t v106;
  void (*v107)(uint64_t);
  void *v108;
  id v109[2];

  v109[1] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    val = WeakRetained;
    canPerform = -[AVMobileChromelessControlsViewController _canPerformSetup]((uint64_t)WeakRetained);
    v2 = val;
    if (canPerform)
    {
      *((_BYTE *)val + 1144) = 1;
      if (!val[144])
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObserver:selector:name:object:", val, sel__updateStyleSheet, *MEMORY[0x1E0DC48E8], 0);

        objc_msgSend(val, "_updateStyleSheet");
        v2 = val;
      }
      v5 = v2[145];
      if (v5)
      {
        objc_msgSend(v5, "backgroundView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = val;
        if (!v6)
        {
          v7 = objc_alloc_init(AVMobileChromelessBackgroundGradientView);
          -[AVMobileChromelessBackgroundGradientView setAutoresizingMask:](v7, "setAutoresizingMask:", 0);
          objc_msgSend(val[145], "setBackgroundView:", v7);

          v2 = val;
        }
      }
      v8 = v2[145];
      if (v8)
      {
        if (v2[144])
        {
          objc_msgSend(v8, "displayModeControlsView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v2 = val;
          if (!v9)
          {
            v10 = -[AVMobileChromelessDisplayModeControlsView initWithStyleSheet:]([AVMobileChromelessDisplayModeControlsView alloc], "initWithStyleSheet:", val[144]);
            -[AVMobileChromelessDisplayModeControlsView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
            -[AVMobileChromelessDisplayModeControlsView setDelegate:](v10, "setDelegate:", val);
            -[AVMobileChromelessDisplayModeControlsView setFullscreenIcon:](v10, "setFullscreenIcon:", 0);
            objc_msgSend(val, "routingConfiguration");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVMobileChromelessDisplayModeControlsView setRoutingConfiguration:](v10, "setRoutingConfiguration:", v11);

            objc_msgSend(val[145], "setDisplayModeControlsView:", v10);
            v2 = val;
          }
        }
      }
      v12 = v2[145];
      if (v12)
      {
        if (v2[144])
        {
          objc_msgSend(v12, "playbackControlsView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v2 = val;
          if (!v13)
          {
            v14 = -[AVMobileChromelessPlaybackControlsView initWithStyleSheet:]([AVMobileChromelessPlaybackControlsView alloc], "initWithStyleSheet:", val[144]);
            -[AVMobileChromelessPlaybackControlsView setAutoresizingMask:](v14, "setAutoresizingMask:", 0);
            -[AVMobileChromelessPlaybackControlsView setDelegate:](v14, "setDelegate:", val);
            v15 = objc_msgSend(val, "prefersFullScreenStyleForEmbeddedMode");
            v16 = 0.0;
            if (v15)
              v16 = *((double *)val + 216);
            -[AVMobileChromelessPlaybackControlsView setAvkit_extendedDynamicRangeGain:](v14, "setAvkit_extendedDynamicRangeGain:", v16, val);
            objc_msgSend(val[145], "setPlaybackControlsView:", v14);

            v2 = val;
          }
        }
      }
      v17 = v2[145];
      if (v17)
      {
        if (v2[144])
        {
          objc_msgSend(v17, "timelineView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v2 = val;
          if (!v18)
          {
            v19 = 0.0;
            if (objc_msgSend(val, "prefersFullScreenStyleForEmbeddedMode"))
              v19 = *((double *)val + 216);
            v20 = -[AVMobileChromelessTimelineView initWithStyleSheet:]([AVMobileChromelessTimelineView alloc], "initWithStyleSheet:", val[144]);
            -[AVMobileChromelessTimelineView setAutoresizingMask:](v20, "setAutoresizingMask:", 0);
            -[AVMobileChromelessTimelineView setLabelsExtendedDynamicRangeGain:](v20, "setLabelsExtendedDynamicRangeGain:", v19);
            -[AVMobileChromelessTimelineView setSliderExtendedDynamicRangeGain:](v20, "setSliderExtendedDynamicRangeGain:", v19);
            -[AVView setAutomaticallyUpdatesSubviewContentIntersections:](v20, "setAutomaticallyUpdatesSubviewContentIntersections:", 1);
            objc_msgSend(val[145], "setTimelineView:", v20);

            v2 = val;
          }
        }
      }
      v21 = v2[145];
      if (v21)
      {
        if (v2[144])
        {
          objc_msgSend(v21, "titlebarView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v2 = val;
          if (!v22)
          {
            v23 = -[AVMobileTitlebarView initWithStyleSheet:]([AVMobileTitlebarView alloc], "initWithStyleSheet:", val[144]);
            -[AVMobileTitlebarView setAutoresizingMask:](v23, "setAutoresizingMask:", 0);
            objc_msgSend(val[145], "setTitlebarView:", v23);
            -[AVMobileChromelessControlsViewController _updateTitleAndDescriptionInfo](val);
            -[AVMobileChromelessControlsViewController _updateContentTag](val);

            v2 = val;
          }
        }
      }
      -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded]((uint64_t)v2);
      v24 = val;
      if (val[145] && !val[151])
      {
        +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, CFSTR("AVRoutePickerControl"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = val[151];
        val[151] = (id)v25;

        v24 = val;
      }
      -[AVMobileChromelessControlsViewController _setUpAnalysisControlIfNeeded](v24);
      v27 = val;
      if (!val[150] && val[145])
      {
        -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded]((uint64_t)val);
        v28 = objc_alloc_init(AVMobilePlaybackRateMenuController);
        v29 = val[179];
        val[179] = v28;

        v30 = val[179];
        objc_msgSend(val, "playbackSpeedCollection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setPlaybackSpeedCollection:", v31);

        +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVMenuButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("AVPlaybackSpeedControl"), 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = val[161];
        val[161] = (id)v32;

        v34 = val[161];
        AVLocalizedString(CFSTR("Playback Speed"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAccessibilityLabel:", v35);

        objc_msgSend(val[161], "setImageName:", CFSTR("speedometer"));
        objc_msgSend(val[161], "setDelegate:", val);
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:]((uint64_t)val, val[161]);
        +[AVMobileAuxiliaryControl controlWithView:displayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithView:displayPriority:identifier:", val[161], 0, CFSTR("AVPlaybackSpeedControl"));
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = val[150];
        val[150] = (id)v36;

        -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](val);
        v27 = val;
      }
      if (!v27[148] && v27[145])
      {
        -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded]((uint64_t)v27);
        +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVMenuButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Audible Options"), 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = val[159];
        val[159] = (id)v38;

        v40 = val[159];
        AVLocalizedString(CFSTR("Audio Track"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setAccessibilityLabel:", v41);

        objc_msgSend(val[159], "setImageName:", CFSTR("waveform.circle"));
        objc_msgSend(val[159], "setDelegate:", val);
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:]((uint64_t)val, val[159]);
        +[AVMobileAuxiliaryControl controlWithView:displayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithView:displayPriority:identifier:", val[159], 0, CFSTR("AVAudibleMediaSelectionControl"));
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = val[148];
        val[148] = (id)v42;

        +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVMenuButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Legible Options"), 1);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = val[160];
        val[160] = (id)v44;

        v46 = val[160];
        AVLocalizedString(CFSTR("Legible Options"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setAccessibilityLabel:", v47);

        objc_msgSend(val[160], "setImageName:", CFSTR("captions.bubble"));
        objc_msgSend(val[160], "setDelegate:", val);
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:]((uint64_t)val, val[160]);
        +[AVMobileAuxiliaryControl controlWithView:displayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithView:displayPriority:identifier:", val[160], 0, CFSTR("AVLegibleMediaSelectionControl"));
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = val[149];
        val[149] = (id)v48;

        -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)val);
        -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionControlInclusionState](val);
        v27 = val;
      }
      v50 = v27[145];
      if (v50)
      {
        if (v27[144])
        {
          objc_msgSend(v50, "volumeControlsView");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = val;
          if (!v51)
          {
            v52 = objc_alloc_init(AVMobileChromelessVolumeControlsView);
            -[AVMobileChromelessVolumeControlsView setDelegate:](v52, "setDelegate:", val);
            -[AVMobileChromelessVolumeControlsView setPrefersVolumeSliderIncluded:](v52, "setPrefersVolumeSliderIncluded:", 1);
            -[AVMobileChromelessVolumeControlsView setAutoresizingMask:](v52, "setAutoresizingMask:", 0);
            objc_msgSend(val[145], "setVolumeControlsView:", v52);
            -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)val);

            v27 = val;
          }
        }
      }
      -[AVMobileChromelessControlsViewController _setUpCopySubjectControlIfNeeded](v27);
      -[AVMobileChromelessControlsViewController _setUpVisualLookupControlIfNeeded](val);
      -[AVMobileChromelessControlsViewController _updateViewVisibilityStatesTo:]((uint64_t)val, 0, 0);
      objc_initWeak(&location, val);
      block = (const __CFString *)MEMORY[0x1E0C809B0];
      v106 = 3221225472;
      v107 = __62__AVMobileChromelessControlsViewController__loadControlsViews__block_invoke;
      v108 = &unk_1E5BB4A40;
      objc_copyWeak(v109, &location);
      dispatch_async(MEMORY[0x1E0C80D38], &block);
      objc_destroyWeak(v109);
      objc_destroyWeak(&location);
      -[AVMobileChromelessControlsViewController _updateContentTabViewControllers]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded](val);
      -[AVMobileChromelessControlsViewController _setUpTapGestureRecognizerIfNeeded]((uint64_t)val);
      v53 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
      v54 = val[175];
      val[175] = v53;

      objc_msgSend(val[175], "setStyle:", 1);
      v55 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
      v56 = val[176];
      val[176] = v55;

      objc_msgSend(val[176], "setStyle:", 2);
      v57 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v58 = val[177];
      val[177] = v57;

      objc_msgSend(val[177], "setDateFormat:", CFSTR("h:mm a"));
      if (!val[174] && val[145])
      {
        v59 = objc_alloc_init(AVPlayerControllerTimeResolver);
        v60 = val[174];
        val[174] = v59;

        v61 = val[174];
        objc_msgSend(val, "playerController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setPlayerController:", v62);

        objc_msgSend(val[174], "setInterval:", 1.0);
      }
      v63 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", val);
      v64 = val[141];
      val[141] = v63;

      objc_msgSend(val[141], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC4FA8], 0, 0, &__block_literal_global_16981);
      objc_msgSend(val[141], "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification"), 0, 0, &__block_literal_global_99);
      v65 = (id)objc_msgSend(val[141], "startObserving:keyPath:includeInitialValue:observationHandler:", val, CFSTR("pipController.pictureInPicturePossible"), 1, &__block_literal_global_104_16984);
      v66 = (id)objc_msgSend(val[141], "startObserving:keyPath:includeInitialValue:observationHandler:", val, CFSTR("pipController.pictureInPictureActive"), 1, &__block_literal_global_107_16986);
      objc_msgSend(val[141], "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVVolumeControllerVolumeChangedNotification"), 0, 0, &__block_literal_global_108);
      v67 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.muted"), &__block_literal_global_112);
      v68 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.allowsExternalPlayback"), &__block_literal_global_115);
      v69 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.canSeek"), &__block_literal_global_118);
      v70 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.hasLiveStreamingContent"), &__block_literal_global_121_16991);
      v71 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.hasSeekableLiveStreamingContent"), &__block_literal_global_124);
      v72 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.status"), &__block_literal_global_127);
      v73 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.timeControlStatus"), &__block_literal_global_130);
      v74 = (id)objc_msgSend(val[141], "startObserving:keyPath:includeInitialValue:observationHandler:", val, CFSTR("playerController.playing"), 0, &__block_literal_global_133);
      v75 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.rate"), &__block_literal_global_136);
      v76 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.timeControlStatus"), &__block_literal_global_137);
      v77 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val[179], CFSTR("menu"), &__block_literal_global_140);
      v78 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.playingOnMatchPointDevice"), &__block_literal_global_143);
      v79 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.hasEnabledAudio"), &__block_literal_global_146);
      v80 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.hasAudioMediaSelectionOptions"), &__block_literal_global_149);
      v81 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.hasLegibleMediaSelectionOptions"), &__block_literal_global_152);
      v82 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.currentAssetIfReady"), &__block_literal_global_155);
      v83 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.scrubbing"), &__block_literal_global_158);
      v84 = val[141];
      v85 = (uint64_t)val[174];
      block = CFSTR("targetTime");
      v106 = (uint64_t)CFSTR("minTime");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &block, 2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = (id)objc_msgSend(v84, "startObserving:keyPaths:observationHandler:", v85, v86, &__block_literal_global_164);

      v88 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val[174], CFSTR("maxTime"), &__block_literal_global_167);
      v89 = (id)objc_msgSend(val[141], "startObserving:keyPath:observationHandler:", val, CFSTR("playerController.externalPlaybackActive"), &__block_literal_global_170);
      -[AVMobileChromelessControlsViewController _updateAnalysisControlInclusionIfNeeded]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlsForControlItems](val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing](val);
      -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState](val);
      -[AVMobileChromelessControlsViewController _updateContentTag](val);
      -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)val, 0);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion](val);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsForControlItems](val);
      -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon](val);
      objc_msgSend(val[145], "setLayoutAllowed:", *((unsigned __int8 *)val + 1144));
      -[AVMobileChromelessControlsViewController _updateLayoutMargins](val);
      -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionControlInclusionState](val);
      -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState](val);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](val);
      -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon](val);
      -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState](val);
      -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)val, 0);
      -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState](val);
      -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes](val);
      -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions](val);
      -[AVMobileChromelessControlsViewController _updateTimelineSliderEnablementState](val);
      -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateTitleAndDescriptionInfo](val);
      -[AVMobileChromelessControlsViewController _updateTitleBarViewInclusionState](val);
      -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState](val);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewUserInteractionEnablementState](val);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](val, 0);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewAllowsVolumeAdjustmentState](val);
      -[AVMobileChromelessControlsViewController _updateWebKitExcludedObservationState]((uint64_t)val);
      v90 = val;
      v91 = val[145];
      if (v91 && val[144])
      {
        objc_msgSend(v91, "timelineView");
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        if (v92)
        {
          objc_msgSend(val[145], "timelineView");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "slider");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setAccessibilityIdentifier:", CFSTR("Current position"));
          AVLocalizedString(CFSTR("Current position"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setAccessibilityLabel:", v95);

          objc_msgSend(v94, "setIsAccessibilityElement:", 1);
          objc_msgSend(v94, "setDelegate:", val);
          objc_msgSend(v94, "addTarget:action:forControlEvents:", val, sel__timelineSliderDidChangeValue_, 4096);
          +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "fluidSliderEnabled");

          if ((v97 & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v94, "setFineScrubbingStyle:", 1);
          }
          else
          {
            objc_msgSend(v94, "addTarget:action:forControlEvents:", val, sel__timelineSliderTrackingStateDidChange, 449);
          }
          LODWORD(v98) = 0;
          objc_msgSend(v94, "setMinimumValue:", v98, val);
          LODWORD(v99) = 1.0;
          objc_msgSend(v94, "setMaximumValue:", v99);
          LODWORD(v100) = 1.0;
          objc_msgSend(v94, "setTotalValue:", v100);

        }
        v90 = val;
      }
      objc_msgSend(v90[145], "avkit_makeSubtreeDisallowGroupBlending", val);
      objc_msgSend(vala[145], "window");
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = vala;
      if (v101)
      {
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)vala);
        v2 = vala;
      }
    }
  }

}

- (void)_updateContentTabViewControllers
{
  void *v2;
  int v3;
  AVMobileChromelessContentTabsViewController *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isTVApp");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 1680), "invalidateContentTabsSelection");
      if (*(_QWORD *)(a1 + 1160))
      {
        if (!*(_QWORD *)(a1 + 1680))
        {
          v4 = objc_alloc_init(AVMobileChromelessContentTabsViewController);
          v5 = *(void **)(a1 + 1680);
          *(_QWORD *)(a1 + 1680) = v4;

          objc_msgSend(*(id *)(a1 + 1680), "setCustomInfoViewControllers:", *(_QWORD *)(a1 + 1640));
          objc_msgSend(*(id *)(a1 + 1680), "setDelegate:", a1);
          objc_msgSend(*(id *)(a1 + 1680), "willMoveToParentViewController:", a1);
          objc_msgSend((id)a1, "addChildViewController:", *(_QWORD *)(a1 + 1680));
          objc_msgSend(*(id *)(a1 + 1680), "view");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 1160), "setContentTabsView:", v6);
          objc_msgSend(*(id *)(a1 + 1680), "didMoveToParentViewController:", a1);

        }
      }
      objc_msgSend(*(id *)(a1 + 1680), "setCustomInfoViewControllers:", *(_QWORD *)(a1 + 1640));
    }
  }
}

- (void)_updateAnalysisControlInclusionIfNeeded
{
  id v2;
  int v3;
  BOOL v4;
  id v5;

  if (a1)
  {
    v2 = *(id *)(a1 + 1224);
    if (v2)
    {
      v3 = *(unsigned __int8 *)(a1 + 1705);
      v5 = v2;
      v4 = v3 == objc_msgSend(v2, "isIncluded");
      v2 = v5;
      if (!v4)
      {
        objc_msgSend(v5, "setIncluded:", *(unsigned __int8 *)(a1 + 1705));
        objc_msgSend(*(id *)(a1 + 1160), "setNeedsLayout");
        v2 = v5;
      }
    }

  }
}

- (uint64_t)_updateAudibleMediaSelectionControlInclusionState
{
  id *v1;
  void *v2;
  int v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v1 = (id *)result;
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "enhanceDialogueEnabled");

    objc_msgSend(v1, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasAudioMediaSelectionOptions");
    v6 = v3 | v5;
    if (v3)
    {
      if ((v5 & 1) == 0)
      {
        objc_msgSend(v1, "enhanceDialogueController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "availableLevels");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "count") != 0;

      }
    }

    return objc_msgSend(v1[148], "setIncluded:", v6);
  }
  return result;
}

- (void)_updateAuxiliaryControlsForControlItems
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[AVMobileChromelessControlsViewController _auxiliaryControlForControlItem:]((uint64_t)a1, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v10 = objc_msgSend(v8, "type");
          if ((unint64_t)(v10 - 1) < 2)
          {
            objc_msgSend(v8, "view");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[AVMobileAuxiliaryControl controlWithView:displayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithView:displayPriority:identifier:", v11, 0, v12);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
          if (v10)
          {
            v9 = 0;
          }
          else
          {
            objc_msgSend(v8, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, v11);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

          }
          objc_msgSend(v8, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v8, "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setTintColor:", v16);

            objc_msgSend(v15, "setAutoresizingMask:", 0);
          }
        }
        objc_msgSend(v8, "setDelegate:", a1);
        objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  v17 = (void *)a1[198];
  a1[198] = v2;

  -[AVMobileChromelessControlsViewController _updateControlItemsInclusionState]((id *)a1);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)a1);
  -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)a1);

}

- (void)_updateContentTabsInteractionEnablementState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v7;
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v13, "status");
    objc_msgSend(v13, "contentDimensions");
    v7 = ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v4 >= 0
      || (unint64_t)(v4 - 1) < 0xFFFFFFFFFFFFFLL;
    v9 = (v3 < 0 || ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
      && (unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFELL;
    if (v9 || !v7)
      v10 = objc_msgSend(v13, "isExternalPlaybackActive");
    else
      v10 = 1;
    if (v2 == 2)
      v11 = v10;
    else
      v11 = 0;
    objc_msgSend(a1[210], "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", v11);

  }
}

- (void)_updateContentTag
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[145], "titlebarView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasLiveStreamingContent"))
    {
      if ((objc_msgSend(v2, "isAtLiveEdge") & 1) != 0)
        +[AVMobileContentTag liveEdgeContentTag](AVMobileContentTag, "liveEdgeContentTag");
      else
        +[AVMobileContentTag liveContentTag](AVMobileContentTag, "liveContentTag");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(v4, "setContentTag:", v3);
    objc_msgSend(a1[145], "setNeedsLayout");

  }
}

- (void)_updateDisplayModeControlsForControlItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  id v12;
  _QWORD v13[4];
  id v14;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fullscreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationState");

  if ((objc_msgSend(v2, "isTVApp") & 1) != 0)
  {

    if (v4 == 2)
      return;
    goto LABEL_3;
  }
  v10 = objc_msgSend(v2, "isAVKitTester");

  if (v10)
    v11 = v4 == 2;
  else
    v11 = 1;
  if (!v11)
  {
LABEL_3:
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke;
    v13[3] = &unk_1E5BB39E0;
    v14 = v5;
    v12 = v5;
    objc_msgSend(a1, "_enumerateControlItemsOfTypes:usingBlock:", &unk_1E5BF4038, v13);
    v6 = objc_msgSend(v12, "count");
    if (v6 >= 2)
      v7 = 2;
    else
      v7 = v6;
    objc_msgSend(v12, "subarrayWithRange:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[145], "displayModeControlsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCustomActions:", v8);

  }
}

- (void)_updateLegibleMediaSelectionControlInclusionState
{
  void *v1;
  id v2;

  if (a1)
  {
    v1 = (void *)a1[149];
    objc_msgSend(a1, "playerController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setIncluded:", objc_msgSend(v2, "hasLegibleMediaSelectionOptions"));

  }
}

- (void)_updateLoadingAnimatorState
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(a1, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 1)
  {

    v3 = a1 + 181;
LABEL_5:
    *v3 = 1;
    v5 = (void *)a1[182];
    if (!v5 || (objc_msgSend(v5, "isRunning") & 1) == 0)
    {
      -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "tintState");

      if (v7 >= 3)
      {
        _AVLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = (id)v7;
          _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: unknown slider tint state %ld", (uint8_t *)location, 0xCu);
        }

        v8 = 2;
      }
      else
      {
        v8 = qword_1AC5F8110[v7];
      }
      objc_initWeak(location, a1);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __71__AVMobileChromelessControlsViewController__updateLoadingAnimatorState__block_invoke;
      v10[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v11, location);
      -[AVMobileChromelessControlsViewController _animateSliderToTintState:duration:completionHandler:]((uint64_t)a1, (void *)v8, v10, 1.0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(location);
    }
    return;
  }
  v4 = objc_msgSend(v2, "timeControlStatus");

  v3 = a1 + 181;
  if (v4 == 1)
    goto LABEL_5;
  if (*v3)
  {
    *v3 = 0;
    -[AVMobileChromelessControlsViewController _animateSliderToTintState:duration:completionHandler:]((uint64_t)a1, (void *)1, 0, 0.25);
  }
}

- (void)_updatePlaybackSpeedControlInclusion
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasLiveStreamingContent"))
      v2 = objc_msgSend(v6, "hasSeekableLiveStreamingContent");
    else
      v2 = 1;
    objc_msgSend(a1, "playbackSpeedCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "playbackSpeedControlEnabled"))
        v5 = v2 & ~objc_msgSend(v6, "isPlayingOnMatchPointDevice");
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(a1[150], "setIncluded:", v5);
  }
}

- (void)_updatePlaybackControlsViewInclusionState
{
  char v2;
  void *v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a1)
  {
    v2 = objc_msgSend(a1, "excludedControls");
    objc_msgSend(a1[145], "playbackControlsView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasLiveStreamingContent");
    v5 = objc_msgSend(v3, "hasSeekableLiveStreamingContent");
    if (!v4 || v5)
      v6 = objc_msgSend(a1, "requiresLinearPlayback") ^ 1;
    else
      v6 = 0;
    if ((v2 & 4) != 0)
      v7 = 0;
    else
      v7 = v6;
    objc_msgSend(v9, "setShowsPlayPauseButton:", (v2 & 1) == 0);
    if ((v2 & 2) != 0)
      v8 = 0;
    else
      v8 = v6;
    objc_msgSend(v9, "setShowsBackwardSecondaryPlaybackButton:", v8);
    objc_msgSend(v9, "setShowsForwardSecondaryPlaybackButton:", v7);

  }
}

- (void)_updateTimelineSliderEnablementState
{
  id v2;

  -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "requiresLinearPlayback") ^ 1);

}

- (void)_updateTitleAndDescriptionInfo
{
  id *v1;
  void *v2;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v1 = a1;
  objc_msgSend(a1[145], "titlebarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
  {
    v15 = 0;
    goto LABEL_29;
  }
  v37 = v1;
  v38 = v2;
  objc_msgSend(v3, "metadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  objc_msgSend(v3, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "externalMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_24;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v43;
  v39 = *MEMORY[0x1E0C8A9A0];
  v40 = *MEMORY[0x1E0C8A870];
  v17 = *MEMORY[0x1E0C8A848];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v6
        && objc_msgSend(v20, "isEqualToString:", v40)
        && (objc_msgSend(v19, "stringValue"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, v22))
      {
        v23 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v19, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v23, "initWithString:", v24);
      }
      else if (!v9
             && objc_msgSend(v21, "isEqualToString:", v39)
             && (objc_msgSend(v19, "stringValue"),
                 v25 = (void *)objc_claimAutoreleasedReturnValue(),
                 v25,
                 v25))
      {
        v26 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v19, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v26, "initWithString:", v24);
      }
      else
      {
        if (!objc_msgSend(v21, "isEqualToString:", v17))
          goto LABEL_19;
        objc_msgSend(v19, "stringValue");
        v24 = v15;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

LABEL_19:
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v14);
LABEL_24:

  v1 = v37;
  v2 = v38;
  v3 = v36;
  if (!v6)
  {
    v27 = *MEMORY[0x1E0C8A8C0];
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8C0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v35, "objectForKeyedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v29, "initWithString:", v30);

      if (!v9)
        goto LABEL_35;
    }
    else
    {
      v6 = 0;
      if (!v9)
        goto LABEL_35;
    }
LABEL_26:
    if (v15)
      goto LABEL_28;
LABEL_27:
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A898]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (v9)
    goto LABEL_26;
LABEL_35:
  v31 = *MEMORY[0x1E0C8AB20];
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AB20]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v9 = 0;
    if (v15)
      goto LABEL_28;
    goto LABEL_27;
  }
  v33 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v35, "objectForKeyedSubscript:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v33, "initWithString:", v34);

  if (!v15)
    goto LABEL_27;
LABEL_28:

LABEL_29:
  objc_msgSend(v2, "setTitle:", v6);
  objc_msgSend(v2, "setSubtitle:", v9);
  objc_msgSend(v1[145], "setNeedsLayout");

}

- (void)_updateTitleBarViewInclusionState
{
  __int16 v2;
  id v3;

  v2 = objc_msgSend(a1, "excludedControls");
  objc_msgSend(a1[145], "titlebarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsTitle:", (v2 & 0x400) == 0);
  objc_msgSend(v3, "setShowsSubtitle:", (v2 & 0x800) == 0);
  objc_msgSend(v3, "setShowsContentTag:", (v2 & 0x1000) == 0);
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_updateVolumeControlsViewUserInteractionEnablementState
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "volumeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "currentRouteHasVolumeControl");

    objc_msgSend(a1[145], "volumeControlsView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", v3);

  }
}

- (void)_updateVolumeControlsViewVolumeWithMuteStateUpdate:(id *)a1
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  id v12;

  if (a1)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isTracking") & 1) == 0)
    {
      objc_msgSend(a1, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isMuted");

      objc_msgSend(a1, "playerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isExternalPlaybackActive");

      objc_msgSend(a1, "volumeController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "volume");
      v10 = v9;

      v11 = v10;
      if (v7)
        v11 = 1.0;
      if (v5)
        v11 = 0.0;
      objc_msgSend(v12, "setVolume:forUpdateReason:", a2, v11);
    }

  }
}

- (void)_updateVolumeControlsViewAllowsVolumeAdjustmentState
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[145], "volumeControlsView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isExternalPlaybackActive") ^ 1;

    objc_msgSend(v4, "setAllowsVolumeAdjustment:", v3);
  }
}

- (void)_updateWebKitExcludedObservationState
{
  void *v2;
  AVObservationController *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)a1, "playerController");
  v22 = objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 1136);
  if (!v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", a1);
    v4 = *(void **)(a1 + 1136);
    *(_QWORD *)(a1 + 1136) = v3;

    v2 = *(void **)(a1 + 1136);
  }
  objc_msgSend(v2, "stopAllObservation", v22);
  v5 = v23;
  if (v23)
  {
    v6 = objc_msgSend(v23, "avkit_isAVPlayerControllerOrSubclass");
    v5 = v23;
    if (v6)
    {
      objc_msgSend((id)a1, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 1128);
      v25[0] = CFSTR("playbackSuspended");
      v25[1] = CFSTR("suspendedRate");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "startObserving:keyPaths:observationHandler:", v7, v9, &__block_literal_global_177);

      v11 = (id)objc_msgSend(*(id *)(a1 + 1128), "startObserving:keyPath:includeInitialValue:observationHandler:", v7, CFSTR("photosensitivityRegions"), 1, &__block_literal_global_180);
      v12 = *(void **)(a1 + 1128);
      v13 = *MEMORY[0x1E0C8AC30];
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startObservingNotificationForName:object:notificationCenter:observationHandler:", v13, 0, v14, &__block_literal_global_181_16962);

      v15 = (id)objc_msgSend(*(id *)(a1 + 1128), "startObserving:keyPath:observationHandler:", v7, CFSTR("player.currentItem.interstitialTimeRanges"), &__block_literal_global_184);
      v16 = *(void **)(a1 + 1128);
      v24[0] = CFSTR("playerController.player.currentItem.externalMetadata");
      v24[1] = CFSTR("playerController.metadata");
      v24[2] = CFSTR("playerController.player.currentItem.contentTitle");
      v24[3] = CFSTR("playerController.player.currentItem.contentSubtitle");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v16, "startObserving:keyPaths:observationHandler:", a1, v17, &__block_literal_global_193);

      v19 = (id)objc_msgSend(*(id *)(a1 + 1128), "startObserving:keyPath:observationHandler:", a1, CFSTR("playerController.atLiveEdge"), &__block_literal_global_196);
      v20 = (id)objc_msgSend(*(id *)(a1 + 1128), "startObserving:keyPath:includeInitialValue:observationHandler:", a1, CFSTR("playerController.coordinatedPlaybackActive"), 0, &__block_literal_global_199);
      v21 = (id)objc_msgSend(*(id *)(a1 + 1128), "startObserving:keyPath:observationHandler:", a1, CFSTR("playerController.contentDimensions"), &__block_literal_global_202);

      v5 = v23;
    }
  }

}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_8(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState](a2);
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v9, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "coordinatedPlaybackActive");

  if (v9 && v6 && (v8 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    objc_msgSend(v9, "flashControlsWithDuration:");
  }

}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  id *v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(v5[145], "playbackControlsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAtLiveEdge");

    objc_msgSend(v2, "setBackwardSecondaryControlEnabled:", 1);
    objc_msgSend(v2, "setForwardSecondaryControlEnabled:", v4 ^ 1u);

  }
  -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](v5);
  -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](v5);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v5);
  -[AVMobileChromelessControlsViewController _updateContentTag](v5);

}

- (void)_updateJumpToLiveControlInclusionStateIfNeeded
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasSeekableLiveStreamingContent"))
      v2 = objc_msgSend(v3, "isAtLiveEdge") ^ 1;
    else
      v2 = 0;
    objc_msgSend(a1[152], "setIncluded:", v2);

  }
}

- (void)_updateSliderMarkForLiveEdgeIfNeeded
{
  void *v2;
  id v3;
  void *v4;
  float v5;
  float v6;
  double v7;
  uint64_t v8;
  id obj;
  id obja;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasSeekableLiveStreamingContent")
      && (objc_msgSend(v2, "isAtLiveEdge") & 1) == 0)
    {
      obja = a1[200];
      -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "maximumValue");
      v6 = v5;

      if (!obja || (objc_msgSend(obja, "startValue"), v3 = obja, vabds_f32(*(float *)&v7, v6) >= 0.00000011921))
      {
        *(float *)&v7 = v6;
        +[AVMobileSliderMark liveEdgeMarkAtValue:](AVMobileSliderMark, "liveEdgeMarkAtValue:", v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v8;
      }
    }
    else
    {
      v3 = 0;
    }
    obj = v3;
    if (a1[200] != v3)
    {
      objc_storeStrong(a1 + 200, v3);
      -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](a1);
    }

  }
}

- (void)_updateTimelineViewSliderMarksIfNeeded
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  double Seconds;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  _QWORD *v46;
  void *v47;
  double v48;
  void *v49;
  AVMobileSliderMark *v50;
  double v51;
  double v52;
  AVMobileSliderMark *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id obj;
  id obja;
  _BYTE time[32];
  __int128 v62;
  CMTime v63;
  __int128 v64;
  _OWORD v65[2];
  CMTime v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v3;
    if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
    {
      v4 = v2;
      objc_msgSend(v1, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interstitialController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentInterstitialTimeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        obj = v2;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v5, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "currentItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "interstitialTimeRanges");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v68 != v13)
                objc_enumerationMutation(v10);
              v15 = *(id *)(*((_QWORD *)&v67 + 1) + 8 * i);
              v16 = v15;
              if (v15)
              {
                objc_msgSend(v15, "timeRange");
              }
              else
              {
                memset(v65, 0, sizeof(v65));
                v64 = 0u;
              }
              *(_OWORD *)time = v64;
              *(_QWORD *)&time[16] = *(_QWORD *)&v65[0];
              Seconds = CMTimeGetSeconds((CMTime *)time);
              *(float *)&v18 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, Seconds);
              +[AVMobileSliderMark interstitialMarkAtValue:](AVMobileSliderMark, "interstitialMarkAtValue:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "addObject:", v19);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
          }
          while (v12);
        }

        v2 = obj;
      }
      if (objc_msgSend(v5, "hasSeekableLiveStreamingContent") && v1[200])
        objc_msgSend(v4, "addObject:");

    }
    v58 = v2;
    -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)v1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "playerController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      v55 = v20;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v1, "playerController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "photosensitivityRegions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      obja = v24;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v68;
        v57 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v68 != v27)
              objc_enumerationMutation(obja);
            v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
            objc_msgSend(v29, "risk");
            if (v30 >= 0.5)
            {
              objc_msgSend(v29, "colors");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(v29, "timeRange");
                v66 = *(CMTime *)((char *)v65 + 8);
                v32 = CMTimeGetSeconds(&v66);
                objc_msgSend(v29, "timeRange");
              }
              else
              {
                memset(v65, 0, sizeof(v65));
                v64 = 0u;
                *(_OWORD *)&v66.value = *(_OWORD *)((char *)v65 + 8);
                v66.epoch = 0;
                v32 = CMTimeGetSeconds(&v66);
                memset(time, 0, sizeof(time));
                v62 = 0u;
              }
              v63 = *(CMTime *)time;
              v33 = CMTimeGetSeconds(&v63);
              v34 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, v33);
              v35 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, v32 + v33);
              v36 = (void *)MEMORY[0x1E0DC3658];
              objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "doubleValue");
              v39 = v38;
              objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "doubleValue");
              v42 = v41;
              objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "doubleValue");
              v45 = v44;
              objc_msgSend(v31, "objectAtIndexedSubscript:", 3);
              v46 = v1;
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "doubleValue");
              objc_msgSend(v36, "colorWithRed:green:blue:alpha:", v39, v42, v45, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              v50 = [AVMobileSliderMark alloc];
              *(float *)&v51 = v34;
              *(float *)&v52 = v35;
              v53 = -[AVMobileSliderMark initWithStartValue:endValue:filledColor:unfilledColor:markWithType:](v50, "initWithStartValue:endValue:filledColor:unfilledColor:markWithType:", v49, v49, 2, v51, v52);
              objc_msgSend(v58, "addObject:", v53);

              v1 = v46;
              v27 = v57;
            }
          }
          v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        }
        while (v26);
      }

      v20 = v55;
      objc_msgSend(v55, "setSliderMarks:", v58);
      v3 = v56;
    }

    -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)v1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSliderMarks:", v58);

  }
}

- (float)_normalizeTimeValue:(uint64_t)a1
{
  void *v3;
  float v4;
  double v6;
  double v7;
  double v8;
  float v9;

  v3 = *(void **)(a1 + 1392);
  v4 = 0.0;
  if (v3)
  {
    objc_msgSend(v3, "minTime");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 1392), "maxTime");
    if (fabs(v7) != INFINITY && fabs(v8) != INFINITY)
    {
      v9 = v8 - v7;
      if (v9 > 0.0)
        return (a2 - v7) / v9;
    }
  }
  return v4;
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_5(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updateTitleAndDescriptionInfo](a2);
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_4(uint64_t a1, _QWORD *a2)
{
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](a2);
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v10 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interstitialPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interstitialController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interstitialPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {
    -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)v10);
    -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](v10);
  }

}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](a2);
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon](a2);
}

void __71__AVMobileChromelessControlsViewController__updateLoadingAnimatorState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState]();

}

- (void)_animateSliderToTintState:(void *)a3 duration:(double)a4 completionHandler:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22[2];
  id location;

  v7 = a3;
  v8 = *(void **)(a1 + 1456);
  if (v8
    && objc_msgSend(v8, "isRunning")
    && objc_msgSend(*(id *)(a1 + 1456), "isInterruptible"))
  {
    objc_msgSend(*(id *)(a1 + 1456), "stopAnimation:", 1);
    objc_msgSend(*(id *)(a1 + 1456), "finishAnimationAtPosition:", 2);
    v9 = *(void **)(a1 + 1456);
    *(_QWORD *)(a1 + 1456) = 0;

  }
  objc_msgSend(*(id *)(a1 + 1160), "timelineView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  v11 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke;
  v21[3] = &unk_1E5BB4638;
  objc_copyWeak(v22, &location);
  v22[1] = a2;
  v13 = objc_msgSend(v11, "initWithDuration:curve:animations:", 3, v21, a4);
  v14 = *(void **)(a1 + 1456);
  *(_QWORD *)(a1 + 1456) = v13;

  if (v7)
  {
    v15 = *(void **)(a1 + 1456);
    v16 = v12;
    v17 = 3221225472;
    v18 = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_2;
    v19 = &unk_1E5BB3940;
    v20 = v7;
    objc_msgSend(v15, "addCompletion:", &v16);

  }
  objc_msgSend(*(id *)(a1 + 1456), "startAnimation", v16, v17, v18, v19);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

void __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintState:", *(_QWORD *)(a1 + 40));

}

void __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_3;
  block[3] = &unk_1E5BB4610;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke_2;
  v15[3] = &unk_1E5BB39B8;
  v16 = v4;
  v8 = v4;
  +[AVAction actionWithTitle:image:identifier:handler:](AVAction, "actionWithTitle:image:identifier:handler:", v5, v6, v7, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  objc_msgSend(v3, "accessibilityHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityHint:", v11);

  objc_msgSend(v3, "accessibilityIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v12);

  objc_msgSend(v3, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v13);

  objc_msgSend(v3, "menu");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setContextMenu:", v14);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

uint64_t __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_25(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)v2, 1);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](v2, 0);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewAllowsVolumeAdjustmentState](v2);
  -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion](v2);
  -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState](v2);
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_24(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updateTimelineValues]((uint64_t)v2);
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_23(uint64_t a1, uint64_t a2)
{
  -[AVMobileChromelessControlsViewController _updateTimelineValues](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);
  objc_msgSend(v2, "_timelineSliderTrackingStateDidChange");

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_21(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)v2);
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu](v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_20(uint64_t a1, _QWORD *a2)
{
  -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionControlInclusionState](a2);
}

uint64_t __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_18(uint64_t a1, uint64_t a2)
{
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_17(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](a2);
}

uint64_t __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_16(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;
  id v4;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _auxiliaryControlsView](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateOverflowMenu");

  v4 = v2[161];
  return objc_msgSend(v4, "updateContextMenu");
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_15(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;
  int v4;
  uint64_t v5;
  id v6;
  id *v7;

  v7 = a2;
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon](v7);
  v2 = v7;
  if (v7)
  {
    objc_msgSend(v7, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "coordinatedPlaybackActive");
    if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
    {
      if (v4)
      {
        v5 = objc_msgSend(v3, "timeControlStatus");
        objc_msgSend((id)objc_opt_class(), "autoHideInterval");
        objc_msgSend(v7, "flashControlsWithDuration:");
        if (v5 == 1)
        {
          objc_msgSend(v7[186], "invalidate");
          v6 = v7[186];
          v7[186] = 0;

        }
      }
    }

    v2 = v7;
  }

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_14(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  id *v9;
  BOOL v10;
  id v11;
  id *v12;

  v12 = a2;
  objc_msgSend(a4, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v12, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaying");

  v9 = v12;
  if (*((_BYTE *)v12 + 1505))
    v10 = v6 == v8;
  else
    v10 = 1;
  if (!v10)
  {
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "autoHideInterval");
      objc_msgSend(v12, "flashControlsWithDuration:");
    }
    else
    {
      objc_msgSend(v12[186], "invalidate");
      v11 = v12[186];
      v12[186] = 0;

    }
    v9 = v12;
  }

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_12(uint64_t a1, _QWORD *a2)
{
  -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_11(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState](v2);
  -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState]((id *)v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  float v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  void *v12;
  int v13;
  id *v14;
  int v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id *val;
  _QWORD v30[4];
  id v31;
  id location;

  val = a2;
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes](val);
  -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState](val);
  -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](val);
  if (!val)
  {
    -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](0);
    -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](0);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](0);
    goto LABEL_13;
  }
  -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)val);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValue");
  v4 = v3;
  objc_msgSend(val, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSeekableLiveStreamingContent");

  if (v6)
  {
    if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)val))
      v8 = 0.015;
    else
      v8 = 0.033;
    objc_msgSend(v2, "maximumValue");
    v10 = v9;
    objc_msgSend(v2, "maximumValue");
    v7 = v11 + v10 * v8;
    v4 = v7;
  }
  *(float *)&v7 = v4;
  objc_msgSend(v2, "setTotalValue:", v7);

  -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](val);
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](val);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)val);
  objc_msgSend(val, "playerController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasSeekableLiveStreamingContent");

  v14 = val;
  if (!val[152])
  {
    v15 = val[145] ? v13 : 0;
    if (v15 == 1)
    {
      +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Jump to Live"), 1);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = val[158];
      val[158] = (id)v16;

      objc_msgSend(val[158], "setAccessibilityIdentifier:", CFSTR("Jump to Live"));
      v18 = val[158];
      AVLocalizedString(CFSTR("Jump to Live"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccessibilityLabel:", v19);

      objc_msgSend(val[158], "addTarget:action:forControlEvents:", val, sel__handleJumpToLiveAction, 64);
      objc_msgSend(val[158], "setImageName:", CFSTR("forward.end.fill.tv"));
      -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:]((uint64_t)val, val[158]);
      +[AVMobileAuxiliaryControl controlWithView:displayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithView:displayPriority:identifier:", val[158], 0, CFSTR("AVJumpToLiveControl"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = val[152];
      val[152] = (id)v20;

      objc_msgSend(val[152], "setIncluded:", 1);
      objc_initWeak(&location, val);
      v22 = (void *)MEMORY[0x1E0DC3428];
      AVLocalizedString(CFSTR("OVERFLOW_MENU_JUMP_TO_LIVE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0DC3870];
      AVBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageNamed:inBundle:", CFSTR("forward.end.fill.tv"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __75__AVMobileChromelessControlsViewController__setUpJumpToLiveControlIfNeeded__block_invoke;
      v30[3] = &unk_1E5BB3918;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v23, v26, 0, v30);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = val[162];
      val[162] = (id)v27;

      -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)val);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
LABEL_13:
      v14 = val;
    }
  }
  -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](v14);

}

- (void)_configureAuxiliaryControlButton:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 1152);
  v3 = a2;
  objc_msgSend(v2, "buttonFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInlineFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

}

void __75__AVMobileChromelessControlsViewController__setUpJumpToLiveControlIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleJumpToLiveAction");

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updateContentTag](v2);
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes](v2);
  -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState](v2);
  -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](v2);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_8(uint64_t a1, uint64_t a2)
{
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a2);
}

id *__61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_7(uint64_t a1, id *a2)
{
  return -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](v2, 1u);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState](v2);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id *val;
  _QWORD v20[4];
  id v21;
  id location;

  val = a2;
  v5 = a4;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVVolumeControllerVolumeDidChangeNotificationShowHUDKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = 1;
    if (val)
    {
      objc_msgSend(val[145], "volumeControlsView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(val, "playerController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(val[145], "volumeControlsView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](val, 1);
        objc_msgSend(val[171], "invalidate");
        v15 = val[171];
        val[171] = 0;

        if ((objc_msgSend(v14, "isTracking") & 1) == 0)
        {
          objc_initWeak(&location, val);
          v16 = (void *)MEMORY[0x1E0C99E88];
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __106__AVMobileChromelessControlsViewController__animateVolumeControlsToEmphasizedWithTransformToIdentityDelay__block_invoke;
          v20[3] = &unk_1E5BB49A8;
          objc_copyWeak(&v21, &location);
          objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, 3.0);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = val[171];
          val[171] = (id)v17;

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }

        if (objc_msgSend(v13, "isMuted"))
        {
          objc_msgSend(v13, "setMuted:", 0);
          objc_msgSend(v12, "setMute:", 0);
        }
        -[AVMobileChromelessControlsViewController _temporarilyShowVolumeSlider]((uint64_t)val);
      }
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](val, 0);

    }
  }

}

void __106__AVMobileChromelessControlsViewController__animateVolumeControlsToEmphasizedWithTransformToIdentityDelay__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](WeakRetained, 0);

  v3 = objc_loadWeakRetained(v1);
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)v3);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  _QWORD *v10;

  v10 = a2;
  objc_msgSend(a4, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v10, "pipController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPictureInPictureActive");

  v9 = v6 ^ v8;
  if ((v6 & 1) != 0 || !v9)
    -[AVMobileChromelessControlsViewController _updateLayoutMargins](v10);
  else
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)v10, 0, 0);
  if ((v6 & v9) == 1)
  {
    -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)v10);
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing]((id *)v10);
  }
  -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](v10);

}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_3(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_2(uint64_t a1, id *a2)
{
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewUserInteractionEnablementState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  if (a2)
  {
    objc_msgSend(a4, "userInfo");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v7 = v6;

    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4F90]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E40]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longValue");

    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (*(double *)(a2 + 1328) != v7)
    {
      *(double *)(a2 + 1328) = v7;
      -[AVMobileChromelessControlsViewController _updateLayoutMargins]((_QWORD *)a2);
      if ((v9 & 1) == 0)
      {
        objc_msgSend(*(id *)(a2 + 1160), "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = *(id *)(a2 + 1336);
          if (objc_msgSend(v16, "isRunning"))
          {
            if (objc_msgSend(v16, "isInterruptible"))
            {
              objc_msgSend(v16, "stopAnimation:", 0);
              objc_msgSend(v16, "finishAnimationAtPosition:", 2);
            }
          }
          objc_initWeak(&location, (id)a2);
          v17 = objc_alloc(MEMORY[0x1E0DC3F38]);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __79__AVMobileChromelessControlsViewController__animateKeyboardAvoidance_duration___block_invoke;
          v21[3] = &unk_1E5BB4A40;
          objc_copyWeak(&v22, &location);
          v18 = (void *)objc_msgSend(v17, "initWithDuration:curve:animations:", v11, v21, v14);
          objc_msgSend(v18, "startAnimation");
          v19 = *(void **)(a2 + 1336);
          *(_QWORD *)(a2 + 1336) = v18;

          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);

        }
      }
    }

  }
}

void __79__AVMobileChromelessControlsViewController__animateKeyboardAvoidance_duration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setNeedsLayout");
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)_setUpAuxiliaryControlsViewIfNeeded
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  AVMobileAuxiliaryControlsView *v6;

  v2 = *(void **)(a1 + 1160);
  if (v2)
  {
    objc_msgSend(v2, "auxiliaryControlsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = objc_alloc_init(AVMobileAuxiliaryControlsView);
      -[AVMobileAuxiliaryControlsView setAutoresizingMask:](v6, "setAutoresizingMask:", 0);
      -[AVMobileAuxiliaryControlsView setDelegate:](v6, "setDelegate:", a1);
      -[AVView setAutomaticallyUpdatesSubviewContentIntersections:](v6, "setAutomaticallyUpdatesSubviewContentIntersections:", 1);
      v4 = objc_msgSend((id)a1, "prefersFullScreenStyleForEmbeddedMode");
      v5 = 0.0;
      if (v4)
        v5 = *(double *)(a1 + 1728);
      -[AVMobileAuxiliaryControlsView setAvkit_extendedDynamicRangeGain:](v6, "setAvkit_extendedDynamicRangeGain:", v5);
      objc_msgSend(*(id *)(a1 + 1160), "setAuxiliaryControlsView:", v6);

    }
  }
}

- (void)_setUpAnalysisControlIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (val && *((_QWORD *)val + 145) && !*((_QWORD *)val + 153))
  {
    if (*((_BYTE *)val + 1705))
    {
      objc_initWeak(&location, val);
      v2 = (void *)MEMORY[0x1E0DC3428];
      AVLocalizedString(CFSTR("OVERFLOW_MENU_LIVE_TEXT_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("text.viewfinder"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __73__AVMobileChromelessControlsViewController__setUpAnalysisControlIfNeeded__block_invoke;
      v12 = &unk_1E5BB3918;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v9);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)*((_QWORD *)val + 163);
      *((_QWORD *)val + 163) = v5;

      +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, CFSTR("AVAnalysisControl"), v9, v10, v11, v12);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)val + 153);
      *((_QWORD *)val + 153) = v7;

      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setUpCopySubjectControlIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (val && *((_QWORD *)val + 145) && !*((_QWORD *)val + 154))
  {
    objc_initWeak(&location, val);
    v2 = (void *)MEMORY[0x1E0DC3428];
    AVLocalizedString(CFSTR("OVERFLOW_MENU_COPY_SUBJECT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle.dashed.rectangle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __76__AVMobileChromelessControlsViewController__setUpCopySubjectControlIfNeeded__block_invoke;
    v12 = &unk_1E5BB3918;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v9);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)val + 164);
    *((_QWORD *)val + 164) = v5;

    +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, CFSTR("AVAnalysisCopySubjectControl"), v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)val + 154);
    *((_QWORD *)val + 154) = v7;

    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_setUpVisualLookupControlIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (val && *((_QWORD *)val + 145) && !*((_QWORD *)val + 155))
  {
    objc_initWeak(&location, val);
    v2 = (void *)MEMORY[0x1E0DC3428];
    AVLocalizedString(CFSTR("OVERFLOW_MENU_VISUAL_LOOKUP"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("info.circle.and.sparkles"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __77__AVMobileChromelessControlsViewController__setUpVisualLookupControlIfNeeded__block_invoke;
    v12 = &unk_1E5BB3918;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v9);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)val + 165);
    *((_QWORD *)val + 165) = v5;

    +[AVMobileAuxiliaryControl controlWithDisplayPriority:identifier:](AVMobileAuxiliaryControl, "controlWithDisplayPriority:identifier:", 0, CFSTR("AVAnalysisVisualLookupControl"), v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)val + 155);
    *((_QWORD *)val + 155) = v7;

    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __62__AVMobileChromelessControlsViewController__loadControlsViews__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "controlsViewControllerDidUpdateLayoutGuides:", v3);

}

void __77__AVMobileChromelessControlsViewController__setUpVisualLookupControlIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForEvent:", CFSTR("AVChromelessControlsVisualLookupMenuItemPressedEvent"));

}

void __76__AVMobileChromelessControlsViewController__setUpCopySubjectControlIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForEvent:", CFSTR("AVChromelessControlsCopySubjectMenuItemPressedEvent"));

}

void __73__AVMobileChromelessControlsViewController__setUpAnalysisControlIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_opt_respondsToSelector();

    if ((v2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "chromelessControlsViewControllerDidPressLiveTextButton:", WeakRetained);

    }
  }

}

void __71__AVMobileChromelessControlsViewController__setNeedsTimeResolverUpdate__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1424] = 0;
    v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_hideControlsIfPossible
{
  void *v2;

  if (a1)
  {
    *(_BYTE *)(a1 + 1505) = 0;
    *(_BYTE *)(a1 + 1344) = 0;
    -[AVMobileChromelessControlsViewController _resetVolumeSliderTemporarilyVisibleTimer](a1);
    objc_msgSend(*(id *)(a1 + 1488), "invalidate");
    v2 = *(void **)(a1 + 1488);
    *(_QWORD *)(a1 + 1488) = 0;

    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
  }
}

void __70__AVMobileChromelessControlsViewController_flashControlsWithDuration___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1505] = 0;
    v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_updateExtendedDynamicRangeGain
{
  double v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v2 = 0.0;
    if (objc_msgSend((id)a1, "prefersFullScreenStyleForEmbeddedMode"))
      v2 = *(double *)(a1 + 1728);
    objc_msgSend(*(id *)(a1 + 1160), "timelineView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabelsExtendedDynamicRangeGain:", v2);
    objc_msgSend(v5, "setSliderExtendedDynamicRangeGain:", v2);
    objc_msgSend(*(id *)(a1 + 1160), "playbackControlsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAvkit_extendedDynamicRangeGain:", v2);
    objc_msgSend(*(id *)(a1 + 1160), "auxiliaryControlsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAvkit_extendedDynamicRangeGain:", v2);

  }
}

- (id)_displayModeControlsView
{
  if (a1)
  {
    objc_msgSend(a1[145], "displayModeControlsView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end

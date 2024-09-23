@implementation AVPlaybackControlsView

- (void)setCustomControlsView:(id)a3
{
  AVPlayerViewControllerCustomControlsView *v5;
  AVPlayerViewControllerCustomControlsView *v6;

  v5 = (AVPlayerViewControllerCustomControlsView *)a3;
  if (self->_customControlsView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customControlsView, a3);
    -[AVPlaybackControlsView _updateAreVolumeAndTransportControlsVisible](self, "_updateAreVolumeAndTransportControlsVisible");
    v5 = v6;
  }

}

- (AVScrubber)scrubber
{
  return self->_scrubber;
}

- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 showsPlaybackControls;

  v4 = a4;
  showsPlaybackControls = self->_showsPlaybackControls;
  if (showsPlaybackControls != a3 || self->_showsAudioControls != showsPlaybackControls)
  {
    -[AVPlaybackControlsView setShowsPlaybackControls:](self, "setShowsPlaybackControls:");
    -[AVPlaybackControlsView _showPlaybackControlsAnimated:](self, "_showPlaybackControlsAnimated:", !v4);
  }
}

- (BOOL)showsAudioControls
{
  return self->_showsAudioControls;
}

- (void)_showPlaybackControlsAnimated:(BOOL)a3
{
  -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", a3, 0);
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  _BOOL4 showsPlaybackControls;
  id v5;

  showsPlaybackControls = self->_showsPlaybackControls;
  if (showsPlaybackControls != a3)
  {
    self->_showsPlaybackControls = a3;
    showsPlaybackControls = a3;
  }
  if (showsPlaybackControls != self->_showsAudioControls)
    self->_showsAudioControls = showsPlaybackControls;
  -[AVPlaybackControlsView visibilityDelegate](self, "visibilityDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackControlsViewDidToggleControlsVisibility:", self);

}

- (void)_updateTransportControlsFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double Width;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = CGRectGetHeight(v31) - v7;

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  Width = CGRectGetWidth(v32);

  if (Width >= v5)
    Width = v5;
  -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "setFrame:", CGRectGetMinX(v33), v9, Width, v7);

  -[AVPlaybackControlsView styleSheet](self, "styleSheet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumSingleButtonTransportControlsWidth");
  v16 = v15;

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (Width == v16)
  {
    objc_msgSend(v17, "frame");
    v19 = CGRectGetHeight(v34) - v7;

    -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, v19, v5, v7);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v17, "center");
  v22 = v21;
  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = v22 - CGRectGetMinX(v35);

  -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "center");
  v27 = v26;

  if (v27 != v24)
  {
    -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "center");
    objc_msgSend(v20, "setCenter:", v24);

    goto LABEL_7;
  }
LABEL_8:
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v5, v7);

  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNeedsLayout");

}

- (AVTouchIgnoringView)playbackControlsContainer
{
  return self->_playbackControlsContainer;
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)_updatePlaybackControlsContainerVisibilityAnimated:(BOOL)a3 additionalActions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  unsigned __int8 v15;
  int v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  AVPlayerViewControllerAnimationCoordinator *v32;
  void *v33;
  AVPlayerViewControllerAnimationCoordinator *v34;
  void (**v35)(_QWORD);
  void *v36;
  void (**v37)(_QWORD);
  void *v38;
  char v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  id *p_from;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  BOOL v53;
  _BOOL4 v54;
  int v55;
  char v56;
  id v57;
  int v58;
  void *v59;
  _QWORD v60[4];
  AVPlayerViewControllerAnimationCoordinator *v61;
  void (**v62)(_QWORD);
  id v63;
  BOOL v64;
  id from;
  _QWORD v66[4];
  id v67;
  AVPlayerViewControllerAnimationCoordinator *v68;
  void (**v69)(_QWORD);
  id v70;
  BOOL v71;
  _QWORD v72[4];
  id v73;
  char v74;
  char v75;
  _QWORD v76[4];
  AVPlayerViewControllerAnimationCoordinator *v77;
  id v78;
  id v79;
  BOOL v80;
  char v81;
  BOOL v82;
  char v83;
  char v84;
  BOOL v85;
  char v86;
  char v87;
  id location;
  _QWORD v89[5];
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;

  v54 = a3;
  v5 = a4;
  -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isRunning"))
  {
    -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInterruptible");

    if (!v8)
      goto LABEL_5;
    -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAnimation:", 0);

    -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishAnimationAtPosition:", 2);
  }

LABEL_5:
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView customMediaItems](self, "customMediaItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomItems:", v11);

  v12 = -[AVPlaybackControlsView showsPlaybackControls](self, "showsPlaybackControls");
  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCollapsedOrExcluded");
  v15 = v14 ^ 1;

  v16 = v14 & v12;
  v17 = -[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton");
  v53 = -[AVPlaybackControlsView includesTransportControls](self, "includesTransportControls");
  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v18, "hasVisibleArrangedSubview") ^ 1;

  if (-[AVPlaybackControlsView includesDisplayModeControlsContainer](self, "includesDisplayModeControlsContainer"))
    v56 = 0;
  else
    v56 = !-[AVPlaybackControlsView includesCustomDisplayModeControls](self, "includesCustomDisplayModeControls");
  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v19, "hasVisibleArrangedSubview") ^ 1;

  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isCollapsedOrExcluded") ^ 1;

  v52 = v5;
  v51 = v17;
  if (v17)
  {
    v22 = 0;
    goto LABEL_16;
  }
  if (-[AVPlaybackControlsView includesAudioControlsContainer](self, "includesAudioControlsContainer"))
  {
    if (v12)
    {
      v22 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    v23 = -[AVPlaybackControlsView includesCustomAudioControls](self, "includesCustomAudioControls");
    v24 = !v23 | v16;
    v22 = v23 | v24 ^ 1;
    if ((v24 & 1) != 0 || (v15 & v12 & 1) != 0)
      goto LABEL_16;
  }
  v22 = -[AVPlaybackControlsView showsAudioControls](self, "showsAudioControls");
LABEL_16:
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke;
  v89[3] = &unk_1E5BB4660;
  v90 = v58;
  v91 = v55;
  v92 = v14 & v12;
  v93 = v15 & v12;
  v94 = v14 ^ 1;
  v89[4] = self;
  v95 = v56;
  v96 = v22;
  v97 = v21;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v89);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v26;
  if (v22)
    v28 = v25;
  else
    v28 = (void *)v26;
  v29 = v25;
  objc_msgSend(v28, "addObject:", v27);

  if (v16)
  {
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v30);
    v31 = v53;
LABEL_23:

    goto LABEL_24;
  }
  v31 = v53;
  if (((v14 | v12) & 1) == 0)
  {
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v30);
    goto LABEL_23;
  }
LABEL_24:
  if ((v14 & 1) == 0 && !self->_controlsViewHasAppeared)
  {
    -[AVPlaybackControlsView window](self, "window");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      self->_controlsViewHasAppeared = 1;
      -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v29, "containsObject:", v47);

      if ((v48 & 1) == 0)
      {
        -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v49);

      }
    }
  }
  v32 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
  -[AVPlaybackControlsView visibilityDelegate](self, "visibilityDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "playbackControlsView:animateAlongsideVisibilityAnimationsWithAnimationCoordinator:appearingViews:disappearingViews:", self, v32, v29, v59);

  objc_initWeak(&location, self);
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_2;
  v76[3] = &unk_1E5BB2660;
  objc_copyWeak(&v79, &location);
  v80 = v31;
  v81 = v56;
  v82 = v51;
  v83 = v14 & v12;
  v84 = v15 & v12;
  v85 = v12;
  v86 = v58;
  v87 = v55;
  v34 = v32;
  v77 = v34;
  v57 = v52;
  v78 = v57;
  v35 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v76);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView setMostRecentAnimationCompletionsID:](self, "setMostRecentAnimationCompletionsID:", v36);
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_3;
  v72[3] = &unk_1E5BB2688;
  objc_copyWeak(&v73, &location);
  v74 = v15 & !v12;
  v75 = v14 & !v12;
  v37 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v72);
  if ((((v14 ^ 1) & 1) != 0
     || (v16 & 1) != 0
     || -[AVPlaybackControlsView showsAudioControls](self, "showsAudioControls"))
    && -[UIView avkit_wantsAnimatedViewTransitions](self, "avkit_wantsAnimatedViewTransitions")
    && v54)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isRunning");

      if ((v39 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        v50 = (void *)MEMORY[0x1E0CD28B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_5;
        v66[3] = &unk_1E5BB26B0;
        objc_copyWeak(&v70, &location);
        v67 = v36;
        v69 = v37;
        v71 = v54;
        v68 = v34;
        objc_msgSend(v50, "setCompletionBlock:", v66);
        v35[2](v35);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

        p_from = &v70;
        goto LABEL_42;
      }
    }
    objc_initWeak(&from, self);
    -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isRunning"))
    {
      -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isInterruptible");

      if (!v42)
      {
LABEL_36:
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:curve:animations:", 0, v35, 0.2);
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_6;
        v60[3] = &unk_1E5BB26D8;
        objc_copyWeak(&v63, &from);
        v62 = v37;
        v64 = v54;
        v61 = v34;
        objc_msgSend(v44, "addCompletion:", v60);
        -[AVPlaybackControlsView setPlaybackControlsVisibilityAnimator:](self, "setPlaybackControlsVisibilityAnimator:", v44);
        objc_msgSend(v44, "startAnimation");

        objc_destroyWeak(&v63);
        p_from = &from;
LABEL_42:
        objc_destroyWeak(p_from);
        goto LABEL_43;
      }
      -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stopAnimation:", 0);

      -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "finishAnimationAtPosition:", 2);
    }

    goto LABEL_36;
  }
  v35[2](v35);
  v37[2](v37);
LABEL_43:

  objc_destroyWeak(&v73);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);

}

- (AVTouchIgnoringView)volumeControlsContainer
{
  return self->_volumeControlsContainer;
}

- (BOOL)includesAudioControlsContainer
{
  _BOOL4 v3;

  if (-[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton"))
    LOBYTE(v3) = 0;
  else
    return (LOBYTE(self->_includedContainers) >> 4) & 1;
  return v3;
}

- (BOOL)showsProminentPlayButton
{
  return (LOBYTE(self->_includedContainers) >> 1) & 1;
}

- (NSArray)customMediaItems
{
  return self->_customMediaItems;
}

- (BOOL)includesTransportControls
{
  _BOOL4 v3;

  if (-[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton"))
    LOBYTE(v3) = 0;
  else
    return (LOBYTE(self->_includedContainers) >> 2) & 1;
  return v3;
}

- (BOOL)includesDisplayModeControlsContainer
{
  _BOOL4 v3;

  if (-[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton"))
    LOBYTE(v3) = 0;
  else
    return (LOBYTE(self->_includedContainers) >> 3) & 1;
  return v3;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMostRecentAnimationCompletionsID:", 0);

  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_4;
    v6[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v7, v2);
    objc_msgSend(v4, "performWithoutAnimation:", v6);
    objc_destroyWeak(&v7);
  }
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "reevaluateHiddenStateForContainersAndSubviews");

}

- (void)setMostRecentAnimationCompletionsID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentAnimationCompletionsID, a3);
}

uint64_t __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_2(uint64_t a1)
{
  id v1;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t result;
  id v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "transportControlsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "transportControlsContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 1.0;
  if (!*(_BYTE *)(a1 + 56))
    v9 = 0.0;
  objc_msgSend(v7, "setAlpha:", v9);

  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "screenModeControls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncluded:", *(_BYTE *)(a1 + 57) == 0);

  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "prominentPlayButtonContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncluded:", *(unsigned __int8 *)(a1 + 58));

  v14 = 0;
  if (!*(_BYTE *)(a1 + 58))
  {
    v15 = objc_loadWeakRetained(v3);
    v16 = objc_msgSend(v15, "includesAudioControlsContainer");
    if ((v16 & 1) != 0
      || (v1 = objc_loadWeakRetained(v3), objc_msgSend(v1, "includesCustomAudioControls")))
    {
      if (*(_BYTE *)(a1 + 59) || *(_BYTE *)(a1 + 60))
      {
        v14 = 1;
        if ((v16 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        v65 = objc_loadWeakRetained(v3);
        v14 = objc_msgSend(v65, "showsAudioControls");

        if ((v16 & 1) != 0)
          goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }

LABEL_12:
  }
  v17 = objc_loadWeakRetained(v3);
  objc_msgSend(v17, "volumeControlsContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIncluded:", v14);

  v19 = objc_loadWeakRetained(v3);
  objc_msgSend(v19, "playbackControlsContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIncluded:", *(unsigned __int8 *)(a1 + 61));

  v21 = objc_loadWeakRetained(v3);
  objc_msgSend(v21, "visibilityDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained(v3);
  objc_msgSend(v22, "playbackControlsViewNeedsUpdateStatusBarAppearance:", v23);

  if (*(_BYTE *)(a1 + 60))
  {
    v24 = objc_loadWeakRetained(v3);
    objc_msgSend(v24, "fullScreenButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_loadWeakRetained(v3);
    objc_msgSend(v25, "setIncluded:", objc_msgSend(v26, "prefersFullScreenButtonIncluded"));

    v27 = objc_loadWeakRetained(v3);
    objc_msgSend(v27, "doneButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_loadWeakRetained(v3);
    objc_msgSend(v28, "setIncluded:", objc_msgSend(v29, "prefersDoneButtonIncluded"));

    v30 = objc_loadWeakRetained(v3);
    objc_msgSend(v30, "pictureInPictureButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_loadWeakRetained(v3);
    objc_msgSend(v31, "setIncluded:", objc_msgSend(v32, "prefersPiPButtonIncluded"));

    v33 = objc_loadWeakRetained(v3);
    objc_msgSend(v33, "videoGravityButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_loadWeakRetained(v3);
    objc_msgSend(v34, "setIncluded:", objc_msgSend(v35, "prefersVideoGravityButtonIncluded"));

    if (!*(_BYTE *)(a1 + 57))
    {
      v36 = objc_loadWeakRetained(v3);
      objc_msgSend(v36, "screenModeControls");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_loadWeakRetained(v3);
      objc_msgSend(v38, "_preferredArrangedDisplayModeViews");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setArrangedSubviews:", v41);

      if (!*(_BYTE *)(a1 + 62) && !*(_BYTE *)(a1 + 57))
      {
        v42 = objc_loadWeakRetained(v3);
        v43 = objc_msgSend(v42, "includesDisplayModeControlsContainer") ^ 1;
        v44 = objc_loadWeakRetained(v3);
        objc_msgSend(v44, "defaultDisplayModeControls");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "_collapse:views:", v43, v45);

        v46 = objc_loadWeakRetained(v3);
        objc_msgSend(v46, "_displayModeViewsToRemoveDuringAnimation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_collapse:views:", 1, v47);

      }
    }
    if ((_DWORD)v14)
    {
      v48 = objc_loadWeakRetained(v3);
      objc_msgSend(v48, "volumeControls");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_loadWeakRetained(v3);
      objc_msgSend(v50, "_preferredArrangedAudioModeViews");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "array");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setArrangedSubviews:", v53);

      if (!*(_BYTE *)(a1 + 63))
      {
        v54 = objc_loadWeakRetained(v3);
        v55 = objc_msgSend(v54, "includesAudioControlsContainer") ^ 1;
        v56 = objc_loadWeakRetained(v3);
        objc_msgSend(v56, "defaultAudioControls");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "_collapse:views:", v55, v57);

        v58 = objc_loadWeakRetained(v3);
        objc_msgSend(v58, "_audioViewsToRemoveDuringAnimation");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "_collapse:views:", 1, v59);

      }
    }
    v60 = objc_loadWeakRetained(v3);
    objc_msgSend(v60, "customAudioItems");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "_collapse:views:", 0, v61);

    v62 = objc_loadWeakRetained(v3);
    objc_msgSend(v62, "customDisplayModeItems");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "_collapse:views:", 0, v63);

  }
  objc_msgSend(*(id *)(a1 + 32), "performCoordinatedAnimations");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (AVView)transportControlsContainerView
{
  return self->_transportControlsContainerView;
}

- (AVPlaybackControlsViewVisibilityDelegate)visibilityDelegate
{
  return (AVPlaybackControlsViewVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_visibilityDelegate);
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41) || *(_BYTE *)(a1 + 42) || *(_BYTE *)(a1 + 43) != 0;
  if (*(_BYTE *)(a1 + 44)
    && (objc_msgSend(*(id *)(a1 + 32), "avkit_isBeingPresented") & 1) == 0
    && !*(_BYTE *)(a1 + 40))
  {
LABEL_10:
    if (!*(_BYTE *)(a1 + 42))
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "fullScreenButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersFullScreenButtonIncluded"));

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersDoneButtonIncluded"));

  objc_msgSend(*(id *)(a1 + 32), "pictureInPictureButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersPiPButtonIncluded"));

  objc_msgSend(*(id *)(a1 + 32), "videoGravityButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersVideoGravityButtonIncluded"));

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  if (!*(_BYTE *)(a1 + 40))
  {
    v2 = 1;
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_preferredArrangedDisplayModeViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "screenModeControls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v2 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArrangedSubviews:", v10);

  v11 = *(void **)(a1 + 32);
  v12 = *(unsigned __int8 *)(a1 + 45);
  objc_msgSend(v11, "defaultDisplayModeControls");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_collapse:views:", v12, v13);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "customDisplayModeItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_collapse:views:", 0, v15);

LABEL_12:
  if (*(_BYTE *)(a1 + 41) || *(_BYTE *)(a1 + 46) && !*(_BYTE *)(a1 + 47) || *(_BYTE *)(a1 + 42) && !*(_BYTE *)(a1 + 47))
  {
    objc_msgSend(*(id *)(a1 + 32), "_preferredArrangedAudioModeViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "volumeControls");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setArrangedSubviews:", v19);

    v20 = *(void **)(a1 + 32);
    v21 = objc_msgSend(v20, "includesAudioControlsContainer") ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "defaultAudioControls");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_collapse:views:", v21, v22);

    v23 = *(void **)(a1 + 32);
    objc_msgSend(v23, "customAudioItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_collapse:views:", 0, v24);

    objc_msgSend(*(id *)(a1 + 32), "volumeSlider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersVolumeSliderExpandedAutomatically"));

    objc_msgSend(*(id *)(a1 + 32), "volumeButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLongPressEnabled:", objc_msgSend(*(id *)(a1 + 32), "prefersVolumeSliderExpandedAutomatically") ^ 1);

LABEL_14:
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    return;
  }
  if (v2)
    goto LABEL_14;
}

- (void)_collapse:(BOOL)a3 views:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AVPlaybackControlsView _collapse:view:](self, "_collapse:view:", v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_collapse:(BOOL)a3 view:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setCollapsed:", v4);
  else
    objc_msgSend(v5, "setHidden:", v4);

}

- (AVButton)pictureInPictureButton
{
  return self->_pictureInPictureButton;
}

- (AVButton)fullScreenButton
{
  return self->_fullScreenButton;
}

- (AVButton)videoGravityButton
{
  return self->_videoGravityButton;
}

- (BOOL)prefersVolumeSliderExpandedAutomatically
{
  return self->_prefersVolumeSliderExpandedAutomatically;
}

- (id)_preferredArrangedAudioModeViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E40];
  -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView defaultAudioControls](self, "defaultAudioControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)customAudioItems
{
  return self->_customAudioItems;
}

- (NSArray)defaultAudioControls
{
  return self->_defaultAudioControls;
}

- (BOOL)prefersVideoGravityButtonIncluded
{
  return self->_prefersVideoGravityButtonIncluded;
}

- (BOOL)prefersPiPButtonIncluded
{
  return self->_prefersPiPButtonIncluded;
}

- (BOOL)prefersFullScreenButtonIncluded
{
  return self->_prefersFullScreenButtonIncluded;
}

- (BOOL)prefersDoneButtonIncluded
{
  return self->_prefersDoneButtonIncluded;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double Width;
  void *v14;
  double Height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double MidX;
  void *v28;
  double MidY;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  int64_t v90;
  BOOL v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  _BOOL4 v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t n;
  BOOL v138;
  double *v139;
  void *v140;
  void *v141;
  double v142;
  _BOOL8 v143;
  void *v144;
  double v145;
  void *v146;
  void *v147;
  int64_t v148;
  void *v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  double v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  uint64_t v181;
  double v182;
  double v185;
  double v189;
  double v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  double v195;
  double v196;
  void *v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  double v208;
  double v209;
  uint64_t v210;
  void *v211;
  double v212;
  double v213;
  void *v214;
  void *v215;
  double v216;
  double v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  objc_super v238;
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint64_t v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;

  v244 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v238.receiver = self;
  v238.super_class = (Class)AVPlaybackControlsView;
  -[AVPlaybackControlsView layoutSubviews](&v238, sel_layoutSubviews);
  if (-[AVPlaybackControlsView needsIntialLayout](self, "needsIntialLayout"))
    return;
  -[AVPlaybackControlsView styleSheet](self, "styleSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView _updateDoubleRowLayoutEnabled](self, "_updateDoubleRowLayoutEnabled");
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  -[AVPlaybackControlsView _playbackControlsViewItems](self, "_playbackControlsViewItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v234, v243, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v235;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v235 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v234 + 1) + 8 * i), "setHasFullScreenAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v234, v243, 16);
    }
    while (v6);
  }

  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasAlternateAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));

  -[AVPlaybackControlsView _updateLayoutMargins](self, "_updateLayoutMargins");
  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutFrame");
  objc_msgSend(v10, "setFrame:");

  -[AVPlaybackControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutFrame");
  Width = CGRectGetWidth(v245);

  -[AVPlaybackControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutFrame");
  Height = CGRectGetHeight(v246);

  objc_msgSend(v3, "defaultItemInlineSize");
  if (v16 >= Width)
    v17 = v16;
  else
    v17 = Width;
  objc_msgSend(v3, "maximumProminentPlayButtonDimension");
  if (v17 >= v18)
    v17 = v18;
  objc_msgSend(v3, "minimumProminentPlayButtonDimension");
  if (v19 >= Height)
    v20 = v19;
  else
    v20 = Height;
  objc_msgSend(v3, "maximumProminentPlayButtonDimension");
  if (v20 < v21)
    v21 = v20;
  if (v17 >= v21)
    v17 = v21;
  -[AVPlaybackControlsView prominentPlayButton](self, "prominentPlayButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExtrinsicContentSize:", v17, v17);

  -[AVPlaybackControlsView prominentPlayButton](self, "prominentPlayButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultItemInlineSize");
  objc_msgSend(v23, "setHasAlternateAppearance:", v17 < v24);

  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", 0.0, 0.0, v17, v17);

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  MidX = CGRectGetMidX(v247);
  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  MidY = CGRectGetMidY(v248);

  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCenter:", MidX, MidY);

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    objc_msgSend(v3, "defaultItemFullScreenSize");
  else
    objc_msgSend(v3, "defaultItemInlineSize");
  v33 = v31;
  v34 = v32;
  -[AVPlaybackControlsView doneButton](self, "doneButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setExtrinsicContentSize:", v33, v34);

  -[AVPlaybackControlsView doneButton](self, "doneButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPrefersSecondaryMaterialOverlay:", 1);

  -[AVPlaybackControlsView fullScreenButton](self, "fullScreenButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setExtrinsicContentSize:", v33, v34);

  -[AVPlaybackControlsView pictureInPictureButton](self, "pictureInPictureButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setExtrinsicContentSize:", v33, v34);

  v232 = 0u;
  v233 = 0u;
  v230 = 0u;
  v231 = 0u;
  -[AVPlaybackControlsView customDisplayModeItems](self, "customDisplayModeItems");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v230, v242, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v231;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v231 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * j), "setExtrinsicContentSize:", v33, v34);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v230, v242, 16);
    }
    while (v42);
  }

  -[AVPlaybackControlsView volumeButton](self, "volumeButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutAttributes");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDisplayPriority:", 4);

  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layoutAttributes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDisplayPriority:", 3);

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
  {
    -[AVPlaybackControlsView videoGravityButton](self, "videoGravityButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setExtrinsicContentSize:", v33, v34);

    -[AVPlaybackControlsView volumeButton](self, "volumeButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isIncluded");
    objc_msgSend(v3, "defaultItemFullScreenSize");
    if (v52)
    {
      v55 = v54 + 1.0;
      objc_msgSend(v3, "defaultItemFullScreenSize");
    }
    else
    {
      v55 = v53;
    }
    objc_msgSend(v50, "setExtrinsicContentSize:", v55);

    -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v70, "count") > 1)
    {
      v72 = 1;
    }
    else
    {
      -[AVPlaybackControlsView volumeButton](self, "volumeButton");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isCollapsedOrExcluded") ^ 1;

    }
    v228 = 0u;
    v229 = 0u;
    v226 = 0u;
    v227 = 0u;
    -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v226, v241, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v227;
      do
      {
        for (k = 0; k != v75; ++k)
        {
          if (*(_QWORD *)v227 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * k);
          objc_msgSend(v3, "defaultItemFullScreenSize");
          objc_msgSend(v78, "setExtrinsicContentSize:");
          objc_msgSend(v78, "layoutAttributes");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setPrefersSecondaryMaterialOverlay:", v72);

          -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setIncluded:", objc_msgSend(v80, "isIncluded") ^ 1);

        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v226, v241, 16);
      }
      while (v75);
    }

    -[AVPlaybackControlsView traitCollection](self, "traitCollection");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "horizontalSizeClass") == 1)
    {
      -[AVPlaybackControlsView bounds](self, "bounds");
      v82 = CGRectGetHeight(v249);
      -[AVPlaybackControlsView bounds](self, "bounds");
      v83 = CGRectGetWidth(v250);

      if (v82 > v83)
      {
        -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "volumeSliderCompactFullScreenWidth");
LABEL_58:
        v85 = v84;
        objc_msgSend(v3, "defaultItemFullScreenSize");
        objc_msgSend(v62, "setExtrinsicContentSize:", v85);
        goto LABEL_59;
      }
    }
    else
    {

    }
    -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "volumeSliderRegularFullScreenWidth");
    goto LABEL_58;
  }
  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeSliderInlineWidth");
  v58 = v57;
  objc_msgSend(v3, "defaultItemInlineSize");
  objc_msgSend(v56, "setExtrinsicContentSize:", v58);

  -[AVPlaybackControlsView volumeButton](self, "volumeButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultItemInlineSize");
  v61 = v60;
  objc_msgSend(v3, "defaultItemInlineSize");
  objc_msgSend(v59, "setExtrinsicContentSize:", v61);

  v224 = 0u;
  v225 = 0u;
  v222 = 0u;
  v223 = 0u;
  -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v222, v240, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v223;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v223 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * m);
        objc_msgSend(v3, "defaultItemInlineSize");
        v69 = v68;
        objc_msgSend(v3, "defaultItemInlineSize");
        objc_msgSend(v67, "setExtrinsicContentSize:", v69);
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v222, v240, 16);
    }
    while (v64);
  }
LABEL_59:

  if (-[AVPlaybackControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
  {
    objc_msgSend(v3, "maximumMultiRowTransportControlsWidth");
    if (v86 >= Width)
      v86 = Width;
    goto LABEL_74;
  }
  -[AVPlaybackControlsView traitCollection](self, "traitCollection");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v87, "horizontalSizeClass") != 2)
    goto LABEL_70;
  -[AVPlaybackControlsView traitCollection](self, "traitCollection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v88, "verticalSizeClass") != 2)
  {

LABEL_70:
    goto LABEL_71;
  }
  v89 = -[AVPlaybackControlsView isFullScreen](self, "isFullScreen");

  if (v89)
  {
    objc_msgSend(v3, "maximumTransportControlsWidth");
    if (Width < v86)
      v86 = Width;
    goto LABEL_74;
  }
LABEL_71:
  v90 = -[AVPlaybackControlsView preferredUnobscuredArea](self, "preferredUnobscuredArea");
  v86 = Width;
  if (v90 == 1)
  {
    v91 = -[AVPlaybackControlsView isFullScreen](self, "isFullScreen", Width);
    v86 = Width;
    if (!v91)
      objc_msgSend(v3, "minimumSingleButtonTransportControlsWidth", Width);
  }
LABEL_74:
  if (v86 >= Width)
    v92 = Width;
  else
    v92 = v86;
  objc_msgSend(v3, "minimumTransportControlsWidth");
  if (v92 <= v93)
  {
    objc_msgSend(v3, "minimumSingleButtonTransportControlsWidth");
    v92 = v94;
  }
  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    objc_msgSend(v3, "defaultItemFullScreenSize");
  else
    objc_msgSend(v3, "defaultItemInlineSize");
  v96 = v95;
  v97 = -[AVPlaybackControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
  v98 = 1.0;
  if (v97)
    v98 = 2.0;
  v99 = v96 * v98;
  if (-[AVPlaybackControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
  {
    -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "layoutHeightThatFitsRowsStartingWithRow:", 0);
    v102 = v101;

    if (v102 >= v99)
      v99 = v102;
  }
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setExtrinsicContentSize:", v92, v99);

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    objc_msgSend(v3, "defaultItemFullScreenSize");
  else
    objc_msgSend(v3, "defaultItemInlineSize");
  v105 = v104;
  -[AVPlaybackControlsView standardPlayPauseButton](self, "standardPlayPauseButton");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView skipBackButton](self, "skipBackButton");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView skipForwardButton](self, "skipForwardButton");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView startRightwardContentTransitionButton](self, "startRightwardContentTransitionButton");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView mediaSelectionButton](self, "mediaSelectionButton");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView controlOverflowButton](self, "controlOverflowButton");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setExtrinsicContentSize:", 0.0, v105);

  -[AVPlaybackControlsView playbackSpeedButton](self, "playbackSpeedButton");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setExtrinsicContentSize:", 0.0, v105);

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    objc_msgSend(v3, "routePickerButtonFullScreenSize");
  else
    objc_msgSend(v3, "routePickerButtonInlineSize");
  v116 = v114;
  v117 = v115;
  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    objc_msgSend(v3, "audioRoutePickerFullScreenSize");
  else
    objc_msgSend(v3, "routePickerButtonInlineSize");
  v120 = v118;
  v121 = v119;
  -[AVPlaybackControlsView routePickerView](self, "routePickerView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v122, "prioritizesVideoDevices");

  -[AVPlaybackControlsView routePickerView](self, "routePickerView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    objc_msgSend(v124, "setExtrinsicContentSize:", v116, v117);

    -[AVPlaybackControlsView routePickerView](self, "routePickerView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "customButton");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "micaPackage");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    v129 = v116;
    v130 = v117;
  }
  else
  {
    objc_msgSend(v124, "setExtrinsicContentSize:", v120, v121);

    -[AVPlaybackControlsView routePickerView](self, "routePickerView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "customButton");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "micaPackage");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    v129 = v120;
    v130 = v121;
  }
  objc_msgSend(v127, "setTargetSize:", v129, v130);

  -[AVPlaybackControlsView routePickerView](self, "routePickerView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "customButton");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setHasFullScreenAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));

  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  -[AVPlaybackControlsView customMediaItems](self, "customMediaItems");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v218, v239, 16);
  if (v134)
  {
    v135 = v134;
    v136 = *(_QWORD *)v219;
    do
    {
      for (n = 0; n != v135; ++n)
      {
        if (*(_QWORD *)v219 != v136)
          objc_enumerationMutation(v133);
        objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * n), "setExtrinsicContentSize:", 0.0, v105);
      }
      v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v218, v239, 16);
    }
    while (v135);
  }

  v138 = -[AVPlaybackControlsView isFullScreen](self, "isFullScreen");
  v139 = (double *)MEMORY[0x1E0DC3298];
  if (v138)
    goto LABEL_119;
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v140, "isIncluded"))
  {
    -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "extrinsicContentSize");
    if (v142 <= Width)
    {
      -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "extrinsicContentSize");
      v143 = v145 > Height;

    }
    else
    {
      v143 = 1;
    }

  }
  else
  {
    v143 = 1;
  }

  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setCollapsed:", v143);

  -[AVPlaybackControlsView prominentPlayButton](self, "prominentPlayButton");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v147, "isCollapsedOrExcluded") & 1) != 0)
  {

  }
  else
  {
    v148 = -[AVPlaybackControlsView preferredUnobscuredArea](self, "preferredUnobscuredArea");

    if (v148 != 2)
    {
      -[AVPlaybackControlsView prominentPlayButton](self, "prominentPlayButton");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = v149;
      v151 = -Height;
      v152 = -Width;
      v153 = -Height;
      v154 = -Width;
      goto LABEL_118;
    }
  }
  -[AVPlaybackControlsView prominentPlayButton](self, "prominentPlayButton");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v149;
  v151 = *v139;
  v152 = v139[1];
  v153 = v139[2];
  v154 = v139[3];
LABEL_118:
  objc_msgSend(v149, "setHitRectInsets:", v151, v152, v153, v154);

  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "setNeedsLayout");

LABEL_119:
  -[AVPlaybackControlsView _updateTransportControlsFrame](self, "_updateTransportControlsFrame");
  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = Width;
  if (objc_msgSend(v156, "isIncluded"))
  {
    -[AVPlaybackControlsView styleSheet](self, "styleSheet");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "volumeSliderPadding");
    v157 = Width - v159;

  }
  objc_msgSend(v3, "standardInteritemPadding");
  v161 = v160;
  if (-[AVPlaybackControlsView preferredUnobscuredArea](self, "preferredUnobscuredArea") == 2)
  {
    if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
      objc_msgSend(v3, "standardPaddingFullScreen");
    else
      objc_msgSend(v3, "standardPaddingInline");
    v164 = v162;
    objc_msgSend(v3, "maximumProminentPlayButtonDimension");
    v163 = v165 + v164 * 2.0;
  }
  else
  {
    v163 = v99 + v161;
  }
  v166 = Height - v163;
  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "prioritizedSizeThatFitsSize:", v157, v166);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "prioritizedSizeThatFitsSize:", v157, v166);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVPrioritizedSize sizesResolvingFirstPrioritizedSize:secondPrioritizedSize:inAvailableWidth:](AVPrioritizedSize, "sizesResolvingFirstPrioritizedSize:secondPrioritizedSize:inAvailableWidth:", v168, v170, v157);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "objectAtIndexedSubscript:", 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "CGSizeValue");
  v217 = v173;
  v175 = v174;

  objc_msgSend(v171, "objectAtIndexedSubscript:", 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "CGSizeValue");
  v178 = v177;
  v180 = v179;
  v181 = *(_QWORD *)&v179;

  if (v175 >= v180)
    v182 = v180;
  else
    v182 = v175;
  if ((v181 <= -1 || ((v181 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(v181 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    v185 = v175;
  }
  else
  {
    v185 = v182;
  }
  if ((*(uint64_t *)&v185 > -1 && ((*(_QWORD *)&v185 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
     || (unint64_t)(*(_QWORD *)&v185 - 1) < 0xFFFFFFFFFFFFFLL)
    && v185 < v180)
  {
    v189 = v185;
  }
  else
  {
    v189 = v180;
  }
  if (-[AVPlaybackControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    v190 = Width - v178;
  else
    v190 = 0.0;
  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setCollapsed:", v189 > v166);

  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setFrame:", v190, 0.0, v178, v189);

  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "setNeedsLayout");

  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "extrinsicContentSize");
  v196 = v195;
  -[AVPlaybackControlsView volumeButton](self, "volumeButton");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "extrinsicContentSize");
  v199 = v198;

  v200 = *v139;
  v201 = v139[1];
  v202 = v139[2];
  v203 = v139[3];
  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v197) = objc_msgSend(v204, "isIncluded");

  if ((_DWORD)v197)
  {
    v205 = v196 + v199;
    v206 = v217;
    if (v217 >= v205)
    {
      -[AVPlaybackControlsView styleSheet](self, "styleSheet");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "volumeSliderPadding");
      v216 = v166;
      v209 = v208;

      v210 = -[AVPlaybackControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      -[AVPlaybackControlsView styleSheet](self, "styleSheet");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "volumeSliderPadding");
      v213 = v212;

      if (v210 == 1)
        v203 = v213;
      else
        v201 = v213;
      v206 = v217 + v209;
      v166 = v216;
    }
  }
  else
  {
    v206 = v217;
  }
  -[AVPlaybackControlsView volumeControls](self, "volumeControls", *(_QWORD *)&v216);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setContentLayoutMargins:", v200, v201, v202, v203);

  -[AVPlaybackControlsView _updateVolumeControlsWithSize:](self, "_updateVolumeControlsWithSize:", v206, v185);
  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "setCollapsed:", v185 > v166);

  kdebug_trace();
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (AVTransportControlsView)transportControlsView
{
  return self->_transportControlsView;
}

- (AVLayoutView)screenModeControls
{
  return self->_screenModeControls;
}

- (AVVolumeButtonControl)volumeButton
{
  return self->_volumeButton;
}

- (AVVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (AVButton)prominentPlayButton
{
  return self->_prominentPlayButton;
}

- (AVButton)doneButton
{
  return self->_doneButton;
}

- (AVPlaybackControlsRoutePickerView)routePickerView
{
  return self->_routePickerView;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (BOOL)isDoubleRowLayoutEnabled
{
  return self->_doubleRowLayoutEnabled;
}

- (BOOL)needsIntialLayout
{
  return self->_needsIntialLayout;
}

- (id)_preferredArrangedDisplayModeViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E40];
  -[AVPlaybackControlsView defaultDisplayModeControls](self, "defaultDisplayModeControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView customDisplayModeItems](self, "customDisplayModeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)customDisplayModeItems
{
  return self->_customDisplayModeItems;
}

- (NSArray)defaultDisplayModeControls
{
  return self->_defaultDisplayModeControls;
}

- (AVControlOverflowButton)controlOverflowButton
{
  return self->_controlOverflowButton;
}

- (AVButton)mediaSelectionButton
{
  return self->_mediaSelectionButton;
}

- (BOOL)includesCustomDisplayModeControls
{
  BOOL v3;
  void *v4;

  if (-[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton"))
    return 0;
  -[AVPlaybackControlsView customDisplayModeItems](self, "customDisplayModeItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)_updateLayoutMargins
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  double v30;
  double v31;
  id v32;

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen")
    || (-[AVPlaybackControlsView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    -[AVPlaybackControlsView styleSheet](self, "styleSheet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView keyboardHeight](self, "keyboardHeight");
    objc_msgSend(v18, "playbackControlsViewLayoutMarginsForView:keyboardHeight:isFullScreen:", self, -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"), v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[AVPlaybackControlsView layoutMargins](self, "layoutMargins");
    if (v23 != v31 || v21 != v28 || v27 != v30 || v25 != v29)
      -[AVPlaybackControlsView setLayoutMargins:](self, "setLayoutMargins:", v21, v23, v25, v27);
  }
  else
  {
    -[AVPlaybackControlsView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AVPlaybackControlsView layoutMargins](self, "layoutMargins");
    if (v8 != v16 || v6 != v13 || v12 != v15)
    {

LABEL_15:
      -[AVPlaybackControlsView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UIEdgeInsetsValue");
      -[AVPlaybackControlsView setLayoutMargins:](self, "setLayoutMargins:");

      return;
    }
    v17 = v14;

    if (v10 != v17)
      goto LABEL_15;
  }
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (void)_updateDoubleRowLayoutEnabled
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double Width;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[AVPlaybackControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
  if (!-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
    goto LABEL_7;
  -[AVPlaybackControlsView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    -[AVPlaybackControlsView bounds](self, "bounds");
    Width = CGRectGetWidth(v21);
    -[AVPlaybackControlsView bounds](self, "bounds");
    v10 = Width < CGRectGetHeight(v22);
    goto LABEL_11;
  }
  -[AVPlaybackControlsView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 1)
  {
LABEL_7:
    if (!v3)
      return;
    v10 = 0;
    goto LABEL_12;
  }
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customContentTransitioningInfoPanel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[AVPlaybackControlsView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "horizontalSizeClass") == 1;

LABEL_11:
    if (v3 == v10)
      return;
    goto LABEL_12;
  }
  if (v3)
    return;
  v10 = 1;
LABEL_12:
  _AVLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    _AVMethodProem(self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 1024;
    v19 = v10;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v16, 0x12u);

  }
  -[AVPlaybackControlsView setDoubleRowLayoutEnabled:](self, "setDoubleRowLayoutEnabled:", v10);
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDoubleRowLayoutEnabled:", v10);

}

- (id)_playbackControlsViewItems
{
  AVButton *pictureInPictureButton;
  AVTransportControlsView *transportControlsView;
  AVPlaybackControlsRoutePickerView *routePickerView;
  AVButton *mediaSelectionButton;
  AVControlOverflowButton *controlOverflowButton;
  AVButton *playbackSpeedButton;
  AVButton *standardPlayPauseButton;
  AVButton *fullScreenButton;
  AVButton *videoGravityButton;
  AVButton *prominentPlayButton;
  AVButton *skipForwardButton;
  AVButton *skipBackButton;
  AVButton *startLeftwardContentTransitionButton;
  AVVolumeButtonControl *volumeButton;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[18];

  v25[17] = *MEMORY[0x1E0C80C00];
  pictureInPictureButton = self->_pictureInPictureButton;
  transportControlsView = self->_transportControlsView;
  routePickerView = self->_routePickerView;
  mediaSelectionButton = self->_mediaSelectionButton;
  controlOverflowButton = self->_controlOverflowButton;
  playbackSpeedButton = self->_playbackSpeedButton;
  standardPlayPauseButton = self->_standardPlayPauseButton;
  v25[0] = self->_doneButton;
  v25[1] = pictureInPictureButton;
  fullScreenButton = self->_fullScreenButton;
  v25[2] = transportControlsView;
  v25[3] = routePickerView;
  videoGravityButton = self->_videoGravityButton;
  v25[4] = mediaSelectionButton;
  v25[5] = controlOverflowButton;
  prominentPlayButton = self->_prominentPlayButton;
  v25[6] = playbackSpeedButton;
  v25[7] = standardPlayPauseButton;
  skipForwardButton = self->_skipForwardButton;
  v25[8] = fullScreenButton;
  v25[9] = videoGravityButton;
  skipBackButton = self->_skipBackButton;
  v25[10] = prominentPlayButton;
  v25[11] = skipForwardButton;
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v25[12] = skipBackButton;
  v25[13] = startLeftwardContentTransitionButton;
  volumeButton = self->_volumeButton;
  v25[14] = self->_startRightwardContentTransitionButton;
  v25[15] = volumeButton;
  v25[16] = self->_volumeSlider;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView customDisplayModeItems](self, "customDisplayModeItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlaybackControlsView customMediaItems](self, "customMediaItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)reevaluateHiddenStateForContainersAndSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", v3);

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", v4);

  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", v5);

  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", v6);

  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reevaluateHiddenStateOfAllItems");

  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reevaluateHiddenStateOfAllItems");

  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reevaluateHiddenStateOfAllItems");

  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reevaluateHiddenStateOfAllItems");

}

- (void)avkit_reevaluateHiddenStateOfItem:(id)a3
{
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isCollapsedOrExcluded");
  v5 = 1.0;
  if ((_DWORD)v4)
    v5 = 0.0;
  objc_msgSend(v12, "setAlpha:", v5);
  -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isRunning") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
  {

    if ((v4 & 1) == 0)
    {
      v7 = v12;
      v8 = 0;
LABEL_12:
      objc_msgSend(v7, "setHidden:", v8);
      goto LABEL_13;
    }
  }
  else
  {

  }
  -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isRunning") & 1) != 0)
  {

LABEL_13:
    v11 = v12;
    goto LABEL_14;
  }
  v10 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");

  v11 = v12;
  if ((v10 & 1) == 0)
  {
    v7 = v12;
    v8 = v4;
    goto LABEL_12;
  }
LABEL_14:

}

- (UIViewPropertyAnimator)playbackControlsVisibilityAnimator
{
  return self->_playbackControlsVisibilityAnimator;
}

- (AVLayoutView)prominentPlayButtonContainerView
{
  return self->_prominentPlayButtonContainerView;
}

- (void)_updateVolumeControlsWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  void *v12;
  char v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double MinY;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double MinX;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a3.height;
  width = a3.width;
  v45 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[AVPlaybackControlsView customAudioItems](self, "customAudioItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "isCollapsed"))
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCollapsedOrExcluded");

  v14 = -44.0;
  if ((v11 & 1) == 0 && (v13 & 1) == 0)
  {
    -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v16 = CGRectGetWidth(v46);
    -[AVPlaybackControlsView volumeSlider](self, "volumeSlider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v19 = v16 * (v18 + -1.0);

    v20 = v19 * 0.5;
    if (v19 <= -44.0)
      v20 = -22.0;
    v14 = fmin(v20, 0.0);
  }
  -[AVPlaybackControlsView volumeButton](self, "volumeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHitRectInsets:", -16.0, v14, -24.0, -16.0);

  if (-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
  {
    -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isHiddenOrHasHiddenAncestor"))
    {
      -[AVPlaybackControlsView window](self, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "windowScene");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "statusBarManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isStatusBarHidden"))
      {
        -[AVPlaybackControlsView traitCollection](self, "traitCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "displayCornerRadius");
        v28 = v27;

        if (v28 == 0.0)
        {
          -[AVPlaybackControlsView frame](self, "frame");
          MinY = CGRectGetMinY(v47);
          -[AVPlaybackControlsView styleSheet](self, "styleSheet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "standardPaddingFullScreen");
          v32 = MinY + v31;
LABEL_23:

          goto LABEL_27;
        }
        goto LABEL_26;
      }

    }
    goto LABEL_26;
  }
  if (-[AVPlaybackControlsView preferredUnobscuredArea](self, "preferredUnobscuredArea") == 1)
  {
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = CGRectGetMaxY(v48) - height;
    goto LABEL_23;
  }
LABEL_26:
  -[AVPlaybackControlsView layoutMargins](self, "layoutMargins");
  v32 = v33;
LABEL_27:
  if (-[AVPlaybackControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[AVPlaybackControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutFrame");
    MinX = CGRectGetMinX(v49);
  }
  else
  {
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    MinX = CGRectGetMaxX(v50) - width;
  }

  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", MinX, v32, width, height);

  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  objc_msgSend(v37, "setFrame:");

  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNeedsLayout");

}

- (AVLayoutView)volumeControls
{
  return self->_volumeControls;
}

- (AVButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (AVButton)skipBackButton
{
  return self->_skipBackButton;
}

- (AVButton)standardPlayPauseButton
{
  return self->_standardPlayPauseButton;
}

- (AVButton)startRightwardContentTransitionButton
{
  return self->_startRightwardContentTransitionButton;
}

- (AVButton)startLeftwardContentTransitionButton
{
  return self->_startLeftwardContentTransitionButton;
}

- (AVButton)playbackSpeedButton
{
  return self->_playbackSpeedButton;
}

- (void)setPrefersVolumeSliderExpandedAutomatically:(BOOL)a3
{
  self->_prefersVolumeSliderExpandedAutomatically = a3;
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSValue isEqualToValue:](self->_overrideLayoutMarginsWhenEmbeddedInline, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
    if (!-[AVPlaybackControlsView isFullScreen](self, "isFullScreen"))
      -[AVPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setFullScreen:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_fullScreen != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVPlaybackControlsView setFullScreen:]";
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    self->_fullScreen = v3;
    -[AVPlaybackControlsView _updateLayoutMargins](self, "_updateLayoutMargins");
    -[AVPlaybackControlsView _updateDoubleRowLayoutEnabled](self, "_updateDoubleRowLayoutEnabled");
    -[AVPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setupInitialLayout
{
  if (-[AVPlaybackControlsView needsIntialLayout](self, "needsIntialLayout"))
    -[AVPlaybackControlsView _setupInitialLayout](self, "_setupInitialLayout");
}

- (void)setVisibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibilityDelegate, a3);
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  self->_preferredUnobscuredArea = a3;
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  CGAffineTransform *p_overrideTransformForProminentPlayButton;
  __int128 v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  p_overrideTransformForProminentPlayButton = &self->_overrideTransformForProminentPlayButton;
  v5 = *(_OWORD *)&a3->c;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c = v5;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx = v4;
  -[AVPlaybackControlsView prominentPlayButtonContainerView](self, "prominentPlayButtonContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&p_overrideTransformForProminentPlayButton->c;
  v8[0] = *(_OWORD *)&p_overrideTransformForProminentPlayButton->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&p_overrideTransformForProminentPlayButton->tx;
  objc_msgSend(v6, "setTransform:", v8);

}

- (void)setCustomControlItems:(id)a3 animations:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *customControlItems;
  void *v9;
  NSArray *v10;
  NSArray *customMediaItems;
  void *v12;
  NSArray *v13;
  NSArray *customDisplayModeItems;
  void *v15;
  NSArray *v16;
  NSArray *customAudioItems;
  id v18;

  v18 = a3;
  v6 = a4;
  if (!-[NSArray isEqualToArray:](self->_customControlItems, "isEqualToArray:", v18))
  {
    v7 = (NSArray *)objc_msgSend(v18, "copy");
    customControlItems = self->_customControlItems;
    self->_customControlItems = v7;

    -[AVPlaybackControlsView customControlItems](self, "customControlItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView _playbackControlsViewsForControlItems:withType:](self, "_playbackControlsViewsForControlItems:withType:", v9, 2);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customMediaItems = self->_customMediaItems;
    self->_customMediaItems = v10;

    -[AVPlaybackControlsView customControlItems](self, "customControlItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView _playbackControlsViewsForControlItems:withType:](self, "_playbackControlsViewsForControlItems:withType:", v12, 0);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customDisplayModeItems = self->_customDisplayModeItems;
    self->_customDisplayModeItems = v13;

    -[AVPlaybackControlsView customControlItems](self, "customControlItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView _playbackControlsViewsForControlItems:withType:](self, "_playbackControlsViewsForControlItems:withType:", v15, 1);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customAudioItems = self->_customAudioItems;
    self->_customAudioItems = v16;

    -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", 1, v6);
  }

}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (id)_playbackControlsViewsForControlItems:(id)a3 withType:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (objc_msgSend(v11, "type") == a4)
        {
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v12, "conformsToProtocol:", &unk_1EEC9B670))
            goto LABEL_10;
          objc_msgSend(v11, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EEC9B4F0);

          if (!v14)
            goto LABEL_11;
          objc_msgSend(v11, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v15);

          objc_msgSend(v11, "image");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(v11, "title");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              goto LABEL_16;
          }
          else
          {
LABEL_10:

          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v17;
    }
    while (v17);
  }
LABEL_16:

  v18 = (void *)objc_msgSend(v20, "copy");
  return v18;
}

- (void)setIncludedContainers:(int64_t)a3 animations:(id)a4
{
  if (self->_includedContainers != a3)
  {
    self->_includedContainers = a3;
    -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", 1, a4);
  }
}

- (void)animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a3 appearingViews:(id)a4 disappearingViews:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  char v22;
  char v23;
  _QWORD v24[5];
  id v25;
  char v26;
  char v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AVPlaybackControlsView _isInAWindow](self, "_isInAWindow")
    && (-[AVPlaybackControlsView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0)
  {
    -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "containsObject:", v11);

    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "containsObject:", v13);

    -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "containsObject:", v15);

    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "containsObject:", v17);

    objc_initWeak(&location, self);
    v19 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke;
    v24[3] = &unk_1E5BB25E8;
    objc_copyWeak(&v25, &location);
    v26 = v14;
    v27 = v12;
    v24[4] = self;
    v20[0] = v19;
    v20[1] = 3221225472;
    v20[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_4;
    v20[3] = &unk_1E5BB2610;
    v22 = v16;
    v23 = v18;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "addCoordinatedAnimations:completion:", v24, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "volumeSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setIncluded:", objc_msgSend(v4, "prefersVolumeSliderExpandedAutomatically"));

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "volumeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setLongPressEnabled:", objc_msgSend(v7, "prefersVolumeSliderExpandedAutomatically") ^ 1);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "screenModeControls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v1);
  objc_msgSend(v10, "_preferredArrangedDisplayModeViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArrangedSubviews:", v13);

  v14 = objc_loadWeakRetained(v1);
  objc_msgSend(v14, "volumeControls");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained(v1);
  objc_msgSend(v16, "_preferredArrangedAudioModeViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setArrangedSubviews:", v19);

}

- (void)_setupInitialLayout
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AVView *transportControlsContainerView;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[AVPlaybackControlsView needsIntialLayout](self, "needsIntialLayout"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "%@ called when initial layout not needed already set.", buf, 0xCu);

    }
  }
  -[AVPlaybackControlsView setNeedsIntialLayout:](self, "setNeedsIntialLayout:", 0);
  -[AVPlaybackControlsView setEdgesInsettingLayoutMarginsFromSafeArea:](self, "setEdgesInsettingLayoutMarginsFromSafeArea:", 0);
  -[AVPlaybackControlsView _updateLayoutMargins](self, "_updateLayoutMargins");
  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView addSubview:](self, "addSubview:", v4);

  -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView layoutMarginsGuide](self, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  objc_msgSend(v5, "setFrame:");

  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView addSubview:](self, "addSubview:", v7);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  transportControlsContainerView = self->_transportControlsContainerView;
  v25[0] = self->_screenModeControls;
  v25[1] = transportControlsContainerView;
  v25[2] = self->_prominentPlayButtonContainerView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self->_screenModeControls);
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self->_prominentPlayButtonContainerView);
  -[AVPlaybackControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self->_volumeControlsContainer);
  -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[AVPlaybackControlsView transportControlsContainerView](self, "transportControlsContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

}

- (void)setNeedsIntialLayout:(BOOL)a3
{
  self->_needsIntialLayout = a3;
}

- (AVPlaybackControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NSObject *v11;
  AVPlaybackControlsView *v12;
  AVPlaybackControlsView *v13;
  NSArray *customControlItems;
  NSArray *v15;
  NSArray *customDisplayModeItems;
  NSArray *customAudioItems;
  NSArray *customMediaItems;
  uint64_t v19;
  AVButton *doneButton;
  void *v21;
  uint64_t v22;
  AVButton *fullScreenButton;
  void *v24;
  void *v25;
  uint64_t v26;
  AVButton *videoGravityButton;
  void *v28;
  uint64_t v29;
  AVButton *pictureInPictureButton;
  void *v31;
  AVButton *v32;
  uint64_t v33;
  double v34;
  void *v35;
  AVButton *v36;
  void *v37;
  AVButton *v38;
  void *v39;
  uint64_t v40;
  NSArray *defaultDisplayModeControls;
  AVLayoutView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  AVLayoutView *screenModeControls;
  AVLayoutView *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  AVButton *prominentPlayButton;
  AVLayoutView *v57;
  AVLayoutView *prominentPlayButtonContainerView;
  AVLayoutView *v59;
  void *v60;
  void *v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  AVView *v70;
  AVView *transportControlsContainerView;
  AVTransportControlsView *v72;
  AVTransportControlsView *transportControlsView;
  uint64_t v74;
  AVPlaybackControlsRoutePickerView *routePickerView;
  uint64_t v76;
  AVButton *mediaSelectionButton;
  uint64_t v78;
  AVControlOverflowButton *controlOverflowButton;
  uint64_t v80;
  AVButton *playbackSpeedButton;
  uint64_t v82;
  AVButton *standardPlayPauseButton;
  uint64_t v84;
  AVButton *skipForwardButton;
  uint64_t v86;
  AVButton *skipBackButton;
  uint64_t v88;
  AVButton *startLeftwardContentTransitionButton;
  uint64_t v90;
  AVButton *startRightwardContentTransitionButton;
  uint64_t v92;
  AVScrubber *scrubber;
  AVVolumeButtonControl *v94;
  AVVolumeButtonControl *volumeButton;
  AVVolumeSlider *v96;
  AVVolumeSlider *volumeSlider;
  uint64_t v98;
  NSArray *defaultAudioControls;
  AVLayoutView *v100;
  AVLayoutView *volumeControls;
  AVLayoutView *v102;
  void *v103;
  AVTouchIgnoringView *v104;
  AVTouchIgnoringView *playbackControlsContainer;
  AVTouchIgnoringView *v106;
  AVTouchIgnoringView *volumeControlsContainer;
  AVObservationController *v108;
  AVObservationController *observationController;
  void *v110;
  double v112;
  CGRect v113;
  objc_super v114;
  NSArray *v115;
  _QWORD v116[2];
  AVButton *v117;
  void *v118;
  NSArray *v119;
  _QWORD v120[4];
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  int v124;
  __int16 v125;
  AVPlaybackControlsView *v126;
  uint64_t v127;
  CGRect v128;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v127 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v122 = "-[AVPlaybackControlsView initWithFrame:styleSheet:]";
    v123 = 1024;
    v124 = 83;
    v125 = 2048;
    v126 = self;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v114.receiver = self;
  v114.super_class = (Class)AVPlaybackControlsView;
  v12 = -[AVPlaybackControlsView initWithFrame:](&v114, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    -[AVPlaybackControlsView setHidden:](v12, "setHidden:", 1);
    customControlItems = v13->_customControlItems;
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
    v13->_customControlItems = (NSArray *)MEMORY[0x1E0C9AA60];

    customDisplayModeItems = v13->_customDisplayModeItems;
    v13->_customDisplayModeItems = v15;

    customAudioItems = v13->_customAudioItems;
    v13->_customAudioItems = v15;

    customMediaItems = v13->_customMediaItems;
    v13->_customMediaItems = v15;

    v13->_showsPlaybackControls = 1;
    objc_storeStrong((id *)&v13->_styleSheet, a4);
    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Done"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    doneButton = v13->_doneButton;
    v13->_doneButton = (AVButton *)v19;

    -[AVButton setIncluded:](v13->_doneButton, "setIncluded:", 0);
    -[AVButton setCollapsed:](v13->_doneButton, "setCollapsed:", 1);
    -[AVButton layoutAttributes](v13->_doneButton, "layoutAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDisplayPriority:", 2);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Full Screen"), 0);
    v22 = objc_claimAutoreleasedReturnValue();
    fullScreenButton = v13->_fullScreenButton;
    v13->_fullScreenButton = (AVButton *)v22;

    -[AVButton setIncluded:](v13->_fullScreenButton, "setIncluded:", 0);
    -[AVButton setCollapsed:](v13->_fullScreenButton, "setCollapsed:", 1);
    -[AVButton layoutAttributes](v13->_fullScreenButton, "layoutAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDisplayPriority:", 2);

    AVLocalizedString(CFSTR("Zoom"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", CFSTR("Zoom"), v25, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    videoGravityButton = v13->_videoGravityButton;
    v13->_videoGravityButton = (AVButton *)v26;

    -[AVButton setIncluded:](v13->_videoGravityButton, "setIncluded:", 0);
    -[AVButton setCollapsed:](v13->_videoGravityButton, "setCollapsed:", 1);
    -[AVButton layoutAttributes](v13->_videoGravityButton, "layoutAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDisplayPriority:", 2);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Picture in Picture"), 0);
    v29 = objc_claimAutoreleasedReturnValue();
    pictureInPictureButton = v13->_pictureInPictureButton;
    v13->_pictureInPictureButton = (AVButton *)v29;

    -[AVButton setIncluded:](v13->_pictureInPictureButton, "setIncluded:", 0);
    -[AVButton setCollapsed:](v13->_pictureInPictureButton, "setCollapsed:", 1);
    -[AVButton layoutAttributes](v13->_pictureInPictureButton, "layoutAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDisplayPriority:", 2);

    v32 = v13->_doneButton;
    v33 = *MEMORY[0x1E0DC4B58];
    v113.size.height = height;
    v34 = *MEMORY[0x1E0DC1430];
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC1430]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setFullScreenFont:](v32, "setFullScreenFont:", v35);

    v36 = v13->_videoGravityButton;
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", v33, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setFullScreenFont:](v36, "setFullScreenFont:", v37);

    v38 = v13->_pictureInPictureButton;
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", v33, v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setFullScreenFont:](v38, "setFullScreenFont:", v39);

    v120[0] = v13->_doneButton;
    v120[1] = v13->_fullScreenButton;
    v120[2] = v13->_pictureInPictureButton;
    v120[3] = v13->_videoGravityButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 4);
    v40 = objc_claimAutoreleasedReturnValue();
    defaultDisplayModeControls = v13->_defaultDisplayModeControls;
    v13->_defaultDisplayModeControls = (NSArray *)v40;

    v42 = [AVLayoutView alloc];
    v43 = *MEMORY[0x1E0C9D648];
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v46 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v112 = *MEMORY[0x1E0C9D648];
    v47 = -[AVLayoutView initWithFrame:](v42, "initWithFrame:", *MEMORY[0x1E0C9D648], v44, v45, v46);
    screenModeControls = v13->_screenModeControls;
    v13->_screenModeControls = (AVLayoutView *)v47;

    v49 = v13->_screenModeControls;
    v119 = v13->_defaultDisplayModeControls;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView setArrangedSubviews:](v49, "setArrangedSubviews:", v50);

    v113.origin.y = y;
    v113.size.width = width;
    v51 = *MEMORY[0x1E0DC3298];
    v52 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v113.origin.x = x;
    v53 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v54 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    -[AVLayoutView setContentLayoutMargins:](v13->_screenModeControls, "setContentLayoutMargins:", *MEMORY[0x1E0DC3298], v52, v53, v54);
    -[AVLayoutView setDebugIdentifier:](v13->_screenModeControls, "setDebugIdentifier:", CFSTR("ScreenModeControls"));
    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Central Play"), 0);
    v55 = objc_claimAutoreleasedReturnValue();
    prominentPlayButton = v13->_prominentPlayButton;
    v13->_prominentPlayButton = (AVButton *)v55;

    -[AVButton setClampsHitRectInsetsWhenContainedInScrollableView:](v13->_prominentPlayButton, "setClampsHitRectInsetsWhenContainedInScrollableView:", 1);
    v57 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v43, v44, v45, v46);
    prominentPlayButtonContainerView = v13->_prominentPlayButtonContainerView;
    v13->_prominentPlayButtonContainerView = v57;

    v59 = v13->_prominentPlayButtonContainerView;
    v117 = v13->_prominentPlayButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView setArrangedSubviews:](v59, "setArrangedSubviews:", v61);

    -[AVLayoutView setShapeStyle:](v13->_prominentPlayButtonContainerView, "setShapeStyle:", 1);
    -[AVLayoutView setIncluded:](v13->_prominentPlayButtonContainerView, "setIncluded:", 1);
    -[AVLayoutView setContentLayoutMargins:](v13->_prominentPlayButtonContainerView, "setContentLayoutMargins:", v51, v52, v53, v54);
    -[AVLayoutView setDebugIdentifier:](v13->_prominentPlayButtonContainerView, "setDebugIdentifier:", CFSTR("prominentPlayButton"));
    objc_msgSend(v10, "defaultItemInlineSize");
    v63 = v62;
    objc_msgSend(v10, "defaultItemInlineSize");
    v128 = CGRectInset(v113, v63, v64);
    v65 = v128.origin.x;
    v66 = v128.origin.y;
    v67 = v128.size.width;
    objc_msgSend(v10, "defaultItemFullScreenSize");
    v69 = v68 + v68;
    v70 = -[AVView initWithFrame:]([AVView alloc], "initWithFrame:", v65, v66, v67, v68 + v68);
    transportControlsContainerView = v13->_transportControlsContainerView;
    v13->_transportControlsContainerView = v70;

    -[AVView setHasBackdropView:](v13->_transportControlsContainerView, "setHasBackdropView:", 1);
    kdebug_trace();
    v72 = -[AVTransportControlsView initWithFrame:styleSheet:]([AVTransportControlsView alloc], "initWithFrame:styleSheet:", v10, v65, v66, v67, v69);
    transportControlsView = v13->_transportControlsView;
    v13->_transportControlsView = v72;

    kdebug_trace();
    -[AVView setHasBackdropView:](v13->_transportControlsView, "setHasBackdropView:", 1);
    v13->_includedContainers = 28;
    -[AVTransportControlsView routePickerView](v13->_transportControlsView, "routePickerView");
    v74 = objc_claimAutoreleasedReturnValue();
    routePickerView = v13->_routePickerView;
    v13->_routePickerView = (AVPlaybackControlsRoutePickerView *)v74;

    -[AVTransportControlsView mediaSelectionButton](v13->_transportControlsView, "mediaSelectionButton");
    v76 = objc_claimAutoreleasedReturnValue();
    mediaSelectionButton = v13->_mediaSelectionButton;
    v13->_mediaSelectionButton = (AVButton *)v76;

    -[AVTransportControlsView controlOverflowButton](v13->_transportControlsView, "controlOverflowButton");
    v78 = objc_claimAutoreleasedReturnValue();
    controlOverflowButton = v13->_controlOverflowButton;
    v13->_controlOverflowButton = (AVControlOverflowButton *)v78;

    -[AVTransportControlsView playbackSpeedButton](v13->_transportControlsView, "playbackSpeedButton");
    v80 = objc_claimAutoreleasedReturnValue();
    playbackSpeedButton = v13->_playbackSpeedButton;
    v13->_playbackSpeedButton = (AVButton *)v80;

    -[AVTransportControlsView standardPlayPauseButton](v13->_transportControlsView, "standardPlayPauseButton");
    v82 = objc_claimAutoreleasedReturnValue();
    standardPlayPauseButton = v13->_standardPlayPauseButton;
    v13->_standardPlayPauseButton = (AVButton *)v82;

    -[AVTransportControlsView skipForwardButton](v13->_transportControlsView, "skipForwardButton");
    v84 = objc_claimAutoreleasedReturnValue();
    skipForwardButton = v13->_skipForwardButton;
    v13->_skipForwardButton = (AVButton *)v84;

    -[AVTransportControlsView skipBackButton](v13->_transportControlsView, "skipBackButton");
    v86 = objc_claimAutoreleasedReturnValue();
    skipBackButton = v13->_skipBackButton;
    v13->_skipBackButton = (AVButton *)v86;

    -[AVTransportControlsView startLeftwardContentTransitionButton](v13->_transportControlsView, "startLeftwardContentTransitionButton");
    v88 = objc_claimAutoreleasedReturnValue();
    startLeftwardContentTransitionButton = v13->_startLeftwardContentTransitionButton;
    v13->_startLeftwardContentTransitionButton = (AVButton *)v88;

    -[AVTransportControlsView startRightwardContentTransitionButton](v13->_transportControlsView, "startRightwardContentTransitionButton");
    v90 = objc_claimAutoreleasedReturnValue();
    startRightwardContentTransitionButton = v13->_startRightwardContentTransitionButton;
    v13->_startRightwardContentTransitionButton = (AVButton *)v90;

    -[AVTransportControlsView scrubber](v13->_transportControlsView, "scrubber");
    v92 = objc_claimAutoreleasedReturnValue();
    scrubber = v13->_scrubber;
    v13->_scrubber = (AVScrubber *)v92;

    v94 = objc_alloc_init(AVVolumeButtonControl);
    volumeButton = v13->_volumeButton;
    v13->_volumeButton = v94;

    v96 = objc_alloc_init(AVVolumeSlider);
    volumeSlider = v13->_volumeSlider;
    v13->_volumeSlider = v96;

    v116[0] = v13->_volumeSlider;
    v116[1] = v13->_volumeButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v98 = objc_claimAutoreleasedReturnValue();
    defaultAudioControls = v13->_defaultAudioControls;
    v13->_defaultAudioControls = (NSArray *)v98;

    v100 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v112, v44, v45, v46);
    volumeControls = v13->_volumeControls;
    v13->_volumeControls = v100;

    v102 = v13->_volumeControls;
    v115 = v13->_defaultAudioControls;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView setArrangedSubviews:](v102, "setArrangedSubviews:", v103);

    -[AVLayoutView setDebugIdentifier:](v13->_volumeControls, "setDebugIdentifier:", CFSTR("volumeControls"));
    v13->_needsIntialLayout = 1;
    -[AVView setIgnoresTouches:](v13->_screenModeControls, "setIgnoresTouches:", 1);
    -[AVView setIgnoresTouches:](v13->_volumeControls, "setIgnoresTouches:", 1);
    -[AVView setIgnoresTouches:](v13->_prominentPlayButtonContainerView, "setIgnoresTouches:", 1);
    -[AVView setIgnoresTouches:](v13->_transportControlsContainerView, "setIgnoresTouches:", 1);
    v104 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v113.origin.x, v113.origin.y, v113.size.width, v113.size.height);
    playbackControlsContainer = v13->_playbackControlsContainer;
    v13->_playbackControlsContainer = v104;

    v106 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v112, v44, v45, v46);
    volumeControlsContainer = v13->_volumeControlsContainer;
    v13->_volumeControlsContainer = v106;

    -[AVTouchIgnoringView setIncluded:](v13->_volumeControlsContainer, "setIncluded:", 1);
    v108 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v13);
    observationController = v13->_observationController;
    v13->_observationController = v108;

    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v13->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5660], 0, 0, &__block_literal_global_11281);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v13->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5730], 0, 0, &__block_literal_global_11281);
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v13->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC4FA8], 0, 0, &__block_literal_global_29_11282);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsView setTintColor:](v13, "setTintColor:", v110);

  }
  return v13;
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _OWORD v17[3];
  _QWORD v18[5];
  id v19;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateAreVolumeAndTransportControlsVisible");

  if (*(_BYTE *)(a1 + 48))
  {
    if (!*(_BYTE *)(a1 + 49))
    {
      v4 = objc_loadWeakRetained(v2);
      objc_msgSend(v4, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayCornerRadius");
      v7 = v6;

      if (v7 == 0.0)
      {
        v8 = (void *)MEMORY[0x1E0DC3F10];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2;
        v18[3] = &unk_1E5BB45E8;
        objc_copyWeak(&v19, v2);
        v18[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v8, "performWithoutAnimation:", v18);
        objc_destroyWeak(&v19);
      }
    }
  }
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "screenModeControls");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17[0] = *MEMORY[0x1E0C9BAA8];
  v17[1] = v11;
  v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v10, "setTransform:", v17);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "setNeedsLayout");

  if (*(_BYTE *)(a1 + 48) && *(_BYTE *)(a1 + 49))
  {
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_3;
    v15[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v16, v2);
    objc_msgSend(v13, "performWithoutAnimation:", v15);
    objc_destroyWeak(&v16);
  }
  else
  {
    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "layoutIfNeeded");

  }
}

- (void)_updateAreVolumeAndTransportControlsVisible
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  -[AVPlaybackControlsView _customControlsViewIfLoaded](self, "_customControlsViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVPlaybackControlsView includesTransportControls](self, "includesTransportControls"))
  {
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    objc_msgSend(v3, "setAreTransportControlsVisible:", v5 > 0.0);

  }
  else
  {
    objc_msgSend(v3, "setAreTransportControlsVisible:", 0);
  }

  -[AVPlaybackControlsView _customControlsViewIfLoaded](self, "_customControlsViewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVPlaybackControlsView includesAudioControlsContainer](self, "includesAudioControlsContainer")
    || -[AVPlaybackControlsView includesCustomAudioControls](self, "includesCustomAudioControls"))
  {
    -[AVPlaybackControlsView volumeControlsContainer](self, "volumeControlsContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    objc_msgSend(v6, "setAreVolumeControlsVisible:", v8 > 0.0);

  }
  else
  {
    objc_msgSend(v6, "setAreVolumeControlsVisible:", 0);
  }

  -[AVPlaybackControlsView _customControlsViewIfLoaded](self, "_customControlsViewIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateConstraintsIfNeeded");

  -[AVPlaybackControlsView _customControlsViewIfLoaded](self, "_customControlsViewIfLoaded");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

}

- (id)_customControlsViewIfLoaded
{
  return self->_customControlsView;
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsView;
  -[AVPlaybackControlsView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[AVPlaybackControlsView _updateLayoutMargins](self, "_updateLayoutMargins");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackControlsView;
  -[AVPlaybackControlsView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", 0, 0);
}

- (void)setPrefersVolumeSliderExpanded:(BOOL)a3 prefersVolumeButtonIncluded:(BOOL)a4 animated:(BOOL)a5
{
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void (**v20)(_QWORD);
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[5];
  BOOL v24;
  BOOL v25;

  v7 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke;
  v23[3] = &unk_1E5BB2638;
  v23[4] = self;
  v24 = a3;
  v25 = a4;
  v8 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v23, a2);
  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasVisibleArrangedSubview");

  if (!v10 || !a5)
  {
LABEL_6:
    v8[2](v8);
    goto LABEL_7;
  }
  -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRunning");

  if (!v12)
  {
    if (!objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:", 0.75);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v14, 0.5);
      v16 = v7;
      v17 = 3221225472;
      v18 = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_3;
      v19 = &unk_1E5BB4610;
      v20 = v8;
      objc_msgSend(v15, "addAnimations:", &v16);
      -[AVPlaybackControlsView setPlaybackControlsVisibilityAnimator:](self, "setPlaybackControlsVisibilityAnimator:", v15, v16, v17, v18, v19);
      objc_msgSend(v15, "startAnimation");

      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_2;
  v21[3] = &unk_1E5BB3940;
  v22 = v8;
  objc_msgSend(v13, "addCompletion:", v21);

LABEL_7:
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "volumeSlider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncluded:", *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "volumeButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncluded:", *(unsigned __int8 *)(a1 + 41));

  objc_msgSend(*(id *)(a1 + 32), "volumeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongPressEnabled:", *(_BYTE *)(a1 + 40) == 0);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  AVPlaybackControlsView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AVPlaybackControlsView observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v7 = "-[AVPlaybackControlsView dealloc]";
    v8 = 1024;
    v9 = 222;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsView;
  -[AVPlaybackControlsView dealloc](&v5, sel_dealloc);
}

- (BOOL)includesCustomAudioControls
{
  BOOL v3;
  void *v4;

  if (-[AVPlaybackControlsView showsProminentPlayButton](self, "showsProminentPlayButton"))
    return 0;
  -[AVPlaybackControlsView customAudioItems](self, "customAudioItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)setStyleSheet:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVPlaybackControlsView styleSheet](self, "styleSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVPlaybackControlsView transportControlsView](self, "transportControlsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStyleSheet:", v8);

    -[AVPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)hasVisibleSubview
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AVPlaybackControlsView subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isHiddenOrHasHiddenAncestor"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setShowsAudioControls:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;

  if (self->_showsAudioControls != a3)
  {
    self->_showsAudioControls = a3;
    -[AVPlaybackControlsView playbackControlsContainer](self, "playbackControlsContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCollapsedOrExcluded");

    -[AVPlaybackControlsView playbackControlsVisibilityAnimator](self, "playbackControlsVisibilityAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRunning");

    if (!v7)
    {
      if (v5)
        -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", 1, 0);
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  AVPlaybackControlsView *v10;
  AVPlaybackControlsView *v11;
  AVPlaybackControlsView *v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView avkit_hitTestControlForPoint:withEvent:](self, "avkit_hitTestControlForPoint:withEvent:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AVPlaybackControlsView;
    -[AVPlaybackControlsView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
    v10 = (AVPlaybackControlsView *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (v11 == self)
    v12 = 0;
  else
    v12 = v11;

  return v12;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackControlsView;
  -[AVPlaybackControlsView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[AVPlaybackControlsView _updateLayoutMargins](self, "_updateLayoutMargins");
}

- (id)_currentArrangedAudioModeViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E40];
  -[AVPlaybackControlsView volumeControls](self, "volumeControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_currentArrangedDisplayModeViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E40];
  -[AVPlaybackControlsView screenModeControls](self, "screenModeControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_audioViewsToRemoveDuringAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVPlaybackControlsView _currentArrangedAudioModeViews](self, "_currentArrangedAudioModeViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVPlaybackControlsView _preferredArrangedAudioModeViews](self, "_preferredArrangedAudioModeViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusOrderedSet:", v5);

  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_displayModeViewsToRemoveDuringAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVPlaybackControlsView _currentArrangedDisplayModeViews](self, "_currentArrangedDisplayModeViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVPlaybackControlsView _preferredArrangedDisplayModeViews](self, "_preferredArrangedDisplayModeViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusOrderedSet:", v5);

  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateDisplayControlsVisibilityIncludedButtons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVPlaybackControlsView fullScreenButton](self, "fullScreenButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView setPrefersFullScreenButtonIncluded:](self, "setPrefersFullScreenButtonIncluded:", objc_msgSend(v4, "containsObject:", v5));

  -[AVPlaybackControlsView doneButton](self, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView setPrefersDoneButtonIncluded:](self, "setPrefersDoneButtonIncluded:", objc_msgSend(v4, "containsObject:", v6));

  -[AVPlaybackControlsView pictureInPictureButton](self, "pictureInPictureButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsView setPrefersPiPButtonIncluded:](self, "setPrefersPiPButtonIncluded:", objc_msgSend(v4, "containsObject:", v7));

  -[AVPlaybackControlsView videoGravityButton](self, "videoGravityButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "containsObject:", v8);

  -[AVPlaybackControlsView setPrefersVideoGravityButtonIncluded:](self, "setPrefersVideoGravityButtonIncluded:", v9);
  _AVLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPlaybackControlsView prefersFullScreenButtonIncluded](self, "prefersFullScreenButtonIncluded"))
      v11 = "YES";
    else
      v11 = "NO";
    v18 = 136315650;
    v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    v20 = 2080;
    v21 = "self.prefersFullScreenButtonIncluded";
    v22 = 2080;
    v23 = v11;
    _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  _AVLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPlaybackControlsView prefersDoneButtonIncluded](self, "prefersDoneButtonIncluded"))
      v13 = "YES";
    else
      v13 = "NO";
    v18 = 136315650;
    v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    v20 = 2080;
    v21 = "self.prefersDoneButtonIncluded";
    v22 = 2080;
    v23 = v13;
    _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  _AVLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPlaybackControlsView prefersVideoGravityButtonIncluded](self, "prefersVideoGravityButtonIncluded"))
      v15 = "YES";
    else
      v15 = "NO";
    v18 = 136315650;
    v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    v20 = 2080;
    v21 = "self.prefersVideoGravityButtonIncluded";
    v22 = 2080;
    v23 = v15;
    _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  _AVLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPlaybackControlsView prefersPiPButtonIncluded](self, "prefersPiPButtonIncluded"))
      v17 = "YES";
    else
      v17 = "NO";
    v18 = 136315650;
    v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    v20 = 2080;
    v21 = "self.prefersPiPButtonIncluded";
    v22 = 2080;
    v23 = v17;
    _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  -[AVPlaybackControlsView _updatePlaybackControlsContainerVisibilityAnimated:additionalActions:](self, "_updatePlaybackControlsContainerVisibilityAnimated:additionalActions:", 1, 0);
}

- (void)_animateKeyboardAvoidance:(int64_t)a3 duration:(double)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[AVPlaybackControlsView keyboardUIAvoidanceAnimator](self, "keyboardUIAvoidanceAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isRunning") && objc_msgSend(v7, "isInterruptible"))
  {
    objc_msgSend(v7, "stopAnimation:", 0);
    objc_msgSend(v7, "finishAnimationAtPosition:", 2);
  }
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __61__AVPlaybackControlsView__animateKeyboardAvoidance_duration___block_invoke;
  v14 = &unk_1E5BB4A40;
  objc_copyWeak(&v15, &location);
  v9 = (void *)objc_msgSend(v8, "initWithDuration:curve:animations:", a3, &v11, a4);
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, v9);
  -[AVPlaybackControlsView keyboardUIAvoidanceAnimator](self, "keyboardUIAvoidanceAnimator", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startAnimation");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  return self->_customControlsView;
}

- (int64_t)includedContainers
{
  return self->_includedContainers;
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].d;
  return self;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (UIViewPropertyAnimator)keyboardUIAvoidanceAnimator
{
  return self->_keyboardUIAvoidanceAnimator;
}

- (void)setDoubleRowLayoutEnabled:(BOOL)a3
{
  self->_doubleRowLayoutEnabled = a3;
}

- (void)setPlaybackControlsVisibilityAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControlsVisibilityAnimator, a3);
}

- (NSUUID)mostRecentAnimationCompletionsID
{
  return self->_mostRecentAnimationCompletionsID;
}

- (BOOL)isTopAreaLayoutGuideExpanded
{
  return self->_topAreaLayoutGuideExpanded;
}

- (void)setTopAreaLayoutGuideExpanded:(BOOL)a3
{
  self->_topAreaLayoutGuideExpanded = a3;
}

- (void)setPrefersDoneButtonIncluded:(BOOL)a3
{
  self->_prefersDoneButtonIncluded = a3;
}

- (void)setPrefersVideoGravityButtonIncluded:(BOOL)a3
{
  self->_prefersVideoGravityButtonIncluded = a3;
}

- (void)setPrefersFullScreenButtonIncluded:(BOOL)a3
{
  self->_prefersFullScreenButtonIncluded = a3;
}

- (void)setPrefersPiPButtonIncluded:(BOOL)a3
{
  self->_prefersPiPButtonIncluded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentAnimationCompletionsID, 0);
  objc_storeStrong((id *)&self->_playbackControlsVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, 0);
  objc_storeStrong((id *)&self->_defaultDisplayModeControls, 0);
  objc_storeStrong((id *)&self->_defaultAudioControls, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_customMediaItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_controlOverflowButton, 0);
  objc_storeStrong((id *)&self->_mediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_routePickerView, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_startRightwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_startLeftwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_standardPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButton, 0);
  objc_storeStrong((id *)&self->_customAudioItems, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_volumeButton, 0);
  objc_storeStrong((id *)&self->_customDisplayModeItems, 0);
  objc_storeStrong((id *)&self->_pictureInPictureButton, 0);
  objc_storeStrong((id *)&self->_videoGravityButton, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_transportControlsContainerView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButtonContainerView, 0);
  objc_storeStrong((id *)&self->_volumeControls, 0);
  objc_storeStrong((id *)&self->_screenModeControls, 0);
  objc_storeStrong((id *)&self->_playbackControlsContainer, 0);
  objc_storeStrong((id *)&self->_volumeControlsContainer, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_customControlsView, 0);
}

void __61__AVPlaybackControlsView__animateKeyboardAvoidance_duration___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "layoutIfNeeded");

}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  int v6;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setMostRecentAnimationCompletionsID:", 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "mostRecentAnimationCompletionsID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(*(id *)(a1 + 40), "didFinishAnimations:", 1);
  }
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPlaybackControlsVisibilityAnimator:", 0);

  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "didFinishAnimations:", a2 == 0);
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    v1 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setNeedsLayout");

    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "layoutIfNeeded");

  }
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  CGAffineTransform v15;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarFrame");
  v8 = v7;

  LOBYTE(WeakRetained) = objc_msgSend(*(id *)(a1 + 32), "isFullScreen");
  objc_msgSend(*(id *)(a1 + 32), "styleSheet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((WeakRetained & 1) != 0)
    objc_msgSend(v9, "standardPaddingFullScreen");
  else
    objc_msgSend(v9, "standardPaddingInline");
  v12 = v11;

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "screenModeControls");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v15, 0.0, fmax(v8 + v12 * 0.5 - v12, 0.0));
  objc_msgSend(v14, "setTransform:", &v15);

}

void __51__AVPlaybackControlsView_initWithFrame_styleSheet___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double Height;
  double v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a2;
  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4F90]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v5, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E40]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "longValue");

  objc_msgSend(v5, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  Height = CGRectGetHeight(v30);
  objc_msgSend(v29, "keyboardHeight");
  if (Height != v27)
  {
    v31.origin.x = v9;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v15;
    objc_msgSend(v29, "setKeyboardHeight:", CGRectGetHeight(v31));
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v29, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        objc_msgSend(v29, "_animateKeyboardAvoidance:duration:", v21, v25);
    }
  }

}

uint64_t __51__AVPlaybackControlsView_initWithFrame_styleSheet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsLayout");
}

@end

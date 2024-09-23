@implementation AVTransportControlsView

- (void)avkit_reevaluateHiddenStateOfItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  _BOOL4 v8;
  objc_super v9;

  v4 = a3;
  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = objc_msgSend(v4, "isCollapsedOrExcluded");
    v7 = 1.0;
    if ((_DWORD)v6)
      v7 = 0.0;
    objc_msgSend(v4, "setAlpha:", v7);
    v8 = -[AVTransportControlsView isAnimatingScrubInstructions](self, "isAnimatingScrubInstructions");
    if ((v6 & 1) != 0 || !v8)
    {
      if (!-[AVTransportControlsView isAnimatingScrubInstructions](self, "isAnimatingScrubInstructions"))
      {
        objc_msgSend(v4, "setHidden:", v6);
        objc_msgSend(v4, "setAlpha:", 1.0);
      }
    }
    else
    {
      objc_msgSend(v4, "setHidden:", 0);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTransportControlsView;
    -[UIView avkit_reevaluateHiddenStateOfItem:](&v9, sel_avkit_reevaluateHiddenStateOfItem_, v4);
  }

}

- (void)setTransportViewIncludesVolumeController:(BOOL)a3
{
  self->_transportViewIncludesVolumeController = a3;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVTransportControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVTransportControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)_layoutSingleRowViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  CGRect v44;

  v43[1] = *MEMORY[0x1E0C80C00];
  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoadingIndicatorAlignment:", 1);

  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView singleRowViews](self, "singleRowViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArrangedSubviews:", v6);

  v7 = 0.0;
  if (!-[AVTransportControlsView isCollapsedOrExcluded](self, "isCollapsedOrExcluded"))
  {
    if (-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance"))
      v7 = 18.0;
    else
      v7 = 14.0;
  }
  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentLayoutMargins:", 0.0, v7, 0.0, v7);

  -[AVTransportControlsView bounds](self, "bounds");
  if (CGRectGetWidth(v44) < 568.0)
  {
    v11 = 95.0;
  }
  else
  {
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minimumScrubberSize");
    v11 = v10;

  }
  -[AVTransportControlsView scrubber](self, "scrubber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumScrubberSize");
  objc_msgSend(v13, "setMinimumSize:", v11);

  -[AVTransportControlsView scrubber](self, "scrubber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDisplayPartnerAttributes:", v18);

  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView scrubber](self, "scrubber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutAttributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDisplayPartnerAttributes:", v22);

  -[AVTransportControlsView skipBackButton](self, "skipBackButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView skipForwardButton](self, "skipForwardButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDisplayPartnerAttributes:", v26);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[AVTransportControlsView singleRowViews](self, "singleRowViews", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v32, "layoutAttributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransportControlsView _singeRowLayoutSpacingAfterSubview:](self, "_singeRowLayoutSpacingAfterSubview:", v32);
        objc_msgSend(v33, "setTrailingInterItemSpace:");

        objc_msgSend(v32, "layoutAttributes");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setDisplayPriority:", -[AVTransportControlsView _layoutItemDisplayPriorityForSubview:](self, "_layoutItemDisplayPriorityForSubview:", v32));

        objc_msgSend(v32, "layoutAttributes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransportControlsView scrubber](self, "scrubber");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 == v36)
        {
          objc_msgSend(v35, "setHasFlexibleContentSize:", 1);
        }
        else
        {
          -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setHasFlexibleContentSize:", v32 == v37);

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v29);
  }

}

- (AVScrubber)scrubber
{
  return self->_scrubber;
}

- (AVChromedLabel)liveBroadcastLabel
{
  return self->_liveBroadcastLabel;
}

- (unint64_t)_layoutItemDisplayPriorityForSubview:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;

  v4 = a3;
  -[AVTransportControlsView _subviewIsCustomMenuItemView:](self, "_subviewIsCustomMenuItemView:", v4);
  -[AVTransportControlsView standardPlayPauseButton](self, "standardPlayPauseButton");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_16;
  }
  v6 = (void *)v5;
  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
LABEL_16:
    v30 = 4;
    goto LABEL_20;
  }
  -[AVTransportControlsView scrubber](self, "scrubber");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v4)
  {

    goto LABEL_19;
  }
  v9 = (void *)v8;
  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v10 = objc_claimAutoreleasedReturnValue();
  if ((id)v10 == v4)
  {

    goto LABEL_19;
  }
  v11 = (void *)v10;
  -[AVTransportControlsView controlOverflowButton](self, "controlOverflowButton");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
LABEL_19:
    v30 = 3;
    goto LABEL_20;
  }
  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((id)v13 == v4)
  {

    goto LABEL_23;
  }
  v14 = (void *)v13;
  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((id)v15 == v4)
  {

    goto LABEL_23;
  }
  v16 = (void *)v15;
  -[AVTransportControlsView routePickerView](self, "routePickerView");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v4)
  {
LABEL_23:
    v30 = 2;
    goto LABEL_20;
  }
  -[AVTransportControlsView skipBackButton](self, "skipBackButton");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v4;
  if ((id)v18 == v4)
  {
LABEL_27:

    goto LABEL_28;
  }
  v20 = (void *)v18;
  -[AVTransportControlsView skipForwardButton](self, "skipForwardButton");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v4;
  if ((id)v21 == v4)
  {
LABEL_26:

    v19 = v20;
    goto LABEL_27;
  }
  v23 = (void *)v21;
  -[AVTransportControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v4;
  if ((id)v24 == v4)
  {
LABEL_25:

    v22 = v23;
    goto LABEL_26;
  }
  v26 = (void *)v24;
  -[AVTransportControlsView startRightwardContentTransitionButton](self, "startRightwardContentTransitionButton");
  v27 = objc_claimAutoreleasedReturnValue();
  if ((id)v27 == v4)
  {

    v25 = v26;
    goto LABEL_25;
  }
  v28 = (void *)v27;
  -[AVTransportControlsView mediaSelectionButton](self, "mediaSelectionButton");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (v29 == v4)
  {
LABEL_28:
    v30 = 1;
    goto LABEL_20;
  }
  v30 = 0;
LABEL_20:

  return v30;
}

- (AVTouchIgnoringView)embeddedExtraContentContainer
{
  return self->_embeddedExtraContentContainer;
}

- (AVChromedLabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (AVChromedLabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (AVButton)standardPlayPauseButton
{
  return self->_standardPlayPauseButton;
}

- (double)_singeRowLayoutSpacingAfterSubview:(id)a3
{
  AVButton *v4;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  AVButton *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  CGRect v22;

  v4 = (AVButton *)a3;
  -[AVTransportControlsView _subviewIsCustomMenuItemView:](self, "_subviewIsCustomMenuItemView:", v4);
  v5 = 16.0;
  if (!-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance"))
    goto LABEL_32;
  if (-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance"))
  {
    -[AVTransportControlsView bounds](self, "bounds");
    v6 = CGRectGetWidth(v22) < 568.0;
  }
  else
  {
    v6 = 0;
  }
  -[AVTransportControlsView skipBackButton](self, "skipBackButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isIncluded"))
  {

  }
  else
  {
    -[AVTransportControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isIncluded");

    if ((v9 & 1) == 0)
    {
      v5 = 0.0;
      if (self->_skipBackButton != v4
        && self->_startLeftwardContentTransitionButton != v4
        && self->_skipForwardButton != v4)
      {
        if (self->_startRightwardContentTransitionButton == v4)
          v5 = 0.0;
        else
          v5 = 20.0;
      }
      goto LABEL_19;
    }
  }
  if (v6)
  {
    v5 = 32.0;
  }
  else if (-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance"))
  {
    v5 = 32.0;
  }
  else
  {
    v5 = 0.0;
  }
LABEL_19:
  -[AVTransportControlsView customItems](self, "customItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (self->_mediaSelectionButton == v4)
    {
      -[AVTransportControlsView skipBackButton](self, "skipBackButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isIncluded") & 1) != 0)
      {
        v5 = 32.0;
      }
      else
      {
        -[AVTransportControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isIncluded"))
          v5 = 32.0;
        else
          v5 = 20.0;

      }
    }
    else if (-[AVButton conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EEC9B670))
    {
      v11 = v4;
      -[AVTransportControlsView customItems](self, "customItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

      if (v13)
        v5 = 16.0;
    }
  }
LABEL_32:
  if ((AVButton *)self->_liveBroadcastLabel == v4)
  {
    v5 = 0.0;
  }
  else if ((AVButton *)self->_elapsedTimeLabel == v4 || (AVButton *)self->_scrubber == v4)
  {
    v5 = 5.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  v19 = 0.77;
  if (v18 != 5)
    v19 = 1.0;
  v20 = v5 * v19;

  return v20;
}

- (BOOL)_subviewIsCustomMenuItemView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v4 = a3;
  -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
    if (v6)
    {
      -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v6);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)customMenuItemsViews
{
  return self->_customMenuItemsViews;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (AVControlOverflowButton)controlOverflowButton
{
  return self->_controlOverflowButton;
}

- (AVPlaybackControlsRoutePickerView)routePickerView
{
  return self->_routePickerView;
}

- (AVButton)skipBackButton
{
  return self->_skipBackButton;
}

- (AVButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (AVButton)startLeftwardContentTransitionButton
{
  return self->_startLeftwardContentTransitionButton;
}

- (AVLayoutView)controlsLayoutView
{
  return self->_controlsLayoutView;
}

- (AVButton)startRightwardContentTransitionButton
{
  return self->_startRightwardContentTransitionButton;
}

- (AVButton)mediaSelectionButton
{
  return self->_mediaSelectionButton;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVTransportControlsView isCollapsed](self, "isCollapsed")
      || !-[AVTransportControlsView isIncluded](self, "isIncluded")
      || -[AVTransportControlsView isRemoved](self, "isRemoved");
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  _BOOL4 v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  CGFloat MaxY;
  __int128 v46;
  _OWORD v47[3];
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;

  v60 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v57.receiver = self;
  v57.super_class = (Class)AVTransportControlsView;
  -[AVView layoutSubviews](&v57, sel_layoutSubviews);
  -[UIView avkit_makeSubtreeDisallowGroupBlending](self, "avkit_makeSubtreeDisallowGroupBlending");
  -[AVTransportControlsView liveBroadcastScrubberLabel](self, "liveBroadcastScrubberLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncluded:", -[AVTransportControlsView liveStreamingControlsIncludeScrubber](self, "liveStreamingControlsIncludeScrubber"));

  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTransportControlsView showsLiveStreamingControls](self, "showsLiveStreamingControls"))
    v5 = -[AVTransportControlsView liveStreamingControlsIncludeScrubber](self, "liveStreamingControlsIncludeScrubber") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  if (-[AVTransportControlsView showsLiveStreamingControls](self, "showsLiveStreamingControls"))
    v6 = -[AVTransportControlsView liveStreamingControlsIncludeScrubber](self, "liveStreamingControlsIncludeScrubber");
  else
    v6 = 1;
  -[AVTransportControlsView scrubber](self, "scrubber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncluded:", v6);

  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncluded:", v6);

  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v10 = -[AVTransportControlsView liveStreamingControlsIncludeScrubber](self, "liveStreamingControlsIncludeScrubber") ^ 1;
  else
    v10 = 0;
  objc_msgSend(v9, "setIncluded:", v10);

  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsLoadingIndicator:", -[AVTransportControlsView showsLoadingIndicator](self, "showsLoadingIndicator"));

  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsLoadingIndicator:", -[AVTransportControlsView showsLoadingIndicator](self, "showsLoadingIndicator"));

  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLoadingIndicatorAlignment:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled") ^ 1);

  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView bounds](self, "bounds");
  objc_msgSend(v14, "setFrame:");

  -[AVTransportControlsView _updateCustomContentTransitioningInfoPanelLayout](self, "_updateCustomContentTransitioningInfoPanelLayout");
  if (-[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
    -[AVTransportControlsView _layoutDoubleRowViews](self, "_layoutDoubleRowViews");
  else
    -[AVTransportControlsView _layoutSingleRowViews](self, "_layoutSingleRowViews");
  if (-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance")
    || -[AVTransportControlsView isCollapsedOrExcluded](self, "isCollapsedOrExcluded"))
  {
    if (!-[AVTransportControlsView hasFullScreenAppearance](self, "hasFullScreenAppearance"))
      goto LABEL_37;
    -[AVTransportControlsView setCollapsed:](self, "setCollapsed:", 0);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[AVTransportControlsView customItems](self, "customItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v21 = -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
          if (v21)
            objc_msgSend(v20, "setCollapsed:", 1);
          objc_msgSend(v20, "setIncluded:", !v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v17);
    }
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[AVTransportControlsView customItems](self, "customItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v15);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          if (-[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
          {
            v27 = 0;
          }
          else
          {
            objc_msgSend(v26, "intrinsicContentSize");
            v29 = v28;
            -[AVTransportControlsView bounds](self, "bounds");
            v27 = v29 < CGRectGetWidth(v61) * 0.3;
          }
          objc_msgSend(v26, "setCollapsed:", !v27);
        }
        v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v23);
    }
  }

LABEL_37:
  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isCollapsedOrExcluded");

  if (v31)
    v32 = -16.0;
  else
    v32 = -22.0;
  -[AVTransportControlsView standardPlayPauseButton](self, "standardPlayPauseButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHitRectInsets:", -16.0, -22.0, -16.0, v32);

  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34 || !-[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
  {

    goto LABEL_45;
  }
  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isCollapsedOrExcluded");

  if ((v36 & 1) != 0)
  {
LABEL_45:
    -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v47[0] = *MEMORY[0x1E0C9BAA8];
    v47[1] = v46;
    v47[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v43, "setTransform:", v47);
    goto LABEL_46;
  }
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "liveBroadcastLabelTopToBackdropTopDistance");
  v39 = v38;

  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "intrinsicContentSize");
  v42 = v41;

  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView scrubber](self, "scrubber");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  MaxY = CGRectGetMaxY(v62);
  CGAffineTransformMakeTranslation(&v48, 0.0, MaxY - (v39 + v42 * 0.5));
  objc_msgSend(v43, "setTransform:", &v48);

LABEL_46:
  kdebug_trace();
}

- (BOOL)liveStreamingControlsIncludeScrubber
{
  return self->_liveStreamingControlsIncludeScrubber;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (BOOL)showsLiveStreamingControls
{
  return self->_showsLiveStreamingControls;
}

- (BOOL)isDoubleRowLayoutEnabled
{
  return self->_doubleRowLayoutEnabled;
}

- (AVChromedLabel)liveBroadcastScrubberLabel
{
  return self->_liveBroadcastScrubberLabel;
}

- (void)_updateCustomContentTransitioningInfoPanelLayout
{
  void *v3;
  _BOOL4 v4;
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
  double v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

    }
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v10, "setFrame:");
    goto LABEL_9;
  }
  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v12)
  {
    -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);
LABEL_9:

  }
  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"));

  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
    v15 = 0.0;
  else
    v15 = 1.0;
  objc_msgSend(v14, "setAlpha:", v15);

  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCollapsed:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled") ^ 1);

  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIncluded:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"));

  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
    v18 = 1.0;
  else
    v18 = 0.0;
  objc_msgSend(v19, "setAlpha:", v18);

}

- (UIView)customContentTransitioningInfoPanel
{
  return self->_customContentTransitioningInfoPanel;
}

- (void)setCustomItems:(id)a3
{
  NSArray *v4;
  NSArray *customItems;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_customItems, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    customItems = self->_customItems;
    self->_customItems = v4;

    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)singleRowViews
{
  AVButton *startLeftwardContentTransitionButton;
  AVButton *skipForwardButton;
  AVChromedLabel *liveBroadcastLabel;
  AVScrubber *scrubber;
  AVChromedLabel *liveBroadcastScrubberLabel;
  void *v8;
  AVButton *mediaSelectionButton;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AVButton *playbackSpeedButton;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[11];

  v23[10] = *MEMORY[0x1E0C80C00];
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v23[0] = self->_skipBackButton;
  v23[1] = startLeftwardContentTransitionButton;
  skipForwardButton = self->_skipForwardButton;
  v23[2] = self->_standardPlayPauseButton;
  v23[3] = skipForwardButton;
  liveBroadcastLabel = self->_liveBroadcastLabel;
  v23[4] = self->_startRightwardContentTransitionButton;
  v23[5] = liveBroadcastLabel;
  scrubber = self->_scrubber;
  v23[6] = self->_elapsedTimeLabel;
  v23[7] = scrubber;
  liveBroadcastScrubberLabel = self->_liveBroadcastScrubberLabel;
  v23[8] = self->_timeRemainingLabel;
  v23[9] = liveBroadcastScrubberLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mediaSelectionButton = self->_mediaSelectionButton;
  v22[0] = self->_routePickerView;
  v22[1] = mediaSelectionButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView customItems](self, "customItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  playbackSpeedButton = self->_playbackSpeedButton;
  v21[0] = self->_controlOverflowButton;
  v21[1] = playbackSpeedButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSArray)customItems
{
  return self->_customItems;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    -[AVTransportControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_collapsed != a3)
  {
    v3 = a3;
    self->_collapsed = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[AVTransportControlsView singleRowViews](self, "singleRowViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setCollapsed:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[AVTransportControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVTransportControlsView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (AVTransportControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NSObject *v11;
  AVTransportControlsView *v12;
  AVTransportControlsView *v13;
  AVScrubber *v14;
  AVScrubber *scrubber;
  void *v16;
  void *v17;
  uint64_t v18;
  AVChromedLabel *elapsedTimeLabel;
  uint64_t v20;
  AVChromedLabel *timeRemainingLabel;
  uint64_t v22;
  AVChromedLabel *liveBroadcastLabel;
  void *v24;
  uint64_t v25;
  AVChromedLabel *liveBroadcastScrubberLabel;
  AVTouchIgnoringView *v27;
  AVTouchIgnoringView *embeddedExtraContentContainer;
  void *v29;
  UILabel *v30;
  UILabel *scrubInstructionsLabel;
  AVChromedLabel *v32;
  AVChromedLabel *detachedScrubInstructionsBackdropLabel;
  AVLayoutView *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  AVLayoutView *detachedExtraContentLayoutView;
  AVLayoutView *v41;
  void *v42;
  void *v43;
  AVPlaybackControlsRoutePickerView *v44;
  AVPlaybackControlsRoutePickerView *routePickerView;
  uint64_t v46;
  AVControlOverflowButton *controlOverflowButton;
  void *v48;
  uint64_t v49;
  AVButton *mediaSelectionButton;
  void *v51;
  uint64_t v52;
  AVButton *playbackSpeedButton;
  void *v54;
  void *v55;
  uint64_t v56;
  AVButton *standardPlayPauseButton;
  AVButton *v58;
  void *v59;
  uint64_t v60;
  AVButton *skipForwardButton;
  uint64_t v62;
  AVButton *skipBackButton;
  AVTouchIgnoringView *v64;
  AVTouchIgnoringView *flexibleViewAfterRoutePickerView;
  AVTouchIgnoringView *v66;
  AVTouchIgnoringView *flexibleViewAfterSkipForwardButtons;
  void *v68;
  void *v69;
  uint64_t v70;
  const __CFString *v71;
  const __CFString *v72;
  uint64_t v73;
  AVButton *startRightwardContentTransitionButton;
  uint64_t v75;
  AVButton *startLeftwardContentTransitionButton;
  AVLayoutView *v77;
  AVLayoutView *controlsLayoutView;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  objc_super v86;
  AVChromedLabel *v87;
  void *v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  uint64_t v93;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v93 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v90 = "-[AVTransportControlsView initWithFrame:styleSheet:]";
    v91 = 1024;
    v92 = 72;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v86.receiver = self;
  v86.super_class = (Class)AVTransportControlsView;
  v12 = -[AVView initWithFrame:](&v86, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_included = 1;
    objc_storeStrong((id *)&v12->_styleSheet, a4);
    v14 = objc_alloc_init(AVScrubber);
    scrubber = v13->_scrubber;
    v13->_scrubber = v14;

    -[AVScrubber layoutAttributes](v13->_scrubber, "layoutAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("Scrubber"));

    -[AVScrubber layoutAttributes](v13->_scrubber, "layoutAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHasFlexibleContentSize:", 1);

    -[AVScrubber setDelegate:](v13->_scrubber, "setDelegate:", v13);
    -[AVScrubber addTarget:action:forControlEvents:](v13->_scrubber, "addTarget:action:forControlEvents:", v13, sel_beginScrubbing_, 1);
    -[AVScrubber addTarget:action:forControlEvents:](v13->_scrubber, "addTarget:action:forControlEvents:", v13, sel_endScrubbing_, 448);
    -[AVScrubber addTarget:action:forControlEvents:](v13->_scrubber, "addTarget:action:forControlEvents:", v13, sel_scrubberValueChanged_, 4096);
    __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(0, CFSTR("Time Elapsed"));
    v18 = objc_claimAutoreleasedReturnValue();
    elapsedTimeLabel = v13->_elapsedTimeLabel;
    v13->_elapsedTimeLabel = (AVChromedLabel *)v18;

    __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(0, CFSTR("Time Remaining"));
    v20 = objc_claimAutoreleasedReturnValue();
    timeRemainingLabel = v13->_timeRemainingLabel;
    v13->_timeRemainingLabel = (AVChromedLabel *)v20;

    __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(CFSTR("PLAYBACK_CONTROLS_VIEW_CONTROLLER_LIVE_BROADCAST_LABEL_TEXT"), CFSTR("Live Broadcast"));
    v22 = objc_claimAutoreleasedReturnValue();
    liveBroadcastLabel = v13->_liveBroadcastLabel;
    v13->_liveBroadcastLabel = (AVChromedLabel *)v22;

    -[AVChromedLabel setLoadingIndicatorAlignment:](v13->_liveBroadcastLabel, "setLoadingIndicatorAlignment:", 1);
    -[AVChromedLabel layoutAttributes](v13->_liveBroadcastLabel, "layoutAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHasFlexibleContentSize:", 1);

    __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(CFSTR("PLAYBACK_CONTROLS_VIEW_CONTROLLER_LIVE_LABEL_TEXT"), CFSTR("Live"));
    v25 = objc_claimAutoreleasedReturnValue();
    liveBroadcastScrubberLabel = v13->_liveBroadcastScrubberLabel;
    v13->_liveBroadcastScrubberLabel = (AVChromedLabel *)v25;

    v27 = objc_alloc_init(AVTouchIgnoringView);
    embeddedExtraContentContainer = v13->_embeddedExtraContentContainer;
    v13->_embeddedExtraContentContainer = v27;

    -[AVTouchIgnoringView setClipsToBounds:](v13->_embeddedExtraContentContainer, "setClipsToBounds:", 1);
    -[AVTouchIgnoringView setCollapsed:](v13->_embeddedExtraContentContainer, "setCollapsed:", 1);
    -[AVTouchIgnoringView setIncluded:](v13->_embeddedExtraContentContainer, "setIncluded:", 0);
    -[AVTouchIgnoringView layoutAttributes](v13->_embeddedExtraContentContainer, "layoutAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHasFlexibleContentSize:", 1);

    v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    scrubInstructionsLabel = v13->_scrubInstructionsLabel;
    v13->_scrubInstructionsLabel = v30;

    -[UILabel setNumberOfLines:](v13->_scrubInstructionsLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v13->_scrubInstructionsLabel, "setTextAlignment:", 1);
    -[UILabel setHidden:](v13->_scrubInstructionsLabel, "setHidden:", 1);
    v32 = objc_alloc_init(AVChromedLabel);
    detachedScrubInstructionsBackdropLabel = v13->_detachedScrubInstructionsBackdropLabel;
    v13->_detachedScrubInstructionsBackdropLabel = v32;

    -[AVChromedLabel setNumberOfLines:](v13->_detachedScrubInstructionsBackdropLabel, "setNumberOfLines:", 0);
    -[AVChromedLabel setLoadingIndicatorAlignment:](v13->_detachedScrubInstructionsBackdropLabel, "setLoadingIndicatorAlignment:", 2);
    -[AVChromedLabel setHidden:](v13->_detachedScrubInstructionsBackdropLabel, "setHidden:", 1);
    +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v13->_scrubInstructionsLabel);
    +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v13->_detachedScrubInstructionsBackdropLabel);
    v34 = [AVLayoutView alloc];
    v35 = *MEMORY[0x1E0C9D648];
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v39 = -[AVLayoutView initWithFrame:](v34, "initWithFrame:", *MEMORY[0x1E0C9D648], v36, v37, v38);
    detachedExtraContentLayoutView = v13->_detachedExtraContentLayoutView;
    v13->_detachedExtraContentLayoutView = (AVLayoutView *)v39;

    v41 = v13->_detachedExtraContentLayoutView;
    v87 = v13->_detachedScrubInstructionsBackdropLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView setArrangedSubviews:](v41, "setArrangedSubviews:", v43);

    -[AVLayoutView setDebugIdentifier:](v13->_detachedExtraContentLayoutView, "setDebugIdentifier:", CFSTR("detatchedExtraContentStackView"));
    v44 = -[AVPlaybackControlsRoutePickerView initWithSecondGenerationButton:]([AVPlaybackControlsRoutePickerView alloc], "initWithSecondGenerationButton:", 0);
    routePickerView = v13->_routePickerView;
    v13->_routePickerView = v44;

    -[AVPlaybackControlsRoutePickerView setPrioritizesVideoDevices:](v13->_routePickerView, "setPrioritizesVideoDevices:", 1);
    +[AVControlOverflowButton firstGenerationButton](AVControlOverflowButton, "firstGenerationButton");
    v46 = objc_claimAutoreleasedReturnValue();
    controlOverflowButton = v13->_controlOverflowButton;
    v13->_controlOverflowButton = (AVControlOverflowButton *)v46;

    -[AVButton layoutAttributes](v13->_controlOverflowButton, "layoutAttributes");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCanSubstituteOtherAttributes:", 1);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Media Selection"), 0);
    v49 = objc_claimAutoreleasedReturnValue();
    mediaSelectionButton = v13->_mediaSelectionButton;
    v13->_mediaSelectionButton = (AVButton *)v49;

    -[AVButton layoutAttributes](v13->_mediaSelectionButton, "layoutAttributes");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCanOverflowToAuxiliaryMenu:", 1);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Playback Speed"), 0);
    v52 = objc_claimAutoreleasedReturnValue();
    playbackSpeedButton = v13->_playbackSpeedButton;
    v13->_playbackSpeedButton = (AVButton *)v52;

    -[AVButton layoutAttributes](v13->_playbackSpeedButton, "layoutAttributes");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setCanOverflowToAuxiliaryMenu:", 1);

    -[AVButton layoutAttributes](v13->_playbackSpeedButton, "layoutAttributes");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setCanOnlyAppearInControlOverflowMenu:", 1);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Play/Pause"), 0);
    v56 = objc_claimAutoreleasedReturnValue();
    standardPlayPauseButton = v13->_standardPlayPauseButton;
    v13->_standardPlayPauseButton = (AVButton *)v56;

    v58 = v13->_standardPlayPauseButton;
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B50], *MEMORY[0x1E0DC1438]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setFullScreenFont:](v58, "setFullScreenFont:", v59);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Skip Forward"), 0);
    v60 = objc_claimAutoreleasedReturnValue();
    skipForwardButton = v13->_skipForwardButton;
    v13->_skipForwardButton = (AVButton *)v60;

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Skip Backward"), 0);
    v62 = objc_claimAutoreleasedReturnValue();
    skipBackButton = v13->_skipBackButton;
    v13->_skipBackButton = (AVButton *)v62;

    v64 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v35, v36, v37, v38);
    flexibleViewAfterRoutePickerView = v13->_flexibleViewAfterRoutePickerView;
    v13->_flexibleViewAfterRoutePickerView = v64;

    v66 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v35, v36, v37, v38);
    flexibleViewAfterSkipForwardButtons = v13->_flexibleViewAfterSkipForwardButtons;
    v13->_flexibleViewAfterSkipForwardButtons = v66;

    -[AVTouchIgnoringView setIncluded:](v13->_flexibleViewAfterRoutePickerView, "setIncluded:", 1);
    -[AVTouchIgnoringView setIncluded:](v13->_flexibleViewAfterSkipForwardButtons, "setIncluded:", 1);
    -[AVTouchIgnoringView layoutAttributes](v13->_flexibleViewAfterRoutePickerView, "layoutAttributes");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setHasFlexibleContentSize:", 1);

    -[AVTouchIgnoringView layoutAttributes](v13->_flexibleViewAfterSkipForwardButtons, "layoutAttributes");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setHasFlexibleContentSize:", 1);

    v13->_transportViewIncludesVolumeController = 0;
    v70 = -[AVTransportControlsView effectiveUserInterfaceLayoutDirection](v13, "effectiveUserInterfaceLayoutDirection");
    if (v70)
      v71 = CFSTR("Skip To Next");
    else
      v71 = CFSTR("Skip To Previous");
    if (v70)
      v72 = CFSTR("Skip To Previous");
    else
      v72 = CFSTR("Skip To Next");
    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", v71, 0);
    v73 = objc_claimAutoreleasedReturnValue();
    startRightwardContentTransitionButton = v13->_startRightwardContentTransitionButton;
    v13->_startRightwardContentTransitionButton = (AVButton *)v73;

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", v72, 0);
    v75 = objc_claimAutoreleasedReturnValue();
    startLeftwardContentTransitionButton = v13->_startLeftwardContentTransitionButton;
    v13->_startLeftwardContentTransitionButton = (AVButton *)v75;

    -[AVTransportControlsView addSubview:](v13, "addSubview:", v13->_detachedExtraContentLayoutView);
    -[AVLayoutView setAlpha:](v13->_detachedExtraContentLayoutView, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v13->_scrubInstructionsLabel, "setAlpha:", 0.0);
    v77 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v35, v36, v37, v38);
    controlsLayoutView = v13->_controlsLayoutView;
    v13->_controlsLayoutView = v77;

    -[AVLayoutView setDebugIdentifier:](v13->_controlsLayoutView, "setDebugIdentifier:", CFSTR("transportControlsView"));
    -[AVLayoutView setSemanticContentAttribute:](v13->_controlsLayoutView, "setSemanticContentAttribute:", 1);
    -[AVTransportControlsView addSubview:](v13, "addSubview:", v13->_controlsLayoutView);
    -[AVTouchIgnoringView addSubview:](v13->_embeddedExtraContentContainer, "addSubview:", v13->_scrubInstructionsLabel);
    LODWORD(v79) = 1148846080;
    -[AVTransportControlsView setContentCompressionResistancePriority:forAxis:](v13, "setContentCompressionResistancePriority:forAxis:", 0, v79);
    LODWORD(v80) = 1148846080;
    -[AVTransportControlsView setContentCompressionResistancePriority:forAxis:](v13, "setContentCompressionResistancePriority:forAxis:", 1, v80);
    LODWORD(v81) = 1148846080;
    -[AVTransportControlsView setContentHuggingPriority:forAxis:](v13, "setContentHuggingPriority:forAxis:", 0, v81);
    -[AVTransportControlsView scrubInstructionsLabel](v13, "scrubInstructionsLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setHidden:", 1);

    -[AVTransportControlsView detachedExtraContentLayoutView](v13, "detachedExtraContentLayoutView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setHidden:", 1);

    -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](v13, "detachedScrubInstructionsBackdropLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setHidden:", 1);

    -[AVTransportControlsView _updateFontSizes](v13, "_updateFontSizes");
  }

  return v13;
}

AVChromedLabel *__52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  AVChromedLabel *v5;
  double v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(AVChromedLabel);
  if (v3)
  {
    objc_initWeak(&location, v5);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke_2;
    v12 = &unk_1E5BB17B8;
    objc_copyWeak(&v13, &location);
    AVAsynchronousLocalizedString(v3, v4, &v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  LODWORD(v6) = 1148846080;
  -[AVChromedLabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v6, v9, v10, v11, v12);
  -[AVChromedLabel setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v4);
  -[AVChromedLabel layoutAttributes](v5, "layoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v4);

  return v5;
}

- (void)reevaluateHiddenStateOfAllItems
{
  id v2;

  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reevaluateHiddenStateOfAllItems");

}

- (void)_updateFontSizes
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

  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrubberTimeLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrubberTimeLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v11);

  -[AVTransportControlsView liveBroadcastScrubberLabel](self, "liveBroadcastScrubberLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrubberInfoLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v14);

  -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (UILabel)scrubInstructionsLabel
{
  return self->_scrubInstructionsLabel;
}

- (AVChromedLabel)detachedScrubInstructionsBackdropLabel
{
  return self->_detachedScrubInstructionsBackdropLabel;
}

- (AVLayoutView)detachedExtraContentLayoutView
{
  return self->_detachedExtraContentLayoutView;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCustomMenuItemsViews:(id)a3
{
  NSArray *v5;
  NSArray **p_customMenuItemsViews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  p_customMenuItemsViews = &self->_customMenuItemsViews;
  if (self->_customMenuItemsViews != v5)
  {
    objc_storeStrong((id *)&self->_customMenuItemsViews, a3);
    if (-[NSArray count](*p_customMenuItemsViews, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = *p_customMenuItemsViews;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(v12, "layoutAttributes", (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setCanOverflowToAuxiliaryMenu:", 1);

            objc_msgSend(v12, "layoutAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setCanOnlyAppearInControlOverflowMenu:", 1);

            objc_msgSend(v12, "setNeedsLayout");
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

    }
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v15);
  }

}

- (AVButton)playbackSpeedButton
{
  return self->_playbackSpeedButton;
}

- (void)setShowsLiveStreamingControls:(BOOL)a3
{
  if (self->_showsLiveStreamingControls != a3)
  {
    self->_showsLiveStreamingControls = a3;
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLiveStreamingControlsIncludeScrubber:(BOOL)a3
{
  if (self->_liveStreamingControlsIncludeScrubber != a3)
  {
    self->_liveStreamingControlsIncludeScrubber = a3;
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  if (self->_showsLoadingIndicator != a3)
  {
    self->_showsLoadingIndicator = a3;
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  objc_super v35;
  CGSize result;

  v35.receiver = self;
  v35.super_class = (Class)AVTransportControlsView;
  -[AVTransportControlsView intrinsicContentSize](&v35, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden");

    if ((v10 & 1) == 0)
    {
      -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransportControlsView frame](self, "frame");
      objc_msgSend(v22, "systemLayoutSizeFittingSize:", v27, v28);
      v11 = v29;
LABEL_10:

      goto LABEL_11;
    }
  }
  v11 = 0.01;
  if (-[AVTransportControlsView isShowingScrubInstructions](self, "isShowingScrubInstructions")
    && -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"))
  {
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleRowLayoutMargins");
    v14 = v13;
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleRowLayoutMarginsWhenShowingScrubInstructions");
    v17 = v14 - v16;

    if (v17 >= 0.0)
      v18 = v17;
    else
      v18 = -v17;
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "spacingBetweenScrubInstructionsAndScrubber");
    v21 = v20;

    -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    objc_msgSend(v22, "sizeThatFits:", v24, v25);
    v11 = v26 - (v18 + v21);

    goto LABEL_10;
  }
LABEL_11:
  -[AVTransportControlsView extrinsicContentSize](self, "extrinsicContentSize");
  if (v4 < v30)
    v4 = v30;
  -[AVTransportControlsView extrinsicContentSize](self, "extrinsicContentSize");
  if (v6 >= v31)
    v32 = v6;
  else
    v32 = v31;
  v33 = v11 + v32;
  v34 = v4;
  result.height = v33;
  result.width = v34;
  return result;
}

- (BOOL)isShowingScrubInstructions
{
  return self->_showingScrubInstructions;
}

void __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setText:", v3);

}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  UIView *v5;
  UIView *customContentTransitioningInfoPanel;
  char v7;
  UIView *v8;

  v5 = (UIView *)a3;
  customContentTransitioningInfoPanel = self->_customContentTransitioningInfoPanel;
  if (customContentTransitioningInfoPanel != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](customContentTransitioningInfoPanel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, a3);
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
    v7 = -[AVTransportControlsView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor");
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      -[AVTransportControlsView layoutIfNeeded](self, "layoutIfNeeded");
      v5 = v8;
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTransportControlsView;
  -[AVTransportControlsView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[AVTransportControlsView _updateFontSizes](self, "_updateFontSizes");
}

- (float)volumeControlsControllerTransportBarHeight:(id)a3
{
  return 0.0;
}

- (void)setDoubleRowLayoutEnabled:(BOOL)a3
{
  if (self->_doubleRowLayoutEnabled != a3)
  {
    self->_doubleRowLayoutEnabled = a3;
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyleSheet:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVTransportControlsView _updateFontSizes](self, "_updateFontSizes");
    -[AVTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutHeightThatFitsRowsStartingWithRow:", a3);
  v6 = v5;

  return v6;
}

- (void)scrubberSlowKnobMovementDetected:(id)a3
{
  if (-[AVTransportControlsView canShowScrubInstructions](self, "canShowScrubInstructions", a3))
    -[AVTransportControlsView _showScrubInstructions](self, "_showScrubInstructions");
}

- (void)beginScrubbing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AVTransportControlsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControls:scrubberDidBeginScrubbing:", self, v4);

  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

}

- (void)scrubberValueChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTransportControlsView _updateScrubInstructionsLabelsText](self, "_updateScrubInstructionsLabelsText");
  -[AVTransportControlsView _updateScrubInstructionsFrame](self, "_updateScrubInstructionsFrame");
  -[AVTransportControlsView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControls:scrubberDidScrub:", self, v4);

}

- (void)endScrubbing:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  LODWORD(v5) = 0;
  -[AVTransportControlsView setScrubberValueWhenScrubInstructionsTimerBegan:](self, "setScrubberValueWhenScrubInstructionsTimerBegan:", v5);
  -[AVTransportControlsView scrubInstructionsTimer](self, "scrubInstructionsTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[AVTransportControlsView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportControls:scrubberDidEndScrubbing:", self, v4);

  if (-[AVTransportControlsView canShowScrubInstructions](self, "canShowScrubInstructions"))
  {
    if (-[AVTransportControlsView isShowingScrubInstructions](self, "isShowingScrubInstructions"))
    {
      -[AVTransportControlsView setShowingScrubInstructions:](self, "setShowingScrubInstructions:", 0);
      v8[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__AVTransportControlsView_endScrubbing___block_invoke;
      v9[3] = &unk_1E5BB4CA0;
      v9[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__AVTransportControlsView_endScrubbing___block_invoke_2;
      v8[3] = &unk_1E5BB3010;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 133126, v9, v8, 0.3, 0.0);
    }
  }
}

- (double)_doubleRowLayoutSpacingAfterSubview:(id)a3
{
  id v4;
  double Width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  id v26;
  id v27;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  double v40;
  CGRect v41;

  v4 = a3;
  -[AVTransportControlsView bounds](self, "bounds");
  Width = CGRectGetWidth(v41);
  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView skipForwardButton](self, "skipForwardButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isIncluded") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[AVTransportControlsView startRightwardContentTransitionButton](self, "startRightwardContentTransitionButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isIncluded");

    v8 = v10 ^ 1;
  }

  -[AVTransportControlsView skipBackButton](self, "skipBackButton");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 != v4)
  {
    v12 = (void *)v11;
    -[AVTransportControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 == v4)
    {

    }
    else
    {
      v14 = (void *)v13;
      -[AVTransportControlsView mediaSelectionButton](self, "mediaSelectionButton");
      v15 = objc_claimAutoreleasedReturnValue();
      if ((id)v15 == v4)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[AVTransportControlsView standardPlayPauseButton](self, "standardPlayPauseButton");
        v17 = objc_claimAutoreleasedReturnValue();
        if ((id)v17 == v4)
          v18 = v8;
        else
          v18 = 1;
        if (v18 == 1)
        {
          v19 = (void *)v17;
          -[AVTransportControlsView playbackSpeedButton](self, "playbackSpeedButton");
          v20 = objc_claimAutoreleasedReturnValue();
          if ((id)v20 != v4)
          {
            v21 = (void *)v20;
            -[AVTransportControlsView controlOverflowButton](self, "controlOverflowButton");
            v22 = (id)objc_claimAutoreleasedReturnValue();

            if (v22 == v4)
            {
              v25 = 32.0;
              goto LABEL_30;
            }
            -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
            v23 = (id)objc_claimAutoreleasedReturnValue();

            if (v23 == v4)
            {
              -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "intrinsicContentSize");
              v31 = Width - v30;
              objc_msgSend(v6, "contentLayoutMargins");
              v33 = v31 - v32;
              objc_msgSend(v6, "contentLayoutMargins");
              v25 = v33 - v34;

              -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isIncluded");

              if (v36)
              {
                -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                -[AVTransportControlsView liveBroadcastScrubberLabel](self, "liveBroadcastScrubberLabel");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "isIncluded");

                if (!v39)
                  goto LABEL_30;
                -[AVTransportControlsView liveBroadcastScrubberLabel](self, "liveBroadcastScrubberLabel");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v12 = v37;
              objc_msgSend(v37, "intrinsicContentSize");
              v25 = v25 - v40;
              goto LABEL_29;
            }
            -[AVTransportControlsView routePickerView](self, "routePickerView");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = 0.0;
            if ((id)v24 != v4)
            {
              v12 = (void *)v24;
              -[AVTransportControlsView skipForwardButton](self, "skipForwardButton");
              v26 = (id)objc_claimAutoreleasedReturnValue();
              if (v26 != v4)
              {
                -[AVTransportControlsView startRightwardContentTransitionButton](self, "startRightwardContentTransitionButton");
                v27 = (id)objc_claimAutoreleasedReturnValue();
                if (v27 != v4)
                {
                  -[AVTransportControlsView standardPlayPauseButton](self, "standardPlayPauseButton");

                }
              }

              goto LABEL_29;
            }
            goto LABEL_21;
          }

        }
        else
        {

        }
      }

    }
    v25 = 32.0;
    goto LABEL_29;
  }
  v25 = 32.0;
LABEL_21:
  v12 = v4;
LABEL_29:

LABEL_30:
  return v25;
}

- (void)_layoutDoubleRowViews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  double v82;
  double Width;
  uint64_t j;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _QWORD v102[4];
  _QWORD v103[11];
  _QWORD v104[3];
  _QWORD v105[2];
  _QWORD v106[3];
  CGRect v107;

  v106[1] = *MEMORY[0x1E0C80C00];
  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleRowLayoutMargins");
  objc_msgSend(v3, "setContentLayoutMargins:");

  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 == 1.0)
  {
    -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleRowLayoutMarginsWhenShowingScrubInstructions");
  }
  else
  {
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_4;
    v31 = (void *)v30;
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isHidden");

    if ((v33 & 1) != 0)
      goto LABEL_4;
    -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView styleSheet](self, "styleSheet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doublerowLayoutMarginsWhenShowingCustomContentInfo");
  }
  objc_msgSend(v8, "setContentLayoutMargins:");

LABEL_4:
  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLoadingIndicatorAlignment:", 2);

  -[AVTransportControlsView doubleRowViews](self, "doubleRowViews");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView scrubber](self, "scrubber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v12;
  -[AVTransportControlsView liveBroadcastLabel](self, "liveBroadcastLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView elapsedTimeLabel](self, "elapsedTimeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v14;
  -[AVTransportControlsView timeRemainingLabel](self, "timeRemainingLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v15;
  -[AVTransportControlsView liveBroadcastScrubberLabel](self, "liveBroadcastScrubberLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView routePickerView](self, "routePickerView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v90;
  -[AVTransportControlsView flexibleViewAfterRoutePickerView](self, "flexibleViewAfterRoutePickerView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v89;
  -[AVTransportControlsView startLeftwardContentTransitionButton](self, "startLeftwardContentTransitionButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v88;
  -[AVTransportControlsView skipBackButton](self, "skipBackButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v17;
  -[AVTransportControlsView standardPlayPauseButton](self, "standardPlayPauseButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v18;
  -[AVTransportControlsView skipForwardButton](self, "skipForwardButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v19;
  -[AVTransportControlsView startRightwardContentTransitionButton](self, "startRightwardContentTransitionButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v20;
  -[AVTransportControlsView flexibleViewAfterSkipForwardButtons](self, "flexibleViewAfterSkipForwardButtons");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v21;
  -[AVTransportControlsView mediaSelectionButton](self, "mediaSelectionButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v103[8] = v22;
  -[AVTransportControlsView playbackSpeedButton](self, "playbackSpeedButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[9] = v23;
  -[AVTransportControlsView controlOverflowButton](self, "controlOverflowButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[10] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v28;
  }
  else
  {
    v29 = v25;
  }
  -[AVTransportControlsView flexibleViewAfterSkipForwardButtons](self, "flexibleViewAfterSkipForwardButtons");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutAttributes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0C9D820];
  v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v35, "setMinimumSize:", *MEMORY[0x1E0C9D820], v37);

  -[AVTransportControlsView flexibleViewAfterRoutePickerView](self, "flexibleViewAfterRoutePickerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutAttributes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMinimumSize:", v36, v37);

  -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v93;
  v102[1] = v92;
  v102[2] = v94;
  v102[3] = v29;
  v91 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setArrangedSubviews:", v41);

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v42 = v95;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v98 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        objc_msgSend(v47, "layoutAttributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransportControlsView _doubleRowLayoutSpacingAfterSubview:](self, "_doubleRowLayoutSpacingAfterSubview:", v47);
        objc_msgSend(v48, "setTrailingInterItemSpace:");

        objc_msgSend(v47, "layoutAttributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setDisplayPriority:", -[AVTransportControlsView _layoutItemDisplayPriorityForSubview:](self, "_layoutItemDisplayPriorityForSubview:", v47));

        -[AVTransportControlsView scrubber](self, "scrubber");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47 == v50)
        {
          objc_msgSend(v47, "layoutAttributes");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTransportControlsView styleSheet](self, "styleSheet");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "minimumScrubberSize");
          objc_msgSend(v57, "setMinimumSize:");

        }
        else
        {
          -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47 != v51)
            continue;
          -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {
            -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTransportControlsView frame](self, "frame");
            objc_msgSend(v53, "systemLayoutSizeFittingSize:", v54, v55);
            v96 = v56;
          }
          else
          {
            -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "bounds");
            objc_msgSend(v53, "sizeThatFits:", v60, v61);
            v96 = v62;

          }
          -[AVTransportControlsView bounds](self, "bounds");
          v64 = v63;
          v66 = v65;
          v68 = v67;
          v70 = v69;
          -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "contentLayoutMargins");
          v73 = v72;
          v75 = v74;
          v77 = v76;
          v79 = v78;
          v80 = -[AVTransportControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
          if (v80 == 1)
            v81 = v79;
          else
            v81 = v75;
          if (v80 == 1)
            v82 = v75;
          else
            v82 = v79;
          v107.origin.x = v64 + v81;
          v107.origin.y = v66 + v73;
          v107.size.width = v68 - (v81 + v82);
          v107.size.height = v70 - (v73 + v77);
          Width = CGRectGetWidth(v107);

          objc_msgSend(v47, "layoutAttributes");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setMinimumSize:", Width, v96);
        }

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
    }
    while (v44);
  }

  for (j = 0; j != 4; ++j)
  {
    -[AVTransportControlsView _rowSpacingForDoubleRowLayoutAfterRow:](self, "_rowSpacingForDoubleRowLayoutAfterRow:", j);
    v86 = v85;
    -[AVTransportControlsView controlsLayoutView](self, "controlsLayoutView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setRowSpacing:afterRow:", j, v86);

  }
}

- (double)_rowSpacingForDoubleRowLayoutAfterRow:(unint64_t)a3
{
  _BOOL4 v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v5 = -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
  v6 = 0.0;
  if (!a3 && v5)
  {
    -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isHiddenOrHasHiddenAncestor");

      if (v10)
        v6 = 0.0;
      else
        v6 = 12.0;
    }
  }
  if (((a3 == 1) & -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled")) != 0)
    v6 = 4.5;
  v11 = -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled");
  if (!a3 && v11)
  {
    -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alpha");
    v14 = v13;

    if (v14 == 1.0)
    {
      -[AVTransportControlsView styleSheet](self, "styleSheet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "spacingBetweenScrubInstructionsAndScrubber");
      v6 = v16;

    }
  }
  return v6;
}

- (void)_showScrubInstructions
{
  NSObject *v3;
  double Width;
  void *v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  CGRect v13;

  if (!-[AVTransportControlsView canShowScrubInstructions](self, "canShowScrubInstructions"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Do not call this method when showing the content info panel.", buf, 2u);
    }

  }
  -[AVTransportControlsView bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  -[AVTransportControlsView styleSheet](self, "styleSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleRowLayoutMargins");
  if (Width <= v6)
  {

  }
  else
  {
    v7 = -[AVTransportControlsView isShowingScrubInstructions](self, "isShowingScrubInstructions");

    if (!v7)
    {
      -[AVTransportControlsView setShowingScrubInstructions:](self, "setShowingScrubInstructions:", 1);
      v8 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke;
      v11[3] = &unk_1E5BB4CA0;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
      v9[4] = self;
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke_2;
      v10[3] = &unk_1E5BB4CA0;
      v10[4] = self;
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke_3;
      v9[3] = &unk_1E5BB3010;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 133122, v10, v9, 0.3, 0.0);
    }
  }
}

- (void)_updateScrubInstructionsLabelsText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributedText:", 0);

    -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", 0);
  }
  else
  {
    -[AVTransportControlsView _scrubInstructionsAttributedText](self, "_scrubInstructionsAttributedText");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isEqualToAttributedString:", v6);

    if ((v7 & 1) == 0)
    {
      -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransportControlsView _scrubInstructionsAttributedText](self, "_scrubInstructionsAttributedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributedText:", v9);

      -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransportControlsView _scrubInstructionsAttributedText](self, "_scrubInstructionsAttributedText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedText:", v11);

    }
  }

}

- (void)_updateScrubInstructionsFrame
{
  CGFloat v3;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  CGFloat v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;

  -[AVTransportControlsView frame](self, "frame");
  v3 = CGRectGetMinY(v37) + -8.0;
  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v3 - v5 + -20.0;

  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8 + 20.0;

  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11 + 20.0;

  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v6, v9, v12);

  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intrinsicContentSize");
  v17 = v16;
  -[AVTransportControlsView detachedScrubInstructionsBackdropLabel](self, "detachedScrubInstructionsBackdropLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intrinsicContentSize");
  objc_msgSend(v14, "setFrame:", 10.0, 10.0, v17, v19);

  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView center](self, "center");
  v22 = v21;
  -[AVTransportControlsView detachedExtraContentLayoutView](self, "detachedExtraContentLayoutView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "center");
  objc_msgSend(v20, "setCenter:", v22);

  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  objc_msgSend(v24, "sizeThatFits:", v26, v27);
  v29 = v28;
  v31 = v30;

  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", 0.0, 0.0, v29, v31);

  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView embeddedExtraContentContainer](self, "embeddedExtraContentContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v34 = CGRectGetWidth(v38) * 0.5;
  -[AVTransportControlsView scrubInstructionsLabel](self, "scrubInstructionsLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "center");
  objc_msgSend(v36, "setCenter:", v34);

}

- (id)_scrubInstructionsAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  AVLocalizedString(CFSTR("PLAYBACK_CONTROLS_VIEW_CONTROLLER_SCRUB_INSTRUCTIONS_SLIDE_UP_TITLE_LABEL_TEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView scrubber](self, "scrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedScrubbingSpeedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4AB8];
  -[AVTransportControlsView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v10, "systemFontOfSize:weight:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v24 = *MEMORY[0x1E0DC1138];
  v13 = v24;
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v3, v14);

  v16 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v13;
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v18);

  objc_msgSend(v19, "appendAttributedString:", v15);
  v20 = (void *)objc_msgSend(v19, "copy");

  return v20;
}

- (NSArray)doubleRowViews
{
  AVScrubber *scrubber;
  AVChromedLabel *liveBroadcastLabel;
  AVChromedLabel *elapsedTimeLabel;
  AVChromedLabel *timeRemainingLabel;
  AVChromedLabel *liveBroadcastScrubberLabel;
  AVPlaybackControlsRoutePickerView *routePickerView;
  AVTouchIgnoringView *flexibleViewAfterRoutePickerView;
  AVButton *skipBackButton;
  AVButton *startLeftwardContentTransitionButton;
  AVButton *standardPlayPauseButton;
  AVButton *startRightwardContentTransitionButton;
  AVButton *skipForwardButton;
  AVTouchIgnoringView *flexibleViewAfterSkipForwardButtons;
  AVButton *playbackSpeedButton;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[18];

  v22[17] = *MEMORY[0x1E0C80C00];
  scrubber = self->_scrubber;
  liveBroadcastLabel = self->_liveBroadcastLabel;
  elapsedTimeLabel = self->_elapsedTimeLabel;
  timeRemainingLabel = self->_timeRemainingLabel;
  liveBroadcastScrubberLabel = self->_liveBroadcastScrubberLabel;
  routePickerView = self->_routePickerView;
  flexibleViewAfterRoutePickerView = self->_flexibleViewAfterRoutePickerView;
  v22[0] = self->_embeddedExtraContentContainer;
  v22[1] = scrubber;
  skipBackButton = self->_skipBackButton;
  v22[2] = liveBroadcastLabel;
  v22[3] = elapsedTimeLabel;
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v22[4] = timeRemainingLabel;
  v22[5] = liveBroadcastScrubberLabel;
  standardPlayPauseButton = self->_standardPlayPauseButton;
  v22[6] = routePickerView;
  v22[7] = flexibleViewAfterRoutePickerView;
  startRightwardContentTransitionButton = self->_startRightwardContentTransitionButton;
  v22[8] = skipBackButton;
  v22[9] = startLeftwardContentTransitionButton;
  skipForwardButton = self->_skipForwardButton;
  v22[10] = standardPlayPauseButton;
  v22[11] = startRightwardContentTransitionButton;
  flexibleViewAfterSkipForwardButtons = self->_flexibleViewAfterSkipForwardButtons;
  v22[12] = skipForwardButton;
  v22[13] = flexibleViewAfterSkipForwardButtons;
  playbackSpeedButton = self->_playbackSpeedButton;
  v22[14] = self->_mediaSelectionButton;
  v22[15] = playbackSpeedButton;
  v22[16] = self->_controlOverflowButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AVTransportControlsView customMenuItemsViews](self, "customMenuItemsViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
  }
  return (NSArray *)v17;
}

- (BOOL)canShowScrubInstructions
{
  void *v2;
  BOOL v3;

  -[AVTransportControlsView customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (AVTransportControlsViewDelegate)delegate
{
  return (AVTransportControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)transportViewIncludesVolumeController
{
  return self->_transportViewIncludesVolumeController;
}

- (double)minimumRequiredWidth
{
  return self->_minimumRequiredWidth;
}

- (void)setDetachedExtraContentLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_detachedExtraContentLayoutView, a3);
}

- (NSTimer)scrubInstructionsTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_scrubInstructionsTimer);
}

- (void)setScrubInstructionsTimer:(id)a3
{
  objc_storeWeak((id *)&self->_scrubInstructionsTimer, a3);
}

- (float)scrubberValueWhenScrubInstructionsTimerBegan
{
  return self->_scrubberValueWhenScrubInstructionsTimerBegan;
}

- (void)setScrubberValueWhenScrubInstructionsTimerBegan:(float)a3
{
  self->_scrubberValueWhenScrubInstructionsTimerBegan = a3;
}

- (AVTouchIgnoringView)flexibleViewAfterRoutePickerView
{
  return self->_flexibleViewAfterRoutePickerView;
}

- (void)setFlexibleViewAfterRoutePickerView:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleViewAfterRoutePickerView, a3);
}

- (AVTouchIgnoringView)flexibleViewAfterSkipForwardButtons
{
  return self->_flexibleViewAfterSkipForwardButtons;
}

- (void)setFlexibleViewAfterSkipForwardButtons:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleViewAfterSkipForwardButtons, a3);
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setShowingScrubInstructions:(BOOL)a3
{
  self->_showingScrubInstructions = a3;
}

- (BOOL)isAnimatingScrubInstructions
{
  return self->_animatingScrubInstructions;
}

- (void)setAnimatingScrubInstructions:(BOOL)a3
{
  self->_animatingScrubInstructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexibleViewAfterSkipForwardButtons, 0);
  objc_storeStrong((id *)&self->_flexibleViewAfterRoutePickerView, 0);
  objc_destroyWeak((id *)&self->_scrubInstructionsTimer);
  objc_storeStrong((id *)&self->_detachedScrubInstructionsBackdropLabel, 0);
  objc_storeStrong((id *)&self->_scrubInstructionsLabel, 0);
  objc_storeStrong((id *)&self->_embeddedExtraContentContainer, 0);
  objc_storeStrong((id *)&self->_liveBroadcastScrubberLabel, 0);
  objc_storeStrong((id *)&self->_liveBroadcastLabel, 0);
  objc_storeStrong((id *)&self->_detachedExtraContentLayoutView, 0);
  objc_storeStrong((id *)&self->_controlsLayoutView, 0);
  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, 0);
  objc_storeStrong((id *)&self->_customMenuItemsViews, 0);
  objc_storeStrong((id *)&self->_customItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_controlOverflowButton, 0);
  objc_storeStrong((id *)&self->_mediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_routePickerView, 0);
  objc_storeStrong((id *)&self->_startRightwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_startLeftwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_standardPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__AVTransportControlsView__showScrubInstructions__block_invoke(uint64_t a1)
{
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
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_updateScrubInstructionsLabelsText");
  objc_msgSend(*(id *)(a1 + 32), "_updateScrubInstructionsFrame");
  objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "embeddedExtraContentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled"));

  objc_msgSend(*(id *)(a1 + 32), "embeddedExtraContentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsed:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled") ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled"));

  objc_msgSend(*(id *)(a1 + 32), "detachedScrubInstructionsBackdropLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "detachedScrubInstructionsBackdropLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v12);

  objc_msgSend(*(id *)(a1 + 32), "detachedScrubInstructionsBackdropLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v13);

}

void __49__AVTransportControlsView__showScrubInstructions__block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingScrubInstructions:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    if (!objc_msgSend(v3, "isDoubleRowLayoutEnabled"))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "detachedScrubInstructionsBackdropLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "setAlpha:", 1.0);

LABEL_6:
  if (objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transportControlsNeedsLayoutIfNeeded:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __49__AVTransportControlsView__showScrubInstructions__block_invoke_3(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimatingScrubInstructions:", a2 ^ 1u);
}

void __40__AVTransportControlsView_endScrubbing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingScrubInstructions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "detachedScrubInstructionsBackdropLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "embeddedExtraContentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsed:", 1);

  objc_msgSend(*(id *)(a1 + 32), "embeddedExtraContentContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncluded:", 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportControlsNeedsLayoutIfNeeded:", *(_QWORD *)(a1 + 32));

}

void __40__AVTransportControlsView_endScrubbing___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatingScrubInstructions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "avkit_reevaluateHiddenStateOfItem:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "scrubInstructionsLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "detachedScrubInstructionsBackdropLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "detachedExtraContentLayoutView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
}

@end

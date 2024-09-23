@implementation CSProminentDisplayView

- (void)_updateEffectiveDisplayDate
{
  id v3;

  -[CSProminentDisplayView _effectiveDisplayDate](self, "_effectiveDisplayDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSProminentTimeView setDate:](self->_timeView, "setDate:", v3);
  -[CSProminentTextElementView setDate:](self->_subtitleView, "setDate:", v3);
  -[CSProminentLayoutController setFourDigitTime:](self->_layoutController, "setFourDigitTime:", -[CSProminentTimeView fourDigitTime](self->_timeView, "fourDigitTime"));

}

- (void)setDisplayDate:(id)a3
{
  NSDate *v4;
  NSDate *displayDate;
  id v6;

  v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_displayDate, "isEqualToDate:"))
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    displayDate = self->_displayDate;
    self->_displayDate = v4;

    -[CSProminentDisplayView _updateEffectiveDisplayDate](self, "_updateEffectiveDisplayDate");
  }

}

- (id)_effectiveDisplayDate
{
  NSDate *overrideDate;

  overrideDate = self->_overrideDate;
  if (!overrideDate)
    overrideDate = self->_displayDate;
  return overrideDate;
}

- (CSProminentDisplayView)initWithFrame:(CGRect)a3
{
  CSProminentDisplayView *v3;
  CSProminentLayoutController *v4;
  CSProminentLayoutController *layoutController;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _CSProminentDisplayBackgroundWrapperView *v14;
  _CSProminentDisplayBackgroundWrapperView *backgroundWrapperView;
  uint64_t v16;
  BSUIOrientationTransformWrapperView *backgroundTransformView;
  uint64_t v18;
  BSUIVibrancyEffectView *vibrancyEffectView;
  uint64_t v20;
  BSUIVibrancyEffectView *timeVibrancyEffectView;
  uint64_t v22;
  NSMutableArray *pendedTransientSubtitleViews;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CSProminentDisplayView;
  v3 = -[CSProminentDisplayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[CSProminentLayoutController initWithTraitEnvironment:]([CSProminentLayoutController alloc], "initWithTraitEnvironment:", v3);
    layoutController = v3->_layoutController;
    v3->_layoutController = v4;

    v3->_subtitleAlpha = 1.0;
    -[CSProminentDisplayView bounds](v3, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[_CSProminentDisplayBackgroundWrapperView initWithFrame:]([_CSProminentDisplayBackgroundWrapperView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundWrapperView = v3->_backgroundWrapperView;
    v3->_backgroundWrapperView = v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01940]), "initWithFrame:", v7, v9, v11, v13);
    backgroundTransformView = v3->_backgroundTransformView;
    v3->_backgroundTransformView = (BSUIOrientationTransformWrapperView *)v16;

    -[BSUIOrientationTransformWrapperView setContainerOrientation:](v3->_backgroundTransformView, "setContainerOrientation:", 1);
    -[BSUIOrientationTransformWrapperView setContentOrientation:](v3->_backgroundTransformView, "setContentOrientation:", 1);
    -[BSUIOrientationTransformWrapperView addContentView:](v3->_backgroundTransformView, "addContentView:", v3->_backgroundWrapperView);
    -[BSUIOrientationTransformWrapperView setCounterTransformView:](v3->_backgroundTransformView, "setCounterTransformView:", 1);
    -[CSProminentDisplayView addSubview:](v3, "addSubview:", v3->_backgroundTransformView);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01960]), "initWithFrame:", v7, v9, v11, v13);
    vibrancyEffectView = v3->_vibrancyEffectView;
    v3->_vibrancyEffectView = (BSUIVibrancyEffectView *)v18;

    -[CSProminentDisplayView addSubview:](v3, "addSubview:", v3->_vibrancyEffectView);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01960]), "initWithFrame:", v7, v9, v11, v13);
    timeVibrancyEffectView = v3->_timeVibrancyEffectView;
    v3->_timeVibrancyEffectView = (BSUIVibrancyEffectView *)v20;

    -[CSProminentDisplayView addSubview:](v3, "addSubview:", v3->_timeVibrancyEffectView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    pendedTransientSubtitleViews = v3->_pendedTransientSubtitleViews;
    v3->_pendedTransientSubtitleViews = (NSMutableArray *)v22;

    -[CSProminentDisplayView _setUpTimeStringOverriding](v3, "_setUpTimeStringOverriding");
  }
  return v3;
}

- (id)_contentView
{
  void *v3;
  void *v4;
  id v5;

  -[BSUIVibrancyEffectView contentView](self->_vibrancyEffectView, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
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
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  objc_super v100;

  v100.receiver = self;
  v100.super_class = (Class)CSProminentDisplayView;
  -[CSProminentDisplayView layoutSubviews](&v100, sel_layoutSubviews);
  -[CSProminentDisplayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BSUIOrientationTransformWrapperView setFrame:](self->_backgroundTransformView, "setFrame:");
  -[CSProminentDisplayView layoutController](self, "layoutController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentDisplayView _contentView](self, "_contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSProminentDisplayView shouldApplyVibrancyToComplications](self, "shouldApplyVibrancyToComplications"))
    v13 = 31;
  else
    v13 = 3;
  if (self->_usesEditingLayout)
  {
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", v13, 2, v4, v6, v8, v10);
    v94 = v15;
    v95 = v14;
    v92 = v17;
    v93 = v16;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 2, 2, v4, v6, v8, v10);
    v99 = v18;
    v97 = v20;
    v98 = v19;
    v96 = v21;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 4, 2, v4, v6, v8, v10);
    v82 = v23;
    v83 = v22;
    v80 = v25;
    v81 = v24;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 1, 2, v4, v6, v8, v10);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 8, 2, v4, v6, v8, v10);
    v90 = v35;
    v91 = v34;
    v88 = v37;
    v89 = v36;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 16, 2, v4, v6, v8, v10);
  }
  else
  {
    objc_msgSend(v11, "frameForElements:withBoundingRect:", v13, v4, v6, v8, v10);
    v94 = v43;
    v95 = v42;
    v92 = v45;
    v93 = v44;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 2, v4, v6, v8, v10);
    v99 = v46;
    v97 = v48;
    v98 = v47;
    v96 = v49;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 4, v4, v6, v8, v10);
    v82 = v51;
    v83 = v50;
    v80 = v53;
    v81 = v52;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 1, v4, v6, v8, v10);
    v27 = v54;
    v29 = v55;
    v31 = v56;
    v33 = v57;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 8, v4, v6, v8, v10);
    v90 = v59;
    v91 = v58;
    v88 = v61;
    v89 = v60;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 16, v4, v6, v8, v10);
  }
  v86 = v39;
  v87 = v38;
  v84 = v41;
  v85 = v40;
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyEffectView, "setFrame:", v95, v94, v93, v92);
  -[BSUIVibrancyEffectView setFrame:](self->_timeVibrancyEffectView, "setFrame:", v27, v29, v31, v33);
  -[CSProminentDisplayView _complicationsSuperview](self, "_complicationsSuperview");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "convertRect:fromView:", self, v83, v82, v81, v80);
  -[CSProminentEmptyElementView setFrame:](self->_subtitleComplicationView, "setFrame:");
  objc_msgSend(v12, "convertRect:fromView:", self, v99, v98, v97, v96);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  -[CSProminentTextElementView setFrame:](self->_subtitleView, "setFrame:");
  -[CSProminentTextElementView setFrame:](self->_customSubtitleView, "setFrame:", v64, v66, v68, v70);
  -[CSProminentTextElementView setFrame:](self->_transientSubtitleView, "setFrame:", v64, v66, v68, v70);
  -[BSUIVibrancyEffectView contentView](self->_timeVibrancyEffectView, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "convertRect:fromView:", self, v27, v29, v31, v33);
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;

  -[CSProminentTimeView setFrame:](self->_timeView, "setFrame:", v73, v75, v77, v79);
  objc_msgSend(v62, "convertRect:fromView:", self, v91, v90, v89, v88);
  -[CSProminentEmptyElementView setFrame:](self->_complicationRowView, "setFrame:");
  objc_msgSend(v62, "convertRect:fromView:", self, v87, v86, v85, v84);
  -[CSProminentEmptyElementView setFrame:](self->_complicationSidebarView, "setFrame:");

}

- (void)setVibrancyShadowView:(id)a3
{
  BSUIVibrancyShadowView *v5;
  BSUIVibrancyShadowView *vibrancyShadowView;
  BSUIVibrancyShadowView *v7;

  v5 = (BSUIVibrancyShadowView *)a3;
  vibrancyShadowView = self->_vibrancyShadowView;
  v7 = v5;
  if (vibrancyShadowView != v5)
  {
    -[BSUIVibrancyShadowView removeFromSuperview](vibrancyShadowView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_vibrancyShadowView, a3);
    -[_CSProminentDisplayBackgroundWrapperView setWrappedView:](self->_backgroundWrapperView, "setWrappedView:", v7);
  }

}

- (void)setTimeView:(id)a3
{
  CSProminentTimeView *v5;
  CSProminentTimeView **p_timeView;
  CSProminentTimeView *timeView;
  void *v8;
  void *v9;
  CSProminentTimeView *v10;

  v5 = (CSProminentTimeView *)a3;
  p_timeView = &self->_timeView;
  timeView = self->_timeView;
  if (timeView != v5)
  {
    v10 = v5;
    -[CSProminentTimeView removeFromSuperview](timeView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_timeView, a3);
    -[CSProminentDisplayView timeVibrancyEffectView](self, "timeVibrancyEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_timeView);

    v5 = v10;
  }

}

- (void)setSubtitleView:(id)a3
{
  CSProminentTextElementView *v5;
  CSProminentTextElementView **p_subtitleView;
  CSProminentTextElementView *subtitleView;
  void *v8;
  CSProminentTextElementView *v9;

  v5 = (CSProminentTextElementView *)a3;
  p_subtitleView = &self->_subtitleView;
  subtitleView = self->_subtitleView;
  if (subtitleView != v5)
  {
    v9 = v5;
    -[CSProminentTextElementView removeFromSuperview](subtitleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subtitleView, a3);
    -[CSProminentDisplayView _updateAlphaForNonTransientSubtitleViews](self, "_updateAlphaForNonTransientSubtitleViews");
    -[CSProminentDisplayView _updateVisibilityForNonTransientSubtitleViews](self, "_updateVisibilityForNonTransientSubtitleViews");
    -[CSProminentDisplayView _contentView](self, "_contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_subtitleView);

    v5 = v9;
  }

}

- (void)setTransientSubtitleView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setAlpha:", self->_subtitleAlpha);
    -[CSProminentTextElementView textLabel](self->_transientSubtitleView, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "isEqualToString:", v8)
      || -[NSMutableArray count](self->_pendedTransientSubtitleViews, "count"))
    {
      self->_hasClearedSinceLastAddedTransient = 0;
      -[NSMutableArray addObject:](self->_pendedTransientSubtitleViews, "addObject:", v9);
      -[CSProminentDisplayView _transitionToNextPendedSubtitleIfNecessary](self, "_transitionToNextPendedSubtitleIfNecessary");
    }

  }
  else
  {
    if (-[NSMutableArray count](self->_pendedTransientSubtitleViews, "count"))
      -[NSMutableArray removeAllObjects](self->_pendedTransientSubtitleViews, "removeAllObjects");
    self->_hasClearedSinceLastAddedTransient = 1;
    if (!self->_animatingTransientSubtitleTransition)
      -[CSProminentDisplayView _showTransientSubtitleView:withDelay:](self, "_showTransientSubtitleView:withDelay:", 0, 0.25);
  }

}

- (void)setCustomSubtitleView:(id)a3
{
  CSProminentTextElementView *v5;
  CSProminentTextElementView **p_customSubtitleView;
  CSProminentTextElementView *customSubtitleView;
  void *v8;
  CSProminentTextElementView *v9;

  v5 = (CSProminentTextElementView *)a3;
  p_customSubtitleView = &self->_customSubtitleView;
  customSubtitleView = self->_customSubtitleView;
  if (customSubtitleView != v5)
  {
    v9 = v5;
    -[CSProminentTextElementView removeFromSuperview](customSubtitleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customSubtitleView, a3);
    -[CSProminentDisplayView _updateAlphaForNonTransientSubtitleViews](self, "_updateAlphaForNonTransientSubtitleViews");
    -[CSProminentDisplayView _updateVisibilityForNonTransientSubtitleViews](self, "_updateVisibilityForNonTransientSubtitleViews");
    -[CSProminentDisplayView _contentView](self, "_contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_customSubtitleView);

    v5 = v9;
  }

}

- (void)setSubtitleAlpha:(double)a3
{
  double subtitleAlpha;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  subtitleAlpha = self->_subtitleAlpha;
  self->_subtitleAlpha = a3;
  -[CSProminentTextElementView setAlpha:](self->_transientSubtitleView, "setAlpha:");
  -[CSProminentDisplayView _applyAlphaToNonTransientSubtitleViews:](self, "_applyAlphaToNonTransientSubtitleViews:", a3);
  if (BSFloatIsZero()
    && subtitleAlpha != a3
    && (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled") & 1) == 0)
  {
    -[CSProminentTextElementView layer](self->_subtitleView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));

    -[CSProminentEmptyElementView layer](self->_subtitleComplicationView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAnimationForKey:", CFSTR("opacity"));

    -[CSProminentTextElementView layer](self->_transientSubtitleView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("opacity"));

    -[CSProminentTextElementView layer](self->_customSubtitleView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("opacity"));

  }
}

- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_backgroundTransformView, "setContainerOrientation:");
  -[_CSProminentDisplayBackgroundWrapperView layoutIfNeeded](self->_backgroundWrapperView, "layoutIfNeeded");
  -[CSProminentDisplayView _applyContainerOrientationToVibrancyShadowView:](self, "_applyContainerOrientationToVibrancyShadowView:", a3);
}

- (UIView)backgroundView
{
  return (UIView *)self->_backgroundTransformView;
}

- (void)_transitionToNextPendedSubtitleIfNecessary
{
  -[CSProminentDisplayView _transitionToNextPendedSubtitleIfNecessaryWithDelay:](self, "_transitionToNextPendedSubtitleIfNecessaryWithDelay:", 0.0);
}

- (void)_transitionToNextPendedSubtitleIfNecessaryWithDelay:(double)a3
{
  void *v5;
  CSProminentDisplayView *v6;
  void *v7;
  void *v8;

  if (!self->_animatingTransientSubtitleTransition)
  {
    -[NSMutableArray firstObject](self->_pendedTransientSubtitleViews, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = v5;
      -[NSMutableArray removeObject:](self->_pendedTransientSubtitleViews, "removeObject:", v5);
      v6 = self;
      v7 = v8;
    }
    else
    {
      if (!self->_hasClearedSinceLastAddedTransient || !self->_transientSubtitleView)
        goto LABEL_8;
      v6 = self;
      v8 = 0;
      v7 = 0;
    }
    -[CSProminentDisplayView _showTransientSubtitleView:withDelay:](v6, "_showTransientSubtitleView:withDelay:", v7, a3);
    v5 = v8;
LABEL_8:

  }
}

- (void)_showTransientSubtitleView:(id)a3
{
  -[CSProminentDisplayView _showTransientSubtitleView:withDelay:](self, "_showTransientSubtitleView:withDelay:", a3, 0.0);
}

- (void)_showTransientSubtitleView:(id)a3 withDelay:(double)a4
{
  CSProminentTextElementView *v7;
  CSProminentTextElementView **p_transientSubtitleView;
  CSProminentTextElementView *transientSubtitleView;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v7 = (CSProminentTextElementView *)a3;
  p_transientSubtitleView = &self->_transientSubtitleView;
  transientSubtitleView = self->_transientSubtitleView;
  if (transientSubtitleView != v7)
  {
    if (v7)
    {
      -[CSProminentTextElementView removeFromSuperview](transientSubtitleView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_transientSubtitleView, a3);
      -[CSProminentTextElementView setAlpha:](*p_transientSubtitleView, "setAlpha:", 0.0);
      -[CSProminentDisplayView _contentView](self, "_contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", *p_transientSubtitleView);

      -[CSProminentDisplayView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[CSProminentDisplayView _applyAlphaToNonTransientSubtitleViews:](self, "_applyAlphaToNonTransientSubtitleViews:", 0.0);
    }
    self->_animatingTransientSubtitleTransition = 1;
    self->_animatingTransientSubtitleTransitionToTransient = v7 != 0;
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke;
    v12[3] = &unk_1E55EAEE0;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_2;
    v11[3] = &unk_1E55EB1A8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v12, v11, 0.25, a4);
  }

}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 419))
    return objc_msgSend((id)v1, "_applyAlphaToNonTransientSubtitleViews:", 0.0);
  else
    return objc_msgSend(*(id *)(v1 + 488), "setAlpha:", 0.0);
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_3;
  v3[3] = &unk_1E55EAEE0;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_4;
  v2[3] = &unk_1E55EB1A8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "subtitleAlpha");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 488);
  if (*(_BYTE *)(v4 + 419))
    return objc_msgSend(v5, "setAlpha:", v2);
  objc_msgSend(v5, "removeFromSuperview");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 488);
  *(_QWORD *)(v7 + 488) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_applyAlphaToNonTransientSubtitleViews:", v3);
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "subtitleAlpha");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 419))
  {
    objc_msgSend((id)v4, "_applyAlphaToNonTransientSubtitleViews:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 488), "removeFromSuperview");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 488);
    *(_QWORD *)(v5 + 488) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_applyAlphaToNonTransientSubtitleViews:", v3);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 418) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToNextPendedSubtitleIfNecessaryWithDelay:", 1.25);
}

- (void)_applyAlphaToNonTransientSubtitleViews:(double)a3
{
  if (self->_transientSubtitleView)
    a3 = 0.0;
  -[CSProminentTextElementView setAlpha:](self->_customSubtitleView, "setAlpha:", a3);
  -[CSProminentEmptyElementView setAlpha:](self->_subtitleComplicationView, "setAlpha:", a3);
  -[CSProminentTextElementView setAlpha:](self->_subtitleView, "setAlpha:", a3);
}

- (void)_updateAlphaForNonTransientSubtitleViews
{
  -[CSProminentDisplayView subtitleAlpha](self, "subtitleAlpha");
  -[CSProminentDisplayView _applyAlphaToNonTransientSubtitleViews:](self, "_applyAlphaToNonTransientSubtitleViews:");
}

- (void)_updateVisibilityForNonTransientSubtitleViews
{
  CSProminentTextElementView *customSubtitleView;
  uint64_t v4;
  _BOOL8 v5;

  customSubtitleView = self->_customSubtitleView;
  v4 = (unint64_t)customSubtitleView | (unint64_t)self->_subtitleComplicationView;
  v5 = customSubtitleView != 0;
  -[CSProminentTextElementView setHidden:](customSubtitleView, "setHidden:", 0);
  -[CSProminentEmptyElementView setHidden:](self->_subtitleComplicationView, "setHidden:", v5);
  -[CSProminentTextElementView setHidden:](self->_subtitleView, "setHidden:", v4 != 0);
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  if (self->_usesEditingLayout != a3)
  {
    self->_usesEditingLayout = a3;
    -[CSProminentDisplayView setNeedsLayout](self, "setNeedsLayout");
    -[CSProminentDisplayView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setSubtitleComplicationView:(id)a3
{
  CSProminentEmptyElementView *v5;
  CSProminentEmptyElementView *subtitleComplicationView;
  CSProminentEmptyElementView *v7;

  v5 = (CSProminentEmptyElementView *)a3;
  subtitleComplicationView = self->_subtitleComplicationView;
  if (subtitleComplicationView != v5)
  {
    v7 = v5;
    -[CSProminentEmptyElementView removeFromSuperview](subtitleComplicationView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subtitleComplicationView, a3);
    -[CSProminentDisplayView _updateAlphaForNonTransientSubtitleViews](self, "_updateAlphaForNonTransientSubtitleViews");
    -[CSProminentDisplayView _updateVisibilityForNonTransientSubtitleViews](self, "_updateVisibilityForNonTransientSubtitleViews");
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", self->_subtitleComplicationView);
    v5 = v7;
  }

}

- (void)setComplicationRowView:(id)a3
{
  CSProminentEmptyElementView *v5;
  CSProminentEmptyElementView *complicationRowView;
  CSProminentEmptyElementView *v7;

  v5 = (CSProminentEmptyElementView *)a3;
  complicationRowView = self->_complicationRowView;
  v7 = v5;
  if (complicationRowView != v5)
  {
    -[CSProminentEmptyElementView removeFromSuperview](complicationRowView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_complicationRowView, a3);
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", v7);
  }

}

- (void)setComplicationSidebarView:(id)a3
{
  CSProminentEmptyElementView *v5;
  CSProminentEmptyElementView *complicationSidebarView;
  CSProminentEmptyElementView *v7;

  v5 = (CSProminentEmptyElementView *)a3;
  complicationSidebarView = self->_complicationSidebarView;
  v7 = v5;
  if (complicationSidebarView != v5)
  {
    -[CSProminentEmptyElementView removeFromSuperview](complicationSidebarView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_complicationSidebarView, a3);
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", v7);
  }

}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
  if (self->_shouldApplyVibrancyToComplications != a3)
  {
    self->_shouldApplyVibrancyToComplications = a3;
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", self->_subtitleComplicationView);
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", self->_complicationRowView);
    -[CSProminentDisplayView _addComplicationSubview:](self, "_addComplicationSubview:", self->_complicationSidebarView);
  }
}

- (id)_complicationsSuperview
{
  CSProminentDisplayView *v3;

  if (-[CSProminentDisplayView shouldApplyVibrancyToComplications](self, "shouldApplyVibrancyToComplications"))
  {
    -[CSProminentDisplayView _contentView](self, "_contentView");
    v3 = (CSProminentDisplayView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (void)_addComplicationSubview:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CSProminentDisplayView _complicationsSuperview](self, "_complicationsSuperview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v4)
    {
      objc_msgSend(v6, "removeFromSuperview");
      objc_msgSend(v4, "addSubview:", v6);
      -[CSProminentDisplayView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_applyContainerOrientationToVibrancyShadowView:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_vibrancyShadowView)
  {
    objc_msgSend(MEMORY[0x1E0D01970], "defaultShadowStartPoint");
    objc_msgSend(MEMORY[0x1E0D01970], "defaultShadowEndPoint");
    _UIConvertPointFromOrientationToOrientation();
    v5 = v4;
    v7 = v6;
    _UIConvertPointFromOrientationToOrientation();
    v9 = v8;
    v11 = v10;
    -[BSUIVibrancyShadowView setShadowStartPoint:](self->_vibrancyShadowView, "setShadowStartPoint:", v5, v7);
    -[BSUIVibrancyShadowView setShadowEndPoint:](self->_vibrancyShadowView, "setShadowEndPoint:", v9, v11);
  }
}

- (void)setNumberingSystem:(int64_t)a3
{
  -[CSProminentTimeView setNumberingSystem:](self->_timeView, "setNumberingSystem:");
  -[CSProminentLayoutController setNumberingSystem:](self->_layoutController, "setNumberingSystem:", a3);
  -[CSProminentDisplayView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride
{
  void *v2;
  void *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_onceToken != -1)
    dispatch_once(&_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_onceToken, block);
  objc_msgSend((id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:", sel_systemStatusServer);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A18]), "initWithServerHandle:", v3);
    v5 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain;
    _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain = v4;

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DB0A18]);
    v3 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain;
    _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain = (uint64_t)v6;
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_2;
  v7[3] = &__block_descriptor_40_e46_v16__0__STStatusBarOverridesStatusDomainData_8l;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain, "observeDataWithBlock:", v7);

}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a2, "customOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "dateFromEntriesIncludesTime") & 1) != 0
    || objc_msgSend(v3, "dateFromEntriesIncludesDate"))
  {
    objc_msgSend(v3, "dateFromEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "overrideObservingDisplayViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_3;
  v9[3] = &unk_1E55EB1D0;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_setOverrideDate:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (NSHashTable)overrideObservingDisplayViews
{
  if (overrideObservingDisplayViews_onceToken != -1)
    dispatch_once(&overrideObservingDisplayViews_onceToken, &__block_literal_global_2);
  return (NSHashTable *)(id)overrideObservingDisplayViews_sOverrideObservingDisplayViews;
}

void __55__CSProminentDisplayView_overrideObservingDisplayViews__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)overrideObservingDisplayViews_sOverrideObservingDisplayViews;
  overrideObservingDisplayViews_sOverrideObservingDisplayViews = v0;

}

- (void)_setUpTimeStringOverriding
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  objc_msgSend(v3, "overrideObservingDisplayViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  objc_msgSend(v3, "_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dateFromEntriesIncludesTime"))
  {
    objc_msgSend(v6, "dateFromEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CSProminentDisplayView _setOverrideDate:](self, "_setOverrideDate:", v5);

}

- (void)_setOverrideDate:(id)a3
{
  NSDate *v4;
  NSDate *overrideDate;
  id v6;

  v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_overrideDate, "isEqualToDate:"))
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    overrideDate = self->_overrideDate;
    self->_overrideDate = v4;

    -[CSProminentDisplayView _updateEffectiveDisplayDate](self, "_updateEffectiveDisplayDate");
  }

}

- (BSUIVibrancyEffectView)timeVibrancyEffectView
{
  return self->_timeVibrancyEffectView;
}

- (BSUIVibrancyEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (BSUIVibrancyShadowView)vibrancyShadowView
{
  return self->_vibrancyShadowView;
}

- (CSProminentTimeView)timeView
{
  return self->_timeView;
}

- (CSProminentTextElementView)subtitleView
{
  return self->_subtitleView;
}

- (CSProminentEmptyElementView)subtitleComplicationView
{
  return self->_subtitleComplicationView;
}

- (CSProminentEmptyElementView)complicationRowView
{
  return self->_complicationRowView;
}

- (CSProminentEmptyElementView)complicationSidebarView
{
  return self->_complicationSidebarView;
}

- (CSProminentTextElementView)transientSubtitleView
{
  return self->_transientSubtitleView;
}

- (CSProminentTextElementView)customSubtitleView
{
  return self->_customSubtitleView;
}

- (double)subtitleAlpha
{
  return self->_subtitleAlpha;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)shouldApplyVibrancyToComplications
{
  return self->_shouldApplyVibrancyToComplications;
}

- (CSProminentLayoutController)layoutController
{
  return self->_layoutController;
}

- (BOOL)animatingTransientSubtitleTransition
{
  return self->_animatingTransientSubtitleTransition;
}

- (void)setAnimatingTransientSubtitleTransition:(BOOL)a3
{
  self->_animatingTransientSubtitleTransition = a3;
}

- (BOOL)animatingTransientSubtitleTransitionToTransient
{
  return self->_animatingTransientSubtitleTransitionToTransient;
}

- (void)setAnimatingTransientSubtitleTransitionToTransient:(BOOL)a3
{
  self->_animatingTransientSubtitleTransitionToTransient = a3;
}

- (NSMutableArray)pendedTransientSubtitleViews
{
  return self->_pendedTransientSubtitleViews;
}

- (void)setPendedTransientSubtitleViews:(id)a3
{
  objc_storeStrong((id *)&self->_pendedTransientSubtitleViews, a3);
}

- (BOOL)hasClearedSinceLastAddedTransient
{
  return self->_hasClearedSinceLastAddedTransient;
}

- (void)setHasClearedSinceLastAddedTransient:(BOOL)a3
{
  self->_hasClearedSinceLastAddedTransient = a3;
}

- (BSUIOrientationTransformWrapperView)backgroundTransformView
{
  return self->_backgroundTransformView;
}

- (void)setBackgroundTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTransformView, a3);
}

- (_CSProminentDisplayBackgroundWrapperView)backgroundWrapperView
{
  return self->_backgroundWrapperView;
}

- (void)setBackgroundWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundWrapperView, a3);
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_backgroundWrapperView, 0);
  objc_storeStrong((id *)&self->_backgroundTransformView, 0);
  objc_storeStrong((id *)&self->_pendedTransientSubtitleViews, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_customSubtitleView, 0);
  objc_storeStrong((id *)&self->_transientSubtitleView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarView, 0);
  objc_storeStrong((id *)&self->_complicationRowView, 0);
  objc_storeStrong((id *)&self->_subtitleComplicationView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_vibrancyShadowView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_timeVibrancyEffectView, 0);
}

@end

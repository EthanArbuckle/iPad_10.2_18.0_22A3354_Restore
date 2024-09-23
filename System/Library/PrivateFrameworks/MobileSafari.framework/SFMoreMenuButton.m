@implementation SFMoreMenuButton

- (SFMoreMenuButton)initWithFrame:(CGRect)a3
{
  SFMoreMenuButton *v3;
  SFMoreMenuButton *v4;
  void *v5;
  void *v6;
  id v7;
  SFMoreMenuButton *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SFMoreMenuButton;
  v3 = -[SFMoreMenuButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_downloadProgress = -2.0;
    -[SFMoreMenuButton _updateImage](v3, "_updateImage");
    _SFAccessibilityIdentifierForBarItem(5uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMoreMenuButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v5);

    -[_SFDimmingButton setNormalImageAlpha:](v4, "setNormalImageAlpha:", 1.0);
    -[_SFDimmingButton setHighlightedImageAlpha:](v4, "setHighlightedImageAlpha:", 0.2);
    -[SFMoreMenuButton setSymbolScale:](v4, "setSymbolScale:", 2);
    -[SFMoreMenuButton setAutomaticallyUpdatesConfiguration:](v4, "setAutomaticallyUpdatesConfiguration:", 0);
    -[SFClickableButton setClickEnabled:](v4, "setClickEnabled:", 1);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[SFMoreMenuButton registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v6, v4, sel__updateProgressViewMetrics);

    v8 = v4;
  }

  return v4;
}

- (void)setProgressStyle:(int64_t)a3
{
  if (self->_progressStyle != a3)
  {
    self->_progressStyle = a3;
    -[SFMoreMenuButton _updateImage](self, "_updateImage");
  }
}

- (void)setDownloadProgress:(double)a3
{
  -[SFMoreMenuButton setDownloadProgress:animated:](self, "setDownloadProgress:animated:", 0, a3);
}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  if (self->_downloadProgress != a3)
  {
    self->_downloadProgress = a3;
    -[SFMoreMenuButton _updateContentsAnimated:](self, "_updateContentsAnimated:", a4);
  }
}

- (void)setNeedsPulseOnView:(id)a3
{
  if (self->_isShowingArrowDown)
    objc_msgSend(MEMORY[0x1E0DC3F10], "_sf_performLinkAnimation:onView:", 1, a3);
  else
    objc_storeWeak((id *)&self->_viewPendingPulse, a3);
}

- (void)setSymbolScale:(int64_t)a3
{
  if (self->_symbolScale != a3)
  {
    self->_symbolScale = a3;
    -[SFMoreMenuButton _updateImage](self, "_updateImage");
    -[SFMoreMenuButton _updateProgressViewMetrics](self, "_updateProgressViewMetrics");
  }
}

- (BOOL)isIconFilled
{
  if (self->_iconFilled)
    return 1;
  else
    return -[SFMoreMenuButton isSelected](self, "isSelected");
}

- (void)setIconFilled:(BOOL)a3
{
  if (self->_iconFilled != a3)
  {
    self->_iconFilled = a3;
    -[SFMoreMenuButton _updateContentsAnimated:](self, "_updateContentsAnimated:", 0);
  }
}

- (UIColor)progressTintColor
{
  UIColor *progressTintColor;

  progressTintColor = self->_progressTintColor;
  if (progressTintColor)
    return progressTintColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setProgressTintColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    -[SFMoreMenuButton progressTintColor](self, "progressTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFProgressView setTintColor:](self->_progressView, "setTintColor:", v5);

  }
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_contentInsets.leading != a3.leading
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.trailing != a3.trailing
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SFMoreMenuButton _updateImage](self, "_updateImage");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SFMoreMenuButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFMoreMenuButton;
    -[SFMoreMenuButton setSelected:](&v5, sel_setSelected_, v3);
    -[SFMoreMenuButton updateContents](self, "updateContents");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFMoreMenuButton;
  -[_SFDimmingButton layoutSubviews](&v5, sel_layoutSubviews);
  -[SFProgressView intrinsicContentSize](self->_progressView, "intrinsicContentSize");
  -[SFMoreMenuButton _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  UIRectGetCenter();
  -[SFMoreMenuButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  UIRectCenteredAboutPointScale();
  -[SFProgressView setFrame:](self->_progressView, "setFrame:");

}

- (void)didMoveToWindow
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFMoreMenuButton;
  -[SFMoreMenuButton didMoveToWindow](&v4, sel_didMoveToWindow);
  SFDeferrableUpdateViewDidMoveToWindow(self);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_movedToWindowTime = v3;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMoreMenuButton;
  -[SFMoreMenuButton tintColorDidChange](&v3, sel_tintColorDidChange);
  if (-[SFMoreMenuButton _shouldShowProgressView](self, "_shouldShowProgressView"))
    -[SFMoreMenuButton _updateImage](self, "_updateImage");
}

- (void)_updateContentsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double movedToWindowTime;
  _BOOL8 v8;
  double downloadProgress;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  movedToWindowTime = self->_movedToWindowTime;
  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents(self))
  {
    -[SFMoreMenuButton _updateImageAllowingDissolve:](self, "_updateImageAllowingDissolve:", v6 > movedToWindowTime + 1.0);
    v8 = -[SFMoreMenuButton _shouldShowProgressView](self, "_shouldShowProgressView");
    -[SFMoreMenuButton _setShowsProgressView:](self, "_setShowsProgressView:", v8);
    if (v8)
    {
      downloadProgress = self->_downloadProgress;
      if (downloadProgress == -1.0)
        downloadProgress = 0.0;
      -[SFProgressView setProgress:animated:completion:](self->_progressView, "setProgress:animated:completion:", v3, 0, downloadProgress);
      -[SFMoreMenuButton _updateProgressViewMetrics](self, "_updateProgressViewMetrics");
    }
  }
}

- (void)_updateImage
{
  -[SFMoreMenuButton _updateImageAllowingDissolve:](self, "_updateImageAllowingDissolve:", 1);
}

- (void)_updateImageAllowingDissolve:(BOOL)a3
{
  _BOOL4 v3;
  UIView **p_viewPendingPulse;
  id WeakRetained;
  int64_t progressStyle;
  void *v8;
  const __CFString *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v3 = a3;
  v32[2] = *MEMORY[0x1E0C80C00];
  p_viewPendingPulse = &self->_viewPendingPulse;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewPendingPulse);
  progressStyle = self->_progressStyle;
  if (progressStyle != 2)
  {
    if (progressStyle == 1)
    {
      v13 = -[SFMoreMenuButton _shouldShowProgressView](self, "_shouldShowProgressView");
      v14 = (void *)MEMORY[0x1E0DC3870];
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0DC3888];
        -[SFMoreMenuButton tintColor](self, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v16;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_configurationWithHierarchicalColors:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("arrow.down.circle");
LABEL_18:
        objc_msgSend(v14, "systemImageNamed:withConfiguration:", v20, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
        v11 = 0;
        v12 = 0;
        goto LABEL_23;
      }
      v9 = CFSTR("arrow.down.circle.fill");
    }
    else
    {
      if (progressStyle)
      {
        v11 = 0;
        v12 = 0;
        v10 = 0;
        goto LABEL_23;
      }
      if (-[SFMoreMenuButton isIconFilled](self, "isIconFilled"))
      {
        v8 = (void *)MEMORY[0x1E0DC3870];
        v9 = CFSTR("ellipsis.circle.fill");
LABEL_21:
        objc_msgSend(v8, "systemImageNamed:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v21 = -[SFMoreMenuButton _shouldShowProgressView](self, "_shouldShowProgressView");
      v14 = (void *)MEMORY[0x1E0DC3870];
      if (v21)
      {
        v22 = (void *)MEMORY[0x1E0DC3888];
        -[SFMoreMenuButton tintColor](self, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v16;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_configurationWithHierarchicalColors:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("ellipsis.circle");
        goto LABEL_18;
      }
      v9 = CFSTR("ellipsis.circle");
    }
    v8 = v14;
    goto LABEL_21;
  }
  if (-[SFMoreMenuButton _shouldShowProgressView](self, "_shouldShowProgressView"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = !self->_isShowingArrowDown && v3;
    self->_isShowingArrowDown = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v11 = WeakRetained != 0;
    self->_isShowingArrowDown = 0;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "background");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  objc_msgSend(v10, "imageWithAlignmentRectInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v26);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], self->_symbolScale);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPreferredSymbolConfigurationForImage:", v27);

  objc_msgSend(v23, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.leading, self->_contentInsets.bottom, self->_contentInsets.trailing);
  if (v12)
  {
    v28 = (void *)MEMORY[0x1E0DC3F10];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __49__SFMoreMenuButton__updateImageAllowingDissolve___block_invoke;
    v29[3] = &unk_1E21E2258;
    v29[4] = self;
    v30 = v23;
    objc_msgSend(v28, "transitionWithView:duration:options:animations:completion:", self, 5242882, v29, 0, 0.3);

    if (!v11)
      goto LABEL_28;
    goto LABEL_27;
  }
  -[SFMoreMenuButton setConfiguration:](self, "setConfiguration:", v23);
  if (v11)
  {
LABEL_27:
    -[SFMoreMenuButton layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(MEMORY[0x1E0DC3F10], "_sf_performLinkAnimation:onView:", 1, WeakRetained);
    objc_storeWeak((id *)p_viewPendingPulse, 0);
  }
LABEL_28:

}

uint64_t __49__SFMoreMenuButton__updateImageAllowingDissolve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldShowProgressView
{
  return self->_downloadProgress != -2.0;
}

- (void)_setShowsProgressView:(BOOL)a3
{
  SFProgressView *progressView;
  SFProgressView *v5;
  SFProgressView *v6;
  void *v7;
  SFProgressView *v8;
  void *v9;

  progressView = self->_progressView;
  if ((((progressView == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      -[SFMoreMenuButton imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClipsToBounds:", 0);
      v5 = objc_alloc_init(SFProgressView);
      v6 = self->_progressView;
      self->_progressView = v5;

      -[SFProgressView setStyle:](self->_progressView, "setStyle:", self->_progressStyle);
      -[SFMoreMenuButton progressTintColor](self, "progressTintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProgressView setTintColor:](self->_progressView, "setTintColor:", v7);

      objc_msgSend(v9, "addSubview:", self->_progressView);
      -[SFMoreMenuButton _updateProgressViewMetrics](self, "_updateProgressViewMetrics");

    }
    else
    {
      -[SFProgressView removeFromSuperview](progressView, "removeFromSuperview");
      v8 = self->_progressView;
      self->_progressView = 0;

    }
  }
}

- (void)_updateProgressViewMetrics
{
  -[SFMoreMenuButton _progressViewRadius](self, "_progressViewRadius");
  -[SFProgressView setRadius:](self->_progressView, "setRadius:");
  -[SFMoreMenuButton _progressViewTrackWidth](self, "_progressViewTrackWidth");
  -[SFProgressView setTrackWidth:](self->_progressView, "setTrackWidth:");
}

- (double)_progressViewRadius
{
  int64_t symbolScale;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  symbolScale = self->_symbolScale;
  if ((unint64_t)(symbolScale - 1) >= 2)
  {
    if (symbolScale != 3)
      return 0.0;
    v4 = !-[SFMoreMenuButton isIconFilled](self, "isIconFilled");
    v5 = 11.5;
    v6 = 15.5;
  }
  else
  {
    v4 = !-[SFMoreMenuButton isIconFilled](self, "isIconFilled");
    v5 = 9.0;
    v6 = 12.0;
  }
  if (v4)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMoreMenuButton traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledValueForValue:compatibleWithTraitCollection:", v9, v7);
  v11 = v10;

  return v11;
}

- (double)_progressViewTrackWidth
{
  unint64_t v2;
  double result;

  v2 = self->_symbolScale - 1;
  result = 0.0;
  if (v2 <= 2)
    return dbl_18BAD51C0[v2];
  return result;
}

- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState
{
  return ($A17CE7BAAAAB13D21F74688DC5009C79 *)&self->_deferrableUpdateViewState;
}

- (void)updateContents
{
  -[SFMoreMenuButton _updateContentsAnimated:](self, "_updateContentsAnimated:", 1);
}

- (int64_t)progressStyle
{
  return self->_progressStyle;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewPendingPulse);

  objc_storeStrong((id *)&self->_progressTintColor, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end

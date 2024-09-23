@implementation MediaControlsVolumeSlider

- (MediaControlsVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MediaControlsVolumeSlider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsVolumeSlider;
  v4 = -[MPVolumeSlider initWithFrame:style:](&v6, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIEdgeInsetsMakeWithEdges();
  -[MPVolumeSlider setHitRectInsets:](v4, "setHitRectInsets:");

  return v4;
}

- (id)createThumbView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MediaControlsVolumeSlider;
  v3 = -[MPVolumeSlider createThumbView](&v20, sel_createThumbView);
  -[MediaControlsVolumeSlider traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  if (v6 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");

  }
  objc_msgSend(v3, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowColor:", v9);

  UIRoundToScale();
  v12 = v11;
  objc_msgSend(v3, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShadowOffset:", 0.0, v12);

  UIRoundToScale();
  v15 = v14;
  objc_msgSend(v3, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowRadius:", v15);

  objc_msgSend(v3, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1045220557;
  objc_msgSend(v17, "setShadowOpacity:", v18);

  return v3;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)MediaControlsVolumeSlider;
  -[MediaControlsVolumeSlider thumbRectForBounds:trackRect:value:](&v26, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[MediaControlsVolumeSlider traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  UIRoundToScale();
  v16 = v9 - v15;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, v11, v13);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGPath");
  -[MPVolumeSlider thumbView](self, "thumbView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowPath:", v18);

  v21 = v7;
  v22 = v16;
  v23 = v11;
  v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect result;

  v12.receiver = self;
  v12.super_class = (Class)MediaControlsVolumeSlider;
  -[MediaControlsVolumeSlider trackRectForBounds:](&v12, sel_trackRectForBounds_);
  -[MediaControlsVolumeSlider traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  -[MediaControlsVolumeSlider minimumValueImage](self, "minimumValueImage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[MediaControlsVolumeSlider maximumValueImage](self, "maximumValueImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      UIRoundToScale();
  }
  UIRoundToScale();
  UIRectCenteredYInRect();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  UIRectCenteredYInRect();
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  UIRectCenteredYInRect();
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
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
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  uint64_t v37;
  CGRect v39;

  -[MediaControlsVolumeSlider bounds](self, "bounds", a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MediaControlsVolumeSlider bounds](self, "bounds");
  -[MediaControlsVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[MediaControlsVolumeSlider value](self, "value");
  LODWORD(v37) = v21;
  -[MediaControlsVolumeSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v6, v8, v10, v12, v14, v16, v18, v20, v37);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[MPVolumeSlider hitRectInsets](self, "hitRectInsets");
  v31 = v25 + v30;
  v34 = v27 - (v32 + v33);
  v39.size.height = v29 - (v30 + v35);
  v39.origin.x = v23 + v32;
  v39.origin.y = v31;
  v39.size.width = v34;
  return CGRectContainsPoint(v39, a3);
}

- (id)_thumbImageForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("CC-Volume-Knob"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tintColorDidChange
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MediaControlsVolumeSlider;
  -[MediaControlsVolumeSlider tintColorDidChange](&v12, sel_tintColorDidChange);
  if (self->_visualStylingProvider)
  {
    -[MediaControlsVolumeSlider providedStylesDidChangeForProvider:](self, "providedStylesDidChangeForProvider:");
  }
  else
  {
    -[MediaControlsVolumeSlider tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsVolumeSlider setMinimumTrackTintColor:](self, "setMinimumTrackTintColor:", v3);

    -[MediaControlsVolumeSlider tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsVolumeSlider traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryColorForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsVolumeSlider _minValueView](self, "_minValueView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    -[MediaControlsVolumeSlider _maxValueView](self, "_maxValueView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v6);

    -[MediaControlsVolumeSlider tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsVolumeSlider traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tertiaryColorForInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsVolumeSlider setMaximumTrackTintColor:](self, "setMaximumTrackTintColor:", v11);
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  id *p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  MTVisualStylingProvider *v16;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = (id *)&self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v16 = v5;
    -[MTVisualStylingProvider _removeObserver:](visualStylingProvider, "_removeObserver:", self);
    v8 = *p_visualStylingProvider;
    -[MediaControlsVolumeSlider _minValueView](self, "_minValueView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAutomaticallyUpdatingView:", v9);

    v10 = *p_visualStylingProvider;
    -[MediaControlsVolumeSlider _maxValueView](self, "_maxValueView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopAutomaticallyUpdatingView:", v11);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    objc_msgSend(*p_visualStylingProvider, "_addObserver:", self);
    v12 = *p_visualStylingProvider;
    -[MediaControlsVolumeSlider _minValueView](self, "_minValueView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "automaticallyUpdateView:withStyle:", v13, 1);

    v14 = *p_visualStylingProvider;
    -[MediaControlsVolumeSlider _maxValueView](self, "_maxValueView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "automaticallyUpdateView:withStyle:", v15, 1);

    -[MediaControlsVolumeSlider providedStylesDidChangeForProvider:](self, "providedStylesDidChangeForProvider:", *p_visualStylingProvider);
    v5 = v16;
  }

}

- (void)setMinimumTrackVisualProvider:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "_visualStylingForStyle:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsVolumeSlider setMinimumTrackTintColor:](self, "setMinimumTrackTintColor:", v4);

  -[MediaControlsVolumeSlider _minTrackView](self, "_minTrackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mt_replaceVisualStyling:", v6);

}

- (void)setMaximumTrackVisualProvider:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "_visualStylingForStyle:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsVolumeSlider setMaximumTrackTintColor:](self, "setMaximumTrackTintColor:", v4);

  -[MediaControlsVolumeSlider _maxTrackView](self, "_maxTrackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mt_replaceVisualStyling:", v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsVolumeSlider;
  v4 = -[MediaControlsVolumeSlider gestureRecognizerShouldBegin:](&v6, sel_gestureRecognizerShouldBegin_, a3);
  if (v4)
    LOBYTE(v4) = !-[MPVolumeSlider isTracking](self, "isTracking");
  return v4;
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[MediaControlsVolumeSlider setMinimumTrackVisualProvider:](self, "setMinimumTrackVisualProvider:", v4);
  -[MediaControlsVolumeSlider setMaximumTrackVisualProvider:](self, "setMaximumTrackVisualProvider:", v4);

}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end

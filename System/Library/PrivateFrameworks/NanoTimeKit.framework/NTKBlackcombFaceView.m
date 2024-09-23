@implementation NTKBlackcombFaceView

- (NTKBlackcombFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  NTKBlackcombFaceView *v9;
  NTKFullscreenSubdialComplicationFactory *v10;
  NTKFullscreenSubdialComplicationFactory *complicationFactory;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKBlackcombFaceView;
  v9 = -[NTKAnalogFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v13, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, a5);
  if (v9)
  {
    v10 = -[NTKFullscreenSubdialComplicationFactory initForDevice:]([NTKFullscreenSubdialComplicationFactory alloc], "initForDevice:", v8);
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;

  }
  return v9;
}

- (id)createFaceColorPalette
{
  NTKBlackcombColorPalette *v3;
  NTKBlackcombColorPalette *blackcombPalette;

  v3 = objc_alloc_init(NTKBlackcombColorPalette);
  blackcombPalette = self->_blackcombPalette;
  self->_blackcombPalette = v3;

  return self->_blackcombPalette;
}

- (void)_configureTimeView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKBlackcombFaceView;
  v4 = a3;
  -[NTKAnalogFaceView _configureTimeView:](&v7, sel__configureTimeView_, v4);
  -[NTKBlackcombFaceView _updateHandsColors](self, "_updateHandsColors", v7.receiver, v7.super_class);
  objc_msgSend(v4, "secondHandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandDotColor:", v6);

}

- (void)_setupBackgroundView
{
  UIView *v3;
  UIView *backgroundContainerView;
  void *v5;
  UIView *v6;
  void *v7;
  NTKBlackcombBackgroundView *v8;
  void *v9;
  NTKBlackcombBackgroundView *v10;
  NTKBlackcombBackgroundView *backgroundView;
  void *v12;
  void *v13;
  id v14;

  if (!self->_backgroundContainerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundContainerView = self->_backgroundContainerView;
    self->_backgroundContainerView = v3;

    -[NTKFaceView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_backgroundContainerView;
    -[NTKFaceView complicationContainerView](self, "complicationContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:belowSubview:", v6, v7);

    v8 = [NTKBlackcombBackgroundView alloc];
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKBlackcombBackgroundView initForDevice:](v8, "initForDevice:", v9);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v10;

    -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", self->_backgroundView);
    -[UIView layer](self->_backgroundContainerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screenCornerRadius");
    objc_msgSend(v12, "setCornerRadius:");

    -[UIView layer](self->_backgroundContainerView, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  }
}

- (void)_removeBackgroundView
{
  NTKBlackcombBackgroundView *backgroundView;
  UIView *backgroundContainerView;

  -[NTKBlackcombBackgroundView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  -[UIView removeFromSuperview](self->_backgroundContainerView, "removeFromSuperview");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;

}

- (void)_loadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _loadSnapshotContentViews](&v3, sel__loadSnapshotContentViews);
  -[NTKBlackcombFaceView _setupBackgroundView](self, "_setupBackgroundView");
  -[NTKBlackcombFaceView _forceUpdateColors](self, "_forceUpdateColors");
}

- (void)_unloadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _unloadSnapshotContentViews](&v3, sel__unloadSnapshotContentViews);
  -[NTKBlackcombFaceView _removeBackgroundView](self, "_removeBackgroundView");
}

- (void)_reorderSwitcherSnapshotView
{
  void *v3;
  id v4;

  -[NTKFaceView switcherSnapshotView](self, "switcherSnapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NTKFaceView switcherSnapshotView](self, "switcherSnapshotView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

  }
}

- (int64_t)_editMode
{
  double v3;

  -[NTKFaceView editModeTransitionFraction](self, "editModeTransitionFraction");
  if (v3 <= 0.5)
    return -[NTKFaceView fromEditMode](self, "fromEditMode");
  else
    return -[NTKFaceView toEditMode](self, "toEditMode");
}

- (void)_prepareForEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _prepareForEditing](&v8, sel__prepareForEditing);
  -[NTKBlackcombBackgroundView setUsesLongSideTicks:](self->_backgroundView, "setUsesLongSideTicks:", 0);
  -[UIView layer](self->_backgroundContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  -[NTKFaceView timeView](self, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 1);

}

- (void)_cleanupAfterEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _cleanupAfterEditing](&v9, sel__cleanupAfterEditing);
  -[NTKBlackcombFaceView _updateTickLengths](self, "_updateTickLengths");
  -[UIView layer](self->_backgroundContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

  -[NTKFaceView timeView](self, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  -[NTKFaceView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceViewDidChangeWantsStatusBarIconShadow");

}

- (void)_updateTickLengths
{
  -[NTKBlackcombBackgroundView setUsesLongSideTicks:](self->_backgroundView, "setUsesLongSideTicks:", -[NTKBlackcombFaceView _backgroundViewShouldUseLongSideTicks](self, "_backgroundViewShouldUseLongSideTicks"));
}

- (BOOL)_backgroundViewShouldUseLongSideTicks
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[NTKFaceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceViewComplicationForSlot:", CFSTR("subdial-left"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "complicationType");

  -[NTKFaceView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceViewComplicationForSlot:", CFSTR("subdial-right"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 | objc_msgSend(v7, "complicationType");

  return v8 == 0;
}

- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3
{
  return a3 == 1 || a3 == 10;
}

- (void)_configureForEditMode:(int64_t)a3
{
  double v5;
  double v6;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NTKBlackcombColorPalette *blackcombPalette;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _configureForEditMode:](&v19, sel__configureForEditMode_);
  if ((unint64_t)a3 > 0xF || (v5 = 1.0, ((1 << a3) & 0x8401) == 0))
    v5 = 0.2;
  if (a3 == 15)
    v6 = 0.2;
  else
    v6 = 1.0;
  if (a3 == 15 || a3 == 0)
    v8 = 1.0;
  else
    v8 = 0.2;
  -[UIView setAlpha:](self->_backgroundContainerView, "setAlpha:", v5);
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
    v11 = v6;
  else
    v11 = 1.0;
  objc_msgSend(v9, "setAlpha:", v11);

  -[NTKFaceView timeView](self, "timeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v8);

  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("subdial-top"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "display");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    blackcombPalette = self->_blackcombPalette;
    v16 = v14;
    -[NTKBlackcombColorPalette platterText](blackcombPalette, "platterText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", a3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setForegroundColor:", v18);

  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  UIView *backgroundContainerView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NTKBlackcombColorPalette *blackcombPalette;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v20, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  backgroundContainerView = self->_backgroundContainerView;
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](backgroundContainerView, "setAlpha:");
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  -[NTKFaceView timeView](self, "timeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");

  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("subdial-top"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "display");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    blackcombPalette = self->_blackcombPalette;
    v14 = v12;
    -[NTKBlackcombColorPalette platterText](blackcombPalette, "platterText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", a4, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombColorPalette platterText](self->_blackcombPalette, "platterText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", a5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setForegroundColor:", v19);
  }

}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (a4 == 10)
  {
    -[NTKBlackcombFaceView updateWithColorPalette:](self, "updateWithColorPalette:", self->_blackcombPalette);
  }
  else if (a4 == 15)
  {
    -[NTKBlackcombFaceView updateBlackcombDialColorStyle:](self, "updateBlackcombDialColorStyle:", objc_msgSend(v10, "blackcombDialColor"));
    -[NTKFaceView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faceViewDidChangeWantsStatusBarIconShadow");

  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v12 = a5;
  v13 = a7;
  if (a6 == 10)
  {
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromPalette");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toPalette");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _applyTransitionFraction:fromColorPalette:toColorPalette:](self, "_applyTransitionFraction:fromColorPalette:toColorPalette:", v15, v17, a3);

    goto LABEL_5;
  }
  if (a6 == 15)
  {
    -[NTKBlackcombColorPalette transitionalPaletteFromDialColor:toDialColor:](self->_blackcombPalette, "transitionalPaletteFromDialColor:toDialColor:", objc_msgSend(v18, "blackcombDialColor"), objc_msgSend(v12, "blackcombDialColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromPalette");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toPalette");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _applyTransitionFraction:fromColorPalette:toColorPalette:](self, "_applyTransitionFraction:fromColorPalette:toColorPalette:", v15, v16, a3);
LABEL_5:

  }
}

- (void)updateWithColorPalette:(id)a3
{
  NTKInterpolatedColorPalette *v4;
  NTKInterpolatedColorPalette *dialColorStyleTransitionPalette;
  id v6;

  v6 = a3;
  if (self->_dialColorStyleTransitionPalette)
  {
    v4 = -[NTKInterpolatedColorPalette initWithColorPalette:]([NTKInterpolatedColorPalette alloc], "initWithColorPalette:", self->_blackcombPalette);
    dialColorStyleTransitionPalette = self->_dialColorStyleTransitionPalette;
    self->_dialColorStyleTransitionPalette = v4;

  }
  -[NTKBlackcombFaceView _applyTransitionFraction:fromColorPalette:toColorPalette:force:](self, "_applyTransitionFraction:fromColorPalette:toColorPalette:force:", v6, v6, 1, 0.0);
  -[NTKBlackcombFaceView _updateHandsColors](self, "_updateHandsColors");

}

- (void)updateBlackcombDialColorStyle:(unint64_t)a3
{
  if (-[NTKBlackcombColorPalette dialColorStyle](self->_blackcombPalette, "dialColorStyle") != a3)
  {
    -[NTKBlackcombColorPalette setDialColorStyle:](self->_blackcombPalette, "setDialColorStyle:", a3);
    -[NTKBlackcombFaceView updateWithColorPalette:](self, "updateWithColorPalette:", self->_blackcombPalette);
  }
}

- (void)_forceUpdateColors
{
  -[NTKBlackcombFaceView _applyTransitionFraction:fromColorPalette:toColorPalette:force:](self, "_applyTransitionFraction:fromColorPalette:toColorPalette:force:", self->_blackcombPalette, self->_blackcombPalette, 1, 0.0);
  -[NTKBlackcombBackgroundView applyPalette:](self->_backgroundView, "applyPalette:", self->_blackcombPalette);
  -[NTKBlackcombFaceView _updateHandsColors](self, "_updateHandsColors");
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  -[NTKBlackcombFaceView _applyTransitionFraction:fromColorPalette:toColorPalette:force:](self, "_applyTransitionFraction:fromColorPalette:toColorPalette:force:", a4, a5, 0, a3);
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 force:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  char v25;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "complication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "complication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v14);
  if (a6)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v10, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "isEqual:", v17) ^ 1;

  }
  if ((objc_msgSend(v10, "isMulticolor") & 1) != 0 || objc_msgSend(v11, "isMulticolor"))
  {
    if (objc_msgSend(v11, "isMulticolor") && !objc_msgSend(v10, "isMulticolor"))
      a3 = 1.0 - a3;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend(v11, "isMulticolor"))
    v19 = v12;
  else
    v19 = v13;
  -[NTKFaceView setComplicationColor:](self, "setComplicationColor:", v19);
  if (v15)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__NTKBlackcombFaceView__applyTransitionFraction_fromColorPalette_toColorPalette_force___block_invoke;
    v24[3] = &unk_1E6BD9F78;
    v24[4] = self;
    v25 = v18;
    *(double *)&v24[5] = a3;
    -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v24);
  }
  -[NTKBlackcombFaceView _secondHandColor](self, "_secondHandColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBlackcombFaceView _secondHandColor](self, "_secondHandColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "applySecondHandColor:", v22);

  -[NTKBlackcombBackgroundView applyTransitionFraction:fromPalette:toPalette:](self->_backgroundView, "applyTransitionFraction:fromPalette:toPalette:", v10, v11, a3);
  -[NTKBlackcombFaceView _applyComplicationTransitionFraction:fromColorPalette:toColorPalette:](self, "_applyComplicationTransitionFraction:fromColorPalette:toColorPalette:", v10, v11, a3);

}

void __87__NTKBlackcombFaceView__applyTransitionFraction_fromColorPalette_toColorPalette_force___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "normalComplicationDisplayWrapperForSlot:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "display");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v6, "transitionToMonochromeWithFraction:", *(double *)(a1 + 40));
    else
      objc_msgSend(v6, "updateMonochromeColor");

    v5 = v8;
  }

}

- (void)_applyComplicationTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  int64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  double v26;

  v8 = a4;
  v9 = a5;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__NTKBlackcombFaceView__applyComplicationTransitionFraction_fromColorPalette_toColorPalette___block_invoke;
  v23[3] = &unk_1E6BD9FA0;
  v10 = v8;
  v24 = v10;
  v11 = v9;
  v25 = v11;
  v26 = a3;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v23);
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("subdial-top"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "display");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v15 = -[NTKBlackcombFaceView _editMode](self, "_editMode");
    objc_msgSend(v10, "platterText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[NTKBlackcombFaceView _editMode](self, "_editMode");
    objc_msgSend(v11, "platterText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    NTKInterpolateBetweenColors(v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "display");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setForegroundColor:", v21);

  }
}

void __93__NTKBlackcombFaceView__applyComplicationTransitionFraction_fromColorPalette_toColorPalette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitThemeFromTheme:toTheme:fraction:", objc_msgSend(*(id *)(a1 + 32), "richComplicationViewTheme"), objc_msgSend(*(id *)(a1 + 40), "richComplicationViewTheme"), *(double *)(a1 + 48));

  }
}

- (id)_secondHandColor
{
  return (id)-[NTKBlackcombColorPalette secondHand](self->_blackcombPalette, "secondHand");
}

- (void)_updateHandsColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NTKBlackcombFaceView _secondHandColor](self, "_secondHandColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySecondHandColor:", v7);

  -[NTKFaceView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyHourMinuteHandsStrokeColor:fillColor:", v5, v6);

}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKBlackcombFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v18, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  v8 = NTKScaleForRubberBandingFraction(a3);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v8, v8);
  v9 = NTKAlphaForRubberBandingFraction(a3);
  if (a4 == 10)
  {
    -[NTKFaceView complicationContainerView](self, "complicationContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    objc_msgSend(v14, "setTransform:", &v16);

    -[NTKFaceView complicationContainerView](self, "complicationContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 15)
      return;
    -[NTKFaceView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    objc_msgSend(v10, "setTransform:", &v16);

    -[NTKFaceView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", v9);

    -[NTKFaceView timeView](self, "timeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    objc_msgSend(v12, "setTransform:", &v16);

    -[NTKFaceView timeView](self, "timeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;
  objc_msgSend(v13, "setAlpha:", v9);

}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKBlackcombFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v14, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  v8 = NTKLargeElementScaleForBreathingFraction(a3);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v8, v8);
  if (a4 == 10)
  {
    -[NTKFaceView complicationContainerView](self, "complicationContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 15)
      return;
    -[NTKFaceView contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    objc_msgSend(v9, "setTransform:", &v12);

    -[NTKFaceView timeView](self, "timeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = v13;
  objc_msgSend(v10, "setTransform:", &v12);

}

- (id)_platterTextColorForEditMode:(int64_t)a3 color:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (a3 != 15 && a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)_loadLayoutRules
{
  -[NTKFullscreenSubdialComplicationFactory loadLayoutRulesForFaceView:](self->_complicationFactory, "loadLayoutRulesForFaceView:", self);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return -[NTKFullscreenSubdialComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self->_complicationFactory, "newLegacyViewForComplication:family:slot:faceView:", a3, a4, a5, self);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NTKFullscreenSubdialComplicationFactory configureComplicationView:forSlot:faceView:](self->_complicationFactory, "configureComplicationView:forSlot:faceView:", v12, v6, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v12;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("subdial-top")) & 1) != 0)
    {
      v8 = -[NTKBlackcombFaceView _editMode](self, "_editMode");
      -[NTKBlackcombColorPalette platterText](self->_blackcombPalette, "platterText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKBlackcombFaceView _platterTextColorForEditMode:color:](self, "_platterTextColorForEditMode:color:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setForegroundColor:", v10);

    }
    if (-[NTKFaceColorPalette isMulticolor](self->_blackcombPalette, "isMulticolor"))
      objc_msgSend(v7, "transitionToMonochromeWithFraction:", 0.0);
    else
      objc_msgSend(v7, "updateMonochromeColor");
    v11 = -[NTKBlackcombColorPalette richComplicationViewTheme](self->_blackcombPalette, "richComplicationViewTheme");
    objc_msgSend(v7, "transitThemeFromTheme:toTheme:fraction:", v11, v11, 1.0);

  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return -[NTKFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:slot:faceView:](self->_complicationFactory, "legacyLayoutOverrideforComplicationType:slot:faceView:", a3, a4, self);
}

- (BOOL)_isComplicationSlotInsideDial:(id)a3
{
  return 1;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return -[NTKFullscreenSubdialComplicationFactory complicationPickerStyleForSlot:](self->_complicationFactory, "complicationPickerStyleForSlot:", a3);
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[NTKFullscreenSubdialComplicationFactory keylineViewForComplicationSlot:](self->_complicationFactory, "keylineViewForComplicationSlot:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKBlackcombFaceView;
    -[NTKFaceView _keylineViewForComplicationSlot:](&v10, sel__keylineViewForComplicationSlot_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return -[NTKFaceViewComplicationFactory keylineStyleForComplicationSlot:](self->_complicationFactory, "keylineStyleForComplicationSlot:", a3);
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  -[NTKBlackcombBackgroundView configureTicksForStatus:](self->_backgroundView, "configureTicksForStatus:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKFaceView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_backgroundContainerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_backgroundView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  if (!-[NTKFaceView editing](self, "editing"))
    -[NTKBlackcombFaceView _updateTickLengths](self, "_updateTickLengths");
}

- (BOOL)_wantsStatusBarIconShadow
{
  return !-[NTKBlackcombFaceView _isBlackColor](self, "_isBlackColor");
}

- (BOOL)_isBlackColor
{
  void *v2;
  BOOL v3;

  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", 15, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blackcombDialColor") == 0;

  return v3;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (a4 == 15)
  {
    if (!_swatchImageForEditOption_mode_withSelectedOptions__cache)
    {
      v10 = objc_opt_new();
      v11 = (void *)_swatchImageForEditOption_mode_withSelectedOptions__cache;
      _swatchImageForEditOption_mode_withSelectedOptions__cache = v10;

    }
    v12 = objc_msgSend(v8, "blackcombDialColor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_swatchImageForEditOption_mode_withSelectedOptions__cache, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[NTKBlackcombFaceView _renderBackgroundViewSwatchImageForBlackcombDialColor:](self, "_renderBackgroundViewSwatchImageForBlackcombDialColor:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_swatchImageForEditOption_mode_withSelectedOptions__cache, "setObject:forKey:", v15, v14);
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKBlackcombFaceView;
    -[NTKFaceView _swatchImageForEditOption:mode:withSelectedOptions:](&v17, sel__swatchImageForEditOption_mode_withSelectedOptions_, v8, a4, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_renderBackgroundViewSwatchImageForBlackcombDialColor:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[NTKBlackcombFaceView _loadSnapshotContentViews](self, "_loadSnapshotContentViews");
  v6 = -[NTKBlackcombColorPalette dialColorStyle](self->_blackcombPalette, "dialColorStyle");
  v7 = -[NTKBlackcombBackgroundView usesLongSideTicks](self->_backgroundView, "usesLongSideTicks");
  -[NTKBlackcombFaceView updateBlackcombDialColorStyle:](self, "updateBlackcombDialColorStyle:", a3);
  -[NTKBlackcombFaceView layoutIfNeeded](self, "layoutIfNeeded");
  -[NTKBlackcombBackgroundView setUsesLongSideTicks:](self->_backgroundView, "setUsesLongSideTicks:", 1);
  -[UIView bounds](self->_backgroundContainerView, "bounds");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", v8, v9, v10, v11);
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __78__NTKBlackcombFaceView__renderBackgroundViewSwatchImageForBlackcombDialColor___block_invoke;
  v18 = &unk_1E6BD9FC8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "imageWithActions:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBlackcombFaceView updateBlackcombDialColorStyle:](self, "updateBlackcombDialColorStyle:", v6, v15, v16, v17, v18);
  -[NTKBlackcombBackgroundView setUsesLongSideTicks:](self->_backgroundView, "setUsesLongSideTicks:", v7);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __78__NTKBlackcombFaceView__renderBackgroundViewSwatchImageForBlackcombDialColor___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[112], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderInContext:", objc_msgSend(v8, "CGContext"));

    objc_msgSend(v4, "timeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderInContext:", objc_msgSend(v8, "CGContext"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialColorStyleTransitionPalette, 0);
  objc_storeStrong((id *)&self->_blackcombPalette, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end

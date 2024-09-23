@implementation NTKDigitalFaceView

- (void)_loadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalFaceView;
  -[NTKFaceView _loadSnapshotContentViews](&v3, sel__loadSnapshotContentViews);
  -[NTKDigitalFaceView _createTimeViewIfNecessary](self, "_createTimeViewIfNecessary");
  -[NTKDigitalFaceView setViewMode:](self, "setViewMode:", 0);
}

- (void)_unloadSnapshotContentViews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalFaceView;
  -[NTKFaceView _unloadSnapshotContentViews](&v4, sel__unloadSnapshotContentViews);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[NTKFaceView setTimeView:](self, "setTimeView:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKDigitalFaceView;
  -[NTKFaceView layoutSubviews](&v7, sel_layoutSubviews);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrameUsingCurrentStyle");

  -[NTKFaceView rootContainerView](self, "rootContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:belowSubview:", v5, v6);

}

- (void)setViewMode:(int64_t)a3
{
  -[NTKDigitalFaceView setViewMode:updateTimeViewStyle:](self, "setViewMode:updateTimeViewStyle:", a3, 1);
}

- (void)setViewMode:(int64_t)a3 updateTimeViewStyle:(BOOL)a4
{
  self->_viewMode = a3;
  if (a4)
    -[NTKDigitalFaceView invalidateDigitalTimeLabelStyle](self, "invalidateDigitalTimeLabelStyle");
}

- (void)invalidateDigitalTimeLabelStyle
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

  -[NTKDigitalFaceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKFaceView timeView](self, "timeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", self->_viewMode, v4, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStyle:", v12);

  -[NTKDigitalFaceView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)_timeLabelOptions
{
  return 0;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NTKFaceView device](self, "device", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 0, v8, x, y, width, height, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_timeLabelUsesLegibility
{
  return 0;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKDigitalFaceView;
  -[NTKFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v7, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  -[NTKFaceView timeView](self, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v6, "setAlpha:");

}

- (void)_createTimeViewIfNecessary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[NTKDigitalFaceView _timeLabelOptions](self, "_timeLabelOptions");
    -[NTKFaceView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", v4, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setUsesLegibility:", -[NTKDigitalFaceView _timeLabelUsesLegibility](self, "_timeLabelUsesLegibility"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v6);

    +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeOffset");
    objc_msgSend(v9, "setTimeOffset:");

    -[NTKFaceView setTimeView:](self, "setTimeView:", v9);
    -[NTKFaceView rootContainerView](self, "rootContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[NTKDigitalFaceView invalidateDigitalTimeLabelStyle](self, "invalidateDigitalTimeLabelStyle");
  }
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

@end

@implementation NTKAnalogFaceView

- (NTKAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  NTKAnalogFaceView *v5;
  id v6;
  uint64_t v7;
  UIView *timeViewContainer;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NTKContainerView *v14;
  UIView *dialComplicationContainerView;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKAnalogFaceView;
  v5 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v18, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKAnalogFaceView bounds](v5, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    timeViewContainer = v5->_timeViewContainer;
    v5->_timeViewContainer = (UIView *)v7;

    v9 = v5->_timeViewContainer;
    -[NTKFaceView rootContainerView](v5, "rootContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v9, "addSubview:", v10);

    -[NTKAnalogFaceView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v5->_timeViewContainer, 0);
    -[NTKFaceView foregroundContainerView](v5, "foregroundContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView device](v5, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screenScale");
    objc_msgSend(v12, "setRasterizationScale:");

    v14 = objc_alloc_init(NTKContainerView);
    dialComplicationContainerView = v5->_dialComplicationContainerView;
    v5->_dialComplicationContainerView = &v14->super;

    -[NTKFaceView complicationContainerView](v5, "complicationContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_dialComplicationContainerView);

  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *dialComplicationContainerView;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView layoutSubviews](&v27, sel_layoutSubviews);
  v3 = -[NTKAnalogFaceView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1BCCA72B8](v3);
  v14 = v13;
  -[NTKAnalogFaceView _contentCenterOffset](self, "_contentCenterOffset");
  v16 = v12 + v15;
  -[NTKAnalogFaceView _contentCenterOffset](self, "_contentCenterOffset");
  v18 = v14 + v17;
  -[UIView setFrame:](self->_timeViewContainer, "setFrame:", v5, v7, v9, v11);
  -[NTKFaceView contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v16, v18);

  -[NTKFaceView contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounds:", v5, v7, v9, v11);

  -[NTKFaceView timeView](self, "timeView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCenter:", v16, v18);

  -[NTKFaceView timeView](self, "timeView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBounds:", v5, v7, v9, v11);

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenter:", v12, v14);

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBounds:", v5, v7, v9, v11);

  -[NTKAnalogFaceView _updateDateComplicationPositionIfNecessary](self, "_updateDateComplicationPositionIfNecessary");
  dialComplicationContainerView = self->_dialComplicationContainerView;
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](dialComplicationContainerView, "ntk_setBoundsAndPositionFromFrame:");

}

- (void)_loadSnapshotContentViews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _loadSnapshotContentViews](&v4, sel__loadSnapshotContentViews);
  -[NTKAnalogFaceView _createTimeViewIfNecessary](self, "_createTimeViewIfNecessary");
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));

  -[NTKAnalogFaceView _setContentViewsOpaque:](self, "_setContentViewsOpaque:", 1);
}

- (void)_unloadSnapshotContentViews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _unloadSnapshotContentViews](&v4, sel__unloadSnapshotContentViews);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[NTKFaceView setTimeView:](self, "setTimeView:", 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView dealloc](&v2, sel_dealloc);
}

- (BOOL)_canStartTimeScrubbing
{
  return 1;
}

- (void)_handleLocaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _handleLocaleDidChange](&v3, sel__handleLocaleDidChange);
  -[NTKFaceView reloadSnapshotContentViews](self, "reloadSnapshotContentViews");
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_applyDataMode
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _applyDataMode](&v4, sel__applyDataMode);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataMode:", -[NTKFaceView dataMode](self, "dataMode"));

}

- (void)_applyShowContentForUnadornedSnapshot
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _applyShowContentForUnadornedSnapshot](&v4, sel__applyShowContentForUnadornedSnapshot);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));

}

- (void)_loadContentToReplaceUnadornedSnapshot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _loadContentToReplaceUnadornedSnapshot](&v3, sel__loadContentToReplaceUnadornedSnapshot);
  -[NTKAnalogFaceView _updateDateComplicationPositionIfNecessary](self, "_updateDateComplicationPositionIfNecessary");
}

- (id)_complicationContainerViewForSlot:(id)a3
{
  id v4;
  UIView *v5;
  UIView *v6;
  objc_super v8;

  v4 = a3;
  if (-[NTKAnalogFaceView _isComplicationSlotInsideDial:](self, "_isComplicationSlotInsideDial:", v4))
  {
    v5 = self->_dialComplicationContainerView;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKAnalogFaceView;
    -[NTKFaceView _complicationContainerViewForSlot:](&v8, sel__complicationContainerViewForSlot_, v4);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)_isAnalog
{
  return 1;
}

- (void)_prepareForEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _prepareForEditing](&v3, sel__prepareForEditing);
  -[NTKAnalogFaceView _setContentViewsOpaque:](self, "_setContentViewsOpaque:", 0);
  -[NTKAnalogFaceView _updateDateComplicationPositionIfNecessary](self, "_updateDateComplicationPositionIfNecessary");
}

- (void)_cleanupAfterEditing
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _cleanupAfterEditing](&v5, sel__cleanupAfterEditing);
  -[NTKAnalogFaceView _updateDateComplicationPositionIfNecessary](self, "_updateDateComplicationPositionIfNecessary");
  -[NTKAnalogFaceView _setContentViewsOpaque:](self, "_setContentViewsOpaque:", 1);
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

}

- (void)_configureForEditMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _configureForEditMode:](&v5, sel__configureForEditMode_);
  -[NTKAnalogFaceView _setTimeViewBehindContentView:](self, "_setTimeViewBehindContentView:", -[NTKAnalogFaceView _timeViewBehindContentForEditMode:](self, "_timeViewBehindContentForEditMode:", a3));
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  int64_t v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  if (a3 >= 0.5)
    v9 = a5;
  else
    v9 = a4;
  -[NTKAnalogFaceView _setTimeViewBehindContentView:](self, "_setTimeViewBehindContentView:", -[NTKAnalogFaceView _timeViewBehindContentForEditMode:](self, "_timeViewBehindContentForEditMode:", v9));
  -[NTKAnalogFaceView _shouldRasterizeForegroundContainerViewForEditMode:](self, "_shouldRasterizeForegroundContainerViewForEditMode:", a5);
  -[NTKAnalogFaceView _shouldRasterizeForegroundContainerViewForEditMode:](self, "_shouldRasterizeForegroundContainerViewForEditMode:", a4);
  CLKInterpolateBetweenFloatsUnclipped();
  v11 = v10;
  v12 = v10 == 1.0;
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldRasterize");

  if (v12 != v15)
  {
    -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShouldRasterize:", v11 == 1.0);

  }
}

- (void)_setContentViewsOpaque:(BOOL)a3
{
  id v4;

  if (self->__contentViewsOpaque != a3)
  {
    self->__contentViewsOpaque = a3;
    -[NTKFaceView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOpaque:", self->__contentViewsOpaque);

  }
}

- (double)_timeViewScale
{
  return 1.0;
}

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (void)_configureTimeView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "whiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minuteHandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v4, "hourHandView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setColor:", v7);
}

- (CGPoint)_contentCenterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)_backgroundedTimeViewEditModes
{
  return 0;
}

- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3
{
  return 0;
}

- (BOOL)_shouldRasterizeForegroundContainerViewForEditMode:(int64_t)a3
{
  return a3 != 1;
}

- (void)_setTimeViewBehindContentView:(BOOL)a3
{
  void *v4;
  _BOOL4 timeViewBehindContentView;
  void *v6;
  void *v7;
  id v8;

  if (self->__timeViewBehindContentView != a3)
  {
    self->__timeViewBehindContentView = a3;
    -[NTKFaceView timeView](self, "timeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    timeViewBehindContentView = self->__timeViewBehindContentView;
    v8 = v4;
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (timeViewBehindContentView)
      objc_msgSend(v6, "sendSubviewToBack:", v8);
    else
      objc_msgSend(v6, "bringSubviewToFront:", v8);

  }
}

- (BOOL)_isComplicationSlotInsideDial:(id)a3
{
  return 0;
}

- (void)_createTimeViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_timeViewClass"));
    -[NTKFaceView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initForDevice:", v5);

    -[NTKAnalogFaceView bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");
    -[NTKFaceView setTimeView:](self, "setTimeView:", v6);
    -[UIView addSubview:](self->_timeViewContainer, "addSubview:", v6);
    -[NTKAnalogFaceView _configureTimeView:](self, "_configureTimeView:", v6);

  }
}

- (UIView)dialComplicationContainerView
{
  return self->_dialComplicationContainerView;
}

- (UIView)timeViewContainer
{
  return self->_timeViewContainer;
}

- (void)setTimeViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_timeViewContainer, a3);
}

- (BOOL)_contentViewsAreOpaque
{
  return self->__contentViewsOpaque;
}

- (BOOL)_timeViewBehindContentView
{
  return self->__timeViewBehindContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeViewContainer, 0);
  objc_storeStrong((id *)&self->_dialComplicationContainerView, 0);
}

@end

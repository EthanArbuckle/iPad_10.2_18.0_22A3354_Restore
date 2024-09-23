@implementation NTKSolarRichComplicationFullColorImageView

- (id)initFullColorImageViewWithDevice:(id)a3 family:(int64_t)a4
{
  id v7;
  NTKSolarRichComplicationFullColorImageView *v8;
  NTKSolarRichComplicationFullColorImageView *v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGSize v25;
  UIView *v26;
  UIView *backgroundView;
  UIView *v28;
  CAGradientLayer *v29;
  CAGradientLayer *gradientLayer;
  void *v31;
  CALayer *v32;
  CALayer *gradientAdjustmentLayer;
  id v34;
  void *v35;
  void *v36;
  UIView *v37;
  UIView *lineView;
  NTKBezierPathView *v39;
  NTKBezierPathView *pathView;
  NTKSolarTimeModel *v41;
  void *v42;
  uint64_t v43;
  NTKSolarTimeModel *solarTimeModel;
  NTKSolarWaypoint *v45;
  NTKSolarWaypoint *v46;
  NTKSolarWaypoint *v47;
  NTKSolarWaypoint *v48;
  NTKSolarWaypoint *v49;
  uint64_t v50;
  NSDictionary *waypoints;
  double strokeDiskDiameter;
  CALayer *v53;
  CALayer *strokeDiskMaskLayer;
  id v55;
  void *v56;
  void *v57;
  CALayer *v58;
  CALayer *strokeDiskBorderLayer;
  id v60;
  void *v61;
  CALayer *v62;
  CALayer *fillDiskLayer;
  id v64;
  CALayer *v65;
  CALayer *fillDiskHaloLayer;
  id v67;
  double v68;
  double v69;
  double v70;
  id v71;
  id v72;
  CALayer *v73;
  CALayer *belowHorizonLayer;
  id v75;
  UIView *v76;
  UIView *fillDiskHaloContainerView;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  CGAffineTransform v83;
  CGAffineTransform v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _QWORD v92[5];
  _QWORD v93[7];

  v93[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v91.receiver = self;
  v91.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  v8 = -[NTKSolarRichComplicationFullColorImageView init](&v91, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_15;
  objc_storeStrong((id *)&v8->_device, a3);
  -[NTKSolarRichComplicationFullColorImageView _setSolarPathNeedsUpdate](v9, "_setSolarPathNeedsUpdate");
  v10 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_58);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_58);
  if (!WeakRetained)
    goto LABEL_6;
  v12 = WeakRetained;
  v13 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_58);
  if (v13 != v10)
  {

LABEL_6:
    v16 = objc_storeWeak(&_LayoutConstants___cachedDevice_58, v10);
    _LayoutConstants___previousCLKDeviceVersion_58 = objc_msgSend(v10, "version");

    ___LayoutConstants_block_invoke_55(v17, v10);
    goto LABEL_7;
  }
  v14 = objc_msgSend(v10, "version");
  v15 = _LayoutConstants___previousCLKDeviceVersion_58;

  if (v14 != v15)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_58);
  if (a4 == 12)
  {
    v19 = &_LayoutConstants___constantsGraphicExtraLarge_8;
  }
  else
  {
    if (a4 != 10)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        _LayoutConstants_cold_1(a4, v18);

    }
    v19 = &_LayoutConstants___constantsGraphicCircular_8;
  }
  v20 = v19[3];
  v87 = v19[2];
  v88 = v20;
  v21 = v19[5];
  v89 = v19[4];
  v90 = v21;
  v22 = v19[1];
  v85 = *v19;
  v86 = v22;

  v23 = v88;
  *(_OWORD *)&v9->_layoutConstants.lineTop = v87;
  *(_OWORD *)&v9->_layoutConstants.strokeDiskDiameter = v23;
  v24 = v90;
  *(_OWORD *)&v9->_layoutConstants.fillDiskDiameter = v89;
  *(_OWORD *)&v9->_layoutConstants.haloMaxScale = v24;
  v25 = (CGSize)v86;
  *(_OWORD *)&v9->_layoutConstants.complicationContentDiameter = v85;
  v9->_layoutConstants.curveMaxSize = v25;
  v26 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  backgroundView = v9->_backgroundView;
  v9->_backgroundView = v26;

  CGAffineTransformMakeRotation(&v84, 3.14159265);
  v28 = v9->_backgroundView;
  v83 = v84;
  -[UIView setTransform:](v28, "setTransform:", &v83);
  -[NTKSolarRichComplicationFullColorImageView addSubview:](v9, "addSubview:", v9->_backgroundView);
  v29 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
  gradientLayer = v9->_gradientLayer;
  v9->_gradientLayer = v29;

  -[UIView layer](v9->_backgroundView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSublayer:", v9->_gradientLayer);

  v32 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  gradientAdjustmentLayer = v9->_gradientAdjustmentLayer;
  v9->_gradientAdjustmentLayer = v32;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.541176471, 0.474509804, 1.0);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v9->_gradientAdjustmentLayer, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EB8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setCompositingFilter:](v9->_gradientAdjustmentLayer, "setCompositingFilter:", v35);

  -[UIView layer](v9->_backgroundView, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSublayer:", v9->_gradientAdjustmentLayer);

  v37 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  lineView = v9->_lineView;
  v9->_lineView = v37;

  -[NTKSolarRichComplicationFullColorImageView addSubview:](v9, "addSubview:", v9->_lineView);
  v39 = objc_alloc_init(NTKBezierPathView);
  pathView = v9->_pathView;
  v9->_pathView = v39;

  -[NTKBezierPathView setLineCap:](v9->_pathView, "setLineCap:", *MEMORY[0x1E0CD3010]);
  -[NTKSolarRichComplicationFullColorImageView addSubview:](v9, "addSubview:", v9->_pathView);
  v41 = [NTKSolarTimeModel alloc];
  +[NTKDate faceDate](NTKDate, "faceDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[NTKSolarTimeModel initWithReferenceDate:referenceLocation:](v41, "initWithReferenceDate:referenceLocation:", v42, 0);
  solarTimeModel = v9->_solarTimeModel;
  v9->_solarTimeModel = (NTKSolarTimeModel *)v43;

  -[NTKSolarTimeModel setUsePlaceholderData:](v9->_solarTimeModel, "setUsePlaceholderData:", 1);
  v92[0] = &unk_1E6CA1638;
  v45 = -[NTKSolarWaypoint initWithType:solarTimeModel:]([NTKSolarWaypoint alloc], "initWithType:solarTimeModel:", 1, v9->_solarTimeModel);
  v93[0] = v45;
  v92[1] = &unk_1E6CA1650;
  v46 = -[NTKSolarWaypoint initWithType:solarTimeModel:]([NTKSolarWaypoint alloc], "initWithType:solarTimeModel:", 2, v9->_solarTimeModel);
  v93[1] = v46;
  v92[2] = &unk_1E6CA1668;
  v47 = -[NTKSolarWaypoint initWithType:solarTimeModel:]([NTKSolarWaypoint alloc], "initWithType:solarTimeModel:", 3, v9->_solarTimeModel);
  v93[2] = v47;
  v92[3] = &unk_1E6CA1680;
  v48 = -[NTKSolarWaypoint initWithType:solarTimeModel:]([NTKSolarWaypoint alloc], "initWithType:solarTimeModel:", 4, v9->_solarTimeModel);
  v93[3] = v48;
  v92[4] = &unk_1E6CA1698;
  v49 = -[NTKSolarWaypoint initWithType:solarTimeModel:]([NTKSolarWaypoint alloc], "initWithType:solarTimeModel:", 5, v9->_solarTimeModel);
  v93[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 5);
  v50 = objc_claimAutoreleasedReturnValue();
  waypoints = v9->_waypoints;
  v9->_waypoints = (NSDictionary *)v50;

  strokeDiskDiameter = v9->_layoutConstants.strokeDiskDiameter;
  v53 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  strokeDiskMaskLayer = v9->_strokeDiskMaskLayer;
  v9->_strokeDiskMaskLayer = v53;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v9->_strokeDiskMaskLayer, "setBackgroundColor:", objc_msgSend(v55, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EF0]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setCompositingFilter:](v9->_strokeDiskMaskLayer, "setCompositingFilter:", v56);

  -[CALayer setFrame:](v9->_strokeDiskMaskLayer, "setFrame:", 0.0, 0.0, strokeDiskDiameter, strokeDiskDiameter);
  -[CALayer setCornerRadius:](v9->_strokeDiskMaskLayer, "setCornerRadius:", strokeDiskDiameter * 0.5);
  -[NTKBezierPathView layer](v9->_pathView, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addSublayer:", v9->_strokeDiskMaskLayer);

  v58 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  strokeDiskBorderLayer = v9->_strokeDiskBorderLayer;
  v9->_strokeDiskBorderLayer = v58;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBorderColor:](v9->_strokeDiskBorderLayer, "setBorderColor:", objc_msgSend(v60, "CGColor"));

  -[CALayer setBorderWidth:](v9->_strokeDiskBorderLayer, "setBorderWidth:", v9->_layoutConstants.strokeDiskBorderWidth);
  -[CALayer setFrame:](v9->_strokeDiskBorderLayer, "setFrame:", 0.0, 0.0, strokeDiskDiameter, strokeDiskDiameter);
  -[CALayer setCornerRadius:](v9->_strokeDiskBorderLayer, "setCornerRadius:", strokeDiskDiameter * 0.5);
  -[NTKBezierPathView layer](v9->_pathView, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSublayer:", v9->_strokeDiskBorderLayer);

  v62 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  fillDiskLayer = v9->_fillDiskLayer;
  v9->_fillDiskLayer = v62;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v9->_fillDiskLayer, "setBackgroundColor:", objc_msgSend(v64, "CGColor"));

  -[CALayer setFrame:](v9->_fillDiskLayer, "setFrame:", 0.0, 0.0, v9->_layoutConstants.fillDiskDiameter, v9->_layoutConstants.fillDiskDiameter);
  -[CALayer setCornerRadius:](v9->_fillDiskLayer, "setCornerRadius:", v9->_layoutConstants.fillDiskDiameter * 0.5);
  v65 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  fillDiskHaloLayer = v9->_fillDiskHaloLayer;
  v9->_fillDiskHaloLayer = v65;

  NTKImageNamed(CFSTR("RC-Solar-Disk-Halo-Color-Mask"));
  v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setContents:](v9->_fillDiskHaloLayer, "setContents:", objc_msgSend(v67, "CGImage"));
  objc_msgSend(v67, "size");
  v69 = v68;
  objc_msgSend(v67, "size");
  -[CALayer setFrame:](v9->_fillDiskHaloLayer, "setFrame:", 0.0, 0.0, v69, v70);
  v71 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v71, "setBackgroundColor:", objc_msgSend(v72, "CGColor"));

  objc_msgSend(v71, "setCompositingFilter:", *MEMORY[0x1E0CD2EC8]);
  -[CALayer frame](v9->_fillDiskHaloLayer, "frame");
  objc_msgSend(v71, "setFrame:");
  -[CALayer addSublayer:](v9->_fillDiskHaloLayer, "addSublayer:", v71);
  v73 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  belowHorizonLayer = v9->_belowHorizonLayer;
  v9->_belowHorizonLayer = v73;

  -[CALayer setCompositingFilter:](v9->_belowHorizonLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v9->_belowHorizonLayer, "setBackgroundColor:", objc_msgSend(v75, "CGColor"));

  v76 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  fillDiskHaloContainerView = v9->_fillDiskHaloContainerView;
  v9->_fillDiskHaloContainerView = v76;

  -[UIView layer](v9->_fillDiskHaloContainerView, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addSublayer:", v9->_fillDiskLayer);

  -[UIView layer](v9->_fillDiskHaloContainerView, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addSublayer:", v9->_fillDiskHaloLayer);

  -[UIView layer](v9->_fillDiskHaloContainerView, "layer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addSublayer:", v9->_belowHorizonLayer);

  -[NTKSolarRichComplicationFullColorImageView addSubview:](v9, "addSubview:", v9->_fillDiskHaloContainerView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addObserver:selector:name:object:", v9, sel__didReceiveTimeZoneDidChangeNotification, *MEMORY[0x1E0C998A0], 0);
  objc_msgSend(v81, "addObserver:selector:name:object:", v9, sel__didReceiveSignificantTimeChangeNotification, *MEMORY[0x1E0DC4838], 0);
  -[NTKSolarRichComplicationFullColorImageView setClipsToBounds:](v9, "setClipsToBounds:", 1);

LABEL_15:
  return v9;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKSolarRichComplicationFullColorImageView initFullColorImageViewWithDevice:family:](self, "initFullColorImageViewWithDevice:family:", a3, 10);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  -[NTKSolarRichComplicationFullColorImageView dealloc](&v4, sel_dealloc);
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
  double v11;
  double Width;
  double Height;
  double v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  -[NTKSolarRichComplicationFullColorImageView layoutSubviews](&v16, sel_layoutSubviews);
  -[NTKSolarRichComplicationFullColorImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_gradientAdjustmentLayer, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_lineView, "setFrame:", 0.0, self->_layoutConstants.lineTop, v8, self->_layoutConstants.lineHeight);
  v11 = self->_layoutConstants.lineTop + self->_layoutConstants.lineHeight;
  -[CALayer setFrame:](self->_belowHorizonLayer, "setFrame:", 0.0, v11, v8, v10 - v11);
  -[UIView setFrame:](self->_fillDiskHaloContainerView, "setFrame:", v4, v6, v8, v10);
  -[NTKBezierPathView setFrame:](self->_pathView, "setFrame:", v4, v6, v8, v10);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  Width = CGRectGetWidth(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  Height = CGRectGetHeight(v18);
  if (Width < Height)
    Height = Width;
  v14 = Height * 0.5;
  -[NTKSolarRichComplicationFullColorImageView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v14);

}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NTKSolarComplicationEntryLocationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  objc_msgSend(v9, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NTKSolarComplicationUseIdealizedTimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", v6, objc_msgSend(v8, "BOOLValue"), 0, -[NTKSolarRichComplicationFullColorImageView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", 1));

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  if (fabs(a3) >= 0.00000011920929)
  {
    -[NTKSolarRichComplicationFullColorImageView filterProvider](self, "filterProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filtersForView:style:", self, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIView layer](self->_fillDiskHaloContainerView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilters:", v7);

      -[CALayer setFilters:](self->_strokeDiskBorderLayer, "setFilters:", v7);
    }

  }
  else
  {
    -[UIView layer](self->_fillDiskHaloContainerView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[CALayer setFilters:](self->_strokeDiskBorderLayer, "setFilters:", 0);
  }
  -[NTKSolarRichComplicationFullColorImageView filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorForView:accented:", self, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "colorWithAlphaComponent:", 0.4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_lineView, "setBackgroundColor:", v10);

  objc_msgSend(v13, "colorWithAlphaComponent:", 0.78);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBezierPathView setPathColor:](self->_pathView, "setPathColor:", v11);

  objc_msgSend(v13, "colorWithAlphaComponent:", 0.1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSolarRichComplicationFullColorImageView setBackgroundColor:](self, "setBackgroundColor:", v12);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  -[NTKSolarRichComplicationFullColorImageView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIView layer](self->_fillDiskHaloContainerView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v10);

    -[CALayer setFilters:](self->_strokeDiskBorderLayer, "setFilters:", v10);
  }
  -[NTKSolarRichComplicationFullColorImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorForView:accented:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "colorWithAlphaComponent:", 0.4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_lineView, "setBackgroundColor:", v7);

  objc_msgSend(v6, "colorWithAlphaComponent:", 0.78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBezierPathView setPathColor:](self->_pathView, "setPathColor:", v8);

  objc_msgSend(v6, "colorWithAlphaComponent:", 0.1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSolarRichComplicationFullColorImageView setBackgroundColor:](self, "setBackgroundColor:", v9);

}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_startClockUpdates
{
  void *v3;
  CLKClockTimerToken *v4;
  CLKClockTimerToken *clockTimerToken;
  _QWORD v6[4];
  id v7;
  id location;

  self->_paused = 0;
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke;
    v6[3] = &unk_1E6BCED08;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v6, &__block_literal_global_147);
    v4 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  _BYTE *WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[704])
    objc_msgSend(WeakRetained, "_dateDidUpdate");

}

const __CFString *__64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke_36()
{
  return CFSTR("solar rich complication");
}

- (void)_stopClockUpdates
{
  void *v3;
  CLKClockTimerToken *clockTimerToken;

  self->_paused = 1;
  if (self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_clockTimerToken);

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)_dateDidUpdate
{
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", self->_location, self->_usingIdealizedTime, 0, -[NTKSolarRichComplicationFullColorImageView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", 1));
}

- (void)updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  objc_storeStrong((id *)&self->_location, a3);
  v11 = a3;
  self->_usingIdealizedTime = v8;
  -[NTKSolarTimeModel setUsePlaceholderData:](self->_solarTimeModel, "setUsePlaceholderData:", v11 == 0);
  -[NTKSolarTimeModel setReferenceLocation:](self->_solarTimeModel, "setReferenceLocation:", v11);

  -[NTKSolarRichComplicationFullColorImageView _setSolarPathNeedsUpdate](self, "_setSolarPathNeedsUpdate");
  -[NTKSolarRichComplicationFullColorImageView _updateSolarPathWithAnimated:](self, "_updateSolarPathWithAnimated:", v6);
  -[NTKSolarRichComplicationFullColorImageView _updateSolarDiskWithUsingIdealizedTime:forceUpdate:animated:](self, "_updateSolarDiskWithUsingIdealizedTime:forceUpdate:animated:", v8, v7, v6);
}

- (void)_setSolarPathNeedsUpdate
{
  self->_solarPathNeedsUpdate = 1;
}

- (void)_updateSolarPathWithAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NTKSolarPath *solarPath;
  _BOOL4 solarPathNeedsUpdate;
  NTKSolarPath *v7;
  void *v8;
  void *v9;
  NTKSolarPath *v10;
  NTKSolarPath *v11;
  void *v12;
  void *v13;
  NTKBezierPathPointModel *v14;
  NTKBezierPathPointModel *pointModel;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  NTKBezierPathView *pathView;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v3 = a3;
  solarPath = self->_solarPath;
  solarPathNeedsUpdate = self->_solarPathNeedsUpdate;
  v7 = solarPath;
  if (solarPathNeedsUpdate)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_waypoints, "objectForKeyedSubscript:", &unk_1E6CA1650);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_waypoints, "objectForKeyedSubscript:", &unk_1E6CA1680);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKSolarRichComplicatonCircularPath pathWithDiameter:horizonLineTop:horizonLineHeight:maxCurveHeight:solarTimeModel:sunriseWaypoint:sunsetWayPoint:](NTKSolarRichComplicatonCircularPath, "pathWithDiameter:horizonLineTop:horizonLineHeight:maxCurveHeight:solarTimeModel:sunriseWaypoint:sunsetWayPoint:", self->_solarTimeModel, v8, v9, self->_layoutConstants.curveMaxSize.width, self->_layoutConstants.lineTop, self->_layoutConstants.lineHeight, self->_layoutConstants.curveMaxSize.height);
    v10 = (NTKSolarPath *)objc_claimAutoreleasedReturnValue();
    v11 = self->_solarPath;
    self->_solarPath = v10;

    v7 = self->_solarPath;
  }
  -[NTKSolarPath bezierPath](v7, "bezierPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v13, "setLineWidth:", self->_layoutConstants.curveLineWidth);
  if (self->_solarPathNeedsUpdate)
  {
    v14 = -[NTKBezierPathPointModel initWithPath:]([NTKBezierPathPointModel alloc], "initWithPath:", v13);
    pointModel = self->_pointModel;
    self->_pointModel = v14;

  }
  self->_solarPathNeedsUpdate = 0;
  -[NTKSolarRichComplicationFullColorImageView _updateWaypoints](self, "_updateWaypoints");
  -[NTKSolarPath bounds](self->_solarPath, "bounds");
  v17 = (self->_layoutConstants.complicationContentDiameter - v16) * 0.5;
  v18 = self->_layoutConstants.lineTop - self->_horizonYInCurve;
  self->_solarPathViewRect.origin.x = v17;
  self->_solarPathViewRect.origin.y = v18;
  self->_solarPathViewRect.size.width = v16;
  self->_solarPathViewRect.size.height = v19;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v17, v18);
  v21 = v22;
  objc_msgSend(v13, "applyTransform:", &v21);
  pathView = self->_pathView;
  if (v3 && solarPath)
    -[NTKBezierPathView animateToPath:duration:curve:](pathView, "animateToPath:duration:curve:", v13, 1, 0.5);
  else
    -[NTKBezierPathView setPath:](pathView, "setPath:", v13);

}

- (void)_updateWaypoints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NTKSolarTimeModel *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NTKSolarTimeModel *solarTimeModel;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  NTKSolarTimeModel *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSDictionary allValues](self->_waypoints, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[NTKSolarTimeModel referenceLocation](self->_solarTimeModel, "referenceLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v8, "updateDependentValues");
        else
          objc_msgSend(v8, "updateDependentValuesWithPlaceholderData");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v5);
  }

  -[NSDictionary objectForKeyedSubscript:](self->_waypoints, "objectForKeyedSubscript:", &unk_1E6CA1650);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_waypoints, "objectForKeyedSubscript:", &unk_1E6CA1680);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "percentageThroughPeriodForWaypointDate");
  if (v12 == -1.0)
  {
    objc_msgSend(v11, "percentageThroughPeriodForWaypointDate");
    if (v19 == -1.0)
    {
      -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](self->_pointModel, "pointOnPathForHorizontalPercentage:", 0.5);
      v26 = v25;
      -[NTKSolarPath altitudeAtPercentage:](self->_solarPath, "altitudeAtPercentage:", 0.5);
      v18 = v26 + v27;
    }
    else
    {
      solarTimeModel = self->_solarTimeModel;
      objc_msgSend(v11, "waypointDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSolarTimeModel percentageThroughPeriodForDate:](solarTimeModel, "percentageThroughPeriodForDate:", v21);
      v23 = v22;

      -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](self->_pointModel, "pointOnPathForHorizontalPercentage:", v23);
      v18 = v24 + self->_layoutConstants.lineHeight;
    }
  }
  else
  {
    v13 = self->_solarTimeModel;
    objc_msgSend(v10, "waypointDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSolarTimeModel percentageThroughPeriodForDate:](v13, "percentageThroughPeriodForDate:", v14);
    v16 = v15;

    -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](self->_pointModel, "pointOnPathForHorizontalPercentage:", v16);
    v18 = v17 + self->_layoutConstants.lineHeight;
  }
  v28 = v18;
  self->_horizonYInCurve = floorf(v28);
  objc_msgSend(v11, "percentageThroughPeriodForWaypointDate");
  if (v29 == -1.0)
  {
    -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](self->_pointModel, "pointOnPathForHorizontalPercentage:", 0.75);
  }
  else
  {
    v30 = self->_solarTimeModel;
    objc_msgSend(v11, "waypointDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSolarTimeModel percentageThroughPeriodForDate:](v30, "percentageThroughPeriodForDate:", v31);
    v33 = v32;

    -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](self->_pointModel, "pointOnPathForHorizontalPercentage:", v33);
    *(float *)&v34 = v34;
    v35 = floorf(*(float *)&v34);
  }
  self->_sunsetXInCurve = v35;

}

- (void)_updateSolarDiskWithUsingIdealizedTime:(BOOL)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  NTKSolarTimeModel *solarTimeModel;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double y;
  double prevDiskTimePercentage;
  double height;
  double v20;
  double v21;
  double v22;
  void (**v23)(double);
  double v24;
  float v25;
  double v26;
  CGFloat v27;
  CALayer *fillDiskHaloLayer;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  _QWORD aBlock[4];
  id v34[7];
  id location;

  v6 = a3;
  -[NTKSolarRichComplicationFullColorImageView timeTravelDate](self, "timeTravelDate", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  solarTimeModel = self->_solarTimeModel;
  if (v8)
  {
    -[NTKSolarRichComplicationFullColorImageView timeTravelDate](self, "timeTravelDate");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v10;
    -[NTKSolarTimeModel percentageThroughPeriodForDate:](solarTimeModel, "percentageThroughPeriodForDate:", v10);
    v12 = v14;

    goto LABEL_7;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[NTKSolarTimeModel percentageThroughPeriodForIdealizedTimeInCurrentSolarDay](self->_solarTimeModel, "percentageThroughPeriodForIdealizedTimeInCurrentSolarDay");
  v12 = v11;
LABEL_7:
  v15 = (self->_layoutConstants.strokeDiskDiameter + self->_layoutConstants.strokeDiskBorderWidth) * 0.5;
  -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:withEndPadding:](self->_pointModel, "pointOnPathForHorizontalPercentage:withEndPadding:", v12, v15);
  y = self->_solarPathViewRect.origin.y;
  prevDiskTimePercentage = self->_prevDiskTimePercentage;
  if (a4 || vabdd_f64(v12, prevDiskTimePercentage) >= 0.00000011920929)
  {
    v30 = v16;
    height = self->_layoutConstants.curveMaxSize.height;
    v20 = self->_layoutConstants.lineTop + self->_layoutConstants.lineHeight * 0.5 - y;
    v21 = height * v20 / height;
    v22 = height - v21;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__NTKSolarRichComplicationFullColorImageView__updateSolarDiskWithUsingIdealizedTime_forceUpdate_animated___block_invoke;
    aBlock[3] = &unk_1E6BD8F70;
    objc_copyWeak(v34, &location);
    *(double *)&v34[1] = v12 - prevDiskTimePercentage;
    v34[2] = *(id *)&prevDiskTimePercentage;
    v34[3] = *(id *)&v15;
    v34[4] = *(id *)&v20;
    v34[5] = *(id *)&v21;
    v34[6] = *(id *)&v22;
    v23 = (void (**)(double))_Block_copy(aBlock);
    self->_prevDiskTimePercentage = v12;
    v23[2](1.0);
    v24 = (self->_layoutConstants.lineTop - (v30 + y))
        / (self->_layoutConstants.lineTop - self->_solarPathViewRect.origin.y);
    v25 = 1.0;
    if (v24 < 0.1)
    {
      v26 = (0.1 - v24) / -0.2 + 1.0;
      if (v26 > 1.0)
        v26 = 1.0;
      if (v26 < 0.0)
        v26 = 0.0;
      v25 = v26;
    }
    if (v24 > 1.0)
      v24 = 1.0;
    if (v24 < 0.0)
      v24 = 0.0;
    v27 = self->_layoutConstants.haloMinScale
        + (self->_layoutConstants.haloMaxScale - self->_layoutConstants.haloMinScale) * v24;
    CGAffineTransformMakeScale(&v32, v27, v27);
    fillDiskHaloLayer = self->_fillDiskHaloLayer;
    v31 = v32;
    -[CALayer setAffineTransform:](fillDiskHaloLayer, "setAffineTransform:", &v31);
    *(float *)&v29 = v25;
    -[CALayer setOpacity:](self->_fillDiskHaloLayer, "setOpacity:", v29);

    objc_destroyWeak(v34);
    objc_destroyWeak(&location);
  }
}

void __106__NTKSolarRichComplicationFullColorImageView__updateSolarDiskWithUsingIdealizedTime_forceUpdate_animated___block_invoke(uint64_t a1, double a2)
{
  id *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 48) + *(double *)(a1 + 40) * a2;
    v12 = WeakRetained;
    objc_msgSend(WeakRetained[71], "pointOnPathForHorizontalPercentage:withEndPadding:", v5 - (double)(uint64_t)v5, *(double *)(a1 + 56));
    v7 = v6;
    v9 = v8;
    v10 = v6 + *((double *)v12 + 81);
    v11 = v8 + *((double *)v12 + 82);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v12[73], "setPosition:", v10, v11);
    objc_msgSend(v12[72], "setPosition:", v10, v11);
    objc_msgSend(v12[74], "setPosition:", v10, v11);
    objc_msgSend(v12[75], "setPosition:", v10, v11);
    objc_msgSend(v12, "_updateGradientBackgroundWithYPosition:xPercentage:topDistanceAboveHorizonLine:bottomDistanceBelowHorizonLine:", *(double *)(a1 + 64) - v9, v7 / *((double *)v12 + 83), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    WeakRetained = v12;
  }

}

- (void)_updateGradientBackgroundWithYPosition:(double)a3 xPercentage:(double)a4 topDistanceAboveHorizonLine:(double)a5 bottomDistanceBelowHorizonLine:(double)a6
{
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  void *v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double backgroundGradientSunsetLayerMaxAlpha;
  double v50;
  _QWORD v51[8];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[3];
  _QWORD v69[5];

  v69[3] = *MEMORY[0x1E0C80C00];
  v8 = a3 * 90.0 / a6;
  v62 = 0;
  v63 = &v62;
  if (v8 > 90.0)
    v8 = 90.0;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__45;
  v66 = __Block_byref_object_dispose__45;
  v67 = 0;
  if (v8 >= -90.0)
    v9 = v8;
  else
    v9 = -90.0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__45;
  v60 = __Block_byref_object_dispose__45;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  +[NTKSolarRichComplicationCircularViewColorPoint allPoints](NTKSolarRichComplicationCircularViewColorPoint, "allPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "progress");
  v13 = v9 > v12;

  if (v13)
  {
    objc_msgSend(v10, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "progress");
    v16 = v9 < v15;

    if (v16)
    {
      objc_msgSend(v10, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v63[5];
      v63[5] = v17;

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __156__NTKSolarRichComplicationFullColorImageView__updateGradientBackgroundWithYPosition_xPercentage_topDistanceAboveHorizonLine_bottomDistanceBelowHorizonLine___block_invoke;
      v51[3] = &unk_1E6BD8F98;
      *(double *)&v51[7] = v9;
      v51[4] = &v56;
      v51[5] = &v62;
      v51[6] = &v52;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v51);
      goto LABEL_12;
    }
    objc_msgSend(v10, "lastObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v63[5];
    v63[5] = v22;

    objc_msgSend(v10, "lastObject");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v63[5];
    v63[5] = v19;

    objc_msgSend(v10, "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v57[5];
  v57[5] = v21;

  v53[3] = 0x3FF0000000000000;
LABEL_12:
  objc_msgSend((id)v63[5], "color1");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v57[5], "color1");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v63[5], "color2");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v57[5], "color2");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v63[5], "color3");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v57[5], "color3");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v63[5], "position1");
  objc_msgSend((id)v57[5], "position1");
  CLKInterpolateBetweenFloatsClipped();
  v35 = v34;
  objc_msgSend((id)v63[5], "position2");
  objc_msgSend((id)v57[5], "position2");
  CLKInterpolateBetweenFloatsClipped();
  v37 = v36;
  objc_msgSend((id)v63[5], "position3");
  objc_msgSend((id)v57[5], "position3");
  CLKInterpolateBetweenFloatsClipped();
  v39 = v38;
  v40 = objc_retainAutorelease(v27);
  v69[0] = objc_msgSend(v40, "CGColor");
  v41 = objc_retainAutorelease(v30);
  v69[1] = objc_msgSend(v41, "CGColor");
  v42 = objc_retainAutorelease(v33);
  v69[2] = objc_msgSend(v42, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v43);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v44;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v45;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v47);

  v48 = self->_sunsetXInCurve / self->_solarPathViewRect.size.width;
  backgroundGradientSunsetLayerMaxAlpha = self->_layoutConstants.backgroundGradientSunsetLayerMaxAlpha;
  if (v48 <= a4)
  {
    *(float *)&v48 = backgroundGradientSunsetLayerMaxAlpha;
  }
  else
  {
    v50 = v48 - a4;
    LODWORD(v48) = 0;
    if (v50 <= 0.15)
    {
      v48 = backgroundGradientSunsetLayerMaxAlpha + v50 / -0.15 * backgroundGradientSunsetLayerMaxAlpha;
      *(float *)&v48 = v48;
    }
  }
  -[CALayer setOpacity:](self->_gradientAdjustmentLayer, "setOpacity:", v48);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __156__NTKSolarRichComplicationFullColorImageView__updateGradientBackgroundWithYPosition_xPercentage_topDistanceAboveHorizonLine_bottomDistanceBelowHorizonLine___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v8 = a2;
  if (a3)
  {
    v9 = *(double *)(a1 + 56);
    v18 = v8;
    objc_msgSend(v8, "progress");
    if (v9 <= v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "progress");
      v12 = v11;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "progress");
      if (v12 >= v13)
        v14 = v13;
      else
        v14 = v12;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "progress");
      v16 = v15;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "progress");
      if (v16 >= v17)
        v17 = v16;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(double *)(a1 + 56) - v14) / (v17 - v14);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
    v8 = v18;
  }

}

- (void)_didReceiveTimeZoneDidChangeNotification
{
  -[NTKSolarTimeModel updateForTimeZoneChange](self->_solarTimeModel, "updateForTimeZoneChange");
  -[NTKSolarRichComplicationFullColorImageView _setSolarPathNeedsUpdate](self, "_setSolarPathNeedsUpdate");
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", self->_location, self->_usingIdealizedTime, 0, -[NTKSolarRichComplicationFullColorImageView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", 1));
}

- (void)_didReceiveSignificantTimeChangeNotification
{
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", self->_location, self->_usingIdealizedTime, 0, -[NTKSolarRichComplicationFullColorImageView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", 1));
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)usingIdealizedTime
{
  return self->_usingIdealizedTime;
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_fillDiskHaloContainerView, 0);
  objc_storeStrong((id *)&self->_belowHorizonLayer, 0);
  objc_storeStrong((id *)&self->_fillDiskHaloLayer, 0);
  objc_storeStrong((id *)&self->_fillDiskLayer, 0);
  objc_storeStrong((id *)&self->_strokeDiskBorderLayer, 0);
  objc_storeStrong((id *)&self->_strokeDiskMaskLayer, 0);
  objc_storeStrong((id *)&self->_pointModel, 0);
  objc_storeStrong((id *)&self->_solarPath, 0);
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_pathView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_gradientAdjustmentLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

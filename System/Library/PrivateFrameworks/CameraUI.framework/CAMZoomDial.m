@implementation CAMZoomDial

- (CAMZoomDial)initWithStyle:(int64_t)a3
{
  CAMZoomDial *v4;
  CAMZoomDial *v5;
  CAMZoomDial *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMZoomDial;
  v4 = -[CAMZoomDial initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[CAMZoomDial _commonCAMZoomDialInitialization](v4, "_commonCAMZoomDialInitialization");
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMZoomDialInitialization
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *imageGenerationQueue;
  NSArray *zoomFactors;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIImageView *v16;
  UIImageView *backgroundView;
  UIView *v18;
  UIView *contentContainerView;
  UIView *v20;
  UIView *labelContainerView;
  UIView *v22;
  UIView *focalLengthLabelContainerView;
  void *v24;
  CAMZoomDialDotsView *v25;
  CAMZoomDialDotsView *activeDots;
  CAMZoomDialDotsView *v27;
  CAMZoomDialDotsView *inactiveDots;
  UIImageView *v29;
  UIImageView *ticksView;
  UIImageView *v31;
  UIImageView *contentMaskView;
  void *v33;
  double v34;
  double v35;
  id v36;
  id v37;
  UIView *v38;
  UIView *needleView;
  void *v40;
  id v41;

  -[CAMZoomDial setSemanticContentAttribute:](self, "setSemanticContentAttribute:", 3);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.zoom-dial-image-generation", v3);
  imageGenerationQueue = self->__imageGenerationQueue;
  self->__imageGenerationQueue = v4;

  zoomFactors = self->_zoomFactors;
  self->_zoomFactors = (NSArray *)&unk_1EA3B3938;

  -[NSArray firstObject](self->_zoomFactors, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  self->_minAvailableZoomFactor = v8;

  -[NSArray lastObject](self->_zoomFactors, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  self->_maxAvailableZoomFactor = v10;

  self->_zoomFactor = self->_minAvailableZoomFactor;
  self->_angleDeltaForZoomRange = 1.57079633;
  self->_expanded = 1;
  self->__backgroundViewUpdateNeeded = 1;
  self->__labelsUpdateNeeded = 1;
  self->__dotsUpdateNeeded = -[CAMZoomDial _useDots](self, "_useDots");
  self->__ticksUpdateNeeded = -[CAMZoomDial _useTicks](self, "_useTicks");
  self->__maskUpdateNeeded = -[CAMZoomDial _useTicks](self, "_useTicks");
  v11 = objc_alloc(MEMORY[0x1E0DC3890]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v16;

  -[CAMZoomDial addSubview:](self, "addSubview:", self->__backgroundView);
  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
  contentContainerView = self->__contentContainerView;
  self->__contentContainerView = v18;

  -[CAMZoomDial addSubview:](self, "addSubview:", self->__contentContainerView);
  if (-[CAMZoomDial _useTicks](self, "_useTicks"))
  {
    v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
    labelContainerView = self->__labelContainerView;
    self->__labelContainerView = v20;

    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__labelContainerView);
    v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
    focalLengthLabelContainerView = self->__focalLengthLabelContainerView;
    self->__focalLengthLabelContainerView = v22;

    -[UIView addSubview:](self->__labelContainerView, "addSubview:", self->__focalLengthLabelContainerView);
  }
  if (-[CAMZoomDial _useDots](self, "_useDots"))
  {
    -[CAMZoomDial _createDotImage](self, "_createDotImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[CAMZoomDialDotsView initWithDotImage:]([CAMZoomDialDotsView alloc], "initWithDotImage:", v24);
    activeDots = self->__activeDots;
    self->__activeDots = v25;

    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__activeDots);
    v27 = -[CAMZoomDialDotsView initWithDotImage:]([CAMZoomDialDotsView alloc], "initWithDotImage:", v24);
    inactiveDots = self->__inactiveDots;
    self->__inactiveDots = v27;

    -[CAMZoomDialDotsView setAlpha:](self->__inactiveDots, "setAlpha:", 0.35);
    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__inactiveDots);

  }
  if (-[CAMZoomDial _useTicks](self, "_useTicks"))
  {
    v29 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v12, v13, v14, v15);
    ticksView = self->__ticksView;
    self->__ticksView = v29;

    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__ticksView);
    v31 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    contentMaskView = self->__contentMaskView;
    self->__contentMaskView = v31;

    -[UIView setMaskView:](self->__contentContainerView, "setMaskView:", self->__contentMaskView);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0C9D538];
    v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v33, "moveToPoint:", *MEMORY[0x1E0C9D538], v35);
    objc_msgSend(v33, "addLineToPoint:", 4.0, 0.0);
    objc_msgSend(v33, "addLineToPoint:", 2.0, 10.0);
    objc_msgSend(v33, "addLineToPoint:", v34, v35);
    v36 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    v41 = objc_retainAutorelease(v33);
    objc_msgSend(v36, "setPath:", objc_msgSend(v41, "CGPath"));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v36, "setFillColor:", objc_msgSend(v37, "CGColor"));

    v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
    needleView = self->__needleView;
    self->__needleView = v38;

    -[UIView layer](self->__needleView, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSublayer:", v36);

    -[CAMZoomDial addSubview:](self, "addSubview:", self->__needleView);
  }
}

- (BOOL)_useDots
{
  return -[CAMZoomDial style](self, "style") == 0;
}

- (BOOL)_useTicks
{
  return -[CAMZoomDial style](self, "style") != 0;
}

- (double)minimumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomDial zoomFactors](self, "zoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)maximumZoomFactor
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CAMZoomDial zoomFactors](self, "zoomFactors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setZoomPoints:(id)a3
{
  NSArray *v5;
  NSArray *zoomFactors;
  double v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_zoomPoints, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_zoomPoints, a3);
    +[CAMZoomPoint displayZoomFactorsFromZoomPoints:](CAMZoomPoint, "displayZoomFactorsFromZoomPoints:", v8);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    zoomFactors = self->_zoomFactors;
    self->_zoomFactors = v5;

    -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
    -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
    CEKClamp();
    self->_zoomFactor = v7;
    -[CAMZoomDial _setLabelsUpdateNeeded:](self, "_setLabelsUpdateNeeded:", 1);
    -[CAMZoomDial _setDotsUpdateNeeded:](self, "_setDotsUpdateNeeded:", -[CAMZoomDial _useDots](self, "_useDots"));
    -[CAMZoomDial _setTicksUpdateNeeded:](self, "_setTicksUpdateNeeded:", -[CAMZoomDial _useTicks](self, "_useTicks"));
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMinAvailableZoomFactor:(double)a3
{
  if (self->_minAvailableZoomFactor != a3)
  {
    self->_minAvailableZoomFactor = a3;
    -[CAMZoomDial _setLabelsUpdateNeeded:](self, "_setLabelsUpdateNeeded:", 1);
    -[CAMZoomDial _setDotsUpdateNeeded:](self, "_setDotsUpdateNeeded:", -[CAMZoomDial _useDots](self, "_useDots"));
    -[CAMZoomDial _setTicksUpdateNeeded:](self, "_setTicksUpdateNeeded:", -[CAMZoomDial _useTicks](self, "_useTicks"));
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaxAvailableZoomFactor:(double)a3
{
  if (self->_maxAvailableZoomFactor != a3)
  {
    self->_maxAvailableZoomFactor = a3;
    -[CAMZoomDial _setLabelsUpdateNeeded:](self, "_setLabelsUpdateNeeded:", 1);
    -[CAMZoomDial _setTicksUpdateNeeded:](self, "_setTicksUpdateNeeded:", -[CAMZoomDial _useTicks](self, "_useTicks"));
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setZoomFactor:(double)a3
{
  double v4;

  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
  -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
  -[CAMZoomDial maxAvailableZoomFactor](self, "maxAvailableZoomFactor");
  CEKClamp();
  if (self->_zoomFactor != v4)
  {
    self->_zoomFactor = v4;
    if ((unint64_t)(-[CAMZoomDial orientation](self, "orientation") - 3) >= 2)
      -[CAMZoomDial _updatePortraitFocalLengthLabelAlphas](self, "_updatePortraitFocalLengthLabelAlphas");
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)normalizedValueForZoomFactor:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double result;

  v5 = (void *)objc_opt_class();
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v7 = v6;
  -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
  objc_msgSend(v5, "_normalizedValueForZoomFactor:min:max:", a3, v7, v8);
  return result;
}

+ (double)_normalizedValueForZoomFactor:(double)a3 min:(double)a4 max:(double)a5
{
  double v7;
  double v8;
  double result;
  double v10;

  CEKClamp();
  v8 = v7;
  result = 0.0;
  if (a5 != a4)
  {
    v10 = log(v8 / a4);
    return v10 / log(a5 / a4);
  }
  return result;
}

- (double)zoomFactorForNormalizedValue:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  long double v8;

  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v5 = v4;
  -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
  v7 = v6;
  CEKClamp();
  return v5 * pow(v7 / v5, v8);
}

- (void)setContentMaskingHeight:(double)a3
{
  if (self->_contentMaskingHeight != a3)
  {
    self->_contentMaskingHeight = a3;
    if (-[CAMZoomDial _useTicks](self, "_useTicks"))
      -[CAMZoomDial _setMaskUpdateNeeded:](self, "_setMaskUpdateNeeded:", 1);
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContractionDistance:(double)a3
{
  if (self->_contractionDistance != a3)
  {
    self->_contractionDistance = a3;
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_radiusDelta
{
  BOOL v3;
  double result;
  double v5;

  v3 = -[CAMZoomDial isExpanded](self, "isExpanded");
  result = 0.0;
  if (!v3)
  {
    -[CAMZoomDial contractionDistance](self, "contractionDistance", 0.0);
    return -v5;
  }
  return result;
}

- (void)_updateLabelsIfNeeded
{
  if (-[CAMZoomDial _isLabelsUpdateNeeded](self, "_isLabelsUpdateNeeded"))
  {
    -[CAMZoomDial _setLabelsUpdateNeeded:](self, "_setLabelsUpdateNeeded:", 0);
    -[CAMZoomDial _updateLabels](self, "_updateLabels");
    -[CAMZoomDial _updateFocalLengthLabels](self, "_updateFocalLengthLabels");
  }
}

- (void)_updateContentIfNeeded
{
  -[CAMZoomDial _updateLabelsIfNeeded](self, "_updateLabelsIfNeeded");
  if (-[CAMZoomDial _isDotsUpdateNeeded](self, "_isDotsUpdateNeeded"))
  {
    -[CAMZoomDial _updateDots](self, "_updateDots");
    -[CAMZoomDial _setDotsUpdateNeeded:](self, "_setDotsUpdateNeeded:", 0);
  }
  -[CAMZoomDial _updateTicksImageIfNeeded](self, "_updateTicksImageIfNeeded");
  -[CAMZoomDial _updateMaskImageIfNeeded](self, "_updateMaskImageIfNeeded");
}

- (void)_updateLabels
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  double v29;
  double v30;
  _BOOL4 v31;
  double v32;
  CAMZoomFactorLabel *v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v35 = v3;
  -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
  v5 = v4;
  -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
  v36 = v6;
  -[CAMZoomDial maxAvailableZoomFactor](self, "maxAvailableZoomFactor");
  v8 = v7;
  v9 = -[CAMZoomDial _useDots](self, "_useDots");
  -[CAMZoomDial zoomFactors](self, "zoomFactors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v5)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[CAMZoomDial zoomFactors](self, "zoomFactors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v15), "doubleValue");
        if (vabdd_f64(v16, v8) < 0.01)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[CAMZoomDial zoomFactors](self, "zoomFactors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
    }

  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v34 = 0.01;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "doubleValue", *(_QWORD *)&v34);
        v30 = v29;
        if (v9)
        {
          v31 = v29 == v5 || v29 == v35;
          if (v31 || v36 == v35)
          {
            if (!v31)
              continue;
          }
          else if (vabdd_f64(v29, v36) >= v34)
          {
            continue;
          }
        }
        if (v9 && v29 < v36 + -0.01)
          v32 = 0.35;
        else
          v32 = 1.0;
        v33 = -[CAMZoomFactorLabel initWithFrame:]([CAMZoomFactorLabel alloc], "initWithFrame:", v24, v25, v26, v27);
        -[CAMZoomFactorLabel setPreferDefaultSizing:](v33, "setPreferDefaultSizing:", -[CAMZoomDial _useDots](self, "_useDots"));
        -[CAMZoomFactorLabel setShowZoomFactorSymbol:](v33, "setShowZoomFactorSymbol:", v9);
        -[CAMZoomFactorLabel setZoomFactor:](v33, "setZoomFactor:", v30);
        -[CAMZoomFactorLabel setAlpha:](v33, "setAlpha:", v32);
        objc_msgSend(v19, "addObject:", v33);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v22);
  }

  -[CAMZoomDial _setLabels:](self, "_setLabels:", v19);
  -[CAMZoomDial _updateMinimizedLabels](self, "_updateMinimizedLabels");

}

- (void)_updateMinimizedLabels
{
  void *v3;
  unint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[CAMZoomDial zoomPoints](self, "zoomPoints");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _labels](self, "_labels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CAMZoomDial _useDots](self, "_useDots"))
  {
    v4 = objc_msgSend(v3, "count");
    if (v4 >= objc_msgSend(v5, "count"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __37__CAMZoomDial__updateMinimizedLabels__block_invoke;
      v6[3] = &unk_1EA32D6F8;
      v7 = v3;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

    }
  }

}

void __37__CAMZoomDial__updateMinimizedLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a2, "isCustomLens");
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimized:", v5);

}

- (void)_updateFocalLengthLabels
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (-[CAMZoomDial _useTicks](self, "_useTicks"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CAMZoomDial zoomPoints](self, "zoomPoints");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__CAMZoomDial__updateFocalLengthLabels__block_invoke;
    v8[3] = &unk_1EA32D720;
    v9 = v3;
    v10 = v4;
    v5 = v4;
    v6 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
    -[CAMZoomDial _setFocalLengthLabelsPortrait:](self, "_setFocalLengthLabelsPortrait:", v6);
    -[CAMZoomDial _setFocalLengthLabelsLandscape:](self, "_setFocalLengthLabelsLandscape:", v5);
    -[CAMZoomDial _updateFocalLengthLabelAlphas](self, "_updateFocalLengthLabelAlphas");

  }
}

void __39__CAMZoomDial__updateFocalLengthLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  uint64_t v7;
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
  id v19;

  objc_msgSend(a2, "displayFocalLength");
  if ((uint64_t)v6
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldmm"), (uint64_t)v6),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (id)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-landscape"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:", v19, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v15);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v16);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);

  }
  else
  {
    *a4 = 1;
  }
}

- (void)_updateDots
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;

  if (-[CAMZoomDial _useDots](self, "_useDots"))
  {
    -[CAMZoomDial _activeDots](self, "_activeDots");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMZoomDial _inactiveDots](self, "_inactiveDots");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CAMZoomDial _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
    v6 = v5;
    -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
    v8 = v7;
    -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
    v10 = v9;
    v11 = v9 == v6;
    -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v6);
    v13 = v12;
    -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v8);
    v15 = v14;
    -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v10);
    v17 = v16;
    v18 = 0.0436332313;
    if (v4)
      v18 = -0.0436332313;
    v19 = (v15 - v13) / v18;
    v20 = (v15 - v13) / (double)(uint64_t)round(v19);
    objc_msgSend(v25, "setDotSpacingAngle:", v20);
    objc_msgSend(v3, "setDotSpacingAngle:", v20);
    objc_msgSend(v3, "setHidden:", v11);
    v21 = llround(v19);
    if (v10 == v6)
    {
      v22 = v21 - 3;
      v23 = v25;
    }
    else
    {
      v24 = llround((v15 - v17) / v20);
      objc_msgSend(v25, "setDotCount:", v24 - 3);
      v22 = v21 - v24 - 3;
      v23 = v3;
    }
    objc_msgSend(v23, "setDotCount:", v22);

  }
}

- (void)_setLabels:(id)a3
{
  NSArray *v5;
  NSArray *labels;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  labels = self->__labels;
  if (labels != v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = labels;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__labels, a3);
    -[CAMZoomDial _labelContainerView](self, "_labelContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[CAMZoomDial _contentContainerView](self, "_contentContainerView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v5;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v15, "addSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (void)_setFocalLengthLabelsPortrait:(id)a3
{
  NSArray *v5;
  NSArray *focalLengthLabelsPortrait;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  focalLengthLabelsPortrait = self->__focalLengthLabelsPortrait;
  if (focalLengthLabelsPortrait != v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = focalLengthLabelsPortrait;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__focalLengthLabelsPortrait, a3);
    -[CAMZoomDial _focalLengthLabelContainerView](self, "_focalLengthLabelContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[CAMZoomDial _contentContainerView](self, "_contentContainerView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v5;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v15, "addSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (void)_setFocalLengthLabelsLandscape:(id)a3
{
  NSArray *v5;
  NSArray *focalLengthLabelsLandscape;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  focalLengthLabelsLandscape = self->__focalLengthLabelsLandscape;
  if (focalLengthLabelsLandscape != v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = focalLengthLabelsLandscape;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__focalLengthLabelsLandscape, a3);
    -[CAMZoomDial _focalLengthLabelContainerView](self, "_focalLengthLabelContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[CAMZoomDial _contentContainerView](self, "_contentContainerView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v5;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v15, "addSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (void)_updateFocalLengthLabelAlphas
{
  BOOL v3;
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  v3 = (unint64_t)(-[CAMZoomDial orientation](self, "orientation") - 3) < 2;
  -[CAMZoomDial _focalLengthLabelsLandscape](self, "_focalLengthLabelsLandscape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CAMZoomDial__updateFocalLengthLabelAlphas__block_invoke;
  v5[3] = &__block_descriptor_33_e28_v32__0__UIImageView_8Q16_B24l;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  -[CAMZoomDial _updatePortraitFocalLengthLabelAlphas](self, "_updatePortraitFocalLengthLabelAlphas");
}

uint64_t __44__CAMZoomDial__updateFocalLengthLabelAlphas__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 0.0;
  return objc_msgSend(a2, "setAlpha:", v2);
}

- (void)_updatePortraitFocalLengthLabelAlphas
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  uint64_t v26;
  double (**v27)(void *, uint64_t, double);
  unint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  _QWORD aBlock[4];
  id v35;
  CAMZoomDial *v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[CAMZoomDial _updateLabelsIfNeeded](self, "_updateLabelsIfNeeded");
  -[CAMZoomDial _focalLengthLabelsPortrait](self, "_focalLengthLabelsPortrait");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[CAMZoomDial orientation](self, "orientation") - 3) > 1)
  {
    -[CAMZoomDial zoomPoints](self, "zoomPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomDial _zoomPointIndexesForPrioritizedFocalLengthLabels](self, "_zoomPointIndexesForPrioritizedFocalLengthLabels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = 1.79769313e308;
      v14 = 1.79769313e308;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMZoomDial _offsetAngleForZoomPoint:](self, "_offsetAngleForZoomPoint:", v15);
        v17 = v16;
        if (v11)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11 - 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMZoomDial _offsetAngleForZoomPoint:](self, "_offsetAngleForZoomPoint:", v18);
          v20 = vabdd_f64(v17, v19);
          if (v20 < v13)
            v13 = v20;

        }
        v21 = objc_msgSend(v10, "containsIndex:", v11);
        v22 = fabs(v17);
        v23 = fabs(v14);
        v24 = v22 < v23;
        if (v22 < v23)
          v25 = v17;
        else
          v25 = v14;
        if (v24)
          v26 = v11;
        else
          v26 = v12;
        if ((v21 & 1) == 0)
        {
          v14 = v25;
          v12 = v26;
        }

        ++v11;
      }
      while (v11 < objc_msgSend(v9, "count"));
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v14 = 1.79769313e308;
      v13 = 1.79769313e308;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__CAMZoomDial__updatePortraitFocalLengthLabelAlphas__block_invoke;
    aBlock[3] = &unk_1EA32D768;
    v4 = v9;
    v35 = v4;
    v36 = self;
    v37 = v13 / 1.5;
    v27 = (double (**)(void *, uint64_t, double))_Block_copy(aBlock);
    if (objc_msgSend(v3, "count"))
    {
      v28 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsIndex:", v28) & 1) != 0)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMZoomDial _offsetAngleForZoomPoint:](self, "_offsetAngleForZoomPoint:", v30);
          v32 = vabdd_f64(v31, v14);
          v33 = 1.0;
          if (v32 < 0.2)
            v33 = 1.0 - v27[2](v27, v12, 1.0);
          objc_msgSend(v29, "setAlpha:", v33);

        }
        else
        {
          ((void (*)(double (**)(void *, uint64_t, double), unint64_t))v27[2])(v27, v28);
          objc_msgSend(v29, "setAlpha:");
        }

        ++v28;
      }
      while (v28 < objc_msgSend(v3, "count"));
    }

  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v39 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "setAlpha:", 0.0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v6);
    }
  }

}

double __52__CAMZoomDial__updatePortraitFocalLengthLabelAlphas__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_offsetAngleForZoomPoint:", v3);
  CEKProgressClamped();
  v5 = v4;

  return v5;
}

- (id)_zoomPointIndexesForPrioritizedFocalLengthLabels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial zoomPoints](self, "zoomPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CAMZoomDial__zoomPointIndexesForPrioritizedFocalLengthLabels__block_invoke;
  v11[3] = &unk_1EA32D720;
  v6 = v5;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __63__CAMZoomDial__zoomPointIndexesForPrioritizedFocalLengthLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "isCustomLens") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "isQuadraWideSupported")
    && (objc_msgSend(v8, "displayZoomFactor"),
        v6 = v5,
        objc_msgSend(*(id *)(a1 + 40), "quadraWideDisplayZoomFactor"),
        v6 == v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a3);
  }

}

- (void)setHideLabels:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_hideLabels != a3)
  {
    self->_hideLabels = a3;
    if (a3)
      v3 = 0.0;
    else
      v3 = 1.0;
    -[CAMZoomDial _labelContainerView](self, "_labelContainerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", v3);

  }
}

- (void)setHideFocalLengthLabels:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_hideFocalLengthLabels != a3)
  {
    self->_hideFocalLengthLabels = a3;
    if (a3)
      v3 = 0.0;
    else
      v3 = 1.0;
    -[CAMZoomDial _focalLengthLabelContainerView](self, "_focalLengthLabelContainerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", v3);

  }
}

- (NSArray)activeZoomFactorLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[CAMZoomDial hideLabels](self, "hideLabels"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[CAMZoomDial _labels](self, "_labels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CAMZoomDial _labels](self, "_labels", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "alpha");
          if (v12 == 1.0)
            objc_msgSend(v3, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

- (double)_fullRadius
{
  double v3;
  double v4;
  double v5;

  -[CAMZoomDial bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[CAMZoomDial _fullRadiusInset](self, "_fullRadiusInset");
  return v4 - v5;
}

- (CGPoint)dialCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[CAMZoomDial bounds](self, "bounds");
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dotCenterInset
{
  double v2;

  -[CAMZoomDial _fullRadiusInset](self, "_fullRadiusInset");
  return v2 + 32.0;
}

- (double)dialBorderWidth
{
  double result;

  -[CAMZoomDial _borderStrokeWidth](self, "_borderStrokeWidth");
  UICeilToViewScale();
  return result;
}

- (double)_borderStrokeWidth
{
  _BOOL4 v2;
  double result;

  v2 = -[CAMZoomDial _useDots](self, "_useDots");
  result = 0.0;
  if (v2)
    return 0.5;
  return result;
}

- (double)_backgroundAlpha
{
  _BOOL4 v2;
  double result;

  v2 = -[CAMZoomDial _useDots](self, "_useDots");
  result = 0.1;
  if (!v2)
    return 0.5;
  return result;
}

- (double)_labelPaddingForContentSizeCategory
{
  BOOL v3;
  double result;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = -[CAMZoomDial _useDots](self, "_useDots");
  result = 0.0;
  if (!v3)
  {
    -[CAMZoomDial traitCollection](self, "traitCollection", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMZoomButton fontSizeForContentSize:](CAMZoomButton, "fontSizeForContentSize:", v6);
    v8 = v7;
    +[CAMZoomButton fontSizeForContentSize:](CAMZoomButton, "fontSizeForContentSize:", *MEMORY[0x1E0DC4918]);
    v10 = v8 - v9;

    return v10 * 3.0;
  }
  return result;
}

- (double)_tickLabelCenterRadialInset
{
  double result;

  -[CAMZoomDial _labelPaddingForContentSizeCategory](self, "_labelPaddingForContentSizeCategory");
  UICeilToViewScale();
  return result;
}

- (double)_focalLengthInsetPortrait
{
  double result;

  -[CAMZoomDial _tickLabelCenterRadialInset](self, "_tickLabelCenterRadialInset");
  -[CAMZoomDial _labelPaddingForContentSizeCategory](self, "_labelPaddingForContentSizeCategory");
  UICeilToViewScale();
  return result;
}

- (double)_focalLengthInsetLandscape
{
  double result;

  -[CAMZoomDial _focalLengthInsetPortrait](self, "_focalLengthInsetPortrait");
  UICeilToViewScale();
  return result;
}

- (double)_signedAngleDeltaForZoomRange
{
  int v3;
  double result;

  v3 = -[CAMZoomDial _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CAMZoomDial angleDeltaForZoomRange](self, "angleDeltaForZoomRange");
  if (v3)
    return -result;
  return result;
}

- (double)_offsetAngleForZoomPoint:(id)a3
{
  double result;

  objc_msgSend(a3, "displayZoomFactor");
  -[CAMZoomDial offsetAngleForZoomFactor:](self, "offsetAngleForZoomFactor:");
  return result;
}

- (double)offsetAngleForZoomFactor:(double)a3
{
  double result;

  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 1, a3);
  return result;
}

- (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double result;

  v4 = a4;
  v7 = (void *)objc_opt_class();
  -[CAMZoomDial zoomFactor](self, "zoomFactor");
  v9 = v8;
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v11 = v10;
  -[CAMZoomDial maximumZoomFactor](self, "maximumZoomFactor");
  v13 = v12;
  -[CAMZoomDial _signedAngleDeltaForZoomRange](self, "_signedAngleDeltaForZoomRange");
  objc_msgSend(v7, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:currentZoomFactor:min:max:signedAngleDeltaForZoomRange:", v4, a3, v9, v11, v13, v14);
  return result;
}

+ (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4 currentZoomFactor:(double)a5 min:(double)a6 max:(double)a7 signedAngleDeltaForZoomRange:(double)a8
{
  _BOOL4 v12;
  double v14;
  double v15;
  double v16;
  double result;
  double v18;

  v12 = a4;
  objc_msgSend(a1, "_normalizedValueForZoomFactor:min:max:", a3, a6, a7);
  v15 = v14;
  if (v12)
  {
    objc_msgSend(a1, "_normalizedValueForZoomFactor:min:max:", a5, a6, a7);
    v15 = v15 - v16;
  }
  result = v15 * a8;
  if (v15 * a8 >= -3.14159265)
  {
    if (result <= 3.14159265)
      return result;
    v18 = -6.28318531;
  }
  else
  {
    v18 = 6.28318531;
  }
  return result + v18;
}

- (double)zoomFactorForOffsetAngle:(double)a3
{
  double result;
  double v5;
  double v6;

  if (a3 == 0.0)
  {
    -[CAMZoomDial zoomFactor](self, "zoomFactor");
  }
  else
  {
    -[CAMZoomDial zoomFactor](self, "zoomFactor");
    v6 = v5;
    -[CAMZoomDial _signedAngleDeltaForZoomRange](self, "_signedAngleDeltaForZoomRange");
    -[CAMZoomDial normalizedValueForZoomFactor:](self, "normalizedValueForZoomFactor:", v6);
    CEKClamp();
    -[CAMZoomDial zoomFactorForNormalizedValue:](self, "zoomFactorForNormalizedValue:");
  }
  return result;
}

- (double)offsetAngleForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double result;

  y = a3.y;
  x = a3.x;
  -[CAMZoomDial dialCenter](self, "dialCenter");
  result = atan2(y - v6, x - v5) + 1.57079633;
  if (result > 3.14159265)
    return result + -6.28318531;
  return result;
}

- (CGPoint)_pointForOffsetAngle:(double)a3 radialInset:(double)a4 assumeExpanded:(BOOL)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v8 = 0.0;
  if (!a5)
  {
    -[CAMZoomDial _radiusDelta](self, "_radiusDelta");
    v8 = v9;
  }
  -[CAMZoomDial _fullRadius](self, "_fullRadius");
  v11 = v8 + v10 - a4;
  v12 = (void *)objc_opt_class();
  -[CAMZoomDial dialCenter](self, "dialCenter");
  objc_msgSend(v12, "_pointForOffsetAngle:dialCenter:radius:", a3, v13, v14, v11);
  result.y = v16;
  result.x = v15;
  return result;
}

+ (CGPoint)_pointForOffsetAngle:(double)a3 dialCenter:(CGPoint)a4 radius:(double)a5
{
  double y;
  double x;
  __double2 v8;
  double v9;
  double v10;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = __sincos_stret(a3 + -1.57079633);
  v9 = y + a5 * v8.__sinval;
  v10 = x + a5 * v8.__cosval;
  result.y = v9;
  result.x = v10;
  return result;
}

- (CGPoint)_dotCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4 relativeToCurrentZoomFactor:(BOOL)a5
{
  _BOOL8 v5;
  double v7;
  double v8;
  CGPoint result;

  v5 = a4;
  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", a5, a3);
  -[CAMZoomDial _dotCenterForOffsetAngle:assumeExpanded:](self, "_dotCenterForOffsetAngle:assumeExpanded:", v5);
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_dotCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[CAMZoomDial _pointForOffsetAngle:radialInset:assumeExpanded:](self, "_pointForOffsetAngle:radialInset:assumeExpanded:", a4, a3, 32.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_tickEndpointForOffsetAngle:(double)a3 isTop:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = 20.6666667;
  if (a4)
    v4 = 4.0;
  -[CAMZoomDial _pointForOffsetAngle:radialInset:assumeExpanded:](self, "_pointForOffsetAngle:radialInset:assumeExpanded:", 1, a3, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)textCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  CGPoint result;

  v4 = a4;
  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 1, a3);
  -[CAMZoomDial _textCenterForOffsetAngle:assumeExpanded:](self, "_textCenterForOffsetAngle:assumeExpanded:", v4);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_textCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a4;
  v7 = -[CAMZoomDial style](self, "style");
  if (v7 == 1)
  {
    -[CAMZoomDial _tickLabelCenterRadialInset](self, "_tickLabelCenterRadialInset");
    -[CAMZoomDial _pointForOffsetAngle:radialInset:assumeExpanded:](self, "_pointForOffsetAngle:radialInset:assumeExpanded:", v4, a3, v10);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    if (!v7)
      -[CAMZoomDial _dotCenterForOffsetAngle:assumeExpanded:](self, "_dotCenterForOffsetAngle:assumeExpanded:", v4, a3, 0.0);
  }
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMZoomDial bounds](self, "bounds");
  if (v9 != width || v8 != height)
    -[CAMZoomDial _invalidateImagesForViewSize](self, "_invalidateImagesForViewSize");
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomDial;
  -[CAMZoomDial setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMZoomDial frame](self, "frame");
  if (v9 != width || v8 != height)
    -[CAMZoomDial _invalidateImagesForViewSize](self, "_invalidateImagesForViewSize");
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomDial;
  -[CAMZoomDial setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_invalidateImagesForViewSize
{
  -[CAMZoomDial _setBackgroundViewUpdateNeeded:](self, "_setBackgroundViewUpdateNeeded:", 1);
  -[CAMZoomDial _setTicksUpdateNeeded:](self, "_setTicksUpdateNeeded:", -[CAMZoomDial _useTicks](self, "_useTicks"));
  -[CAMZoomDial _setMaskUpdateNeeded:](self, "_setMaskUpdateNeeded:", -[CAMZoomDial _useTicks](self, "_useTicks"));
}

- (void)_setBackgroundViewUpdateNeeded:(BOOL)a3
{
  self->__backgroundViewUpdateNeeded = a3;
  if (a3)
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setTicksUpdateNeeded:(BOOL)a3
{
  self->__ticksUpdateNeeded = a3;
  if (a3)
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setMaskUpdateNeeded:(BOOL)a3
{
  self->__maskUpdateNeeded = a3;
  if (a3)
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMZoomDial;
  -[CAMZoomDial layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMZoomDial _updateBackroundImageViewIfNeeded](self, "_updateBackroundImageViewIfNeeded");
  -[CAMZoomDial _updateContentIfNeeded](self, "_updateContentIfNeeded");
  if (-[CAMZoomDial _useDots](self, "_useDots"))
    -[CAMZoomDial _layoutSubviewsWithDots](self, "_layoutSubviewsWithDots");
  else
    -[CAMZoomDial _layoutSubviewsWithTicks](self, "_layoutSubviewsWithTicks");
}

- (void)_layoutBackgroundAndContainerWithContentInset:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  CGFloat v26;
  double v28;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;

  -[CAMZoomDial _backgroundView](self, "_backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _contentContainerView](self, "_contentContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _labelContainerView](self, "_labelContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _focalLengthLabelContainerView](self, "_focalLengthLabelContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  UIRectGetCenter();
  v17 = v16;
  v19 = v18;
  -[CAMZoomDial _fullRadius](self, "_fullRadius");
  v21 = v20;
  -[CAMZoomDial _radiusDelta](self, "_radiusDelta");
  v23 = v22;
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v28 = v24;
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v34.c = v25;
  *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v33.a = *(_OWORD *)&v34.a;
  *(_OWORD *)&v33.c = v25;
  *(_OWORD *)&v33.tx = *(_OWORD *)&v34.tx;
  if (v21 > 0.0)
  {
    CGAffineTransformMakeScale(&v34, (v21 + v23) / v21, (v21 + v23) / v21);
    CGAffineTransformMakeScale(&v33, (v21 - a3 + v23) / (v21 - a3), (v21 - a3 + v23) / (v21 - a3));
  }
  objc_msgSend(v4, "setCenter:", v17, v19);
  objc_msgSend(v4, "setBounds:", v9, v11, v13, v15);
  v32 = v34;
  objc_msgSend(v4, "setTransform:", &v32);
  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 1, v28);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeRotation(&v32, v26);
  t1 = v32;
  memset(&v31, 0, sizeof(v31));
  t2 = v33;
  CGAffineTransformConcat(&v31, &t1, &t2);
  objc_msgSend(v5, "setCenter:", v17, v19);
  objc_msgSend(v5, "setBounds:", v9, v11, v13, v15);
  t1 = v31;
  objc_msgSend(v5, "setTransform:", &t1);
  objc_msgSend(v6, "setCenter:", v17, v19);
  objc_msgSend(v6, "setBounds:", v9, v11, v13, v15);
  objc_msgSend(v7, "setCenter:", v17, v19);
  objc_msgSend(v7, "setBounds:", v9, v11, v13, v15);

}

- (void)_layoutSubviewsWithDots
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t i;
  void *v37;
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
  CGAffineTransform v51;
  CGAffineTransform v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[CAMZoomDial _activeDots](self, "_activeDots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _inactiveDots](self, "_inactiveDots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v49 = v10;
  v50 = v9;
  UIRectGetCenter();
  v47 = v12;
  v48 = v11;
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v14 = v13;
  -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
  v16 = v15;
  objc_msgSend(v3, "dotSpacingAngle");
  v18 = v17;
  -[CAMZoomDial _layoutBackgroundAndContainerWithContentInset:](self, "_layoutBackgroundAndContainerWithContentInset:", 32.0);
  -[CAMZoomDial _dotCenterForZoomFactor:assumeExpanded:relativeToCurrentZoomFactor:](self, "_dotCenterForZoomFactor:assumeExpanded:relativeToCurrentZoomFactor:", 1, 0, v14);
  v20 = v19;
  v22 = v21;
  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v14);
  v24 = v23;
  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v16);
  v26 = v25;
  if (v25 != v24)
    v26 = v24 + (double)(uint64_t)round((v25 - v24) / v18) * v18;
  memset(&v60, 0, sizeof(v60));
  CGAffineTransformMakeRotation(&v60, v26 + v18 * 2.0);
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeRotation(&v59, v24 + v18 * 2.0);
  objc_msgSend(v3, "setDotCenter:", v20, v22);
  objc_msgSend(v3, "setBounds:", v50, v49, v6, v8);
  objc_msgSend(v3, "setCenter:", v48, v47);
  v58 = v60;
  objc_msgSend(v3, "setTransform:", &v58);
  objc_msgSend(v4, "setDotCenter:", v20, v22);
  objc_msgSend(v4, "setBounds:", v50, v49, v6, v8);
  objc_msgSend(v4, "setCenter:", v48, v47);
  v57 = v59;
  objc_msgSend(v4, "setTransform:", &v57);
  -[CAMZoomDial _labels](self, "_labels");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _labelRotationAngleForOrientation](self, "_labelRotationAngleForOrientation");
  v29 = v28;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v30 = v27;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v54;
    v34 = *MEMORY[0x1E0C9D538];
    v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v54 != v33)
          objc_enumerationMutation(v30);
        v37 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v37, "zoomFactor");
        v39 = v38;
        objc_msgSend(v37, "intrinsicContentSize");
        v41 = v40;
        v43 = v42;
        -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
        v44 = v26;
        if (v39 != v45)
        {
          -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v39);
          v44 = v46;
        }
        memset(&v52, 0, sizeof(v52));
        CGAffineTransformMakeRotation(&v52, v29 + v44);
        -[CAMZoomDial _textCenterForOffsetAngle:assumeExpanded:](self, "_textCenterForOffsetAngle:assumeExpanded:", 1, v44);
        objc_msgSend(v37, "setCenter:");
        objc_msgSend(v37, "setBounds:", v34, v35, v41, v43);
        v51 = v52;
        objc_msgSend(v37, "setTransform:", &v51);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v32);
  }

}

- (void)_layoutSubviewsWithTicks
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
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  double v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  double v51;
  double v52;
  uint64_t v53;
  CGAffineTransform v54;
  CGAffineTransform v55;

  -[CAMZoomDial _ticksView](self, "_ticksView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _contentMaskView](self, "_contentMaskView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  UIRectGetCenter();
  v14 = v13;
  v46 = v13;
  v16 = v15;
  -[CAMZoomDial minimumZoomFactor](self, "minimumZoomFactor");
  v18 = v17;
  -[CAMZoomDial _layoutBackgroundAndContainerWithContentInset:](self, "_layoutBackgroundAndContainerWithContentInset:", 4.0);
  objc_msgSend(v3, "setCenter:", v14, v16);
  objc_msgSend(v3, "setBounds:", v6, v8, v10, v12);
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v4, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "size");
  v23 = v22;
  v25 = v24;

  -[CAMZoomDial _offsetAngleForZoomFactor:relativeToCurrentZoomFactor:](self, "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 1, v18);
  v27 = -v26;
  -[CAMZoomDial _pointForOffsetAngle:radialInset:assumeExpanded:](self, "_pointForOffsetAngle:radialInset:assumeExpanded:", 1, -v26, v25 * 0.5);
  v29 = v28;
  v31 = v30;
  memset(&v55, 0, sizeof(v55));
  CGAffineTransformMakeRotation(&v55, v27);
  objc_msgSend(v4, "setBounds:", v19, v20, v23, v25);
  objc_msgSend(v4, "setCenter:", v29, v31);
  v54 = v55;
  objc_msgSend(v4, "setTransform:", &v54);
  -[CAMZoomDial _pointForOffsetAngle:radialInset:assumeExpanded:](self, "_pointForOffsetAngle:radialInset:assumeExpanded:", 0, 0.0, 4.0);
  v33 = v32;
  v35 = v34 + -2.0;
  -[CAMZoomDial _needleView](self, "_needleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v35, v33, 4.0, 10.0);

  -[CAMZoomDial _labelRotationAngleForOrientation](self, "_labelRotationAngleForOrientation");
  v38 = v37;
  -[CAMZoomDial _labels](self, "_labels");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _focalLengthLabelsPortrait](self, "_focalLengthLabelsPortrait");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial _focalLengthLabelsLandscape](self, "_focalLengthLabelsLandscape");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial zoomFactor](self, "zoomFactor");
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke;
  v47[3] = &unk_1EA32D790;
  v51 = v46;
  v52 = v16;
  v53 = v38;
  v47[4] = self;
  v48 = v40;
  v49 = v41;
  v50 = v42;
  v43 = v42;
  v44 = v41;
  v45 = v40;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v47);

}

void __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
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
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
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
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _QWORD v61[4];
  id v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;

  v5 = a2;
  objc_msgSend(v5, "zoomFactor");
  v7 = v6;
  v57 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v59 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v5, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 0, v7);
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_textCenterForOffsetAngle:assumeExpanded:", 1);
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:", 1, v7);
  objc_msgSend(*(id *)(a1 + 32), "_textCenterForOffsetAngle:assumeExpanded:", 1);
  CEKProgressClamped();
  v19 = v18;
  v20 = v18 * (v18 * v18);
  objc_msgSend(*(id *)(a1 + 32), "minAvailableZoomFactor");
  if (v7 < v21 + -0.01 || (objc_msgSend(*(id *)(a1 + 32), "maxAvailableZoomFactor"), v7 > v22 + 0.01))
    v20 = v20 * 0.2;
  v23 = v13 + *(double *)(a1 + 80);
  memset(&v70, 0, sizeof(v70));
  CGAffineTransformMakeRotation(&v70, v23);
  memset(&v69, 0, sizeof(v69));
  CGAffineTransformMakeScale(&v69, v19, v19);
  t1 = v70;
  memset(&v68, 0, sizeof(v68));
  t2 = v69;
  CGAffineTransformConcat(&v68, &t1, &t2);
  objc_msgSend(v5, "setCenter:", v15, v17);
  objc_msgSend(v5, "setBounds:", v59, v57, v9, v11);
  v65 = v68;
  objc_msgSend(v5, "setTransform:", &v65);
  objc_msgSend(v5, "setAlpha:", v20);
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeRotation(&t1, v13);
  t2 = v70;
  if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(v24, "image");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "size");
    v55 = v30;
    v56 = v29;

    objc_msgSend(v25, "image");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "size");
    v58 = v33;
    v60 = v32;

    objc_msgSend(*(id *)(a1 + 32), "_focalLengthInsetPortrait");
    v35 = v34;
    objc_msgSend(v24, "image");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "size");
    v38 = v35 + v37 * 0.5;

    objc_msgSend(*(id *)(a1 + 32), "_focalLengthInsetLandscape");
    v40 = v39;
    objc_msgSend(v25, "image");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "size");
    v43 = v40 + v42 * 0.5;

    objc_msgSend(*(id *)(a1 + 32), "_pointForOffsetAngle:radialInset:assumeExpanded:", 1, v13, v38);
    v45 = v44;
    v47 = v46;
    objc_msgSend(*(id *)(a1 + 32), "_pointForOffsetAngle:radialInset:assumeExpanded:", 1, v13, v43);
    v49 = v48;
    v51 = v50;
    +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0, v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v52, "isEqualToString:", *(_QWORD *)(a1 + 56)) & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v53);
    objc_msgSend(v24, "setCenter:", v45, v47);
    objc_msgSend(v24, "setBounds:", v26, v27, v56, v55);
    v64 = t1;
    objc_msgSend(v24, "setTransform:", &v64);
    objc_msgSend(v25, "setTintColor:", v53);
    objc_msgSend(v25, "setCenter:", v49, v51);
    objc_msgSend(v25, "setBounds:", v26, v27, v60, v58);
    if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "orientation") - 3) <= 1)
    {
      v54 = (void *)MEMORY[0x1E0DC3F10];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke_2;
      v61[3] = &unk_1EA32AA78;
      v62 = v25;
      v63 = t2;
      objc_msgSend(v54, "performWithoutAnimation:", v61);

    }
  }

}

uint64_t __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke_2(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (void)_updateBackroundImageViewIfNeeded
{
  void *v3;

  if (-[CAMZoomDial _isBackgroundViewUpdateNeeded](self, "_isBackgroundViewUpdateNeeded"))
  {
    -[CAMZoomDial _setBackgroundViewUpdateNeeded:](self, "_setBackgroundViewUpdateNeeded:", 0);
    -[CAMZoomDial _setBackgroundImageJobIdentifier:](self, "_setBackgroundImageJobIdentifier:", -[CAMZoomDial _backgroundImageJobIdentifier](self, "_backgroundImageJobIdentifier") + 1);
    -[CAMZoomDial bounds](self, "bounds");
    -[CAMZoomDial dialCenter](self, "dialCenter");
    -[CAMZoomDial _fullRadius](self, "_fullRadius");
    -[CAMZoomDial _backgroundAlpha](self, "_backgroundAlpha");
    -[CAMZoomDial _borderStrokeWidth](self, "_borderStrokeWidth");
    -[CAMZoomDial _imageGenerationQueue](self, "_imageGenerationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

void __48__CAMZoomDial__updateBackroundImageViewIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "_createBackgroundImageForBounds:dialCenter:radius:backgroundAlpha:borderStrokeWidth:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(_QWORD *)(a1 + 104));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  pl_dispatch_async();

}

void __48__CAMZoomDial__updateBackroundImageViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_backgroundImageJobIdentifier") == *(_QWORD *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v2);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring background image since parameters no longer match", v5, 2u);
    }

  }
}

- (void)_updateTicksImageIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (-[CAMZoomDial _isTicksUpdateNeeded](self, "_isTicksUpdateNeeded"))
  {
    -[CAMZoomDial _setTicksUpdateNeeded:](self, "_setTicksUpdateNeeded:", 0);
    -[CAMZoomDial _setTicksImageJobIdentifier:](self, "_setTicksImageJobIdentifier:", -[CAMZoomDial _ticksImageJobIdentifier](self, "_ticksImageJobIdentifier") + 1);
    -[CAMZoomDial bounds](self, "bounds");
    -[CAMZoomDial dialCenter](self, "dialCenter");
    -[CAMZoomDial _fullRadius](self, "_fullRadius");
    CAMPixelWidthForView(self);
    -[CAMZoomDial zoomFactors](self, "zoomFactors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomDial minAvailableZoomFactor](self, "minAvailableZoomFactor");
    -[CAMZoomDial maxAvailableZoomFactor](self, "maxAvailableZoomFactor");
    -[CAMZoomDial _signedAngleDeltaForZoomRange](self, "_signedAngleDeltaForZoomRange");
    -[CAMZoomDial _imageGenerationQueue](self, "_imageGenerationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    pl_dispatch_async();

  }
}

void __40__CAMZoomDial__updateTicksImageIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "_createTicksImageForBounds:dialCenter:radius:pixelWidth:zoomFactors:minAvailableZoomFactor:maxAvailableZoomFactor:signedAngleDeltaForZoomRange:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  pl_dispatch_async();

}

void __40__CAMZoomDial__updateTicksImageIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_ticksImageJobIdentifier") == *(_QWORD *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_ticksView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v2);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring ticks image since counter does not match", v5, 2u);
    }

  }
}

- (void)_updateMaskImageIfNeeded
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[CAMZoomDial _isMaskUpdateNeeded](self, "_isMaskUpdateNeeded"))
  {
    -[CAMZoomDial _setMaskUpdateNeeded:](self, "_setMaskUpdateNeeded:", 0);
    -[CAMZoomDial _setMaskImageJobIdentifier:](self, "_setMaskImageJobIdentifier:", -[CAMZoomDial _maskImageJobIdentifier](self, "_maskImageJobIdentifier") + 1);
    -[CAMZoomDial bounds](self, "bounds");
    -[CAMZoomDial _tickLabelCenterRadialInset](self, "_tickLabelCenterRadialInset");
    -[CAMZoomDial contentMaskingHeight](self, "contentMaskingHeight");
    if (v3 == 0.0)
      -[CAMZoomDial _fullRadius](self, "_fullRadius");
    v4 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMZoomDialNotchMask"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMZoomDial _imageGenerationQueue](self, "_imageGenerationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    pl_dispatch_async();

  }
}

void __39__CAMZoomDial__updateMaskImageIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "_createMaskImageWithSize:tickLabelCenterRadialInset:notchMaskImage:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  pl_dispatch_async();

}

void __39__CAMZoomDial__updateMaskImageIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_maskImageJobIdentifier") == *(_QWORD *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_contentMaskView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v2);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring mask image since counter does not match", v5, 2u);
    }

  }
}

+ (id)_createBackgroundImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 backgroundAlpha:(double)a6 borderStrokeWidth:(double)a7
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[9];

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat", a3.origin.x, a3.origin.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredRange:", 32766);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v13, width, height);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__CAMZoomDial__createBackgroundImageForBounds_dialCenter_radius_backgroundAlpha_borderStrokeWidth___block_invoke;
  v17[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(double *)&v17[6] = a5;
  *(double *)&v17[7] = a6;
  *(double *)&v17[8] = a7;
  objc_msgSend(v14, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __99__CAMZoomDial__createBackgroundImageForBounds_dialCenter_radius_backgroundAlpha_borderStrokeWidth___block_invoke(double *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", a1[4] - a1[6], a1[5] - a1[6], a1[6] + a1[6], a1[6] + a1[6]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, a1[7]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  objc_msgSend(v4, "fill");
  if (a1[8] > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set");
    objc_msgSend(v4, "setLineWidth:", a1[8]);
    objc_msgSend(v4, "stroke");

  }
}

+ (id)_createTicksImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 pixelWidth:(double)a6 zoomFactors:(id)a7 minAvailableZoomFactor:(double)a8 maxAvailableZoomFactor:(double)a9 signedAngleDeltaForZoomRange:(double)a10
{
  double height;
  double width;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  CGFloat x;
  CGFloat y;
  _QWORD v28[4];
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v14 = a7;
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v14, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v17 == v20)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPreferredRange:", 32766);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v22, width, height);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke;
    v28[3] = &unk_1EA32D828;
    v29 = v14;
    v30 = a1;
    v31 = v17;
    v32 = v20;
    v33 = a8;
    v34 = a9;
    v35 = a6;
    v36 = a10;
    v37 = a5;
    v38 = x;
    v39 = y;
    objc_msgSend(v23, "imageWithActions:", v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

void __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = *(void **)(a1 + 32);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke_2;
  v33[3] = &unk_1EA32BE58;
  v32 = v2;
  v34 = v32;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v33);
  objc_msgSend(v32, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v32, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v5 <= v7)
  {
    v8 = v7 + 1;
    v31 = 0x3FD3333333333333;
    v30 = 0x3FB9999999999999;
    do
    {
      v9 = (double)v5 * 0.1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5, v30, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v32, "containsObject:", v10);

      v12 = 1.0;
      if (__ROR8__(0x1999999999999998 - 0x3333333333333333 * v5, 1) >= 0x1999999999999999uLL && (v11 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "_normalizedValueForZoomFactor:min:max:", (double)v5 * 0.1, *(double *)(a1 + 48), *(double *)(a1 + 56));
        CEKInterpolateClamped();
        v12 = v13;
      }
      if (v9 < *(double *)(a1 + 64) || v9 > *(double *)(a1 + 72))
        v12 = v12 * 0.2;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStroke");

      v15 = 2.0;
      if (v11)
        v15 = 3.0;
      v16 = *(double *)(a1 + 80) * v15;
      objc_msgSend((id)objc_opt_class(), "_offsetAngleForZoomFactor:relativeToCurrentZoomFactor:currentZoomFactor:min:max:signedAngleDeltaForZoomRange:", 0, (double)v5 * 0.1, *(double *)(a1 + 48), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 88));
      v18 = v17;
      v19 = *(double *)(a1 + 96);
      v20 = v19 + -20.6666667;
      objc_msgSend(*(id *)(a1 + 40), "_pointForOffsetAngle:dialCenter:radius:", v18, *(double *)(a1 + 104), *(double *)(a1 + 112), v19 + -4.0);
      v22 = v21;
      v24 = v23;
      objc_msgSend(*(id *)(a1 + 40), "_pointForOffsetAngle:dialCenter:radius:", v18, *(double *)(a1 + 104), *(double *)(a1 + 112), v20);
      v26 = v25;
      v28 = v27;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLineWidth:", v16);
      objc_msgSend(v29, "moveToPoint:", v22, v24);
      objc_msgSend(v29, "addLineToPoint:", v26, v28);
      objc_msgSend(v29, "stroke");

      ++v5;
    }
    while (v8 != v5);
  }

}

void __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "doubleValue");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", llround(v3 / 0.1));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

+ (id)_createMaskImageWithSize:(CGSize)a3 tickLabelCenterRadialInset:(double)a4 notchMaskImage:(id)a5
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;

  height = a3.height;
  width = a3.width;
  v7 = a5;
  v15 = *MEMORY[0x1E0C9D648];
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredRange:", 32766);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v8, width, height);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__CAMZoomDial__createMaskImageWithSize_tickLabelCenterRadialInset_notchMaskImage___block_invoke;
  v13[3] = &unk_1EA32D850;
  v16 = width;
  v17 = height;
  v18 = width;
  v19 = height;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "imageWithActions:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __82__CAMZoomDial__createMaskImageWithSize_tickLabelCenterRadialInset_notchMaskImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  const __CFArray *v9;
  id v10;
  CGColorSpace *ColorSpace;
  CGGradient *v12;
  double v13;
  CGFloat locations[3];
  _QWORD v15[3];
  CGPoint v16;
  CGPoint v17;
  CGPoint v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill");
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  CGContextSetBlendMode(v4, kCGBlendModeCopy);
  v7 = objc_retainAutorelease(v5);
  v15[0] = objc_msgSend(v7, "CGColor");
  v8 = objc_retainAutorelease(v6);
  v15[1] = objc_msgSend(v8, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)locations = xmmword_1DB9A76C0;
  v10 = objc_retainAutorelease(v8);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v10, "CGColor"));
  v12 = CGGradientCreateWithColors(ColorSpace, v9, locations);
  CGContextSaveGState(v4);
  v20.size.height = *(CGFloat *)(a1 + 80);
  v20.size.width = *(double *)(a1 + 72) * 0.5;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextClipToRect(v4, v20);
  v13 = *(double *)(a1 + 80);
  v16.x = 0.0;
  v18.y = 0.0;
  v16.y = v13;
  v18.x = v13 * 0.5;
  CGContextDrawLinearGradient(v4, v12, v16, v18, 0);
  CGContextRestoreGState(v4);
  CGContextSaveGState(v4);
  v21.size.height = *(CGFloat *)(a1 + 80);
  v21.origin.x = *(double *)(a1 + 72) * 0.5;
  v21.origin.y = 0.0;
  v21.size.width = v21.origin.x;
  CGContextClipToRect(v4, v21);
  v17.x = *(CGFloat *)(a1 + 72);
  v19.x = v17.x - v13 * 0.5;
  v19.y = 0.0;
  v17.y = v13;
  CGContextDrawLinearGradient(v4, v12, v17, v19, 0);
  CGContextRestoreGState(v4);
  CGGradientRelease(v12);
  objc_msgSend(*(id *)(a1 + 32), "size");
  UIRectCenteredXInRectScale();
  UIRectIntegralWithScale();
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, 0);

}

- (id)_createDotImage
{
  CGFloat v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGSize v8;

  UICeilToViewScale();
  v2 = v8.width * 0.5;
  v8.height = v8.width;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveToPoint:", v2, v2);
  objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v2, v2, 1.5, 0.0, 6.28318531);
  objc_msgSend(v3, "closePath");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  objc_msgSend(v3, "setLineWidth:", 0.5);
  objc_msgSend(v3, "stroke");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");
  objc_msgSend(v3, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v6;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMZoomDial setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__CAMZoomDial_setOrientation_animated___block_invoke;
    aBlock[3] = &unk_1EA328868;
    aBlock[4] = self;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = v7;
    if (v4)
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __39__CAMZoomDial_setOrientation_animated___block_invoke_2;
      v10[3] = &unk_1EA328F80;
      v10[4] = self;
      v11 = v7;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v10, 0, 0.3, 0.0);

    }
    else
    {
      v7[2](v7);
    }

  }
}

uint64_t __39__CAMZoomDial_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocalLengthLabelAlphas");
}

uint64_t __39__CAMZoomDial_setOrientation_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (double)_labelRotationAngleForOrientation
{
  int64_t v2;
  double result;

  v2 = -[CAMZoomDial orientation](self, "orientation");
  result = 0.0;
  if ((unint64_t)(v2 - 2) <= 2)
    return dbl_1DB9A76D0[v2 - 2];
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomDial traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMZoomDial _setLabelsUpdateNeeded:](self, "_setLabelsUpdateNeeded:", 1);
    -[CAMZoomDial _setDotsUpdateNeeded:](self, "_setDotsUpdateNeeded:", -[CAMZoomDial _useDots](self, "_useDots"));
    if (-[CAMZoomDial _useTicks](self, "_useTicks"))
      -[CAMZoomDial _setMaskUpdateNeeded:](self, "_setMaskUpdateNeeded:", 1);
    -[CAMZoomDial setNeedsLayout](self, "setNeedsLayout");
  }

}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)zoomFactors
{
  return self->_zoomFactors;
}

- (NSArray)zoomPoints
{
  return self->_zoomPoints;
}

- (double)minAvailableZoomFactor
{
  return self->_minAvailableZoomFactor;
}

- (double)maxAvailableZoomFactor
{
  return self->_maxAvailableZoomFactor;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)contentMaskingHeight
{
  return self->_contentMaskingHeight;
}

- (double)contractionDistance
{
  return self->_contractionDistance;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)hideLabels
{
  return self->_hideLabels;
}

- (BOOL)hideFocalLengthLabels
{
  return self->_hideFocalLengthLabels;
}

- (double)angleDeltaForZoomRange
{
  return self->_angleDeltaForZoomRange;
}

- (void)setAngleDeltaForZoomRange:(double)a3
{
  self->_angleDeltaForZoomRange = a3;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (UIView)_contentContainerView
{
  return self->__contentContainerView;
}

- (UIView)_labelContainerView
{
  return self->__labelContainerView;
}

- (UIView)_focalLengthLabelContainerView
{
  return self->__focalLengthLabelContainerView;
}

- (UIImageView)_ticksView
{
  return self->__ticksView;
}

- (UIImageView)_contentMaskView
{
  return self->__contentMaskView;
}

- (UIView)_needleView
{
  return self->__needleView;
}

- (NSArray)_focalLengthLabelsPortrait
{
  return self->__focalLengthLabelsPortrait;
}

- (NSArray)_focalLengthLabelsLandscape
{
  return self->__focalLengthLabelsLandscape;
}

- (NSArray)_labels
{
  return self->__labels;
}

- (CAMZoomDialDotsView)_activeDots
{
  return self->__activeDots;
}

- (CAMZoomDialDotsView)_inactiveDots
{
  return self->__inactiveDots;
}

- (BOOL)_isBackgroundViewUpdateNeeded
{
  return self->__backgroundViewUpdateNeeded;
}

- (BOOL)_isLabelsUpdateNeeded
{
  return self->__labelsUpdateNeeded;
}

- (void)_setLabelsUpdateNeeded:(BOOL)a3
{
  self->__labelsUpdateNeeded = a3;
}

- (BOOL)_isDotsUpdateNeeded
{
  return self->__dotsUpdateNeeded;
}

- (void)_setDotsUpdateNeeded:(BOOL)a3
{
  self->__dotsUpdateNeeded = a3;
}

- (BOOL)_isTicksUpdateNeeded
{
  return self->__ticksUpdateNeeded;
}

- (BOOL)_isMaskUpdateNeeded
{
  return self->__maskUpdateNeeded;
}

- (OS_dispatch_queue)_imageGenerationQueue
{
  return self->__imageGenerationQueue;
}

- (int64_t)_backgroundImageJobIdentifier
{
  return self->__backgroundImageJobIdentifier;
}

- (void)_setBackgroundImageJobIdentifier:(int64_t)a3
{
  self->__backgroundImageJobIdentifier = a3;
}

- (int64_t)_ticksImageJobIdentifier
{
  return self->__ticksImageJobIdentifier;
}

- (void)_setTicksImageJobIdentifier:(int64_t)a3
{
  self->__ticksImageJobIdentifier = a3;
}

- (int64_t)_maskImageJobIdentifier
{
  return self->__maskImageJobIdentifier;
}

- (void)_setMaskImageJobIdentifier:(int64_t)a3
{
  self->__maskImageJobIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->__inactiveDots, 0);
  objc_storeStrong((id *)&self->__activeDots, 0);
  objc_storeStrong((id *)&self->__labels, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelsLandscape, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelsPortrait, 0);
  objc_storeStrong((id *)&self->__needleView, 0);
  objc_storeStrong((id *)&self->__contentMaskView, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelContainerView, 0);
  objc_storeStrong((id *)&self->__labelContainerView, 0);
  objc_storeStrong((id *)&self->__contentContainerView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_zoomPoints, 0);
  objc_storeStrong((id *)&self->_zoomFactors, 0);
}

@end

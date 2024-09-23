@implementation CAMSystemOverlaySlider

- (void)layoutSubviews
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGAffineTransform v10[2];
  CGAffineTransform v11;
  CGAffineTransform v12[2];

  -[CAMSystemOverlaySlider bounds](self, "bounds");
  -[CAMSystemOverlaySlider _currentSlider](self, "_currentSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlaySlider alignment](self, "alignment");
  v4 = -[CAMSystemOverlaySlider alignment](self, "alignment");
  if (v4)
    v5 = 4 * (v4 == 1);
  else
    v5 = 3;
  UIRectInsetEdges();
  memset(v12, 0, sizeof(v12));
  CAMViewGeometryForOrientedFrame(v5, (uint64_t)v12, v6, v7, v8, v9);
  v11 = v12[1];
  CGAffineTransformScale(v10, &v11, -1.0, 1.0);
  v12[1] = v10[0];
  v10[1] = v10[0];
  v10[0] = v12[0];
  CAMViewSetGeometry(v3, (uint64_t)v10);
  UIEdgeInsetsMakeWithEdges();
  -[CAMSystemOverlaySlider setHitTestInsets:](self, "setHitTestInsets:");

}

- (void)configureWithRange:(id)a3 magneticRange:(id)a4 style:(unint64_t)a5
{
  id v9;
  id v10;

  v10 = a3;
  v9 = a4;
  if (*(_OWORD *)&self->_valueRange != __PAIR128__((unint64_t)v9, (unint64_t)v10) || self->_style != a5)
  {
    objc_storeStrong((id *)&self->_valueRange, a3);
    objc_storeStrong((id *)&self->_magneticRange, a4);
    self->_style = a5;
    -[CAMSystemOverlaySlider _updateSelectorConfigurations](self, "_updateSelectorConfigurations");
    -[CAMSystemOverlaySlider _updateInternalSlider](self, "_updateInternalSlider");
    -[CAMSystemOverlaySlider _updateSliderData](self, "_updateSliderData");
  }

}

- (void)setCurrentNumber:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  char v7;
  NSNumber *v8;

  v5 = (NSNumber *)a3;
  v6 = v5;
  if (self->_currentNumber != v5)
  {
    v8 = v5;
    v7 = -[NSNumber isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentNumber, a3);
      -[CAMSystemOverlaySlider _updateSliderData](self, "_updateSliderData");
      v6 = v8;
    }
  }

}

- (void)setFeedbackDisabled:(BOOL)a3
{
  if (self->_feedbackDisabled != a3)
  {
    self->_feedbackDisabled = a3;
    -[CAMSystemOverlaySlider _updateInternalSlider](self, "_updateInternalSlider");
  }
}

- (void)_handleDiscreteSliderValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDiscrete"))
  {
    objc_msgSend(v4, "valueAtIndex:", objc_msgSend(v7, "selectedIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider setCurrentNumber:](self, "setCurrentNumber:", v5);

    -[CAMSystemOverlaySlider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlaySliderDidChangeCurrentValue:", self);

  }
}

- (void)_handleContinuousSliderValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFloatingPoint") && (objc_msgSend(v4, "isDiscrete") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "value");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider setCurrentNumber:](self, "setCurrentNumber:", v6);

    -[CAMSystemOverlaySlider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlaySliderDidChangeCurrentValue:", self);

  }
}

- (void)_updateSliderData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMSystemOverlaySlider _discreteSlider](self, "_discreteSlider");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider _continuousSlider](self, "_continuousSlider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "tickMarksConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tickMarksConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider _currentSlider](self, "_currentSlider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider valueRange](self, "valueRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider currentNumber](self, "currentNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider magneticRange](self, "magneticRange");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[CAMSystemOverlaySlider _effectiveStyle](self, "_effectiveStyle");
    v39 = (void *)v10;
    if (objc_msgSend(v8, "isDiscrete"))
    {
      objc_msgSend(v40, "setIndexCount:", objc_msgSend(v8, "count"));
      v12 = objc_msgSend(v9, "unsignedIntegerValue");
      v38 = v4;
      v13 = v7;
      v14 = v5;
      v15 = v6;
      if (objc_msgSend(v8, "isFloatingPoint"))
      {
        v37 = v8;
        v16 = v8;
        objc_msgSend(v16, "indexesOfValuesInRange:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v9;
        objc_msgSend(v9, "doubleValue");
        v12 = objc_msgSend(v16, "indexOfValueClosestToValue:");

        v8 = v37;
      }
      else
      {
        v18 = v9;
        v17 = 0;
      }
      objc_msgSend(v40, "setSelectedIndex:", v12);
      objc_msgSend(v40, "setMagneticIndexes:", v17);

      v9 = v18;
      v6 = v15;
      v5 = v14;
      v7 = v13;
      v4 = v38;
    }
    else if (objc_msgSend(v8, "isFloatingPoint"))
    {
      v19 = v8;
      objc_msgSend(v4, "tickMarksConfiguration");
      v20 = v8;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMainTickMarkInterval:", 10);

      v8 = v20;
      objc_msgSend(v19, "minimum");
      v23 = v22;
      objc_msgSend(v19, "maximum");
      v25 = v24;
      objc_msgSend(v6, "setMainTickMarkInterval:", 10);
      objc_msgSend(v6, "setMainTickMarkOffset:", (uint64_t)((ceil(v23) - v23) * 10.0));
      objc_msgSend(v4, "setTickMarkCount:", (uint64_t)((v25 - v23) * 10.0 + 1.0));
      objc_msgSend(v4, "setMinimumValue:", v23);
      objc_msgSend(v4, "setMaximumValue:", v25);
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v19, "valueClosestToValue:");
      v27 = v26;

      objc_msgSend(v4, "setValue:", v27);
      objc_msgSend(v4, "setMagneticRange:", v39);
    }
    if (v7 == v4)
      v28 = v6;
    else
      v28 = v5;
    v29 = v28;
    -[CAMSystemOverlaySlider _tickMarkSpacingForStyle:](self, "_tickMarkSpacingForStyle:", v11);
    objc_msgSend(v29, "setTickMarkSpacing:");
    if (v11 < 4)
    {
      objc_msgSend(v29, "setEndTickMarksProminent:", 1);
      if (v7 == v4)
      {
        objc_msgSend(v4, "setLogarithmic:", v11 == 3);
      }
      else if (v7 == v40)
      {
        objc_msgSend(v40, "cellDataConfiguration");
        v30 = v8;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setCellDataProvider:", 0);

        v8 = v30;
        objc_msgSend(v40, "setLevelIndicatorHeight:", 10.0);
        objc_msgSend(v40, "setBiasScrollingToCurrentSelection:", 1);
        objc_msgSend(v5, "setTickMarkWidth:", 2.0);
        objc_msgSend(v5, "setMainTickMarkInterval:", 3);
        objc_msgSend(v5, "setMainTickMarkColor:", 0);
      }
      goto LABEL_23;
    }
    if (v11 == 4)
    {
      objc_msgSend(v40, "cellDataConfiguration");
      v35 = v8;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCellDataProvider:", 0);

      v8 = v35;
      objc_msgSend(v40, "setLevelIndicatorHeight:", 10.0);
      objc_msgSend(v40, "setBiasScrollingToCurrentSelection:", 0);
      objc_msgSend(v40, "setMagneticIndexes:", 0);
      objc_msgSend(v5, "setTickMarkWidth:", 4.0);
      objc_msgSend(v5, "setMainTickMarkInterval:", 1);
      objc_msgSend(v5, "setMainTickMarkColor:", 0);
    }
    else
    {
      if (v11 != 5)
      {
LABEL_23:

        return;
      }
      objc_msgSend(v40, "cellDataConfiguration");
      v32 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setCellDataProvider:", self);

      -[CAMSystemOverlaySlider _longestSelectorConfigurationDimension](self, "_longestSelectorConfigurationDimension");
      objc_msgSend(v40, "setLevelIndicatorHeight:");
      objc_msgSend(v40, "setBiasScrollingToCurrentSelection:", 0);
      objc_msgSend(v40, "setMagneticIndexes:", 0);
      objc_msgSend(v5, "setTickMarkWidth:", 20.0);
      objc_msgSend(v5, "setMainTickMarkInterval:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMainTickMarkColor:", v34);

      v8 = v32;
    }
    objc_msgSend(v5, "setEndTickMarksProminent:", 0);
    goto LABEL_23;
  }
}

- (double)_tickMarkSpacingForStyle:(unint64_t)a3
{
  double v3;
  void *v4;

  v3 = 5.0;
  switch(a3)
  {
    case 0uLL:
      -[CAMSystemOverlaySlider valueRange](self, "valueRange");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isDiscrete"))
        v3 = 8.0;
      else
        v3 = 9.0;

      break;
    case 1uLL:
      return v3;
    case 2uLL:
      v3 = 10.0;
      break;
    case 3uLL:
      v3 = 7.0;
      break;
    case 4uLL:
      v3 = 30.0;
      break;
    case 5uLL:
      v3 = 40.0;
      break;
    default:
      v3 = 0.0;
      break;
  }
  return v3;
}

- (unint64_t)_effectiveStyle
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMSystemOverlaySlider style](self, "style");
  v5 = v4;
  if (v4 - 4 < 2)
  {
    if (objc_msgSend(v3, "isDiscrete"))
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v4 == 3 && ((objc_msgSend(v3, "isDiscrete") & 1) != 0 || (objc_msgSend(v3, "isFloatingPoint") & 1) == 0))
LABEL_7:
    v5 = 0;
LABEL_8:

  return v5;
}

- (void)_updateSelectorConfigurations
{
  id v3;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  if (-[CAMSystemOverlaySlider _effectiveStyle](self, "_effectiveStyle") == 5)
  {
    -[CAMSystemOverlaySlider valueRange](self, "valueRange");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v11, "count"))
    {
      v4 = 0;
      v5 = 0.0;
      do
      {
        objc_msgSend(v11, "valueAtIndex:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMSystemOverlaySlider delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "overlaySlider:cellConfigurationForValue:", self, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v8);
        objc_msgSend(v8, "contentSize");
        v5 = fmax(v5, fmax(v9, v10));

        ++v4;
      }
      while (v4 < objc_msgSend(v11, "count"));
    }
    UICeilToViewScale();
    -[CAMSystemOverlaySlider _setLongestSelectorConfigurationDimension:](self, "_setLongestSelectorConfigurationDimension:");
    -[CAMSystemOverlaySlider _setSelectorConfigurations:](self, "_setSelectorConfigurations:", v3);

  }
  else
  {
    -[CAMSystemOverlaySlider _setSelectorConfigurations:](self, "_setSelectorConfigurations:", 0);
  }
}

- (void)_updateInternalSlider
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[6];

  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[CAMSystemOverlaySlider _currentSlider](self, "_currentSlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlaySlider _discreteSlider](self, "_discreteSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlaySlider _continuousSlider](self, "_continuousSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlaySlider valueRange](self, "valueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDiscrete"))
  {
    if (v5)
    {
      v8 = v5;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D040]), "initWithTickMarkStyle:", 1);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setSliderVerticalAlignment:", 1);
      objc_msgSend(v8, "setGradientInsets:", 13.0, 13.0);
      objc_msgSend(v8, "setSelectionFeedbackProfile:", 2);
      objc_msgSend(v8, "setFeedbackScope:", 1);
      -[CAMSystemOverlaySlider _orientationTransform](self, "_orientationTransform");
      objc_msgSend(v8, "cellDataConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v13[3];
      v13[1] = v13[4];
      v13[2] = v13[5];
      objc_msgSend(v10, "setContentTransform:", v13);

      objc_msgSend(v8, "setTransparentGradients");
      objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleDiscreteSliderValueChanged_, 4096);
      -[CAMSystemOverlaySlider _setDiscreteSlider:](self, "_setDiscreteSlider:", v8);
      v5 = v8;
    }
  }
  else
  {
    if (!objc_msgSend(v7, "isFloatingPoint"))
    {
      v9 = 0;
      if (v4)
        goto LABEL_13;
      goto LABEL_15;
    }
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D090]), "initWithTickMarkStyle:", 1);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setTickMarkSize:", 2.0, 10.0);
      objc_msgSend(v8, "setSliderVerticalAlignment:", 1);
      objc_msgSend(v8, "setGradientInsets:", 13.0, 13.0);
      objc_msgSend(v8, "setSelectionFeedbackProfile:", 2);
      objc_msgSend(v8, "setFeedbackScope:", 1);
      objc_msgSend(v8, "setTransparentGradients");
      objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleContinuousSliderValueChanged_, 4096);
      -[CAMSystemOverlaySlider _setContinuousSlider:](self, "_setContinuousSlider:", v8);
      v6 = v8;
    }
  }
  v9 = v8;
  if (v4)
  {
LABEL_13:
    if (v4 != v9)
      objc_msgSend(v4, "removeFromSuperview");
  }
LABEL_15:
  objc_msgSend(v9, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    -[CAMSystemOverlaySlider insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);
  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHitTestsAsOpaque:", 1);

  if (-[CAMSystemOverlaySlider feedbackDisabled](self, "feedbackDisabled"))
    objc_msgSend(v9, "setFeedbackScope:", 0);
  -[CAMSystemOverlaySlider _setCurrentSlider:](self, "_setCurrentSlider:", v9);

}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4;

  -[CAMSystemOverlaySlider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlaySliderWillBeginScrolling:", self);

}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4;

  -[CAMSystemOverlaySlider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlaySliderDidEndScrolling:", self);

}

- (id)configurationAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CAMSystemOverlaySlider _selectorConfigurations](self, "_selectorConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMSystemOverlaySlider _discreteSlider](self, "_discreteSlider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellDataConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CAMSystemOverlaySlider _orientationTransform](self, "_orientationTransform");
      objc_msgSend(v7, "setContentTransform:animated:", &v8, v4);
    }

  }
}

- (CGAffineTransform)_orientationTransform
{
  int64_t orientation;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  orientation = self->_orientation;
  if (orientation == 2)
  {
    v5 = 3.14159265;
  }
  else if (orientation == 4)
  {
    -[CAMSystemOverlaySlider _selectorConfigurations](self, "_selectorConfigurations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "descender");
    v5 = 1.57079633;
  }
  else
  {
    v5 = 0.0;
    if (orientation == 3)
    {
      -[CAMSystemOverlaySlider _selectorConfigurations](self, "_selectorConfigurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "capHeight");
      objc_msgSend(v8, "ascender");

      v5 = -1.57079633;
    }
  }
  v12 = dbl_1DB9A7320[-[CAMSystemOverlaySlider alignment](self, "alignment") == 0];
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeRotation(&v18, v5 + v12);
  v16 = v18;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformScale(&v17, &v16, -1.0, 1.0);
  memset(&v16, 0, sizeof(v16));
  UIRoundToViewScale();
  v15 = v17;
  CGAffineTransformTranslate(&v16, &v15, 0.0, v13);
  v15 = v16;
  return (CGAffineTransform *)UIIntegralTransform();
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSNumber)currentNumber
{
  return self->_currentNumber;
}

- (CAMOverlayValueRange)valueRange
{
  return self->_valueRange;
}

- (CAMOverlayDiscreteFloatRange)magneticRange
{
  return self->_magneticRange;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)feedbackDisabled
{
  return self->_feedbackDisabled;
}

- (CAMSystemOverlaySliderDelegate)delegate
{
  return (CAMSystemOverlaySliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CEKAbstractSlider)_currentSlider
{
  return self->__currentSlider;
}

- (void)_setCurrentSlider:(id)a3
{
  objc_storeStrong((id *)&self->__currentSlider, a3);
}

- (CEKDiscreteSlider)_discreteSlider
{
  return self->__discreteSlider;
}

- (void)_setDiscreteSlider:(id)a3
{
  objc_storeStrong((id *)&self->__discreteSlider, a3);
}

- (CEKSlider)_continuousSlider
{
  return self->__continuousSlider;
}

- (void)_setContinuousSlider:(id)a3
{
  objc_storeStrong((id *)&self->__continuousSlider, a3);
}

- (NSArray)_selectorConfigurations
{
  return self->__selectorConfigurations;
}

- (void)_setSelectorConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->__selectorConfigurations, a3);
}

- (double)_longestSelectorConfigurationDimension
{
  return self->__longestSelectorConfigurationDimension;
}

- (void)_setLongestSelectorConfigurationDimension:(double)a3
{
  self->__longestSelectorConfigurationDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectorConfigurations, 0);
  objc_storeStrong((id *)&self->__continuousSlider, 0);
  objc_storeStrong((id *)&self->__discreteSlider, 0);
  objc_storeStrong((id *)&self->__currentSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_magneticRange, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_currentNumber, 0);
}

@end

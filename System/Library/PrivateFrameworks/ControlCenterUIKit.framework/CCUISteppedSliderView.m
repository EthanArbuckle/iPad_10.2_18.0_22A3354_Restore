@implementation CCUISteppedSliderView

- (CCUISteppedSliderView)initWithFrame:(CGRect)a3
{
  CCUISteppedSliderView *v3;
  CCUISteppedSliderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *stepViewsContainer;
  void *v11;
  uint64_t v12;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CCUISteppedSliderView;
  v3 = -[CCUIBaseSliderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfSteps = 2;
    v3->_firstStepIsDisabled = 0;
    v3->_firstStepIsOff = 0;
    v3->_valueAdjustedForSteppedSlider = -1.0;
    -[CCUISteppedSliderView _createStepViewsForNumberOfSteps:](v3, "_createStepViewsForNumberOfSteps:", 2);
    -[CCUISteppedSliderView bounds](v4, "bounds");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    stepViewsContainer = v4->_stepViewsContainer;
    v4->_stepViewsContainer = (UIView *)v9;

    -[UIView setUserInteractionEnabled:](v4->_stepViewsContainer, "setUserInteractionEnabled:", 0);
    -[UIView setClipsToBounds:](v4->_stepViewsContainer, "setClipsToBounds:", 1);
    -[CCUIBaseSliderView glyphContainerView](v4, "glyphContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_stepViewsContainer);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleValueTapGestureRecognizer_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v12;

    -[UITapGestureRecognizer setDelegate:](v4->_tapGestureRecognizer, "setDelegate:", v4);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v4->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v4->_tapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[CCUISteppedSliderView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    -[CCUIBaseSliderView setShouldProvideBuiltInFeedback:](v4, "setShouldProvideBuiltInFeedback:", 0);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15 == 1)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v4, sel__handleHoverGestureRecognizer_);
      hoverGestureRecognizer = v4->_hoverGestureRecognizer;
      v4->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v16;

      -[CCUISteppedSliderView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_hoverGestureRecognizer);
    }
  }
  return v4;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  -[CCUISteppedSliderView setValue:isAdjusted:andUpdateStep:animated:](self, "setValue:isAdjusted:andUpdateStep:animated:", 1, 1, a4);
}

- (void)setValue:(float)a3 isAdjusted:(BOOL)a4 andUpdateStep:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v11;
  float v12;
  objc_super v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  -[CCUIBaseSliderView value](self, "value");
  if (*(float *)&v11 != a3)
  {
    v12 = -1.0;
    if (v8)
      v12 = a3;
    self->_valueAdjustedForSteppedSlider = v12;
    if (v7)
    {
      *(float *)&v11 = a3;
      self->_step = -[CCUISteppedSliderView _stepFromValue:](self, "_stepFromValue:", v11);
    }
    v13.receiver = self;
    v13.super_class = (Class)CCUISteppedSliderView;
    *(float *)&v11 = a3;
    -[CCUIBaseSliderView setValue:animated:](&v13, sel_setValue_animated_, v6, v11);
  }
}

- (void)setStep:(unint64_t)a3
{
  if (self->_step != a3 && self->_numberOfSteps >= a3 || self->_valueAdjustedForSteppedSlider != -1.0)
  {
    self->_step = a3;
    -[CCUISteppedSliderView _valueFromStep:](self, "_valueFromStep:");
    -[CCUISteppedSliderView setValue:isAdjusted:andUpdateStep:animated:](self, "setValue:isAdjusted:andUpdateStep:animated:", 0, 0, 0);
    -[CCUISteppedSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfSteps:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  UISelectionFeedbackGenerator *v6;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  id v8;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  if (self->_numberOfSteps != v3)
  {
    self->_numberOfSteps = v3;
    -[CCUISteppedSliderView _createStepViewsForNumberOfSteps:](self, "_createStepViewsForNumberOfSteps:", v3);
    -[CCUISteppedSliderView _createSeparatorViewsForNumberOfSteps:](self, "_createSeparatorViewsForNumberOfSteps:", v3);
    if (!self->_selectionFeedbackGenerator)
    {
      objc_msgSend(MEMORY[0x1E0DC4320], "lightConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("sliderDetent"));
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v6 = (UISelectionFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:view:", v8, self);
      selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
      self->_selectionFeedbackGenerator = v6;

    }
  }
}

- (void)setFirstStepIsDisabled:(BOOL)a3
{
  if (self->_firstStepIsDisabled != a3)
  {
    self->_firstStepIsDisabled = a3;
    -[CCUISteppedSliderView _createStepViewsForNumberOfSteps:](self, "_createStepViewsForNumberOfSteps:", self->_numberOfSteps);
    -[CCUISteppedSliderView _adjustStepIfNecessaryForFirstStepBehaviorChange](self, "_adjustStepIfNecessaryForFirstStepBehaviorChange");
  }
}

- (void)setFirstStepIsOff:(BOOL)a3
{
  if (self->_firstStepIsOff != a3)
  {
    self->_firstStepIsOff = a3;
    -[CCUISteppedSliderView _createStepViewsForNumberOfSteps:](self, "_createStepViewsForNumberOfSteps:", self->_numberOfSteps);
    -[CCUISteppedSliderView _adjustStepIfNecessaryForFirstStepBehaviorChange](self, "_adjustStepIfNecessaryForFirstStepBehaviorChange");
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setContinuousSliderCornerRadius:](&v5, sel_setContinuousSliderCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_stepViewsContainer, "_setContinuousCornerRadius:", a3);
}

- (void)setInoperative:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setInoperative:](&v5, sel_setInoperative_);
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", !v3);
}

- (void)setValueVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setValueVisible:](&v6, sel_setValueVisible_);
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  -[UIView setAlpha:](self->_stepViewsContainer, "setAlpha:", v5);
}

- (void)applyInoperativeAppearance:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView applyInoperativeAppearance:](&v4, sel_applyInoperativeAppearance_, a3);
  -[CCUISteppedSliderView _updateStepViewVisibility](self, "_updateStepViewVisibility");
}

- (void)layoutElasticContentViews
{
  UIView *stepViewsContainer;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView layoutElasticContentViews](&v5, sel_layoutElasticContentViews);
  stepViewsContainer = self->_stepViewsContainer;
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](stepViewsContainer, "setFrame:");

  -[CCUIBaseSliderView value](self, "value");
  -[CCUISteppedSliderView _updateStepFromValue:toggleCurrentStep:andUpdateValue:](self, "_updateStepFromValue:toggleCurrentStep:andUpdateValue:", 0, 0);
  -[CCUISteppedSliderView _layoutStepViews](self, "_layoutStepViews");
  -[CCUISteppedSliderView _updateStepViewVisibility](self, "_updateStepViewVisibility");
}

- (void)_layoutStepViews
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t numberOfSteps;
  unint64_t v12;
  double MaxY;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t step;
  float v37;
  float v38;
  unint64_t v40;
  double v41;
  void *v42;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v3 = -[CCUIBaseSliderView shouldIntegralizeContentLayout](self, "shouldIntegralizeContentLayout");
  v4 = -[CCUIBaseSliderView shouldIntegralizeValueLayout](self, "shouldIntegralizeValueLayout");
  -[CCUISteppedSliderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v45 = v6;

  -[UIView bounds](self->_stepViewsContainer, "bounds");
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  v47 = CGRectGetWidth(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v46 = CGRectGetHeight(v49);
  numberOfSteps = self->_numberOfSteps;
  v12 = numberOfSteps - 1;
  if ((uint64_t)(numberOfSteps - 1) >= 0)
  {
    v44 = v46 / (double)numberOfSteps - 1.0 / v45;
    MaxY = 0.0;
    v14 = 0.0;
    do
    {
      v15 = self->_numberOfSteps;
      if (v12 + 1 != v15)
      {
        if (v3)
        {
          UIRectIntegralWithScale();
          v17 = v16;
          MaxY = v18;
          v20 = v19;
          v22 = v21;
          v15 = self->_numberOfSteps;
        }
        else
        {
          v17 = 0.0;
          v20 = v47;
          v22 = 1.0 / v45;
        }
        if (v12 >= v15 - 1)
        {
          v23 = 0;
        }
        else
        {
          -[NSArray objectAtIndex:](self->_separatorViews, "objectAtIndex:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "setFrame:", v17, MaxY, v20, v22);
        v50.origin.x = v17;
        v50.origin.y = MaxY;
        v50.size.width = v20;
        v50.size.height = v22;
        MaxY = CGRectGetMaxY(v50);

      }
      if (v12)
        v24 = v44 - v14;
      else
        v24 = v46 - MaxY;
      v25 = 0.0;
      if (v3)
      {
        v26 = v47;
        UIRectIntegralWithScale();
        v25 = v27;
        v29 = v28;
        v31 = v30;
        v33 = v32;
      }
      else
      {
        v29 = MaxY;
        v26 = v47;
        v31 = v47;
        v33 = v24;
      }
      v51.origin.x = v25;
      v51.origin.y = v29;
      v51.size.width = v31;
      v51.size.height = v33;
      v34 = CGRectGetHeight(v51);
      v52.origin.x = 0.0;
      v52.origin.y = MaxY;
      v52.size.width = v26;
      v52.size.height = v24;
      v35 = CGRectGetHeight(v52);
      step = self->_step;
      -[CCUIBaseSliderView presentationValue](self, "presentationValue");
      v38 = v37;
      if (self->_valueAdjustedForSteppedSlider == v37 && v12 + 1 == step)
      {
        v40 = -[CCUISteppedSliderView numberOfSteps](self, "numberOfSteps");
        v53.origin.x = v25;
        v53.origin.y = v29;
        v53.size.width = v31;
        v53.size.height = v33;
        v41 = CGRectGetHeight(v53) * (ceil((float)(v38 * (float)v40)) - (float)(v38 * (float)v40));
        if (v4)
          UIRoundToScale();
        v29 = v29 + v41;
        v33 = v33 - v41;
      }
      v14 = v34 - v35;
      -[NSArray objectAtIndex:](self->_stepBackgroundViews, "objectAtIndex:", v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setFrame:", v25, v29, v31, v33);
      v54.origin.x = v25;
      v54.origin.y = v29;
      v54.size.width = v31;
      v54.size.height = v33;
      MaxY = CGRectGetMaxY(v54);

    }
    while ((uint64_t)v12-- > 0);
  }
}

- (id)_additionalTopLevelBlockingGestureRecognizers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_tapGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateStepViewVisibility
{
  _BOOL4 v3;
  unint64_t numberOfSteps;
  unint64_t v5;
  double v6;
  unint64_t v7;
  unint64_t step;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t hoverStep;
  BOOL v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;

  v3 = -[CCUIBaseSliderView hasInoperativeAppearance](self, "hasInoperativeAppearance");
  numberOfSteps = self->_numberOfSteps;
  if (numberOfSteps)
  {
    v5 = 0;
    if (v3)
      v6 = 0.6;
    else
      v6 = 1.0;
    do
    {
      v7 = numberOfSteps - 1;
      step = self->_step;
      -[NSArray objectAtIndexedSubscript:](self->_stepBackgroundViews, "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v7)
      {
        v10 = 0;
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_separatorViews, "objectAtIndexedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = self->_step;
      if (self->_isHoverHighlighting
        && ((hoverStep = self->_hoverStep, v5 > v11 - 1) ? (v13 = hoverStep >= v5) : (v13 = 0),
            v13 ? (v14 = hoverStep > v11 - 1) : (v14 = 0),
            v14))
      {
        v22 = v9;
        v21 = 0.2;
      }
      else
      {
        if (v5 < v11)
        {
          -[CCUISteppedSliderView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[CCUISteppedSliderView firstStepIsOff](self, "firstStepIsOff");
          if (v5)
            v17 = 0;
          else
            v17 = v16;
          if (v17 || v5 == step - 1)
          {
            objc_msgSend(v15, "_visualStylingForStyle:", 5);
            v18 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v15, "_controlCenterKeyLineOnLightVisualStyling");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v18;
          objc_msgSend(v10, "mt_replaceVisualStyling:", v18);
          objc_msgSend(v9, "setAlpha:", v6);

          goto LABEL_28;
        }
        -[CCUISteppedSliderView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_visualStylingForStyle:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mt_replaceVisualStyling:", v20);

        v21 = 0.0;
        v22 = v9;
      }
      objc_msgSend(v22, "setAlpha:", v21);
LABEL_28:

      ++v5;
      numberOfSteps = self->_numberOfSteps;
    }
    while (v5 < numberOfSteps);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CCUISteppedSliderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView contentModuleWillTransitionToExpandedContentMode:](&v6, sel_contentModuleWillTransitionToExpandedContentMode_);
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  if (v3)
    -[UISelectionFeedbackGenerator userInteractionStarted](selectionFeedbackGenerator, "userInteractionStarted");
  else
    -[UISelectionFeedbackGenerator userInteractionEnded](selectionFeedbackGenerator, "userInteractionEnded");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CCUIBaseSliderView _panGestureRecognizer](self, "_panGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)_createStepViewsForNumberOfSteps:(unint64_t)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *stepBackgroundViews;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_stepBackgroundViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "removeFromSuperview", (_QWORD)v14);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (a3)
  {
    v11 = 0;
    do
    {
      -[CCUISteppedSliderView _createBackgroundViewForStep:](self, "_createBackgroundViewForStep:", v11, (_QWORD)v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self->_stepViewsContainer, "addSubview:", v12);
      -[NSArray addObject:](v5, "addObject:", v12);

      ++v11;
    }
    while (a3 != v11);
  }
  stepBackgroundViews = self->_stepBackgroundViews;
  self->_stepBackgroundViews = v5;

  -[CCUISteppedSliderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_createSeparatorViewsForNumberOfSteps:(unint64_t)a3
{
  unint64_t v4;
  NSArray *i;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *separatorViews;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3 - 1);
  for (i = (NSArray *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    -[CCUISteppedSliderView _createSeparatorView](self, "_createSeparatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self->_stepViewsContainer, "addSubview:", v6);
    -[NSArray addObject:](i, "addObject:", v6);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_separatorViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "removeFromSuperview", (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  separatorViews = self->_separatorViews;
  self->_separatorViews = i;

  -[CCUISteppedSliderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createBackgroundViewForStep:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (a3 || !-[CCUISteppedSliderView firstStepIsOff](self, "firstStepIsOff"))
  {
    +[CCUIControlCenterMaterialView _lightFillView](CCUIControlCenterMaterialView, "_lightFillView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CCUIControlCenterMaterialView _tertiaryView](CCUIControlCenterMaterialView, "_tertiaryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (id)_createSeparatorView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  return v2;
}

- (void)_adjustStepIfNecessaryForFirstStepBehaviorChange
{
  unint64_t v3;

  -[CCUIBaseSliderView value](self, "value");
  v3 = -[CCUISteppedSliderView _stepFromValue:](self, "_stepFromValue:");
  if (self->_step != v3)
    -[CCUISteppedSliderView setStep:](self, "setStep:", v3);
}

- (unint64_t)_stepFromValue:(float)a3
{
  return -[CCUISteppedSliderView _stepFromValue:avoidCurrentStep:](self, "_stepFromValue:avoidCurrentStep:", 0);
}

- (unint64_t)_stepFromValue:(float)a3 avoidCurrentStep:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t numberOfSteps;
  unint64_t v9;
  unint64_t result;

  v4 = a4;
  if (-[CCUISteppedSliderView firstStepIsDisabled](self, "firstStepIsDisabled"))
    v7 = 1;
  else
    v7 = -[CCUISteppedSliderView firstStepIsOff](self, "firstStepIsOff");
  numberOfSteps = self->_numberOfSteps;
  v9 = vcvtps_u32_f32((float)numberOfSteps * a3);
  if (v7 > v9)
    v9 = v7;
  if (numberOfSteps >= v9)
    result = v9;
  else
    result = self->_numberOfSteps;
  if (v4 && result == self->_step)
  {
    if (result - 1 <= v7)
      return v7;
    else
      --result;
  }
  return result;
}

- (float)_valueFromStep:(unint64_t)a3
{
  unint64_t numberOfSteps;

  numberOfSteps = self->_numberOfSteps;
  if (numberOfSteps)
    return (float)a3 / (float)numberOfSteps;
  else
    return 0.0;
}

- (float)_valueForTouchLocation:(CGPoint)a3
{
  double y;
  CGFloat Height;
  CGRect v6;

  y = a3.y;
  -[CCUISteppedSliderView bounds](self, "bounds", a3.x);
  Height = CGRectGetHeight(v6);
  return (Height - y) / Height;
}

- (void)_handleValueTapGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    -[CCUISteppedSliderView _valueForTouchLocation:](self, "_valueForTouchLocation:");
    -[CCUISteppedSliderView _updateStepFromValue:toggleCurrentStep:andUpdateValue:](self, "_updateStepFromValue:toggleCurrentStep:andUpdateValue:", 1, 1);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke;
    v8[3] = &unk_1E8E20590;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    -[CCUISteppedSliderView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_2;
    v7[3] = &unk_1E8E20590;
    v7[4] = self;
    +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:actions:](CCUIContentModuleContext, "performWithoutAnimationWhileHiddenInWindow:actions:", v6, v7);

    -[CCUISteppedSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    -[CCUISteppedSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", CCUIBaseSliderViewControlEventPresentationValueChanged);
  }

}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutStepViews");
}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_3;
  v2[3] = &unk_1E8E20590;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.1);
}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStepViewVisibility");
}

- (void)_updateStepFromValue:(float)a3 toggleCurrentStep:(BOOL)a4 andUpdateValue:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t step;
  unint64_t v8;

  v5 = a5;
  step = self->_step;
  v8 = -[CCUISteppedSliderView _stepFromValue:avoidCurrentStep:](self, "_stepFromValue:avoidCurrentStep:", a4);
  self->_step = v8;
  if (v5)
  {
    -[CCUISteppedSliderView _valueFromStep:](self, "_valueFromStep:", v8);
    -[CCUISteppedSliderView setValue:isAdjusted:andUpdateStep:animated:](self, "setValue:isAdjusted:andUpdateStep:animated:", 0, 0, 0);
    v8 = self->_step;
  }
  if (step != v8)
    -[UISelectionFeedbackGenerator selectionChanged](self->_selectionFeedbackGenerator, "selectionChanged");
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  int isHoverHighlighting;
  unint64_t hoverStep;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *stepBackgroundViews;
  int v13;
  _QWORD v14[7];

  isHoverHighlighting = self->_isHoverHighlighting;
  hoverStep = self->_hoverStep;
  v6 = a3;
  v7 = objc_msgSend(v6, "state");
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;

  stepBackgroundViews = self->_stepBackgroundViews;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__CCUISteppedSliderView__handleHoverGestureRecognizer___block_invoke;
  v14[3] = &unk_1E8E20618;
  v14[5] = v9;
  v14[6] = v11;
  v14[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](stepBackgroundViews, "enumerateObjectsUsingBlock:", v14);
  v13 = v7 != 3;
  self->_isHoverHighlighting = v13;
  if (isHoverHighlighting != v13 || hoverStep != self->_hoverStep)
    -[CCUISteppedSliderView setNeedsLayout](self, "setNeedsLayout");
}

uint64_t __55__CCUISteppedSliderView__handleHoverGestureRecognizer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_msgSend(a2, "frame");
  result = UIRectContainsPointInYAxis();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 696) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)numberOfSteps
{
  return self->_numberOfSteps;
}

- (BOOL)firstStepIsDisabled
{
  return self->_firstStepIsDisabled;
}

- (BOOL)firstStepIsOff
{
  return self->_firstStepIsOff;
}

- (unint64_t)step
{
  return self->_step;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepViewsContainer, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_stepBackgroundViews, 0);
}

@end

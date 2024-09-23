@implementation HUQuickControlElasticSliderInteractionCoordinator

- (HUQuickControlElasticSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6;
  HUQuickControlElasticSliderInteractionCoordinator *v7;
  HUQuickControlElasticSliderInteractionCoordinator *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  v7 = -[HUQuickControlInteractionCoordinator initWithControlView:delegate:](&v19, sel_initWithControlView_delegate_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator setModelValue:](v7, "setModelValue:", 0.0, 1.0);
    v9 = objc_alloc_init(MEMORY[0x1E0CEA730]);
    -[HUQuickControlElasticSliderInteractionCoordinator setPanGestureRecognizer:](v8, "setPanGestureRecognizer:", v9);

    -[HUQuickControlElasticSliderInteractionCoordinator panGestureRecognizer](v8, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v8);

    -[HUQuickControlElasticSliderInteractionCoordinator panGestureRecognizer](v8, "panGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumPressDuration:", 0.0);

    -[HUQuickControlElasticSliderInteractionCoordinator panGestureRecognizer](v8, "panGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:", v8, sel__handleControlPanGesture_);

    -[HUQuickControlElasticSliderInteractionCoordinator panGestureRecognizer](v8, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0CEAA88]);
    -[HUQuickControlElasticSliderInteractionCoordinator setTapGestureRecognizer:](v8, "setTapGestureRecognizer:", v14);

    -[HUQuickControlElasticSliderInteractionCoordinator tapGestureRecognizer](v8, "tapGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowableMovement:", 5.0);

    -[HUQuickControlElasticSliderInteractionCoordinator tapGestureRecognizer](v8, "tapGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:", v8, sel__handleControlTapGesture_);

    -[HUQuickControlElasticSliderInteractionCoordinator tapGestureRecognizer](v8, "tapGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v17);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUQuickControlElasticSliderInteractionCoordinator _allAppliers](self, "_allAppliers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_each:", &__block_literal_global_194);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  -[HUQuickControlElasticSliderInteractionCoordinator dealloc](&v4, sel_dealloc);
}

uint64_t __60__HUQuickControlElasticSliderInteractionCoordinator_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (HUQuickControlIncrementalConvertibleProfile)viewProfile
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &unk_1EF312238;
  v5 = v3;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v5, "conformsToProtocol:", v4))
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v11);

LABEL_7:
    v8 = 0;
  }

  return (HUQuickControlIncrementalConvertibleProfile *)v8;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
    -[HUQuickControlElasticSliderInteractionCoordinator _beginReceivingTouchesWithGestureRecognizer:isTouchContinuation:](self, "_beginReceivingTouchesWithGestureRecognizer:isTouchContinuation:", v4, 1);

}

- (void)recordInteractionStart
{
  id v3;

  if (!-[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
  {
    v3 = (id)objc_opt_new();
    -[HUQuickControlElasticSliderInteractionCoordinator setInteractableStartTime:](self, "setInteractableStartTime:", v3);

  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  -[HUQuickControlInteractionCoordinator setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  -[HUQuickControlElasticSliderInteractionCoordinator gestureTransformer](self, "gestureTransformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIgnoreTouches:", !v3);

  if (!v3)
    -[HUQuickControlElasticSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 0);
}

- (id)value
{
  HUElasticSliderValueNormalizationOptions *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  -[HUElasticSliderValueNormalizationOptions setBoundingStrategy:](v3, "setBoundingStrategy:", 1);
  -[HUElasticSliderValueNormalizationOptions setApplyStepValue:](v3, "setApplyStepValue:", 1);
  -[HUQuickControlElasticSliderInteractionCoordinator _valueNormalizerWithOptions:](self, "_valueNormalizerWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  objc_msgSend(v4, "normalizeRange:");
  v6 = v5;
  v8 = v7;
  if (-[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
    objc_msgSend(MEMORY[0x1E0D315F0], "rangeWithFloatRange:", v6, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v4 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    -[HUQuickControlElasticSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", objc_msgSend(v6, "type") == 1);
    if (-[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
    {
      objc_msgSend(v6, "floatRangeValue");
      v8 = v7;
      v10 = v9;
    }
    else
    {
      objc_msgSend(v6, "midValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v10 = v13;
      v8 = 0.0;

    }
  }
  else
  {
    -[HUQuickControlElasticSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", 0);
    objc_msgSend(v14, "doubleValue");
    v10 = v11;
    v8 = 0.0;
  }
  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 0, v8, v10);
  -[HUQuickControlElasticSliderInteractionCoordinator _setupAllValueAppliersIfNecessary](self, "_setupAllValueAppliersIfNecessary");

}

- (void)setHasSecondaryValue:(BOOL)a3
{
  void *v4;

  self->_hasSecondaryValue = a3;
  if (!a3)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[HUQuickControlElasticSliderInteractionCoordinator setSecondaryValueSmoothingApplier:](self, "setSecondaryValueSmoothingApplier:", 0);
  }
}

- (void)setUserInteractionActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_userInteractionActive != a3)
  {
    v3 = a3;
    self->_userInteractionActive = a3;
    -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionCoordinator:interactionStateDidChange:", self, v3);

  }
}

- (void)setViewVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[HUQuickControlInteractionCoordinator viewVisible](self, "viewVisible") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
    -[HUQuickControlInteractionCoordinator setViewVisible:](&v6, sel_setViewVisible_, v3);
    if (!v3)
    {
      -[HUQuickControlElasticSliderInteractionCoordinator _allAppliers](self, "_allAppliers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "na_each:", &__block_literal_global_66_1);

    }
  }
}

uint64_t __68__HUQuickControlElasticSliderInteractionCoordinator_setViewVisible___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)setActiveGestureValue:(double)a3
{
  void *v4;
  id v5;

  if (self->_activeGestureValue != a3)
  {
    self->_activeGestureValue = a3;
    -[HUQuickControlElasticSliderInteractionCoordinator primaryValueSmoothingApplier](self, "primaryValueSmoothingApplier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlElasticSliderInteractionCoordinator _updatePropertiesForControlValueSmoothingApplier:ofType:](self, "_updatePropertiesForControlValueSmoothingApplier:ofType:", v4, 2);

    -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlElasticSliderInteractionCoordinator _updatePropertiesForControlValueSmoothingApplier:ofType:](self, "_updatePropertiesForControlValueSmoothingApplier:ofType:", v5, 1);

  }
}

- (void)_updateControlViewValueOfType:(unint64_t)a3 withValue:(double)a4
{
  void *v5;
  id v7;

  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSecondaryValue:", v7);
    }
    else
    {
      if (a3 != 2)
        return;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:", v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlElasticSliderInteractionCoordinator.m"), 212, CFSTR("Invalid control view value type!"));
  }

}

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  double var1;
  double var0;
  void *v10;
  void *v11;
  void *v12;
  HUElasticSliderValueNormalizationOptions *v13;

  v5 = a5;
  v6 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v13 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  -[HUElasticSliderValueNormalizationOptions setBoundingStrategy:](v13, "setBoundingStrategy:", 1);
  -[HUElasticSliderValueNormalizationOptions setApplyStepValue:](v13, "setApplyStepValue:", v6);
  -[HUQuickControlElasticSliderInteractionCoordinator _valueNormalizerWithOptions:](self, "_valueNormalizerWithOptions:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "normalizeRange:", var0, var1);
  -[HUQuickControlElasticSliderInteractionCoordinator setModelValue:](self, "setModelValue:");
  if (v5)
  {
    -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlElasticSliderInteractionCoordinator value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactionCoordinator:viewValueDidChange:", self, v12);

  }
}

- (void)_handleControlPanGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDate *interactableStartTime;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EF285200) & 1) != 0)
  {
    -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "reachabilityState"))
      {

LABEL_13:
        -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HUQuickControlReachabilityString(objc_msgSend(v14, "reachabilityState"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412802;
          v19 = v17;
          v20 = 2112;
          v21 = v15;
          v22 = 2080;
          v23 = "-[HUQuickControlElasticSliderInteractionCoordinator _handleControlPanGesture:]";
          _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring pan gesture in %s.", (uint8_t *)&v18, 0x20u);

        }
        goto LABEL_16;
      }
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "reachabilityState");

      if (v10 == 1)
        goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(v4, "state") == 1)
  {
    interactableStartTime = self->_interactableStartTime;
    if (interactableStartTime)
    {
      -[NSDate timeIntervalSinceNow](interactableStartTime, "timeIntervalSinceNow");
      v13 = fabs(v12) < 0.05;
    }
    else
    {
      v13 = 0;
    }
    -[HUQuickControlElasticSliderInteractionCoordinator _beginReceivingTouchesWithGestureRecognizer:isTouchContinuation:](self, "_beginReceivingTouchesWithGestureRecognizer:isTouchContinuation:", v4, v13);
  }
LABEL_16:

}

- (void)_handleControlTapGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EF285200) & 1) != 0)
  {
    -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "reachabilityState"))
      {

LABEL_16:
        -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HUQuickControlReachabilityString(objc_msgSend(v21, "reachabilityState"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412802;
          v26 = v24;
          v27 = 2112;
          v28 = v22;
          v29 = 2080;
          v30 = "-[HUQuickControlElasticSliderInteractionCoordinator _handleControlTapGesture:]";
          _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s.", (uint8_t *)&v25, 0x20u);

        }
        goto LABEL_19;
      }
      -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "reachabilityState");

      if (v10 == 1)
        goto LABEL_16;
    }
  }
  else
  {

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 1);
    objc_msgSend(v4, "hu_locationInGlobalCoordinateSpace");
    v12 = v11;
    v14 = v13;
    v15 = -[HUQuickControlElasticSliderInteractionCoordinator _findClosestValueFromTouchLocation:](self, "_findClosestValueFromTouchLocation:");
    -[HUQuickControlElasticSliderInteractionCoordinator _sliderValueForLocation:](self, "_sliderValueForLocation:", v12, v14);
    v17 = v16;
    -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
    if (v15 == 1)
      v20 = v17;
    else
      v20 = v18;
    if (v15 == 2)
      v19 = v17;
    else
      v18 = v20;
    -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 1, v18, v19, v20);
    -[HUQuickControlElasticSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 0);
  }
LABEL_19:

}

- (void)_beginReceivingTouchesWithGestureRecognizer:(id)a3 isTouchContinuation:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  HUQuickControlSliderGestureTransformer *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a4;
  v29 = a3;
  -[HUQuickControlElasticSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 1);
  -[HUQuickControlElasticSliderInteractionCoordinator setFirstTouchDown:](self, "setFirstTouchDown:", v4);
  objc_msgSend(v29, "hu_locationInGlobalCoordinateSpace");
  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValueType:](self, "setActiveGestureValueType:", -[HUQuickControlElasticSliderInteractionCoordinator _findClosestValueFromTouchLocation:](self, "_findClosestValueFromTouchLocation:"));
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  v7 = v6;
  v9 = v8;
  v10 = -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValueType](self, "activeGestureValueType");
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("HUQuickControlRangeValueUtilities.h"), 31, CFSTR("Invalid range value type"));

      v9 = 1.79769313e308;
    }
  }
  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValue:](self, "setActiveGestureValue:", v9);
  v13 = (void *)objc_opt_new();
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setControlFrame:", HUConvertRectToGlobalCoordinateSpace(v23, v16, v18, v20, v22));

  -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValue](self, "activeGestureValue");
  objc_msgSend(v13, "setInitialSliderValue:");
  -[HUQuickControlElasticSliderInteractionCoordinator viewProfile](self, "viewProfile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "gestureDragCoefficient");
  objc_msgSend(v13, "setVerticalDragCoefficient:");

  objc_msgSend(v13, "setRequiresSomeMovementBeforeActivation:", v4);
  v25 = -[HUQuickControlSliderGestureTransformer initWithGestureRecognizer:context:]([HUQuickControlSliderGestureTransformer alloc], "initWithGestureRecognizer:context:", v29, v13);
  -[HUQuickControlElasticSliderInteractionCoordinator setGestureTransformer:](self, "setGestureTransformer:", v25);

  v26 = -[HUQuickControlInteractionCoordinator isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1;
  -[HUQuickControlElasticSliderInteractionCoordinator gestureTransformer](self, "gestureTransformer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIgnoreTouches:", v26);

  -[HUQuickControlElasticSliderInteractionCoordinator gestureTransformer](self, "gestureTransformer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  -[HUQuickControlElasticSliderInteractionCoordinator _setupAllValueAppliersIfNecessary](self, "_setupAllValueAppliersIfNecessary");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_rawViewValueRange
{
  HUElasticSliderValueNormalizationOptions *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  -[HUElasticSliderValueNormalizationOptions setApplyMinimumVisualRangeSpan:](v3, "setApplyMinimumVisualRangeSpan:", 1);
  -[HUQuickControlElasticSliderInteractionCoordinator _valueNormalizerWithOptions:](self, "_valueNormalizerWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  objc_msgSend(v4, "normalizeRange:");
  v6 = v5;
  v8 = v7;

  v9 = -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValueType](self, "activeGestureValueType");
  -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValue](self, "activeGestureValue");
  if (v9 == 1)
    v11 = v10;
  else
    v11 = v6;
  if (v9 == 2)
    v8 = v10;
  else
    v6 = v11;

  v12 = v6;
  v13 = v8;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)_sliderValueForLocation:(CGPoint)a3
{
  double y;
  void *v5;
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
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Height;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HUConvertRectToGlobalCoordinateSpace(v14, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  Height = CGRectGetHeight(v24);
  v25.origin.x = v15;
  v25.origin.y = v17;
  v25.size.width = v19;
  v25.size.height = v21;
  return (CGRectGetMaxY(v25) - y) / Height;
}

- (unint64_t)_findClosestValueFromTouchLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;

  y = a3.y;
  x = a3.x;
  if (!-[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
    return 2;
  -[HUQuickControlElasticSliderInteractionCoordinator _sliderValueForLocation:](self, "_sliderValueForLocation:", x, y);
  v7 = v6;
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  v9 = vabdd_f64(v7, v8);
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  if (v9 < vabdd_f64(v7, v10))
    return 1;
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  if (v7 < v12)
    return 1;
  else
    return 2;
}

- (double)_rubberBandedStretchProgress
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  -[HUQuickControlElasticSliderInteractionCoordinator primaryValueSmoothingApplier](self, "primaryValueSmoothingApplier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v5 = v4;

  -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  v8 = 0.0;
  if (v6)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "progress");
    v8 = v10;

  }
  v11 = -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValueType](self, "activeGestureValueType");
  v12 = -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValueType](self, "activeGestureValueType");
  switch(v12)
  {
    case 2uLL:
      v7 = v5;
      break;
    case 1uLL:
      v7 = v8;
      break;
    case 0uLL:
      v13 = fabs(v5 + -0.5);
      v14 = fabs(v8 + -0.5);
      if (v13 <= v14)
        v7 = v8;
      else
        v7 = v5;
      if (v13 <= v14)
        v11 = 1;
      else
        v11 = 2;
      break;
  }
  -[HUQuickControlElasticSliderInteractionCoordinator _rubberBandingValueNormalizer](self, "_rubberBandingValueNormalizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "normalizeValue:ofType:", v11, v7);
  v17 = v16;

  return v17;
}

- (id)_rubberBandingValueNormalizer
{
  HUElasticSliderValueNormalizationOptions *v3;
  void *v4;

  v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  -[HUElasticSliderValueNormalizationOptions setBoundingStrategy:](v3, "setBoundingStrategy:", 2);
  -[HUElasticSliderValueNormalizationOptions setApplyMinimumVisualRangeSpan:](v3, "setApplyMinimumVisualRangeSpan:", 1);
  -[HUQuickControlElasticSliderInteractionCoordinator _valueNormalizerWithOptions:](self, "_valueNormalizerWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_valueNormalizerWithOptions:(id)a3
{
  id v4;
  HUElasticSliderValueNormalizer *v5;
  double v6;
  double v7;
  HUElasticSliderValueNormalizer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [HUElasticSliderValueNormalizer alloc];
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  v8 = -[HUElasticSliderValueNormalizer initWithCurrentValueRange:hasSecondaryValue:](v5, "initWithCurrentValueRange:hasSecondaryValue:", -[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"), v6, v7);
  -[HUQuickControlElasticSliderInteractionCoordinator viewProfile](self, "viewProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryValueConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUElasticSliderValueNormalizer setMaxValueConstraints:](v8, "setMaxValueConstraints:", v10);

  -[HUQuickControlElasticSliderInteractionCoordinator viewProfile](self, "viewProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondaryValueConstraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUElasticSliderValueNormalizer setMinValueConstraints:](v8, "setMinValueConstraints:", v12);

  -[HUElasticSliderValueNormalizer setOptions:](v8, "setOptions:", v4);
  return v8;
}

- (id)_allAppliers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[HUQuickControlElasticSliderInteractionCoordinator primaryValueSmoothingApplier](self, "primaryValueSmoothingApplier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  -[HUQuickControlElasticSliderInteractionCoordinator controlVerticalStretchingApplier](self, "controlVerticalStretchingApplier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return v3;
}

- (void)_setupAllValueAppliersIfNecessary
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;

  -[HUQuickControlElasticSliderInteractionCoordinator primaryValueSmoothingApplier](self, "primaryValueSmoothingApplier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v3);

  if (v4)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator _setupValueApplierForValueType:](self, "_setupValueApplierForValueType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlElasticSliderInteractionCoordinator setPrimaryValueSmoothingApplier:](self, "setPrimaryValueSmoothingApplier:", v5);

  }
  -[HUQuickControlElasticSliderInteractionCoordinator secondaryValueSmoothingApplier](self, "secondaryValueSmoothingApplier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (__86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v6))
  {
    v7 = -[HUQuickControlElasticSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue");

    if (!v7)
      goto LABEL_7;
    -[HUQuickControlElasticSliderInteractionCoordinator _setupValueApplierForValueType:](self, "_setupValueApplierForValueType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlElasticSliderInteractionCoordinator setSecondaryValueSmoothingApplier:](self, "setSecondaryValueSmoothingApplier:", v6);
  }

LABEL_7:
  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v8);

  if (v9)
    -[HUQuickControlElasticSliderInteractionCoordinator _setupStretchingAppliers](self, "_setupStretchingAppliers");
}

BOOL __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "state"))
      v3 = objc_msgSend(v2, "state") != 1;
    else
      v3 = 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (id)_setupValueApplierForValueType:(unint64_t)a3
{
  uint64_t v5;
  HUElasticApplier *v6;
  HUElasticApplier *v7;
  _QWORD v9[4];
  id v10[2];
  _QWORD v11[4];
  id v12[2];
  id location;
  _QWORD v14[6];

  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke;
  v14[3] = &unk_1E6F4CE48;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v14);
  objc_initWeak(&location, self);
  v6 = [HUElasticApplier alloc];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_2;
  v11[3] = &unk_1E6F5A430;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v7 = -[HUElasticApplier initWithProgressInputBlock:](v6, "initWithProgressInputBlock:", v11);
  -[HUQuickControlElasticSliderInteractionCoordinator _updatePropertiesForControlValueSmoothingApplier:ofType:](self, "_updatePropertiesForControlValueSmoothingApplier:ofType:", v7, a3);
  -[HUElasticApplier setProgressBeginsFromInitialInputProgress:](v7, "setProgressBeginsFromInitialInputProgress:", 1);
  -[HUElasticApplier setCompletesWhenAtRest:](v7, "setCompletesWhenAtRest:", 0);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_3;
  v9[3] = &unk_1E6F5A458;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  -[HUApplier addApplierBlock:](v7, "addApplierBlock:", v9);
  -[HUElasticApplier start](v7, "start");
  objc_destroyWeak(v10);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v7;
}

uint64_t __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_rawViewValueRange");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 2)
  {
    v2 = v3;
  }
  else if (v4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HUQuickControlRangeValueUtilities.h"), 31, CFSTR("Invalid range value type"));

    v4 = *(_QWORD *)(a1 + 40);
    v2 = 1.79769313e308;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateControlViewValueOfType:withValue:", v4, v2);
}

double __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rawViewValueRange");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 2)
  {
    v6 = v4;
  }
  else if (v5 == 1)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HUQuickControlRangeValueUtilities.h"), 31, CFSTR("Invalid range value type"));

    v6 = 1.79769313e308;
  }

  return v6;
}

void __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_3(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rubberBandingValueNormalizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizeValue:ofType:", *(_QWORD *)(a1 + 40), a2);
  v6 = v5;

  objc_msgSend(WeakRetained, "_updateControlViewValueOfType:withValue:", *(_QWORD *)(a1 + 40), v6);
}

- (void)_setupStretchingAppliers
{
  HUElasticApplier *v3;
  uint64_t v4;
  HUElasticApplier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HUDisplayLinkApplier *v12;
  HUDisplayLinkApplier *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  objc_initWeak(&location, self);
  v3 = [HUElasticApplier alloc];
  v4 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke;
  v23[3] = &unk_1E6F5A480;
  objc_copyWeak(&v24, &location);
  v5 = -[HUElasticApplier initWithProgressInputBlock:](v3, "initWithProgressInputBlock:", v23);
  -[HUQuickControlElasticSliderInteractionCoordinator setControlHorizontalCompressionApplier:](self, "setControlHorizontalCompressionApplier:", v5);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProgressBeginsFromInitialInputProgress:", 1);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTension:", 300.0);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFriction:", 100.0);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletesWhenAtRest:", 0);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_2;
  v21[3] = &unk_1E6F4CB28;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v10, "addApplierBlock:", v21);

  -[HUQuickControlElasticSliderInteractionCoordinator controlHorizontalCompressionApplier](self, "controlHorizontalCompressionApplier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

  v12 = [HUDisplayLinkApplier alloc];
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_3;
  v19[3] = &unk_1E6F5A4A8;
  objc_copyWeak(&v20, &location);
  v13 = -[HUDisplayLinkApplier initWithProgressInputBlock:](v12, "initWithProgressInputBlock:", v19);
  -[HUQuickControlElasticSliderInteractionCoordinator setControlVerticalStretchingApplier:](self, "setControlVerticalStretchingApplier:", v13);

  -[HUQuickControlElasticSliderInteractionCoordinator controlVerticalStretchingApplier](self, "controlVerticalStretchingApplier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompletesWhenAtRest:", 0);

  -[HUQuickControlElasticSliderInteractionCoordinator controlVerticalStretchingApplier](self, "controlVerticalStretchingApplier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_4;
  v17[3] = &unk_1E6F4CB28;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v15, "addApplierBlock:", v17);

  -[HUQuickControlElasticSliderInteractionCoordinator controlVerticalStretchingApplier](self, "controlVerticalStretchingApplier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

double __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rubberBandedStretchProgress");
  v3 = v2;

  return v3;
}

void __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_2(uint64_t a1, double a2)
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  v4 = fabs(a2);
  if (a2 >= 0.0)
    v4 = 0.0;
  if (a2 > 1.0)
    v5 = a2 + -1.0;
  else
    v5 = v4;
  v6 = v5 / 0.16 * 0.08 + 0.0;
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactionCoordinator:updateControlHorizontalCompressionFactor:", v8, v6);

}

double __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rubberBandedStretchProgress");
  v3 = v2;

  return v3;
}

void __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_4(uint64_t a1, double a2)
{
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  v4 = 0.0;
  if (a2 < 0.0)
    v4 = a2;
  if (a2 > 1.0)
    v5 = a2 + -1.0;
  else
    v5 = v4;
  objc_msgSend(WeakRetained, "delegate", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCoordinator:updateControlVerticalStretchFactor:", v7, v5);

}

- (void)_updatePropertiesForControlValueSmoothingApplier:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  int v13;
  double v14;
  double v15;
  HUElasticSliderValueNormalizationOptions *v16;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "progress");
    v8 = v7;
    v16 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
    -[HUElasticSliderValueNormalizationOptions setApplyMinimumVisualRangeSpan:](v16, "setApplyMinimumVisualRangeSpan:", 1);
    -[HUQuickControlElasticSliderInteractionCoordinator _valueNormalizerWithOptions:](self, "_valueNormalizerWithOptions:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizeValue:ofType:", a4, v8);
    v11 = v10;

    v12 = -[HUQuickControlElasticSliderInteractionCoordinator isUserInteractionActive](self, "isUserInteractionActive");
    v13 = vabdd_f64(v11, v8) >= 0.00000011920929 || v12;
    v14 = 40.0;
    if (v13)
    {
      v15 = 700.0;
    }
    else
    {
      v14 = 20.0;
      v15 = 180.0;
    }
    objc_msgSend(v6, "setFriction:", v14);
    objc_msgSend(v6, "setTension:", v15);

  }
}

- (void)gestureTransformer:(id)a3 sliderValueDidChange:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;

  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValue:](self, "setActiveGestureValue:", a3);
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  v7 = v6;
  v9 = v8;
  v10 = -[HUQuickControlElasticSliderInteractionCoordinator activeGestureValueType](self, "activeGestureValueType");
  if (v10 == 1)
    v11 = a4;
  else
    v11 = v7;
  if (v10 == 2)
  {
    v11 = v7;
    v12 = a4;
  }
  else
  {
    v12 = v9;
  }
  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 0, 1, v11, v12);
}

- (void)gestureDidEndForGestureTransformer:(id)a3
{
  id v4;
  int v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  -[HUQuickControlElasticSliderInteractionCoordinator modelValue](self, "modelValue");
  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 1);
  -[HUQuickControlElasticSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 0);
  -[HUQuickControlElasticSliderInteractionCoordinator setGestureTransformer:](self, "setGestureTransformer:", 0);
  v5 = objc_msgSend(v4, "hasRecognizedSignificantSliderValueChange");

  if (v5)
  {
    -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "hasModelValueChangedForInteractionCoordinator:", self))
    {
LABEL_5:

      goto LABEL_6;
    }
    v7 = -[HUQuickControlElasticSliderInteractionCoordinator isFirstTouchDown](self, "isFirstTouchDown");

    if (v7)
    {
      -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "interactionCoordinatorWantsDismissal:", self);
      goto LABEL_5;
    }
  }
LABEL_6:
  -[HUQuickControlElasticSliderInteractionCoordinator setFirstTouchDown:](self, "setFirstTouchDown:", 0);
  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValueType:](self, "setActiveGestureValueType:", 0);
  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValue:](self, "setActiveGestureValue:", 0.0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HUQuickControlElasticSliderInteractionCoordinator panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator tapGestureRecognizer](self, "tapGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10 == v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (HUQuickControlSliderGestureTransformer)gestureTransformer
{
  return self->_gestureTransformer;
}

- (void)setGestureTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureTransformer, a3);
}

- (UILongPressGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (HUElasticApplier)primaryValueSmoothingApplier
{
  return self->_primaryValueSmoothingApplier;
}

- (void)setPrimaryValueSmoothingApplier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryValueSmoothingApplier, a3);
}

- (HUElasticApplier)secondaryValueSmoothingApplier
{
  return self->_secondaryValueSmoothingApplier;
}

- (void)setSecondaryValueSmoothingApplier:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryValueSmoothingApplier, a3);
}

- (HUDisplayLinkApplier)controlVerticalStretchingApplier
{
  return self->_controlVerticalStretchingApplier;
}

- (void)setControlVerticalStretchingApplier:(id)a3
{
  objc_storeStrong((id *)&self->_controlVerticalStretchingApplier, a3);
}

- (HUElasticApplier)controlHorizontalCompressionApplier
{
  return self->_controlHorizontalCompressionApplier;
}

- (void)setControlHorizontalCompressionApplier:(id)a3
{
  objc_storeStrong((id *)&self->_controlHorizontalCompressionApplier, a3);
}

- (double)activeGestureValue
{
  return self->_activeGestureValue;
}

- (unint64_t)activeGestureValueType
{
  return self->_activeGestureValueType;
}

- (void)setActiveGestureValueType:(unint64_t)a3
{
  self->_activeGestureValueType = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelValue
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_modelValue.minimum;
  maximum = self->_modelValue.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setModelValue:(id)a3
{
  self->_modelValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isFirstTouchDown
{
  return self->_firstTouchDown;
}

- (void)setFirstTouchDown:(BOOL)a3
{
  self->_firstTouchDown = a3;
}

- (NSDate)interactableStartTime
{
  return self->_interactableStartTime;
}

- (void)setInteractableStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_interactableStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactableStartTime, 0);
  objc_storeStrong((id *)&self->_controlHorizontalCompressionApplier, 0);
  objc_storeStrong((id *)&self->_controlVerticalStretchingApplier, 0);
  objc_storeStrong((id *)&self->_secondaryValueSmoothingApplier, 0);
  objc_storeStrong((id *)&self->_primaryValueSmoothingApplier, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureTransformer, 0);
}

@end

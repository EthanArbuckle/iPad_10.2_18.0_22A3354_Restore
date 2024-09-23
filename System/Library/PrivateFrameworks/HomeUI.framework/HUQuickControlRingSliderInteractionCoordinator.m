@implementation HUQuickControlRingSliderInteractionCoordinator

- (HUQuickControlRingSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6;
  char *v7;
  HUQuickControlRingSliderInteractionCoordinator *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlRingSliderInteractionCoordinator;
  v7 = -[HUQuickControlInteractionCoordinator initWithControlView:delegate:](&v13, sel_initWithControlView_delegate_, v6, a4);
  v8 = (HUQuickControlRingSliderInteractionCoordinator *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 40) = HUFloatRangeNormal_0;
    objc_msgSend(v6, "setInteractionDelegate:", v7);
    objc_opt_class();
    -[HUQuickControlRingSliderInteractionCoordinator viewProfile](v8, "viewProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
      v8->_hasSecondaryValue = objc_msgSend(v11, "hasSecondaryValue");
    else
      v8->_hasSecondaryValue = 0;

  }
  return v8;
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
  if (!-[HUQuickControlRingSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue", a3))
  {
    -[HUQuickControlRingSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 1);
    -[HUQuickControlRingSliderInteractionCoordinator setFirstTouchDown:](self, "setFirstTouchDown:", 1);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlRingSliderInteractionCoordinator;
  -[HUQuickControlInteractionCoordinator setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  if (!a3)
    -[HUQuickControlRingSliderInteractionCoordinator setUserInteractionActive:](self, "setUserInteractionActive:", 0);
}

- (BOOL)isUserInteractionActive
{
  void *v2;
  char v3;

  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionActive");

  return v3;
}

- (id)value
{
  void *v3;
  void *v4;
  double v5;

  if (-[HUQuickControlRingSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
  {
    v3 = (void *)MEMORY[0x1E0D315F0];
    -[HUQuickControlRingSliderInteractionCoordinator modelRangeValue](self, "modelRangeValue");
    objc_msgSend(v3, "rangeWithFloatRange:");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HUQuickControlRingSliderInteractionCoordinator modelRangeValue](self, "modelRangeValue");
    objc_msgSend(v4, "numberWithDouble:", v5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
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
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v4 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    -[HUQuickControlRingSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", objc_msgSend(v6, "type") == 1);
    if (-[HUQuickControlRingSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
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
    -[HUQuickControlRingSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", 0);
    objc_msgSend(v17, "doubleValue");
    v10 = v11;
    v8 = 0.0;
  }
  -[HUQuickControlRingSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 0, v8, v10);
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateMainStatusStringWithValue:", v17);

  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateSupplementaryValue");

  -[HUQuickControlRingSliderInteractionCoordinator modelRangeValue](self, "modelRangeValue");
  -[HUQuickControlRingSliderInteractionCoordinator _updateControlViewValueOfType:withValue:](self, "_updateControlViewValueOfType:withValue:", 2, v16);
  if (-[HUQuickControlRingSliderInteractionCoordinator hasSecondaryValue](self, "hasSecondaryValue"))
  {
    -[HUQuickControlRingSliderInteractionCoordinator modelRangeValue](self, "modelRangeValue");
    -[HUQuickControlRingSliderInteractionCoordinator _updateControlViewValueOfType:withValue:](self, "_updateControlViewValueOfType:withValue:", 1);
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

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;

  v5 = a5;
  -[HUQuickControlRingSliderInteractionCoordinator setModelRangeValue:](self, "setModelRangeValue:", a4, a3.var0, a3.var1);
  if (v5)
  {
    if (-[HUQuickControlRingSliderInteractionCoordinator isUserInteractionActive](self, "isUserInteractionActive"))
    {
      -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlRingSliderInteractionCoordinator value](self, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interactionCoordinator:viewValueDidChange:", self, v7);

    }
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlRingSliderInteractionCoordinator.m"), 151, CFSTR("Invalid control view value type!"));
  }

}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v16 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v5 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (objc_msgSend(v7, "type") == 1)
    {
      objc_msgSend(v7, "floatRangeValue");
      v9 = v8;
      v11 = v10;
    }
    else
    {
      objc_msgSend(v7, "midValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v11 = v14;

      v9 = 0.0;
    }

  }
  else
  {
    objc_msgSend(v16, "doubleValue");
    v11 = v12;
    v9 = 0.0;
  }
  -[HUQuickControlRingSliderInteractionCoordinator setModelRangeValue:](self, "setModelRangeValue:", v9, v11);
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactionCoordinator:viewValueDidChange:", self, v16);

}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactionCoordinator:interactionStateDidChange:", self, v5);

}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_modelRangeValue.minimum;
  maximum = self->_modelRangeValue.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setModelRangeValue:(id)a3
{
  self->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isFirstTouchDown
{
  return self->_firstTouchDown;
}

- (void)setFirstTouchDown:(BOOL)a3
{
  self->_firstTouchDown = a3;
}

@end

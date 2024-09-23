@implementation HUColorPickerView

- (HUColorPickerView)initWithProfile:(id)a3
{
  id v5;
  HUColorPickerView *v6;
  HUColorPickerView *v7;
  void *v8;
  HUColorWheelView *v9;
  void *v10;
  void *v11;
  HUQuickControlMagnifierView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUColorPickerView;
  v6 = -[HUColorPickerView init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v7->_colorPickerMode = objc_msgSend(v5, "supportsRGBColor") ^ 1;
    v7->_mirroringAxisBias = 0;
    *(_OWORD *)&v7->_selectedColor.r = HUWheelColorInvalid;
    *(_OWORD *)&v7->_selectedColor.b = *(_OWORD *)&qword_1B9442BB8;
    v7->_selectedColorCoordinate = ($93411E767E52E887DBE6B6E7CEF02EAC)HUColorWheelNullCoordinate;
    -[HUColorPickerView _colorWheelSpaceForMode:](v7, "_colorWheelSpaceForMode:", -[HUColorPickerView colorPickerMode](v7, "colorPickerMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUColorWheelView initWithColorWheelSpace:]([HUColorWheelView alloc], "initWithColorWheelSpace:", v8);
    -[HUColorPickerView setColorWheelView:](v7, "setColorWheelView:", v9);

    -[HUColorPickerView colorWheelView](v7, "colorWheelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUColorPickerView colorWheelView](v7, "colorWheelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView addSubview:](v7, "addSubview:", v11);

    v12 = objc_alloc_init(HUQuickControlMagnifierView);
    -[HUColorPickerView setMagnifierView:](v7, "setMagnifierView:", v12);

    -[HUColorPickerView magnifierView](v7, "magnifierView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

    -[HUColorPickerView magnifierView](v7, "magnifierView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView addSubview:](v7, "addSubview:", v14);

    -[HUColorPickerView _updateMagnifierPosition](v7, "_updateMagnifierPosition");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v7, sel__handleGesture_);
    -[HUColorPickerView setGestureRecognizer:](v7, "setGestureRecognizer:", v15);

    -[HUColorPickerView gestureRecognizer](v7, "gestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v7);

    -[HUColorPickerView gestureRecognizer](v7, "gestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMinimumPressDuration:", 0.0);

    -[HUColorPickerView gestureRecognizer](v7, "gestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView addGestureRecognizer:](v7, "addGestureRecognizer:", v18);

  }
  return v7;
}

- (HUColorWheelSpace)colorWheelSpace
{
  void *v2;
  void *v3;

  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWheelSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUColorWheelSpace *)v3;
}

- (double)wheelHoleRadius
{
  void *v2;
  double v3;
  double v4;

  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wheelHoleRadius");
  v4 = v3;

  return v4;
}

- (void)setWheelHoleRadius:(double)a3
{
  void *v5;

  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWheelHoleRadius:", a3);

  -[HUColorPickerView _updateMagnifierView](self, "_updateMagnifierView");
}

- (void)setMagnifierLength:(double)a3
{
  self->_magnifierLength = a3;
  -[HUColorPickerView _updateMagnifierView](self, "_updateMagnifierView");
}

- (void)setSelectedColor:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  void *v8;
  id v9;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  self->_selectedColor = ($56D0F75D0B2E5F190A6F978686E1AFE9)a3;
  -[HUColorPickerView _updateMagnifierView](self, "_updateMagnifierView");
  UIColorForHUWheelColor(var0, var1, var2, var3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUColorPickerView magnifierView](self, "magnifierView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedColor:", v9);

}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a3 >= 2)
  {
    if (a3 != 2)
      return;
    -[HUColorPickerView setAlpha:](self, "setAlpha:", 1.0);
    -[HUColorPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[HUColorPickerView magnifierView](self, "magnifierView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 0;
  }
  else
  {
    -[HUColorPickerView setAlpha:](self, "setAlpha:", 0.5);
    -[HUColorPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    -[HUColorPickerView magnifierView](self, "magnifierView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 1;
  }
  objc_msgSend(v4, "setHidden:", v5);

}

- (void)_updateMagnifierView
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[HUColorPickerView magnifierLength](self, "magnifierLength");
  if (v3 > 0.0)
  {
    -[HUColorPickerView magnifierLength](self, "magnifierLength");
    v5 = v4 * 0.5;
    -[HUColorPickerView magnifierView](self, "magnifierView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInnerRadius:", v5);
LABEL_5:

    goto LABEL_6;
  }
  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wheelHoleRadius");
  v9 = v8;

  if (v9 > 0.0)
  {
    -[HUColorPickerView colorWheelView](self, "colorWheelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wheelHoleRadius");
    v11 = HURoundToScreenScale(v10 * 0.44);
    -[HUColorPickerView magnifierView](self, "magnifierView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInnerRadius:", v11);

    goto LABEL_5;
  }
LABEL_6:
  -[HUColorPickerView magnifierView](self, "magnifierView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

}

- (void)setSelectedColorCoordinate:(id)a3
{
  self->_selectedColorCoordinate = ($93411E767E52E887DBE6B6E7CEF02EAC)a3;
  -[HUColorPickerView _updateMagnifierPosition](self, "_updateMagnifierPosition");
  -[HUColorPickerView _updateMirroringAxisBiasIfNecessary](self, "_updateMirroringAxisBiasIfNecessary");
}

- (CGPoint)magnifierLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[HUColorPickerView magnifierView](self, "magnifierView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setMagnifierLocation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[HUColorPickerView magnifierView](self, "magnifierView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenter:", x, y);

}

- (void)setUserInteractionActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_userInteractionActive != a3)
  {
    v3 = a3;
    self->_userInteractionActive = a3;
    if (!a3)
      -[HUColorPickerView _updateMagnifierTransformForTouchLocation:](self, "_updateMagnifierTransformForTouchLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[HUColorPickerView interactionDelegate](self, "interactionDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlView:interactionStateDidChange:forFirstTouch:", self, v3, 0);

  }
}

- (void)setColorPickerMode:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (self->_colorPickerMode != a3)
  {
    self->_colorPickerMode = a3;
    -[HUColorPickerView _colorWheelSpaceForMode:](self, "_colorWheelSpaceForMode:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView colorWheelView](self, "colorWheelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColorWheelSpace:", v4);

    -[HUColorPickerView _applyMirroringAxisBiasToColorWheelSpaceIfNecessary](self, "_applyMirroringAxisBiasToColorWheelSpaceIfNecessary");
    -[HUColorPickerView _updateDerivedSelectedColorCoordinate](self, "_updateDerivedSelectedColorCoordinate");
  }
}

- (id)_colorWheelSpaceForMode:(unint64_t)a3
{
  HUTemperatureColorWheelSpace *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  float v13;
  float v14;

  if (a3 == 1)
  {
    +[HUTemperatureColorWheelSpace defaultTemperatureRange](HUTemperatureColorWheelSpace, "defaultTemperatureRange");
    v6 = v5;
    v8 = v7;
    objc_opt_class();
    -[HUColorPickerView profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(v12, "minimumTemperature");
      v8 = 1000000.0 / v13;
      objc_msgSend(v12, "maximumTemperature");
      v6 = 1000000.0 / v14;
    }
    v3 = -[HUTemperatureColorWheelSpace initWithSupportedRange:]([HUTemperatureColorWheelSpace alloc], "initWithSupportedRange:", v6, v8);

  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_alloc_init(HUWheelColorWheelSpace);
  }
  return v3;
}

- (void)_updateDerivedSelectedColorCoordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  -[HUColorPickerView selectedColor](self, "selectedColor");
  if (v6 == 1.79769313e308 && v3 == 1.79769313e308 && v4 == 1.79769313e308)
  {
    v9 = 1.79769313e308;
    v16 = v5 != 1.79769313e308;
    if (v5 == 1.79769313e308)
    {
      v15 = 1.79769313e308;
      goto LABEL_17;
    }
  }
  else
  {
    v16 = 1;
  }
  -[HUColorPickerView colorWheelSpace](self, "colorWheelSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColorPickerView selectedColor](self, "selectedColor");
  objc_msgSend(v10, "coordinateForColor:isValid:", &v16);
  v12 = v11;
  v14 = v13;

  v15 = 1.79769313e308;
  if (v16)
    v9 = v14;
  else
    v9 = 1.79769313e308;
  if (v16)
    v15 = v12;
LABEL_17:
  -[HUColorPickerView setSelectedColorCoordinate:](self, "setSelectedColorCoordinate:", v15, v9);
}

- (void)_updateMagnifierPosition
{
  double v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[HUColorPickerView selectedColorCoordinate](self, "selectedColorCoordinate");
  v5 = v4 == 1.79769313e308 && v3 == 1.79769313e308;
  if (!v5)
  {
    -[HUColorPickerView colorWheelView](self, "colorWheelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView selectedColorCoordinate](self, "selectedColorCoordinate");
    objc_msgSend(v6, "pointForColorWheelCoordinate:");
    v8 = v7;
    v10 = v9;

    -[HUColorPickerView colorWheelView](self, "colorWheelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorPickerView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v8, v10);
    -[HUColorPickerView setMagnifierLocation:](self, "setMagnifierLocation:");

  }
  -[HUColorPickerView magnifierView](self, "magnifierView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v5);

}

- (void)_applyMirroringAxisBiasToColorWheelSpaceIfNecessary
{
  void *v3;
  char v4;
  id v5;

  -[HUColorPickerView colorWheelSpace](self, "colorWheelSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HUColorPickerView colorWheelSpace](self, "colorWheelSpace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMirroringBiasAxis:", -[HUColorPickerView mirroringAxisBias](self, "mirroringAxisBias"));

  }
}

- (void)_updateMirroringAxisBiasIfNecessary
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  _BOOL8 v10;

  -[HUColorPickerView colorWheelSpace](self, "colorWheelSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
  {
    -[HUColorPickerView selectedColorCoordinate](self, "selectedColorCoordinate");
    v7 = v6 == 1.79769313e308 && v5 == 1.79769313e308;
    v10 = 0;
    if (!v7)
    {
      -[HUColorPickerView selectedColorCoordinate](self, "selectedColorCoordinate");
      if (v8 < 0.25 || (-[HUColorPickerView selectedColorCoordinate](self, "selectedColorCoordinate"), v9 > 0.75))
        v10 = 1;
    }
    -[HUColorPickerView setMirroringAxisBias:](self, "setMirroringAxisBias:", v10);
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor descriptorWithAspectRatio:](HUIntrinsicSizeDescriptor, "descriptorWithAspectRatio:", a3, 1.0);
}

- (id)value
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[HUColorPickerView selectedColor](self, "selectedColor");
  return HUPaletteColorForWheelColor(v2, v3, v4, v5);
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  v18 = v6;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v18;
  else
    v7 = 0;
  v8 = v7;
  v6 = v18;
  v9 = v18;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

    v6 = v18;
LABEL_7:
    v9 = 0;
  }

  -[HUColorPickerView selectedColor](self, "selectedColor");
  HUPaletteColorForWheelColor(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((!v16 || (objc_msgSend(v16, "isSimilarToColor:", v9) & 1) == 0)
    && (objc_msgSend(v9, "isNaturalLightColor") & 1) == 0)
  {
    -[HUColorPickerView setSelectedColor:](self, "setSelectedColor:", HUWheelColorForPaletteColor(v9));
    -[HUColorPickerView _updateDerivedSelectedColorCoordinate](self, "_updateDerivedSelectedColorCoordinate");
  }

}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUColorPickerView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUColorPickerView reachabilityState](self, "reachabilityState"));
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  objc_msgSend(a3, "addTarget:action:", self, sel__handleGesture_);
}

- (void)_handleGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = objc_msgSend(v26, "state");
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      -[HUColorPickerView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
      -[HUColorPickerView setTouchDownTimestamp:](self, "setTouchDownTimestamp:", 0.0);
      goto LABEL_6;
    }
    -[HUColorPickerView setTouchDownTimestamp:](self, "setTouchDownTimestamp:", CFAbsoluteTimeGetCurrent());
  }
  -[HUColorPickerView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWheelCoordinateForPoint:boundedToWheel:", 1, v7, v9);
  v12 = v11;
  v14 = v13;

  -[HUColorPickerView setSelectedColorCoordinate:](self, "setSelectedColorCoordinate:", v12, v14);
  -[HUColorPickerView colorWheelSpace](self, "colorWheelSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorForCoordinate:", v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[HUColorPickerView setSelectedColor:](self, "setSelectedColor:", v17, v19, v21, v23);
  -[HUColorPickerView interactionDelegate](self, "interactionDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColorPickerView value](self, "value");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "controlView:valueDidChange:", self, v25);

  objc_msgSend(v26, "locationInView:", self);
  -[HUColorPickerView _updateMagnifierTransformForTouchLocation:](self, "_updateMagnifierTransformForTouchLocation:");
LABEL_6:

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a4;
  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wheelBezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  LOBYTE(v5) = objc_msgSend(v7, "containsPoint:", v10, v12);
  return (char)v5;
}

- (void)_updateMagnifierTransformForTouchLocation:(CGPoint)a3
{
  double y;
  double v5;
  double Current;
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
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  y = a3.y;
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v24 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v29.c = v23;
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v29.tx = v22;
  if (-[HUColorPickerView isUserInteractionActive](self, "isUserInteractionActive"))
  {
    -[HUColorPickerView touchDownTimestamp](self, "touchDownTimestamp");
    if (v5 != 0.0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[HUColorPickerView touchDownTimestamp](self, "touchDownTimestamp");
      if (Current - v7 >= 0.15)
      {
        *(_OWORD *)&v28.a = v24;
        *(_OWORD *)&v28.c = v23;
        *(_OWORD *)&v28.tx = v22;
        CGAffineTransformScale(&v29, &v28, 1.14999998, 1.14999998);
        -[HUColorPickerView magnifierLocation](self, "magnifierLocation");
        v9 = fmax(30.0 - vabdd_f64(v8, y), 0.0);
        -[HUColorPickerView magnifierLocation](self, "magnifierLocation");
        v11 = v10;
        v13 = v12 - v9;
        -[HUColorPickerView colorWheelView](self, "colorWheelView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "colorWheelCoordinateForPoint:boundedToWheel:", 1, v11, v13);
        v16 = v15;
        v18 = v17;

        -[HUColorPickerView colorWheelView](self, "colorWheelView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pointForColorWheelCoordinate:", v16, v18);
        v21 = v20;

        v27 = v29;
        CGAffineTransformTranslate(&v28, &v27, 0.0, v21 - v13 - v9);
        v29 = v28;
      }
    }
  }
  v25[1] = 3221225472;
  v26 = v29;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __63__HUColorPickerView__updateMagnifierTransformForTouchLocation___block_invoke;
  v25[3] = &unk_1E6F4D468;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v25, 0.15);
}

void __63__HUColorPickerView__updateMagnifierTransformForTouchLocation___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "magnifierView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUColorPickerView;
  -[HUColorPickerView layoutSubviews](&v8, sel_layoutSubviews);
  -[HUColorPickerView frame](self, "frame");
  v4 = v3;
  -[HUColorPickerView frame](self, "frame");
  v6 = v5;
  -[HUColorPickerView colorWheelView](self, "colorWheelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[HUColorPickerView _updateMagnifierPosition](self, "_updateMagnifierPosition");
  -[HUColorPickerView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUColorPickerView reachabilityState](self, "reachabilityState"));
}

- (HUQuickControlColorPickerViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlColorPickerViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (unint64_t)colorPickerMode
{
  return self->_colorPickerMode;
}

- (double)magnifierLength
{
  return self->_magnifierLength;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (unint64_t)mirroringAxisBias
{
  return self->_mirroringAxisBias;
}

- (void)setMirroringAxisBias:(unint64_t)a3
{
  self->_mirroringAxisBias = a3;
}

- (HUColorWheelView)colorWheelView
{
  return self->_colorWheelView;
}

- (void)setColorWheelView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWheelView, a3);
}

- (HUQuickControlMagnifierView)magnifierView
{
  return self->_magnifierView;
}

- (void)setMagnifierView:(id)a3
{
  objc_storeStrong((id *)&self->_magnifierView, a3);
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (double)touchDownTimestamp
{
  return self->_touchDownTimestamp;
}

- (void)setTouchDownTimestamp:(double)a3
{
  self->_touchDownTimestamp = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedColorCoordinate
{
  double angle;
  double radius;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  angle = self->_selectedColorCoordinate.angle;
  radius = self->_selectedColorCoordinate.radius;
  result.var1 = radius;
  result.var0 = angle;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)selectedColor
{
  double r;
  double g;
  double b;
  double temperature;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  r = self->_selectedColor.r;
  g = self->_selectedColor.g;
  b = self->_selectedColor.b;
  temperature = self->_selectedColor.temperature;
  result.var3 = temperature;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_magnifierView, 0);
  objc_storeStrong((id *)&self->_colorWheelView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end

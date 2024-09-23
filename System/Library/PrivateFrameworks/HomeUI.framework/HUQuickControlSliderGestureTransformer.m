@implementation HUQuickControlSliderGestureTransformer

- (HUQuickControlSliderGestureTransformer)initWithGestureRecognizer:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  HUQuickControlSliderGestureTransformer *v9;
  HUQuickControlSliderGestureTransformer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlSliderGestureTransformer;
  v9 = -[HUQuickControlSliderGestureTransformer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gestureRecognizer, a3);
    objc_msgSend(v8, "assertConfigurationIsValid");
    objc_storeStrong((id *)&v10->_context, a4);
    objc_msgSend(v7, "hu_locationInGlobalCoordinateSpace");
    -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](v10, "setReferenceTouchLocation:");
    objc_msgSend(v8, "initialSliderValue");
    -[HUQuickControlSliderGestureTransformer setReferenceSliderValue:](v10, "setReferenceSliderValue:");
    objc_msgSend(v8, "initialSliderValue");
    -[HUQuickControlSliderGestureTransformer setCurrentSliderValue:](v10, "setCurrentSliderValue:");
    -[HUQuickControlSliderGestureTransformer setGestureRecognizer:](v10, "setGestureRecognizer:", v7);
    objc_msgSend(v7, "addTarget:action:", v10, sel__handleGesturePan_);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUQuickControlSliderGestureTransformer gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:", self, 0);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSliderGestureTransformer;
  -[HUQuickControlSliderGestureTransformer dealloc](&v4, sel_dealloc);
}

- (void)_handleGesturePan:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) < 2)
    {
      objc_msgSend(v10, "hu_locationInGlobalCoordinateSpace");
      v7 = v6;
      v9 = v8;
      if (-[HUQuickControlSliderGestureTransformer _shouldIgnoreAllGestures](self, "_shouldIgnoreAllGestures"))
      {
        -[HUQuickControlSliderGestureTransformer setLastTouchLocation:](self, "setLastTouchLocation:", v7, v9);
        -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", v7, v9);
      }
      else
      {
        -[HUQuickControlSliderGestureTransformer _handleSliderValuePan:](self, "_handleSliderValuePan:", v7, v9);
      }
    }
  }
  else
  {
    -[HUQuickControlSliderGestureTransformer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestureDidEndForGestureTransformer:", self);

  }
}

- (void)_handleSliderValuePan:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlSliderGestureTransformer lastTouchLocation](self, "lastTouchLocation");
  if (v7 != *MEMORY[0x1E0C9D538] || v6 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[HUQuickControlSliderGestureTransformer lastTouchLocation](self, "lastTouchLocation");
    UIDistanceBetweenPoints();
    v10 = v9;
    -[HUQuickControlSliderGestureTransformer accumulatedDragDistance](self, "accumulatedDragDistance");
    -[HUQuickControlSliderGestureTransformer setAccumulatedDragDistance:](self, "setAccumulatedDragDistance:", v10 + v11);
  }
  -[HUQuickControlSliderGestureTransformer setLastTouchLocation:](self, "setLastTouchLocation:", x, y);
  -[HUQuickControlSliderGestureTransformer context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "requiresSomeMovementBeforeActivation"))
  {
    -[HUQuickControlSliderGestureTransformer accumulatedDragDistance](self, "accumulatedDragDistance");
    v14 = v13;

    if (v14 < 25.0)
    {
      -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", x, y);
      return;
    }
  }
  else
  {

  }
  -[HUQuickControlSliderGestureTransformer _rawSliderValueForLocation:](self, "_rawSliderValueForLocation:", x, y);
  v16 = v15;
  -[HUQuickControlSliderGestureTransformer currentSliderValue](self, "currentSliderValue");
  v18 = v17;
  if (!-[HUQuickControlSliderGestureTransformer hasRecognizedSignificantSliderValueChange](self, "hasRecognizedSignificantSliderValueChange"))
  {
    -[HUQuickControlSliderGestureTransformer referenceSliderValue](self, "referenceSliderValue");
    if (vabdd_f64(v19, v16) >= 0.15)
      -[HUQuickControlSliderGestureTransformer setHasRecognizedSignificantSliderValueChange:](self, "setHasRecognizedSignificantSliderValueChange:", 1);
  }
  v20 = v16 - v18;
  -[HUQuickControlSliderGestureTransformer referenceTouchLocation](self, "referenceTouchLocation");
  if (v16 > 1.0 && v20 < 0.0 || v16 < 0.0 && v20 > 0.0)
  {
    v16 = fmin(fmax(v16, 0.0), 1.0);
    -[HUQuickControlSliderGestureTransformer setReferenceSliderValue:](self, "setReferenceSliderValue:", v16);
    v21 = y;
  }
  -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", x, v21);
  -[HUQuickControlSliderGestureTransformer setCurrentSliderValue:](self, "setCurrentSliderValue:", v16);
  -[HUQuickControlSliderGestureTransformer delegate](self, "delegate");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "gestureTransformer:sliderValueDidChange:", self, v16);

}

- (double)_rawSliderValueForLocation:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  void *v7;
  double Height;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;

  y = a3.y;
  -[HUQuickControlSliderGestureTransformer referenceTouchLocation](self, "referenceTouchLocation", a3.x);
  v6 = v5;
  -[HUQuickControlSliderGestureTransformer context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlFrame");
  Height = CGRectGetHeight(v14);
  -[HUQuickControlSliderGestureTransformer context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "verticalDragCoefficient");
  v11 = Height * v10;

  -[HUQuickControlSliderGestureTransformer referenceSliderValue](self, "referenceSliderValue");
  return v12 - (y - v6) / v11;
}

- (HUQuickControlSliderGestureTransformerDelegate)delegate
{
  return (HUQuickControlSliderGestureTransformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (HUQuickControlPanningContext)context
{
  return self->_context;
}

- (BOOL)ignoreTouches
{
  return self->_ignoreTouches;
}

- (void)setIgnoreTouches:(BOOL)a3
{
  self->_ignoreTouches = a3;
}

- (BOOL)hasRecognizedSignificantSliderValueChange
{
  return self->_hasRecognizedSignificantSliderValueChange;
}

- (void)setHasRecognizedSignificantSliderValueChange:(BOOL)a3
{
  self->_hasRecognizedSignificantSliderValueChange = a3;
}

- (double)referenceSliderValue
{
  return self->_referenceSliderValue;
}

- (void)setReferenceSliderValue:(double)a3
{
  self->_referenceSliderValue = a3;
}

- (double)currentSliderValue
{
  return self->_currentSliderValue;
}

- (void)setCurrentSliderValue:(double)a3
{
  self->_currentSliderValue = a3;
}

- (CGPoint)referenceTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_referenceTouchLocation.x;
  y = self->_referenceTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setReferenceTouchLocation:(CGPoint)a3
{
  self->_referenceTouchLocation = a3;
}

- (CGPoint)lastTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchLocation.x;
  y = self->_lastTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (double)accumulatedDragDistance
{
  return self->_accumulatedDragDistance;
}

- (void)setAccumulatedDragDistance:(double)a3
{
  self->_accumulatedDragDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

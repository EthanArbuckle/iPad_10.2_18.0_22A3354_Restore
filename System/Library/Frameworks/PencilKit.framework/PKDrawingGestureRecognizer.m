@implementation PKDrawingGestureRecognizer

- (void)setThresholdDistance:(double)a3
{
  if (self->_thresholdDistance != a3)
  {
    self->_thresholdDistance = a3;
    self->_squaredThreshold = a3 * a3;
  }
}

- (void)setDrawingTarget:(id)a3
{
  objc_storeWeak((id *)&self->drawingTarget, a3);
}

- (PKDrawingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PKDrawingGestureRecognizer *v4;
  PKDrawingGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDrawingGestureRecognizer;
  v4 = -[PKDrawingGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKDrawingGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[PKDrawingGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[PKDrawingGestureRecognizer setRequiresExclusiveTouchType:](v5, "setRequiresExclusiveTouchType:", 0);
    -[PKDrawingGestureRecognizer setThresholdDistance:](v5, "setThresholdDistance:", 163.0);
  }
  return v5;
}

+ (unint64_t)activeInputPropertiesForTouch:(id)a3 event:(id)a4
{
  return objc_msgSend(a4, "PK_activeInputPropertiesForTouch:", a3);
}

- (BOOL)_shouldBeginDrawing:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  BOOL v23;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      -[PKDrawingGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    -[PKDrawingGestureRecognizer delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0
      || (-[PKDrawingGestureRecognizer delegate](self, "delegate"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "drawingGestureRecognizer:shouldBeginDrawingWithTouches:event:", self, v8, v7),
          v21,
          (v22 & 1) != 0))
    {
      v23 = 1;
      goto LABEL_18;
    }
    v17 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      v18 = "shouldBeginDrawingWithTouches returned NO";
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

    v17 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      v18 = "Allowed touch type not found";
LABEL_16:
      _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, v18, v25, 2u);
    }
  }

  v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)isReplaying
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Touches drawing", buf, 2u);
  }

  if (-[PKDrawingGestureRecognizer state](self, "state")
    || -[PKDrawingGestureRecognizer _shouldBeginDrawing:withEvent:](self, "_shouldBeginDrawing:withEvent:", v6, v7))
  {
    objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      self->_gestureDetected = 1;
      self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v10);
      -[PKDrawingGestureRecognizer _beginDrawingWithTouch:](self, "_beginDrawingWithTouch:", v10);
    }
    else if (!self->_ignoreFingerTouchesUntilReset)
    {
      if (self->_drawingTouch || (unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        if (!self->_gestureDetected)
        {
          v11 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Multiple touches cancel drawing", v14, 2u);
          }

          -[PKDrawingGestureRecognizer _cancelDrawing](self, "_cancelDrawing");
        }
      }
      else if (!self->_drawingTargetIsDrawing)
      {
        objc_msgSend(v6, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        self->_activeInputProperties = objc_msgSend(v7, "PK_activeInputPropertiesForTouch:", v13);
        -[PKDrawingGestureRecognizer _beginDrawingWithTouch:](self, "_beginDrawingWithTouch:", v13);

      }
    }

  }
  else
  {
    v12 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Drawing should not begin so cancelDrawing", v15, 2u);
    }

    -[PKDrawingGestureRecognizer _cancelDrawing](self, "_cancelDrawing");
  }

}

BOOL __53__PKDrawingGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch))
  {
    if (self->_drawingTargetIsDrawing)
      -[PKDrawingGestureRecognizer _updateDrawingWithEvent:](self, "_updateDrawingWithEvent:", v6);
    else
      -[PKDrawingGestureRecognizer _beginDrawingWithTouch:](self, "_beginDrawingWithTouch:", self->_drawingTouch);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    v5 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Touches cancelled", v6, 2u);
    }

    -[PKDrawingGestureRecognizer _cancelDrawing](self, "_cancelDrawing");
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;

  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4))
  {
    -[PKDrawingGestureRecognizer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PKDrawingGestureRecognizer delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "drawingGestureRecognizer:touchesEndedWithDrawingTouch:", self, self->_drawingTouch);

    }
    -[PKDrawingGestureRecognizer _endDrawing](self, "_endDrawing");
  }
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingEstimatedPropertiesUpdated:", v4);

}

- (void)_beginDrawingWithTouch:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  UITouch *v11;

  v11 = (UITouch *)a3;
  if (self->_drawingTargetIsDrawing)
  {
    if (self->_drawingTouch == v11)
      goto LABEL_13;
    -[PKDrawingGestureRecognizer _drawingCancelled](self, "_drawingCancelled");
  }
  if (!self->_drawingTouch)
  {
    -[UITouch locationInView:](v11, "locationInView:", 0);
    self->_drawTouchStartPoint.x = v5;
    self->_drawTouchStartPoint.y = v6;
  }
  objc_storeStrong((id *)&self->_drawingTouch, a3);
  if (!self->_drawingTargetIsDrawing)
  {
    -[PKDrawingGestureRecognizer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0
      || (-[PKDrawingGestureRecognizer delegate](self, "delegate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "drawingGestureRecognizer:shouldDelayDrawingBeganWithTouch:", self, v11),
          v9,
          (v10 & 1) == 0))
    {
      -[PKDrawingGestureRecognizer _drawingBegan](self, "_drawingBegan");
    }
  }
  if (self->_gestureDetected && !-[PKDrawingGestureRecognizer state](self, "state"))
    -[PKDrawingGestureRecognizer setState:](self, "setState:", 1);
LABEL_13:

}

- (void)_updateDrawingWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_gestureDetected)
  {
    -[PKDrawingGestureRecognizer _drawingMoved:](self, "_drawingMoved:", v4);
    if (self->_gestureDetected)
    {
      v5 = 2;
LABEL_8:
      -[PKDrawingGestureRecognizer setState:](self, "setState:", v5);
    }
  }
  else
  {
    -[UITouch locationInView:](self->_drawingTouch, "locationInView:", 0);
    if ((self->_drawTouchStartPoint.y - v7) * (self->_drawTouchStartPoint.y - v7)
       + (self->_drawTouchStartPoint.x - v6) * (self->_drawTouchStartPoint.x - v6) > self->_squaredThreshold)
      self->_gestureDetected = 1;
    -[PKDrawingGestureRecognizer _drawingMoved:](self, "_drawingMoved:", v8);
    if (self->_gestureDetected)
    {
      v5 = 1;
      goto LABEL_8;
    }
  }

}

- (void)_cancelDrawing
{
  UITouch *drawingTouch;
  uint64_t v4;

  if (self->_drawingTargetIsDrawing)
    -[PKDrawingGestureRecognizer _drawingCancelled](self, "_drawingCancelled");
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_ignoreFingerTouchesUntilReset = 1;
  if (self->_gestureDetected)
  {
    self->_gestureDetected = 0;
    v4 = 4;
  }
  else
  {
    v4 = 5;
  }
  -[PKDrawingGestureRecognizer setState:](self, "setState:", v4);
}

- (void)_endDrawing
{
  -[PKDrawingGestureRecognizer setState:](self, "setState:", 3);
}

- (void)reset
{
  UITouch *drawingTouch;

  if ((-[PKDrawingGestureRecognizer state](self, "state") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (self->_drawingTargetIsDrawing)
      -[PKDrawingGestureRecognizer _drawingCancelled](self, "_drawingCancelled");
  }
  else if (self->_drawingTargetIsDrawing)
  {
    -[PKDrawingGestureRecognizer _drawingEnded](self, "_drawingEnded");
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTargetIsDrawing = 0;
  self->_gestureDetected = 0;
  self->_ignoreFingerTouchesUntilReset = 0;
}

- (void)_drawingBegan
{
  CGFloat v3;
  CGFloat v4;
  id v5;

  self->_drawingTargetIsDrawing = 1;
  self->_startTimeInterval = CACurrentMediaTime();
  -[UITouch locationInView:](self->_drawingTouch, "locationInView:", 0);
  self->_currentBoundingBoxInWindow.origin.x = v3;
  self->_currentBoundingBoxInWindow.origin.y = v4;
  self->_currentBoundingBoxInWindow.size.width = 0.0;
  self->_currentBoundingBoxInWindow.size.height = 0.0;
  -[PKDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingBegan:", self->_drawingTouch);

}

- (void)_drawingMoved:(id)a3
{
  UITouch *drawingTouch;
  id v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  CGRect v9;

  drawingTouch = self->_drawingTouch;
  v5 = a3;
  -[UITouch locationInView:](drawingTouch, "locationInView:", 0);
  v9.origin.x = v6;
  v9.origin.y = v7;
  v9.size.width = 0.0;
  v9.size.height = 0.0;
  self->_currentBoundingBoxInWindow = CGRectUnion(self->_currentBoundingBoxInWindow, v9);
  -[PKDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingMoved:withEvent:", self->_drawingTouch, v5);

}

- (void)_drawingEnded
{
  void *v3;

  -[PKDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingEnded:", self->_drawingTouch);

  self->_drawingTargetIsDrawing = 0;
}

- (void)_drawingCancelled
{
  void *v3;

  -[PKDrawingGestureRecognizer drawingTarget](self, "drawingTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingCancelled");

  self->_drawingTargetIsDrawing = 0;
}

- (PKDrawingGestureTarget)drawingTarget
{
  return (PKDrawingGestureTarget *)objc_loadWeakRetained((id *)&self->drawingTarget);
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (CGRect)currentBoundingBoxInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentBoundingBoxInWindow.origin.x;
  y = self->_currentBoundingBoxInWindow.origin.y;
  width = self->_currentBoundingBoxInWindow.size.width;
  height = self->_currentBoundingBoxInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)startTimeInterval
{
  return self->_startTimeInterval;
}

- (double)thresholdDistance
{
  return self->_thresholdDistance;
}

- (UITouch)drawingTouch
{
  return self->_drawingTouch;
}

- (void)setDrawingTouch:(id)a3
{
  objc_storeStrong((id *)&self->_drawingTouch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTouch, 0);
  objc_destroyWeak((id *)&self->drawingTarget);
}

@end

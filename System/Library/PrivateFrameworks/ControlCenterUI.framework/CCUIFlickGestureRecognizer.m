@implementation CCUIFlickGestureRecognizer

- (CCUIFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CCUIFlickGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIFlickGestureRecognizer;
  result = -[CCUIFlickGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_maximumFlickTime = 0.1;
    result->_minimumFlickVelocity = 500.0;
    result->_allowedFlickDirections = 15;
  }
  return result;
}

- (void)reset
{
  UITouch *touch;
  NSTimer *timeoutTimer;

  touch = self->_touch;
  self->_touch = 0;

  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  self->_latched = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCUIFlickGestureRecognizer;
  -[CCUIFlickGestureRecognizer touchesBegan:withEvent:](&v17, sel_touchesBegan_withEvent_, v6, v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (self->_touch)
        {
          if (self->_touch != *(UITouch **)(*((_QWORD *)&v13 + 1) + 8 * i))
            -[CCUIFlickGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:");
        }
        else
        {
          objc_storeStrong((id *)&self->_touch, *(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
          -[CCUIFlickGestureRecognizer _beginFlickWithTouch:](self, "_beginFlickWithTouch:", self->_touch, (_QWORD)v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIFlickGestureRecognizer;
  -[CCUIFlickGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  if (self->_latched
    || -[CCUIFlickGestureRecognizer _validateFlickWithTouch:](self, "_validateFlickWithTouch:", self->_touch))
  {
    self->_latched = 1;
  }
  else
  {
    -[CCUIFlickGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIFlickGestureRecognizer;
  -[CCUIFlickGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (self->_latched)
  {
    v5 = 3;
  }
  else if (-[CCUIFlickGestureRecognizer _validateFlickWithTouch:](self, "_validateFlickWithTouch:", self->_touch))
  {
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }
  -[CCUIFlickGestureRecognizer setState:](self, "setState:", v5);
}

- (void)_beginFlickWithTouch:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  NSTimer *v12;
  NSTimer *timeoutTimer;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  self->_initialTouchTimestamp = v5;
  -[CCUIFlickGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  self->_initialTouchLocation.x = v8;
  self->_initialTouchLocation.y = v10;

  v11 = (void *)MEMORY[0x1E0C99E88];
  -[CCUIFlickGestureRecognizer maximumFlickTime](self, "maximumFlickTime");
  objc_msgSend(v11, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__evaluateFlickAtTimeout, 0, 0);
  v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v12;

}

- (BOOL)_validateFlickWithTouch:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = v5 - self->_initialTouchTimestamp;
  -[CCUIFlickGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = (v9 - self->_initialTouchLocation.x) / v6;
  v13 = (v11 - self->_initialTouchLocation.y) / v6;
  if (v12 >= 0.0)
    v14 = v12;
  else
    v14 = -v12;
  if (v13 >= 0.0)
    v15 = v13;
  else
    v15 = -v13;
  hypot(v14, v15);
  v16 = BSFloatGreaterThanOrEqualToFloat();
  if (v16)
  {
    if (BSFloatGreaterThanFloat())
    {
      if (BSFloatLessThanFloat())
        v17 = 2;
      else
        v17 = 8;
    }
    else if (BSFloatLessThanFloat())
    {
      v17 = 1;
    }
    else
    {
      v17 = 4;
    }
    LOBYTE(v16) = (-[CCUIFlickGestureRecognizer allowedFlickDirections](self, "allowedFlickDirections") & v17) != 0;
  }
  return v16;
}

- (void)_evaluateFlickAtTimeout
{
  -[CCUIFlickGestureRecognizer setState:](self, "setState:", 5);
}

- (double)maximumFlickTime
{
  return self->_maximumFlickTime;
}

- (void)setMaximumFlickTime:(double)a3
{
  self->_maximumFlickTime = a3;
}

- (double)minimumFlickVelocity
{
  return self->_minimumFlickVelocity;
}

- (void)setMinimumFlickVelocity:(double)a3
{
  self->_minimumFlickVelocity = a3;
}

- (unint64_t)allowedFlickDirections
{
  return self->_allowedFlickDirections;
}

- (void)setAllowedFlickDirections:(unint64_t)a3
{
  self->_allowedFlickDirections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_touch, 0);
}

@end

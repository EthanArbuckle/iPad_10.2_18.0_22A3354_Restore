@implementation VKWalkAssistHeadingManager

- (VKWalkAssistHeadingManager)initWithHapticEngineDelegate:(id)a3
{
  id v4;
  VKWalkAssistHeadingManager *v5;
  VKWalkAssistHeadingManager *v6;
  VKWalkAssistHeadingManager *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKWalkAssistHeadingManager;
  v5 = -[VKWalkAssistHeadingManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_heading = _Q0;
    v5->_isLocationInView = 0;
    objc_storeWeak((id *)&v5->_hapticEngineDelegate, v4);
    v12 = v6;
  }

  return v6;
}

- (void)updateHeading:(double)a3 bearing:(double)a4
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  if (a3 >= 0.0)
  {
    -[VKWalkAssistHeadingManager setHeading:](self, "setHeading:");
    -[VKWalkAssistHeadingManager setBearing:](self, "setBearing:", a4);
    v6 = -[VKWalkAssistHeadingManager _isFacingLocation](self, "_isFacingLocation");
    if (self->_isLocationInView != v6)
    {
      v7 = v6;
      v8 = -[VKWalkAssistHeadingManager _isFacingLocation](self, "_isFacingLocation");
      -[VKWalkAssistHeadingManager hapticEngineDelegate](self, "hapticEngineDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
        objc_msgSend(v9, "playEnterHaptic");
      else
        objc_msgSend(v9, "playExitHaptic");

      -[VKWalkAssistHeadingManager setIsLocationInView:](self, "setIsLocationInView:", v7);
    }
  }
}

- (BOOL)_isFacingLocation
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
  double v12;
  double v13;
  double v14;
  BOOL result;

  -[VKWalkAssistHeadingManager bearing](self, "bearing");
  -[VKWalkAssistHeadingManager _getDegrees:](self, "_getDegrees:", v3 + 30.0);
  v5 = v4;
  -[VKWalkAssistHeadingManager bearing](self, "bearing");
  -[VKWalkAssistHeadingManager _getDegrees:](self, "_getDegrees:", v6 + -30.0);
  v8 = v7;
  if (v5 < v7)
  {
    -[VKWalkAssistHeadingManager heading](self, "heading");
    if (v9 >= v8 || (-[VKWalkAssistHeadingManager heading](self, "heading"), v10 >= v5))
    {
      -[VKWalkAssistHeadingManager heading](self, "heading");
      if (v11 > v5)
      {
        -[VKWalkAssistHeadingManager heading](self, "heading");
        if (v12 > v8)
          v5 = v5 + 360.0;
      }
    }
    else
    {
      v8 = v8 + -360.0;
    }
  }
  -[VKWalkAssistHeadingManager heading](self, "heading");
  result = 0;
  if (v13 <= v5)
  {
    -[VKWalkAssistHeadingManager heading](self, "heading");
    if (v14 >= v8)
      return 1;
  }
  return result;
}

- (double)_getDegrees:(double)result
{
  for (; result > 360.0; result = result + -360.0)
    ;
  while (result < 0.0)
    result = result + 360.0;
  return result;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (double)bearing
{
  return self->_bearing;
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
}

- (BOOL)isLocationInView
{
  return self->_isLocationInView;
}

- (void)setIsLocationInView:(BOOL)a3
{
  self->_isLocationInView = a3;
}

- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate
{
  return (VKWalkAssistHapticEngineDelegate *)objc_loadWeakRetained((id *)&self->_hapticEngineDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hapticEngineDelegate);
}

@end

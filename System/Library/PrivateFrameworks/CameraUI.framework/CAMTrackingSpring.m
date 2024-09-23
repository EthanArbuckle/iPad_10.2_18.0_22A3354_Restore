@implementation CAMTrackingSpring

- (CAMTrackingSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5
{
  CAMTrackingSpring *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMTrackingSpring;
  result = -[CAMSpring initWithTension:friction:epsilon:](&v6, sel_initWithTension_friction_epsilon_, a3, a4, a5);
  if (result)
    result->112 = ($086C0E59A94AFF41DFCAA15FAFF4BA1C)CAMTrackingSpringTargetInvalid;
  return result;
}

- (BOOL)isConverged
{
  void *v3;
  void *v4;
  char v5;

  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isConverged");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (double)convergenceProgress
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_current");
    v6 = v5;

  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (void)_beginConverging
{
  void *v3;
  CAMSpring *v4;
  double v5;
  double v6;
  double v7;
  CAMSpring *v8;
  void *v9;
  void *v10;

  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CAMSpring alloc];
    -[CAMSpring tension](self, "tension");
    v6 = v5;
    -[CAMSpring friction](self, "friction");
    v8 = -[CAMSpring initWithTension:friction:epsilon:](v4, "initWithTension:friction:epsilon:", v6, v7, 0.001);
    -[CAMTrackingSpring _setSettlingSpring:](self, "_setSettlingSpring:", v8);

  }
  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTarget:", 1.0);

  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setCurrent:", 0.0);

  -[CAMSpring _current](self, "_current");
  -[CAMTrackingSpring _convergenceStartValue:](self, "_convergenceStartValue:");
}

- (void)setTarget:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[CAMSpring setTarget:](self, "setTarget:", a3);
  if (v4)
    -[CAMTrackingSpring _beginConverging](self, "_beginConverging");
}

- (void)setSecondaryTarget:(double)a3 withStrength:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v12;

  v5 = a5;
  -[CAMTrackingSpring _secondaryTarget](self, "_secondaryTarget");
  if (v9 != a3 || v10 != a4)
  {
    v12 = v9;
    -[CAMTrackingSpring _setSecondaryTarget:](self, "_setSecondaryTarget:", a3, a4);
    if (v12 != a3 && v5)
      -[CAMTrackingSpring _beginConverging](self, "_beginConverging");
  }
}

- (void)removeSecondaryTargetAnimated:(BOOL)a3
{
  -[CAMTrackingSpring setSecondaryTarget:withStrength:animated:](self, "setSecondaryTarget:withStrength:animated:", a3, 1.79769313e308, 0.0);
}

- (BOOL)hasSecondaryTarget
{
  double v2;

  -[CAMTrackingSpring _secondaryTarget](self, "_secondaryTarget");
  return v2 != 1.79769313e308;
}

- (void)resetToValue:(double)a3
{
  -[CAMTrackingSpring resetToValue:animated:](self, "resetToValue:animated:", 0, a3);
}

- (void)resetToValue:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[CAMTrackingSpring removeSecondaryTargetAnimated:](self, "removeSecondaryTargetAnimated:", 0);
  -[CAMSpring setTarget:](self, "setTarget:", a3);
  if (v4)
  {
    -[CAMTrackingSpring _beginConverging](self, "_beginConverging");
  }
  else
  {
    -[CAMTrackingSpring _setSettlingSpring:](self, "_setSettlingSpring:", 0);
    -[CAMSpring _setCurrent:](self, "_setCurrent:", a3);
  }
}

- (void)updateForTimestamp:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[CAMTrackingSpring _settleProgressSpring](self, "_settleProgressSpring");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateForTimestamp:", a3);
  -[CAMSpring target](self, "target");
  v6 = v5;
  if (-[CAMTrackingSpring hasSecondaryTarget](self, "hasSecondaryTarget"))
  {
    -[CAMSpring target](self, "target");
    -[CAMTrackingSpring _secondaryTarget](self, "_secondaryTarget");
    CEKInterpolate();
    v6 = v7;
  }
  if (-[CAMTrackingSpring isConverged](self, "isConverged"))
  {
    -[CAMTrackingSpring _setSettlingSpring:](self, "_setSettlingSpring:", 0);
  }
  else
  {
    -[CAMTrackingSpring convergenceProgress](self, "convergenceProgress");
    -[CAMTrackingSpring _convergenceStartValue](self, "_convergenceStartValue");
    CEKInterpolate();
    v6 = v8;
  }
  -[CAMSpring _setCurrent:](self, "_setCurrent:", v6);

}

- (CAMSpring)_settleProgressSpring
{
  return self->__settleProgressSpring;
}

- (void)_setSettlingSpring:(id)a3
{
  objc_storeStrong((id *)&self->__settleProgressSpring, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_secondaryTarget
{
  double value;
  double strength;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  value = self->value;
  strength = self->strength;
  result.var1 = strength;
  result.var0 = value;
  return result;
}

- (void)_setSecondaryTarget:(id)a3
{
  self->112 = ($086C0E59A94AFF41DFCAA15FAFF4BA1C)a3;
}

- (double)_convergenceStartValue
{
  return self->__convergenceStartValue;
}

- (void)_convergenceStartValue:(double)a3
{
  self->__convergenceStartValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__settleProgressSpring, 0);
}

@end

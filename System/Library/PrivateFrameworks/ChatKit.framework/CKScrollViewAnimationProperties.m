@implementation CKScrollViewAnimationProperties

- (CKScrollViewAnimationProperties)initWithAnimationType:(int64_t)a3 duration:(double)a4 animationCurve:(int64_t)a5 springMass:(double)a6 springStiffness:(double)a7 springDamping:(double)a8
{
  CKScrollViewAnimationProperties *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKScrollViewAnimationProperties;
  result = -[CKScrollViewAnimationProperties init](&v15, sel_init);
  if (result)
  {
    result->_animationType = a3;
    result->_duration = a4;
    result->_animationCurve = a5;
    result->_springMass = a6;
    result->_springStiffness = a7;
    result->_springDamping = a8;
  }
  return result;
}

+ (id)unanimated
{
  return -[CKScrollViewAnimationProperties initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:]([CKScrollViewAnimationProperties alloc], "initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:", 0, 3, 0.0, 0.0, 0.0, 0.0);
}

+ (id)inheritedAnimation
{
  return -[CKScrollViewAnimationProperties initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:]([CKScrollViewAnimationProperties alloc], "initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:", 2, 3, 0.0, 0.0, 0.0, 0.0);
}

+ (id)animatedWithDuration:(double)a3 animationCurve:(int64_t)a4
{
  return -[CKScrollViewAnimationProperties initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:]([CKScrollViewAnimationProperties alloc], "initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:", 1, a4, a3, 0.0, 0.0, 0.0);
}

+ (id)springAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 duration:(double)a6
{
  return -[CKScrollViewAnimationProperties initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:]([CKScrollViewAnimationProperties alloc], "initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:", 1, 3, a6, a3, a4, a5);
}

+ (id)systemDefaultScrollAnimation
{
  return -[CKScrollViewAnimationProperties initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:]([CKScrollViewAnimationProperties alloc], "initWithAnimationType:duration:animationCurve:springMass:springStiffness:springDamping:", 1, 0, 0.3, 0.0, 0.0, 0.0);
}

- (CABasicAnimation)caBasicAnimation
{
  id v3;
  int64_t animationCurve;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_animationType == 1)
  {
    if (self->_springMass <= 0.0)
    {
      animationCurve = self->_animationCurve;
      if (animationCurve == 103)
      {
        v3 = objc_alloc_init(MEMORY[0x1E0CD2848]);
        objc_msgSend(v3, "setDuration:", self->_duration);
        objc_msgSend(v3, "setMass:", 1.0);
        objc_msgSend(v3, "setStiffness:", 333.34153);
        objc_msgSend(v3, "setDamping:", 36.51529);
      }
      else
      {
        if ((animationCurve & 7) != 0)
        {
          v3 = objc_alloc_init(MEMORY[0x1E0CD2848]);
          objc_msgSend(v3, "setDuration:", self->_duration);
          v6 = objc_alloc_init(MEMORY[0x1E0CEA9D8]);
          objc_msgSend(v6, "mass");
          objc_msgSend(v3, "setMass:");
          objc_msgSend(v6, "stiffness");
          objc_msgSend(v3, "setStiffness:");
          objc_msgSend(v6, "damping");
          objc_msgSend(v3, "setDamping:");
        }
        else
        {
          v3 = objc_alloc_init(MEMORY[0x1E0CD2710]);
          objc_msgSend(v3, "setDuration:", self->_duration);
          _CKGetAnimationCurveSpline(self->_animationCurve, v7, v8, v9, v10);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setTimingFunction:", v6);
        }

      }
    }
    else
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CD2848]);
      objc_msgSend(v3, "setMass:", self->_springMass);
      objc_msgSend(v3, "setStiffness:", self->_springStiffness);
      objc_msgSend(v3, "setDamping:", self->_springDamping);
      objc_msgSend(v3, "setDuration:", self->_duration);
    }
  }
  else
  {
    v3 = 0;
  }
  return (CABasicAnimation *)v3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  id v3;
  double springMass;
  double springStiffness;
  double springDamping;
  void *v7;
  int64_t animationCurve;
  id v9;
  void *v10;

  if (self->_animationType == 1)
  {
    if (self->_springMass <= 0.0)
    {
      animationCurve = self->_animationCurve;
      if (animationCurve != 103)
      {
        if ((animationCurve & 7) != 0)
          v9 = objc_alloc_init(MEMORY[0x1E0CEA9D8]);
        else
          v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4D0]), "initWithAnimationCurve:", self->_animationCurve);
        goto LABEL_8;
      }
      v3 = objc_alloc(MEMORY[0x1E0CEA9D8]);
      springStiffness = 333.34153;
      springDamping = 36.51529;
      springMass = 1.0;
    }
    else
    {
      v3 = objc_alloc(MEMORY[0x1E0CEA9D8]);
      springMass = self->_springMass;
      springStiffness = self->_springStiffness;
      springDamping = self->_springDamping;
    }
    v9 = (id)objc_msgSend(v3, "initWithMass:stiffness:damping:initialVelocity:", springMass, springStiffness, springDamping, 0.0, 0.0);
LABEL_8:
    v10 = v9;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:timingParameters:", v9, self->_duration);

    return (UIViewPropertyAnimator *)v7;
  }
  v7 = 0;
  return (UIViewPropertyAnimator *)v7;
}

- (id)description
{
  int64_t animationType;
  double springMass;
  uint64_t v5;

  animationType = self->_animationType;
  if (animationType == 2)
    return CFSTR("inheritedAnimation");
  if (animationType == 1)
  {
    springMass = self->_springMass;
    if (springMass == 0.0)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<animated, duration=%.2f, curve=%ld>"), *(_QWORD *)&self->_duration, self->_animationCurve, v5);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<animated, mass=%.4f, stiffness=%.4f, damping=%.4f>"), *(_QWORD *)&springMass, *(_QWORD *)&self->_springStiffness, *(_QWORD *)&self->_springDamping);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (animationType)
  {
    return 0;
  }
  else
  {
    return CFSTR("unanimated");
  }
}

- (unint64_t)hash
{
  int64_t animationType;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  animationType = self->_animationType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ animationType ^ self->_animationCurve;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_springMass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_springStiffness);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_springDamping);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqualToAnimationProperties:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = self->_animationType == *((_QWORD *)v4 + 1)
    && self->_duration == v4[2]
    && self->_animationCurve == *((_QWORD *)v4 + 3)
    && self->_springMass == v4[4]
    && self->_springStiffness == v4[5]
    && self->_springDamping == v4[6];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CKScrollViewAnimationProperties isEqualToAnimationProperties:](self, "isEqualToAnimationProperties:", v4);

  return v5;
}

- (void)performAnimationBlock:(id)a3
{
  id v4;
  void *v5;
  int64_t animationType;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  animationType = self->_animationType;
  switch(animationType)
  {
    case 2:
      v8 = v4;
      (*((void (**)(id))v4 + 2))(v4);
      goto LABEL_7;
    case 1:
      v8 = v4;
      -[CKScrollViewAnimationProperties propertyAnimator](self, "propertyAnimator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimations:", v8);
      objc_msgSend(v7, "startAnimation");

      goto LABEL_7;
    case 0:
      v8 = v4;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
LABEL_7:
      v5 = v8;
      break;
  }

}

- (int64_t)animationType
{
  return self->_animationType;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (void)setAnimationCurve:(int64_t)a3
{
  self->_animationCurve = a3;
}

- (double)springMass
{
  return self->_springMass;
}

- (void)setSpringMass:(double)a3
{
  self->_springMass = a3;
}

- (double)springStiffness
{
  return self->_springStiffness;
}

- (void)setSpringStiffness:(double)a3
{
  self->_springStiffness = a3;
}

- (double)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(double)a3
{
  self->_springDamping = a3;
}

@end

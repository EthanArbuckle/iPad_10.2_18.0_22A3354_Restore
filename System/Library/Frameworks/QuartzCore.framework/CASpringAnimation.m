@implementation CASpringAnimation

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 369)
  {
    if (v5 != 578)
    {
      if (v5 == 527)
      {
        v6 = (void *)MEMORY[0x1E0CB37E8];
        v7 = 100;
        return (id)objc_msgSend(v6, "numberWithInt:", v7);
      }
      if (v5 == 370)
      {
        v6 = (void *)MEMORY[0x1E0CB37E8];
        v7 = 1;
        return (id)objc_msgSend(v6, "numberWithInt:", v7);
      }
      goto LABEL_14;
    }
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 0.0;
    return (id)objc_msgSend(v8, "numberWithDouble:", v9);
  }
  if (v5 == 18)
    return (id)*MEMORY[0x1E0C9AE40];
  if (v5 == 159)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 10.0;
    return (id)objc_msgSend(v8, "numberWithDouble:", v9);
  }
LABEL_14:
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___CASpringAnimation;
  return objc_msgSendSuper2(&v11, sel_defaultValueForKey_, a3);
}

- (void)setDamping:(CGFloat)damping
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (damping < 0.0)
  {
    NSLog(CFSTR("CoreAnimation: damping must be greater than or equal to 0."), a2);
    damping = 10.0;
  }
  *(CGFloat *)v4 = damping;
  CAAnimation_setter((uint64_t)self, (const void *)0x9F, 18, (unsigned __int8 *)v4);
}

- (void)setStiffness:(CGFloat)stiffness
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (stiffness <= 0.0)
  {
    NSLog(CFSTR("CoreAnimation: stiffness must be greater than 0."), a2);
    stiffness = 100.0;
  }
  *(CGFloat *)v4 = stiffness;
  CAAnimation_setter((uint64_t)self, (const void *)0x20F, 18, (unsigned __int8 *)v4);
}

- (void)setMass:(CGFloat)mass
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (mass <= 0.0)
  {
    NSLog(CFSTR("CoreAnimation: mass must be greater than 0."), a2);
    mass = 1.0;
  }
  *(CGFloat *)v4 = mass;
  CAAnimation_setter((uint64_t)self, (const void *)0x172, 18, (unsigned __int8 *)v4);
}

- (void)setVelocity:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x242, 18, (unsigned __int8 *)v3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xF0uLL, 0x743898A5uLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    v8 = (unsigned int *)(v6 + 8);
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((_QWORD *)v6 + 9) = 0;
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_OWORD *)v6 + 6) = 0u;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_QWORD *)v6 + 18) = 0;
    *((_DWORD *)v6 + 3) = 48;
    ++dword_1ECDC7CE8;
    *(_QWORD *)v6 = off_1E1597890;
    *(_OWORD *)(v6 + 152) = xmmword_18474E630;
    *(_OWORD *)(v6 + 168) = xmmword_18474E640;
    if (!-[CASpringAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 == 1)
        (*(void (**)(char *))(*(_QWORD *)v7 + 16))(v7);
      return 0;
    }
  }
  else
  {
    -[CASpringAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return animation_property_flags((__CFString *)-[CAPropertyAnimation keyPath](self, "keyPath"), (CALayer *)a3);
}

- (double)_timeFunction:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CASpringAnimation mass](self, "mass", 0, 0, 0, 0, 0, 0);
  v6 = v5;
  -[CASpringAnimation stiffness](self, "stiffness");
  v8 = v7;
  -[CASpringAnimation damping](self, "damping");
  v10 = v9;
  -[CASpringAnimation velocity](self, "velocity");
  CA::Render::SpringAnimation::State::update((uint64_t)&v14, v6, v8, v10, v11, -[CASpringAnimation allowsOverdamping](self, "allowsOverdamping"));
  -[CAAnimation duration](self, "duration");
  return CA::Render::SpringAnimation::State::eval((CA::Render::SpringAnimation::State *)&v14, v12 * a3);
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CASpringAnimation;
  v6 = -[CABasicAnimation _setCARenderAnimation:layer:](&v12, sel__setCARenderAnimation_layer_, a3, a4);
  if (v6)
  {
    -[CASpringAnimation mass](self, "mass");
    *((_QWORD *)a3 + 19) = v7;
    -[CASpringAnimation stiffness](self, "stiffness");
    *((_QWORD *)a3 + 20) = v8;
    -[CASpringAnimation damping](self, "damping");
    *((_QWORD *)a3 + 21) = v9;
    -[CASpringAnimation velocity](self, "velocity");
    *((_QWORD *)a3 + 22) = v10;
    *((_BYTE *)a3 + 184) = -[CASpringAnimation allowsOverdamping](self, "allowsOverdamping");
  }
  return v6;
}

- (double)durationForEpsilon:(double)a3
{
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
  long double v15;
  double v16;
  double i;
  double v18;
  double v19;
  BOOL v20;
  double v22;
  float v23;
  __int128 v25;
  __int128 v26;
  double v27[3];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  *(_OWORD *)v27 = 0u;
  v25 = 0u;
  -[CASpringAnimation mass](self, "mass");
  v6 = v5;
  -[CASpringAnimation stiffness](self, "stiffness");
  v8 = v7;
  -[CASpringAnimation damping](self, "damping");
  v10 = v9;
  -[CASpringAnimation velocity](self, "velocity");
  CA::Render::SpringAnimation::State::update((uint64_t)&v25, v6, v8, v10, v11, -[CASpringAnimation allowsOverdamping](self, "allowsOverdamping"));
  v12 = *((double *)&v25 + 1);
  if (*((double *)&v25 + 1) == 0.0)
  {
    v13 = INFINITY;
  }
  else
  {
    v14 = fmax(a3, 0.000001);
    if (*((double *)&v25 + 1) >= 1.0)
    {
      v13 = -1.0;
      v16 = INFINITY;
      for (i = 0.0; ; i = i + 0.1)
      {
        v18 = CA::Render::SpringAnimation::State::eval((CA::Render::SpringAnimation::State *)&v25, i);
        v19 = fabs(1.0 - v18);
        v20 = (unint64_t)(*(_QWORD *)&v19 - 0x10000000000000) >> 53 > 0x3FE
           && (unint64_t)(*(_QWORD *)&v19 - 1) > 0xFFFFFFFFFFFFELL;
        if (v20 && COERCE__INT64(1.0 - v18) != 0)
          break;
        v22 = vabdd_f64(1.0, v18);
        if (v16 >= v14)
        {
          if (v22 < v16)
          {
            v13 = i;
            v16 = v22;
          }
        }
        else if (v22 >= v14)
        {
          v16 = INFINITY;
        }
        else if (i - v13 > 1.0)
        {
          goto LABEL_22;
        }
      }
      v13 = 0.0;
    }
    else
    {
      v15 = log(v14 / (fabs(v27[0]) + fabs(*((double *)&v26 + 1))));
      v13 = fmax(-v15 / (*(double *)&v25 * v12), 0.0);
    }
  }
LABEL_22:
  -[CAAnimation speed](self, "speed");
  if (v23 == 0.0)
    return 3.40282347e38;
  else
    return fmin(fabs(v13 / v23), 3.40282347e38);
}

- (double)velocity
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 578, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)stiffness
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 527, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)mass
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 370, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)damping
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 159, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (BOOL)allowsOverdamping
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 18, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CFTimeInterval)settlingDuration
{
  CFTimeInterval result;

  -[CASpringAnimation durationForEpsilon:](self, "durationForEpsilon:", 0.001);
  return result;
}

- (void)setAllowsOverdamping:(BOOL)allowsOverdamping
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = allowsOverdamping;
  CAAnimation_setter((uint64_t)self, (const void *)0x12, 7, (unsigned __int8 *)&v3);
}

- (CASpringAnimation)initWithPerceptualDuration:(CFTimeInterval)perceptualDuration bounce:(CGFloat)bounce
{
  CASpringAnimation *v6;
  CASpringAnimation *v7;
  double v8;
  double v9;

  v6 = -[CASpringAnimation init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[CASpringAnimation setAllowsOverdamping:](v6, "setAllowsOverdamping:", 1);
    if (perceptualDuration <= 0.0)
      v8 = INFINITY;
    else
      v8 = 6.28318531 / perceptualDuration * (6.28318531 / perceptualDuration);
    -[CASpringAnimation setStiffness:](v7, "setStiffness:", v8);
    if (bounce >= 0.0)
      v9 = 1.0 - bounce;
    else
      v9 = 1.0 / (bounce + 1.0);
    -[CASpringAnimation setDamping:](v7, "setDamping:", v9 * 12.5663706 / perceptualDuration);
    -[CASpringAnimation settlingDuration](v7, "settlingDuration");
    -[CAAnimation setDuration:](v7, "setDuration:");
  }
  return v7;
}

- (CFTimeInterval)perceptualDuration
{
  double v3;
  double v4;
  uint64_t v5;
  CFTimeInterval result;
  double v7;

  -[CASpringAnimation stiffness](self, "stiffness");
  v4 = v3;
  v5 = *(_QWORD *)&v3 & 0x7FFFFFFFFFFFFFFFLL;
  result = 0.0;
  if (v5 <= 0x7FEFFFFFFFFFFFFFLL)
  {
    -[CASpringAnimation mass](self, "mass", 0.0);
    return sqrt(v7 / v4) * 6.28318531;
  }
  return result;
}

- (CGFloat)bounce
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

  -[CASpringAnimation damping](self, "damping");
  v4 = v3;
  -[CASpringAnimation mass](self, "mass");
  v6 = v5;
  -[CASpringAnimation stiffness](self, "stiffness");
  v8 = v7;
  -[CASpringAnimation perceptualDuration](self, "perceptualDuration");
  v10 = v9 * v4 / (v6 * 12.5663706);
  v11 = sqrt(v8 * v6);
  if (v4 / (v11 + v11) <= 1.0)
    return 1.0 - v10;
  else
    return 1.0 / v10 + -1.0;
}

- (float)_solveForInput:(float)a3
{
  double v3;

  -[CASpringAnimation _timeFunction:](self, "_timeFunction:", a3);
  return v3;
}

@end

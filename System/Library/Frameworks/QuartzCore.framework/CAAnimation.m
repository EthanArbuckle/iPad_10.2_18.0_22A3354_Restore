@implementation CAAnimation

- (NSString)beginTimeMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 56, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setBeginTimeMode:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x38, 3, (unsigned __int8 *)v3);
}

- (void)dealloc
{
  CA::Transaction *v3;
  int v4;
  CA::AttrList *attr;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_attr)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3)
      v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (CA::AttrList *)self->_attr;
    if (attr)
      CA::AttrList::free(attr, a2);
    self->_attr = 0;
    CA::Transaction::unlock(v3);
  }
  CAMediaTimingInvalidate((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)CAAnimation;
  -[CAAnimation dealloc](&v6, sel_dealloc);
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3;
  id result;

  v3 = CAInternAtom((const __CFString *)key, 1);
  if (v3 > 218)
  {
    if (v3 > 514)
    {
      if (v3 == 566)
        return CFSTR("fade");
      if (v3 == 515)
        goto LABEL_15;
    }
    else
    {
      if (v3 == 219)
        return CFSTR("removed");
      if (v3 == 455)
        return (id)*MEMORY[0x1E0C9AE50];
    }
    return 0;
  }
  if (v3 > 207)
  {
    if (v3 != 208)
    {
      if (v3 != 212)
        return 0;
LABEL_15:
      result = (id)+[CAAnimation defaultValueForKey:]::one;
      if (!+[CAAnimation defaultValueForKey:]::one)
      {
        result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
        +[CAAnimation defaultValueForKey:]::one = (uint64_t)result;
      }
      return result;
    }
    return (id)*MEMORY[0x1E0C9AE50];
  }
  if (v3 != 56)
  {
    if (v3 == 78)
      return CFSTR("linear");
    return 0;
  }
  return CFSTR("non-zero");
}

+ (BOOL)CA_encodesPropertyConditionally:(unsigned int)a3 type:(int)a4
{
  BOOL v4;

  v4 = a3 == 163;
  if (a4 == 4)
    v4 = 1;
  return a4 == 1 || v4;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && objc_opt_class() != (_QWORD)a3;
}

- (double)beginTime
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 55, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (float)speed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 515, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)repeatCount
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 458, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)autoreverses
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 47, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (double)repeatDuration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 459, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (double)timeOffset
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 547, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (NSString)fillMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 219, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setBeginTime:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x37, 18, (unsigned __int8 *)v3);
}

- (void)setTimingFunction:(CAMediaTimingFunction *)timingFunction
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = timingFunction;
  CAAnimation_setter((uint64_t)self, (const void *)0x224, 2, (unsigned __int8 *)v3);
}

- (void)setFillMode:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xDB, 3, (unsigned __int8 *)v3);
}

- (void)setDuration:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xBB, 18, (unsigned __int8 *)v3);
}

- (id)delegate
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 163, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (double)duration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 187, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setDefaultDuration:(double)a3
{
  double v5;

  -[CAAnimation duration](self, "duration");
  if (v5 <= 0.0)
    -[CAAnimation setDuration:](self, "setDuration:", a3);
}

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  objc_msgSend(a4, "addAnimation:forKey:", self, a3, a5);
}

- (CAAnimation)initWithCoder:(id)a3
{
  return (CAAnimation *)CAObject_initWithCoder(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CA::Transaction *v4;
  const void *v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  int v8;
  CA::AttrList *v9;
  CA::AttrList *attr;
  uint64_t v11;

  v4 = (CA::Transaction *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (v4)
  {
    v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7)
      v7 = (CA::Transaction *)CA::Transaction::create(v4);
    *((_DWORD *)v6 + 4) = 0;
    v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v9 = (CA::AttrList *)*((_QWORD *)v6 + 1);
    if (v9)
      CA::AttrList::free(v9, v5);
    attr = (CA::AttrList *)self->_attr;
    if (attr)
    {
      v11 = *((_QWORD *)attr + 1) & 7;
      if ((_DWORD)v11 == 7)
        attr = (CA::AttrList *)CA::AttrList::copy_(attr);
      else
        *((_QWORD *)attr + 1) = *((_QWORD *)attr + 1) & 0xFFFFFFFFFFFFFFF8 | (v11 + 1);
    }
    *((_QWORD *)v6 + 1) = attr;
    CA::Transaction::unlock(v7);
  }
  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  CAObject_setValueForKey(self, (objc_class *)+[CAAnimation superclass](CAAnimation, "superclass"), a3, (const __CFString *)a4);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  id v5;
  BOOL v6;

  os_unfair_lock_lock((os_unfair_lock_t)&-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::lock);
  v5 = (id)-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys;
  if (!-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys = (uint64_t)v5;
  }
  if ((objc_msgSend(v5, "containsObject:", a3) & 1) == 0)
  {
    if (!CAObject_CAMLTypeSupportedForKey((uint64_t)self, (const __CFString *)a3))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend((id)-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys, "addObject:", a3);
  }
  v6 = 1;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::lock);
  return v6;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAAnimation setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (void)setRepeatCount:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1CA, 17, (unsigned __int8 *)&v3);
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  CAMediaTimingFunction *v16;
  const double *v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  _BOOL4 v34;
  int v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  *((_QWORD *)a3 + 2) = self;
  v6 = CAMediaTimingCopyRenderTiming((unint64_t)self);
  if (v6)
  {
    v7 = (unsigned int *)*((_QWORD *)a3 + 5);
    if (v7 != (unsigned int *)v6)
    {
      if (v7)
      {
        v8 = v7 + 2;
        do
        {
          v9 = __ldaxr(v8);
          v10 = v9 - 1;
        }
        while (__stlxr(v10, v8));
        if (!v10)
          (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
      }
      v11 = (unsigned int *)(v6 + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 + 1, v11));
      v13 = v6;
      if (!v12)
      {
        v13 = 0;
        do
          v40 = __ldaxr(v11);
        while (__stlxr(v40 - 1, v11));
      }
      *((_QWORD *)a3 + 5) = v13;
    }
  }
  v14 = -[CAAnimation isEnabled](self, "isEnabled", v41, v42);
  if (-[CAAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"))
    v15 = v14 | 8;
  else
    v15 = v14;
  v16 = -[CAAnimation timingFunction](self, "timingFunction");
  if (v16)
  {
    -[CAMediaTimingFunction _getPoints:](v16, "_getPoints:", &v41);
    v18 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, &v41, v17);
    v19 = (unsigned int *)*((_QWORD *)a3 + 6);
    if (v19 != v18)
    {
      if (v19)
      {
        v20 = v19 + 2;
        do
        {
          v21 = __ldaxr(v20);
          v22 = v21 - 1;
        }
        while (__stlxr(v22, v20));
        if (!v22)
          (*(void (**)(unsigned int *))(*(_QWORD *)v19 + 16))(v19);
      }
      if (v18)
      {
        v23 = v18 + 2;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 + 1, v23));
        v25 = v18;
        if (!v24)
        {
          v25 = 0;
          do
            v26 = __ldaxr(v23);
          while (__stlxr(v26 - 1, v23));
        }
      }
      else
      {
        v25 = 0;
      }
      *((_QWORD *)a3 + 6) = v25;
    }
    if (v18)
    {
      v27 = v18 + 2;
      do
      {
        v28 = __ldaxr(v27);
        v29 = v28 - 1;
      }
      while (__stlxr(v29, v27));
      if (!v29)
        (*(void (**)(unsigned int *))(*(_QWORD *)v18 + 16))(v18);
    }
  }
  -[CAAnimation preferredFrameRateRange](self, "preferredFrameRateRange");
  *((_DWORD *)a3 + 6) = v30;
  *((_DWORD *)a3 + 7) = v31;
  *((_DWORD *)a3 + 8) = v32;
  if (CAHighFrameRateRestrictionEnabled(void)::once != -1)
    dispatch_once(&CAHighFrameRateRestrictionEnabled(void)::once, &__block_literal_global_4_14859);
  if (CAHighFrameRateRestrictionEnabled(void)::enabled)
  {
    v33 = -[CAAnimation highFrameRateReason](self, "highFrameRateReason");
    v15 |= 0x8000u;
    if (!v33)
    {
      if (CADeviceDisableMinimumFrameDurationOnPhone::once != -1)
        dispatch_once(&CADeviceDisableMinimumFrameDurationOnPhone::once, &__block_literal_global_103);
      if (CADeviceDisableMinimumFrameDurationOnPhone::disabled)
        v33 = 65537;
      else
        v33 = 0;
    }
    *((_DWORD *)a3 + 22) = v33;
  }
  if (byte_1ECDC6AC7)
  {
    *((int32x2_t *)a3 + 3) = vdup_n_s32(0x42F00000u);
    *((_DWORD *)a3 + 8) = 1123024896;
    if (!*((_DWORD *)a3 + 22))
      *((_DWORD *)a3 + 22) = 1;
  }
  v34 = -[CAAnimation discretizesTime](self, "discretizesTime");
  v35 = v15 | 0x80;
  if (!v34)
    v35 = v15;
  if (v35)
    *((_DWORD *)a3 + 3) |= v35 << 8;
  if (v6)
  {
    v36 = (unsigned int *)(v6 + 8);
    do
    {
      v37 = __ldaxr(v36);
      v38 = v37 - 1;
    }
    while (__stlxr(v38, v36));
    if (!v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
  }
  return 1;
}

- (unsigned)highFrameRateReason
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 253, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)isRemovedOnCompletion
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 455, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CAMediaTimingFunction)timingFunction
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 548, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CAMediaTimingFunction *)v3[0];
}

- (BOOL)isEnabled
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 208, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  CAFrameRateRange result;

  -[CAAnimation preferredFrameRateRangeMinimum](self, "preferredFrameRateRangeMinimum");
  v4 = v3;
  -[CAAnimation preferredFrameRateRangeMaximum](self, "preferredFrameRateRangeMaximum");
  v6 = v5;
  -[CAAnimation preferredFrameRateRangePreferred](self, "preferredFrameRateRangePreferred");
  v8 = v7;
  v9 = v4;
  v10 = v6;
  result.preferred = v8;
  result.maximum = v10;
  result.minimum = v9;
  return result;
}

- (float)preferredFrameRateRangePreferred
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 432, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)preferredFrameRateRangeMinimum
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 431, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)preferredFrameRateRangeMaximum
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 430, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)discretizesTime
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 179, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setDelegate:(id)delegate
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = delegate;
  CAAnimation_setter((uint64_t)self, (const void *)0xA3, 2, (unsigned __int8 *)v3);
}

- (void)setSpeed:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x203, 17, (unsigned __int8 *)&v3);
}

+ (CAAnimation)animation
{
  return (CAAnimation *)objc_alloc_init((Class)a1);
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = removedOnCompletion;
  CAAnimation_setter((uint64_t)self, (const void *)0x1C7, 7, (unsigned __int8 *)&v3);
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xFD, 12, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange
{
  float preferred;
  float maximum;
  float minimum;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  preferred = preferredFrameRateRange.preferred;
  maximum = preferredFrameRateRange.maximum;
  minimum = preferredFrameRateRange.minimum;
  if (!CAFrameRateRangeIsValid(preferredFrameRateRange.minimum, preferredFrameRateRange.maximum, preferredFrameRateRange.preferred))
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)"), minimum, maximum, preferred);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  *(float *)&v7 = minimum;
  -[CAAnimation setPreferredFrameRateRangeMinimum:](self, "setPreferredFrameRateRangeMinimum:", v7);
  *(float *)&v8 = maximum;
  -[CAAnimation setPreferredFrameRateRangeMaximum:](self, "setPreferredFrameRateRangeMaximum:", v8);
  *(float *)&v9 = preferred;
  -[CAAnimation setPreferredFrameRateRangePreferred:](self, "setPreferredFrameRateRangePreferred:", v9);
}

- (void)setPreferredFrameRateRangeMaximum:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1AE, 17, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRangeMinimum:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1AF, 17, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRangePreferred:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1B0, 17, (unsigned __int8 *)&v3);
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return CAObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (id)CAMLTypeForKey:(id)a3
{
  return (id)CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 0);
}

+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 1);
}

- (void)setTimeOffset:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x223, 18, (unsigned __int8 *)v3);
}

- (id)valueForKey:(id)a3
{
  return CAObject_valueForKey(self, (objc_class *)+[CAAnimation superclass](CAAnimation, "superclass"), (const __CFString *)a3);
}

- (void)setAutoreverses:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x2F, 7, (unsigned __int8 *)&v3);
}

- (void)setFrameInterval:(double)a3
{
  double v3;
  double v4;

  v4 = a3;
  LODWORD(a3) = 0;
  if (v4 != 0.0)
  {
    v3 = 1.0;
    a3 = 1.0 / v4;
    v4 = round(1.0 / v4);
    LODWORD(a3) = 1.0;
    if (v4 >= 1.0)
      *(float *)&a3 = (float)(uint64_t)v4;
  }
  LODWORD(v4) = LODWORD(a3);
  LODWORD(v3) = LODWORD(a3);
  -[CAAnimation setPreferredFrameRateRange:](self, "setPreferredFrameRateRange:", a3, v4, v3);
}

- (id)valueForUndefinedKey:(id)a3
{
  CA::Transaction *v5;
  int v6;
  int v7;
  void *attr;
  int v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = CAInternAtom((const __CFString *)a3, 1);
  v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = self->_attr;
  if (attr)
  {
    v11[0] = 0;
    v9 = CA::AttrList::get((uint64_t)attr, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v11);
    CA::Transaction::unlock(v5);
    if (v9)
      return (id)v11[0];
    else
      return 0;
  }
  else
  {
    CA::Transaction::unlock(v5);
    return 0;
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  CA::Transaction *v6;
  const void *v7;
  int v8;
  CA::AttrList *attr;
  malloc_zone_t *malloc_zone;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v7 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  -[CAAnimation willChangeValueForKey:](self, "willChangeValueForKey:", a4, v11[0]);
  v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = (CA::AttrList *)self->_attr;
  if (!attr)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    attr = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
  }
  self->_attr = CA::AttrList::set(attr, v7, 2, (unsigned __int8 *)v11);
  CA::Transaction::unlock(v6);
  -[CAAnimation didChangeValueForKey:](self, "didChangeValueForKey:", a4);
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  CA::Transaction *v5;
  int v6;
  int v7;
  _DWORD *attr;
  BOOL v9;

  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = CAInternAtom((const __CFString *)key, 1);
  v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = self->_attr;
  if (attr)
  {
    while (1)
    {
      attr = *(_DWORD **)attr;
      v9 = attr != 0;
      if (!attr)
        break;
      if ((attr[2] & 0xFFFFFF) == v6)
      {
        v9 = 1;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  CA::Transaction::unlock(v5);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  CAObject_encodeWithCoder(self, a3);
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  CAObject_setValueForKeyPath(self, a3, a4);
}

- (id)debugDescription
{
  CA::Transaction *v3;
  __CFString *v4;
  objc_class *v5;
  int v6;
  CA::AttrList **attr;

  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v4 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (objc_class *)objc_opt_class();
  -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v5), self);
  v6 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = (CA::AttrList **)self->_attr;
  if (attr)
    CA::AttrList::append_description(*attr, v4);
  CA::Transaction::unlock(v3);
  -[__CFString appendString:](v4, "appendString:", CFSTR(">"));
  return v4;
}

- (void)setRepeatDuration:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1CB, 18, (unsigned __int8 *)v3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

- (Object)CA_copyRenderValue
{
  return (Object *)-[CAAnimation _copyRenderAnimationForLayer:](self, "_copyRenderAnimationForLayer:", 0);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  CAObject_encodeWithCAMLWriter(self, a3);
}

- (double)frameInterval
{
  float v2;

  -[CAAnimation preferredFrameRateRangePreferred](self, "preferredFrameRateRangePreferred");
  if ((uint64_t)v2)
    return 1.0 / (double)(uint64_t)v2;
  else
    return 0.0;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  double v3;
  double v4;
  double v5;

  *(float *)&v3 = (float)a3;
  *(float *)&v4 = (float)a3;
  *(float *)&v5 = (float)a3;
  -[CAAnimation setPreferredFrameRateRange:](self, "setPreferredFrameRateRange:", v3, v4, v5);
}

- (int64_t)preferredFramesPerSecond
{
  float v2;

  -[CAAnimation preferredFrameRateRangePreferred](self, "preferredFrameRateRangePreferred");
  return (uint64_t)v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xD0, 7, (unsigned __int8 *)&v3);
}

- (void)setDiscretizesTime:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xB3, 7, (unsigned __int8 *)&v3);
}

- (BOOL)isCompleteForTime:(double)a3
{
  int v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v4 = 0;
  return mapAnimationTime(self, v5, &v4) ^ 1;
}

@end

@implementation SCN_CAKeyframeAnimation

- (void)dealloc
{
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v4;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
  {
    CFRelease(c3dAnimation);
    self->_c3dAnimation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation dealloc](&v4, sel_dealloc);
}

- (void)_convertToCA
{
  __C3DKeyframedAnimation *c3dAnimation;
  CFTypeRef v4;
  uint64_t Controller;
  int ValueType;
  unsigned int KeyCount;
  void *v8;
  void *v9;
  _BOOL4 HasTCB;
  BOOL v11;
  unsigned int v12;
  float TensionAtIndex;
  float ContinuityAtIndex;
  float BiasAtIndex;
  void *v16;
  int v17;
  _DWORD *TimingFunctionAtIndex;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unsigned int v24;
  double v25;
  double KeyTimeAtIndex;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CFTypeRef v32;
  SCN_CAKeyframeAnimation *v33;
  __int128 __dst;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  self->_caReady = 1;
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
  {
    v4 = CFRetain(c3dAnimation);
    Controller = C3DKeyframedAnimationGetController((uint64_t)v4);
    ValueType = C3DKeyframeControllerGetValueType(Controller);
    KeyCount = C3DKeyframeControllerGetKeyCount(Controller);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", KeyCount);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", KeyCount);
    HasTCB = C3DKeyframeControllerHasTCB(Controller);
    if (KeyCount)
      v11 = !HasTCB;
    else
      v11 = 1;
    if (!v11)
    {
      v12 = 0;
      do
      {
        TensionAtIndex = C3DKeyframeControllerGetTensionAtIndex(Controller, v12);
        ContinuityAtIndex = C3DKeyframeControllerGetContinuityAtIndex(Controller, v12);
        BiasAtIndex = C3DKeyframeControllerGetBiasAtIndex(Controller, v12);
        objc_msgSend(0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", TensionAtIndex));
        objc_msgSend(0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ContinuityAtIndex));
        objc_msgSend(0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", BiasAtIndex));
        ++v12;
      }
      while (KeyCount != v12);
    }
    v36 = 0u;
    v37 = 0u;
    __dst = 0u;
    v35 = 0u;
    if (C3DKeyframeControllerHasTimingFunctions(Controller))
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", KeyCount - 1);
      if (KeyCount == 1)
      {
        *(float *)&v23 = C3DAnimationGetDuration((uint64_t)v4);
        goto LABEL_17;
      }
      v32 = v4;
      v33 = self;
      v17 = 0;
      do
      {
        TimingFunctionAtIndex = (_DWORD *)C3DKeyframeControllerGetTimingFunctionAtIndex(Controller, v17);
        LODWORD(v19) = *TimingFunctionAtIndex;
        LODWORD(v20) = TimingFunctionAtIndex[1];
        LODWORD(v21) = TimingFunctionAtIndex[2];
        LODWORD(v22) = TimingFunctionAtIndex[3];
        objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v20, v21, v22));
        ++v17;
      }
      while (KeyCount - 1 != v17);
      v4 = v32;
    }
    else
    {
      v16 = 0;
    }
    *(float *)&v23 = C3DAnimationGetDuration((uint64_t)v4);
    if (!KeyCount)
    {
LABEL_22:
      -[SCN_CAKeyframeAnimation setKeyTimes:](self, "setKeyTimes:", v8, v23, v32, v33, __dst, v35, v36, v37);
      -[SCN_CAKeyframeAnimation setValues:](self, "setValues:", v9);
      -[SCN_CAKeyframeAnimation setContinuityValues:](self, "setContinuityValues:", 0);
      -[SCN_CAKeyframeAnimation setTensionValues:](self, "setTensionValues:", 0);
      -[SCN_CAKeyframeAnimation setBiasValues:](self, "setBiasValues:", 0);
      -[SCN_CAKeyframeAnimation setTimingFunctions:](self, "setTimingFunctions:", v16);
      -[SCN_CAKeyframeAnimation setDuration:](self, "setDuration:", C3DKeyframeControllerGetDuration(Controller));
      CAPropertyAnimationSetupWithSCNAnimation(self, (uint64_t)v4);
LABEL_24:
      -[SCN_CAKeyframeAnimation setC3dAnimation:](self, "setC3dAnimation:", v4, v32, v33);
      CFRelease(v4);
      return;
    }
LABEL_17:
    v24 = 0;
    if (*(float *)&v23 == 0.0)
      *(float *)&v23 = 1.0;
    v25 = *(float *)&v23;
    while (1)
    {
      KeyTimeAtIndex = C3DKeyframeControllerGetKeyTimeAtIndex(Controller, v24);
      C3DKeyframeControllerGetValueAtIndex(Controller, v24, &__dst);
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", KeyTimeAtIndex / v25));
      v31 = SCNNSValueFromTypedBytes((float32x2_t *)&__dst, ValueType, v27, v28, v29, v30);
      if (!v31)
        break;
      objc_msgSend(v9, "addObject:", v31);
      if (KeyCount == ++v24)
        goto LABEL_22;
    }

    goto LABEL_24;
  }
}

- (void)_clearC3DCache
{
  __C3DKeyframedAnimation *c3dAnimation;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
    CFRelease(c3dAnimation);
  self->_c3dAnimation = 0;
}

- (id)values
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation values](&v4, sel_values);
}

- (void)setValues:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setValues:](&v5, sel_setValues_, a3);
}

- (id)keyTimes
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation keyTimes](&v4, sel_keyTimes);
}

- (void)setKeyTimes:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setKeyTimes:](&v5, sel_setKeyTimes_, a3);
}

- (id)timingFunctions
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation timingFunctions](&v4, sel_timingFunctions);
}

- (void)setTimingFunctions:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setTimingFunctions:](&v5, sel_setTimingFunctions_, a3);
}

- (id)tensionValues
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation tensionValues](&v4, sel_tensionValues);
}

- (void)setTensionValues:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setTensionValues:](&v5, sel_setTensionValues_, a3);
}

- (id)continuityValues
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation continuityValues](&v4, sel_continuityValues);
}

- (void)setContinuityValues:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setContinuityValues:](&v5, sel_setContinuityValues_, a3);
}

- (id)biasValues
{
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation biasValues](&v4, sel_biasValues);
}

- (void)setBiasValues:(id)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setBiasValues:](&v5, sel_setBiasValues_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  CFTypeRef *Copy;
  objc_super v7;

  if (self->_caReady || !self->_c3dAnimation)
  {
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    return -[SCN_CAKeyframeAnimation copyWithZone:](&v7, sel_copyWithZone_, a3);
  }
  else
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    Copy = C3DAnimationCreateCopy(self->_c3dAnimation);
    objc_msgSend(v4, "setC3dAnimation:", Copy);
    CFRelease(Copy);
    objc_msgSend(v4, "setKeyPath:", -[SCN_CAKeyframeAnimation keyPath](self, "keyPath"));
    objc_msgSend(v4, "setDelegate:", -[SCN_CAKeyframeAnimation delegate](self, "delegate"));
  }
  return v4;
}

- (id)description
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  if (self->_caReady)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCN_CAKeyframeAnimation;
    return -[SCN_CAKeyframeAnimation description](&v6, sel_description);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[SCN_CAKeyframeAnimation duration](self, "duration");
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("SCN_CAKeyframeAnimation %p (duration=%f, keyPath:%@)"), self, v5, -[SCN_CAKeyframeAnimation keyPath](self, "keyPath"));
  }
}

- (__C3DKeyframedAnimation)c3dAnimation
{
  return self->_c3dAnimation;
}

- (void)setC3dAnimation:(__C3DKeyframedAnimation *)a3
{
  __C3DKeyframedAnimation *c3dAnimation;
  __C3DKeyframedAnimation *v6;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation != a3)
  {
    if (c3dAnimation)
    {
      CFRelease(c3dAnimation);
      self->_c3dAnimation = 0;
    }
    if (a3)
      v6 = (__C3DKeyframedAnimation *)CFRetain(a3);
    else
      v6 = 0;
    self->_c3dAnimation = v6;
  }
}

- (void)setDuration:(double)a3
{
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  float v7;
  float v8;
  objc_super v9;

  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      v7 = a3;
      C3DAnimationSetDuration((uint64_t)c3dAnimation, v7);
    }
  }
  else if (c3dAnimation)
  {
    v8 = a3;
    C3DAnimationSetDuration((uint64_t)c3dAnimation, v8);
    return;
  }
  v9.receiver = self;
  v9.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setDuration:](&v9, sel_setDuration_, a3);
}

- (double)duration
{
  double result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetDuration((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation duration](&v3, sel_duration);
  return result;
}

- (void)setKeyPath:(id)a3
{
  const __CFString *v5;
  objc_super v6;

  if (!self->_c3dAnimation)
    goto LABEL_5;
  v5 = C3DCreatePathComponentsFromString((const __CFString *)a3);
  C3DAnimationSetKeyPath((uint64_t)self->_c3dAnimation, v5);
  if (v5)
    CFRelease(v5);
  if (self->_caReady)
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)SCN_CAKeyframeAnimation;
    -[SCN_CAKeyframeAnimation setKeyPath:](&v6, sel_setKeyPath_, a3);
  }
}

- (id)keyPath
{
  __C3DKeyframedAnimation *c3dAnimation;
  const __CFArray *KeyPath;
  objc_super v6;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
  {
    KeyPath = (const __CFArray *)C3DAnimationGetKeyPath((uint64_t)c3dAnimation);
    if (KeyPath)
      return C3DCreatePathFromComponents(KeyPath);
  }
  v6.receiver = self;
  v6.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation keyPath](&v6, sel_keyPath);
}

- (void)setRepeatCount:(float)a3
{
  __C3DKeyframedAnimation *c3dAnimation;
  double v6;
  objc_super v7;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
    C3DAnimationSetRepeatCount((uint64_t)c3dAnimation, a3);
  if (self->_caReady)
  {
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    *(float *)&v6 = a3;
    -[SCN_CAKeyframeAnimation setRepeatCount:](&v7, sel_setRepeatCount_, v6);
  }
}

- (float)repeatCount
{
  float result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetRepeatCount((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation repeatCount](&v3, sel_repeatCount);
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  objc_super v5;

  if (self->_c3dAnimation)
    -[SCN_CAKeyframeAnimation _clearC3DCache](self, "_clearC3DCache");
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setRepeatDuration:](&v5, sel_setRepeatDuration_, a3);
}

- (double)repeatDuration
{
  double result;
  objc_super v4;

  if (!self->_caReady)
    -[SCN_CAKeyframeAnimation _convertToCA](self, "_convertToCA");
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation repeatDuration](&v4, sel_repeatDuration);
  return result;
}

- (void)setAutoreverses:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetAutoreverses((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetAutoreverses((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setAutoreverses:](&v7, sel_setAutoreverses_, v3);
}

- (BOOL)autoreverses
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetAutoreverses((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation autoreverses](&v3, sel_autoreverses);
}

- (void)setTimeOffset:(double)a3
{
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetTimeOffset((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetTimeOffset((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setTimeOffset:](&v7, sel_setTimeOffset_, a3);
}

- (double)timeOffset
{
  double result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetTimeOffset((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation timeOffset](&v3, sel_timeOffset);
  return result;
}

- (void)setSpeed:(float)a3
{
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  double v7;
  objc_super v8;

  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetSpeed((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetSpeed((uint64_t)c3dAnimation, a3);
    return;
  }
  v8.receiver = self;
  v8.super_class = (Class)SCN_CAKeyframeAnimation;
  *(float *)&v7 = a3;
  -[SCN_CAKeyframeAnimation setSpeed:](&v8, sel_setSpeed_, v7);
}

- (float)speed
{
  float result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetSpeed((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation speed](&v3, sel_speed);
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  float v7;
  float v8;
  objc_super v9;

  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      v7 = a3;
      C3DAnimationSetFadeInDuration((uint64_t)c3dAnimation, v7);
    }
  }
  else if (c3dAnimation)
  {
    v8 = a3;
    C3DAnimationSetFadeInDuration((uint64_t)c3dAnimation, v8);
    return;
  }
  v9.receiver = self;
  v9.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation setFadeInDuration:](&v9, sel_setFadeInDuration_, a3);
}

- (double)fadeInDuration
{
  double result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetFadeInDuration((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation fadeInDuration](&v3, sel_fadeInDuration);
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  float v7;
  float v8;
  objc_super v9;

  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      v7 = a3;
      C3DAnimationSetFadeOutDuration((uint64_t)c3dAnimation, v7);
    }
  }
  else if (c3dAnimation)
  {
    v8 = a3;
    C3DAnimationSetFadeOutDuration((uint64_t)c3dAnimation, v8);
    return;
  }
  v9.receiver = self;
  v9.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation setFadeOutDuration:](&v9, sel_setFadeOutDuration_, a3);
}

- (double)fadeOutDuration
{
  double result;
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetFadeOutDuration((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation fadeOutDuration](&v3, sel_fadeOutDuration);
  return result;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetRemoveOnCompletion((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetRemoveOnCompletion((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setRemovedOnCompletion:](&v7, sel_setRemovedOnCompletion_, v3);
}

- (BOOL)isRemovedOnCompletion
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetRemoveOnCompletion((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation isRemovedOnCompletion](&v3, sel_isRemovedOnCompletion);
}

- (void)setCommitsOnCompletion:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetCommitWhenDone(c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetCommitWhenDone(c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation setCommitsOnCompletion:](&v7, sel_setCommitsOnCompletion_, v3);
}

- (BOOL)commitsOnCompletion
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetCommitWhenDone((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[CAAnimation commitsOnCompletion](&v3, sel_commitsOnCompletion);
}

- (void)setUsesSceneTimeBase:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetIsSceneTimeBased((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetIsSceneTimeBased((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation setUsesSceneTimeBase:](&v7, sel_setUsesSceneTimeBase_, v3);
}

- (BOOL)usesSceneTimeBase
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetIsSceneTimeBased((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[CAAnimation usesSceneTimeBase](&v3, sel_usesSceneTimeBase);
}

- (void)setFillMode:(id)a3
{
  __C3DKeyframedAnimation *c3dAnimation;
  char v6;
  char v7;
  objc_super v8;

  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      v6 = _CAToC3DFillMode((uint64_t)a3);
      C3DAnimationSetFillModeMask((uint64_t)c3dAnimation, v6);
    }
  }
  else if (c3dAnimation)
  {
    v7 = _CAToC3DFillMode((uint64_t)a3);
    C3DAnimationSetFillModeMask((uint64_t)c3dAnimation, v7);
    return;
  }
  v8.receiver = self;
  v8.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setFillMode:](&v8, sel_setFillMode_, a3);
}

- (id)fillMode
{
  int FillModeMask;
  objc_super v4;

  if (self->_c3dAnimation)
  {
    FillModeMask = C3DAnimationGetFillModeMask((uint64_t)self->_c3dAnimation);
    return (id)_C3DToCAFillMode(FillModeMask);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return -[SCN_CAKeyframeAnimation fillMode](&v4, sel_fillMode);
  }
}

- (void)setAnimationEvents:(id)a3
{
  __C3DKeyframedAnimation *c3dAnimation;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  objc_super v9;

  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      v6 = _CAToC3DAnimationEvents(a3);
      C3DAnimationSetAnimationEvents((uint64_t)c3dAnimation, v6);
    }
  }
  else if (c3dAnimation)
  {
    v7 = _CAToC3DAnimationEvents(a3);
    C3DAnimationSetAnimationEvents((uint64_t)c3dAnimation, v7);
    return;
  }
  v8 = (void *)objc_msgSend(a3, "copy");
  v9.receiver = self;
  v9.super_class = (Class)SCN_CAKeyframeAnimation;
  -[CAAnimation setAnimationEvents:](&v9, sel_setAnimationEvents_, v8);

}

- (id)animationEvents
{
  uint64_t AnimationEvents;
  objc_super v4;

  if (self->_c3dAnimation)
  {
    AnimationEvents = C3DAnimationGetAnimationEvents((uint64_t)self->_c3dAnimation);
    return _C3DToCAAnimationEvents(AnimationEvents);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return -[CAAnimation animationEvents](&v4, sel_animationEvents);
  }
}

- (void)setTimingFunction:(id)a3
{
  __C3DKeyframedAnimation *c3dAnimation;
  id v6;
  id v7;
  objc_super v8;

  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      v6 = C3DTimingFunctionFromCAMediaTimingFunction(a3);
      C3DAnimationSetTimingFunction((uint64_t)c3dAnimation, v6);
    }
  }
  else if (c3dAnimation)
  {
    v7 = C3DTimingFunctionFromCAMediaTimingFunction(a3);
    C3DAnimationSetTimingFunction((uint64_t)c3dAnimation, v7);
    return;
  }
  v8.receiver = self;
  v8.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setTimingFunction:](&v8, sel_setTimingFunction_, a3);
}

- (id)timingFunction
{
  id result;
  objc_super v3;

  if (self->_c3dAnimation)
  {
    result = (id)C3DAnimationGetTimingFunction((uint64_t)self->_c3dAnimation);
    if (result)
      return (id)CAMediaTimingFunctionFromC3DTimingFunction((uint64_t)result);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SCN_CAKeyframeAnimation;
    return -[SCN_CAKeyframeAnimation timingFunction](&v3, sel_timingFunction);
  }
  return result;
}

- (void)setAdditive:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetAdditive((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetAdditive((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setAdditive:](&v7, sel_setAdditive_, v3);
}

- (BOOL)isAdditive
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetAdditive((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation isAdditive](&v3, sel_isAdditive);
}

- (void)setCumulative:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 caReady;
  __C3DKeyframedAnimation *c3dAnimation;
  objc_super v7;

  v3 = a3;
  caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
      C3DAnimationSetCumulative((uint64_t)c3dAnimation, a3);
  }
  else if (c3dAnimation)
  {
    C3DAnimationSetCumulative((uint64_t)c3dAnimation, a3);
    return;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCN_CAKeyframeAnimation;
  -[SCN_CAKeyframeAnimation setCumulative:](&v7, sel_setCumulative_, v3);
}

- (BOOL)isCumulative
{
  objc_super v3;

  if (self->_c3dAnimation)
    return C3DAnimationGetCumulative((uint64_t)self->_c3dAnimation);
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  return -[SCN_CAKeyframeAnimation isCumulative](&v3, sel_isCumulative);
}

- (void)encodeWithCoder:(id)a3
{
  const void *c3dAnimation;
  void *v6;
  float v7;
  float v8;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation || (c3dAnimation = CAAnimationToC3DAnimation(self, 0)) != 0)
  {
    v6 = (void *)C3DCopyPropertyList(c3dAnimation, 0, 0, 0);
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("c3dAnimation"));

  }
  -[SCN_CAKeyframeAnimation duration](self, "duration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("duration"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation keyPath](self, "keyPath"), CFSTR("keyPath"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isCumulative](self, "isCumulative"), CFSTR("cumulative"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isAdditive](self, "isAdditive"), CFSTR("additive"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation timingFunction](self, "timingFunction"), CFSTR("timingFunction"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation fillMode](self, "fillMode"), CFSTR("fillMode"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), CFSTR("usesSceneTimeBase"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation commitsOnCompletion](self, "commitsOnCompletion"), CFSTR("commitsOnCompletion"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"), CFSTR("removedOnCompletion"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation autoreverses](self, "autoreverses"), CFSTR("autoreverses"));
  -[SCN_CAKeyframeAnimation fadeInDuration](self, "fadeInDuration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fadeInDuration"));
  -[SCN_CAKeyframeAnimation fadeOutDuration](self, "fadeOutDuration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fadeOutDuration"));
  -[SCN_CAKeyframeAnimation speed](self, "speed");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speed"), v7);
  -[SCN_CAKeyframeAnimation timeOffset](self, "timeOffset");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeOffset"));
  -[SCN_CAKeyframeAnimation repeatCount](self, "repeatCount");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("repeatCount"), v8);
}

- (SCN_CAKeyframeAnimation)initWithCoder:(id)a3
{
  SCN_CAKeyframeAnimation *v4;
  _BOOL8 v5;
  uint64_t v6;
  const void *v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCN_CAKeyframeAnimation;
  v4 = -[SCN_CAKeyframeAnimation init](&v11, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("c3dAnimation"));
    v7 = (const void *)C3DKeyframedAnimationCreate();
    if ((C3DInitWithPropertyList(v7, v6, 0, 0) & 1) != 0)
    {
      -[SCN_CAKeyframeAnimation setC3dAnimation:](v4, "setC3dAnimation:", v7);
      if (v7)
        CFRelease(v7);
      -[SCN_CAKeyframeAnimation setKeyPath:](v4, "setKeyPath:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath")));
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("duration"));
      -[SCN_CAKeyframeAnimation setDuration:](v4, "setDuration:");
      -[SCN_CAKeyframeAnimation setCumulative:](v4, "setCumulative:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cumulative")));
      -[SCN_CAKeyframeAnimation setAdditive:](v4, "setAdditive:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("additive")));
      -[SCN_CAKeyframeAnimation setTimingFunction:](v4, "setTimingFunction:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timingFunction")));
      -[SCN_CAKeyframeAnimation setFillMode:](v4, "setFillMode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fillMode")));
      -[SCN_CAKeyframeAnimation setUsesSceneTimeBase:](v4, "setUsesSceneTimeBase:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesSceneTimeBase")));
      -[SCN_CAKeyframeAnimation setCommitsOnCompletion:](v4, "setCommitsOnCompletion:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("commitsOnCompletion")));
      -[SCN_CAKeyframeAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("removedOnCompletion")));
      -[SCN_CAKeyframeAnimation setAutoreverses:](v4, "setAutoreverses:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoreverses")));
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fadeInDuration"));
      -[SCN_CAKeyframeAnimation setFadeInDuration:](v4, "setFadeInDuration:");
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fadeOutDuration"));
      -[SCN_CAKeyframeAnimation setFadeOutDuration:](v4, "setFadeOutDuration:");
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speed"));
      *(float *)&v8 = v8;
      -[SCN_CAKeyframeAnimation setSpeed:](v4, "setSpeed:", v8);
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeOffset"));
      -[SCN_CAKeyframeAnimation setTimeOffset:](v4, "setTimeOffset:");
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("repeatCount"));
      *(float *)&v9 = v9;
      -[SCN_CAKeyframeAnimation setRepeatCount:](v4, "setRepeatCount:", v9);
      +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
    }
    else
    {
      if (v7)
        CFRelease(v7);

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

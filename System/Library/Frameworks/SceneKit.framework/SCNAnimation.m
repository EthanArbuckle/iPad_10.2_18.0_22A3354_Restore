@implementation SCNAnimation

+ (SCNAnimation)animationWithMDLTransform:(id)a3
{
  return +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", objc_msgSend(a3, "transformAnimation"));
}

- (void)dealloc
{
  __C3DAnimation *animationRef;
  id animationDidStart;
  id animationDidStop;
  __C3DAnimation *v6;
  objc_super v7;

  animationRef = self->_animationRef;
  if (animationRef)
    C3DEntitySetObjCWrapper((uint64_t)animationRef, 0);

  animationDidStart = self->_animationDidStart;
  if (animationDidStart)
    _Block_release(animationDidStart);
  animationDidStop = self->_animationDidStop;
  if (animationDidStop)
    _Block_release(animationDidStop);
  v6 = self->_animationRef;
  if (v6)
  {
    CFRelease(v6);
    self->_animationRef = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCNAnimation;
  -[SCNAnimation dealloc](&v7, sel_dealloc);
}

- (SCNAnimation)initWithC3DAnimation:(__C3DAnimation *)a3
{
  SCNAnimation *v4;
  SCNAnimation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNAnimation;
  v4 = -[SCNAnimation init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    -[SCNAnimation _setAnimationRef:](v4, "_setAnimationRef:", a3);
    -[SCNAnimation _syncObjCModel](v5, "_syncObjCModel");
    v5->_didMutate = 0;
  }
  return v5;
}

- (SCNAnimation)initWithCAAnimation:(id)a3
{
  SCNAnimation *v4;
  SCNAnimation *v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SCNAnimation;
  v4 = -[SCNAnimation init](&v27, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    v4->_userAnimation = (id)objc_msgSend(a3, "copy");
    objc_msgSend(a3, "duration");
    v5->_duration = v6;
    objc_msgSend(a3, "repeatCount");
    v5->_repeatCount = v7;
    v5->_autoreverses = objc_msgSend(a3, "autoreverses");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5->_additive = objc_msgSend(a3, "isAdditive");
      v5->_cumulative = objc_msgSend(a3, "isCumulative");
      v5->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "keyPath"), "copy");
    }
    v5->_removedOnCompletion = objc_msgSend(a3, "isRemovedOnCompletion");
    objc_msgSend(a3, "beginTime");
    v5->_beginTime = v8;
    objc_msgSend(a3, "timeOffset");
    v5->_timeOffset = v9;
    objc_msgSend(a3, "fadeInDuration");
    v5->_fadeInDuration = v10;
    objc_msgSend(a3, "fadeOutDuration");
    v5->_fadeOutDuration = v11;
    v5->_usesSceneTimeBase = objc_msgSend(a3, "usesSceneTimeBase");
    v12 = objc_msgSend(a3, "fillMode");
    v13 = *MEMORY[0x1E0CD2B58];
    if (v12 == *MEMORY[0x1E0CD2B58])
    {
      v15 = 1;
    }
    else
    {
      v14 = objc_msgSend(a3, "fillMode");
      v15 = v14 == *MEMORY[0x1E0CD2B60];
    }
    v5->_fillForward = v15;
    if (objc_msgSend(a3, "fillMode") == v13)
    {
      v17 = 1;
    }
    else
    {
      v16 = objc_msgSend(a3, "fillMode");
      v17 = v16 == *MEMORY[0x1E0CD2B50];
    }
    v5->_fillBackward = v17;
    if (v5->_animationEvents)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[SCNAnimation initWithCAAnimation:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    v5->_animationEvents = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "animationEvents"), "copy");
    v5->_timingFunction = +[SCNTimingFunction functionWithCAMediaTimingFunction:](SCNTimingFunction, "functionWithCAMediaTimingFunction:", objc_msgSend(a3, "timingFunction"));
    v5->_didMutate = 0;
  }
  return v5;
}

+ (SCNAnimation)animationWithC3DAnimation:(__C3DAnimation *)a3
{
  return -[SCNAnimation initWithC3DAnimation:]([SCNAnimation alloc], "initWithC3DAnimation:", a3);
}

- (void)_setAnimationRef:(__C3DAnimation *)a3
{
  __C3DAnimation *animationRef;
  __C3DAnimation *v6;

  animationRef = self->_animationRef;
  if (animationRef != a3)
  {
    if (animationRef)
    {
      CFRelease(animationRef);
      self->_animationRef = 0;
    }
    if (a3)
      v6 = (__C3DAnimation *)CFRetain(a3);
    else
      v6 = 0;
    self->_animationRef = v6;
  }
  if (a3)
    C3DEntitySetObjCWrapper((uint64_t)a3, self);
}

- (__C3DAnimation)animationRef
{
  return self->_animationRef;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  __C3DAnimation *animationRef;
  CFTypeRef *Copy;
  id animationDidStart;
  id animationDidStop;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[30] = 0;
  animationRef = self->_animationRef;
  if (animationRef)
  {
    Copy = C3DAnimationCreateCopy(animationRef);
    objc_msgSend(v4, "_setAnimationRef:", Copy);
    if (Copy)
      CFRelease(Copy);
  }
  *((_QWORD *)v4 + 8) = self->_timingFunction;
  *((_QWORD *)v4 + 9) = self->_animationEvents;
  animationDidStart = self->_animationDidStart;
  if (animationDidStart)
    *((_QWORD *)v4 + 12) = _Block_copy(animationDidStart);
  animationDidStop = self->_animationDidStop;
  if (animationDidStop)
    *((_QWORD *)v4 + 13) = _Block_copy(animationDidStop);
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_duration;
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_repeatCount;
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_timeOffset;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_beginTime;
  *((_BYTE *)v4 + 56) = self->_autoreverses;
  *((_BYTE *)v4 + 57) = self->_removedOnCompletion;
  *((_BYTE *)v4 + 58) = self->_applyOnCompletion;
  *((_BYTE *)v4 + 59) = self->_additive;
  *((_BYTE *)v4 + 60) = self->_cumulative;
  *((_BYTE *)v4 + 62) = self->_fillForward;
  *((_BYTE *)v4 + 63) = self->_fillBackward;
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_fadeInDuration;
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_fadeOutDuration;
  *((_BYTE *)v4 + 61) = self->_usesSceneTimeBase;
  *((_QWORD *)v4 + 17) = objc_msgSend(self->_userAnimation, "copy");
  *((_BYTE *)v4 + 144) = self->_didMutate;
  return v4;
}

- (void)_syncObjCModel
{
  void *v3;
  char FillModeMask;
  uint64_t AnimationEvents;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t TimingFunction;
  uint64_t v10;

  v3 = (void *)objc_msgSend((id)C3DAnimationGetKeyPath((uint64_t)self->_animationRef), "componentsJoinedByString:", CFSTR("."));

  self->_keyPath = (NSString *)v3;
  self->_duration = C3DAnimationGetDuration((uint64_t)self->_animationRef);
  self->_repeatCount = C3DAnimationGetRepeatCount((uint64_t)self->_animationRef);
  self->_autoreverses = C3DAnimationGetAutoreverses((uint64_t)self->_animationRef);
  self->_beginTime = C3DAnimationNodeGetPauseTime((uint64_t)self->_animationRef);
  self->_timeOffset = C3DAnimationGetTimeOffset((uint64_t)self->_animationRef);
  self->_fadeInDuration = C3DAnimationGetFadeInDuration((uint64_t)self->_animationRef);
  self->_fadeOutDuration = C3DAnimationGetFadeOutDuration((uint64_t)self->_animationRef);
  self->_removedOnCompletion = C3DAnimationGetRemoveOnCompletion((uint64_t)self->_animationRef);
  self->_usesSceneTimeBase = C3DAnimationGetIsSceneTimeBased((uint64_t)self->_animationRef);
  FillModeMask = C3DAnimationGetFillModeMask((uint64_t)self->_animationRef);
  self->_fillForward = FillModeMask & 1;
  self->_fillBackward = (FillModeMask & 2) != 0;
  AnimationEvents = C3DAnimationGetAnimationEvents((uint64_t)self->_animationRef);
  v6 = (NSArray *)_C3DToCAAnimationEvents(AnimationEvents);
  v7 = self->_animationEvents;
  if (v7 != v6)
  {
    v8 = v6;

    self->_animationEvents = v8;
  }
  TimingFunction = C3DAnimationGetTimingFunction((uint64_t)self->_animationRef);
  if (TimingFunction)
  {
    v10 = TimingFunction;

    self->_timingFunction = -[SCNTimingFunction initWithTimingFunctionRef:]([SCNTimingFunction alloc], "initWithTimingFunctionRef:", v10);
  }
  self->_applyOnCompletion = C3DAnimationGetCommitWhenDone((uint64_t)self->_animationRef);
  self->_additive = C3DAnimationGetAdditive((uint64_t)self->_animationRef);
  self->_cumulative = C3DAnimationGetCumulative((uint64_t)self->_animationRef);
}

- (void)encodeWithCoder:(id)a3
{
  __C3DAnimation *animationRef;
  CFTypeID v6;
  const __CFString *v7;
  NSObject *v8;
  CFStringRef v9;
  NSObject *v10;
  void *v11;

  animationRef = self->_animationRef;
  if (animationRef)
  {
    v6 = CFGetTypeID(animationRef);
    if (v6 == C3DSimpleAnimationGetTypeID())
    {
      v7 = CFSTR("basic");
    }
    else if (v6 == C3DKeyframedAnimationGetTypeID())
    {
      v7 = CFSTR("keyframe");
    }
    else if (v6 == C3DAnimationGroupGetTypeID())
    {
      v7 = CFSTR("group");
    }
    else
    {
      v9 = CFCopyTypeIDDescription(v6);
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SCNAnimation encodeWithCoder:].cold.2();
      CFRelease(v9);
      v7 = 0;
    }
    v11 = (void *)C3DCopyPropertyList(self->_animationRef, 0, 0, 0);
    objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("c3dAnimation"));
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("c3dAnimationType"));

  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNAnimation encodeWithCoder:].cold.1();
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimation keyPath](self, "keyPath"), CFSTR("keyPath"));
  -[SCNAnimation duration](self, "duration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("duration"));
  -[SCNAnimation repeatCount](self, "repeatCount");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("repeatCount"));
  -[SCNAnimation timeOffset](self, "timeOffset");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeOffset"));
  -[SCNAnimation startDelay](self, "startDelay");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("beginTime"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation autoreverses](self, "autoreverses"), CFSTR("autoreverses"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"), CFSTR("removedOnCompletion"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isAppliedOnCompletion](self, "isAppliedOnCompletion"), CFSTR("applyOnCompletion"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isAdditive](self, "isAdditive"), CFSTR("additive"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isCumulative](self, "isCumulative"), CFSTR("cumulative"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), CFSTR("usesSceneTimeBase"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation fillsForward](self, "fillsForward"), CFSTR("fillForward"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation fillsBackward](self, "fillsBackward"), CFSTR("fillBackward"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimation timingFunction](self, "timingFunction"), CFSTR("timingFunction"));
  -[SCNAnimation fadeInDuration](self, "fadeInDuration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fadeInDuration"));
  -[SCNAnimation fadeOutDuration](self, "fadeOutDuration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fadeOutDuration"));
  if (self->_userInfo)
  {
    os_unfair_lock_lock(&self->_userInfoLock);
    objc_msgSend(a3, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
    os_unfair_lock_unlock(&self->_userInfoLock);
  }
}

- (SCNAnimation)initWithCoder:(id)a3
{
  SCNAnimation *v4;
  SCNAnimation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  NSObject *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SCNAnimation;
  v4 = -[SCNAnimation init](&v13, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_userInfoLock._os_unfair_lock_opaque = 0;
  v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("c3dAnimation"));
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c3dAnimationType"));
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("basic")))
  {
    v8 = C3DSimpleAnimationCreate();
  }
  else if (v7 && !objc_msgSend(v7, "isEqualToString:", CFSTR("keyframe")))
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("group")))
    {
      v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SCNAnimation encodeWithCoder:].cold.2();
      v9 = 0;
      goto LABEL_8;
    }
    v8 = C3DAnimationGroupCreate();
  }
  else
  {
    v8 = C3DKeyframedAnimationCreate();
  }
  v9 = (const void *)v8;
LABEL_8:
  C3DInitWithPropertyList(v9, v6, 0, 0);
  -[SCNAnimation _setAnimationRef:](v5, "_setAnimationRef:", v9);
  CFRelease(v9);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNAnimation setKeyPath:](v5, "setKeyPath:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath")));
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("duration"));
  -[SCNAnimation setDuration:](v5, "setDuration:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("repeatCount"));
  -[SCNAnimation setRepeatCount:](v5, "setRepeatCount:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeOffset"));
  -[SCNAnimation setTimeOffset:](v5, "setTimeOffset:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("beginTime"));
  -[SCNAnimation setStartDelay:](v5, "setStartDelay:");
  -[SCNAnimation setAutoreverses:](v5, "setAutoreverses:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoreverses")));
  -[SCNAnimation setAppliedOnCompletion:](v5, "setAppliedOnCompletion:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("appliedOnCompletion")));
  -[SCNAnimation setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("removedOnCompletion")));
  -[SCNAnimation setAdditive:](v5, "setAdditive:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("additive")));
  -[SCNAnimation setCumulative:](v5, "setCumulative:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cumulative")));
  -[SCNAnimation setUsesSceneTimeBase:](v5, "setUsesSceneTimeBase:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesSceneTimeBase")));
  -[SCNAnimation setFillsForward:](v5, "setFillsForward:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("fillForward")));
  -[SCNAnimation setFillsBackward:](v5, "setFillsBackward:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("fillBackward")));
  -[SCNAnimation setTimingFunction:](v5, "setTimingFunction:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timingFunction")));
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fadeInDuration"));
  -[SCNAnimation setFadeInDuration:](v5, "setFadeInDuration:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fadeOutDuration"));
  -[SCNAnimation setFadeOutDuration:](v5, "setFadeOutDuration:");
  +[SCNTransaction commit](SCNTransaction, "commit");
  v10 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("userInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5->_userInfo = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
  v5->_didMutate = 0;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SCNAnimation)animationNamed:(NSString *)animationName
{
  void *v5;
  NSString *v6;
  NSString *v7;
  const __CFString *v8;
  SCNAnimation *result;

  v5 = (void *)SCNGetResourceBundle();
  v6 = -[NSString pathExtension](animationName, "pathExtension");
  v7 = -[NSString stringByDeletingPathExtension](animationName, "stringByDeletingPathExtension");
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("scna");
  result = (SCNAnimation *)objc_msgSend(v5, "URLForResource:withExtension:", v7, v8);
  if (result)
    return (SCNAnimation *)objc_msgSend(a1, "animationWithContentsOfURL:", result);
  return result;
}

+ (id)animationFromScene:(id)a3
{
  void *v4;
  void *v5;
  SCNAnimation *v6;
  SCNAnimation *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = (void *)objc_msgSend(a3, "rootNode");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__SCNAnimation_animationFromScene___block_invoke;
  v10[3] = &unk_1EA5A26E0;
  v10[4] = v4;
  v10[5] = &v11;
  objc_msgSend(v5, "enumerateHierarchyUsingBlock:", v10);
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      objc_msgSend(v8, "setAnimations:", v4);
      objc_msgSend(v8, "setDuration:", v12[3]);
      v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v8);
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __35__SCNAnimation_animationFromScene___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_msgSend(a2, "animationKeys", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(a2, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        objc_msgSend(v9, "duration");
        if (v10 >= v11)
          v11 = v10;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

+ (SCNAnimation)animationWithContentsOfURL:(NSURL *)animationUrl
{
  uint64_t v5;
  void *v6;
  void *v7;
  SCNAnimation *v8;
  NSObject *v9;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:");
  v12 = 0;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v8 = (SCNAnimation *)objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3)), v5, &v12);
  if (v12 && (v9 = scn_default_log(), os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
  {
    +[SCNAnimation animationWithContentsOfURL:].cold.1((uint64_t)animationUrl, &v12, v9);
    if (!v8)
      return v8;
  }
  else if (!v8)
  {
    return v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (SCNAnimation *)objc_msgSend(a1, "animationFromScene:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v8);
  return v8;
}

+ (SCNAnimation)animationWithCAAnimation:(CAAnimation *)caAnimation
{
  return -[SCNAnimation initWithCAAnimation:]([SCNAnimation alloc], "initWithCAAnimation:", caAnimation);
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  double v6;
  NSObject *v7;
  id v9;
  __n128 *v10;
  NSObject *v11;
  uint8_t v12[16];

  if (self->_animationRef || (v9 = -[SCNAnimation caAnimation](self, "caAnimation")) == 0)
  {
LABEL_2:
    -[SCNAnimation duration](self, "duration", a3);
    if (v6 == 0.0)
    {
      if (a4 == 0.0)
      {
        v7 = scn_default_log();
        a4 = 0.25;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1DCCB8000, v7, OS_LOG_TYPE_DEFAULT, "Warning: default duration is zero - using default transaction duration", v12, 2u);
        }
      }
      -[SCNAnimation setDuration:](self, "setDuration:", a4);
    }
    return;
  }
  v10 = CAAnimationToC3DAnimation(v9, a3);
  if (v10)
  {
    -[SCNAnimation _setAnimationRef:](self, "_setAnimationRef:", v10);
    -[SCNAnimation _syncObjCModel](self, "_syncObjCModel");
    goto LABEL_2;
  }
  v11 = scn_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SCNAnimation prepareWithTarget:implicitDuration:].cold.1();
}

- (id)userAnimation
{
  if (*((_QWORD *)self + 17))
    return (id)*((_QWORD *)self + 17);
  return self;
}

- (id)caAnimation
{
  _BOOL4 didMutate;
  id userAnimation;
  __C3DAnimation *animationRef;
  id v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v15;

  didMutate = self->_didMutate;
  self->_didMutate = 0;
  userAnimation = self->_userAnimation;
  if (!didMutate && userAnimation != 0)
    return userAnimation;
  objc_sync_enter(self);
  userAnimation = self->_caAnimationCache;
  objc_sync_exit(self);
  if (!didMutate && userAnimation != 0)
    return userAnimation;
  animationRef = self->_animationRef;
  if (animationRef)
  {
    userAnimation = C3DAnimationToCAAnimation(animationRef);
LABEL_21:
    objc_sync_enter(self);

    self->_caAnimationCache = userAnimation;
    objc_sync_exit(self);
    return userAnimation;
  }
  v8 = self->_userAnimation;
  if (v8)
  {
    userAnimation = (id)objc_msgSend(v8, "copy");
    -[SCNAnimation duration](self, "duration");
    objc_msgSend(userAnimation, "setDuration:");
    -[SCNAnimation repeatCount](self, "repeatCount");
    *(float *)&v9 = v9;
    objc_msgSend(userAnimation, "setRepeatCount:", v9);
    objc_msgSend(userAnimation, "setAutoreverses:", -[SCNAnimation autoreverses](self, "autoreverses"));
    -[SCNAnimation startDelay](self, "startDelay");
    objc_msgSend(userAnimation, "setBeginTime:");
    -[SCNAnimation timeOffset](self, "timeOffset");
    objc_msgSend(userAnimation, "setTimeOffset:");
    -[SCNAnimation fadeInDuration](self, "fadeInDuration");
    objc_msgSend(userAnimation, "setFadeInDuration:");
    -[SCNAnimation fadeOutDuration](self, "fadeOutDuration");
    objc_msgSend(userAnimation, "setFadeOutDuration:");
    objc_msgSend(userAnimation, "setRemovedOnCompletion:", -[SCNAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"));
    objc_msgSend(userAnimation, "setCommitsOnCompletion:", -[SCNAnimation isAppliedOnCompletion](self, "isAppliedOnCompletion"));
    objc_msgSend(userAnimation, "setUsesSceneTimeBase:", -[SCNAnimation usesSceneTimeBase](self, "usesSceneTimeBase"));
    v10 = -[SCNAnimation fillsForward](self, "fillsForward");
    v11 = -[SCNAnimation fillsBackward](self, "fillsBackward");
    v12 = (_QWORD *)MEMORY[0x1E0CD2B58];
    if (!v10)
      v12 = (_QWORD *)MEMORY[0x1E0CD2B50];
    v13 = (_QWORD *)MEMORY[0x1E0CD2B60];
    if (!v10)
      v13 = (_QWORD *)MEMORY[0x1E0CD2B68];
    if (!v11)
      v12 = v13;
    objc_msgSend(userAnimation, "setFillMode:", *v12);
    objc_msgSend(userAnimation, "setAnimationEvents:", -[SCNAnimation animationEvents](self, "animationEvents"));
    goto LABEL_21;
  }
  v15 = scn_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SCNAnimation caAnimation].cold.1();
  return 0;
}

- (void)__CFObject
{
  return self->_animationRef;
}

- (void)setKeyPath:(NSString *)keyPath
{
  _QWORD v5[6];

  self->_keyPath = (NSString *)-[NSString copy](keyPath, "copy");
  if (self->_animationRef)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__SCNAnimation_setKeyPath___block_invoke;
    v5[3] = &unk_1EA59F740;
    v5[4] = keyPath;
    v5[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
  }
}

void __27__SCNAnimation_setKeyPath___block_invoke(uint64_t a1)
{
  const __CFString *v2;

  v2 = C3DCreatePathComponentsFromString(*(const __CFString **)(a1 + 32));
  C3DAnimationSetKeyPath(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v2);
  if (v2)
    CFRelease(v2);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)_didMutate
{
  self->_didMutate = 1;
}

- (void)setDuration:(NSTimeInterval)duration
{
  _QWORD v5[6];

  if (self->_duration != duration)
  {
    self->_duration = duration;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __28__SCNAnimation_setDuration___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = duration;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

float __28__SCNAnimation_setDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DAnimationSetDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(CGFloat)repeatCount
{
  _QWORD v5[6];

  if (self->_repeatCount != repeatCount)
  {
    self->_repeatCount = repeatCount;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __31__SCNAnimation_setRepeatCount___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(CGFloat *)&v5[5] = repeatCount;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

float __31__SCNAnimation_setRepeatCount___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DAnimationSetRepeatCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (double)repeatDuration
{
  double v3;
  double v4;
  double v5;
  double result;

  -[SCNAnimation duration](self, "duration");
  v4 = v3;
  -[SCNAnimation repeatCount](self, "repeatCount");
  result = v4 * v5;
  if (self->_autoreverses)
    return result + result;
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  double duration;
  double v4;

  if (a3 != 0.0)
  {
    duration = self->_duration;
    if (duration != 0.0)
    {
      v4 = a3 / duration;
      if (self->_autoreverses)
        v4 = v4 * 0.5;
      -[SCNAnimation setRepeatCount:](self, "setRepeatCount:", v4);
    }
  }
}

- (NSTimeInterval)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(NSTimeInterval)timeOffset
{
  _QWORD v5[6];

  if (self->_timeOffset != timeOffset)
  {
    self->_timeOffset = timeOffset;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setTimeOffset___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = timeOffset;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __30__SCNAnimation_setTimeOffset___block_invoke(uint64_t a1)
{
  C3DAnimationSetTimeOffset(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (NSTimeInterval)startDelay
{
  return self->_beginTime;
}

- (void)setStartDelay:(NSTimeInterval)startDelay
{
  _QWORD v5[6];

  if (self->_beginTime != startDelay)
  {
    self->_beginTime = startDelay;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setStartDelay___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = startDelay;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __30__SCNAnimation_setStartDelay___block_invoke(uint64_t a1)
{
  C3DAnimationNodeSetPauseTime(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setAutoreverses:(BOOL)autoreverses
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_autoreverses != autoreverses)
  {
    self->_autoreverses = autoreverses;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__SCNAnimation_setAutoreverses___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = autoreverses;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __32__SCNAnimation_setAutoreverses___block_invoke(uint64_t a1)
{
  C3DAnimationSetAutoreverses(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)usesSceneTimeBase
{
  return self->_usesSceneTimeBase;
}

- (void)setUsesSceneTimeBase:(BOOL)usesSceneTimeBase
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_usesSceneTimeBase != usesSceneTimeBase)
  {
    self->_usesSceneTimeBase = usesSceneTimeBase;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __37__SCNAnimation_setUsesSceneTimeBase___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = usesSceneTimeBase;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __37__SCNAnimation_setUsesSceneTimeBase___block_invoke(uint64_t a1)
{
  C3DAnimationSetIsSceneTimeBased(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)fillsForward
{
  return self->_fillForward;
}

- (void)setFillsForward:(BOOL)fillsForward
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_fillForward != fillsForward)
  {
    self->_fillForward = fillsForward;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__SCNAnimation_setFillsForward___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = fillsForward;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __32__SCNAnimation_setFillsForward___block_invoke(uint64_t a1)
{
  char v2;

  v2 = C3DAnimationGetFillModeMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) & 0xFE | *(_BYTE *)(a1 + 40);
  C3DAnimationSetFillModeMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v2);
}

- (BOOL)fillsBackward
{
  return self->_fillBackward;
}

- (void)setFillsBackward:(BOOL)fillsBackward
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_fillBackward != fillsBackward)
  {
    self->_fillBackward = fillsBackward;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __33__SCNAnimation_setFillsBackward___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = fillsBackward;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __33__SCNAnimation_setFillsBackward___block_invoke(uint64_t a1)
{
  char v2;

  v2 = C3DAnimationGetFillModeMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) & 0xFD | (2 * *(_BYTE *)(a1 + 40));
  C3DAnimationSetFillModeMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v2);
}

- (SCNTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(SCNTimingFunction *)timingFunction
{
  SCNTimingFunction *v3;
  _QWORD v6[6];

  v3 = self->_timingFunction;
  if (v3 != timingFunction)
  {

    self->_timingFunction = timingFunction;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __34__SCNAnimation_setTimingFunction___block_invoke;
      v6[3] = &unk_1EA59F740;
      v6[4] = timingFunction;
      v6[5] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v6);
    }
  }
}

CFTypeRef __34__SCNAnimation_setTimingFunction___block_invoke(uint64_t a1)
{
  return C3DAnimationSetTimingFunction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "c3dTimingFunction"));
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_removedOnCompletion != removedOnCompletion)
  {
    self->_removedOnCompletion = removedOnCompletion;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __39__SCNAnimation_setRemovedOnCompletion___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = removedOnCompletion;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __39__SCNAnimation_setRemovedOnCompletion___block_invoke(uint64_t a1)
{
  C3DAnimationSetRemoveOnCompletion(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isAppliedOnCompletion
{
  return self->_applyOnCompletion;
}

- (void)setAppliedOnCompletion:(BOOL)appliedOnCompletion
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_applyOnCompletion != appliedOnCompletion)
  {
    self->_applyOnCompletion = appliedOnCompletion;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __39__SCNAnimation_setAppliedOnCompletion___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = appliedOnCompletion;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

uint64_t __39__SCNAnimation_setAppliedOnCompletion___block_invoke(uint64_t a1)
{
  return C3DAnimationSetCommitWhenDone(*(_WORD **)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNAnimationDidStartBlock)animationDidStart
{
  return self->_animationDidStart;
}

- (void)setAnimationDidStart:(SCNAnimationDidStartBlock)animationDidStart
{
  id v5;
  _QWORD v6[5];

  v5 = self->_animationDidStart;
  if (v5)
    _Block_release(v5);
  self->_animationDidStart = 0;
  if (animationDidStart)
    self->_animationDidStart = _Block_copy(animationDidStart);
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SCNAnimation_setAnimationDidStart___block_invoke;
    v6[3] = &unk_1EA59E4A0;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v6);
  }
}

_QWORD *__37__SCNAnimation_setAnimationDidStart___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = (_QWORD *)C3DAnimationGetAnimationCallbacks(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *result = SCNAnimationDidStart;
  return result;
}

- (SCNAnimationDidStopBlock)animationDidStop
{
  return self->_animationDidStop;
}

- (void)setAnimationDidStop:(SCNAnimationDidStopBlock)animationDidStop
{
  id v5;
  _QWORD v6[5];

  v5 = self->_animationDidStop;
  if (v5)
    _Block_release(v5);
  self->_animationDidStop = 0;
  if (animationDidStop)
    self->_animationDidStop = _Block_copy(animationDidStop);
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SCNAnimation_setAnimationDidStop___block_invoke;
    v6[3] = &unk_1EA59E4A0;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v6);
  }
}

uint64_t __36__SCNAnimation_setAnimationDidStop___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = C3DAnimationGetAnimationCallbacks(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(result + 8) = SCNAnimationDidStop;
  return result;
}

- (NSArray)animationEvents
{
  return self->_animationEvents;
}

- (void)setAnimationEvents:(NSArray *)animationEvents
{
  NSArray *v3;
  _QWORD v6[6];

  v3 = self->_animationEvents;
  if (v3 != animationEvents)
  {

    self->_animationEvents = animationEvents;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __35__SCNAnimation_setAnimationEvents___block_invoke;
      v6[3] = &unk_1EA59F740;
      v6[4] = self;
      v6[5] = animationEvents;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v6);
    }
  }
}

CFTypeRef __35__SCNAnimation_setAnimationEvents___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = _CAToC3DAnimationEvents(*(void **)(a1 + 40));
  return C3DAnimationSetAnimationEvents(v1, v2);
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (NSTimeInterval)blendInDuration
{
  return self->_fadeInDuration;
}

- (void)setBlendInDuration:(NSTimeInterval)blendInDuration
{
  _QWORD v5[6];

  if (self->_fadeInDuration != blendInDuration)
  {
    self->_fadeInDuration = blendInDuration;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __35__SCNAnimation_setBlendInDuration___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = blendInDuration;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

float __35__SCNAnimation_setBlendInDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DAnimationSetFadeInDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (NSTimeInterval)blendOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setBlendOutDuration:(NSTimeInterval)blendOutDuration
{
  _QWORD v5[6];

  if (self->_fadeOutDuration != blendOutDuration)
  {
    self->_fadeOutDuration = blendOutDuration;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __36__SCNAnimation_setBlendOutDuration___block_invoke;
      v5[3] = &unk_1EA59E450;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = blendOutDuration;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

float __36__SCNAnimation_setBlendOutDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DAnimationSetFadeOutDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (void)setAdditive:(BOOL)additive
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_additive != additive)
  {
    self->_additive = additive;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __28__SCNAnimation_setAdditive___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = additive;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __28__SCNAnimation_setAdditive___block_invoke(uint64_t a1)
{
  uint64_t TypeID;
  NSObject *v3;

  TypeID = C3DAnimationClusterGetTypeID();
  if (TypeID == CFGetTypeID(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __28__SCNAnimation_setAdditive___block_invoke_cold_1();
  }
  C3DAnimationSetAdditive(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isCumulative
{
  return self->_cumulative;
}

- (void)setCumulative:(BOOL)cumulative
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_cumulative != cumulative)
  {
    self->_cumulative = cumulative;
    -[SCNAnimation _didMutate](self, "_didMutate");
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setCumulative___block_invoke;
      v5[3] = &unk_1EA59E478;
      v5[4] = self;
      v6 = cumulative;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v5);
    }
  }
}

void __30__SCNAnimation_setCumulative___block_invoke(uint64_t a1)
{
  uint64_t TypeID;
  NSObject *v3;

  TypeID = C3DAnimationClusterGetTypeID();
  if (TypeID == CFGetTypeID(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __30__SCNAnimation_setCumulative___block_invoke_cold_1();
  }
  C3DAnimationSetCumulative(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  os_unfair_lock_s *p_userInfoLock;
  NSMutableDictionary *userInfo;

  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  userInfo = self->_userInfo;
  if (!a3 || userInfo)
  {
    if (!a3)
    {
      -[NSMutableDictionary removeObjectForKey:](userInfo, "removeObjectForKey:", a4);
      goto LABEL_7;
    }
  }
  else
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_userInfo = userInfo;
  }
  -[NSMutableDictionary setValue:forKey:](userInfo, "setValue:forKey:", a3, a4);
LABEL_7:
  os_unfair_lock_unlock(p_userInfoLock);
}

- (id)valueForUndefinedKey:(id)a3
{
  os_unfair_lock_s *p_userInfoLock;
  id v6;

  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  v6 = (id)-[NSMutableDictionary valueForKey:](self->_userInfo, "valueForKey:", a3);
  os_unfair_lock_unlock(p_userInfoLock);
  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  float duration;
  float repeatCount;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  duration = self->_duration;
  repeatCount = self->_repeatCount;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, keyPath=%@ duration=%f repeatCount=%f>"), v5, self, self->_keyPath, duration, repeatCount);
}

- (void)_optimizeKeyframesWithTarget:(id)a3
{
  __C3DAnimation *animationRef;
  NSObject *v5;
  uint8_t v6[16];

  -[SCNAnimation prepareWithTarget:implicitDuration:](self, "prepareWithTarget:implicitDuration:", a3, 0.0);
  animationRef = self->_animationRef;
  if (animationRef)
  {
    _optimizeKeyframes(animationRef);
    self->_didMutate = 1;

    self->_userAnimation = 0;
  }
  else
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DCCB8000, v5, OS_LOG_TYPE_DEFAULT, "Warning: failed to optimize keyframes", v6, 2u);
    }
  }
}

- (id)subAnimations
{
  __C3DAnimation *animationRef;
  CFTypeID v4;
  __C3DAnimation *v5;
  CFIndex AnimationCount;
  void *v7;
  CFIndex i;
  const void *AnimationAtIndex;
  CFTypeRef *Copy;

  animationRef = self->_animationRef;
  if (!animationRef)
    return 0;
  v4 = CFGetTypeID(animationRef);
  if (v4 != C3DAnimationGroupGetTypeID())
    return 0;
  v5 = self->_animationRef;
  AnimationCount = C3DAnimationGroupGetAnimationCount((uint64_t)v5);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", AnimationCount);
  if (AnimationCount >= 1)
  {
    for (i = 0; i != AnimationCount; ++i)
    {
      AnimationAtIndex = C3DAnimationGroupGetAnimationAtIndex((uint64_t)v5, i);
      Copy = C3DAnimationCreateCopy(AnimationAtIndex);
      objc_msgSend(v7, "addObject:", +[SCNAnimation animationWithC3DAnimation:](SCNAnimation, "animationWithC3DAnimation:", Copy));
      CFRelease(Copy);
    }
  }
  return v7;
}

- (void)initWithCAAnimation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _animationEvents should be nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: can't encode an animation that has never been attached to any target", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)encodeWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unknown animation type %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)animationWithContentsOfURL:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "description");
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_ERROR, "Error: Loading animation %@ failed with %@", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_4_4();
}

- (void)prepareWithTarget:implicitDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: failed to convert CAAnimation to SCNAnimation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)caAnimation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: SCNAnimation to CAAnimation: no animation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __28__SCNAnimation_setAdditive___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: This animation can't be changed to additive. To make this animation additive first convert it to a CAAnimation, set it to additive and convert back to SCNAnimation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __30__SCNAnimation_setCumulative___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: This animation can't be changed to cumulative. To make this animation cumulative first convert it to a CAAnimation, set it to cumulative and convert back to SCNAnimation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

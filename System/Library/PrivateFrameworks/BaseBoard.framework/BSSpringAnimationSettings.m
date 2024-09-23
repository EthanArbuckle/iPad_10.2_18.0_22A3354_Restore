@implementation BSSpringAnimationSettings

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = objc_alloc((Class)a1);
  return objc_autoreleaseReturnValue((id)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v8, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v9, v10, v11, *(uint64_t *)&a4, *(uint64_t *)&a5, 0.0,
                                           0));
}

- (BSSpringAnimationSettings)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (BSSpringAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v2, v3, v4, 0, 0, 0.0,
                                        0);
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = objc_alloc((Class)a1);
  return objc_autoreleaseReturnValue((id)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v10, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v11, v12, v13, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                                           0));
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v12 = objc_alloc((Class)a1);
  return objc_autoreleaseReturnValue((id)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v12, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v13, v14, v15, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                                           *(uint64_t *)&a7));
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v10 = a6;
  v11 = objc_alloc((Class)a1);
  v15 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v11, 1, 0, v10, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v12, v13, v14, *(uint64_t *)&a4, *(uint64_t *)&a5, 0.0,
                  0);

  return v15;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v12 = a7;
  v13 = objc_alloc((Class)a1);
  v17 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v13, 1, 0, v12, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v14, v15, v16, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  0);

  return v17;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 delay:(double)a7 timingFunction:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v14 = a8;
  v15 = objc_alloc((Class)a1);
  v19 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v15, 1, 0, v14, 1, 0.0, a7, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v16, v17, v18, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  0);

  return v19;
}

@end

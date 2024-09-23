@implementation HUAnimationApplier

+ (id)applyAnimationSettings:(id)a3 withStaticApplier:(id)a4 completion:(id)a5
{
  return (id)objc_msgSend(a1, "_applyAnimationSettings:withApplier:completion:applyDynamically:", a3, a4, a5, 0);
}

+ (id)applyAnimationSettings:(id)a3 withDynamicApplier:(id)a4 completion:(id)a5
{
  return (id)objc_msgSend(a1, "_applyAnimationSettings:withApplier:completion:applyDynamically:", a3, a4, a5, 1);
}

+ (id)_applyAnimationSettings:(id)a3 withApplier:(id)a4 completion:(id)a5 applyDynamically:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_applierWithAnimationSettings:applyDynamically:", v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUApplier registerStandaloneApplier:](HUApplier, "registerStandaloneApplier:", v13);
  objc_initWeak(&location, v13);
  objc_msgSend(v13, "addApplierBlock:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HUAnimationApplier__applyAnimationSettings_withApplier_completion_applyDynamically___block_invoke;
  v16[3] = &unk_1E6F4CB00;
  v14 = v12;
  v17 = v14;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v13, "addCompletionBlock:", v16);
  objc_msgSend(v13, "start");
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v13;
}

void __86__HUAnimationApplier__applyAnimationSettings_withApplier_completion_applyDynamically___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HUApplier unregisterStandaloneApplier:](HUApplier, "unregisterStandaloneApplier:", WeakRetained);

}

+ (id)dynamicApplierWithAnimationSettings:(id)a3
{
  return (id)objc_msgSend(a1, "_applierWithAnimationSettings:applyDynamically:", a3, 1);
}

+ (id)staticApplierWithAnimationSettings:(id)a3
{
  return (id)objc_msgSend(a1, "_applierWithAnimationSettings:applyDynamically:", a3, 0);
}

+ (id)_applierWithAnimationSettings:(id)a3 applyDynamically:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAnimationSettings:", v6);

  objc_msgSend(v7, "setApplyDynamically:", v4);
  return v7;
}

- (HUAnimationApplier)initWithAnimationSettings:(id)a3
{
  id v5;
  HUAnimationApplier *v6;
  uint64_t v7;
  HUAnimationSettings *animationSettings;
  uint64_t v9;
  NSMutableSet *relativeAnimations;
  uint64_t v11;
  NSMutableSet *effectiveProgressObservers;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnimationApplier.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HUAnimationApplier;
  v6 = -[HUApplier init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    animationSettings = v6->_animationSettings;
    v6->_animationSettings = (HUAnimationSettings *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    relativeAnimations = v6->_relativeAnimations;
    v6->_relativeAnimations = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    effectiveProgressObservers = v6->_effectiveProgressObservers;
    v6->_effectiveProgressObservers = (NSMutableSet *)v11;

  }
  return v6;
}

- (HUAnimationApplier)init
{
  -[HUAnimationApplier doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (HUAnimationSettings)animationSettings
{
  return (HUAnimationSettings *)(id)-[HUAnimationSettings copy](self->_animationSettings, "copy");
}

- (double)effectiveProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  if (-[HUApplier state](self, "state") == 1)
  {
    v3 = CACurrentMediaTime();
    -[HUAnimationApplier startTime](self, "startTime");
    v5 = v3 - v4;
    -[HUAnimationApplier _effectiveDuration](self, "_effectiveDuration");
    return v5 / v6;
  }
  else
  {
    -[HUApplier progress](self, "progress");
  }
  return result;
}

- (double)_effectiveDuration
{
  void *v2;
  double v3;
  double v4;
  float v5;
  double v6;

  -[HUAnimationApplier animationSettings](self, "animationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationWithSpeed");
  v4 = v3;
  UIAnimationDragCoefficient();
  v6 = v4 * v5;

  return v6;
}

- (BOOL)addAlongsideAnimationApplier:(id)a3 relativeStart:(double)a4 relativeDuration:(double)a5
{
  id v8;
  BOOL v9;
  void *v11;
  HURelativeAnimation *v12;

  v8 = a3;
  if (-[HUApplier state](self, "state") || objc_msgSend(v8, "state"))
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    if (a4 >= 0.0 && a4 + a5 <= 1.0)
    {
      -[HUAnimationApplier relativeAnimations](self, "relativeAnimations", a4 + a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HURelativeAnimation initWithAnimationApplier:relativeStart:relativeDuration:]([HURelativeAnimation alloc], "initWithAnimationApplier:relativeStart:relativeDuration:", v8, a4, a5);
      objc_msgSend(v11, "addObject:", v12);

      v9 = 1;
    }
  }

  return v9;
}

- (double)_remainingTimeIntervalForEffectiveProgress:(double)a3
{
  double v5;
  double v6;
  double result;
  double v8;
  double v9;

  -[HUAnimationApplier effectiveProgress](self, "effectiveProgress");
  v6 = v5;
  result = 0.0;
  if (v6 < a3)
  {
    v8 = a3 - v6;
    -[HUAnimationApplier _effectiveDuration](self, "_effectiveDuration", 0.0);
    return v8 * v9;
  }
  return result;
}

- (BOOL)notifyUponEffectiveProgress:(double)a3 withBlock:(id)a4
{
  id v7;
  unint64_t v8;
  HUEffectiveProgressObserver *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnimationApplier.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notifyBlock"));

  }
  v8 = -[HUApplier state](self, "state");
  if (v8 != 2)
  {
    v9 = -[HUEffectiveProgressObserver initWithTargetEffectiveProgress:observerBlock:]([HUEffectiveProgressObserver alloc], "initWithTargetEffectiveProgress:observerBlock:", v7, a3);
    -[HUAnimationApplier effectiveProgressObservers](self, "effectiveProgressObservers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

    if (-[HUApplier state](self, "state") == 1 || -[HUApplier state](self, "state") == 3)
      -[HUAnimationApplier _startEffectiveProgressTimerForObserver:](self, "_startEffectiveProgressTimerForObserver:", v9);

  }
  return v8 != 2;
}

- (void)_startEffectiveProgressTimerForObserver:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "targetEffectiveProgress");
  -[HUAnimationApplier _remainingTimeIntervalForEffectiveProgress:](self, "_remainingTimeIntervalForEffectiveProgress:");
  v6 = v5;
  if (v5 <= 0.00000011920929)
  {
    objc_msgSend(v4, "observerBlock");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    -[HUAnimationApplier effectiveProgressObservers](self, "effectiveProgressObservers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v4);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HUAnimationApplier__startEffectiveProgressTimerForObserver___block_invoke;
    v12[3] = &unk_1E6F50A68;
    objc_copyWeak(&v14, &location);
    v8 = v4;
    v13 = v8;
    objc_msgSend(v7, "afterDelay:performBlock:", v12, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTimerCancellationToken:", v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __62__HUAnimationApplier__startEffectiveProgressTimerForObserver___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "observerBlock");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    objc_msgSend(WeakRetained, "effectiveProgressObservers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)start
{
  _BOOL4 v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _QWORD v55[5];
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CAFrameRateRange v60;

  v59 = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)HUAnimationApplier;
  v3 = -[HUApplier start](&v56, sel_start);
  if (v3)
  {
    -[HUAnimationApplier setStartTime:](self, "setStartTime:", CACurrentMediaTime());
    if (-[HUAnimationApplier applyDynamically](self, "applyDynamically"))
    {
      -[HUAnimationApplier _effectiveDuration](self, "_effectiveDuration");
      if (v4 >= 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkTick);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAnimationApplier setDisplayLink:](self, "setDisplayLink:", v13);

        -[HUAnimationApplier displayLink](self, "displayLink");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

        -[HUAnimationApplier displayLink](self, "displayLink");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        objc_msgSend(v16, "setPreferredFrameRateRange:", *(double *)&v60.minimum, *(double *)&v60.maximum, *(double *)&v60.preferred);

        -[HUAnimationApplier displayLink](self, "displayLink");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHighFrameRateReason:", 1769473);

        -[HUAnimationApplier _displayLinkTick](self, "_displayLinkTick");
      }
      else
      {
        -[HUAnimationApplier _updateDynamicProgress:](self, "_updateDynamicProgress:", 1.0);
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CEABB0];
      -[HUAnimationApplier animationSettings](self, "animationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "duration");
      v8 = v7;
      -[HUAnimationApplier animationSettings](self, "animationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delay");
      v11 = v10;
      -[HUAnimationApplier animationSettings](self, "animationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v54[4] = self;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __27__HUAnimationApplier_start__block_invoke;
      v55[3] = &unk_1E6F4D988;
      v55[4] = self;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __27__HUAnimationApplier_start__block_invoke_3;
      v54[3] = &unk_1E6F4E300;
      objc_msgSend(v5, "_animateWithDuration:delay:options:factory:animations:completion:", 393798, v12, v55, v54, v8, v11);

    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[HUAnimationApplier relativeAnimations](self, "relativeAnimations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v23, "applier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "animationSettings");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "relativeStart");
          v27 = v26;
          -[HUAnimationApplier animationSettings](self, "animationSettings");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "durationWithSpeed");
          objc_msgSend(v25, "setDelay:", v27 * v29);

          objc_msgSend(v23, "relativeDuration");
          v31 = v30;
          -[HUAnimationApplier animationSettings](self, "animationSettings");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "durationWithSpeed");
          v34 = v31 * v33;

          objc_msgSend(v25, "durationWithSpeed");
          v36 = v35 / v34;
          objc_msgSend(v25, "speed");
          objc_msgSend(v25, "setSpeed:", v37 * v36);
          objc_msgSend(v23, "applier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setAnimationSettings:", v25);

          objc_msgSend(v23, "applier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "start");

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v20);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[HUAnimationApplier effectiveProgressObservers](self, "effectiveProgressObservers", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v47 != v43)
            objc_enumerationMutation(v40);
          -[HUAnimationApplier _startEffectiveProgressTimerForObserver:](self, "_startEffectiveProgressTimerForObserver:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v42);
    }

  }
  return v3;
}

uint64_t __27__HUAnimationApplier_start__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__HUAnimationApplier_start__block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __27__HUAnimationApplier_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgress:", 1.0);
}

uint64_t __27__HUAnimationApplier_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete:", 1);
}

- (void)_updateDynamicProgress:(double)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;

  v4 = fmin(fmax(a3, 0.0), 1.0);
  if (v4 + -1.0 >= -0.00000011920929)
  {
    -[HUApplier updateProgress:](self, "updateProgress:", 1.0);
    -[HUAnimationApplier complete:](self, "complete:", 1);
  }
  else
  {
    -[HUAnimationApplier animationSettings](self, "animationSettings", v4 + -1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interpolatedProgressForProgress:", v4);
    v7 = v6;

    -[HUApplier updateProgress:](self, "updateProgress:", v7);
  }
}

- (void)_displayLinkTick
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v3 = CACurrentMediaTime();
  -[HUAnimationApplier startTime](self, "startTime");
  v5 = v3 - v4;
  -[HUAnimationApplier animationSettings](self, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delay");
  v8 = v5 - v7;

  if (v8 >= 0.0)
  {
    -[HUAnimationApplier _effectiveDuration](self, "_effectiveDuration");
    -[HUAnimationApplier _updateDynamicProgress:](self, "_updateDynamicProgress:", v8 / v9);
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  void *v3;

  -[HUAnimationApplier displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HUAnimationApplier setDisplayLink:](self, "setDisplayLink:", 0);
}

- (BOOL)cancel
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HUAnimationApplier;
  v3 = -[HUApplier cancel](&v25, sel_cancel);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUAnimationApplier relativeAnimations](self, "relativeAnimations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "applier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancel");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HUAnimationApplier effectiveProgressObservers](self, "effectiveProgressObservers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "timerCancellationToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cancel");

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v12);
  }

  return v3;
}

- (BOOL)complete:(BOOL)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAnimationApplier;
  v4 = -[HUApplier complete:](&v6, sel_complete_, a3);
  if (v4)
    -[HUAnimationApplier _invalidateDisplayLinkIfNecessary](self, "_invalidateDisplayLinkIfNecessary");
  return v4;
}

- (void)setAnimationSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)applyDynamically
{
  return self->_applyDynamically;
}

- (void)setApplyDynamically:(BOOL)a3
{
  self->_applyDynamically = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableSet)relativeAnimations
{
  return self->_relativeAnimations;
}

- (NSMutableSet)effectiveProgressObservers
{
  return self->_effectiveProgressObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveProgressObservers, 0);
  objc_storeStrong((id *)&self->_relativeAnimations, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end

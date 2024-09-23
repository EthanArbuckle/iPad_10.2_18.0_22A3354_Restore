@implementation BSUIAnimationFactory

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return self->_allowsAdditiveAnimations;
}

- (id)_timingFunctionForAnimation
{
  return (id)-[BSAnimationSettings timingFunction](self->_settings, "timingFunction");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, a4, a5, a6, 0.0);
}

+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, a4, a5, 0, 0.0);
}

- (BSAnimationSettings)settings
{
  return self->_settings;
}

- (void)setAllowsAdditiveAnimations:(BOOL)a3
{
  self->_allowsAdditiveAnimations = a3;
}

+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;

  v12 = a5;
  v10 = a6;
  objc_msgSend(a1, "factoryWithSettings:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", v11, a4, v12, v10, 0.0);

}

+ (void)animateWithSettings:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(a1, "factoryWithSettings:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", v9, 0, v10, v8, 0.0);

}

+ (void)animateWithSettings:(id)a3 actions:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a1, "factoryWithSettings:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", v6, 0, v7, 0, 0.0);

}

+ (id)factoryWithDuration:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)factoryWithSettings:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  if (v4)
    v5 = -[BSUIAnimationFactory _initWithSettings:](objc_alloc((Class)a1), v4);
  else
    v5 = 0;

  return v5;
}

- (_QWORD)_initWithSettings:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSUIAnimationFactory;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[2];
      a1[2] = v4;

    }
  }

  return a1;
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  float minimum;
  float maximum;
  float preferred;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  float v34;
  float v35;
  float v36;
  int v37;
  CAFrameRateRange v38;
  CAFrameRateRange v39;
  CAFrameRateRange v40;

  v28 = (id *)a3;
  v11 = a6;
  v12 = a7;
  if (v28)
  {
    v13 = v11;
    v14 = v12;
    objc_msgSend(v28[2], "preferredFrameRateRange");
    minimum = v38.minimum;
    maximum = v38.maximum;
    preferred = v38.preferred;
    if (CAFrameRateRangeIsEqualToRange(v38, *MEMORY[0x1E0CD23C0])
      || (v40.minimum = 0.0,
          v40.maximum = 0.0,
          v40.preferred = 0.0,
          v39.minimum = minimum,
          v39.maximum = maximum,
          v39.preferred = preferred,
          CAFrameRateRangeIsEqualToRange(v39, v40)))
    {
      v18 = 0;
    }
    else
    {
      v20 = objc_msgSend(v28[2], "highFrameRateReason");
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79__BSUIAnimationFactory__animateWithAdditionalDelay_options_actions_completion___block_invoke;
      v32[3] = &unk_1E4349058;
      v33 = v13;
      v34 = minimum;
      v35 = maximum;
      v36 = preferred;
      v37 = v20;
      v18 = (void *)MEMORY[0x1A1AF63A8](v32);

    }
    v21 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v28[2], "duration", v28);
    v23 = v22;
    objc_msgSend(v28[2], "delay");
    v25 = v24;
    objc_msgSend((id)objc_opt_class(), "globalSlowDownFactor");
    if (v18)
      v27 = v18;
    else
      v27 = v13;
    objc_msgSend(v21, "_animateWithDuration:delay:options:factory:animations:completion:", a5 | 0x60000, v28, v27, v14, v23, (v25 + a4) * v26);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CEABB0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __86__BSUIAnimationFactory_animateWithFactory_additionalDelay_options_actions_completion___block_invoke;
    v29[3] = &unk_1E4349080;
    v30 = v11;
    v31 = v12;
    objc_msgSend(v19, "performWithoutAnimation:", v29);

  }
}

- (void)applySettingsToCAAnimation:(id)a3
{
  double v4;
  double v5;
  float v6;
  float v7;
  double v8;
  double v9;
  float minimum;
  float maximum;
  float preferred;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  CAFrameRateRange v18;
  CAFrameRateRange v19;
  CAFrameRateRange v20;

  v17 = a3;
  if (-[BSAnimationSettings isSpringAnimation](self->_settings, "isSpringAnimation"))
  {
    -[BSAnimationSettings mass](self->_settings, "mass");
    objc_msgSend(v17, "setMass:");
    -[BSAnimationSettings stiffness](self->_settings, "stiffness");
    objc_msgSend(v17, "setStiffness:");
    -[BSAnimationSettings damping](self->_settings, "damping");
    objc_msgSend(v17, "setDamping:");
    -[BSAnimationSettings initialVelocity](self->_settings, "initialVelocity");
    objc_msgSend(v17, "setInitialVelocity:");
  }
  objc_msgSend((id)objc_opt_class(), "globalSlowDownFactor");
  v5 = v4;
  -[BSAnimationSettings speed](self->_settings, "speed");
  v7 = v6;
  if (v6 != 1.0 || (BSFloatIsOne() & 1) == 0)
  {
    v8 = v7 / v5;
    *(float *)&v8 = v8;
    objc_msgSend(v17, "setSpeed:", v8);
  }
  -[BSAnimationSettings frameInterval](self->_settings, "frameInterval");
  if (v9 != 0.0)
    objc_msgSend(v17, "setFrameInterval:");
  -[BSAnimationSettings preferredFrameRateRange](self->_settings, "preferredFrameRateRange");
  minimum = v18.minimum;
  maximum = v18.maximum;
  preferred = v18.preferred;
  if (!CAFrameRateRangeIsEqualToRange(v18, *MEMORY[0x1E0CD23C0]))
  {
    v20.minimum = 0.0;
    v20.maximum = 0.0;
    v20.preferred = 0.0;
    v19.minimum = minimum;
    v19.maximum = maximum;
    v19.preferred = preferred;
    if (!CAFrameRateRangeIsEqualToRange(v19, v20))
    {
      *(float *)&v13 = minimum;
      *(float *)&v14 = maximum;
      *(float *)&v15 = preferred;
      objc_msgSend(v17, "setPreferredFrameRateRange:", v13, v14, v15);
    }
  }
  v16 = -[BSAnimationSettings highFrameRateReason](self->_settings, "highFrameRateReason");
  if (v16 | objc_msgSend(v17, "highFrameRateReason"))
    objc_msgSend(v17, "setHighFrameRateReason:", v16);

}

+ (double)globalSlowDownFactor
{
  void *v2;
  double v3;
  double v4;

  +[BSUIAnimationFactoryDomain rootSettings](BSUIAnimationFactoryDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveSlowDownFactor");
  v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  int v6;
  id *v7;
  void *v8;

  v5 = a4;
  v6 = -[BSAnimationSettings isSpringAnimation](self->_settings, "isSpringAnimation");
  v7 = (id *)0x1E0CD2848;
  if (!v6)
    v7 = (id *)0x1E0CD2710;
  objc_msgSend(*v7, "animation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIAnimationFactory applySettingsToCAAnimation:](self, "applySettingsToCAAnimation:", v8);
  objc_msgSend(v8, "setKeyPath:", v5);

  return v8;
}

uint64_t __86__BSUIAnimationFactory_animateWithFactory_additionalDelay_options_actions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __79__BSUIAnimationFactory__animateWithAdditionalDelay_options_actions_completion___block_invoke(uint64_t result, double a2, double a3, double a4)
{
  if (*(_QWORD *)(result + 32))
  {
    LODWORD(a2) = *(_DWORD *)(result + 40);
    LODWORD(a3) = *(_DWORD *)(result + 44);
    LODWORD(a4) = *(_DWORD *)(result + 48);
    return objc_msgSend(MEMORY[0x1E0CEABB0], "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", *(unsigned int *)(result + 52), a2, a3, a4);
  }
  return result;
}

+ (void)animateWithFactory:(id)a3 actions:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, 0, a4, a5, 0.0);
}

+ (void)animateWithFactory:(id)a3 actions:(id)a4
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, 0, a4, 0, 0.0);
}

+ (id)factoryWithSettings:(id)a3 timingFunction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "setTimingFunction:", v7);
    v9 = -[BSUIAnimationFactory _initWithSettings:](objc_alloc((Class)a1), v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BSUIAnimationFactory)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSUIAnimationFactory.m"), 56, CFSTR("attempt to create a nil factory"));

  return (BSUIAnimationFactory *)-[BSUIAnimationFactory _initWithSettings:](self, 0);
}

+ (id)factoryWithDuration:(double)a3 delay:(double)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)factoryWithDuration:(double)a3 timingFunction:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:timingFunction:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)factoryWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:timingFunction:", a5, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:epsilon:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:epsilon:initialVelocity:", a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:timingFunction:", a6, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:epsilon:timingFunction:", a7, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoryWithSettings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BSUIAnimationFactory)factoryWithTimingFunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)-[BSAnimationSettings mutableCopy](self->_settings, "mutableCopy");
  objc_msgSend(v5, "setTimingFunction:", v4);
  objc_msgSend((id)objc_opt_class(), "factoryWithSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSUIAnimationFactory *)v6;
}

- (double)duration
{
  double result;

  -[BSAnimationSettings duration](self->_settings, "duration");
  return result;
}

- (double)delay
{
  double result;

  -[BSAnimationSettings delay](self->_settings, "delay");
  return result;
}

- (BSAnimationSettings)effectiveSettings
{
  void *v3;
  double v4;
  double v5;
  double v6;

  if ((-[BSAnimationSettings isSpringAnimation](self->_settings, "isSpringAnimation") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "globalSlowDownFactor"), (BSFloatIsOne() & 1) != 0))
  {
    v3 = (void *)-[BSAnimationSettings copy](self->_settings, "copy");
  }
  else
  {
    v3 = (void *)-[BSAnimationSettings mutableCopy](self->_settings, "mutableCopy");
    objc_msgSend(v3, "duration");
    v5 = v4;
    objc_msgSend((id)objc_opt_class(), "globalSlowDownFactor");
    objc_msgSend(v3, "setDuration:", v5 * v6);
  }
  return (BSAnimationSettings *)v3;
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, 0, a5, 0, a4);
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, 0, a5, a6, a4);
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6
{
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", a3, a5, a6, 0, a4);
}

+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a1, "factoryWithSettings:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "animateWithFactory:additionalDelay:options:actions:completion:", v8, a4, v9, 0, 0.0);

}

+ (void)addAlongsideAnimations:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (v6)
    v6[2]();
  if (v5 && (objc_msgSend(MEMORY[0x1E0CEABB0], "_addCompletion:", v5) & 1) == 0)
    v5[2](v5, 1);

}

+ (id)factoryWithAnimationAttributes:(id)a3
{
  id v4;
  _BSUIAnimationAttributesFactory *v5;
  id v6;
  void *v7;
  id *v8;
  id *v9;
  void *v11;

  v4 = a3;
  v5 = [_BSUIAnimationAttributesFactory alloc];
  v6 = v4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithAttributes_, v5, CFSTR("BSUIAnimationFactory.m"), 355, CFSTR("must pass in valid attributes"));

    }
    v8 = (id *)-[BSUIAnimationFactory _initWithSettings:](v5, 0);
    v9 = v8;
    if (v8)
      objc_storeStrong(v8 + 3, a3);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[BSAnimationSettings hash](self->_settings, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    v6 = -[BSAnimationSettings isEqual:](self->_settings, "isEqual:", v4[2]);
  else
    v6 = 0;

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p settings=%@>"), objc_opt_class(), self, self->_settings);
}

- (BOOL)allowsAdditiveAnimations
{
  return self->_allowsAdditiveAnimations;
}

@end

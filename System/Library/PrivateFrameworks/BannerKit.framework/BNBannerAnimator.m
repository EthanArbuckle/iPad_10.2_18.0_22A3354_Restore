@implementation BNBannerAnimator

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "_animateInteractive:settings:animations:completion:", a3, 0, a4, a5);
}

+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "_animateInteractive:settings:animations:completion:", 0, a3, a4, a5);
}

+ (id)defaultResizeAnimationSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 3.0, 1000.0, 500.0);
}

- (BNBannerAnimator)initWithAnimationSettings:(id)a3
{
  id v5;
  BNBannerAnimator *v6;
  BNBannerAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BNBannerAnimator;
  v6 = -[BNBannerAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animationSettings, a3);

  return v7;
}

- (BNBannerAnimator)init
{
  return -[BNBannerAnimator initWithAnimationSettings:](self, "initWithAnimationSettings:", 0);
}

- (BOOL)isRetargetable
{
  return self->_animationSettings == 0;
}

- (void)retargetTransition:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = -[BNBannerAnimator isRetargetable](self, "isRetargetable");
  if (v4 && v5)
  {
    -[BNBannerAnimator _pushTransitionForContext:](self, "_pushTransitionForContext:", v4);
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__BNBannerAnimator_retargetTransition___block_invoke;
    v12[3] = &unk_1E7044948;
    v8 = v4;
    v13 = v8;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __39__BNBannerAnimator_retargetTransition___block_invoke_2;
    v9[3] = &unk_1E7044F58;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    objc_msgSend(v6, "_animateByRetargetingAnimations:completion:", v12, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

uint64_t __39__BNBannerAnimator_retargetTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  return result;
}

void __39__BNBannerAnimator_retargetTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_popTransitionForContext:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);

}

- (void)animateTransition:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  double v9;
  void *v10;
  BSAnimationSettings *animationSettings;
  id *v12;
  id *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__BNBannerAnimator_animateTransition___block_invoke;
  v24[3] = &unk_1E7044F80;
  objc_copyWeak(&v25, &location);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC21C4](v24);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __38__BNBannerAnimator_animateTransition___block_invoke_2;
  v21[3] = &unk_1E7044F58;
  objc_copyWeak(&v23, &location);
  v7 = v4;
  v22 = v7;
  v8 = (void *)MEMORY[0x1BCCC21C4](v21);
  if (objc_msgSend(v7, "isAnimated")
    && (-[BNBannerAnimator transitionDuration:](self, "transitionDuration:", v7), v9 > 0.0))
  {
    -[BNBannerAnimator _pushTransitionForContext:](self, "_pushTransitionForContext:", v7);
    if (self->_animationSettings)
    {
      v10 = (void *)objc_opt_class();
      animationSettings = self->_animationSettings;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __38__BNBannerAnimator_animateTransition___block_invoke_3;
      v18[3] = &unk_1E7044FA8;
      v20 = v6;
      v19 = v7;
      objc_msgSend(v10, "animateWithSettings:animations:completion:", animationSettings, v18, v8);
      v12 = (id *)&v20;
      v13 = &v19;
    }
    else
    {
      v14 = (void *)objc_opt_class();
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __38__BNBannerAnimator_animateTransition___block_invoke_4;
      v15[3] = &unk_1E7044FA8;
      v17 = v6;
      v16 = v7;
      objc_msgSend(v14, "animateInteractive:animations:completion:", 0, v15, v8);
      v12 = (id *)&v17;
      v13 = &v16;
    }

  }
  else
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v7);
    objc_msgSend(v7, "completeTransition:", 1);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __38__BNBannerAnimator_animateTransition___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionsForTransition:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "__runAlongsideAnimations");

}

void __38__BNBannerAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_popTransitionForContext:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);

}

uint64_t __38__BNBannerAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38__BNBannerAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id v11;
  CAFrameRateRange v12;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__BNBannerAnimator_animateTransition___block_invoke_5;
  v9[3] = &unk_1E7044FA8;
  v11 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 3145729, v9, v6, v7, v8);

}

uint64_t __38__BNBannerAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (double)transitionDuration:(id)a3
{
  BSAnimationSettings *animationSettings;
  double result;

  animationSettings = self->_animationSettings;
  if (!animationSettings)
    return 0.375;
  -[BSAnimationSettings duration](animationSettings, "duration", a3);
  return result;
}

+ (void)_animateInteractive:(BOOL)a3 settings:(id)a4 animations:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v10)
  {
    if (v9)
    {
      v13 = (void *)MEMORY[0x1E0D01908];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __71__BNBannerAnimator__animateInteractive_settings_animations_completion___block_invoke;
      v14[3] = &unk_1E7044DF8;
      v15 = v11;
      objc_msgSend(v13, "animateWithSettings:options:actions:completion:", v9, 6, v10, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringInteractive:animations:completion:", v8, v10, v11);
    }
  }
  else if (v11)
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

uint64_t __71__BNBannerAnimator__animateInteractive_settings_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)_pushTransitionForContext:(id)a3
{
  NSMapTable *transitionContextsToTransitionCount;
  id v5;
  void *v6;
  uint64_t v7;
  NSMapTable *v8;
  NSMapTable *v9;
  NSMapTable *v10;
  id v11;

  if (a3)
  {
    transitionContextsToTransitionCount = self->_transitionContextsToTransitionCount;
    v5 = a3;
    -[NSMapTable objectForKey:](transitionContextsToTransitionCount, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v8 = self->_transitionContextsToTransitionCount;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v10 = self->_transitionContextsToTransitionCount;
      self->_transitionContextsToTransitionCount = v9;

      v8 = self->_transitionContextsToTransitionCount;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v11, v5);

  }
}

- (BOOL)_popTransitionForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMapTable *transitionContextsToTransitionCount;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  -[NSMapTable objectForKey:](self->_transitionContextsToTransitionCount, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  transitionContextsToTransitionCount = self->_transitionContextsToTransitionCount;
  if (!v6)
  {
    -[NSMapTable removeObjectForKey:](transitionContextsToTransitionCount, "removeObjectForKey:", v4);
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = v6 - 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](transitionContextsToTransitionCount, "setObject:forKey:", v9, v4);

  v10 = v8 != 0;
LABEL_6:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContextsToTransitionCount, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (void)actionsForTransition:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v3 = *MEMORY[0x1E0CEBDB8];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v14);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
}

@end

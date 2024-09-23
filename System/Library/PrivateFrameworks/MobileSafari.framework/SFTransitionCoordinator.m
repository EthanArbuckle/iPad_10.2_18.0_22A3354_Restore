@implementation SFTransitionCoordinator

- (SFTransitionCoordinator)initWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SFTransitionCoordinator *v8;
  _QWORD *v9;
  uint64_t v10;
  NSMutableArray *animations;
  id v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *completionBlocks;
  SFTransitionCoordinator *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFTransitionCoordinator;
  v8 = -[SFTransitionCoordinator init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([SFTransitionCoordinatorBasicAnimation alloc], v6);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
      animations = v8->_animations;
      v8->_animations = (NSMutableArray *)v10;

    }
    if (v7)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v13 = _Block_copy(v7);
      v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
      completionBlocks = v8->_completionBlocks;
      v8->_completionBlocks = (NSMutableArray *)v14;

    }
    v16 = v8;
  }

  return v8;
}

- (void)addAnimation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)invokeAnimations
{
  NSMutableArray *v3;
  NSMutableArray *animations;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = self->_animations;
  animations = self->_animations;
  self->_animations = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "invokeInContext:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)invokeCompletion
{
  NSMutableArray *v3;
  NSMutableArray *completionBlocks;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = self->_completionBlocks;
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)performTransitionWithAnimation:(BOOL)a3 inContextOfContainerView:(id)a4
{
  NSObject *v5;
  void *v6;
  NSMutableArray *animations;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **p_superclass;
  BOOL (*v11)(uint64_t, void *);
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL (*v18)(uint64_t, void *);
  __objc2_class **v19;
  void *v20;
  id *v21;
  id *v22;
  _BOOL4 v23;
  void *v24;
  id *v25;
  id *v26;
  _QWORD block[5];
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  _QWORD v35[2];
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[4];
  char v41;

  if (a3)
  {
    v5 = dispatch_group_create();
    v6 = (void *)-[NSMutableArray mutableCopy](self->_animations, "mutableCopy");
    animations = self->_animations;
    self->_animations = 0;

    v8 = objc_msgSend(v6, "count");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v25 = (id *)&v33;
      v26 = (id *)v35;
      p_superclass = SFQuickLookDocumentInfoView.superclass;
      v11 = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke;
      do
      {
        objc_msgSend(v6, "firstObject", v25, v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v40[0] = v9;
        v40[1] = 3221225472;
        v40[2] = v11;
        v40[3] = &__block_descriptor_33_e51_B32__0___SFTransitionCoordinatorAnimation__8Q16_B24l;
        v41 = isKindOfClass & 1;
        v14 = objc_msgSend(v6, "indexOfObjectPassingTest:", v40);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          v14 = objc_msgSend(v6, "count");
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectsAtIndexes:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectsAtIndexes:", v15);
        dispatch_group_enter(v5);
        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)MEMORY[0x1E0DC3F10];
          -[SFTransitionCoordinator springAnimationBehavior](self, "springAnimationBehavior");
          v18 = v11;
          v19 = p_superclass;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v9;
          v38[1] = 3221225472;
          v38[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_2;
          v38[3] = &unk_1E21E2258;
          v39[0] = v16;
          v39[1] = self;
          v36[0] = v9;
          v36[1] = 3221225472;
          v36[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_3;
          v36[3] = &unk_1E21E6230;
          v37 = v5;
          objc_msgSend(v17, "_animateUsingSpringBehavior:tracking:animations:completion:", v20, 0, v38, v36);

          p_superclass = v19;
          v11 = v18;
          v21 = (id *)&v37;
          v22 = (id *)v39;
        }
        else
        {
          v23 = -[SFTransitionCoordinator requiresKeyframeAnimations](self, "requiresKeyframeAnimations");
          v24 = (void *)MEMORY[0x1E0DC3F10];
          if (v23)
          {
            v34[0] = v9;
            v34[1] = 3221225472;
            v34[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_4;
            v34[3] = &unk_1E21E2258;
            v35[0] = v16;
            v35[1] = self;
            v32[0] = v9;
            v32[1] = 3221225472;
            v32[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_5;
            v32[3] = &unk_1E21E2190;
            v33 = v5;
            objc_msgSend(v24, "animateKeyframesWithDuration:delay:options:animations:completion:", 327682, v34, v32, 0.33, 0.0);
            v21 = v25;
            v22 = v26;
          }
          else
          {
            v30[0] = v9;
            v30[1] = 3221225472;
            v30[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_6;
            v30[3] = &unk_1E21E2258;
            v31[0] = v16;
            v31[1] = self;
            v28[0] = v9;
            v28[1] = 3221225472;
            v28[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_7;
            v28[3] = &unk_1E21E2190;
            v29 = v5;
            objc_msgSend(v24, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v30, v28);
            v21 = (id *)&v29;
            v22 = (id *)v31;
          }
        }

      }
      while (objc_msgSend(v6, "count"));
    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_8;
    block[3] = &unk_1E21E2050;
    block[4] = self;
    dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    self->_keyframeAnimationMode = 2;
    -[SFTransitionCoordinator invokeAnimations](self, "invokeAnimations");
    -[SFTransitionCoordinator invokeCompletion](self, "invokeCompletion");
  }
}

BOOL __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return *(_BYTE *)(a1 + 32) != (isKindOfClass & 1);
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeCompletion");
}

- (UIViewSpringAnimationBehaviorDescribing)springAnimationBehavior
{
  UIViewSpringAnimationBehaviorDescribing *overrideSpringAnimationBehavior;
  double v4;

  overrideSpringAnimationBehavior = self->_overrideSpringAnimationBehavior;
  if (overrideSpringAnimationBehavior)
    return overrideSpringAnimationBehavior;
  if (-[SFTransitionCoordinator requiresKeyframeAnimations](self, "requiresKeyframeAnimations"))
    v4 = 0.28;
  else
    v4 = 0.34;
  objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", 1.0, v4);
  return (UIViewSpringAnimationBehaviorDescribing *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSpringAnimationBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSpringAnimationBehavior, a3);
}

- (BOOL)requiresKeyframeAnimations
{
  return self->_keyframeAnimationMode == 1;
}

- (void)disableKeyframeAnimations
{
  self->_keyframeAnimationMode = 2;
}

- (void)addAnimations:(id)a3
{
  __objc2_class **v4;
  objc_class *v5;
  id v6;
  _QWORD *v7;

  v4 = off_1E21E05F8;
  if (self->_overrideSpringAnimationBehavior)
    v4 = off_1E21E0600;
  v5 = (objc_class *)*v4;
  v6 = a3;
  v7 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([v5 alloc], v6);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v7);
}

- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  id v8;
  double *v9;

  if (!self->_keyframeAnimationMode)
    self->_keyframeAnimationMode = 1;
  v8 = a5;
  v9 = -[SFTransitionCoordinatorKeyframeAnimation initWithStartTime:duration:animations:]([SFTransitionCoordinatorKeyframeAnimation alloc], v8, a3, a4);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v9);
}

- (void)addRetargetableAnimations:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([SFTransitionCoordinatorRetargetableAnimation alloc], v4);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v5);
}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *completionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completionBlocks = self->_completionBlocks;
  aBlock = v4;
  if (!completionBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v8);

}

- (BOOL)isTransition
{
  return self->_isTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end

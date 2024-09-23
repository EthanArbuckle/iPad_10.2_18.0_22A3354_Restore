@implementation CCUIAnimationRunner

+ (id)runner
{
  return objc_alloc_init((Class)a1);
}

- (void)runAnimationBatch:(id)a3 withCompletionBlock:(id)a4
{
  OS_dispatch_group *previousAnimationGroup;
  id v7;
  id v8;

  previousAnimationGroup = self->_previousAnimationGroup;
  self->_previousAnimationGroup = 0;
  v7 = a4;
  v8 = a3;

  -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:](self, "additivelyRunAnimationBatch:withCompletionBlock:", v8, v7);
}

- (void)additivelyRunAnimationBatch:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *previousAnimationGroup;
  void *v15;
  NSObject *v16;
  void *v17;
  OS_dispatch_group *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26;
  id location;
  _QWORD v28[6];
  _QWORD v29[5];
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;
  _QWORD block[4];
  NSObject *v35;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v9 = (void *)*MEMORY[0x1E0D14690];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14690], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:].cold.1(v9, v6);
    v11 = dispatch_group_create();
    v12 = v11;
    v13 = MEMORY[0x1E0C809B0];
    if (self->_previousAnimationGroup)
    {
      dispatch_group_enter(v11);
      previousAnimationGroup = self->_previousAnimationGroup;
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke;
      block[3] = &unk_1E8CFC3D0;
      v35 = v12;
      v15 = (void *)MEMORY[0x1E0C80D38];
      dispatch_group_notify(previousAnimationGroup, MEMORY[0x1E0C80D38], block);

    }
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 1;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_2;
    v29[3] = &unk_1E8CFCF40;
    v29[4] = v32;
    objc_msgSend((id)objc_opt_class(), "_runCAAnimationsInBatch:animationGroup:completionHandler:", v6, v12, v29);
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_3;
    v28[3] = &unk_1E8CFCF68;
    v28[4] = v32;
    v28[5] = v30;
    objc_msgSend((id)objc_opt_class(), "_runC2AnimationsInBatch:animationGroup:completionHandler:", v6, v12, v28);
    objc_initWeak(&location, self);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4;
    v20[3] = &unk_1E8CFCF90;
    v21 = v6;
    v24 = v32;
    v25 = v30;
    objc_copyWeak(&v26, &location);
    v16 = v12;
    v22 = v16;
    v23 = v7;
    v17 = (void *)MEMORY[0x1E0C80D38];
    dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v20);

    v18 = self->_previousAnimationGroup;
    self->_previousAnimationGroup = (OS_dispatch_group *)v16;
    v19 = v16;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    if (v10)
      -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:].cold.2(v9, v6);
    objc_msgSend(v6, "iterateAnimationsWithBlock:", &__block_literal_global_7);
    if (v7)
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

uint64_t __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_3(uint64_t result, char a2, char a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a2;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
    a3 = 1;
  *(_BYTE *)(v5 + 24) = a3;
  return result;
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)*MEMORY[0x1E0D14690];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14690], OS_LOG_TYPE_DEBUG))
    __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4_cold_1((_QWORD *)a1, v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  v5 = (void *)*((_QWORD *)WeakRetained + 1);
  if (v5 == *(void **)(a1 + 40))
  {
    *((_QWORD *)WeakRetained + 1) = 0;

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));

}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(void);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "animations");
        v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (void)_runCAAnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke;
  v20[3] = &unk_1E8CFD020;
  v12 = v7;
  v21 = v12;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v9, "iterateAnimationsOfType:withBlock:", v10, v20);
  v14 = objc_opt_class();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_3;
  v17[3] = &unk_1E8CFD020;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v9, "iterateAnimationsOfType:withBlock:", v14, v17);

}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  CCUICABasicAnimationFactory *v15;
  CCUICABasicAnimationFactory *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id obj;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v11 = objc_opt_class();
        v12 = v5;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        v15 = [CCUICABasicAnimationFactory alloc];
        objc_msgSend(v10, "speed");
        v16 = -[CCUICABasicAnimationFactory initWithParameters:speed:](v15, "initWithParameters:speed:", v14);

        -[CCUICABasicAnimationFactory animationDuration](v16, "animationDuration");
        v18 = v17;
        objc_msgSend(MEMORY[0x1E0D01908], "globalSlowDownFactor");
        v20 = v18 * v19;
        objc_msgSend(v10, "delay");
        v22 = v21;
        objc_msgSend(MEMORY[0x1E0D01908], "globalSlowDownFactor");
        v24 = v22 * v23;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v25 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend(v10, "animations");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_2;
        v28[3] = &unk_1E8CFCFF8;
        v30 = *(id *)(a1 + 40);
        v29 = *(id *)(a1 + 32);
        objc_msgSend(v25, "_animateWithDuration:delay:options:factory:animations:completion:", 393222, v16, v26, v28, v20, v24);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  CCUICASpringAnimationFactory *v14;
  CCUICASpringAnimationFactory *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  float minimum;
  float maximum;
  float preferred;
  BOOL IsEqualToRange;
  uint64_t v29;
  void *v30;
  void *v31;
  id obj;
  float other;
  float v34;
  float v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CAFrameRateRange v52;
  CAFrameRateRange v53;

  v51 = *MEMORY[0x1E0C80C00];
  v36 = a2;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v47;
    v34 = *(float *)(MEMORY[0x1E0CD23C0] + 4);
    v35 = *MEMORY[0x1E0CD23C0];
    other = *(float *)(MEMORY[0x1E0CD23C0] + 8);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v47 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v8);
        v10 = objc_opt_class();
        v11 = v36;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        v14 = [CCUICASpringAnimationFactory alloc];
        objc_msgSend(v9, "speed");
        v15 = -[CCUICASpringAnimationFactory initWithParameters:speed:](v14, "initWithParameters:speed:", v13);
        -[CCUICASpringAnimationFactory animationDuration](v15, "animationDuration");
        v17 = v16;
        objc_msgSend(MEMORY[0x1E0D01908], "globalSlowDownFactor");
        v19 = v18;
        objc_msgSend(v9, "delay");
        v21 = v20;
        objc_msgSend(MEMORY[0x1E0D01908], "globalSlowDownFactor");
        v23 = v22;
        objc_msgSend(v9, "animations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frameRateRange");
        minimum = v52.minimum;
        maximum = v52.maximum;
        preferred = v52.preferred;
        v53.maximum = v34;
        v53.minimum = v35;
        v53.preferred = other;
        IsEqualToRange = CAFrameRateRangeIsEqualToRange(v52, v53);
        v29 = MEMORY[0x1E0C809B0];
        if (!IsEqualToRange)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_4;
          aBlock[3] = &unk_1E8CFD048;
          v43 = minimum;
          v44 = maximum;
          v45 = preferred;
          v41 = v13;
          v42 = v9;
          v30 = _Block_copy(aBlock);

          v24 = v30;
        }
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v31 = (void *)MEMORY[0x1E0DC3F10];
        v37[0] = v29;
        v37[1] = 3221225472;
        v37[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_5;
        v37[3] = &unk_1E8CFCFF8;
        v39 = *(id *)(a1 + 40);
        v38 = *(id *)(a1 + 32);
        objc_msgSend(v31, "_animateWithDuration:delay:options:factory:animations:completion:", 393222, v15, v24, v37, v17 * v19, v21 * v23);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v6);
  }

}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = objc_msgSend(*(id *)(a1 + 32), "highFrameRateReason");
  objc_msgSend(*(id *)(a1 + 40), "animations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v3, v7, v4, v5, v6);

}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)_runC2AnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke;
  v13[3] = &unk_1E8CFD020;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v9, "iterateAnimationsOfType:withBlock:", v10, v13);

}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v7 = objc_opt_class();
  v8 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v10, "tension");
  v13 = v12;
  objc_msgSend(v10, "friction");
  v15 = v14;
  v16 = objc_msgSend(v10, "isInteractive");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_2;
  v22[3] = &unk_1E8CFC540;
  v23 = v10;
  v24 = v6;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_4;
  v19[3] = &unk_1E8CFD070;
  v21 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 32);
  v17 = v6;
  v18 = v10;
  objc_msgSend(v11, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", v16, v22, v19, v13, v15);

}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(void);
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;
  CAFrameRateRange v24;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "frameRateRange");
  minimum = v24.minimum;
  maximum = v24.maximum;
  preferred = v24.preferred;
  if (CAFrameRateRangeIsEqualToRange(v24, *MEMORY[0x1E0CD23C0]))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "animations", (_QWORD)v16);
          v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v10[2]();

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = objc_msgSend(*(id *)(a1 + 32), "highFrameRateReason");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_3;
    v20[3] = &unk_1E8CFC3D0;
    v21 = *(id *)(a1 + 40);
    *(float *)&v13 = minimum;
    *(float *)&v14 = maximum;
    *(float *)&v15 = preferred;
    objc_msgSend(v11, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v12, v20, v13, v14, v15);

  }
}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);
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
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "animations", (_QWORD)v7);
        v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAnimationGroup, 0);
}

- (void)additivelyRunAnimationBatch:(void *)a1 withCompletionBlock:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1CFB7D000, v5, v6, "[%{public}@] Will animate batch", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)additivelyRunAnimationBatch:(void *)a1 withCompletionBlock:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1CFB7D000, v5, v6, "[%{public}@] Will execute batch animation", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4_cold_1(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
  v8 = 138543874;
  v9 = v5;
  v10 = 1024;
  v11 = v6;
  v12 = 1024;
  v13 = v7;
  _os_log_debug_impl(&dword_1CFB7D000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Animation batch complete: finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v8, 0x18u);

}

@end

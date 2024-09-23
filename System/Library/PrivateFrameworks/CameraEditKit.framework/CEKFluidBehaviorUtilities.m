@implementation CEKFluidBehaviorUtilities

+ (id)animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(id, double, double);
  void (**v15)(id, double, double);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  void (**v22)(id, double, double);
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (v6 && v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v9, "setValue:", 0.0);
    objc_initWeak(&location, v9);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __76__CEKFluidBehaviorUtilities_animatablePropertyWithProgressMilestones_block___block_invoke;
    v20 = &unk_1E70A5260;
    objc_copyWeak(&v23, &location);
    v13 = v10;
    v21 = v13;
    v14 = (void (**)(id, double, double))v6;
    v22 = v14;
    objc_msgSend(v11, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v12, &v17);

    if (objc_msgSend(v13, "containsObject:", &unk_1E70B3BD0, v17, v18, v19, v20))
    {
      v14[2](v14, 0.0, 0.0);
      objc_msgSend(v13, "removeObject:", &unk_1E70B3BD0);
    }
    v15 = v22;
    v8 = v9;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __76__CEKFluidBehaviorUtilities_animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isInvalidated") & 1) == 0)
  {
    objc_msgSend(v3, "presentationValue");
    v5 = v4;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "doubleValue");
          v14 = v13;
          if (BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(v14, v5);
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "addObject:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      objc_msgSend(v3, "invalidate");

  }
}

+ (id)animatablePropertyWithMilestonePassingTest:(id)a3 passedBlock:(id)a4
{
  unsigned int (**v5)(_QWORD, double);
  void (**v6)(_QWORD, double);
  void (**v7)(_QWORD, double);
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  unsigned int (**v15)(_QWORD, double);
  void (**v16)(_QWORD, double);
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (unsigned int (**)(_QWORD, double))a3;
  v6 = (void (**)(_QWORD, double))a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (v5[2](v5, 0.0))
    {
      v7[2](v7, 0.0);
      v8 = 0;
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
      objc_msgSend(v9, "setValue:", 0.0);
      objc_initWeak(&location, v9);
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__CEKFluidBehaviorUtilities_animatablePropertyWithMilestonePassingTest_passedBlock___block_invoke;
      v14[3] = &unk_1E70A5288;
      objc_copyWeak(&v17, &location);
      v15 = v5;
      v16 = v7;
      objc_msgSend(v10, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v11, v14);

      v12 = v16;
      v8 = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v8;
}

void __84__CEKFluidBehaviorUtilities_animatablePropertyWithMilestonePassingTest_passedBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  double v5;
  double v6;
  int v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isInvalidated");
    v3 = v8;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v8, "presentationValue");
      v6 = v5;
      v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = v8;
      if (v7)
      {
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v6);
        objc_msgSend(v8, "invalidate");
        v3 = v8;
      }
    }
  }

}

+ (id)animatablePropertyWithFunctionalCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    objc_msgSend(v4, "setValue:", 0.0);
    objc_initWeak(&location, v4);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__CEKFluidBehaviorUtilities_animatablePropertyWithFunctionalCompletion___block_invoke;
    v8[3] = &unk_1E70A52B0;
    objc_copyWeak(&v10, &location);
    v9 = v3;
    objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v6, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __72__CEKFluidBehaviorUtilities_animatablePropertyWithFunctionalCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  int v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isInvalidated");
    v3 = v6;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v6, "presentationValue");
      v5 = BSFloatLessThanOrEqualToFloat();
      v3 = v6;
      if (v5)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        objc_msgSend(v6, "invalidate");
        v3 = v6;
      }
    }
  }

}

@end

@implementation UIDeepestPreferredEnvironmentSearch

void __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "isLeafPreference"))
  {
    if (objc_msgSend(v11, "isPrimaryPreference"))
    {
      objc_msgSend(v11, "environment");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      *a3 = 3;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v8 = 0;
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v11, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResolvedPreference:forEnvironment:", v8, v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:result:", v11, a3);

}

BOOL __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

  return v4;
}

void __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t *v40;
  char v41;

  v5 = a2;
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isPreferredByItself") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "preferredEnvironments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredEnvironments:forEnvironment:", v8, v6);

    v41 = 0;
    objc_msgSend(*(id *)(a1 + 32), "preferredEnvironmentsForEnvironment:isFinal:", v6, &v41);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      if (objc_msgSend(v5, "isPrimaryPreference"))
      {
        objc_msgSend(*(id *)(a1 + 32), "deepestPrimaryPreferredEnvironmentForEnvironment:", *(_QWORD *)(a1 + 40));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
      _FEFocusItemSafeCast(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugStack");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD17C8];
      v17 = v6;
      v39 = v10;
      v40 = a3;
      v38 = v16;
      v18 = (void *)v15;
      if (v17)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v17);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = CFSTR("(nil)");
      }

      v27 = v14;
      if (v27)
      {
        v28 = v14;
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p>"), v31, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "stringWithFormat:", CFSTR("Using cached result for %@. Preferring %@"), v22, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 2, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMessage:", v34);

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v28);
        v35 = 3;
      }
      else
      {

        objc_msgSend(v16, "stringWithFormat:", CFSTR("Using cached result for %@. Preferring %@"), v22, CFSTR("(nil)"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 2, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMessage:", v37);

        v35 = 1;
      }
      *v40 = v35;

      goto LABEL_23;
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "focusSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
    && objc_msgSend(v23, "_isEnvironmentLocked:", v6))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v6);
  }
  if ((objc_msgSend(v5, "isPreferredByItself") & 1) == 0)
  {
    _FEFocusItemSafeCast(v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24 && v25 && _FEFocusItemIsFocusedOrFocusableInFocusSystem(v25, v24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v26);
      objc_msgSend(*(id *)(a1 + 56), "_reportFoundFocusableItem:inContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
    }

  }
LABEL_23:

}

void __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && objc_msgSend(*(id *)(a1 + 32), "_isEnvironmentLocked:", v5))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  }
  if (objc_msgSend(v6, "isLeafPreference"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    *a3 = 3;
  }

}

void __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    *a3 = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "_overridingPreferredFocusEnvironment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

void __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end

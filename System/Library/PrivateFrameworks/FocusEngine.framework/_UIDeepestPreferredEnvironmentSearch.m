@implementation _UIDeepestPreferredEnvironmentSearch

- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  _FEFocusEnvironmentPreferenceEnumerator *v10;
  uint64_t v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _UIDeepestPreferredEnvironmentSearch *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  _UIDeepestPreferredEnvironmentSearch *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v7 = a3;
  v26 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[_UIDeepestPreferredEnvironmentSearch _reportStartingSearch](self, "_reportStartingSearch");
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "focusSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_deepestPreferredFocusableItemCacheForCurrentUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_FEFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_FEFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", objc_msgSend(v26, "isMovementRequest") ^ 1);
  -[_FEFocusEnvironmentPreferenceEnumerator setDebugLog:](v10, "setDebugLog:", self->_debugLog);
  v11 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke;
  v36[3] = &unk_250D3A208;
  v39 = &v47;
  v40 = &v53;
  v12 = v9;
  v37 = v12;
  v38 = self;
  -[_FEFocusEnvironmentPreferenceEnumerator setDidVisitAllPreferencesForEnvironmentHandler:](v10, "setDidVisitAllPreferencesForEnvironmentHandler:", v36);
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2;
  v35[3] = &unk_250D3A230;
  v35[4] = &v53;
  -[_FEFocusEnvironmentPreferenceEnumerator setShouldInferPreferenceForEnvironmentHandler:](v10, "setShouldInferPreferenceForEnvironmentHandler:", v35);
  v13 = -[_UIDeepestPreferredEnvironmentSearch allowsOverridingPreferedFocusEnvironments](self, "allowsOverridingPreferedFocusEnvironments");
  v24 = v7;
  if (v7)
  {
    v14 = v24;
    do
    {
      v15 = (void *)v54[5];
      v54[5] = 0;

      v16 = (void *)v48[5];
      v48[5] = 0;

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3;
      v27[3] = &unk_250D3A258;
      v28 = v12;
      v32 = &v47;
      v17 = v14;
      v29 = v17;
      v33 = &v53;
      v18 = v26;
      v34 = &v41;
      v30 = v18;
      v31 = self;
      -[_FEFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v10, "enumeratePreferencesForEnvironment:usingBlock:", v17, v27);
      if (v42[5])
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
      -[_UIDeepestPreferredEnvironmentSearch _reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:](self, "_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:", v54[5]);
      if (v42[5])
        v19 = 0;
      else
        v19 = v13;
      if (v19 && (v20 = v48[5]) != 0)
      {
        -[_UIDeepestPreferredEnvironmentSearch _overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:](self, "_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:", v20, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

    }
    while (v14);
  }
  v21 = (id)v54[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v21;
}

- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _FEFocusEnvironmentPreferenceEnumerator *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 701, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v8 = -[_FEFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_FEFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", 1);
  -[_FEFocusEnvironmentPreferenceEnumerator setAllowsInferringPreferences:](v8, "setAllowsInferringPreferences:", 0);
  if (v5)
  {
    v9 = v16;
    while (1)
    {
      v10 = (void *)v28[5];
      v28[5] = 0;

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke;
      v17[3] = &unk_250D3A280;
      v19 = &v21;
      v18 = v6;
      v20 = &v27;
      -[_FEFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v8, "enumeratePreferencesForEnvironment:usingBlock:", v9, v17);
      if (v22[5])
      {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
        if (v22[5])
          break;
      }
      v11 = v28[5];
      if (!v11)
        break;
      -[_UIDeepestPreferredEnvironmentSearch _overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:](self, "_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:", v11, v7);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
      if (!v12)
        goto LABEL_11;
    }

  }
LABEL_11:
  v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredDestinationEnvironment"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visitedFocusEnvironments"));

LABEL_3:
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke;
  v17[3] = &unk_250D3A2A8;
  v10 = v9;
  v18 = v10;
  v19 = &v27;
  v20 = &v21;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v17);
  v11 = v28[5];
  if (v11)
  {
    -[_UIDeepestPreferredEnvironmentSearch _reportDidFindOverridingPreferredFocusEnvironment:source:](self, "_reportDidFindOverridingPreferredFocusEnvironment:source:", v11, v22[5]);
    v12 = (void *)v28[5];
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_reportStartingSearch
{
  void *v2;
  id v3;

  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_FEDebugLogMessage messageWithString:](_FEDebugLogMessage, "messageWithString:", CFSTR("Starting preferred focus search."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMessage:", v2);

}

- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "debugStack", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 2, CFSTR("It's focusable!"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v4);

}

- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  objc_msgSend(v5, "debugStack");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v5, "isPreferredByItself");

    if (a4 != 3 && (v8 & 1) == 0)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      objc_msgSend(v5, "preferredEnvironments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "preferredEnvironments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        objc_msgSend(v5, "preferredEnvironments");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v11 + 1, v13 - (v11 + 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke;
        v18[3] = &unk_250D3A2D0;
        v19 = v5;
        v20 = &v21;
        objc_msgSend(v14, "enumerateObjectsAtIndexes:options:usingBlock:", v15, 0, v18);

      }
      if (*((_BYTE *)v22 + 24))
      {
        objc_msgSend(v5, "debugStack");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 3, CFSTR("Found nothing."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addMessage:", v17);

      }
      _Block_object_dispose(&v21, 8);
    }
  }

}

- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = v14;
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("(nil)");
    }

    objc_msgSend(v6, "stringWithFormat:", CFSTR("Finished enumerating preferred environments. Preferring %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addMessage:", v13);

  }
}

- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = v6;
  v22 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v22);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10 = v22;
  }
  else
  {
    v14 = CFSTR("(nil)");
  }

  v15 = v7;
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("(nil)");
  }

  objc_msgSend(v9, "stringWithFormat:", CFSTR("Found overide to environment %@. (source: %@)"), v14, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMessage:", v21);

}

- (void)_reportDidFindLockedFocusEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v13 = v4;
  if (v13)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v13);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Found locked focus environment %@."), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v12);

}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (_FEDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
  objc_storeStrong((id *)&self->_debugLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLog, 0);
}

@end

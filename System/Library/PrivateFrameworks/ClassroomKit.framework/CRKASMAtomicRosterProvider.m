@implementation CRKASMAtomicRosterProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKASMAtomicRosterProvider endObservingRoster](self, "endObservingRoster");
  v3.receiver = self;
  v3.super_class = (Class)CRKASMAtomicRosterProvider;
  -[CRKASMAtomicRosterProvider dealloc](&v3, sel_dealloc);
}

- (CRKASMAtomicRosterProvider)initWithRosterProvider:(id)a3
{
  CRKASMAtomicRosterProvider *v3;
  uint64_t v4;
  NSMutableDictionary *completionsByConstraint;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKASMAtomicRosterProvider;
  v3 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v7, sel_initWithRosterProvider_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    completionsByConstraint = v3->_completionsByConstraint;
    v3->_completionsByConstraint = (NSMutableDictionary *)v4;

    -[CRKASMAtomicRosterProvider beginObservingRoster](v3, "beginObservingRoster");
  }
  return v3;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17F0];
  v9 = a4;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 56, CFSTR("%@ must be called from the main thread"), v18);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke;
  v21[3] = &unk_24D9CA388;
  v21[4] = self;
  v22 = v7;
  v23 = v10;
  v12 = v10;
  v13 = v7;
  -[CRKASMAtomicRosterProvider pushCompletion:withRosterEvaluator:](self, "pushCompletion:withRosterEvaluator:", v9, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke_2;
  v19[3] = &unk_24D9C8FB8;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "createCourseWithProperties:completion:", v13, v19);

}

BOOL __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "coursesMatchingCreateProperties:inRoster:createdAfter:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateConstraintForUnderlyingCompletion:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  char v33;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x24BDD17F0];
  v12 = a5;
  if ((objc_msgSend(v11, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 76, CFSTR("%@ must be called from the main thread"), v27);

  }
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "roster");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "usersToRemove");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "crk_mapUsingBlock:", &__block_literal_global_103);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  v20 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_2;
  v30[3] = &unk_24D9CA3D0;
  v30[4] = self;
  v31 = v9;
  v33 = v19;
  v32 = v10;
  v21 = v10;
  v22 = v9;
  -[CRKASMAtomicRosterProvider pushCompletion:withRosterEvaluator:](self, "pushCompletion:withRosterEvaluator:", v12, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_3;
  v28[3] = &unk_24D9C8FB8;
  v28[4] = self;
  v29 = v23;
  v25 = v23;
  objc_msgSend(v24, "updateCourseWithIdentifier:properties:completion:", v22, v21, v28);

}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "courseWithIdentifier:inRoster:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 48), "areFulfilledByCourse:", v3);
  else
    v4 = *(_BYTE *)(a1 + 56) != 0;

  return v4;
}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateConstraintForUnderlyingCompletion:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 102, CFSTR("%@ must be called from the main thread"), v15);

  }
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke;
  v18[3] = &unk_24D9CA3F8;
  v18[4] = self;
  v19 = v7;
  v10 = v7;
  -[CRKASMAtomicRosterProvider pushCompletion:withRosterEvaluator:](self, "pushCompletion:withRosterEvaluator:", v8, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_24D9C8FB8;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "removeCourseWithIdentifier:completion:", v10, v16);

}

BOOL __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "courseWithIdentifier:inRoster:", *(_QWORD *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateConstraintForUnderlyingCompletion:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)beginObservingRoster
{
  id v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("roster"), 0, CFSTR("CRKASMAtomicRosterProviderObservationContext"));

}

- (void)endObservingRoster
{
  id v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("roster"), CFSTR("CRKASMAtomicRosterProviderObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("CRKASMAtomicRosterProviderObservationContext"))
  {
    -[CRKASMAtomicRosterProvider evalutateConstraintsForRosterUpdate](self, "evalutateConstraintsForRosterUpdate", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMAtomicRosterProvider;
    -[CRKASMAtomicRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)pushCompletion:(id)a3 withRosterEvaluator:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17F0];
  v9 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 144, CFSTR("%@ must be called from the main thread"), v15);

  }
  +[CRKASMAtomicRosterConstraint constraintWithRosterEvaluator:](CRKASMAtomicRosterConstraint, "constraintWithRosterEvaluator:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x219A226E8](v9);

  -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

  return v10;
}

- (void)evaluateConstraintForUnderlyingCompletion:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 151, CFSTR("%@ must be called from the main thread"), v16);

  }
  -[CRKASMRosterProviderDecoratorBase roster](self, "roster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v17);
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v7)
      {
        -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v17);

        ((void (**)(_QWORD, id))v10)[2](v10, v7);
      }
      else
      {
        -[CRKASMRosterProviderDecoratorBase roster](self, "roster");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isFulfilledByRoster:", v12);

        if (v13)
        {
          -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v17);

          v10[2](v10, 0);
        }
      }
    }

  }
}

- (void)evalutateConstraintsForRosterUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMAtomicRosterProvider.m"), 182, CFSTR("%@ must be called from the main thread"), v25);

  }
  -[CRKASMRosterProviderDecoratorBase roster](self, "roster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
          -[CRKASMRosterProviderDecoratorBase roster](self, "roster");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isFulfilledByRoster:", v13);

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          -[CRKASMAtomicRosterProvider completionsByConstraint](self, "completionsByConstraint");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v20);

          v22[2](v22, 0);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v17);
    }

  }
}

- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "courses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__CRKASMAtomicRosterProvider_courseWithIdentifier_inRoster___block_invoke;
  v10[3] = &unk_24D9C8160;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "crk_firstMatching:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__CRKASMAtomicRosterProvider_courseWithIdentifier_inRoster___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)coursesMatchingCreateProperties:(id)a3 inRoster:(id)a4 createdAfter:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "courses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__CRKASMAtomicRosterProvider_coursesMatchingCreateProperties_inRoster_createdAfter___block_invoke;
  v14[3] = &unk_24D9CA420;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "crk_filterUsingBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __84__CRKASMAtomicRosterProvider_coursesMatchingCreateProperties_inRoster_createdAfter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == *(void **)(a1 + 32))
    v6 = objc_msgSend(*(id *)(a1 + 40), "areFulfilledByCourse:", v3);
  else
    v6 = 0;

  return v6;
}

- (NSMutableDictionary)completionsByConstraint
{
  return self->_completionsByConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionsByConstraint, 0);
}

@end

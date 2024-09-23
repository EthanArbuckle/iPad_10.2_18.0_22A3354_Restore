@implementation CUIKUnsliceOperation

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_objectsForInverse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CUIKUserOperation objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CUIKUnsliceOperation _inverseForUndoSliceOutcome:](self, "_inverseForUndoSliceOutcome:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_inverseForUndoSliceOutcome:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = -[EKUndoSliceOutcome initResliceFromOutcome:]([EKUndoSliceOutcome alloc], "initResliceFromOutcome:", v3);
  objc_msgSend(v3, "masterToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "mainSeriesDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "masterEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "createdSeriesDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "masterEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "changeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recurrenceRuleString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceChangeValue:forKey:", v11, CFSTR("recurrenceRuleString"));

    objc_msgSend(v9, "_initChangeSetIfNone");
    objc_msgSend(v9, "changeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recurrenceRuleString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceChangeValue:forKey:", v13, CFSTR("recurrenceRuleString"));

  }
  return v4;
}

- (id)originalObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "originalPostSliceDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "originalEventToSliceOn");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(v9, "masterToDelete");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v9, "masterToDelete");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

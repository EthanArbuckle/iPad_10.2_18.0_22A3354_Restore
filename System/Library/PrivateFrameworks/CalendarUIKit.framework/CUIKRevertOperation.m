@implementation CUIKRevertOperation

+ (id)operationForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_currentSpan"))
  {
    v27 = a1;
    v28 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v10)
      goto LABEL_20;
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "masterEvent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recurrenceIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 != v14 && v15 != 0)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v16);

            objc_msgSend(v15, "recurrenceIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              objc_msgSend(v15, "recurrenceIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v8;
              v19 = v15;
LABEL_16:
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v16);

            }
            continue;
          }
          v18 = v8;
          v19 = v14;
          goto LABEL_16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v11)
      {
LABEL_20:

        objc_msgSend(v7, "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "allValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v28;
        a1 = v27;
        break;
      }
    }
  }
  objc_msgSend(a1, "operationWithObjects:span:", v6, objc_msgSend(v4, "_currentSpan"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setOriginalObjects:", v25);

  return v24;
}

- (id)_actionName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CUIKUserOperation objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[CUIKUserOperation objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Action: Revert “%@”"), CFSTR("Revert “%@”"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CUIKBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Action: Revert events"), CFSTR("Revert Events"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "objectToSaveForRevertingChangeToObject:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v13;
        }
        objc_msgSend(v12, "specificIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "revert"))
          objc_msgSend(v5, "objectWithSpecificIdentifierWasReverted:", v14);
        else
          v10 = 0;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10 & 1;
}

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_inverseOperation
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKRevertOperation;
  -[CUIKUserOperation _inverseOperation](&v6, sel__inverseOperation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKRevertOperation originalChangeTracker](self, "originalChangeTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalChangeTracker:", v4);

  return v3;
}

- (EKChangeTracker)originalChangeTracker
{
  return (EKChangeTracker *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginalChangeTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChangeTracker, 0);
}

@end

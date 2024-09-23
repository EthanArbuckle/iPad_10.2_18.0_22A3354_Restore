@implementation CUIKDeleteOperation

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
  void *v12;

  -[CUIKUserOperation objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CUIKUserOperation objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 1)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Action: Delete “%@”"), CFSTR("Delete “%@”"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "actionStringsPluralDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Action: Delete %@"), CFSTR("Delete %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id obj;
  void *v24;
  uint64_t v25;
  CUIKDeleteOperation *v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = -[CUIKDeleteOperation _canBeUndone](self, "_canBeUndone");
  if (v28)
  {
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[CUIKUserOperation objects](self, "objects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = self;
  -[CUIKUserOperation objects](self, "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {
    v10 = 1;
    goto LABEL_28;
  }
  v9 = v8;
  v25 = *(_QWORD *)v30;
  v10 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v30 != v25)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (v5)
      {
        objc_msgSend(v5, "objectToSaveForUndoingChangeToObject:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v12;
      }
      v14 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        v16 = v15;
        if (v15 && (objc_msgSend(v15, "isDetached") & 1) == 0)
        {
          v17 = objc_msgSend(v16, "hasRecurrenceRules") ^ 1;
          goto LABEL_18;
        }
      }
      else
      {
        v16 = 0;
      }
      v17 = 1;
LABEL_18:
      if (v28)
      {
        objc_msgSend(v14, "snapshotCopy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v17)
          goto LABEL_22;
        objc_msgSend(v18, "markAsUndeleted");
        objc_msgSend(v24, "addObject:", v19);

      }
      v19 = 0;
LABEL_22:
      v20 = objc_msgSend(v14, "CUIKEditingContext_removeWithSpan:error:", -[CUIKUserOperation span](v27, "span"), a4);
      if (((!v28 | v17) & 1) == 0)
      {
        objc_msgSend(v14, "inverseObjectWithObject:diff:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v21);

      }
      v10 &= v20;

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v9);
LABEL_28:

  if (v28)
  {
    -[CUIKDeleteOperation setPrecomputedInverseObjects:](v27, "setPrecomputedInverseObjects:", v24);
    -[CUIKUserOperation _precomputeInverseOperation](v27, "_precomputeInverseOperation");
  }

  return v10;
}

- (BOOL)_canBeUndone
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[CUIKUserOperation span](self, "span"))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "isSelfOrganizedInvitation") & 1) != 0)
        {
          v3 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v3 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v3 = 1;
  }
LABEL_15:

  return v3;
}

- (Class)_inverseOperationClass
{
  void *v2;

  if (-[CUIKDeleteOperation _canBeUndone](self, "_canBeUndone"))
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (Class)v2;
}

- (id)_objectsForInverse
{
  void *v3;

  if (-[CUIKUserOperation span](self, "span"))
  {
    v3 = 0;
  }
  else
  {
    -[CUIKDeleteOperation precomputedInverseObjects](self, "precomputedInverseObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)precomputedInverseObjects
{
  return self->_precomputedInverseObjects;
}

- (void)setPrecomputedInverseObjects:(id)a3
{
  objc_storeStrong((id *)&self->_precomputedInverseObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputedInverseObjects, 0);
}

@end

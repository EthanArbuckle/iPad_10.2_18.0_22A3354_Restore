@implementation HUQuickControlCompoundItemPredicate

- (HUQuickControlCompoundItemPredicate)init
{
  return -[HUQuickControlCompoundItemPredicate initWithRequiredSubpredicates:optionalSubpredicates:](self, "initWithRequiredSubpredicates:optionalSubpredicates:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4
{
  return -[HUQuickControlCompoundItemPredicate initWithRequiredSubpredicates:optionalSubpredicates:minimumNumberOfMatchedPredicates:](self, "initWithRequiredSubpredicates:optionalSubpredicates:minimumNumberOfMatchedPredicates:", a3, a4, 1);
}

- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4 minimumNumberOfMatchedPredicates:(unint64_t)a5
{
  id v8;
  id v9;
  HUQuickControlCompoundItemPredicate *v10;
  uint64_t v11;
  NSArray *requiredSubpredicates;
  uint64_t v13;
  NSArray *optionalSubpredicates;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlCompoundItemPredicate;
  v10 = -[HUQuickControlCompoundItemPredicate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    requiredSubpredicates = v10->_requiredSubpredicates;
    v10->_requiredSubpredicates = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    optionalSubpredicates = v10->_optionalSubpredicates;
    v10->_optionalSubpredicates = (NSArray *)v13;

    v10->_minimumNumberOfMatchedPredicates = a5;
  }

  return v10;
}

- (id)allSubpredicates
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[HUQuickControlCompoundItemPredicate requiredSubpredicates](self, "requiredSubpredicates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCompoundItemPredicate optionalSubpredicates](self, "optionalSubpredicates");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)maximumNumberOfMatches
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HUQuickControlCompoundItemPredicate allSubpredicates](self, "allSubpredicates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "maximumNumberOfMatches");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)matchingControlItemsForControlItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HUQuickControlCompoundItemPredicate requiredSubpredicates](self, "requiredSubpredicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    while (2)
    {
      v11 = 0;
      v12 = v8 + v9;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        if (!objc_msgSend(v4, "count"))
          goto LABEL_13;
        objc_msgSend(v13, "matchingControlItemsForControlItems:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "count"))
        {

LABEL_13:
          v12 = v9 + v11;
          goto LABEL_14;
        }
        objc_msgSend(v4, "removeObjectsInArray:", v14);
        objc_msgSend(v5, "addObjectsFromArray:", v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  -[HUQuickControlCompoundItemPredicate requiredSubpredicates](self, "requiredSubpredicates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v12 >= v16)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HUQuickControlCompoundItemPredicate optionalSubpredicates](self, "optionalSubpredicates", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
LABEL_18:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
        if (!objc_msgSend(v4, "count"))
          break;
        objc_msgSend(v22, "matchingControlItemsForControlItems:", v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          ++v12;
          objc_msgSend(v5, "addObjectsFromArray:", v23);
          objc_msgSend(v4, "removeObjectsInArray:", v23);
        }

        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v19)
            goto LABEL_18;
          break;
        }
      }
    }

  }
  else
  {
    objc_msgSend(v5, "removeAllObjects");
  }
  if (v12 < -[HUQuickControlCompoundItemPredicate minimumNumberOfMatchedPredicates](self, "minimumNumberOfMatchedPredicates"))objc_msgSend(v5, "removeAllObjects");

  return v5;
}

- (NSArray)requiredSubpredicates
{
  return self->_requiredSubpredicates;
}

- (NSArray)optionalSubpredicates
{
  return self->_optionalSubpredicates;
}

- (unint64_t)minimumNumberOfMatchedPredicates
{
  return self->_minimumNumberOfMatchedPredicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalSubpredicates, 0);
  objc_storeStrong((id *)&self->_requiredSubpredicates, 0);
}

@end

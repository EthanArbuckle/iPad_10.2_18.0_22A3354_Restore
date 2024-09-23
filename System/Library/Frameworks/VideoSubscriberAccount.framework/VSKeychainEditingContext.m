@implementation VSKeychainEditingContext

- (VSKeychainEditingContext)init
{
  VSKeychainEditingContext *v2;
  NSMutableSet *v3;
  NSMutableSet *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSKeychainEditingContext;
  v2 = -[VSKeychainEditingContext init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    items = v2->_items;
    v2->_items = v3;

  }
  return v2;
}

- (void)_populateQuery:(__CFDictionary *)a3 usingPredicate:(id)a4 withItemKind:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const void *v48;
  id v49;
  const void *Value;
  void *v51;
  BOOL v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("Unexpectedly, predicate was %@, instead of NSCompoundPredicate."), v13);

    }
    v14 = v8;
    if (objc_msgSend(v14, "compoundPredicateType") != 1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported compound predicate: %@"), v14);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v14, "subpredicates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v74 != v18)
            objc_enumerationMutation(v15);
          -[VSKeychainEditingContext _populateQuery:usingPredicate:withItemKind:](self, "_populateQuery:usingPredicate:withItemKind:", a3, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), v9);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v17);
    }

    goto LABEL_61;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "raise:format:", v21, CFSTR("Unexpectedly, predicate was %@, instead of NSComparisonPredicate."), v23);

    }
    v24 = v8;
    objc_msgSend(v24, "leftExpression");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightExpression");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "expressionType");
    v28 = objc_msgSend(v26, "expressionType");
    v66 = v26;
    if ((v27 != 3 || (v29 = v26, v30 = v25, v28)) && (v27 || (v29 = v25, v30 = v26, v28 != 3)))
    {
      v33 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported expressions in comparison predicate: %@"), v24);
      v29 = 0;
    }
    else
    {
      v31 = v25;
      v32 = v26;
      if (v30)
        goto LABEL_28;
      v33 = *MEMORY[0x1E0C99778];
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v33, CFSTR("The keyPathExpressionOrNil parameter must not be nil."));
    v30 = 0;
LABEL_28:
    v36 = v25;
    v37 = v30;
    if (!v29)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The constantExpressionOrNil parameter must not be nil."));
    v38 = v29;
    objc_msgSend(v37, "keyPath");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39
      || (objc_msgSend(v9, "attributesByName"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v40, "objectForKey:", v39),
          v41 = (void *)objc_claimAutoreleasedReturnValue(),
          v40,
          !v41))
    {
      v42 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown keypath %@ for item kind %@"), v39, v9);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v42, CFSTR("The attributeOrNil parameter must not be nil."));
      v41 = 0;
    }
    v65 = (void *)v39;
    v43 = v41;
    objc_msgSend(v38, "constantValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v43;
    objc_msgSend(v43, "attributeValueClassName");
    v44 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v44);

    v45 = objc_msgSend(v24, "predicateOperatorType");
    if (v45 == 10)
    {
      v46 = v36;
      v52 = v36 == v37;
      v47 = v66;
      if (v52 && v66 == v38)
      {
        v53 = v67;
        if (!objc_msgSend(v67, "conformsToProtocol:", &unk_1EFC97B68))
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to enumerate constant value: %@"), v67);
          v51 = v65;
          goto LABEL_60;
        }
        v61 = v37;
        v62 = v46;
        v63 = v24;
        v64 = v8;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v54 = v67;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v70;
          v58 = *MEMORY[0x1E0C99778];
          do
          {
            for (j = 0; j != v56; ++j)
            {
              if (*(_QWORD *)v70 != v57)
                objc_enumerationMutation(v54);
              v60 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
              if ((objc_opt_isKindOfClass() & 1) == 0)
                objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v58, CFSTR("Unexpected value %@ for attribute %@"), v60, v68);
            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
          }
          while (v56);
        }

        v24 = v63;
        v8 = v64;
        v37 = v61;
        v46 = v62;
        v47 = v66;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported left (%@) and right (%@) expressions for IN operator."), v46, v66);
      }
      v51 = v65;
    }
    else
    {
      v46 = v36;
      if (v45 == 4)
      {
        v47 = v66;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected value %@ for attribute %@"), v67, v68);
        v48 = (const void *)objc_msgSend(v68, "secItemAttributeKey");
        v49 = v67;
        if (CFDictionaryContainsKey(a3, v48))
        {
          Value = CFDictionaryGetValue(a3, v48);
          v51 = v65;
          if (!CFEqual(Value, v49))
          {
            CFRelease(v49);
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Duplicative predicate for key path %@"), v65);
          }
        }
        else
        {
          CFDictionarySetValue(a3, v48, v49);
          v51 = v65;
        }
        CFRelease(v49);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported operator type (%lu) in comparison predicate: %@"), v45, v24);
        v51 = v65;
        v47 = v66;
      }
    }
    v53 = v67;
LABEL_60:

    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "isEqual:", v34);

  if (v8 && (v35 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported predicate: %@"), v8);
LABEL_61:

}

- (id)_findOrCreateItemForCommittedValues:(id)a3 withItemKind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSString *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VSKeychainEditingContext items](self, "items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      objc_msgSend(v13, "committedValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v6);

      if ((v15 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v13;

    if (v16)
      goto LABEL_13;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v7, "itemClassName");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  v18 = NSClassFromString(v17);

  v16 = (id)objc_msgSend([v18 alloc], "initWithItemKind:insertIntoEditingContext:", v7, 0);
  objc_msgSend(v16, "setEditingContext:", self);
  objc_msgSend(v16, "setHasFaultForData:", 1);
  -[VSKeychainEditingContext items](self, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v16);

  objc_msgSend(v16, "_setCommittedValues:registeringUndo:", v6, 0);
  v20 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v16, "setPrimitiveValues:", v20);

  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The itemOrNil parameter must not be nil."));
LABEL_13:

  return v16;
}

- (void)_populateResult:(id)a3 forRequest:(id)a4 fromMatch:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VSKeychainEditingContext *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v23 = self;
  v32 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "predicate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v7, "itemKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceUnwrapObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v10, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "name", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "defaultValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", objc_msgSend(v17, "secItemAttributeKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 || (v21 = v19) != 0)
          objc_msgSend(v11, "setObject:forKey:", v21, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  -[VSKeychainEditingContext _findOrCreateItemForCommittedValues:withItemKind:](v23, "_findOrCreateItemForCommittedValues:withItemKind:", v11, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "evaluateWithObject:", v22))
    objc_msgSend(v26, "addObject:", v22);

}

- (id)_queryForItemValues:(id)a3 withItemKind:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "properties", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "secItemAttributeKey");
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "setObject:forKey:", v16, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_deleteQueryForItemValues:(id)a3 withItemKind:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[5];

  v26[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26[0] = CFSTR("accessGroup");
  v26[1] = CFSTR("creatorCode");
  v26[2] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = v6;
  objc_msgSend(v6, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", v17))
        {
          objc_msgSend(v5, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v7, "setObject:forKey:", v18, objc_msgSend(v16, "secItemAttributeKey"));

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0CD6B88], *MEMORY[0x1E0CD6B80]);
  return v7;
}

- (void)_populateErrors:(id)a3 withError:(id)a4 affectingItem:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("VSKeychainAffectedItemsKey"));
  v11 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v8, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "code");

  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v14);

}

- (void)fulfillFault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v4 = a3;
  if ((objc_msgSend(v4, "hasFaultForData") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Item must have a fault for its data."));
  objc_msgSend(v4, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "committedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainEditingContext _queryForItemValues:withItemKind:](self, "_queryForItemValues:withItemKind:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "secItemClass");
  objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
  -[VSKeychainEditingContext keychainStore](self, "keychainStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v9, "findItemsMatchingQuery:error:", v7, &v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v32;

  if (v10)
  {
    v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !-[NSObject count](v12, "count"))
    {
      VSErrorLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VSKeychainEditingContext fulfillFault:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v4, "primitiveValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSObject copy](v13, "copy");
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("data"));

        objc_msgSend(v4, "committedValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NSObject copy](v13, "copy");

        objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("data"));
        objc_msgSend(v4, "setHasFaultForData:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected result type."));
      }
    }
  }
  else
  {
    VSErrorLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VSKeychainEditingContext fulfillFault:].cold.1((uint64_t)v11, v12, v18, v19, v20, v21, v22, v23);
  }

}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  __CFDictionary *Mutable;
  void *v8;
  void *v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v48;
  void *v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  VSKeychainEditingContext *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v6, "itemKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)objc_msgSend(v9, "secItemClass"));
  objc_msgSend(v6, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainEditingContext _populateQuery:usingPredicate:withItemKind:](self, "_populateQuery:usingPredicate:withItemKind:", Mutable, v10, v9);
  v11 = (const void *)*MEMORY[0x1E0CD6B80];
  if (!CFDictionaryContainsKey(Mutable, (const void *)*MEMORY[0x1E0CD6B80]))
    CFDictionarySetValue(Mutable, v11, (const void *)*MEMORY[0x1E0CD6B88]);
  v51 = objc_msgSend(v6, "fetchLimit");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6F30], (const void *)*MEMORY[0x1E0CD6F38]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
  -[VSKeychainEditingContext keychainStore](self, "keychainStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  objc_msgSend(v12, "findItemsMatchingQuery:error:", Mutable, &v64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v64;

  if (v13)
  {
    v54 = v6;
    v15 = v13;
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_opt_class();
    v53 = v16;
    v49 = v15;
    v50 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = self;
      v48 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v17;
        v16 = v53;
        objc_msgSend(v21, "raise:format:", v18, CFSTR("Unexpectedly, result was %@, instead of NSArray."), v20);

      }
      v22 = v15;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v61;
        v26 = *MEMORY[0x1E0C99768];
        v52 = *MEMORY[0x1E0C99778];
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v61 != v25)
              objc_enumerationMutation(v22);
            v28 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v29 = (void *)MEMORY[0x1E0C99DA0];
                v30 = (objc_class *)objc_opt_class();
                NSStringFromClass(v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v29;
                v6 = v54;
                objc_msgSend(v32, "raise:format:", v52, CFSTR("Unexpectedly, matchingValue was %@, instead of NSDictionary."), v31);

                v16 = v53;
              }
              -[VSKeychainEditingContext _populateResult:forRequest:fromMatch:](v55, "_populateResult:forRequest:fromMatch:", v16, v6, v28);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v26, CFSTR("Unexpected matching value: %@"), v28);
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v24);
      }

      v9 = v48;
      self = v55;
      v14 = v50;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v33 = (void *)MEMORY[0x1E0C99DA0];
          v34 = *MEMORY[0x1E0C99778];
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v34;
          v16 = v53;
          objc_msgSend(v33, "raise:format:", v37, CFSTR("Unexpectedly, result was %@, instead of NSDictionary."), v36);

        }
        v6 = v54;
        -[VSKeychainEditingContext _populateResult:forRequest:fromMatch:](self, "_populateResult:forRequest:fromMatch:", v16, v54, v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected match result: %@"), v15);
      }
    }
    objc_msgSend(v6, "sortDescriptors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v16, "sortUsingDescriptors:", v38);
    v39 = objc_msgSend(v16, "count");
    if (v51 && v39 > v51)
      objc_msgSend(v16, "removeObjectsInRange:");
    if (objc_msgSend(v6, "includesDataValues"))
    {
      v40 = v13;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v41 = v16;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v57 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            if (objc_msgSend(v46, "hasFaultForData"))
              -[VSKeychainEditingContext fulfillFault:](self, "fulfillFault:", v46);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v43);
      }

      v16 = v53;
      v6 = v54;
      v13 = v40;
      v14 = v50;
    }

  }
  else
  {
    v16 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v16;
}

- (void)insertItem:(id)a3
{
  void *v4;
  VSKeychainEditingContext *v5;
  VSKeychainEditingContext *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "hasChanges"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempting to insert an item that has changes."));
  -[VSKeychainEditingContext undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editingContext");
  v5 = (VSKeychainEditingContext *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v5 != self)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Item already has another context."));
  }
  else
  {
    objc_msgSend(v10, "setEditingContext:", self);
    objc_msgSend(v4, "prepareWithInvocationTarget:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditingContext:", 0);

  }
  -[VSKeychainEditingContext items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);
  objc_msgSend(v4, "prepareWithInvocationTarget:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v10);

  objc_msgSend(v10, "setInserted:", 1);
}

- (void)deleteItem:(id)a3
{
  VSKeychainEditingContext *v4;
  VSKeychainEditingContext *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "editingContext");
  v4 = (VSKeychainEditingContext *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (v4 != self)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Item does not belong to this context."));
    objc_msgSend(v6, "setDeleted:", 1);
  }

}

- (id)_subsetOfRegisteredItemsWithKeyPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v5, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainEditingContext items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredSetUsingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)insertedItems
{
  return (NSSet *)-[VSKeychainEditingContext _subsetOfRegisteredItemsWithKeyPath:](self, "_subsetOfRegisteredItemsWithKeyPath:", CFSTR("inserted"));
}

- (NSSet)deletedItems
{
  return (NSSet *)-[VSKeychainEditingContext _subsetOfRegisteredItemsWithKeyPath:](self, "_subsetOfRegisteredItemsWithKeyPath:", CFSTR("deleted"));
}

- (NSSet)updatedItems
{
  return (NSSet *)-[VSKeychainEditingContext _subsetOfRegisteredItemsWithKeyPath:](self, "_subsetOfRegisteredItemsWithKeyPath:", CFSTR("updated"));
}

- (VSKeychainStore)keychainStore
{
  VSKeychainEditingContext *v2;
  VSKeychainStore *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_keychainStore;
  if (!v3)
  {
    v3 = objc_alloc_init(VSKeychainStore);
    objc_storeStrong((id *)&v2->_keychainStore, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (BOOL)save:(id *)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VSKeychainEditingContext *v18;
  int v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  id obj;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  char v87;
  VSKeychainEditingContext *v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[5];
  id v105;
  id v106;
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint8_t v115[128];
  uint8_t buf[4];
  const char *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v117 = "-[VSKeychainEditingContext save:]";
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VSKeychainEditingContext deletedItems](self, "deletedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[VSKeychainEditingContext updatedItems](self, "updatedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");

  -[VSKeychainEditingContext insertedItems](self, "insertedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v73 = (void *)v11;
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("VSInsertedKeychainItemsKey"));
  v64 = (void *)v9;
  objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("VSUpdatedKeychainItemsKey"));
  objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("VSDeletedKeychainItemsKey"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v12;
  objc_msgSend(v65, "postNotificationName:object:userInfo:", CFSTR("VSKeychainEditingContextWillSaveNotification"), self, v12);
  -[VSKeychainEditingContext undoManager](self, "undoManager");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainEditingContext keychainStore](self, "keychainStore");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v7;
  v83 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
  v86 = v5;
  v88 = self;
  if (v83)
  {
    v81 = *(_QWORD *)v110;
    v78 = *MEMORY[0x1E0CD6C98];
    v75 = *MEMORY[0x1E0C99778];
    v87 = 1;
    do
    {
      for (i = 0; i != v83; i = (char *)i + 1)
      {
        if (*(_QWORD *)v110 != v81)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "itemKind");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "committedValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSKeychainEditingContext _deleteQueryForItemValues:withItemKind:](self, "_deleteQueryForItemValues:withItemKind:", v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v15, "secItemClass"), v78);
        v108 = 0;
        v18 = self;
        v19 = objc_msgSend(v89, "deleteItemsMatchingQuery:error:", v17, &v108);
        v20 = (char *)v108;
        if (v19)
        {
          -[VSKeychainEditingContext undoManager](v18, "undoManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v104[0] = MEMORY[0x1E0C809B0];
          v104[1] = 3221225472;
          v104[2] = __33__VSKeychainEditingContext_save___block_invoke;
          v104[3] = &unk_1E93A1168;
          v104[4] = v18;
          v105 = v16;
          v106 = v15;
          v107 = v89;
          objc_msgSend(v21, "registerUndoWithTarget:handler:", v18, v104);

          objc_msgSend(v14, "setDeleted:", 0);
          -[VSKeychainEditingContext items](v18, "items");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "prepareWithInvocationTarget:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v14);

          objc_msgSend(v22, "removeObject:", v14);
          objc_msgSend(v69, "prepareWithInvocationTarget:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setEditingContext:", v18);

          v5 = v86;
          objc_msgSend(v14, "setEditingContext:", 0);

          self = v18;
        }
        else
        {
          VSDefaultLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v20;
            _os_log_impl(&dword_1D2419000, v25, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Deletion error %@", buf, 0xCu);
          }

          if (!v20)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v75, CFSTR("The deletionError parameter must not be nil."));
          self = v88;
          -[VSKeychainEditingContext _populateErrors:withError:affectingItem:](v88, "_populateErrors:withError:affectingItem:", v5, v20, v14);
          v87 = 0;
        }

      }
      v83 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
    }
    while (v83);
  }
  else
  {
    v87 = 1;
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v71 = v73;
  v84 = (id)objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  if (v84)
  {
    v82 = *(_QWORD *)v101;
    v79 = *MEMORY[0x1E0CD7010];
    v77 = *MEMORY[0x1E0CD6C98];
    v68 = *MEMORY[0x1E0C99768];
    v70 = *MEMORY[0x1E0CD6990];
    v67 = *MEMORY[0x1E0C99778];
    v26 = v89;
    do
    {
      for (j = 0; j != v84; j = (char *)j + 1)
      {
        if (*(_QWORD *)v101 != v82)
          objc_enumerationMutation(v71);
        v28 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v28, "itemKind");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "primitiveValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSKeychainEditingContext _queryForItemValues:withItemKind:](self, "_queryForItemValues:withItemKind:", v30, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v79);
        objc_msgSend(v31, "setObject:forKey:", objc_msgSend(v29, "secItemClass"), v77);
        v99 = 0;
        objc_msgSend(v26, "addItem:error:", v31, &v99);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (char *)v99;
        if (v32)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "primitiveValues");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "itemKind");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "attributesBySecItemAttributeKey");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKey:", v70);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              v38 = v37;
              objc_msgSend(v32, "objectForKey:", v70);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                objc_msgSend(v28, "primitiveValues");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setObject:forKey:", v39, v38);

              }
            }
            -[VSKeychainEditingContext undoManager](v88, "undoManager");
            v74 = v37;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __33__VSKeychainEditingContext_save___block_invoke_111;
            v95[3] = &unk_1E93A1190;
            v96 = v76;
            v97 = v29;
            v26 = v89;
            v98 = v89;
            v42 = v76;
            objc_msgSend(v41, "registerUndoWithTarget:handler:", v88, v95);

            objc_msgSend(v28, "_setCommittedValues:registeringUndo:", v42, 1);
            objc_msgSend(v28, "setInserted:", 0);

            self = v88;
            v5 = v86;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v68, CFSTR("Unexpected add result: %@"), v32);
          }
        }
        else
        {
          VSDefaultLogObject();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v33;
            _os_log_impl(&dword_1D2419000, v43, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Insertion error %@", buf, 0xCu);
          }

          if (!v33)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v67, CFSTR("The additionError parameter must not be nil."));
          -[VSKeychainEditingContext _populateErrors:withError:affectingItem:](self, "_populateErrors:withError:affectingItem:", v5, v33, v28);
          v87 = 0;
        }

      }
      v84 = (id)objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    }
    while (v84);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v85 = v64;
  v44 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v92;
    v47 = *MEMORY[0x1E0CD6C98];
    v80 = *MEMORY[0x1E0C99778];
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v92 != v46)
          objc_enumerationMutation(v85);
        v49 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
        objc_msgSend(v49, "itemKind");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "committedValues");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSKeychainEditingContext _queryForItemValues:withItemKind:](v88, "_queryForItemValues:withItemKind:", v51, v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "setObject:forKey:", objc_msgSend(v50, "secItemClass"), v47);
        objc_msgSend(v49, "changedValues");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSKeychainEditingContext _queryForItemValues:withItemKind:](v88, "_queryForItemValues:withItemKind:", v53, v50);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = 0;
        LODWORD(v53) = objc_msgSend(v89, "updateAttributes:ofItemsMatchingQuery:error:", v54, v52, &v90);
        v55 = (char *)v90;
        if ((_DWORD)v53)
        {
          objc_msgSend(v49, "primitiveValues");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "_setCommittedValues:registeringUndo:", v56, 1);

          objc_msgSend(v49, "setUpdated:", 0);
        }
        else
        {
          VSDefaultLogObject();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v55;
            _os_log_impl(&dword_1D2419000, v57, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Update error %@", buf, 0xCu);
          }

          if (!v55)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v80, CFSTR("The updateError parameter must not be nil."));
          -[VSKeychainEditingContext _populateErrors:withError:affectingItem:](v88, "_populateErrors:withError:affectingItem:", v86, v55, v49);
          v87 = 0;
        }

      }
      v45 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
    }
    while (v45);
  }

  if ((v87 & 1) != 0)
  {
    v59 = v65;
    v58 = v66;
    objc_msgSend(v65, "postNotificationName:object:userInfo:", CFSTR("VSKeychainEditingContextDidSaveNotification"), v88, v66);
    v60 = v86;
  }
  else
  {
    v60 = v86;
    v59 = v65;
    v58 = v66;
    if (a3)
    {
      if ((unint64_t)objc_msgSend(v86, "count") < 2)
      {
        objc_msgSend(v86, "firstObject");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v61, "setObject:forKey:", v86, CFSTR("VSKeychainDetailedErrorsKey"));
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSKeychainErrorDomain"), 0, v61);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v87 & 1;
}

void __33__VSKeychainEditingContext_save___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[8];
  id v16;
  uint8_t buf[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Will undo deletion.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queryForItemValues:withItemKind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
  v4 = objc_msgSend(*(id *)(a1 + 48), "secItemClass");
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0CD6C98]);
  v5 = *(void **)(a1 + 56);
  v16 = 0;
  objc_msgSend(v5, "addItem:error:", v3, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v6)
  {
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Undid deletion.", v15, 2u);
    }
  }
  else
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __33__VSKeychainEditingContext_save___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void __33__VSKeychainEditingContext_save___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[16];

  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will undo insertion.", buf, 2u);
  }

  objc_msgSend(v3, "_queryForItemValues:withItemKind:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 40), "secItemClass");
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0CD6C98]);
  v7 = *(void **)(a1 + 48);
  v19 = 0;
  v8 = objc_msgSend(v7, "deleteItemsMatchingQuery:error:", v5, &v19);
  v9 = v19;
  VSErrorLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      __33__VSKeychainEditingContext_save___block_invoke_111_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
  }
  else if (v11)
  {
    __33__VSKeychainEditingContext_save___block_invoke_111_cold_2((uint64_t)v9, v10, v13, v14, v15, v16, v17, v18);
  }

}

- (void)setKeychainStore:(id)a3
{
  objc_storeStrong((id *)&self->_keychainStore, a3);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (NSMutableSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
}

- (void)fulfillFault:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unable to fulfill fault: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)fulfillFault:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Unable to find item to fulfill fault.", a5, a6, a7, a8, 0);
}

void __33__VSKeychainEditingContext_save___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Failed to undo deletion: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __33__VSKeychainEditingContext_save___block_invoke_111_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Undid insertion.", a5, a6, a7, a8, 0);
}

void __33__VSKeychainEditingContext_save___block_invoke_111_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Failed to undo insertion: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end

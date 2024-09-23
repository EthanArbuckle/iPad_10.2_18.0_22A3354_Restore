@implementation HFStateDumpBuilder

+ (id)builderWithObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:context:", v7, v6);

  return v8;
}

- (HFStateDumpBuilder)initWithObject:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  HFStateDumpBuilder *v9;
  HFStateDumpBuilder *v10;
  void *v11;
  void *v12;
  HFStateDumpBuilderContext *v13;
  HFStateDumpBuilderContext *context;
  uint64_t v15;
  NSMutableArray *entries;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFStateDumpBuilder;
  v9 = -[HFStateDumpBuilder init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", 0);
      v13 = (HFStateDumpBuilderContext *)objc_claimAutoreleasedReturnValue();
    }
    context = v10->_context;
    v10->_context = v13;

    v15 = objc_opt_new();
    entries = v10->_entries;
    v10->_entries = (NSMutableArray *)v15;

  }
  return v10;
}

- (void)appendObject:(id)a3 withName:(id)a4
{
  -[HFStateDumpBuilder appendObject:withName:options:](self, "appendObject:withName:options:", a3, a4, 0);
}

- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5
{
  -[HFStateDumpBuilder appendObject:withName:context:options:](self, "appendObject:withName:context:options:", a3, a4, a5, 0);
}

- (void)appendObject:(id)a3 withName:(id)a4 options:(unint64_t)a5
{
  -[HFStateDumpBuilder appendObject:withName:context:options:](self, "appendObject:withName:context:options:", a3, a4, 0, a5);
}

- (void)appendObject:(id)a3 withName:(id)a4 context:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  HFStateDumpEntry *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  -[HFStateDumpBuilder context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsToExclude");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v17);

  if ((v14 & 1) == 0)
  {
    v15 = objc_alloc_init(HFStateDumpEntry);
    -[HFStateDumpEntry setObject:](v15, "setObject:", v17);
    -[HFStateDumpEntry setName:](v15, "setName:", v10);
    -[HFStateDumpEntry setContext:](v15, "setContext:", v11);
    -[HFStateDumpEntry setOptions:](v15, "setOptions:", a6);
    -[HFStateDumpBuilder entries](self, "entries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)appendBool:(BOOL)a3 withName:(id)a4
{
  const __CFString *v4;

  if (a3)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[HFStateDumpBuilder appendObject:withName:](self, "appendObject:withName:", v4, a4);
}

- (void)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  if (a3 == a5)
    -[HFStateDumpBuilder appendBool:withName:](self, "appendBool:withName:");
}

- (id)buildPropertyListRepresentation
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HFStateDumpBuilder context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "derivedOutputStyle");

  if ((unint64_t)(v5 - 1) < 2)
  {
    a2 = (SEL)objc_msgSend(CFSTR("<"), "mutableCopy");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HFStateDumpBuilder _filteredEntries](self, "_filteredEntries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[HFStateDumpBuilder _formattedObjectForEntry:withRepresentation:](self, "_formattedObjectForEntry:withRepresentation:", v20, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v21 && objc_msgSend(v22, "length"))
          {
            if (v17)
              objc_msgSend((id)a2, "appendString:", CFSTR(", "));
            objc_msgSend(v20, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)a2, "appendFormat:", CFSTR("%@: %@"), v24, v23);

            ++v17;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v16);
    }

    objc_msgSend((id)a2, "appendString:", CFSTR(">"));
  }
  else if (v5)
  {
    if (v5 == 3)
    {
      a2 = (SEL)objc_opt_new();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[HFStateDumpBuilder _filteredEntries](self, "_filteredEntries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v28 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            -[HFStateDumpBuilder _formattedObjectForEntry:withRepresentation:](self, "_formattedObjectForEntry:withRepresentation:", v11, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)a2, "setObject:forKeyedSubscript:", v12, v13);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStateDumpBuilder.m"), 133, CFSTR("Unexpected output style!"));

    a2 = (SEL)CFSTR("(internal error)");
  }
  return (id)(id)a2;
}

- (id)buildDescription
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  HFStateDumpBuilder *v22;
  id v23;

  v4 = (void *)MEMORY[0x1E0D519B8];
  -[HFStateDumpBuilder object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builderWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __38__HFStateDumpBuilder_buildDescription__block_invoke;
  v21 = &unk_1EA727188;
  v22 = self;
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v18);
  -[HFStateDumpBuilder context](self, "context", v18, v19, v20, v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "derivedOutputStyle");

  if ((unint64_t)(v10 - 1) < 2)
  {
    v8[2](v8);
  }
  else if (v10)
  {
    if (v10 == 3)
    {
      -[HFStateDumpBuilder context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "multilinePrefix");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = &stru_1EA741FF8;
      objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v14, v8);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStateDumpBuilder.m"), 175, CFSTR("Unexpected output style!"));

  }
  objc_msgSend(v7, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __38__HFStateDumpBuilder_buildDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_filteredEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "_formattedObjectForEntry:withRepresentation:", v6, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "options");
        objc_opt_class();
        v9 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        v12 = v9;
        if (v11)
          goto LABEL_14;
        objc_opt_class();
        v13 = v9;
        v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
        v15 = v14;

        objc_msgSend(v15, "allObjects");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
LABEL_14:
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v6, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendArraySection:withName:skipIfEmpty:", v12, v17, v8 & 1);
        }
        else
        {
          objc_opt_class();
          v12 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v12;
          else
            v18 = 0;
          v19 = v18;

          v20 = *(void **)(a1 + 40);
          objc_msgSend(v6, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v8 & 1;
          if (v19)
          {
            objc_msgSend(v20, "appendDictionarySection:withName:skipIfEmpty:", v19, v17, v21);
          }
          else
          {
            v22 = (id)objc_msgSend(v20, "appendObject:withName:skipIfNil:", v12, v17, v21);
            v12 = 0;
          }
        }

        ++v5;
      }
      while (v3 != v5);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v3 = v23;
    }
    while (v23);
  }

}

- (id)_formattedObjectForEntry:(id)a3 withRepresentation:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[HFStateDumpBuilder context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HFStateDumpBuilder _formattedObjectForObject:withRepresentation:context:options:](self, "_formattedObjectForObject:withRepresentation:context:options:", v7, a4, v9, objc_msgSend(v6, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  return v10;
}

- (id)_formattedObjectForObject:(id)a3 withRepresentation:(unint64_t)a4 context:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  unint64_t v35;
  id v36;
  void *v37;
  HFStateDumpBuilder *v39;
  unint64_t v40;
  _QWORD v41[5];
  id v42;
  void (**v43)(_QWORD);
  unint64_t v44;
  _QWORD v45[4];
  id v46;
  HFStateDumpBuilder *v47;
  void (**v48)(_QWORD);
  unint64_t v49;
  _QWORD aBlock[4];
  id v51;
  HFStateDumpBuilder *v52;

  v10 = a3;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke;
  aBlock[3] = &unk_1EA73D7B0;
  v12 = v11;
  v51 = v12;
  v52 = self;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_opt_class();
  v14 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v17 = v14;
  if (!v16)
  {
    objc_opt_class();
    v18 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v20, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  v21 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  if ((a6 & 1) == 0 || (!v17 || objc_msgSend(v17, "count")) && (!v23 || objc_msgSend(v23, "count")))
  {
    v40 = a6;
    v24 = v21;
    if (objc_msgSend(v24, "conformsToProtocol:", &unk_1F040D568))
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    if (v26)
    {
      v39 = self;
      v27 = v12;
      v13[2](v13);
      v28 = a4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hf_stateDumpBuilderWithContext:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 == 1)
      {
        objc_msgSend(v30, "buildPropertyListRepresentation");
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      a4 = v28;
      if (!v28)
      {
        objc_msgSend(v30, "buildDescription");
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v32 = (id)v31;
        v12 = v27;

LABEL_33:
        goto LABEL_34;
      }

      v12 = v27;
      self = v39;
    }
    if (v17)
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_2;
      v45[3] = &unk_1EA73D7D8;
      v46 = v12;
      v47 = self;
      v49 = a4;
      v48 = v13;
      objc_msgSend(v17, "na_map:", v45);
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (v23)
    {
      v33 = (void *)objc_opt_new();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_3;
      v41[3] = &unk_1EA73D800;
      v41[4] = self;
      v34 = v33;
      v35 = a4;
      v36 = v34;
      v42 = v34;
      v44 = v35;
      v43 = v13;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v41);
      v37 = v43;
      v32 = v36;

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_coerceObjectToPropertyList:options:", v24, v40);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_33;
  }
  v32 = 0;
LABEL_34:

  return v32;
}

id __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectsToExclude");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObjectsToExclude:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "multilinePrefix");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_1EA741FF8;
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("  "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMultilinePrefix:", v9);

  return v2;
}

id __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "multilinePrefix");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1EA741FF8;
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("  "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMultilinePrefix:", v8);

  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 40);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_formattedObjectForObject:withRepresentation:context:options:", v4, v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __83__HFStateDumpBuilder__formattedObjectForObject_withRepresentation_context_options___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "_coerceObjectToPropertyList:options:", v6, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_formattedObjectForObject:withRepresentation:context:options:", v5, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);
}

+ (id)_coerceObjectToPropertyList:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if ((v4 & 1) != 0 && !objc_msgSend(v8, "length"))
    {
      v10 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data (%luB)"), objc_msgSend(v8, "length"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F0446210))
  {
    if ((v4 & 1) != 0)
    {
      HFPrunePropertyList(v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
    }
LABEL_8:
    v10 = v9;
    goto LABEL_21;
  }
  objc_opt_class();
  v11 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
    objc_msgSend(v13, "UUIDString");
  else
    objc_msgSend(v11, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v10;
}

- (id)_filteredEntries
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[HFStateDumpBuilder context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "excludePrimaryID");

  -[HFStateDumpBuilder entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "na_filter:", &__block_literal_global_202);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

BOOL __38__HFStateDumpBuilder__filteredEntries__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "options") & 2) == 0;
}

- (id)object
{
  return self->_object;
}

- (HFStateDumpBuilderContext)context
{
  return self->_context;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_object, 0);
}

@end

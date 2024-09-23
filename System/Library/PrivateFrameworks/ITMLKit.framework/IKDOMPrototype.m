@implementation IKDOMPrototype

+ (id)prototypeWithDOMElement:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "jsNodeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsUpdates");

  if (v6)
  {
    objc_msgSend(v4, "domp_setPrototype:", 0);
    objc_msgSend(v4, "domp_setDerivativeDOMElementsBySelector:", 0);
    objc_msgSend(v4, "clearUpdates");
  }
  objc_msgSend(v4, "domp_prototype");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithDOMElement:selector:", v4, 0);
  v10 = v9;

  return v10;
}

- (IKDOMPrototype)initWithDOMElement:(id)a3 selector:(id)a4
{
  id v6;
  id v7;
  IKDOMPrototype *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *selector;
  void *v13;
  uint64_t v14;
  _IKDOMPrototypeDerivationRules *rules;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IKDOMPrototype;
  v8 = -[IKDOMConditional initWithDOMElement:](&v17, sel_initWithDOMElement_, v6);
  if (v8)
  {
    objc_msgSend(v6, "getAttribute:", CFSTR("prototype"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_type, v10);
    if (!v9)

    v11 = objc_msgSend(v7, "copy");
    selector = v8->_selector;
    v8->_selector = (NSString *)v11;

    -[IKDOMConditional domElement](v8, "domElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_IKDOMPrototypeDerivationRules derivationRulesForDOMElement:](_IKDOMPrototypeDerivationRules, "derivationRulesForDOMElement:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    rules = v8->_rules;
    v8->_rules = (_IKDOMPrototypeDerivationRules *)v14;

    objc_msgSend(v6, "domp_setPrototype:", v8);
  }

  return v8;
}

- (NSArray)grouping
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *grouping;

  if (!self->_flags.parsedGrouping)
  {
    self->_flags.parsedGrouping = 1;
    v3 = (void *)objc_opt_class();
    -[IKDOMConditional domElement](self, "domElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_groupingForDOMElement:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    grouping = self->_grouping;
    self->_grouping = v5;

  }
  return self->_grouping;
}

- (id)variantForDataItem:(id)a3
{
  id v4;
  IKDOMPrototype *v5;
  void *v6;
  IKDOMPrototype *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  -[IKDOMPrototype rules](v5, "rules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      -[IKDOMPrototype _derivativeWithDataItem:](v5, "_derivativeWithDataItem:", v4);
      v7 = (IKDOMPrototype *)objc_claimAutoreleasedReturnValue();

      -[IKDOMPrototype rules](v7, "rules");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    while (v8);
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)instantiateDOMElement
{
  void *v2;
  void *v3;

  -[IKDOMConditional domElement](self, "domElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloneNode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_groupingForDOMElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v22 = v5;
    do
    {
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      +[IKDOMBindingController parsedBindingForDOMElement:](IKDOMBindingController, "parsedBindingForDOMElement:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v8, "keysWithAnyOfAttributes:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
            objc_msgSend(v8, "keyValues");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v4, "addObject:", v16);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v11);
      }

      objc_msgSend(v7, "childElements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v22;
      objc_msgSend(v22, "addObjectsFromArray:", v17);

      objc_msgSend(v22, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
    }
    while (v18);
  }
  if (objc_msgSend(v4, "count"))
    v19 = (void *)objc_msgSend(v4, "copy");
  else
    v19 = 0;

  return v19;
}

- (id)_derivativeWithDataItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  IKDOMPrototype *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  IKDOMPrototype *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v46 = self;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMPrototype rules](self, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutationRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v13, "passesForDataItem:default:", v4, 0))
        {
          if (objc_msgSend(v8, "count"))
            v14 = CFSTR("_%@");
          else
            v14 = CFSTR("%@");
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "appendFormat:", v14, v15);

          objc_msgSend(v8, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v10);
  }

  -[IKDOMConditional domElement](self, "domElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domp_derivativeDOMElementsBySelector");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v47;
  objc_msgSend(v17, "objectForKeyedSubscript:", v47);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (id)v19;
    objc_msgSend((id)objc_opt_class(), "prototypeWithDOMElement:", v19);
    v21 = (IKDOMPrototype *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = v17;
    -[IKDOMConditional domElement](v46, "domElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloneNode:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKDOMConditional domElement](v46, "domElement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setAliasOf:", v24);

    v20 = v23;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[IKDOMPrototype rules](v46, "rules");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "indexPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    v28 = v20;
    if (v27)
    {
      v29 = v27;
      v30 = *(_QWORD *)v54;
      v28 = v20;
      do
      {
        v31 = 0;
        v32 = v28;
        do
        {
          if (*(_QWORD *)v54 != v30)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v31);
          objc_msgSend(v32, "childElements");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v33, "integerValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          ++v31;
          v32 = v28;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v29);
    }

    +[_IKDOMPrototypeDerivationRules removeRulesFromDOMElement:](_IKDOMPrototypeDerivationRules, "removeRulesFromDOMElement:", v28);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = v8;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v50 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "applyOnDOMElement:", v28);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v37);
    }

    v17 = v45;
    if (!v45)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDOMConditional domElement](v46, "domElement");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "domp_setDerivativeDOMElementsBySelector:", v17);

    }
    v18 = v47;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v47);
    -[IKDOMPrototype selector](v46, "selector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[IKDOMPrototype selector](v46, "selector");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringByAppendingFormat:", CFSTR("_%@"), v47);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v43 = (void *)objc_msgSend(v47, "copy");
    }

    v21 = -[IKDOMPrototype initWithDOMElement:selector:]([IKDOMPrototype alloc], "initWithDOMElement:selector:", v20, v43);
  }

  return v21;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)selector
{
  return self->_selector;
}

- (_IKDOMPrototypeDerivationRules)rules
{
  return self->_rules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
}

@end

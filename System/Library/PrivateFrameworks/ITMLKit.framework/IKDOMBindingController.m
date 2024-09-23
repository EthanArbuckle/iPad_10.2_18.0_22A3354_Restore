@implementation IKDOMBindingController

+ (id)parsedBindingForDOMElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  IKDataBinding *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  IKDataBindingLiteral *v32;
  IKDataBindingLiteral *v33;
  IKDataBindingEntry *v34;
  IKDataBinding *v35;
  void *v36;
  IKDataBinding *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domb_dataBinding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v3, "jsNodeData"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isBindingParsed"),
        v5,
        !v6))
  {
    v41 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v3;
    objc_msgSend(v3, "getAttribute:", CFSTR("binding"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "componentsSeparatedByString:", CFSTR(";"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (!v8)
      goto LABEL_34;
    v9 = v8;
    v10 = *(_QWORD *)v47;
    v11 = 0x1E0CB3000uLL;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count") == 2)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 1280), "whitespaceCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 1280), "whitespaceCharacterSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "hasPrefix:", CFSTR("prototype.")))
          {
            objc_msgSend(v16, "substringFromIndex:", objc_msgSend(CFSTR("prototype."), "length"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 1280), "whitespaceCharacterSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
            v22 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v22;
            v23 = 2;
          }
          else if (objc_msgSend(v16, "isEqualToString:", CFSTR("dataItem")))
          {
            v23 = 1;
          }
          else
          {
            v23 = 4;
          }
          if (objc_msgSend(v19, "hasPrefix:", CFSTR("{"))
            && (objc_msgSend(v19, "hasSuffix:", CFSTR("}")) & 1) != 0)
          {
            v24 = 0;
            goto LABEL_23;
          }
          if (objc_msgSend(v19, "hasSuffix:", CFSTR("'"))
            && (objc_msgSend(v19, "hasPrefix:", CFSTR("'")) & 1) != 0)
          {
            v24 = 1;
            goto LABEL_23;
          }
          if (objc_msgSend(v19, "hasSuffix:", CFSTR("\")))
          {
            v24 = 1;
            if (objc_msgSend(v19, "hasPrefix:", CFSTR("\")))
            {
LABEL_23:
              objc_msgSend(v19, "substringWithRange:", 1, objc_msgSend(v19, "length") - 2);
              v45 = v13;
              v25 = v16;
              v26 = v24;
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
              v29 = v9;
              v30 = v10;
              v31 = objc_claimAutoreleasedReturnValue();

              v24 = v26;
              v16 = v25;
              v13 = v45;
              v19 = (void *)v31;
              v10 = v30;
              v9 = v29;
            }
          }
          else
          {
            v24 = 1;
          }
          if (objc_msgSend(v16, "length"))
          {
            if ((v24 & 1) != 0)
            {
              v32 = -[IKDataBindingLiteral initWithLiteral:]([IKDataBindingLiteral alloc], "initWithLiteral:", v19);
              goto LABEL_30;
            }
            if (objc_msgSend(v19, "length"))
            {
              v32 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v19);
LABEL_30:
              v33 = v32;
              v34 = -[IKDataBindingEntry initWithKey:value:attributes:]([IKDataBindingEntry alloc], "initWithKey:value:attributes:", v16, v32, v23);
              objc_msgSend(v43, "addObject:", v34);

            }
          }

          v11 = 0x1E0CB3000;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (!v9)
      {
LABEL_34:
        v35 = [IKDataBinding alloc];
        v36 = (void *)objc_msgSend(v43, "copy");
        v37 = -[IKDataBinding initWithEntries:](v35, "initWithEntries:", v36);

        v3 = v42;
        objc_msgSend(v42, "domb_setDataBinding:", v37);
        objc_msgSend(v42, "jsNodeData");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setBindingParsed:", 1);

        v7 = v37;
        goto LABEL_35;
      }
    }
  }
  v7 = v4;
LABEL_35:

  return v7;
}

+ (void)prepareForDOMElement:(id)a3
{
  void *v3;
  IKDOMBindingController *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "domb_domBindingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_canBeReused") & 1) != 0)
  {
    objc_msgSend(v3, "_resolveBinding");
    objc_msgSend(v3, "_evaluateMutationRules");
  }
  else
  {
    v4 = -[IKDOMBindingController initWithDOMElement:]([IKDOMBindingController alloc], "initWithDOMElement:", v5);

    objc_msgSend(v5, "domb_setDOMBindingController:", v4);
    v3 = v4;
  }

}

+ (id)domBindingControllerForDOMElement:(id)a3
{
  return (id)objc_msgSend(a3, "domb_domBindingController");
}

- (IKDOMBindingController)initWithDOMElement:(id)a3
{
  id v4;
  IKDOMBindingController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  IKDataBinding *binding;
  uint64_t v12;
  _IKDOMMutationRuleSet *mutationRuleSet;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  IKDOMItemsBindingStrategy *v18;
  void *strategy;
  void *v20;
  IKDOMChildrenBindingStrategy *v21;
  IKDOMBindingStrategy *v22;
  id WeakRetained;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  NSDictionary *prototypeGroupsByType;
  void *v58;
  void *v59;
  _BOOL4 hasPrototypeDependentKeys;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id *v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t m;
  uint64_t v87;
  id v88;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id *v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  objc_super v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)IKDOMBindingController;
  v5 = -[IKDOMBindingController init](&v111, sel_init);
  if (!v5)
    goto LABEL_59;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v5->_appContext, v6);

  objc_storeWeak((id *)&v5->_domElement, v4);
  objc_msgSend(v4, "parentNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "parentNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domb_domBindingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_parent, v9);

  }
  else
  {
    objc_storeWeak((id *)&v5->_parent, 0);
  }

  objc_msgSend((id)objc_opt_class(), "parsedBindingForDOMElement:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
  binding = v5->_binding;
  v5->_binding = (IKDataBinding *)v10;

  objc_msgSend((id)objc_opt_class(), "_parsedMutationRulesForDOMElement:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  mutationRuleSet = v5->_mutationRuleSet;
  v5->_mutationRuleSet = (_IKDOMMutationRuleSet *)v12;

  v14 = objc_msgSend(v4, "_isPartOfPrototypeElement");
  v15 = 7;
  if (v14)
    v15 = 3;
  v5->_resolutionTarget = v15;
  -[IKDataBinding keyValues](v5->_binding, "keyValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("items"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[IKDOMItemsBindingStrategy initWithDOMBindingController:]([IKDOMItemsBindingStrategy alloc], "initWithDOMBindingController:", v5);
    strategy = v5->_strategy;
    v5->_strategy = &v18->super;
  }
  else
  {
    -[IKDataBinding keyValues](v5->_binding, "keyValues");
    strategy = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(strategy, "objectForKeyedSubscript:", CFSTR("children"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = -[IKDOMChildrenBindingStrategy initWithDOMBindingController:]([IKDOMChildrenBindingStrategy alloc], "initWithDOMBindingController:", v5);
      v22 = v5->_strategy;
      v5->_strategy = &v21->super;
    }
    else
    {
      v22 = v5->_strategy;
      v5->_strategy = 0;
    }

  }
  v5->_strategyFlags.hasKeysAffectingChildren = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasKeysAffectingSubtree = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasPrototypeDependentKeys = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasValueDidChangeForKey = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasDidResolveKeys = objc_opt_respondsToSelector() & 1;
  WeakRetained = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(WeakRetained, "jsNodeData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isDataResolved");

  if ((v25 & 1) == 0)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    -[IKDataBinding dataBoundKeys](v5->_binding, "dataBoundKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v108 != v29)
            objc_enumerationMutation(v26);
          -[IKDataBinding setNeedsResolutionForKey:](v5->_binding, "setNeedsResolutionForKey:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
      }
      while (v28);
    }

  }
  -[IKDOMBindingController parent](v5, "parent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dataItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDataBinding unresolvedKeys](v5->_binding, "unresolvedKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "containsObject:", CFSTR("dataItem"));

  if (v34)
  {
    -[IKDataBinding dataBoundKeys](v5->_binding, "dataBoundKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("dataItem"));

    if (v36)
    {
      -[IKDataBinding keyValues](v5->_binding, "keyValues");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("dataItem"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_loadWeakRetained((id *)&v5->_domElement);
      objc_msgSend(v32, "valueForPropertyPath:boxed:", v38, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setDataItem:", v40);

      objc_msgSend(v38, "string");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:forPropertyPathWithString:", v5, v41);

    }
    -[IKDataBinding markResolvedForKey:](v5->_binding, "markResolvedForKey:", CFSTR("dataItem"));
  }
  v42 = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(v42, "dataItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = objc_loadWeakRetained((id *)&v5->_domElement);
    objc_msgSend(v44, "dataItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    +[IKJSDataObservable toDataObservable:proxy:](IKJSDataItem, "toDataObservable:proxy:", v45, &v106);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v106;
    objc_storeWeak((id *)&v5->_dataItem, v46);

    v48 = objc_loadWeakRetained((id *)&v5->_domElement);
    objc_msgSend(v48, "dataItem");
    v49 = (id)objc_claimAutoreleasedReturnValue();

    if (v47 != v49)
    {
      v50 = objc_loadWeakRetained((id *)&v5->_domElement);
      objc_msgSend(v50, "setDataItem:", v47);

    }
    v51 = objc_loadWeakRetained((id *)&v5->_dataItem);
    objc_msgSend(v51, "addObserver:forPropertyPathWithString:", v5, &stru_1E9F50578);

  }
  else
  {
    objc_storeWeak((id *)&v5->_dataItem, v32);
  }

  v52 = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(v52, "jsNodeData");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDataResolved:", 1);

  v54 = (void *)objc_opt_class();
  v55 = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(v54, "_prototypeGroupsByTypeForDOMElement:", v55);
  v56 = objc_claimAutoreleasedReturnValue();
  prototypeGroupsByType = v5->_prototypeGroupsByType;
  v5->_prototypeGroupsByType = (NSDictionary *)v56;

  v58 = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(v58, "jsNodeData");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "arePrototypesResolved") & 1) != 0)
  {

LABEL_41:
    goto LABEL_42;
  }
  hasPrototypeDependentKeys = v5->_strategyFlags.hasPrototypeDependentKeys;

  if (hasPrototypeDependentKeys)
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    -[IKDOMBindingController strategy](v5, "strategy");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "prototypeDependentKeys");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v103 != v64)
            objc_enumerationMutation(v58);
          -[IKDataBinding setNeedsResolutionForKey:](v5->_binding, "setNeedsResolutionForKey:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j));
        }
        v63 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
      }
      while (v63);
    }
    goto LABEL_41;
  }
LABEL_42:
  v66 = objc_loadWeakRetained((id *)&v5->_domElement);
  objc_msgSend(v66, "jsNodeData");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setPrototypesResolved:", 1);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDataBinding keysWithAnyOfAttributes:](v5->_binding, "keysWithAnyOfAttributes:", v5->_resolutionTarget);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __45__IKDOMBindingController_initWithDOMElement___block_invoke;
  v99[3] = &unk_1E9F4DF78;
  v70 = v5;
  v100 = v70;
  v71 = v68;
  v101 = v71;
  objc_msgSend(v69, "enumerateObjectsUsingBlock:", v99);

  v72 = objc_msgSend(v71, "copy");
  v73 = v70[1];
  v70[1] = (id)v72;

  v74 = objc_loadWeakRetained(v70 + 8);
  if (v74)
  {
    v90 = v4;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    objc_msgSend(v70[1], "allKeys");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v96;
      do
      {
        for (k = 0; k != v77; ++k)
        {
          if (*(_QWORD *)v96 != v78)
            objc_enumerationMutation(v75);
          v80 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
          v81 = objc_loadWeakRetained(v70 + 8);
          objc_msgSend(v81, "addObserver:forPropertyPathWithString:", v70, v80);

        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
      }
      while (v77);
    }

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[_IKDOMMutationRuleSet dependentPathStrings](v5->_mutationRuleSet, "dependentPathStrings");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v92;
      do
      {
        for (m = 0; m != v84; ++m)
        {
          if (*(_QWORD *)v92 != v85)
            objc_enumerationMutation(v82);
          v87 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m);
          v88 = objc_loadWeakRetained(v70 + 8);
          objc_msgSend(v88, "addObserver:forPropertyPathWithString:", v70, v87);

        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
      }
      while (v84);
    }

    v4 = v90;
  }
  objc_msgSend(v70, "_resolveBinding");
  objc_msgSend(v70, "_evaluateMutationRules");

LABEL_59:
  return v5;
}

void __45__IKDOMBindingController_initWithDOMElement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("dataItem")) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "keyValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v4, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      objc_msgSend(v10, "addObject:", v12);
      v11 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v5);

    }
  }

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  id v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "dataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5 = objc_loadWeakRetained((id *)&self->_dataItem);
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)IKDOMBindingController;
  -[IKDOMBindingController dealloc](&v6, sel_dealloc);
}

- (void)scheduleUpdateUsingPreUpdate:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *scheduledUpdaters;
  _IKDOMBindingControllerUpdateRecord *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[IKDOMBindingController parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IKDOMBindingController parent](self, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheduleUpdateUsingPreUpdate:update:", v6, v7);

  }
  else
  {
    if (!self->_scheduledUpdaters)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      scheduledUpdaters = self->_scheduledUpdaters;
      self->_scheduledUpdaters = v10;

    }
    v12 = objc_alloc_init(_IKDOMBindingControllerUpdateRecord);
    -[_IKDOMBindingControllerUpdateRecord setPreUpdate:](v12, "setPreUpdate:", v6);
    -[_IKDOMBindingControllerUpdateRecord setUpdate:](v12, "setUpdate:", v7);
    -[NSMutableArray addObject:](self->_scheduledUpdaters, "addObject:", v12);
    if (-[NSMutableArray count](self->_scheduledUpdaters, "count") == 1)
    {
      objc_initWeak(&location, self);
      -[IKDOMBindingController appContext](self, "appContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke;
      v14[3] = &unk_1E9F4C288;
      v14[4] = self;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v13, "evaluate:completionBlock:", v14, 0);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
}

void __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke_97;
  v15[3] = &unk_1E9F4D658;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v15[4] = &v17;
  objc_msgSend(v4, "evaluateDelegateBlockSync:", v15);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)v18[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isCancelled", (_QWORD)v11) & 1) == 0)
        {
          objc_msgSend(v9, "update");
          v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v10)[2](v10, v3);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v23, 16);
    }
    while (v6);
  }

  objc_destroyWeak(&v16);
  _Block_object_dispose(&v17, 8);

}

void __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke_97(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unsigned int (**v14)(void);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained[3], "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v3[3], "removeAllObjects");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "preUpdate", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "preUpdate");
            v14 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setCancelled:", v14[2]() ^ 1);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

+ (id)instantiateDOMElementForItem:(id)a3 withPrototype:(id)a4 parentDOMElement:(id)a5 existingDOMElement:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  IKDOMEvent *v31;
  void *v32;
  IKDOMEvent *v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "getAttribute:", CFSTR("prototypeID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
    {

      v18 = 0;
LABEL_13:
      v19 = v16;
      goto LABEL_14;
    }

  }
  objc_msgSend(v10, "instantiateDOMElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributeValue:withName:", v13, CFSTR("itemID"));
  objc_msgSend(v19, "setAttributeValue:withName:", v14, CFSTR("prototypeID"));
  if (!v16 || v19 == v16)
  {
    if (v19 == v16)
    {
      v18 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(v16, "ownerDocument");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "swapITMLIDForNode:withITMLIDForNode:", v19, v16);

  }
  objc_msgSend(v16, "parentNode");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v11)
    v22 = (id)objc_msgSend(v11, "replaceChild::", v19, v16);
  v18 = 1;
LABEL_14:
  objc_msgSend(v19, "parentNode");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 != v11)
    v24 = (id)objc_msgSend(v11, "appendChild:", v19);
  objc_msgSend(v19, "dataItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v9)
  {
    if (!v18)
      goto LABEL_22;
  }
  else
  {
    objc_msgSend(v9, "exportValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataItem:", v27);

  }
  objc_msgSend(v11, "jsNodeData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "containsUpdates");

  if (v29)
  {
    objc_msgSend(v19, "jsNodeData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setUpdated:", 1);

  }
  v31 = [IKDOMEvent alloc];
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[IKDOMEvent initWithAppContext:type:xmlAttribute:canBubble:isCancelable:](v31, "initWithAppContext:type:xmlAttribute:canBubble:isCancelable:", v32, CFSTR("dataitemresolved"), CFSTR("ondataitemresolved"), 1, 0);

  objc_msgSend(v19, "dispatchEvent:", v33);
LABEL_22:

  return v19;
}

- (id)findPrototypeForDataItem:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  IKDOMBindingController *v19;
  id v20;

  v4 = a3;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__IKDOMBindingController_findPrototypeForDataItem___block_invoke;
  v18 = &unk_1E9F4E458;
  v19 = self;
  v5 = v4;
  v20 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](&v15);
  objc_msgSend(v5, "type", v15, v16, v17, v18, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v5, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v13);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

id __51__IKDOMBindingController_findPrototypeForDataItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v5, "prototypeGroupsByType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = v7;
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v12, "passesForDataItem:default:", *(_QWORD *)(a1 + 40), 1))
            {
              v9 = v12;
              goto LABEL_13;
            }
          }
          v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_13:

      objc_msgSend(v5, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      v5 = v13;
    }
    while (v13);
  }
  else
  {
    v13 = 0;
    v9 = 0;
  }

  return v9;
}

- (void)dataObservable:(id)a3 didChangePropertyPathWithString:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKDataBindingPropertyPath *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v9);
  -[NSDictionary objectForKeyedSubscript:](self->_bindingKeysByPathString, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingController parent](self, "parent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataItem");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v8)
  {
    v15 = objc_msgSend(v12, "containsObject:", CFSTR("dataItem"));

    if (v15)
    {
      -[IKDOMBindingController domElement](self, "domElement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "jsNodeData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDataResolved:", 0);

      -[IKDOMBindingController domElement](self, "domElement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = 1;
LABEL_7:
      objc_msgSend(v18, "updatedAndMark:notify:", v20, 0);

      goto LABEL_41;
    }
  }
  else
  {

  }
  if (objc_msgSend(v9, "isEqualToString:", &stru_1E9F50578))
  {
    -[IKDOMBindingController domElement](self, "domElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 0;
    goto LABEL_7;
  }
  v50 = v8;
  if (dataObservable_didChangePropertyPathWithString_extraInfo__onceToken != -1)
    dispatch_once(&dataObservable_didChangePropertyPathWithString_extraInfo__onceToken, &__block_literal_global_22);
  v51 = v12;
  if (self->_strategyFlags.hasValueDidChangeForKey)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v57 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          -[IKDOMBindingController strategy](self, "strategy");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "valueDidChangeForKey:propertyPath:extraInfo:", v26, v11, v10);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v23);
    }

    v12 = v51;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingController binding](self, "binding");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unresolvedKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minusSet:", v30);

  if (objc_msgSend(v28, "count"))
  {
    if ((objc_msgSend((id)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren, "intersectsSet:", v28) & 1) != 0|| self->_strategyFlags.hasKeysAffectingChildren&& (-[IKDOMBindingController strategy](self, "strategy"), v31 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v31, "keysAffectingChildren"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v33 = objc_msgSend(v32, "intersectsSet:", v28), v32, v31, v33))
    {
      -[IKDOMBindingController domElement](self, "domElement");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 0);
    }
    else
    {
      if ((objc_msgSend((id)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree, "intersectsSet:", v12) & 1) != 0)
      {
        v35 = 0;
      }
      else if (self->_strategyFlags.hasKeysAffectingSubtree)
      {
        -[IKDOMBindingController strategy](self, "strategy");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "keysAffectingSubtree");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v37, "intersectsSet:", v28) ^ 1;

      }
      else
      {
        v35 = 1;
      }
      -[IKDOMBindingController domElement](self, "domElement");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "updatedAndMark:notify:", v35, 0);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v49 = v28;
    v38 = v28;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          -[IKDOMBindingController binding](self, "binding");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setNeedsResolutionForKey:", v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v40);
    }

    v12 = v51;
    v28 = v49;
  }
  -[IKDOMBindingController mutationRuleSet](self, "mutationRuleSet");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "dependentPathStrings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "containsObject:", v9);

  if (v47)
  {
    -[IKDOMBindingController domElement](self, "domElement");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 0);

  }
  v8 = v50;
LABEL_41:

}

void __83__IKDOMBindingController_dataObservable_didChangePropertyPathWithString_extraInfo___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren;
  dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("@"), "stringByAppendingString:", CFSTR("autoHighlight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree;
  dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree = v5;

}

+ (id)_parsedMutationRulesForDOMElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _IKDOMMutationRuleSet *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  _IKDOMMutationRuleSet *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domb_mutationRuleSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v3, "jsNodeData"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "areRulesParsed"),
        v5,
        v6))
  {
    v7 = v4;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v3, "childElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "nodeName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("rules"));

          if (v15)
          {
            v16 = v13;
            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v10)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_14:

    v17 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v16, "childElements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v16, "childElements", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          +[IKDOMMutationRule mutationRuleWithDOMElement:mutable:](IKDOMMutationRule, "mutationRuleWithDOMElement:mutable:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v19, "count"))
      v26 = -[_IKDOMMutationRuleSet initWithMutationRules:]([_IKDOMMutationRuleSet alloc], "initWithMutationRules:", v19);
    else
      v26 = 0;

    objc_msgSend(v3, "domb_setMutationRuleSet:", v26);
    objc_msgSend(v3, "jsNodeData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRulesParsed:", 1);

    v7 = v26;
  }

  return v7;
}

+ (id)_prototypeGroupsByTypeForDOMElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class shouldParseChildDOMElements](+[IKViewElementFactory elementClassByTagName:](IKViewElementFactory, "elementClassByTagName:", v5), "shouldParseChildDOMElements"))
  {

  }
  else
  {
    objc_msgSend(v3, "elementName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("fragment"));

    if (!v7)
      goto LABEL_31;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v3, "childElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "elementName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("prototypes"));

        if (v14)
        {
          v38 = v3;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v12, "childElements");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v45 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                objc_msgSend(v20, "elementName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "getAttribute:", CFSTR("prototype"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v22)
                {
                  v24 = v22;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "string");
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                }
                v25 = v24;

                if (+[IKViewElementFactory elementClassByTagName:](IKViewElementFactory, "elementClassByTagName:", v21))
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", v25);
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (!v26)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
                    v26 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v25);
                  }
                  +[IKDOMPrototype prototypeWithDOMElement:](IKDOMPrototype, "prototypeWithDOMElement:", v20);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject addObject:](v26, "addObject:", v27);

                }
                else
                {
                  ITMLKitGetLogObject(0);
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v54 = v21;
                    _os_log_impl(&dword_1D95F2000, v26, OS_LOG_TYPE_INFO, "Invalid prototype tag: %@", buf, 0xCu);
                  }
                }

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
            }
            while (v17);
          }

          v3 = v38;
          goto LABEL_30;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_30:

LABEL_31:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v4, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v30);
  }

  if (objc_msgSend(v4, "count"))
    v36 = (void *)objc_msgSend(v4, "copy");
  else
    v36 = 0;

  return v36;
}

- (BOOL)_canBeReused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  -[IKDOMBindingController domElement](self, "domElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKDOMBindingController domElement](self, "domElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domb_domBindingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[IKDOMBindingController parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {
    -[IKDOMBindingController domElement](self, "domElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsNodeData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isBindingParsed"))
    {
      -[IKDOMBindingController domElement](self, "domElement");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "jsNodeData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "areRulesParsed"))
      {
        -[IKDOMBindingController domElement](self, "domElement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "jsNodeData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "arePrototypesResolved"))
        {
          -[IKDOMBindingController domElement](self, "domElement");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "jsNodeData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v16, "isDataResolved");

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_resolveBinding
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "elementName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = a1;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "bound_css: parsed for %@(%p)", (uint8_t *)&v5, 0x16u);

}

void __41__IKDOMBindingController__resolveBinding__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("@"), "stringByAppendingString:", CFSTR("autoHighlight"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_resolveBinding_messagingKeys;
  _resolveBinding_messagingKeys = v3;

}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 *p_buf;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  id v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
LABEL_5:
    v10 = MEMORY[0x1E0C809B0];
    v11 = isKindOfClass & 1;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_116;
    v38[3] = &unk_1E9F4E4E8;
    v41 = isKindOfClass & 1;
    v12 = v4;
    v39 = v12;
    v13 = v6;
    v40 = v13;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v38);
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_118;
    v34[3] = &unk_1E9F4E510;
    v37 = v11;
    v15 = v12;
    v35 = v15;
    v16 = v13;
    v36 = v16;
    v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v34);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x2020000000;
    v44 = 0;
    v44 = objc_msgSend((id)_resolveBinding_messagingKeys, "containsObject:", v3);
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("@")))
    {
      objc_msgSend(v3, "substringFromIndex:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("itemID")))
        {
          v32[0] = v10;
          v32[1] = 3221225472;
          v32[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_3_120;
          v32[3] = &unk_1E9F4E538;
          v19 = v32;
          v32[4] = a1[5];
          v32[5] = a1[8];
          v33 = v18;
          ((void (**)(_QWORD, _QWORD *))v14)[2](v14, v32);

        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("autoHighlight")))
        {
          v31[0] = v10;
          v31[1] = 3221225472;
          v31[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_122;
          v31[3] = &unk_1E9F4E560;
          v19 = v31;
          v31[4] = a1[8];
          v31[5] = v18;
          ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v31);
        }
        else
        {
          v30[0] = v10;
          v30[1] = 3221225472;
          v30[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_125;
          v30[3] = &unk_1E9F4E588;
          v19 = v30;
          v30[4] = a1[8];
          v30[5] = v18;
          ((void (**)(_QWORD, _QWORD *))v14)[2](v14, v30);
        }

      }
    }
    else if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")))
    {
      objc_msgSend(v3, "substringFromIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        v27[0] = v10;
        v27[1] = 3221225472;
        v27[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_3_128;
        v27[3] = &unk_1E9F4E560;
        v28 = v20;
        v29 = a1[9];
        ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v27);

      }
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("textContent")))
    {
      v25[0] = v10;
      v25[1] = 3221225472;
      v25[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_130;
      v25[3] = &unk_1E9F4E5B0;
      v26 = a1[8];
      ((void (**)(_QWORD, _QWORD *))v14)[2](v14, v25);

    }
    else
    {
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_131;
      v22[3] = &unk_1E9F4E5D8;
      v21 = a1[6];
      p_buf = &buf;
      v22[4] = v21;
      v23 = v3;
      ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v22);

    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24) && v16)
      objc_msgSend(a1[5], "resetValueForPropertyPath:", v15);
    _Block_object_dispose(&buf, 8);

    goto LABEL_27;
  }
  if (a1[5])
  {
    objc_msgSend(a1[6], "strategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prototypeDependentKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v3);

    objc_msgSend(a1[5], "valueForPropertyPath:boxed:", v4, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "markResolvedForKey:", v3);
    goto LABEL_5;
  }
  ITMLKitGetLogObject(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D95F2000, v16, OS_LOG_TYPE_INFO, "Can't resolve binding for key %@ without data item", (uint8_t *)&buf, 0xCu);
  }
LABEL_27:

}

void __41__IKDOMBindingController__resolveBinding__block_invoke_116(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "literal");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v3);
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "isString");
    v5 = *(void **)(a1 + 40);
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "toString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v3);
    }
    else
    {
      if ((objc_msgSend(v5, "isNumber") & 1) == 0 && (objc_msgSend(*(id *)(a1 + 40), "isBoolean") & 1) == 0)
      {
        v7[2](v7, &stru_1E9F50578);
        goto LABEL_6;
      }
      objc_msgSend(*(id *)(a1 + 40), "toNumber");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v6);

    }
  }

LABEL_6:
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_2_118(uint64_t a1, void (**a2)(_QWORD))
{
  void *v3;
  void (**v4)(_QWORD);
  void (*v5)(void);
  void (**v6)(_QWORD);

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "literal");
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    a2[2](v4);

  }
  else
  {
    v5 = (void (*)(void))a2[2];
    v6 = a2;
    v5();
  }

}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_120(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "isEqualToString:", v5);

      if ((v6 & 1) == 0)
      {
        ITMLKitGetLogObject(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v3;
          v14 = 2112;
          v15 = v8;
          _os_log_impl(&dword_1D95F2000, v7, OS_LOG_TYPE_INFO, "Binding itemId %@ doesn't match dataItem itemId %@", (uint8_t *)&v12, 0x16u);

        }
      }
    }
    v10 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttribute::", v9, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setAttribute::", *(_QWORD *)(a1 + 48), v3);
  }

}

void __41__IKDOMBindingController__resolveBinding__block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isString"))
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "toString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttribute::", v3, v5);

  }
}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_2_125(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttribute::", *(_QWORD *)(a1 + 40), a2);
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_128(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = *(_QWORD *)(a1 + 32),
        objc_msgSend(v3, "toObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        +[IKCSSFactory createDeclarationForName:withObject:](IKCSSFactory, "createDeclarationForName:withObject:", v4, v5), v6 = objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "addDeclaration:", v6);
  }
  else
  {
    ITMLKitGetLogObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__IKDOMBindingController__resolveBinding__block_invoke_3_128_cold_1(a1, (uint64_t)v3, v6);
  }

}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_130(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextContent:", a2);
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_2_131(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "strategy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "applyValue:forKey:", v4, a1[5]);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

- (void)_evaluateMutationRules
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IKDOMBindingController mutationRuleSet](self, "mutationRuleSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutationRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[IKDOMBindingController dataItem](self, "dataItem", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "passesForDataItem:default:", v12, 0);

        if (v13)
        {
          -[IKDOMBindingController domElement](self, "domElement");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "applyOnDOMElement:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKDOMElement)domElement
{
  return (IKDOMElement *)objc_loadWeakRetained((id *)&self->_domElement);
}

- (IKDOMBindingController)parent
{
  return (IKDOMBindingController *)objc_loadWeakRetained((id *)&self->_parent);
}

- (IKDataBinding)binding
{
  return self->_binding;
}

- (IKJSDataItem)dataItem
{
  return (IKJSDataItem *)objc_loadWeakRetained((id *)&self->_dataItem);
}

- (IKDOMBindingStrategy)strategy
{
  return self->_strategy;
}

- (_IKDOMMutationRuleSet)mutationRuleSet
{
  return self->_mutationRuleSet;
}

- (NSDictionary)prototypeGroupsByType
{
  return self->_prototypeGroupsByType;
}

- (unint64_t)resolutionTarget
{
  return self->_resolutionTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeGroupsByType, 0);
  objc_storeStrong((id *)&self->_mutationRuleSet, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_destroyWeak((id *)&self->_dataItem);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_domElement);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_scheduledUpdaters, 0);
  objc_storeStrong((id *)&self->_bindingKeysByPathString, 0);
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_128_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D95F2000, log, OS_LOG_TYPE_ERROR, "CSS style binding did not resolve: %@ : %@", (uint8_t *)&v4, 0x16u);
}

@end

@implementation ATXSuggestionDeduplicator

- (ATXSuggestionDeduplicator)init
{
  void *v3;
  void *v4;
  ATXSuggestionDeduplicator *v5;

  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonFolderAppSetOnPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXSuggestionDeduplicator _initWithVisibleAppsByPage:](self, "_initWithVisibleAppsByPage:", v4);

  return v5;
}

- (id)_initWithVisibleAppsByPage:(id)a3
{
  id v5;
  ATXSuggestionDeduplicator *v6;
  ATXSuggestionDeduplicator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestionDeduplicator;
  v6 = -[ATXSuggestionDeduplicator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_visibleAppsByPage, a3);

  return v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4
{
  return -[ATXSuggestionDeduplicator suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:](self, "suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:", a3, a4, 1);
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4 shouldCompareAcrossTypes:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  BOOL v24;
  _BOOL4 v26;
  id obj;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v26 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v28 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v10, "executableSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "executableType");
        objc_msgSend(v6, "executableSpecification");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "executableType");

        if (v13 == v15)
        {
          objc_msgSend(v10, "executableSpecification");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "executableClassString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "executableSpecification");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "executableClassString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "isEqualToString:", v19);

          if (v20)
          {
            objc_msgSend(v6, "executableSpecification");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "executableSpecification");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:](self, "executableSpecsAreDuplicates:otherExecutableSpec:", v21, v22);

            if (v23)
              goto LABEL_18;
          }
        }
        else if (v26
               && (-[ATXSuggestionDeduplicator suggestionsAreDuplicateAppAndAction:otherSuggestion:](self, "suggestionsAreDuplicateAppAndAction:otherSuggestion:", v6, v10)|| -[ATXSuggestionDeduplicator suggestionsAreDuplicateAppAndLinkAction:otherSuggestion:](self, "suggestionsAreDuplicateAppAndLinkAction:otherSuggestion:", v6, v10)|| -[ATXSuggestionDeduplicator suggestionsAreDuplicateWidgetAndAction:otherSuggestion:](self, "suggestionsAreDuplicateWidgetAndAction:otherSuggestion:", v6, v10)|| -[ATXSuggestionDeduplicator suggestionsAreDuplicateActionAndLinkAction:otherSuggestion:](self, "suggestionsAreDuplicateActionAndLinkAction:otherSuggestion:", v6, v10)))
        {
LABEL_18:
          objc_autoreleasePoolPop(v11);
          v24 = 1;
          goto LABEL_19;
        }
        objc_autoreleasePoolPop(v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_19:

  return v24;
}

- (BOOL)suggestionsAreDuplicateAppAndAction:(id)a3 otherSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "executableType") == 2)
  {
    objc_msgSend(v6, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "executableType");

    v10 = v5;
    v11 = v6;
    if (v9 == 1)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v5, "executableSpecification");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "executableType") == 1)
  {
    objc_msgSend(v6, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    v10 = v6;
    v11 = v5;
    if (v14 != 2)
    {
      v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    v12 = v10;
    v15 = v11;
    objc_msgSend(v12, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "executableClassString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (v20)
    {
      objc_msgSend(v12, "executableSpecification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "executableObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "bundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v15, "executableSpecification");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "executableClassString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqualToString:", v29);

    if (v30)
    {
      objc_msgSend(v15, "executableSpecification");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "executableObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      ATXBundleIdReplacementForBundleId();
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && v33 && (objc_msgSend(v24, "isEqualToString:", v33) & 1) != 0)
      {
        v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v33 = 0;
    }
    v25 = 0;
    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateAppAndLinkAction:(id)a3 otherSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "executableType") == 10)
  {
    objc_msgSend(v6, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "executableType");

    v10 = v5;
    v11 = v6;
    if (v9 == 1)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v5, "executableSpecification");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "executableType") == 1)
  {
    objc_msgSend(v6, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    v10 = v6;
    v11 = v5;
    if (v14 != 10)
    {
      v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    v12 = v10;
    v15 = v11;
    objc_msgSend(v12, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "executableClassString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (v20)
    {
      objc_msgSend(v12, "executableSpecification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "executableObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "bundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v15, "executableSpecification");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "executableClassString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqualToString:", v29);

    if (v30)
    {
      objc_msgSend(v15, "executableSpecification");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "executableObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      ATXBundleIdReplacementForBundleId();
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && v33 && (objc_msgSend(v24, "isEqualToString:", v33) & 1) != 0)
      {
        v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v33 = 0;
    }
    v25 = 0;
    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateActionAndLinkAction:(id)a3 otherSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "executableType") == 2)
  {
    objc_msgSend(v6, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "executableType");

    v10 = v5;
    v11 = v6;
    if (v9 == 10)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v5, "executableSpecification");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "executableType") == 10)
  {
    objc_msgSend(v6, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    v10 = v6;
    v11 = v5;
    if (v14 != 2)
    {
      v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    v12 = v10;
    v15 = v11;
    objc_msgSend(v12, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "executableClassString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (v20)
    {
      objc_msgSend(v12, "executableSpecification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "executableObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "bundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v15, "executableSpecification");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "executableClassString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqualToString:", v29);

    if (v30)
    {
      objc_msgSend(v15, "executableSpecification");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "executableObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "bundleId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && v34 && (objc_msgSend(v24, "isEqualToString:", v34) & 1) != 0)
      {
        v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v34 = 0;
    }
    v25 = 0;
    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateWidgetAndAction:(id)a3 otherSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "executableType") == 2)
  {
    objc_msgSend(v6, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "executableType");

    v10 = v5;
    v11 = v6;
    if (v9 == 3)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v5, "executableSpecification");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "executableType") != 3)
  {
    v32 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v6, "executableSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "executableType");

  v10 = v6;
  v11 = v5;
  if (v14 == 2)
  {
LABEL_7:
    v12 = v10;
    v15 = v11;
    objc_msgSend(v12, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "executableClassString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (!v20)
      goto LABEL_13;
    objc_msgSend(v12, "executableSpecification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "executableObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "intent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v15, "executableSpecification");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "executableClassString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v25, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_15;
      objc_msgSend(v15, "executableSpecification");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "executableObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "intent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v32 = +[ATXActionToWidgetConverter isWidgetIntent:validConversionFromActionIntent:](ATXActionToWidgetConverter, "isWidgetIntent:validConversionFromActionIntent:", v31, v23);

      }
      else
      {
LABEL_15:
        v32 = 0;
      }

    }
    else
    {
LABEL_13:
      v32 = 0;
    }

    goto LABEL_18;
  }
  v32 = 0;
LABEL_19:

  return v32;
}

- (BOOL)executableSpecsAreDuplicates:(id)a3 otherExecutableSpec:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  objc_class *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  objc_class *v64;
  void *v65;
  int v66;
  void *v67;
  objc_class *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "executableType");
  if (v8 != objc_msgSend(v7, "executableType")
    || !objc_msgSend(v6, "executableType")
    || objc_msgSend(v6, "executableType") == 11
    || (objc_msgSend(v6, "executableClassString"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "executableClassString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqualToString:", v10),
        v10,
        v9,
        !v11))
  {
    LOBYTE(v26) = 0;
    goto LABEL_12;
  }
  -[ATXSuggestionDeduplicator executableClassStringsToUnarchiveDuringComparison](self, "executableClassStringsToUnarchiveDuringComparison");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableClassString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v6, "executableIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v19, "isEqualToString:", v21);
LABEL_56:

    goto LABEL_12;
  }
  objc_msgSend(v6, "executableClassString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  if (v18)
  {
    objc_msgSend(v6, "executableObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 && v20)
      goto LABEL_9;
    __atxlog_handle_default();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);
LABEL_23:

LABEL_24:
    LOBYTE(v26) = 1;
    goto LABEL_56;
  }
  objc_msgSend(v6, "executableClassString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "isEqualToString:", v30);

  if (v31)
  {
    objc_msgSend(v6, "executableObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v32 && v33)
    {
      if (objc_msgSend(v6, "executableType") == 1 && objc_msgSend(v7, "executableType") == 1)
      {
        ATXBundleIdReplacementForBundleId();
        v35 = objc_claimAutoreleasedReturnValue();

        ATXBundleIdReplacementForBundleId();
        v36 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v36;
        v32 = (void *)v35;
      }
      LOBYTE(v26) = objc_msgSend(v32, "isEqual:", v34);
    }
    else
    {
      __atxlog_handle_default();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:].cold.2(v26, v56, v57, v58, v59, v60, v61, v62);

      LOBYTE(v26) = 1;
    }

    goto LABEL_12;
  }
  objc_msgSend(v6, "executableClassString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v45, "isEqualToString:", v47);

  if (v48)
  {
    objc_msgSend(v6, "executableObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appBundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appBundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqualToString:", v50);

    if (!v51)
      goto LABEL_55;
    objc_msgSend(v19, "widgetBundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widgetBundleIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqualToString:", v53);

    if (!v54)
      goto LABEL_55;
    if ((objc_msgSend(v19, "isFallback") & 1) == 0 && (objc_msgSend(v21, "isFallback") & 1) == 0)
    {
      objc_msgSend(v19, "intent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {

        goto LABEL_49;
      }
      objc_msgSend(v21, "intent");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if (v78)
      {
LABEL_49:
        objc_msgSend(v19, "intent");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "intent");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v79, "atx_isEqualToIntent:", v80);

        if (!v81)
          goto LABEL_55;
      }
    }
    objc_msgSend(v19, "widgetKind");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {

    }
    else
    {
      objc_msgSend(v21, "widgetKind");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v83)
        goto LABEL_24;
    }
    objc_msgSend(v21, "widgetKind");
    v26 = objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_56;
    objc_msgSend(v19, "widgetKind");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    widgetKindForDeduping(v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widgetKind");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    widgetKindForDeduping(v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v85, "isEqualToString:", v87);

    if (v88)
      goto LABEL_24;
LABEL_55:
    LOBYTE(v26) = 0;
    goto LABEL_56;
  }
  objc_msgSend(v6, "executableClassString");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (objc_class *)objc_opt_class();
  NSStringFromClass(v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v63, "isEqualToString:", v65);

  if (v66)
  {
    objc_msgSend(v6, "executableObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v19, "isEqual:", v21);
    if (!(_DWORD)v26)
      goto LABEL_56;
    __atxlog_handle_blending();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:].cold.3((uint64_t)v19, (uint64_t)v21, v23);
    goto LABEL_34;
  }
  objc_msgSend(v6, "executableClassString");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (objc_class *)objc_opt_class();
  NSStringFromClass(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v67, "isEqualToString:", v69);

  if ((_DWORD)v26)
  {
    objc_msgSend(v6, "executableObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v70 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v70;
    if (v19 && v70)
    {
LABEL_9:
      objc_msgSend(v19, "bundleId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "bundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqualToString:](v23, "isEqualToString:", v25) & 1) != 0)
        LOBYTE(v26) = 1;
      else
        LOBYTE(v26) = objc_msgSend(v19, "isEqual:", v21);

LABEL_34:
      goto LABEL_56;
    }
    __atxlog_handle_default();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:].cold.4(v37, v71, v72, v73, v74, v75, v76, v77);
    goto LABEL_23;
  }
LABEL_12:

  return (char)v26;
}

- (id)executableClassStringsToUnarchiveDuringComparison
{
  if (executableClassStringsToUnarchiveDuringComparison__pasOnceToken12 != -1)
    dispatch_once(&executableClassStringsToUnarchiveDuringComparison__pasOnceToken12, &__block_literal_global_54);
  return (id)executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult;
}

void __78__ATXSuggestionDeduplicator_executableClassStringsToUnarchiveDuringComparison__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = (void *)MEMORY[0x1CAA48B6C]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v2, "initWithObjects:", v4, v6, v8, v10, v12, 0);

  objc_autoreleasePoolPop(v1);
  v14 = (void *)executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult;
  executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult = v13;

  objc_autoreleasePoolPop(v0);
}

- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 == 3)
  {
    objc_msgSend(v7, "atxInfoSuggestionExecutableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXSuggestionDeduplicator _isWidget:showingContentOfInfoSuggestion:](self, "_isWidget:showingContentOfInfoSuggestion:", v6, v10);
  }
  else
  {
    objc_msgSend(v7, "executableSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "executableType");

    if (v13 != 2)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "atxActionExecutableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXSuggestionDeduplicator _isWidget:showingContentOfAction:](self, "_isWidget:showingContentOfAction:", v6, v10);
  }
  v14 = v11;

LABEL_7:
  return v14;
}

- (BOOL)_isWidget:(id)a3 showingContentOfInfoSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_22;
  objc_msgSend(v6, "extensionBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_22;
  objc_msgSend(v6, "extensionBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"))
    || (objc_msgSend(v6, "intent"), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    objc_msgSend(v6, "widgetKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    widgetKindForDeduping(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetKind");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    widgetKindForDeduping(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqualToString:", v21);

    if (v22)
    {
      if ((objc_msgSend(v7, "isFallback") & 1) != 0)
      {
LABEL_16:
        v17 = 1;
        goto LABEL_23;
      }
      objc_msgSend(v7, "widgetBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.mobilecal.CalendarWidgetExtension")) & 1) != 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v7, "criterion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ATXWeatherWakeUp")) & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v7, "widgetBundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
      {

        goto LABEL_14;
      }
      objc_msgSend(v7, "widgetBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.Fitness.FitnessWidget"));

      if ((v27 & 1) != 0)
        goto LABEL_16;
      objc_msgSend(v7, "intent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

      }
      else
      {
        objc_msgSend(v6, "intent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          goto LABEL_16;
      }
      objc_msgSend(v7, "intent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "atx_isEqualToIntent:", v31);

      if ((v32 & 1) != 0)
        goto LABEL_16;
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "intent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_8;
  objc_msgSend(v6, "intent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXSuggestionDeduplicator _isContactsWidgetIntent:overlappingContactsWithOtherContactsWidgetIntent:](self, "_isContactsWidgetIntent:overlappingContactsWithOtherContactsWidgetIntent:", v15, v16);

LABEL_23:
  return v17;
}

- (BOOL)_isContactsWidgetIntent:(id)a3 overlappingContactsWithOtherContactsWidgetIntent:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[ATXSuggestionPreprocessor contactIdsAssociatedWithContactsWidgetIntent:](ATXSuggestionPreprocessor, "contactIdsAssociatedWithContactsWidgetIntent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionPreprocessor contactIdsAssociatedWithContactsWidgetIntent:](ATXSuggestionPreprocessor, "contactIdsAssociatedWithContactsWidgetIntent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "intersectsSet:", v7);
  return (char)v5;
}

- (BOOL)_isWidget:(id)a3 showingContentOfAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "intent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = +[ATXActionToWidgetConverter isWidgetIntent:validConversionFromActionIntent:](ATXActionToWidgetConverter, "isWidgetIntent:validConversionFromActionIntent:", v9, v10);

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4
{
  return -[ATXSuggestionDeduplicator suggestionIsDuplicateAppOrWidget:homeScreenPageConfig:excludingStackConfigId:](self, "suggestionIsDuplicateAppOrWidget:homeScreenPageConfig:excludingStackConfigId:", a3, a4, 0);
}

- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = -[ATXSuggestionDeduplicator widgetSuggestionIsDuplicate:homeScreenPageConfig:excludingStackConfigId:](self, "widgetSuggestionIsDuplicate:homeScreenPageConfig:excludingStackConfigId:", v8, v9, a5)|| -[ATXSuggestionDeduplicator suggestionIsDuplicate:appsOnHomeScreenPageAtIndex:](self, "suggestionIsDuplicate:appsOnHomeScreenPageAtIndex:", v8, objc_msgSend(v9, "pageIndex"));

  return v10;
}

- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  void *v5;
  BOOL v6;

  -[ATXSuggestionDeduplicator stacksWithDuplicateWidgetSuggestion:homeScreenPageConfig:excludingStackConfigId:](self, "stacksWithDuplicateWidgetSuggestion:homeScreenPageConfig:excludingStackConfigId:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "executableSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "executableType");

  if (v12 == 3)
  {
    -[ATXSuggestionDeduplicator stacksWithDuplicateWidgetSuggestion:homeScreenPageConfig:excludingStackConfigId:](self, "stacksWithDuplicateWidgetSuggestion:homeScreenPageConfig:excludingStackConfigId:", v8, v9, v10);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v15 = v14;
    if (v14)
    {
      v16 = *(_QWORD *)v24;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1CAA48B6C](v14);
          objc_msgSend(v18, "widgets", (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          objc_autoreleasePoolPop(v19);
          if (v21 == 1)
          {
            LOBYTE(v15) = 1;
            goto LABEL_13;
          }
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v15 = v14;
        if (v14)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)stacksWithDuplicateWidgetSuggestion:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "executableSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "executableType");

  if (v12 == 3)
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(v9, "stacks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "pageIndex");
    v28 = v9;
    if (v14 == *MEMORY[0x1E0CF9338])
    {
      -[ATXSuggestionDeduplicator stacksToConsiderForLeftOfHomeForStackId:stacksOnPage:](self, "stacksToConsiderForLeftOfHomeForStackId:stacksOnPage:", v10, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
          if (!v10
            || (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20), "identifier"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = objc_msgSend(v22, "isEqualToString:", v10),
                v22,
                (v23 & 1) == 0))
          {
            objc_msgSend(v21, "widgets", v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXSuggestionDeduplicator duplicateWidgetForWidgetSuggestion:otherWidgets:](self, "duplicateWidgetForWidgetSuggestion:otherWidgets:", v8, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
              objc_msgSend(v29, "addObject:", v21);
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }

    v26 = (void *)objc_msgSend(v29, "copy");
    v9 = v28;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

- (id)stacksToConsiderForLeftOfHomeForStackId:(id)a3 stacksOnPage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v8 = v6;
    goto LABEL_18;
  }
  v8 = (id)objc_opt_new();
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v9, "lohStacksToConsiderAboveAndBelowForDeduplication");

  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "lohStacksToConsiderAboveAndBelowForDeduplication");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v7;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v17, "identifier", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v5);

      if ((v19 & 1) != 0)
        goto LABEL_10;
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v24, "addObject:", v17);
        if (objc_msgSend(v24, "count") == v22)
          goto LABEL_16;
LABEL_10:
        v14 = 1;
        continue;
      }
      objc_msgSend(v8, "addObject:", v17);
      if (objc_msgSend(v8, "count") > v23)
        objc_msgSend(v8, "removeObjectAtIndex:", 0);
      v14 = 0;
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v13);
LABEL_16:

  objc_msgSend(v8, "addObjectsFromArray:", v24);
  v7 = v21;
LABEL_18:

  return v8;
}

- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(a4, "stacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    v26 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      v27 = v11;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
        if (!v8
          || (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v13), "identifier"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isEqualToString:", v8),
              v15,
              (v16 & 1) == 0))
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v14, "widgets", v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v29;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "extensionBundleId");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", v7);

                if ((v23 & 1) != 0)
                {

                  v24 = 1;
                  goto LABEL_22;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v19)
                continue;
              break;
            }
          }

          v12 = v26;
          v11 = v27;
        }
        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v24 = 0;
    }
    while (v11);
  }
  else
  {
    v24 = 0;
  }
LABEL_22:

  return v24;
}

- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  void *v5;
  BOOL v6;

  -[ATXSuggestionDeduplicator pinnedWidgetIdentifiablesWithExtensionId:homeScreenPageConfig:excludingStackConfigId:shouldStopAfterFindingFirstOne:](self, "pinnedWidgetIdentifiablesWithExtensionId:homeScreenPageConfig:excludingStackConfigId:shouldStopAfterFindingFirstOne:", a3, a4, a5, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v27 = v11;
  v28 = v10;
  v26 = v12;
  -[ATXSuggestionDeduplicator stacksWithDuplicateWidgetExtensionId:homeScreenPageConfig:excludingStackConfigId:](self, "stacksWithDuplicateWidgetExtensionId:homeScreenPageConfig:excludingStackConfigId:", v10, v11, v12);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v19, "widgets");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22 == 1)
        {
          objc_msgSend(v19, "widgets");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v24);

          if (v6)
          {
            objc_autoreleasePoolPop(v20);
            goto LABEL_12;
          }
        }
        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (id)stacksWithDuplicateWidgetExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = v8;
  v24 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v8, "stacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v9);

          if ((v13 & 1) != 0)
            continue;
        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v11, "widgets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "extensionBundleId");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v7);

              if (v20)
              {
                objc_msgSend(v24, "addObject:", v11);
                goto LABEL_18;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v27);
  }

  v21 = (void *)objc_msgSend(v24, "copy");
  return v21;
}

- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSDictionary *visibleAppsByPage;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  visibleAppsByPage = self->_visibleAppsByPage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](visibleAppsByPage, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
    v11 = -[ATXSuggestionDeduplicator suggestionIsDuplicate:otherApps:](self, "suggestionIsDuplicate:otherApps:", v6, v10);
  else
    v11 = 0;

  objc_autoreleasePoolPop(v7);
  return v11;
}

- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executableType");

  if (v8 == 1)
  {
    objc_msgSend(v5, "executableSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 && (objc_msgSend(v6, "containsObject:", v10) & 1) != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 != 3)
    goto LABEL_12;
  objc_msgSend(v6, "executableSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executableClassString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  if (v14)
  {
    objc_msgSend(v6, "executableSpecification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "executableObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (-[ATXSuggestionDeduplicator _isWidget:showingContentOfInfoSuggestion:](self, "_isWidget:showingContentOfInfoSuggestion:", v22, v16, (_QWORD)v25))
          {
            v23 = v22;
            goto LABEL_14;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v19)
          continue;
        break;
      }
    }
    v23 = 0;
LABEL_14:

  }
  else
  {
LABEL_12:
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAppsByPage, 0);
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Failed to deserialize ATXAction during deduplication. Treating as if they were dupes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Failed to deserialize NSString during deduplication. Treating as if they were dupes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)executableSpecsAreDuplicates:(os_log_t)log otherExecutableSpec:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Deduplicator found duplicate people suggestions. Suggestion 1: %@; Suggestion 2: %@",
    (uint8_t *)&v3,
    0x16u);
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Failed to deserialize ATXLinkAction during deduplication. Treating as if they were dupes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end

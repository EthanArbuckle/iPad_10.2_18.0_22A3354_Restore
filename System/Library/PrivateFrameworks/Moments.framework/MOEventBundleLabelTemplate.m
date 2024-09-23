@implementation MOEventBundleLabelTemplate

- (MOEventBundleLabelTemplate)initWithConditionStrings:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MOEventBundleLabelTemplate *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    +[MOEventBundleLabelTemplate conditionsFromLabels:](MOEventBundleLabelTemplate, "conditionsFromLabels:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelTemplate conditionsFromConditionStrings:](MOEventBundleLabelTemplate, "conditionsFromConditionStrings:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setByAddingObjectsFromSet:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MOEventBundleLabelTemplate initWithConditions:labels:context:](self, "initWithConditions:labels:context:", v14, v10, v11);

    v15 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 46, CFSTR("Invalid parameter not satisfying: labels"));

    v15 = 0;
  }

  return v15;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MOEventBundleLabelFormat *v18;
  MOEventBundleLabelTemplate *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v29 = v9;
    v12 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = -[MOEventBundleLabelFormat initWithFormat:]([MOEventBundleLabelFormat alloc], "initWithFormat:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17));
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    v9 = v29;
    self = -[MOEventBundleLabelTemplate initWithConditions:formats:context:](self, "initWithConditions:formats:context:", v29, v12, v11);
    v19 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 57, CFSTR("Invalid parameter not satisfying: labels"));
    v19 = 0;
  }

  return v19;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 formats:(id)a4 context:(id)a5
{
  id v10;
  id v11;
  id v12;
  MOEventBundleLabelTemplate *v13;
  id *p_isa;
  MOEventBundleLabelTemplate *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v26.receiver = self;
    v26.super_class = (Class)MOEventBundleLabelTemplate;
    v13 = -[MOEventBundleLabelTemplate init](&v26, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_conditions, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditions:formats:context:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 68, CFSTR("Invalid parameter not satisfying: formats"));

    v15 = 0;
  }

  return v15;
}

+ (id)conditionsFromLabels:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  id obj;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\{([0-9a-zA-Z\\-\\_]+)\\}"), 1, &v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v31;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v21, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if (objc_msgSend(v12, "numberOfRanges"))
              {
                v13 = (void *)objc_opt_new();
                v14 = objc_msgSend(v12, "rangeAtIndex:", 1);
                objc_msgSend(v6, "substringWithRange:", v14, v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setKeyword:", v16);

                objc_msgSend(v4, "addObject:", v13);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          }
          while (v9);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v22);
  }

  return v4;
}

+ (id)formatsFromLabels:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MOEventBundleLabelFormat *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("|"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          objc_msgSend(v9, "objectAtIndex:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = -[MOEventBundleLabelFormat initWithFormat:capitalizationType:]([MOEventBundleLabelFormat alloc], "initWithFormat:capitalizationType:", v10, +[MOEventBundleLabelTemplate capitalizationTypeFromString:](MOEventBundleLabelTemplate, "capitalizationTypeFromString:", v11));
        objc_msgSend(v4, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)conditionsFromConditionStrings:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(!)?([0-9a-zA-Z\\-\\_]+)(\\s?(=|==|>|<|>=|<=|!=)\\s?([-+]?[0-9]*\\.?[0-9]+|[0-9a-zA-Z\\-\\_]+)(:(f|d|s))?)?"), 1, &v54);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v54;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v51;
    v5 = 0x1E8540000uLL;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(obj);
        v42 = v6;
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v6);
        objc_msgSend(v40, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v44 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v44)
        {
          v9 = *(_QWORD *)v47;
          v43 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v47 != v9)
                objc_enumerationMutation(v8);
              v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              if (objc_msgSend(v11, "numberOfRanges"))
              {
                v12 = objc_msgSend(v11, "rangeAtIndex:", 2);
                objc_msgSend(v7, "substringWithRange:", v12, v13);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 3896)), "initWithKeyword:", v45);
                v15 = objc_msgSend(v11, "rangeAtIndex:", 1);
                if (v16)
                {
                  v17 = *(void **)(v5 + 3896);
                  objc_msgSend(v7, "substringWithRange:", v15, v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "templateOperatorFromString:", v18);

                  if (v19)
                    objc_msgSend(v14, "setTemplateOperator:", v19);
                }
                if (objc_msgSend(v14, "templateOperator") != 8)
                {
                  v20 = objc_msgSend(v11, "rangeAtIndex:", 4);
                  if (v21)
                  {
                    v22 = *(void **)(v5 + 3896);
                    objc_msgSend(v7, "substringWithRange:", v20, v21);
                    v23 = v7;
                    v24 = v8;
                    v25 = v5;
                    v26 = v4;
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v22, "templateOperatorFromString:", v27);

                    v4 = v26;
                    v5 = v25;
                    v8 = v24;
                    v7 = v23;
                    v9 = v43;
                    if (v28)
                    {
                      objc_msgSend(v14, "setTemplateOperator:", v28);
                      v29 = objc_msgSend(v11, "rangeAtIndex:", 5);
                      if (v30)
                      {
                        objc_msgSend(v7, "substringWithRange:", v29, v30);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v14, "setValue:", v31);

                      }
                      else
                      {
                        objc_msgSend(v14, "setTemplateOperator:", 0);
                      }
                      v32 = objc_msgSend(v11, "rangeAtIndex:", 7);
                      if (v33)
                      {
                        v34 = *(void **)(v5 + 3896);
                        objc_msgSend(v7, "substringWithRange:", v32, v33);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v14, "setValueType:", objc_msgSend(v34, "valueTypeFromString:", v35));

                      }
                    }
                  }
                  else
                  {
                    objc_msgSend(v14, "setTemplateOperator:", 7);
                  }
                }
                objc_msgSend(v4, "addObject:", v14);

              }
            }
            v44 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v44);
        }

        v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v41);
  }

  return v4;
}

+ (id)conditionsFromExtendStrings:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id obj;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v48 = (id)objc_opt_new();
  v64 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([0-9a-zA-Z\\-\\_]+)\\s?(:)\\s?([0-9a-zA-Z\\-\\_\\,\\s]+)"), 1, &v64);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v64;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v61;
    v4 = 0x1E8540000uLL;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(obj);
        v43 = v5;
        v6 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v5);
        objc_msgSend(v41, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length", v38));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v49 = v7;
        v51 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        if (v51)
        {
          v50 = *(_QWORD *)v57;
          v44 = v6;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v57 != v50)
                objc_enumerationMutation(v49);
              v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              if (objc_msgSend(v9, "numberOfRanges"))
              {
                v10 = objc_msgSend(v9, "rangeAtIndex:", 1);
                objc_msgSend(v6, "substringWithRange:", v10, v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v4 + 3896)), "initWithKeyword:", v12);
                v14 = objc_msgSend(v9, "rangeAtIndex:", 2);
                if (v15)
                {
                  v16 = *(void **)(v4 + 3896);
                  objc_msgSend(v6, "substringWithRange:", v14, v15);
                  v17 = v12;
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v16, "templateOperatorFromString:", v18);

                  v12 = v17;
                  if (v19)
                    objc_msgSend(v13, "setTemplateOperator:", v19);
                }
                v20 = objc_msgSend(v9, "rangeAtIndex:", 3);
                if (v21)
                {
                  objc_msgSend(v6, "substringWithRange:", v20, v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v22, "length"))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v24, "isEqualToString:", CFSTR("_ANY_")))
                    {
                      objc_msgSend(v13, "setValue:", CFSTR("_ANY_"));
                    }
                    else
                    {
                      v45 = v24;
                      v47 = v12;
                      v25 = (void *)objc_opt_new();
                      v52 = 0u;
                      v53 = 0u;
                      v54 = 0u;
                      v55 = 0u;
                      v46 = v22;
                      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
                      if (v27)
                      {
                        v28 = v27;
                        v29 = *(_QWORD *)v53;
                        do
                        {
                          for (j = 0; j != v28; ++j)
                          {
                            if (*(_QWORD *)v53 != v29)
                              objc_enumerationMutation(v26);
                            v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v32);
                            v33 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v25, "addObject:", v33);
                          }
                          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
                        }
                        while (v28);
                      }

                      if (objc_msgSend(v25, "count"))
                      {
                        v34 = (void *)objc_msgSend(v25, "copy");
                        objc_msgSend(v13, "setValues:", v34);

                      }
                      v4 = 0x1E8540000;
                      v6 = v44;
                      v24 = v45;
                      v22 = v46;
                      v12 = v47;
                    }

                  }
                }
                if (objc_msgSend(v13, "templateOperator"))
                {
                  objc_msgSend(v13, "values");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v35, "count"))
                  {

                    goto LABEL_35;
                  }
                  objc_msgSend(v13, "value");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
LABEL_35:
                    objc_msgSend(v48, "addObject:", v13);
                }

                continue;
              }
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
          }
          while (v51);
        }

        v5 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v42);
  }

  return v48;
}

+ (id)conditionsFromCapitalizations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MOEventBundleLabelCondition *v11;
  MOEventBundleLabelCondition *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [MOEventBundleLabelCondition alloc];
        v12 = -[MOEventBundleLabelCondition initWithKeyword:](v11, "initWithKeyword:", v10, (_QWORD)v14);
        -[MOEventBundleLabelCondition setTemplateOperator:](v12, "setTemplateOperator:", 7);
        -[MOEventBundleLabelCondition setCapitalized:](v12, "setCapitalized:", 1);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)capitalizationTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(CFSTR("nop"), "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(CFSTR("titlecap"), "isEqualToString:", v8);

      if ((v9 & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        objc_msgSend(v4, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(CFSTR("cap"), "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v7 = 3;
        }
        else
        {
          objc_msgSend(v4, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(CFSTR("fpo"), "isEqualToString:", v12);

          if (v13)
            v7 = 3;
          else
            v7 = 1;
        }
      }
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)checkConditionForMetaData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  MOEventBundleLabelTemplate *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  _BYTE v25[18];
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MOEventBundleLabelTemplate conditions](self, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[MOEventBundleLabelTemplate conditions](self, "conditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = v8;
      v19 = self;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "yieldConditionForMetaData:", v4);
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "keyword");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v25 = v15;
            *(_WORD *)&v25[8] = 2112;
            *(_QWORD *)&v25[10] = v12;
            v26 = 1024;
            v27 = v13;
            _os_log_debug_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_DEBUG, "template yieldConditionForMetaData, keyword, %@, condition, %@, output, %d", buf, 0x1Cu);

          }
          if (!v13)
          {
            v16 = 0;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
          continue;
        break;
      }
      v16 = 1;
LABEL_14:
      self = v19;
    }
    else
    {
      v16 = 1;
    }

    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v25 = v16;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = self;
      _os_log_impl(&dword_1CAE42000, v17, OS_LOG_TYPE_INFO, "template checkConditionForMetaData, output, %d, template, %@", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (BOOL)needExtensionForKeyword:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MOEventBundleLabelTemplate conditions](self, "conditions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "templateOperator") == 9)
        {
          objc_msgSend(v9, "keyword");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)needCapitalizationForKeyword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[MOEventBundleLabelTemplate conditions](self, "conditions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "keyword");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v5))
          {
            v12 = objc_msgSend(v10, "capitalized");

            if ((v12 & 1) != 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)formattedStringsForMetaData:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v75;
  void *v76;
  id obj;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  char v86;
  void *v87;
  _BOOL4 v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  MOEventBundleLabelTemplate *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  uint8_t buf[4];
  uint64_t v103;
  __int16 v104;
  NSObject *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  uint64_t v111;
  uint8_t v112[4];
  uint64_t v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v101 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\{([0-9a-zA-Z\\-\\_]+)\\}"), 1, &v101);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v101;
  v76 = (void *)objc_opt_new();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v92 = self;
  -[MOEventBundleLabelTemplate formats](self, "formats");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
  if (v80)
  {
    v78 = *(_QWORD *)v98;
    v5 = 0x1E8540000uLL;
    v85 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v98 != v78)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v6);
        objc_msgSend(v7, "format");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)objc_msgSend(v8, "copy");
        _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v103 = (uint64_t)v8;
          _os_log_debug_impl(&dword_1CAE42000, v9, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        v82 = (void *)objc_opt_new();
        v84 = v7;
        objc_msgSend(v7, "format");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "matchesInString:options:range:", v10, 0, 0, objc_msgSend(v8, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v12 = v11;
        v90 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
        if (!v90)
        {

LABEL_76:
          objc_msgSend(*(id *)(v5 + 3920), "_Moments_LocalizedStringWithFormat:arguments:", v8, v82);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            v62 = objc_msgSend(v82, "count");
            objc_msgSend(v87, "mask");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "mask");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v103 = (uint64_t)v8;
            v104 = 2048;
            v105 = v62;
            v106 = 2112;
            v107 = (uint64_t)v63;
            v108 = 2112;
            v109 = v64;
            _os_log_debug_impl(&dword_1CAE42000, v57, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, formatting completed", buf, 0x2Au);

          }
          if (v56)
          {
            if (objc_msgSend(v84, "capitalizationType") == 1 || objc_msgSend(v84, "capitalizationType") == 2)
            {
              objc_msgSend(*(id *)(v5 + 3920), "_Moments_CapitalizedStringForKey:", v56);
              v58 = objc_claimAutoreleasedReturnValue();
              goto LABEL_82;
            }
            if (objc_msgSend(v84, "capitalizationType") != 3)
              goto LABEL_83;
            objc_msgSend(*(id *)(v5 + 3920), "_Moments_AllCapitalizedStringForKey:", v56);
            v58 = objc_claimAutoreleasedReturnValue();
LABEL_82:
            v59 = (void *)v58;

            v56 = v59;
            if (!v59)
            {
              _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                v68 = objc_msgSend(v82, "count");
                objc_msgSend(v87, "mask");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(0, "mask");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v84, "capitalizationType");
                *(_DWORD *)buf = 138413314;
                v103 = (uint64_t)v8;
                v104 = 2048;
                v105 = v68;
                v106 = 2112;
                v107 = (uint64_t)v69;
                v108 = 2112;
                v109 = v70;
                v110 = 2048;
                v111 = v71;
                _os_log_error_impl(&dword_1CAE42000, v61, OS_LOG_TYPE_ERROR, "template, %@, args, %lu, outputString, %@, localizedString, %@, capitalization failure, %lu", buf, 0x34u);

              }
              v56 = 0;
LABEL_91:

            }
            else
            {
LABEL_83:
              _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                v65 = objc_msgSend(v82, "count");
                objc_msgSend(v87, "mask");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "mask");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v103 = (uint64_t)v8;
                v104 = 2048;
                v105 = v65;
                v106 = 2112;
                v107 = (uint64_t)v66;
                v108 = 2112;
                v109 = v67;
                _os_log_debug_impl(&dword_1CAE42000, v60, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, localization completed", buf, 0x2Au);

              }
              objc_msgSend(v76, "addObject:", v56);
              if (objc_msgSend(v56, "containsString:", CFSTR("{")))
              {
                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v103 = (uint64_t)v56;
                  _os_log_error_impl(&dword_1CAE42000, v61, OS_LOG_TYPE_ERROR, "The string contains a symbol. %@", buf, 0xCu);
                }
                goto LABEL_91;
              }
            }
          }

          goto LABEL_93;
        }
        v83 = v12;
        v81 = v6;
        v89 = *(_QWORD *)v94;
        v86 = 1;
        v13 = v84;
        do
        {
          v14 = 0;
          v15 = v8;
          do
          {
            if (*(_QWORD *)v94 != v89)
              objc_enumerationMutation(v83);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * v14), "rangeAtIndex:", 1);
            v18 = v17;
            objc_msgSend(v13, "format");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "substringWithRange:", v16, v18);
            v20 = objc_claimAutoreleasedReturnValue();

            v21 = -[MOEventBundleLabelTemplate needCapitalizationForKeyword:](v92, "needCapitalizationForKeyword:", v20);
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v103 = (uint64_t)v15;
              v104 = 2112;
              v105 = v20;
              _os_log_debug_impl(&dword_1CAE42000, v22, OS_LOG_TYPE_DEBUG, "template, %@, keyword, %@", buf, 0x16u);
            }

            objc_msgSend(v4, "objectForKey:", v20);
            v23 = objc_claimAutoreleasedReturnValue();
            +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKey:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v88 = v21;
              if (-[MOEventBundleLabelTemplate needExtensionForKeyword:](v92, "needExtensionForKeyword:", v20))
              {
                v26 = v4;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v20, v75);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v23);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v27, v28);
                v29 = objc_claimAutoreleasedReturnValue();

                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  v103 = v29;
                  v104 = 2112;
                  v105 = v20;
                  v106 = 2112;
                  v107 = (uint64_t)v23;
                  _os_log_debug_impl(&dword_1CAE42000, v30, OS_LOG_TYPE_DEBUG, "extended template, %@, keyword, %@, extended keyword, %@", buf, 0x20u);
                }

                objc_msgSend(v26, "objectForKey:", v23);
                v31 = objc_claimAutoreleasedReturnValue();
                +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v23);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKey:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v34 = objc_claimAutoreleasedReturnValue();
                v8 = (void *)v29;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413058;
                  v103 = v29;
                  v104 = 2112;
                  v105 = v23;
                  v106 = 2112;
                  v107 = v31;
                  v108 = 2112;
                  v109 = v33;
                  _os_log_debug_impl(&dword_1CAE42000, v34, OS_LOG_TYPE_DEBUG, "extended template, %@, extended keyword, %@, value, %@, value.cap, %@", buf, 0x2Au);
                }

                v13 = v84;
                if (!v31)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v103 = (uint64_t)v20;
                    _os_log_error_impl(&dword_1CAE42000, v48, OS_LOG_TYPE_ERROR, "extended keyword is not found, %@", buf, 0xCu);
                  }

                  v35 = 0;
                  v86 = 0;
                  v4 = v85;
                  goto LABEL_66;
                }

                v23 = v31;
                v4 = v85;
              }
              else
              {
                v33 = v25;
                v8 = v15;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = v23;
                v91 = v8;
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  v37 = v33;
                else
                  v37 = 0;
                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  -[NSObject mask](v36, "mask");
                  v53 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "mask");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v103 = (uint64_t)v20;
                  v104 = 2112;
                  v105 = v53;
                  v106 = 2112;
                  v107 = (uint64_t)v54;
                  _os_log_debug_impl(&dword_1CAE42000, v41, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSString, value, %@, value.cap, %@", buf, 0x20u);

                }
LABEL_44:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v20);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v36);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "stringByReplacingOccurrencesOfString:withString:", v42, v43);
                v44 = objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v13, "capitalizationType") == 2
                  && +[MOEventBundleLabelLocalizer isPreferredLanguageTitlecaseCapable](MOEventBundleLabelLocalizer, "isPreferredLanguageTitlecaseCapable"))
                {
                  if (v37)
                  {
                    v45 = v37;
                  }
                  else
                  {
                    +[MOEventBundleLabelLocalizer _Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_TitleCapitalizedStringForKey:", v36);
                    v45 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v46 = (uint64_t)v45;
                  v4 = v85;
LABEL_61:

                  v36 = v46;
                  goto LABEL_62;
                }
                if (v88)
                {
                  v4 = v85;
                  if (+[MOEventBundleLabelLocalizer isPreferredLanguageMidSentenceCaseCapable](MOEventBundleLabelLocalizer, "isPreferredLanguageMidSentenceCaseCapable"))
                  {
                    +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v36);
                    v46 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_61;
                  }
LABEL_62:
                  v13 = v84;
                }
                else
                {
                  v4 = v85;
                }
                objc_msgSend(v82, "addObject:", v36);

                v87 = (void *)v44;
                goto LABEL_64;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = v23;
                -[NSObject stringValue](v38, "stringValue");
                v36 = objc_claimAutoreleasedReturnValue();
                if (!v36)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    -[MOEventBundleLabelTemplate formattedStringsForMetaData:].cold.1(v112, &v113, v39);

                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[NSObject intValue](v38, "intValue"));
                  v36 = objc_claimAutoreleasedReturnValue();
                }
                v91 = v8;
                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v103 = (uint64_t)v20;
                  v104 = 2112;
                  v105 = v36;
                  _os_log_debug_impl(&dword_1CAE42000, v40, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSNumber, value, %@", buf, 0x16u);
                }

                if (v36)
                {
                  v37 = 0;
                  goto LABEL_44;
                }
                v86 = 0;
LABEL_64:
                _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                v49 = objc_claimAutoreleasedReturnValue();
                v8 = v91;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v87, "mask");
                  v50 = objc_claimAutoreleasedReturnValue();
                  v51 = (void *)v50;
                  *(_DWORD *)buf = 138412546;
                  v52 = CFSTR("NO");
                  if ((v86 & 1) != 0)
                    v52 = CFSTR("YES");
                  v103 = v50;
                  v104 = 2112;
                  v105 = v52;
                  _os_log_debug_impl(&dword_1CAE42000, v49, OS_LOG_TYPE_DEBUG, "outputString, %@, formattingCompleted, %@", buf, 0x16u);

                }
                v35 = 1;
                goto LABEL_66;
              }
              _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v103 = (uint64_t)v20;
                v104 = 2112;
                v105 = v23;
                _os_log_error_impl(&dword_1CAE42000, v47, OS_LOG_TYPE_ERROR, "keyword, %@, value type is not supported, %@", buf, 0x16u);
              }

              v35 = 0;
              v86 = 0;
            }
            else
            {
              _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v103 = (uint64_t)v20;
                _os_log_error_impl(&dword_1CAE42000, v23, OS_LOG_TYPE_ERROR, "keyword is not found, %@", buf, 0xCu);
              }
              v35 = 0;
              v86 = 0;
              v33 = v25;
              v8 = v15;
            }
LABEL_66:

            if (!v35)
              goto LABEL_73;
            ++v14;
            v15 = v8;
          }
          while (v90 != v14);
          v55 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
          v90 = v55;
        }
        while (v55);
LABEL_73:
        v12 = v83;

        v5 = 0x1E8540000;
        v6 = v81;
        if ((v86 & 1) != 0)
          goto LABEL_76;
LABEL_93:

        ++v6;
      }
      while (v6 != v80);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
      v80 = v72;
    }
    while (v72);
  }

  v73 = (void *)objc_msgSend(v76, "copy");
  return v73;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOEventBundleLabelTemplate conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundleLabelTemplate formats](self, "formats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("condidionts, %@, labels, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)formats
{
  return self->_formats;
}

- (void)setFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_formats, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (void)initWithConditionStrings:(uint64_t)a3 labels:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: labels", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithConditions:(uint64_t)a3 formats:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: formats", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)formattedStringsForMetaData:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "stringValue %@", buf, 0xCu);
}

@end

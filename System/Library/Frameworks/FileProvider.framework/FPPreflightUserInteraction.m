@implementation FPPreflightUserInteraction

+ (id)interactionFromDictionary:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("ActivationRule"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("SuppressionIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.5(v17, v22, v23, v24, v25, v26, v27, v28);
        v16 = 0;
        goto LABEL_32;
      }
      v15 = objc_msgSend(v14, "length") != 0;
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("HelpURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.4(v29, v30, v31, v32, v33, v34, v35, v36);
        v16 = 0;
        goto LABEL_31;
      }
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:encodingInvalidCharacters:", v17, 0);
      if (!v18)
      {

        v17 = 0;
      }

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("Alert"));
    v19 = objc_claimAutoreleasedReturnValue();
    +[FPPreflightUserInteractionAlert alertFromDictionary:localizationLookup:](FPPreflightUserInteractionAlert, "alertFromDictionary:localizationLookup:", v19, v10);
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("SubInteractions"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v20 = 0;
    }
    v41 = v19;
    if (v42 | v20)
    {
      if (!objc_msgSend(v13, "containsString:", CFSTR("%")))
      {
        v37 = (void *)objc_opt_new();
        objc_msgSend(v37, "setProviderIdentifier:", v11);
        objc_msgSend(v37, "setDomainIdentifier:", v12);
        objc_msgSend(v37, "setAlert:", v42);
        objc_msgSend(v37, "setHasSuppressionIdentifier:", v15);
        objc_msgSend(v37, "setHelpURL:", v17);
        objc_msgSend(v37, "setUserInteractionIdentifier:", v14);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:argumentArray:", v13, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setPredicate:", v40);
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __111__FPPreflightUserInteraction_interactionFromDictionary_localizationLookup_providerIdentifier_domainIdentifier___block_invoke;
        v43[3] = &unk_1E444C958;
        v44 = v14;
        v45 = v17;
        v46 = v10;
        v47 = v11;
        v48 = v12;
        objc_msgSend((id)v20, "fp_map:", v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setSubInteractions:", v38);

        v21 = v37;
        v16 = v21;
        goto LABEL_30;
      }
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.1();
    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.3((uint64_t)v9, v21);
    }
    v16 = 0;
LABEL_30:

    v29 = v41;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v16 = 0;
LABEL_34:

  return v16;
}

id __111__FPPreflightUserInteraction_interactionFromDictionary_localizationLookup_providerIdentifier_domainIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1[4] || a1[5])
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
    +[FPPreflightUserInteraction propagateConfigurationKeysDownInteractionTreeWithObject:key:value:](FPPreflightUserInteraction, "propagateConfigurationKeysDownInteractionTreeWithObject:key:value:", v5, CFSTR("SuppressionIdentifier"), a1[4]);
    +[FPPreflightUserInteraction propagateConfigurationKeysDownInteractionTreeWithObject:key:value:](FPPreflightUserInteraction, "propagateConfigurationKeysDownInteractionTreeWithObject:key:value:", v5, CFSTR("HelpURL"), a1[5]);
  }
  else
  {
    v5 = v3;
  }
  +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:](FPPreflightUserInteraction, "interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:", v5, a1[6], a1[7], a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)propagateConfigurationKeysDownInteractionTreeWithObject:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v10, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v10, "setValue:forKey:", v8, v7);

}

+ (id)interactionsForBundle:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "objectForInfoDictionaryKey:", CFSTR("NSExtension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTableNames:", &unk_1E448F500);
  objc_msgSend(v12, "setBundle:", v10);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSFileProviderUserInteractions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "interactionsForArray:localizationLookup:providerIdentifier:domainIdentifier:", v13, v12, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[FPPreflightUserInteraction interactionsForBundle:providerIdentifier:domainIdentifier:].cold.1();

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)interactionsForArray:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke;
  v17[3] = &unk_1E444C980;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  objc_msgSend(a3, "fp_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:](FPPreflightUserInteraction, "interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:", v3, a1[4], a1[5], a1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke_cold_1();

    v4 = 0;
  }

  return v4;
}

- (id)evaluateWithObjectsByName:(id)a3 suppressionDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v11 = 0;
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "objectForKey:", CFSTR("sourceItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("sourceItems"));
  -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:](self, "_evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:", v7, v8, v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_evaluateWithObjectsByName:(id)a3 sourceItems:(id)a4 suppressionDelegate:(id)a5 errorIndex:(unint64_t *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  _BOOL4 v42;
  _BOOL8 v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  BOOL v59;
  int v60;
  NSObject *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  int v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v83;
  unint64_t *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  id v99;
  unint64_t *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  void *v105;
  _QWORD v106[5];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v88 = a4;
  v87 = a5;
  v84 = a6;
  ++*a6;
  v89 = (void *)objc_opt_new();
  v86 = v9;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v88, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("sourceItemsCount"));

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v12 = v88;
  v13 = 0;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v102 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("sourceItem"));
        -[FPPreflightUserInteraction predicate](self, "predicate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "evaluateWithObject:", v10);

        if (v19)
        {
          objc_msgSend(v89, "addObject:", v17);
          v13 = 1;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count"))
  {

    if ((v13 & 1) != 0)
    {
LABEL_12:
      v20 = (void *)objc_opt_new();
      -[FPPreflightUserInteraction subInteractions](self, "subInteractions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        -[FPPreflightUserInteraction subInteractions](self, "subInteractions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __100__FPPreflightUserInteraction__evaluateWithObjectsByName_sourceItems_suppressionDelegate_errorIndex___block_invoke;
        v95[3] = &unk_1E444C9A8;
        v96 = v86;
        v97 = v89;
        v98 = v87;
        v100 = v84;
        v99 = v20;
        objc_msgSend(v23, "enumerateObjectsUsingBlock:", v95);

      }
      -[FPPreflightUserInteraction alert](self, "alert");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v85 = (void *)objc_msgSend(v86, "mutableCopy");
        if (objc_msgSend(v89, "count"))
        {
          objc_msgSend(v89, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v25, CFSTR("firstMatchingItem"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v89, "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v26, CFSTR("matchingItemsCount"));

          if ((unint64_t)objc_msgSend(v89, "count") >= 2)
          {
            objc_msgSend(v89, "objectAtIndex:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setObject:forKeyedSubscript:", v27, CFSTR("secondMatchingItem"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v89, "count") - 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setObject:forKeyedSubscript:", v28, CFSTR("matchingItemsCountMinusOne"));

            if ((unint64_t)objc_msgSend(v89, "count") >= 3)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v89, "count") - 2);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "setObject:forKeyedSubscript:", v29, CFSTR("matchingItemsCountMinusTwo"));

            }
          }
        }
        objc_msgSend(v24, "cancelCaptionFormat");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0;
        objc_msgSend(v30, "evaluateWithValuesByName:error:", v85, &v94);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v94;

        if (!v83)
        {
          if (v31)
          {
            fp_current_or_default_log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.5(v31, v32);

          }
          FPLocalizedErrorStringForKey(CFSTR("Preflight-Cancel"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[FPPreflightUserInteraction alert](self, "alert");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "enableContinue");

        if (v34)
        {

          objc_msgSend(v24, "continueCaptionFormat");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          objc_msgSend(v35, "evaluateWithValuesByName:error:", v85, &v93);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v93;

          if (!v36)
          {
            if (v31)
            {
              fp_current_or_default_log();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.4(v31, v37);

            }
            FPLocalizedErrorStringForKey(CFSTR("Preflight-Continue"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v106[0] = v83;
          v106[1] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v105 = v83;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v42 = -[FPPreflightUserInteraction hasSuppressionIdentifier](self, "hasSuppressionIdentifier");
        if (v87)
          v43 = v42;
        else
          v43 = 0;
        v44 = !-[FPPreflightUserInteraction hasSuppressionIdentifier](self, "hasSuppressionIdentifier");
        if (v87)
          LOBYTE(v44) = 1;
        if ((v44 & 1) == 0)
        {
          fp_current_or_default_log();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.3(v45, v46, v47, v48, v49, v50, v51, v52);

        }
        v53 = (void *)objc_opt_new();

        objc_msgSend(v24, "titleFormat");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        objc_msgSend(v54, "evaluateWithValuesByName:error:", v85, &v92);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v92;
        v57 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0CB2D50]);

        objc_msgSend(v53, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
          v59 = 1;
        else
          v59 = v56 == 0;
        v60 = !v59;

        if (v60)
        {
          fp_current_or_default_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.2(v56, v61);

        }
        objc_msgSend(v24, "subtitleFormat");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        objc_msgSend(v62, "evaluateWithValuesByName:error:", v85, &v91);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v91;
        v65 = *MEMORY[0x1E0CB2D80];
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0CB2D80]);

        objc_msgSend(v53, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
          v67 = 1;
        else
          v67 = v64 == 0;
        v68 = !v67;

        if (v68)
        {
          fp_current_or_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.1(v64, v69);

        }
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0CB2D78]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v24, "continueIsDestructive"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v70, CFSTR("NSFileProviderDestructiveRecoveryKey"));

        -[FPPreflightUserInteraction providerIdentifier](self, "providerIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v71, CFSTR("ProviderIdentifier"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v84);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v72, CFSTR("PreflightIndex"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v73, CFSTR("FPCanBeSuppressed"));

        -[FPPreflightUserInteraction helpURL](self, "helpURL");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v74, CFSTR("FPHelpURL"));

        if (-[FPPreflightUserInteraction hasSuppressionIdentifier](self, "hasSuppressionIdentifier"))
        {
          v75 = (void *)MEMORY[0x1E0CB37E8];
          -[FPPreflightUserInteraction userInteractionIdentifier](self, "userInteractionIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "numberWithBool:", objc_msgSend(v87, "isInteractionSuppressedForIdentifier:", v76));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v77, CFSTR("FPIsSuppressed"));

          -[FPPreflightUserInteraction userInteractionIdentifier](self, "userInteractionIdentifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v78, CFSTR("FPUserInteractionIdentifier"));

        }
        -[FPPreflightUserInteraction domainIdentifier](self, "domainIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v79, CFSTR("DomainIdentifier"));

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 13, v53);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v80);
        v81 = v20;

      }
      goto LABEL_71;
    }
  }
  else
  {
    -[FPPreflightUserInteraction predicate](self, "predicate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "evaluateWithObject:", v10);

    if ((v40 & 1) != 0)
      goto LABEL_12;
  }
  fp_current_or_default_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.6(self, v41);

  v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_71:

  return v20;
}

void __100__FPPreflightUserInteraction__evaluateWithObjectsByName_sourceItems_suppressionDelegate_errorIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v3);

}

+ (id)evaluationObjectsForAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 domainUserInfo:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = (id *)MEMORY[0x1E0C99E08];
  v18 = a6;
  v19 = a3;
  objc_msgSend(v17, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("action"));

  if (v13)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __153__FPPreflightUserInteraction_evaluationObjectsForAction_sourceItems_destinationItem_domainUserInfo_sourceItemKeysAllowList_destinationItemKeysAllowList___block_invoke;
    v24[3] = &unk_1E444C9D0;
    v17 = &v25;
    v25 = v15;
    objc_msgSend(v13, "fp_map:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("sourceItems"));

    if (v14)
    {
LABEL_3:
      FPExtensionMatchingDictionaryForItem(v14, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("destinationItem"));

      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("sourceItems"));
    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("destinationItem"));
LABEL_6:
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("domainUserInfo"));

  if (v13)
  return v20;
}

id __153__FPPreflightUserInteraction_evaluationObjectsForAction_sourceItems_destinationItem_domainUserInfo_sourceItemKeysAllowList_destinationItemKeysAllowList___block_invoke(uint64_t a1, void *a2)
{
  return FPExtensionMatchingDictionaryForItem(a2, *(void **)(a1 + 32));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPPreflightUserInteraction predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FPPreflightUserInteractionAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifier, a3);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (NSArray)subInteractions
{
  return self->_subInteractions;
}

- (void)setSubInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_subInteractions, a3);
}

- (BOOL)hasSuppressionIdentifier
{
  return self->_hasSuppressionIdentifier;
}

- (void)setHasSuppressionIdentifier:(BOOL)a3
{
  self->_hasSuppressionIdentifier = a3;
}

- (NSString)helpURL
{
  return self->_helpURL;
}

- (void)setHelpURL:(id)a3
{
  objc_storeStrong((id *)&self->_helpURL, a3);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSString)userInteractionIdentifier
{
  return self->_userInteractionIdentifier;
}

- (void)setUserInteractionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userInteractionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_helpURL, 0);
  objc_storeStrong((id *)&self->_subInteractions, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

+ (id)interactionsForProviderItem:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFURL *v13;
  CFBundleRef v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a3;
  objc_msgSend(v5, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v6, a4);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("NSFileProviderUserInteractions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v8, "URL");
      v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v14 = CFBundleCreate(0, v13);
      objc_msgSend(v12, "setCfBundle:", v14);

      objc_msgSend(v12, "setTableNames:", &unk_1E448F518);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __77__FPPreflightUserInteraction_Convenience__interactionsForProviderItem_error___block_invoke;
      v18[3] = &unk_1E444C980;
      v19 = v12;
      v20 = v6;
      v21 = v5;
      v15 = v12;
      objc_msgSend(v11, "fp_map:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __77__FPPreflightUserInteraction_Convenience__interactionsForProviderItem_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "providerDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:](FPPreflightUserInteraction, "interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:", v5, v2, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)gatherErrorsForInteractions:(id)a3 evaluationObjects:(id)a4 suppressionDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "evaluateWithObjectsByName:suppressionDelegate:", v8, v9, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)userInteractionErrorsInInfoPlistDict:(id)a3 forAction:(id)a4 bundleID:(id)a5 hierarchyServicer:(id)a6 sourceNSFPItems:(id)a7 destinationNSFPItem:(id)a8 localizationLookup:(id)a9 provider:(id)a10 domain:(id)a11 extensionCapabilities:(unint64_t)a12 useFPFS:(BOOL)a13
{
  id v17;
  void *v18;
  FPItem *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  FPItem *v24;
  FPItem *v25;
  FPItem *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v43 = a4;
  v42 = a5;
  v17 = a7;
  v41 = a8;
  v40 = a9;
  v46 = a10;
  v45 = a11;
  v18 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v19 = (FPItem *)v17;
  v20 = -[FPItem countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v19);
        v24 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:]([FPItem alloc], "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), v46, v45, 0, a12, a13);
        if (!v24)
        {
          fp_current_or_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            +[FPPreflightUserInteraction(CloudDocs) userInteractionErrorsInInfoPlistDict:forAction:bundleID:hierarchyServicer:sourceNSFPItems:destinationNSFPItem:localizationLookup:provider:domain:extensionCapabilities:useFPFS:].cold.1();
          v28 = (void *)MEMORY[0x1E0C9AA60];
          v26 = v19;
          goto LABEL_23;
        }
        v25 = v24;
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = -[FPItem countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v21)
        continue;
      break;
    }
  }

  if (v41)
    v26 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:]([FPItem alloc], "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", v41, v46, v45, 0, a12, a13);
  else
    v26 = 0;
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("NSFileProviderUserInteractions"), a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "interactionsForArray:localizationLookup:providerIdentifier:domainIdentifier:", v29, v40, v42, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[FPPreflightUserInteraction evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:](FPPreflightUserInteraction, "evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:", v43, v18, v26, 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v27 = v30;
  v32 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "evaluateWithObjectsByName:suppressionDelegate:", v31, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v36);

      }
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v33);
  }

LABEL_23:
  return v28;
}

+ (void)interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Can't parse activation rule '%@' containing: %%", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)interactionFromDictionary:(NSObject *)a3 localizationLookup:providerIdentifier:domainIdentifier:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] Can't parse activation rule: %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

+ (void)interactionFromDictionary:(uint64_t)a1 localizationLookup:(NSObject *)a2 providerIdentifier:domainIdentifier:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 138412802;
  v3 = a1;
  v4 = 2112;
  v5 = CFSTR("SubInteractions");
  v6 = 2112;
  v7 = CFSTR("Alert");
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Interaction %@ has doesn't have valid value for %@ nor %@ keys, ignoring", (uint8_t *)&v2, 0x20u);
}

+ (void)interactionFromDictionary:(uint64_t)a3 localizationLookup:(uint64_t)a4 providerIdentifier:(uint64_t)a5 domainIdentifier:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_37(&dword_1A0A34000, a1, a3, "[ERROR] Could not deserialize FPHelpURLInfoPlist, expected NSString", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

+ (void)interactionFromDictionary:(uint64_t)a3 localizationLookup:(uint64_t)a4 providerIdentifier:(uint64_t)a5 domainIdentifier:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_37(&dword_1A0A34000, a1, a3, "[ERROR] Could not deserialize FPSuppressionIdentifierInfoPlist, expected NSString", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

+ (void)interactionsForBundle:providerIdentifier:domainIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] List of user interactions %@ is not an array", v2);
  OUTLINED_FUNCTION_3();
}

void __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] User interaction %@ is not a dictionary", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Failed to evaluate alert subtitle format. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Failed to evaluate alert title format. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_evaluateWithObjectsByName:(uint64_t)a3 sourceItems:(uint64_t)a4 suppressionDelegate:(uint64_t)a5 errorIndex:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_37(&dword_1A0A34000, a1, a3, "[ERROR] Provider configured UserInteraction to allow suppression, but did not implement NSFileProviderUserInteractionSuppressing on the principal class", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Failed to evaluate alert continue caption format. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Failed to evaluate alert cancel caption format. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No match for predicate %@", v4, 0xCu);

  OUTLINED_FUNCTION_6_1();
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(uint64_t)a2 suppressionDelegate:(uint64_t)a3 errorIndex:(NSObject *)a4 .cold.7(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a4, a3, "[ERROR] Can't evaluate activation rule: %@: %@", (uint8_t *)a3);

}

@end

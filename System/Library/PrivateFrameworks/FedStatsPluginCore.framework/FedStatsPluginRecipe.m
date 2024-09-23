@implementation FedStatsPluginRecipe

- (FedStatsPluginRecipe)initWithAssetProvider:(id)a3 clientIdentifier:(id)a4 recordMetadata:(id)a5 dataTypeContent:(id)a6 sqlQuery:(id)a7 cohortNameList:(id)a8
{
  id v15;
  id v16;
  id v17;
  FedStatsPluginRecipe *v18;
  FedStatsPluginRecipe *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FedStatsPluginRecipe;
  v18 = -[FedStatsPluginRecipe init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_assetProvider, a3);
    objc_storeStrong((id *)&v19->_clientIdentifier, a4);
    objc_storeStrong((id *)&v19->_recordMetadata, a5);
    objc_storeStrong((id *)&v19->_dataTypeContent, a6);
    objc_storeStrong((id *)&v19->_sqlQuery, a7);
    objc_storeStrong((id *)&v19->_cohortNameList, a8);
  }

  return v19;
}

+ (id)recipeWithAssetProvider:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  char v39;
  FedStatsPluginRecipe *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id obj;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  id v83;
  _BYTE v84[128];
  _QWORD v85[2];
  _QWORD v86[2];
  uint64_t v87;
  const __CFString *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v83 = 0;
  objc_msgSend(v5, "recipeDictionaryWithError:", &v83);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v83;
  if (a4 && !v6)
  {
    +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 100, v7, CFSTR("Trial client cannot load the recipe"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("clientIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "namespaceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      +[FedStatsPluginClientValidator checkClientIdentifier:againstNamespaceIdentifier:error:](FedStatsPluginClientValidator, "checkClientIdentifier:againstNamespaceIdentifier:error:", v8, v9, &v82);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v82;

      if (v10)
      {
        if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("dataTypeContent"));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
          {
            v63 = v10;
            v64 = v11;
            v61 = v7;
            v65 = v6;
            v67 = (void *)v12;
            objc_msgSend(MEMORY[0x24BE30C70], "extractRequiredFieldsFrom:", v12);
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            obj = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
            if (!v14)
              goto LABEL_17;
            v15 = v14;
            v16 = *(_QWORD *)v79;
            while (1)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v79 != v16)
                  objc_enumerationMutation(obj);
                v18 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
                objc_msgSend(v5, "namespaceIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = +[FedStatsDataCohort checkCohortField:forNamespaceID:](FedStatsDataCohort, "checkCohortField:forNamespaceID:", v18, v19);

                if (!v20)
                {
                  if (a4)
                  {
                    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, CFSTR("Data type content contains required field(s) that are not allowed"));
                    v40 = 0;
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v21 = obj;
                  v6 = v65;
                  goto LABEL_54;
                }
              }
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
              if (!v15)
              {
LABEL_17:

                v6 = v65;
                objc_msgSend(v65, "objectForKey:", CFSTR("cohorts"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v21)
                  goto LABEL_29;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  v57 = v21;
                  v22 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
                  if (!v22)
                    goto LABEL_28;
                  v23 = v22;
                  v59 = *(_QWORD *)v75;
                  v55 = v21;
                  v10 = v63;
LABEL_21:
                  v24 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v75 != v59)
                      objc_enumerationMutation(v57);
                    v25 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v24);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      break;
                    objc_msgSend(v5, "namespaceIdentifier");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = +[FedStatsDataCohort checkCohortField:forNamespaceID:](FedStatsDataCohort, "checkCohortField:forNamespaceID:", v25, v26);

                    if (!v27)
                    {
                      if (a4)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cohort field '%@' is not allowed for this namespace"), v25);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, v51);
                        *a4 = (id)objc_claimAutoreleasedReturnValue();

                      }
LABEL_81:
                      v21 = v57;

                      v40 = 0;
                      v7 = v61;
                      goto LABEL_55;
                    }
                    if (v23 == ++v24)
                    {
                      v23 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
                      v21 = v55;
                      if (v23)
                        goto LABEL_21;
LABEL_28:

LABEL_29:
                      v56 = v21;
                      v28 = *MEMORY[0x24BE2CBF0];
                      v87 = *MEMORY[0x24BE2CBF0];
                      v88 = &stru_250C58180;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = *MEMORY[0x24BE2CBE8];
                      objc_msgSend(v65, "objectForKey:", *MEMORY[0x24BE2CBE8]);
                      v31 = objc_claimAutoreleasedReturnValue();
                      v60 = (void *)v31;
                      if (v31)
                      {
                        v85[0] = v28;
                        v85[1] = v30;
                        v86[0] = &stru_250C58180;
                        v86[1] = v31;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
                        v32 = objc_claimAutoreleasedReturnValue();

                        v29 = (void *)v32;
                      }
                      v6 = v65;
                      objc_msgSend(v65, "objectForKey:", CFSTR("sqlQuery"));
                      v33 = objc_claimAutoreleasedReturnValue();
                      v7 = v61;
                      v10 = v63;
                      v11 = v64;
                      v21 = v56;
                      v58 = v29;
                      v54 = (void *)v33;
                      if (v33)
                      {
                        v34 = (void *)v33;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v35 = v34;
                          goto LABEL_34;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v72 = 0u;
                          v73 = 0u;
                          v70 = 0u;
                          v71 = 0u;
                          v46 = v34;
                          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
                          if (v47)
                          {
                            v48 = v47;
                            v49 = *(_QWORD *)v71;
                            while (2)
                            {
                              for (j = 0; j != v48; ++j)
                              {
                                if (*(_QWORD *)v71 != v49)
                                  objc_enumerationMutation(v46);
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v11 = v64;
                                  if (a4)
                                  {
                                    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, CFSTR("If SQL query is an array, all entries must be strings"));
                                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                                  }

                                  v40 = 0;
                                  v6 = v65;
                                  v7 = v61;
                                  goto LABEL_99;
                                }
                              }
                              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
                              v6 = v65;
                              if (v48)
                                continue;
                              break;
                            }
                          }

                          objc_msgSend(v46, "componentsJoinedByString:", CFSTR(" "));
                          v35 = (id)objc_claimAutoreleasedReturnValue();
                          v7 = v61;
                          v29 = v58;
LABEL_34:
                          +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                          v36 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                            +[FedStatsPluginRecipe recipeWithAssetProvider:error:].cold.1();

                          objc_msgSend(v5, "namespaceIdentifier");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v69 = 0;
                          +[FedStatsPluginSQLQueryValidator isValidSQLQuery:forNamespaceID:possibleError:](FedStatsPluginSQLQueryValidator, "isValidSQLQuery:forNamespaceID:possibleError:", v35, v37, &v69);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          v66 = v69;

                          v62 = v38;
                          if (v38)
                          {
                            v39 = objc_msgSend(v38, "BOOLValue");
                            v11 = v64;
                            v21 = v56;
                            if ((v39 & 1) != 0)
                            {
                              if ((checkPrivateRelay(v35, v8, v60) & 1) != 0)
                              {
                                v40 = -[FedStatsPluginRecipe initWithAssetProvider:clientIdentifier:recordMetadata:dataTypeContent:sqlQuery:cohortNameList:]([FedStatsPluginRecipe alloc], "initWithAssetProvider:clientIdentifier:recordMetadata:dataTypeContent:sqlQuery:cohortNameList:", v5, v8, v29, v67, v35, v56);
                                goto LABEL_98;
                              }
                              if (a4)
                              {
                                v53 = CFSTR("Cannot validate recipe for Private Relay usage");
LABEL_95:
                                +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, v53);
                                v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_96:
                                v40 = 0;
                                *a4 = v52;
LABEL_98:

LABEL_99:
LABEL_56:

LABEL_57:
                                v13 = v67;
                                goto LABEL_58;
                              }
                            }
                            else if (a4)
                            {
                              v53 = CFSTR("SQL query not valid");
                              goto LABEL_95;
                            }
                          }
                          else
                          {
                            v11 = v64;
                            v21 = v56;
                            if (a4)
                            {
                              +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 100, v66, CFSTR("Cannot validate SQL query"));
                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                              goto LABEL_96;
                            }
                          }
                          v40 = 0;
                          goto LABEL_98;
                        }
                        if (a4)
                        {
                          v45 = CFSTR("SQL query should either be an array of strings or a single string");
                          goto LABEL_84;
                        }
                      }
                      else if (a4)
                      {
                        v45 = CFSTR("Recipe is missing SQL query");
LABEL_84:
                        +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, v45);
                        v40 = 0;
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                        goto LABEL_99;
                      }
                      v40 = 0;
                      goto LABEL_99;
                    }
                  }
                  if (a4)
                  {
                    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, CFSTR("Cohorts must be a list of strings."));
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_81;
                }
                if (a4)
                {
                  +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, CFSTR("Cohorts must be a list of strings."));
                  v40 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v40 = 0;
                }
LABEL_54:
                v10 = v63;
LABEL_55:
                v11 = v64;
                goto LABEL_56;
              }
            }
          }
          if (a4)
          {
            v67 = 0;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("key %@ missing from recipe"), CFSTR("dataTypeContent"));
            obj = (id)objc_claimAutoreleasedReturnValue();
            +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100);
            v40 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_57;
          }
          v40 = 0;
LABEL_58:

          goto LABEL_59;
        }
        if (a4)
        {
          v41 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "namespaceIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("The client identifier \"%@\" is not allowed for the namespace \"%@\"), v8, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, v43);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (a4)
      {
        +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 100, v11, CFSTR("Cannot perform recipe ID check"));
        v40 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

        goto LABEL_60;
      }
      v40 = 0;
      goto LABEL_59;
    }
  }
  if (a4)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 100, CFSTR("Recipe is missing client identifier string"));
    v40 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
LABEL_60:

  return v40;
}

- (id)runRecipeWithError:(id *)a3
{
  FedStatsPluginLocationServiceConsentChecker *v5;
  FedStatsPluginUserProofingConsentChecker *v6;
  FedStatsPluginIHAConsentChecker *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  FedStatsPluginSQL *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id *v31;
  id obj;
  id v33;
  id v34;
  id v35;
  uint8_t buf[8];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(FedStatsPluginLocationServiceConsentChecker);
  v43[0] = v5;
  v6 = objc_alloc_init(FedStatsPluginUserProofingConsentChecker);
  v43[1] = v6;
  v7 = objc_alloc_init(FedStatsPluginIHAConsentChecker);
  v43[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = *(_QWORD *)v39;
  v31 = a3;
  obj = v9;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v39 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe runRecipeWithError:].cold.4();

      -[FedStatsPluginRecipe clientIdentifier](self, "clientIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v14, "checkConsentForClientIdentifier:error:", v16, &v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (FedStatsPluginSQL *)v37;

      if (!v17)
      {
        if (v31)
        {
          +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 400, v18, CFSTR("Cannot run consent check"));
          v26 = 0;
          *v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
LABEL_31:
        v9 = obj;

        v22 = obj;
        goto LABEL_44;
      }
      v19 = objc_msgSend(v17, "BOOLValue");
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v19 & 1) == 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23B425000, v21, OS_LOG_TYPE_INFO, "Plugin not consented to run for the use-case", buf, 2u);
        }

        v26 = &unk_250C5B170;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe runRecipeWithError:].cold.3();

    }
    v9 = obj;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    a3 = v31;
    if (v11)
      continue;
    break;
  }
LABEL_14:

  v35 = 0;
  v18 = -[FedStatsPluginSQL initWithError:]([FedStatsPluginSQL alloc], "initWithError:", &v35);
  v22 = v35;
  if (!v18)
  {
    if (a3)
    {
      +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 400, v22, CFSTR("SQL Constructor Error"));
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_44;
  }
  -[FedStatsPluginRecipe sqlQuery](self, "sqlQuery");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v22;
  -[FedStatsPluginSQL runQuery:withError:](v18, "runQuery:withError:", v23, &v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v34;

  if (!v24)
  {
    if (a3)
    {
      +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 400, v25, CFSTR("SQL Query Running Error"));
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
LABEL_42:
    v22 = v25;
    goto LABEL_43;
  }
  if (!objc_msgSend(v24, "count"))
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[FedStatsPluginRecipe runRecipeWithError:].cold.1();

    v26 = &unk_250C5B170;
    goto LABEL_42;
  }
  v33 = v25;
  -[FedStatsPluginRecipe recordDataArray:error:](self, "recordDataArray:error:", v24, &v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v33;

  if (v26)
  {
    if (v22)
    {
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe runRecipeWithError:].cold.2();

    }
    v28 = v26;
  }
  else if (a3)
  {
    +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 400, v22, CFSTR("SQL Query Recording Error"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_43:
LABEL_44:

  return v26;
}

- (id)recordDataArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[FedStatsPluginRecipe recordMetadata](self, "recordMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsPluginRecipe recordDataArray:metadata:error:](self, "recordDataArray:metadata:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recordDataArray:(id)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  FedStatsCollectionKeyGenerator *v13;
  void *v14;
  void *v15;
  void *v16;
  FedStatsCollectionKeyGenerator *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  FedStatsPluginRecipe *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  char v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t jj;
  uint64_t v108;
  NSObject *v109;
  void *v111;
  id v112;
  uint64_t v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  FedStatsCollectionKeyGenerator *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  id obj;
  id obja;
  FedStatsPluginRecipe *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  id v170[2];
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  uint64_t v183;
  uint8_t buf[4];
  id v185;
  uint8_t v186[4];
  uint64_t v187;
  __int16 v188;
  void *v189;
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v115 = a4;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x24BE30C70];
      -[FedStatsPluginRecipe dataTypeContent](self, "dataTypeContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "extractRequiredFieldsFrom:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.6(v11, v12);

      v13 = [FedStatsCollectionKeyGenerator alloc];
      -[FedStatsPluginRecipe clientIdentifier](self, "clientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FedStatsPluginRecipe cohortNameList](self, "cohortNameList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = self;
      -[FedStatsPluginRecipe assetProvider](self, "assetProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v11;
      v17 = -[FedStatsCollectionKeyGenerator initWithPrefix:cohortKeys:requiredFields:assetProvider:](v13, "initWithPrefix:cohortKeys:requiredFields:assetProvider:", v14, v15, v11, v16);

      v112 = v8;
      v18 = v8;
      v118 = v17;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v172;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v172 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * i);
            v170[0] = 0;
            -[FedStatsCollectionKeyGenerator generateCollectionKeyForDataPoint:error:](v118, "generateCollectionKeyForDataPoint:error:", v25, v170);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v170[0];
            if (v26)
            {
              objc_msgSend(v19, "objectForKey:", v26);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28)
              {
                -[NSObject arrayByAddingObject:](v28, "arrayByAddingObject:", v25);
              }
              else
              {
                v183 = v25;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v183, 1);
              }
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v30, v26);

            }
            else
            {
              +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v185 = v27;
                _os_log_error_impl(&dword_23B425000, v29, OS_LOG_TYPE_ERROR, "Cannot generate collection key. Error: %@", buf, 0xCu);
              }
            }

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
        }
        while (v22);
      }

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      obj = v19;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v182, 16);
      v33 = v126;
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v167;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v167 != v35)
              objc_enumerationMutation(obj);
            +[FedStatsCollectionKeyGenerator extractCohortKeyValuesFrom:](FedStatsCollectionKeyGenerator, "extractCohortKeyValuesFrom:", *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * j));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)MEMORY[0x24BE30C70];
            -[FedStatsPluginRecipe dataTypeContent](v126, "dataTypeContent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "extractAssetNamesFrom:usingFieldValues:", v39, v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "addObjectsFromArray:", v40);
          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v182, 16);
        }
        while (v34);
      }

      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.5(v31, v41);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v114 = v31;
      v42 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v162, v181, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v163;
        v119 = *(_QWORD *)v163;
        do
        {
          v45 = 0;
          v122 = (id)v43;
          do
          {
            if (*(_QWORD *)v163 != v44)
              objc_enumerationMutation(v114);
            v46 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v45);
            -[FedStatsPluginRecipe assetProvider](v33, "assetProvider");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = 0;
            objc_msgSend(v47, "assetURLForKey:error:", v46, &v161);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = v161;

            if (v48)
            {
              objc_msgSend(v127, "setObject:forKey:", v48, v46);
            }
            else
            {
              +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v186 = 138412290;
                v187 = (uint64_t)v46;
                _os_log_fault_impl(&dword_23B425000, v49, OS_LOG_TYPE_FAULT, "Cannot download asset \"%@\". Error: ", v186, 0xCu);
              }

              v159 = 0u;
              v160 = 0u;
              v157 = 0u;
              v158 = 0u;
              objc_msgSend(v131, "describe");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
              if (v51)
              {
                v52 = v51;
                v53 = *(_QWORD *)v158;
                do
                {
                  for (k = 0; k != v52; ++k)
                  {
                    if (*(_QWORD *)v158 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k);
                    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                    v56 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v186 = 138412290;
                      v187 = v55;
                      _os_log_debug_impl(&dword_23B425000, v56, OS_LOG_TYPE_DEBUG, "%@", v186, 0xCu);
                    }

                  }
                  v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
                }
                while (v52);
              }

              v33 = v126;
              v44 = v119;
              v43 = (uint64_t)v122;
              v48 = 0;
            }

            ++v45;
          }
          while (v45 != v43);
          v43 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v162, v181, 16);
        }
        while (v43);
      }

      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.4();

      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v123 = obj;
      v120 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v153, v179, 16);
      if (v120)
      {
        v116 = 0;
        v58 = *(_QWORD *)v154;
        v113 = *(_QWORD *)v154;
        do
        {
          for (m = 0; m != v120; ++m)
          {
            if (*(_QWORD *)v154 != v58)
              objc_enumerationMutation(v123);
            v60 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * m);
            +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v186 = 138412290;
              v187 = (uint64_t)v60;
              _os_log_debug_impl(&dword_23B425000, v61, OS_LOG_TYPE_DEBUG, "collectionKey = %@", v186, 0xCu);
            }

            +[FedStatsCollectionKeyGenerator extractCohortKeyValuesFrom:](FedStatsCollectionKeyGenerator, "extractCohortKeyValuesFrom:", v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v186 = 138412290;
              v187 = (uint64_t)v62;
              _os_log_debug_impl(&dword_23B425000, v63, OS_LOG_TYPE_DEBUG, "fieldValues = %@", v186, 0xCu);
            }

            v64 = (void *)MEMORY[0x24BE30C70];
            -[FedStatsPluginRecipe dataTypeContent](v33, "dataTypeContent");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = 0;
            objc_msgSend(v64, "mutateDataTypeContent:usingFieldValues:assetURLs:error:", v65, v62, v127, &v152);
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = v152;

            v68 = (void *)v66;
            +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
            v69 = objc_claimAutoreleasedReturnValue();
            v70 = v69;
            v132 = v67;
            if (v68)
            {
              v71 = v58;
              v128 = v62;
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v186 = 138412290;
                v187 = (uint64_t)v68;
                _os_log_debug_impl(&dword_23B425000, v70, OS_LOG_TYPE_DEBUG, "dataTypeContent = %@", v186, 0xCu);
              }

              v72 = (void *)MEMORY[0x24BE30C70];
              objc_msgSend(v123, "objectForKey:", v60);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = 0;
              objc_msgSend(v72, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v73, v68, v115, v60, &v147);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v147;

              +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
              v76 = objc_claimAutoreleasedReturnValue();
              v77 = v76;
              if (v74)
              {
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                {
                  v93 = objc_msgSend(v74, "unsignedIntegerValue");
                  *(_DWORD *)v186 = 134218242;
                  v187 = v93;
                  v188 = 2112;
                  v189 = v60;
                  _os_log_debug_impl(&dword_23B425000, v77, OS_LOG_TYPE_DEBUG, "Recorded %lu data for collection key '%@'", v186, 0x16u);
                }

                v78 = v74;
                v116 += objc_msgSend(v74, "unsignedIntegerValue");
                v62 = v128;
                v58 = v71;
                v33 = v126;
              }
              else
              {
                if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
                  -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.3(buf, &buf[1]);
                v117 = v68;

                +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                v85 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                  -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.2(v170, (_BYTE *)v170 + 1);

                v145 = 0u;
                v146 = 0u;
                v143 = 0u;
                v144 = 0u;
                objc_msgSend(v75, "describe");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v143, v177, 16);
                if (v87)
                {
                  v88 = v87;
                  v89 = *(_QWORD *)v144;
                  do
                  {
                    for (n = 0; n != v88; ++n)
                    {
                      if (*(_QWORD *)v144 != v89)
                        objc_enumerationMutation(v86);
                      v91 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * n);
                      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                      v92 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)v186 = 138412290;
                        v187 = v91;
                        _os_log_debug_impl(&dword_23B425000, v92, OS_LOG_TYPE_DEBUG, "%@", v186, 0xCu);
                      }

                    }
                    v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v143, v177, 16);
                  }
                  while (v88);
                }

                v78 = 0;
                v33 = v126;
                v58 = v113;
                v62 = v128;
                v68 = v117;
              }

            }
            else
            {
              if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                -[FedStatsPluginRecipe recordDataArray:metadata:error:].cold.1(&v171, (_BYTE *)&v171 + 1);

              v150 = 0u;
              v151 = 0u;
              v148 = 0u;
              v149 = 0u;
              objc_msgSend(v67, "describe");
              v75 = (id)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v148, v178, 16);
              if (v79)
              {
                v80 = v79;
                v129 = v62;
                v81 = *(_QWORD *)v149;
                do
                {
                  for (ii = 0; ii != v80; ++ii)
                  {
                    if (*(_QWORD *)v149 != v81)
                      objc_enumerationMutation(v75);
                    v83 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * ii);
                    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                    v84 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v186 = 138412290;
                      v187 = v83;
                      _os_log_debug_impl(&dword_23B425000, v84, OS_LOG_TYPE_DEBUG, "%@", v186, 0xCu);
                    }

                  }
                  v80 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v148, v178, 16);
                }
                while (v80);
                v58 = v113;
                v62 = v129;
                v68 = 0;
              }
            }

          }
          v120 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v153, v179, 16);
        }
        while (v120);
      }
      else
      {
        v116 = 0;
      }

      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      objc_msgSend(v127, "allKeys");
      v130 = (id)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v139, v176, 16);
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v140;
        v121 = *(_QWORD *)v140;
        do
        {
          v98 = 0;
          obja = (id)v96;
          do
          {
            if (*(_QWORD *)v140 != v97)
              objc_enumerationMutation(v130);
            v99 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v98);
            -[FedStatsPluginRecipe assetProvider](v33, "assetProvider");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = 0;
            v101 = objc_msgSend(v100, "removeAssetForKey:error:", v99, &v138);
            v133 = v138;

            if ((v101 & 1) == 0)
            {
              +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v186 = 138412290;
                v187 = (uint64_t)v99;
                _os_log_fault_impl(&dword_23B425000, v102, OS_LOG_TYPE_FAULT, "Cannot remove asset \"%@\". Error: ", v186, 0xCu);
              }

              v136 = 0u;
              v137 = 0u;
              v134 = 0u;
              v135 = 0u;
              objc_msgSend(v133, "describe");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v134, v175, 16);
              if (v104)
              {
                v105 = v104;
                v106 = *(_QWORD *)v135;
                do
                {
                  for (jj = 0; jj != v105; ++jj)
                  {
                    if (*(_QWORD *)v135 != v106)
                      objc_enumerationMutation(v103);
                    v108 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * jj);
                    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                    v109 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v186 = 138412290;
                      v187 = v108;
                      _os_log_debug_impl(&dword_23B425000, v109, OS_LOG_TYPE_DEBUG, "%@", v186, 0xCu);
                    }

                  }
                  v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v134, v175, 16);
                }
                while (v105);
              }

              v96 = (uint64_t)obja;
              v33 = v126;
              v97 = v121;
            }

            ++v98;
          }
          while (v98 != v96);
          v96 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v139, v176, 16);
        }
        while (v96);
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v116);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v112;
    }
    else
    {
      v94 = &unk_250C5B170;
    }
  }
  else if (a5)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 400, CFSTR("Received nil data array"));
    v94 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v94 = 0;
  }

  return v94;
}

- (FedStatsPluginAssetProviderProtocol)assetProvider
{
  return self->_assetProvider;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDictionary)recordMetadata
{
  return self->_recordMetadata;
}

- (void)setRecordMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_recordMetadata, a3);
}

- (NSDictionary)dataTypeContent
{
  return self->_dataTypeContent;
}

- (void)setDataTypeContent:(id)a3
{
  objc_storeStrong((id *)&self->_dataTypeContent, a3);
}

- (NSString)sqlQuery
{
  return self->_sqlQuery;
}

- (void)setSqlQuery:(id)a3
{
  objc_storeStrong((id *)&self->_sqlQuery, a3);
}

- (NSArray)cohortNameList
{
  return self->_cohortNameList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortNameList, 0);
  objc_storeStrong((id *)&self->_sqlQuery, 0);
  objc_storeStrong((id *)&self->_dataTypeContent, 0);
  objc_storeStrong((id *)&self->_recordMetadata, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
}

+ (void)recipeWithAssetProvider:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_23B425000, v0, v1, "SQL Query: \"%@\", v2);
  OUTLINED_FUNCTION_10();
}

- (void)runRecipeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23B425000, v0, v1, "Nothing to record ¯\\_(ツ)_/¯", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)runRecipeWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_23B425000, v0, v1, "Cannot record all data: %@", v2);
  OUTLINED_FUNCTION_10();
}

- (void)runRecipeWithError:.cold.3()
{
  _QWORD *v0;
  _DWORD *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_5(&dword_23B425000, v4, v5, "Consent check passed for class %@");

  OUTLINED_FUNCTION_11();
}

- (void)runRecipeWithError:.cold.4()
{
  _QWORD *v0;
  _DWORD *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_5(&dword_23B425000, v4, v5, "Running consent check for class %@");

  OUTLINED_FUNCTION_11();
}

- (void)recordDataArray:(_BYTE *)a1 metadata:(_BYTE *)a2 error:.cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_8(&dword_23B425000, v2, v3, "Cannot fill in URLs for the data-type-content", v4);
}

- (void)recordDataArray:(_BYTE *)a1 metadata:(_BYTE *)a2 error:.cold.2(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  _os_log_debug_impl(&dword_23B425000, v2, OS_LOG_TYPE_DEBUG, "Error:", v3, 2u);
}

- (void)recordDataArray:(_BYTE *)a1 metadata:(_BYTE *)a2 error:.cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_8(&dword_23B425000, v2, v3, "Cannot decode and record some data", v4);
}

- (void)recordDataArray:metadata:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_23B425000, v0, v1, "assetURLs = %@", v2);
  OUTLINED_FUNCTION_10();
}

- (void)recordDataArray:(void *)a1 metadata:(NSObject *)a2 error:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_23B425000, a2, v5, "requiredAssets = {'%@'}", v6);

}

- (void)recordDataArray:(void *)a1 metadata:(NSObject *)a2 error:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_23B425000, a2, v4, "requiredFields = ['%@']", v5);

}

@end

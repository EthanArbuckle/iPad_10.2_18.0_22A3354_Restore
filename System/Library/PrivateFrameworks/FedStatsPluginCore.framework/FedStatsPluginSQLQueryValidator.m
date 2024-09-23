@implementation FedStatsPluginSQLQueryValidator

- (FedStatsPluginSQLQueryValidator)initWithAllowList:(id)a3 blockList:(id)a4
{
  id v7;
  id v8;
  FedStatsPluginSQLQueryValidator *v9;
  FedStatsPluginSQLQueryValidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsPluginSQLQueryValidator;
  v9 = -[FedStatsPluginSQLQueryValidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allowList, a3);
    objc_storeStrong((id *)&v10->_blockList, a4);
  }

  return v10;
}

+ (id)parseQueryPermissionList:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot load allow-list from class bundle file"));
      v13 = 0;
      v14 = 0;
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v28 = 0;
    }
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (!v10)
    goto LABEL_19;
  v15 = *(_QWORD *)v47;
  v34 = v5;
  v39 = v9;
  v40 = a4;
  v32 = *(_QWORD *)v47;
LABEL_4:
  v16 = 0;
  v17 = v12;
  v33 = v10;
LABEL_5:
  if (*(_QWORD *)v47 != v15)
  {
    v18 = v16;
    objc_enumerationMutation(v9);
    v16 = v18;
  }
  v36 = v16;
  v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v16);
  objc_msgSend(v7, "objectForKey:", v19, v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v19;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v20;
    v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (!v21)
      goto LABEL_17;
    v22 = v21;
    v23 = *(_QWORD *)v43;
    v37 = v7;
    v38 = v8;
LABEL_10:
    v24 = 0;
    v25 = v13;
    v26 = v14;
    while (1)
    {
      if (*(_QWORD *)v43 != v23)
        objc_enumerationMutation(v11);
      v27 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v41 = v26;
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v27, 16, &v41);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v41;

      if (!v13)
      {
        v29 = v40;
        if (v40)
        {
          +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v14, CFSTR("Permission list has a malformed regex value"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
LABEL_26:
          v5 = v34;
          v7 = v37;
          v9 = v39;
          *v29 = v30;
LABEL_31:

          v13 = v25;
          v8 = v38;
          goto LABEL_32;
        }
        v25 = 0;
LABEL_30:
        v5 = v34;
        v7 = v37;
        v9 = v39;
        goto LABEL_31;
      }
      objc_msgSend(v12, "addObject:", v13);
      ++v24;
      v25 = v13;
      v26 = v14;
      if (v22 == v24)
      {
        v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v7 = v37;
        v8 = v38;
        if (v22)
          goto LABEL_10;
LABEL_17:

        objc_msgSend(v8, "setObject:forKey:", v12, v35);
        v16 = v36 + 1;
        v17 = v12;
        v15 = v32;
        v9 = v39;
        a4 = v40;
        if (v36 + 1 == v33)
        {
          v10 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          v5 = v34;
          if (!v10)
          {
LABEL_19:

            v28 = v8;
            v20 = v11;
            goto LABEL_33;
          }
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    v29 = v40;
    if (v40)
    {
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Permission list value has a non-string item"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v26;
      goto LABEL_26;
    }
    v14 = v26;
    goto LABEL_30;
  }
  if (a4)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Permission list has a non-list value"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v17;
  v5 = v34;
LABEL_32:

  v28 = 0;
LABEL_33:

LABEL_34:
  return v28;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FedStatsPluginSQLQueryValidator_sharedInstanceWithError___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceWithError__dispatchToken_0 != -1)
  {
    dispatch_once(&sharedInstanceWithError__dispatchToken_0, block);
    if (!a3)
      return (id)sharedInstanceWithError__sharedInstance_0;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)sharedInstanceWithError__error);
  return (id)sharedInstanceWithError__sharedInstance_0;
}

void __59__FedStatsPluginSQLQueryValidator_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("FedStatsPluginSQLQueryAllowList"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v20 = 0;
      +[FedStatsPluginSQLQueryValidator parseQueryPermissionList:error:](FedStatsPluginSQLQueryValidator, "parseQueryPermissionList:error:", v4, &v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v20;
      if (v5)
      {
        objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("FedStatsPluginSQLQueryBlockList"), CFSTR("plist"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v19 = v6;
          +[FedStatsPluginSQLQueryValidator parseQueryPermissionList:error:](FedStatsPluginSQLQueryValidator, "parseQueryPermissionList:error:", v7, &v19);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v19;

          if (v8)
          {
            v10 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAllowList:blockList:", v5, v8);
            v11 = (void *)sharedInstanceWithError__sharedInstance_0;
            sharedInstanceWithError__sharedInstance_0 = v10;
          }
          else
          {
            +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v9, CFSTR("Cannot create block-list"));
            v18 = objc_claimAutoreleasedReturnValue();
            v11 = (void *)sharedInstanceWithError__error;
            sharedInstanceWithError__error = v18;
          }

          v6 = v9;
        }
        else
        {
          +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot find block-list from class bundle"));
          v17 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)sharedInstanceWithError__error;
          sharedInstanceWithError__error = v17;
        }

      }
      else
      {
        +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v6, CFSTR("Cannot create allow-list"));
        v16 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)sharedInstanceWithError__error;
        sharedInstanceWithError__error = v16;
      }

    }
    else
    {
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot find allow-list from class bundle"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)sharedInstanceWithError__error;
      sharedInstanceWithError__error = v14;

    }
  }
  else
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot load class bundle"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)sharedInstanceWithError__error;
    sharedInstanceWithError__error = v12;

  }
}

+ (id)isValidSQLQuery:(id)a3 forNamespaceID:(id)a4 possibleError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const __CFString *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = 0;
      +[FedStatsPluginSQLQueryValidator sharedInstanceWithError:](FedStatsPluginSQLQueryValidator, "sharedInstanceWithError:", &v36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v36;
      if (!v9)
      {
        if (a5)
        {
          +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v10, CFSTR("Cannot create SQL query validator"));
          v24 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        goto LABEL_37;
      }
      objc_msgSend(v9, "blockList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v33;
LABEL_8:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v17), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length")))
            {
              goto LABEL_31;
            }
            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
              if (v15)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      objc_msgSend(v9, "allowList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v8);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v27 = v10;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v19 = v13;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v19);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length")))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_35;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v21)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
        v10 = v27;
        goto LABEL_36;
      }
LABEL_31:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    if (a5)
    {
      v25 = CFSTR("Namespace Identifier needs to be a string");
      goto LABEL_27;
    }
LABEL_30:
    v24 = 0;
    goto LABEL_38;
  }
  if (!a5)
    goto LABEL_30;
  v25 = CFSTR("SQL query needs to be a non-empty string");
LABEL_27:
  +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, v25);
  v24 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v24;
}

- (NSDictionary)allowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)blockList
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBlockList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockList, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end

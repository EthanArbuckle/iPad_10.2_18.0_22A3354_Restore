@implementation FedStatsPluginClientValidator

- (FedStatsPluginClientValidator)initWithAssociation:(id)a3
{
  id v5;
  FedStatsPluginClientValidator *v6;
  FedStatsPluginClientValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsPluginClientValidator;
  v6 = -[FedStatsPluginClientValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_association, a3);

  return v7;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceWithError__dispatchToken != -1)
  {
    dispatch_once(&sharedInstanceWithError__dispatchToken, block);
    if (!a3)
      return (id)sharedInstanceWithError__sharedInstance;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)sharedInstanceWithError__intError);
  return (id)sharedInstanceWithError__sharedInstance;
}

void __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot load class bundle"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v19;

    goto LABEL_31;
  }
  +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke_cold_1(v2, v3);

  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("FedStatsPluginClientAssociations"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot find associations file from class bundle"));
    v21 = objc_claimAutoreleasedReturnValue();
    v6 = (id)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v21;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Cannot load association file from class bundle file"));
    v22 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)sharedInstanceWithError__intError;
    sharedInstanceWithError__intError = v22;
    goto LABEL_27;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v7)
    goto LABEL_23;
  v8 = v7;
  v9 = *(_QWORD *)v35;
  v28 = a1;
  v29 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Associations must have strings as keys"));
        v25 = objc_claimAutoreleasedReturnValue();
        v12 = (id)sharedInstanceWithError__intError;
        sharedInstanceWithError__intError = v25;
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v6, "objectForKey:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Associations must have arrays of strings as values"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)sharedInstanceWithError__intError;
        sharedInstanceWithError__intError = v26;

        goto LABEL_29;
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v12 = v12;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        while (2)
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Associations must have arrays of strings as values"));
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = (void *)sharedInstanceWithError__intError;
              sharedInstanceWithError__intError = v23;

              goto LABEL_29;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v14)
            continue;
          break;
        }
      }

      v9 = v29;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    a1 = v28;
    if (v8)
      continue;
    break;
  }
LABEL_23:

  v17 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAssociation:", v6);
  v18 = (void *)sharedInstanceWithError__sharedInstance;
  sharedInstanceWithError__sharedInstance = v17;
LABEL_27:

LABEL_30:
LABEL_31:

}

+ (id)checkClientIdentifier:(id)a3 againstNamespaceIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
LABEL_10:
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, v14);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_11:
    v15 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  +[FedStatsPluginClientValidator sharedInstanceWithError:](FedStatsPluginClientValidator, "sharedInstanceWithError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "association");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "containsObject:", v7) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("fedstats:"), &stru_250C58180);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v16);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

LABEL_16:
  return v15;
}

- (NSDictionary)association
{
  return self->_association;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_association, 0);
}

void __57__FedStatsPluginClientValidator_sharedInstanceWithError___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_23B425000, a2, OS_LOG_TYPE_DEBUG, "class bundle path = %@", (uint8_t *)&v4, 0xCu);

}

@end

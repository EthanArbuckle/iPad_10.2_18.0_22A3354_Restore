@implementation WFUlyssesAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.soulmen.ulysses.pad");
}

- (WFUlyssesAccessResource)initWithDefinition:(id)a3
{
  id v4;
  WFUlyssesAccessResource *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  WFUlyssesAccessResource *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFUlyssesAccessResource;
  v5 = -[WFAccessResource initWithDefinition:](&v27, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEC4460]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEC4458]);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v7;
    objc_msgSend(v8, "appWithIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v9;
    objc_msgSend(v9, "schemes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "scheme");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v6);

          if (v17)
          {
            objc_storeStrong((id *)&v5->_scheme, v15);
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v5, sel_refreshAvailabilityWithNotification, CFSTR("WFUlyssesAccessResourceAvailabilityChangedNotification"), 0);

    v19 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFUlyssesAccessResourceAvailabilityChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)WFUlyssesAccessResource;
  -[WFAccessResource dealloc](&v4, sel_dealloc);
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Ulysses library"), CFSTR("your Ulysses library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("WFUlyssesAccessToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = 4;
  else
    v4 = 1;

  return v4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, void *);
  _QWORD v23[5];
  void (**v24)(id, _QWORD, void *);
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }
  else
  {
    -[WFUlyssesAccessResource scheme](self, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setScheme:", v13);

    objc_msgSend(v12, "setHost:", CFSTR("x-callback-url"));
    objc_msgSend(v12, "setPath:", CFSTR("/authorize"));
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("appname"), CFSTR("Shortcuts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQueryItems:", v15);

    v16 = (void *)MEMORY[0x24BEC4238];
    objc_msgSend(v12, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v23[3] = &unk_24F8B2450;
    v23[4] = self;
    v24 = v7;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v21[3] = &unk_24F8B8C28;
    v22 = v24;
    objc_msgSend(v16, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v17, v11, v6, CFSTR("com.ulyssesapp.ios"), v23, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "performRequest:", v19);

  }
}

- (ICScheme)scheme
{
  return self->_scheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheme, 0);
}

void __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("access-token"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("WFUlyssesAccessToken"));

    objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithNotification");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v4 = a2;
  if (objc_msgSend(v4, "code") == 4)
  {

    v3 = 0;
  }
  else
  {
    v3 = v4;
  }
  v5 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 0;
}

@end

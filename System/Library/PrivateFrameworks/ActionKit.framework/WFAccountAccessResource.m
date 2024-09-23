@implementation WFAccountAccessResource

- (WFAccountAccessResource)initWithDefinition:(id)a3
{
  id v4;
  WFAccountAccessResource *v5;
  objc_class *v6;
  uint64_t v7;
  id observer;
  WFAccountAccessResource *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFAccountAccessResource;
  v5 = -[WFAccessResource initWithDefinition:](&v14, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = -[WFAccountAccessResource accountClass](v5, "accountClass");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__WFAccountAccessResource_initWithDefinition___block_invoke;
    v11[3] = &unk_24F8B76C8;
    objc_copyWeak(&v12, &location);
    -[objc_class addAccountObserver:](v6, "addAccountObserver:", v11);
    v7 = objc_claimAutoreleasedReturnValue();
    observer = v5->_observer;
    v5->_observer = (id)v7;

    v9 = v5;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[objc_class removeAccountObserver:](-[WFAccountAccessResource accountClass](self, "accountClass"), "removeAccountObserver:", self->_observer);
  v3.receiver = self;
  v3.super_class = (Class)WFAccountAccessResource;
  -[WFAccessResource dealloc](&v3, sel_dealloc);
}

- (Class)accountClass
{
  void *v2;
  NSString *v3;
  void *v4;

  -[WFResource definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFAccountClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (NSArray)accounts
{
  return (NSArray *)-[objc_class accounts](-[WFAccountAccessResource accountClass](self, "accountClass"), "accounts");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your %@ account"), CFSTR("your %@ account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class serviceName](-[WFAccountAccessResource accountClass](self, "accountClass"), "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Shortcuts does not have access to your %@ account."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class serviceName](-[WFAccountAccessResource accountClass](self, "accountClass"), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("In order to answer this question, Shortcuts needs access to your %@ account."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class serviceName](-[WFAccountAccessResource accountClass](self, "accountClass"), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)status
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFAccountAccessResource accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 4;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isValid") & 1) != 0)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 1;
  }

  return v6;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  NSStringFromClass(-[WFAccountAccessResource accountClass](self, "accountClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v10[3] = &unk_24F8B8018;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "authorizeWithAccountClassName:completionHandler:", v8, v10);

}

- (id)name
{
  void *v3;
  void *v4;
  objc_super v6;

  -[WFAccessResource associatedAppIdentifier](self, "associatedAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFAccountAccessResource;
    -[WFAccessResource name](&v6, sel_name);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAccountAccessResource resourceName](self, "resourceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)resourceName
{
  return (id)-[objc_class localizedServiceName](-[WFAccountAccessResource accountClass](self, "accountClass"), "localizedServiceName");
}

- (id)username
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFAccountAccessResource accounts](self, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "refreshWithCompletionHandler:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[WFAccountAccessResource accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canLogOut
{
  return (-[objc_class allowsMultipleAccounts](-[WFAccountAccessResource accountClass](self, "accountClass"), "allowsMultipleAccounts") & 1) == 0&& -[objc_class numberOfAccounts](-[WFAccountAccessResource accountClass](self, "accountClass"), "numberOfAccounts") != 0;
}

- (BOOL)supportsMultipleAccounts
{
  return -[objc_class allowsMultipleAccounts](-[WFAccountAccessResource accountClass](self, "accountClass"), "allowsMultipleAccounts");
}

- (void)logOut
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WFAccountAccessResource accounts](self, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        +[WFAccount deleteAccount:](WFAccount, "deleteAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_observer, 0);
}

void __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_firstObjectWithValue:forKey:", v5, CFSTR("accountID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke_2;
      v9[3] = &unk_24F8B8C28;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "refreshWithCompletionHandler:", v9);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__WFAccountAccessResource_initWithDefinition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshAvailabilityWithNotification");

}

+ (id)userInterfaceProtocol
{
  return &unk_255DFCDD0;
}

+ (id)userInterfaceClasses
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE19938];
  v4[0] = *MEMORY[0x24BE19950];
  v4[1] = v2;
  v5[0] = CFSTR("WFAccountAccessResourceUserInterface");
  v5[1] = CFSTR("WFAccountAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

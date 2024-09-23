@implementation SUUIJSTabBarItem

- (SUUIJSTabBarItem)initWithAppContext:(id)a3 navigationController:(id)a4 tabBarItem:(id)a5 owner:(id)a6
{
  id v10;
  id v11;
  id v12;
  SUUIJSTabBarItem *v13;
  id v14;
  SUUIJSNavigationDocument *v15;
  SUUIJSNavigationDocument *navigationDocument;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  JSManagedValue *managedNavigationDocument;
  void *v22;
  JSManagedValue *v23;
  id v24;
  objc_super v26;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, a6);
  v26.receiver = self;
  v26.super_class = (Class)SUUIJSTabBarItem;
  v13 = -[IKJSObject initWithAppContext:](&v26, sel_initWithAppContext_, v10);
  if (v13)
  {
    v14 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v13->_owner, v14);

    objc_storeStrong((id *)&v13->_tabBarItem, a5);
    if (v11)
    {
      v15 = -[IKJSNavigationDocument initWithAppContext:navigationController:]([SUUIJSNavigationDocument alloc], "initWithAppContext:navigationController:", v10, v11);
      navigationDocument = v13->_navigationDocument;
      v13->_navigationDocument = v15;

      objc_msgSend(v10, "jsContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDDA728];
      objc_msgSend(MEMORY[0x24BDDA730], "valueWithObject:inContext:", v13->_navigationDocument, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "managedValueWithValue:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      managedNavigationDocument = v13->_managedNavigationDocument;
      v13->_managedNavigationDocument = (JSManagedValue *)v20;

      objc_msgSend(v17, "virtualMachine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v13->_managedNavigationDocument;
      v24 = objc_loadWeakRetained(&location);
      objc_msgSend(v22, "addManagedReference:withOwner:", v23, v24);

    }
  }
  objc_destroyWeak(&location);

  return v13;
}

- (void)dealloc
{
  id WeakRetained;
  JSManagedValue *v4;
  JSManagedValue *v5;
  BOOL v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  JSManagedValue *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v4 = self->_managedNavigationDocument;
  v5 = v4;
  if (WeakRetained)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __27__SUUIJSTabBarItem_dealloc__block_invoke;
    v9[3] = &unk_2511FA190;
    v10 = v5;
    v11 = WeakRetained;
    objc_msgSend(v7, "evaluate:completionBlock:", v9, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIJSTabBarItem;
  -[SUUIJSTabBarItem dealloc](&v8, sel_dealloc);
}

void __27__SUUIJSTabBarItem_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "virtualMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSString)badgeValue
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__47;
  v9 = __Block_byref_object_dispose__47;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__SUUIJSTabBarItem_badgeValue__block_invoke;
  v4[3] = &unk_2511F4720;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __30__SUUIJSTabBarItem_badgeValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "underlyingTabBarItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badgeValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)identifier
{
  return -[SUUITabBarItem tabIdentifier](self->_tabBarItem, "tabIdentifier");
}

- (IKJSNavigationDocument)navigationDocument
{
  return (IKJSNavigationDocument *)self->_navigationDocument;
}

- (NSString)rootURL
{
  void *v2;
  void *v3;

  -[SUUITabBarItem rootURL](self->_tabBarItem, "rootURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBadgeValue:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__SUUIJSTabBarItem_setBadgeValue___block_invoke;
  v6[3] = &unk_2511F46D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __34__SUUIJSTabBarItem_setBadgeValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "underlyingTabBarItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBadgeValue:", *(_QWORD *)(a1 + 40));

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[SUUITabBarItem underlyingTabBarItem](self->_tabBarItem, "underlyingTabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SUUITabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_navigationDocument, 0);
  objc_storeStrong((id *)&self->_managedNavigationDocument, 0);
}

@end

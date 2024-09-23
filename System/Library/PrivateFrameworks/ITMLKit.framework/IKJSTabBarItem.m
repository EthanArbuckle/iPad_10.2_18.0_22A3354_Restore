@implementation IKJSTabBarItem

- (id)asPrivateIKJSTabBarItem
{
  IKJSTabBarItem *v3;

  if (-[IKJSTabBarItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F6070))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSTabBarItem)initWithAppContext:(id)a3 identifier:(id)a4 navigationController:(id)a5 owner:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IKJSTabBarItem *v14;
  IKJSTabBarItem *v15;
  IKJSNavigationDocument *v16;
  IKJSNavigationDocument *navigationDocument;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  JSManagedValue *managedSelf;
  void *v23;
  JSManagedValue *managedNavigationDocument;
  id WeakRetained;
  void *v26;
  void *v27;
  uint64_t v28;
  JSManagedValue *v29;
  void *v30;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)IKJSTabBarItem;
  v14 = -[IKJSObject initWithAppContext:](&v32, sel_initWithAppContext_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_navigationControllerDelegate, v12);
    v16 = -[IKJSNavigationDocument initWithAppContext:navigationController:]([IKJSNavigationDocument alloc], "initWithAppContext:navigationController:", v10, v12);
    navigationDocument = v15->_navigationDocument;
    v15->_navigationDocument = v16;

    objc_storeStrong((id *)&v15->_identifier, a4);
    objc_storeWeak((id *)&v15->_owner, v13);
    objc_msgSend(v10, "jsContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CBE0F8];
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v15, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "managedValueWithValue:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    managedSelf = v15->_managedSelf;
    v15->_managedSelf = (JSManagedValue *)v21;

    objc_msgSend(v18, "virtualMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    managedNavigationDocument = v15->_managedNavigationDocument;
    WeakRetained = objc_loadWeakRetained((id *)&v15->_owner);
    objc_msgSend(v23, "addManagedReference:withOwner:", managedNavigationDocument, WeakRetained);

    v26 = (void *)MEMORY[0x1E0CBE0F8];
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v15->_navigationDocument, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "managedValueWithValue:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v15->_managedNavigationDocument;
    v15->_managedNavigationDocument = (JSManagedValue *)v28;

    objc_msgSend(v18, "virtualMachine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addManagedReference:withOwner:", v15->_managedNavigationDocument, v15);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "virtualMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSTabBarItem managedNavigationDocument](self, "managedNavigationDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeManagedReference:withOwner:", v6, self);

  -[IKJSTabBarItem managedSelf](self, "managedSelf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSTabBarItem owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeManagedReference:withOwner:", v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)IKJSTabBarItem;
  -[IKJSTabBarItem dealloc](&v9, sel_dealloc);
}

- (IKAppNavigationController)navigationControllerDelegate
{
  return (IKAppNavigationController *)objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKJSNavigationDocument)navigationDocument
{
  return self->_navigationDocument;
}

- (JSManagedValue)managedNavigationDocument
{
  return self->_managedNavigationDocument;
}

- (void)setManagedNavigationDocument:(id)a3
{
  objc_storeStrong((id *)&self->_managedNavigationDocument, a3);
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (void)setManagedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_managedSelf, a3);
}

- (IKJSTabBar)owner
{
  return (IKJSTabBar *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_managedNavigationDocument, 0);
  objc_storeStrong((id *)&self->_navigationDocument, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
}

@end

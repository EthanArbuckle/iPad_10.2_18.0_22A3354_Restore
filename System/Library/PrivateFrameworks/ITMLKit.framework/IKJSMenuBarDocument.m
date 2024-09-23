@implementation IKJSMenuBarDocument

- (id)getDocument:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  -[IKJSMenuBarDocument _entityUniqueIdentifierForObject:](self, "_entityUniqueIdentifierForObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  objc_msgSend(WeakRetained, "jsMenuBarDocument:documentForEntityUniqueIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "jsDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  void *v10;
  IKAppDocument *v11;
  void *v12;
  id WeakRetained;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = a3;
  -[IKJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IKAppDocument initWithAppContext:document:owner:]([IKAppDocument alloc], "initWithAppContext:document:owner:", v10, v9, self);

  if (v11)
  {
    -[IKJSMenuBarDocument _entityUniqueIdentifierForObject:](self, "_entityUniqueIdentifierForObject:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
    objc_msgSend(WeakRetained, "jsMenuBarDocument:setDocument:forEntityUniqueIdentifier:withOptions:", self, v11, v12, v8);

  }
}

- (id)getSelectedItem
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  objc_msgSend(WeakRetained, "selectedItemForJsMenuBarDocument:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSelectedItem:(id)a3 :(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a4;
  -[IKJSMenuBarDocument _entityUniqueIdentifierForObject:](self, "_entityUniqueIdentifierForObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  objc_msgSend(WeakRetained, "jsMenuBarDocument:setSelectedEntityUniqueIdentifier:withOptions:", self, v8, v6);

}

- (id)_entityUniqueIdentifierForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "getAttribute:", CFSTR("itmlID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "entityValueProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entityUniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (IKJSMenuBarDocumentAppBridge)appBridge
{
  return (IKJSMenuBarDocumentAppBridge *)objc_loadWeakRetained((id *)&self->_appBridge);
}

- (void)setAppBridge:(id)a3
{
  objc_storeWeak((id *)&self->_appBridge, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appBridge);
}

@end

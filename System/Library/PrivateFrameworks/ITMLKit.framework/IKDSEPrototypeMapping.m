@implementation IKDSEPrototypeMapping

+ (id)prototypeMappingFromAppPrototype:(id)a3 dataSourceElement:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "dsepm_viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "updateType");
  if (!v11 || v12 == 4)
  {
    objc_msgSend(v8, "prototype");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "domElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "prototype");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "grouping");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "jsContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "cloneNode:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setAliasOf:", v14);
      v20 = (void *)MEMORY[0x1E0CBE108];
      objc_msgSend(v8, "groupingValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueWithObject:inContext:", v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDataItem:", v22);

      v14 = v19;
    }
    objc_msgSend(v10, "elementForDOMElement:parent:", v14, v9);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dsepm_setViewElement:", v23);
    v11 = (void *)v23;
  }
  v24 = objc_alloc((Class)a1);
  objc_msgSend(v8, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "usageIndexes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithIdentifier:viewElement:usageIndexes:", v25, v11, v26);

  return v27;
}

- (IKDSEPrototypeMapping)initWithIdentifier:(id)a3 viewElement:(id)a4 usageIndexes:(id)a5
{
  id v9;
  id v10;
  id v11;
  IKDSEPrototypeMapping *v12;
  IKDSEPrototypeMapping *v13;
  uint64_t v14;
  NSIndexSet *usageIndexes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IKDSEPrototypeMapping;
  v12 = -[IKDSEPrototypeMapping init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_viewElement, a4);
    v14 = objc_msgSend(v11, "copy");
    usageIndexes = v13->_usageIndexes;
    v13->_usageIndexes = (NSIndexSet *)v14;

  }
  return v13;
}

- (IKAppPrototypeIdentifier)identifier
{
  return self->_identifier;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (NSIndexSet)usageIndexes
{
  return self->_usageIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageIndexes, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

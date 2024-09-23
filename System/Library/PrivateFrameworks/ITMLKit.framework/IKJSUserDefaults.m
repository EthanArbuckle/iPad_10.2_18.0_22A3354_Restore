@implementation IKJSUserDefaults

- (IKJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4
{
  id v6;
  IKJSUserDefaults *v7;
  IKJSUserDefaults *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IKJSUserDefaults;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_userDefaultsStorage, v6);

  return v8;
}

- (id)getData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = (void *)MEMORY[0x1E0CBE108];
  v5 = a3;
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithNullInContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CBE108];
    -[IKJSObject appContext](self, "appContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jsContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueWithObject:inContext:", v10, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }

  return v8;
}

- (void)setData:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isNull"))
  {
    -[IKJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeDataForKey:", v9);
LABEL_16:

    goto LABEL_17;
  }
  if ((objc_msgSend(v6, "isString") & 1) != 0
    || (objc_msgSend(v6, "isNumber") & 1) != 0
    || objc_msgSend(v6, "isBoolean"))
  {
    if (objc_msgSend(v6, "isString"))
    {
      objc_msgSend(v6, "toString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v6, "isBoolean") && !v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "toBool"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v6, "isNumber") && !v7)
    {
      objc_msgSend(v6, "toNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[IKJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:forKey:", v7, v9);

    goto LABEL_16;
  }
LABEL_17:

}

- (void)removeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDataForKey:", v4);

}

- (IKAppUserDefaultsStoring)userDefaultsStorage
{
  return (IKAppUserDefaultsStoring *)objc_loadWeakRetained((id *)&self->_userDefaultsStorage);
}

- (void)setUserDefaultsStorage:(id)a3
{
  objc_storeWeak((id *)&self->_userDefaultsStorage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userDefaultsStorage);
}

@end

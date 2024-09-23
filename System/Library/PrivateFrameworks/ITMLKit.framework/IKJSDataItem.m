@implementation IKJSDataItem

- (id)asPrivateIKJSDataItem
{
  IKJSDataItem *v3;

  if (-[IKJSDataItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F8060))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSDataItem)initWithType:(id)a3
{
  return -[IKJSDataItem initWithType:identifier:](self, "initWithType:identifier:", a3, 0);
}

- (IKJSDataItem)initWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IKJSDataItem *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CBE108];
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithObject:inContext:", MEMORY[0x1E0C9AA70], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)IKJSDataItem;
  v12 = -[IKJSDataObservable initWithTargetValue:](&v15, sel_initWithTargetValue_, v11);

  if (v12)
  {
    v13 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_type, v13);
    if (!v6)

    objc_storeStrong((id *)&v12->_identifier, a4);
  }

  return v12;
}

- (IKJSDataItem)initWithValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKJSDataItem;
  return -[IKJSDataObservable initWithTargetValue:](&v4, sel_initWithTargetValue_, a3);
}

- (IKJSDataItem)init
{
  IKJSDataItem *v2;
  uint64_t v3;
  NSString *type;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKJSDataItem;
  v2 = -[IKJSDataObservable init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v3 = objc_claimAutoreleasedReturnValue();
    type = v2->_type;
    v2->_type = (NSString *)v3;

  }
  return v2;
}

- (NSDictionary)dataDictionary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKJSDataItem;
  -[IKJSDataObservable dataDictionaryObject](&v3, sel_dataDictionaryObject);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)makeDataItem:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isNull") & 1) != 0
    || (objc_msgSend(v6, "isUndefined") & 1) != 0
    || objc_msgSend(v6, "isString"))
  {
    v8 = v6;
    v9 = v7;
    v10 = objc_alloc((Class)a1);
    v11 = objc_msgSend(v8, "isString");
    if (v11)
    {
      objc_msgSend(v8, "toString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    if ((objc_msgSend(v9, "isString") & 1) != 0)
    {
      objc_msgSend(v9, "toString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v10, "initWithType:identifier:", v12, v13);

      if (!v11)
        goto LABEL_12;
    }
    else
    {
      v14 = (void *)objc_msgSend(v10, "initWithType:identifier:", v12, 0);
      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }

    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "ikdt_isObject") || (objc_msgSend(v6, "ikdt_isArray") & 1) != 0)
  {
    +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setException:withErrorMessage:", 0, CFSTR("DataItem: Invalid args; construct with type and identifier, or an object (not array)"));

    goto LABEL_18;
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", v6);
LABEL_13:

  if (!v14)
  {
LABEL_18:
    v17 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueWithNullInContext:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v14, "exportValue");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v18 = (void *)v15;

  return v18;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)prototypeIdentifier
{
  return self->_prototypeIdentifier;
}

- (void)setPrototypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end

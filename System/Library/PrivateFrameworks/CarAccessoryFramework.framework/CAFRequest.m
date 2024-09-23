@implementation CAFRequest

+ (id)requestWithCharacteristic:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacteristic:", v4);

  return v5;
}

- (CAFRequest)initWithCharacteristic:(id)a3
{
  id v5;
  CAFRequest *v6;
  CAFRequest *v7;
  CAFCachedDescription *v8;
  CAFCachedDescription *cachedDescription;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFRequest;
  v6 = -[CAFRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristic, a3);
    v8 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v7);
    cachedDescription = v7->_cachedDescription;
    v7->_cachedDescription = v8;

  }
  return v7;
}

+ (id)requestWithControl:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithControl:", v4);

  return v5;
}

- (CAFRequest)initWithControl:(id)a3
{
  id v5;
  CAFRequest *v6;
  CAFRequest *v7;
  CAFCachedDescription *v8;
  CAFCachedDescription *cachedDescription;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFRequest;
  v6 = -[CAFRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_control, a3);
    v8 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v7);
    cachedDescription = v7->_cachedDescription;
    v7->_cachedDescription = v8;

  }
  return v7;
}

- (CAFRequestKey)requestKey
{
  void *v3;
  void *v4;
  void *v5;

  -[CAFRequest characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAFRequest characteristic](self, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFRequestKey requestKeyForCharacteristic:](CAFRequestKey, "requestKeyForCharacteristic:", v4);
  }
  else
  {
    -[CAFRequest control](self, "control");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFRequestKey requestKeyForControl:](CAFRequestKey, "requestKeyForControl:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFRequestKey *)v5;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFRequest cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[CAFRequest characteristic](self, "characteristic", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = objc_opt_class();
    -[CAFRequest characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "priority");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFRequest characteristic](self, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFRequest characteristic](self, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p priority=%@ plugin=%@ instanceID=%@>"), v6, self, v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAFRequest control](self, "control");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = objc_opt_class();
    v17 = v16;
    if (!v14)
    {
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p unknown request>"), v16, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      return v13;
    }
    -[CAFRequest control](self, "control");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "priority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFRequest control](self, "control");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pluginID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFRequest control](self, "control");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "instanceID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p priority=%@ plugin=%@ instanceID=%@>"), v17, self, v18, v20, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (CAFCharacteristic)characteristic
{
  return self->_characteristic;
}

- (CAFControl)control
{
  return self->_control;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end

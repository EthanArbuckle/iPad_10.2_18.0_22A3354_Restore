@implementation CAFRequestKey

+ (id)requestKeyForCharacteristic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "priority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithPriority:pluginID:", v6, v7);
  return v8;
}

+ (id)requestKeyForControl:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "priority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithPriority:pluginID:", v6, v7);
  return v8;
}

- (CAFRequestKey)initWithPriority:(id)a3 pluginID:(id)a4
{
  id v7;
  id v8;
  CAFRequestKey *v9;
  CAFRequestKey *v10;
  CAFCachedDescription *v11;
  CAFCachedDescription *cachedDescription;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CAFRequestKey;
  v9 = -[CAFRequestKey init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_priority, a3);
    objc_storeStrong((id *)&v10->_pluginID, a4);
    v11 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v10);
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v11;

  }
  return v10;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFRequestKey cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CAFRequestKey priority](self, "priority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFRequestKey pluginID](self, "pluginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p priority: %@ plugin=%@ >"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CAFRequestKey priority](self, "priority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFRequestKey pluginID](self, "pluginID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithPriority:pluginID:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CAFRequestKey *v4;
  CAFRequestKey *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = (CAFRequestKey *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CAFRequestKey priority](self, "priority");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFRequestKey priority](v5, "priority");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6 != v7)
        {
          v8 = 0;
LABEL_11:

          goto LABEL_12;
        }
        -[CAFRequestKey pluginID](self, "pluginID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFRequestKey pluginID](v5, "pluginID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v8 = 0;
        v9 = v5;
        v5 = 0;
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }

    goto LABEL_11;
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CAFRequestKey pluginID](self, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_storeStrong((id *)&self->_priority, 0);
}

@end

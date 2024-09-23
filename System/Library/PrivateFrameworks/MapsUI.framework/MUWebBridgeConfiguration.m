@implementation MUWebBridgeConfiguration

- (MUWebBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4 bridgeVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MUWebBridgeConfiguration *v11;
  uint64_t v12;
  NSString *bridgeVersion;
  uint64_t v14;
  NSString *nativeControllerName;
  uint64_t v16;
  NSString *webControllerName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MUWebBridgeConfiguration;
  v11 = -[MUWebBridgeConfiguration init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    bridgeVersion = v11->_bridgeVersion;
    v11->_bridgeVersion = (NSString *)v12;

    v14 = objc_msgSend(v8, "copy");
    nativeControllerName = v11->_nativeControllerName;
    v11->_nativeControllerName = (NSString *)v14;

    v16 = objc_msgSend(v9, "copy");
    webControllerName = v11->_webControllerName;
    v11->_webControllerName = (NSString *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithNativeControllerName:webControllerName:bridgeVersion:", self->_nativeControllerName, self->_webControllerName, self->_bridgeVersion);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MUWebBridgeConfiguration nativeControllerName](self, "nativeControllerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MUWebBridgeConfiguration webControllerName](self, "webControllerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[MUWebBridgeConfiguration bridgeVersion](self, "bridgeVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MUWebBridgeConfiguration *v4;
  MUWebBridgeConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (MUWebBridgeConfiguration *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MUWebBridgeConfiguration nativeControllerName](v5, "nativeControllerName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebBridgeConfiguration nativeControllerName](self, "nativeControllerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[MUWebBridgeConfiguration webControllerName](v5, "webControllerName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUWebBridgeConfiguration webControllerName](self, "webControllerName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[MUWebBridgeConfiguration bridgeVersion](v5, "bridgeVersion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUWebBridgeConfiguration bridgeVersion](self, "bridgeVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)bridgeVersion
{
  return self->_bridgeVersion;
}

- (NSString)nativeControllerName
{
  return self->_nativeControllerName;
}

- (NSString)webControllerName
{
  return self->_webControllerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webControllerName, 0);
  objc_storeStrong((id *)&self->_nativeControllerName, 0);
  objc_storeStrong((id *)&self->_bridgeVersion, 0);
}

@end

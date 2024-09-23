@implementation MUWebPlacecardBridgeConfiguration

- (MUWebPlacecardBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4
{
  id v6;
  id v7;
  MUWebPlacecardBridgeConfiguration *v8;
  uint64_t v9;
  NSString *nativeControllerName;
  uint64_t v11;
  NSString *webControllerName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUWebPlacecardBridgeConfiguration;
  v8 = -[MUWebPlacecardBridgeConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    nativeControllerName = v8->_nativeControllerName;
    v8->_nativeControllerName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    webControllerName = v8->_webControllerName;
    v8->_webControllerName = (NSString *)v11;

  }
  return v8;
}

- (NSString)webBundleEntryPoint
{
  return (NSString *)CFSTR("dist/index.html");
}

- (NSString)manifestSignedResourceName
{
  return (NSString *)CFSTR("placecard.cms");
}

- (NSString)manifestFileDirectory
{
  return (NSString *)CFSTR("dist/manifest.json");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithNativeControllerName:webControllerName:", self->_nativeControllerName, self->_webControllerName);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MUWebPlacecardBridgeConfiguration nativeControllerName](self, "nativeControllerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MUWebPlacecardBridgeConfiguration webControllerName](self, "webControllerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MUWebPlacecardBridgeConfiguration *v4;
  MUWebPlacecardBridgeConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MUWebPlacecardBridgeConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    -[MUWebPlacecardBridgeConfiguration nativeControllerName](v4, "nativeControllerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebPlacecardBridgeConfiguration nativeControllerName](self, "nativeControllerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[MUWebPlacecardBridgeConfiguration webControllerName](v5, "webControllerName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebPlacecardBridgeConfiguration webControllerName](self, "webControllerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
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
}

@end

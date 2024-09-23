@implementation GCConfigurationAssetXPCProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCConfigurationAssetXPCProxy)initWithAsset:(id)a3
{
  id v5;
  GCConfigurationAssetXPCProxy *v6;
  void *v7;
  uint64_t v8;
  NSString *assetId;
  void *v10;
  uint64_t v11;
  NSString *assetState;
  void *v13;
  uint64_t v14;
  GCVersion *compatibilityVersion;
  uint64_t v16;
  GCVersion *contentVersion;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCConfigurationAssetManagementServiceXPCProxy.m"), 37, CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");

  }
  v20.receiver = self;
  v20.super_class = (Class)GCConfigurationAssetXPCProxy;
  v6 = -[GCConfigurationAssetXPCProxy init](&v20, sel_init);
  objc_msgSend(v5, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  assetId = v6->_assetId;
  v6->_assetId = (NSString *)v8;

  objc_msgSend(v5, "assetState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  assetState = v6->_assetState;
  v6->_assetState = (NSString *)v11;

  objc_msgSend(v5, "compatibilityVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  compatibilityVersion = v6->_compatibilityVersion;
  v6->_compatibilityVersion = (GCVersion *)v14;

  objc_msgSend(v5, "contentVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  contentVersion = v6->_contentVersion;
  v6->_contentVersion = (GCVersion *)v16;

  v6->_contentRevision = objc_msgSend(v5, "contentRevision");
  return v6;
}

- (GCConfigurationAssetXPCProxy)init
{
  -[GCConfigurationAssetXPCProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCConfigurationAssetXPCProxy)initWithCoder:(id)a3
{
  id v3;
  GCConfigurationAssetXPCProxy *v4;
  uint64_t v5;
  NSString *assetId;
  uint64_t v7;
  NSString *assetState;
  uint64_t v9;
  GCVersion *compatibilityVersion;
  uint64_t v11;
  GCVersion *contentVersion;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GCConfigurationAssetXPCProxy;
  v3 = a3;
  v4 = -[GCConfigurationAssetXPCProxy init](&v15, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetId"), v15.receiver, v15.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  assetId = v4->_assetId;
  v4->_assetId = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetState"));
  v7 = objc_claimAutoreleasedReturnValue();
  assetState = v4->_assetState;
  v4->_assetState = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compatibilityVersion"));
  v9 = objc_claimAutoreleasedReturnValue();
  compatibilityVersion = v4->_compatibilityVersion;
  v4->_compatibilityVersion = (GCVersion *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentVersion"));
  v11 = objc_claimAutoreleasedReturnValue();
  contentVersion = v4->_contentVersion;
  v4->_contentVersion = (GCVersion *)v11;

  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("contentRevision"));
  v4->_contentRevision = v13;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[GCConfigurationAssetXPCProxy assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("assetId"));

  -[GCConfigurationAssetXPCProxy assetState](self, "assetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("assetState"));

  -[GCConfigurationAssetXPCProxy compatibilityVersion](self, "compatibilityVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("compatibilityVersion"));

  -[GCConfigurationAssetXPCProxy contentVersion](self, "contentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("contentVersion"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[GCConfigurationAssetXPCProxy contentRevision](self, "contentRevision"), CFSTR("contentRevision"));
}

- (NSString)assetId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)assetState
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 24, 1);
}

- (GCVersion)contentVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)contentRevision
{
  return self->_contentRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_assetState, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end

@implementation CRSUIClusterThemeCAPackageAsset

- (CRSUIClusterThemeCAPackageAsset)initWithIdentifier:(id)a3 url:(id)a4 packageType:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRSUIClusterThemeCAPackageAsset *v12;
  CRSUIClusterThemeCAPackageAsset *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRSUIClusterThemeCAPackageAsset;
  v12 = -[CRSUIClusterThemeCAPackageAsset init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_packageType, a5);
  }

  return v13;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRSUIClusterThemeCAPackageAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CRSUIClusterThemeCAPackageAsset url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

  -[CRSUIClusterThemeCAPackageAsset packageType](self, "packageType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("packageType"));

}

- (CRSUIClusterThemeCAPackageAsset)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  CRSUIClusterThemeCAPackageAsset *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("packageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[CRSUIClusterThemeCAPackageAsset initWithIdentifier:url:packageType:](self, "initWithIdentifier:url:packageType:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSecurityScopedURLWrapper)url
{
  return self->_url;
}

- (NSString)packageType
{
  return self->_packageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageType, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

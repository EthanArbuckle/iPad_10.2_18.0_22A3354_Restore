@implementation CRSUIClusterThemeImageAsset

- (CRSUIClusterThemeImageAsset)initWithIdentifier:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  CRSUIClusterThemeImageAsset *v9;
  CRSUIClusterThemeImageAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRSUIClusterThemeImageAsset;
  v9 = -[CRSUIClusterThemeImageAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_url, a4);
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRSUIClusterThemeImageAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CRSUIClusterThemeImageAsset url](self, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

}

- (CRSUIClusterThemeImageAsset)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  CRSUIClusterThemeImageAsset *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[CRSUIClusterThemeImageAsset initWithIdentifier:url:](self, "initWithIdentifier:url:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSecurityScopedURLWrapper)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

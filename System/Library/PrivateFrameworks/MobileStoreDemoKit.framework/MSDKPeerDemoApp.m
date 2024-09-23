@implementation MSDKPeerDemoApp

- (MSDKPeerDemoApp)initWithIdentifier:(id)a3 andLocalizedName:(id)a4
{
  id v6;
  id v7;
  MSDKPeerDemoApp *v8;
  MSDKPeerDemoApp *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoApp;
  v8 = -[MSDKPeerDemoApp init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDKPeerDemoApp setIdentifier:](v8, "setIdentifier:", v6);
    -[MSDKPeerDemoApp setLocalizedName:](v9, "setLocalizedName:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoApp identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoApp localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: ID=%@ Name=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoApp)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoApp *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDKPeerDemoApp;
  v5 = -[MSDKPeerDemoApp init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoApp setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoApp setLocalizedName:](v5, "setLocalizedName:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MSDKPeerDemoApp identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[MSDKPeerDemoApp localizedName](self, "localizedName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedName"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

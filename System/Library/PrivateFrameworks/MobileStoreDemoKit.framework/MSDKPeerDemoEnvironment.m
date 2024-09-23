@implementation MSDKPeerDemoEnvironment

- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 displayName:(id)a4 immersionLevel:(float)a5
{
  id v8;
  id v9;
  MSDKPeerDemoEnvironment *v10;
  MSDKPeerDemoEnvironment *v11;
  double v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSDKPeerDemoEnvironment;
  v10 = -[MSDKPeerDemoEnvironment init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MSDKPeerDemoEnvironment setIdentifier:](v10, "setIdentifier:", v8);
    -[MSDKPeerDemoEnvironment setDisplayName:](v11, "setDisplayName:", v9);
    *(float *)&v12 = a5;
    -[MSDKPeerDemoEnvironment setImmersionLevel:](v11, "setImmersionLevel:", v12);
  }

  return v11;
}

- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 andDisplayName:(id)a4
{
  double v4;

  LODWORD(v4) = -1.0;
  return -[MSDKPeerDemoEnvironment initWithIdentifier:displayName:immersionLevel:](self, "initWithIdentifier:displayName:immersionLevel:", a3, a4, v4);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoEnvironment identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoEnvironment displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoEnvironment immersionLevel](self, "immersionLevel");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: ID=%@ Name=%@ Immersion=%f>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoEnvironment)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoEnvironment *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDKPeerDemoEnvironment;
  v5 = -[MSDKPeerDemoEnvironment init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoEnvironment setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoEnvironment setDisplayName:](v5, "setDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("immersionLevel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    -[MSDKPeerDemoEnvironment setImmersionLevel:](v5, "setImmersionLevel:");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MSDKPeerDemoEnvironment identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[MSDKPeerDemoEnvironment displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoEnvironment immersionLevel](self, "immersionLevel");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("immersionLevel"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (float)immersionLevel
{
  return self->_immersionLevel;
}

- (void)setImmersionLevel:(float)a3
{
  self->_immersionLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

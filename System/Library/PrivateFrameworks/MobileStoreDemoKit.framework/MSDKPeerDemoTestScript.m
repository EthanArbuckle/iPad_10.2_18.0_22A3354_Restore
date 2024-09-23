@implementation MSDKPeerDemoTestScript

- (MSDKPeerDemoTestScript)initWithName:(id)a3 andMethods:(id)a4
{
  id v6;
  id v7;
  MSDKPeerDemoTestScript *v8;
  MSDKPeerDemoTestScript *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoTestScript;
  v8 = -[MSDKPeerDemoTestScript init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDKPeerDemoTestScript setName:](v8, "setName:", v6);
    -[MSDKPeerDemoTestScript setMethods:](v9, "setMethods:", v7);
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
  -[MSDKPeerDemoTestScript name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoTestScript methods](self, "methods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: Name=%@ Methods=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoTestScript)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoTestScript *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDKPeerDemoTestScript;
  v5 = -[MSDKPeerDemoTestScript init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoTestScript setName:](v5, "setName:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("testMethods"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoTestScript setMethods:](v5, "setMethods:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MSDKPeerDemoTestScript name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[MSDKPeerDemoTestScript methods](self, "methods");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("testMethods"));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
  objc_storeStrong((id *)&self->_methods, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

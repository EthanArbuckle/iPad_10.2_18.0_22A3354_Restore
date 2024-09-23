@implementation FBKURLExtension

- (FBKURLExtension)initWithExtensionIdentifier:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  FBKURLExtension *v9;
  FBKURLExtension *v10;
  NSDictionary *v11;
  NSDictionary *parameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FBKURLExtension;
  v9 = -[FBKURLExtension init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionIdentifier, a3);
    if (v8)
      v11 = (NSDictionary *)v8;
    else
      v11 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    parameters = v10->_parameters;
    v10->_parameters = v11;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FBKURLExtension extensionIdentifier](self, "extensionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[FBKURLExtension extensionIdentifier](self, "extensionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIdentifier, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end

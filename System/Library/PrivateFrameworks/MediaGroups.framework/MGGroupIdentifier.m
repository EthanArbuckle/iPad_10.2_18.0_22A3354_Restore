@implementation MGGroupIdentifier

- (MGGroupIdentifier)initWithURLComponents:(id)a3
{
  id v4;
  MGGroupIdentifier *v5;
  uint64_t v6;
  NSURLComponents *components;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGGroupIdentifier;
  v5 = -[MGGroupIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (NSURLComponents *)v6;

  }
  return v5;
}

- (MGGroupIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MGGroupIdentifier *v6;
  MGGroupIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.MediaGroups.normalized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (MGGroupIdentifier *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v5);
    v7 = -[MGGroupIdentifier initWithURLComponents:](self, "initWithURLComponents:", v6);
    self = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)normalized
{
  void *v2;
  void *v3;
  void *v4;

  -[MGGroupIdentifier components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (MGGroupIdentifier)groupIdentifierWithUUID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDD1808];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setScheme:", CFSTR("mg-entity"));
  v7 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(v5, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("gi"), v8);
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryItems:", v10);

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURLComponents:", v6);
  return (MGGroupIdentifier *)v11;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroupIdentifier normalized](self, "normalized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)data
{
  void *v2;
  void *v3;

  -[MGGroupIdentifier normalized](self, "normalized");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[MGGroupIdentifier normalized](self, "normalized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MGGroupIdentifier normalized](self, "normalized");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MGGroupIdentifier *v4;
  MGGroupIdentifier *v5;
  void *v6;
  MGGroupIdentifier *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (MGGroupIdentifier *)a3;
  if (self == v4)
  {
    v11 = 1;
    v5 = self;
  }
  else
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v5);
      if (v6)
      {
        v7 = -[MGGroupIdentifier initWithURLComponents:]([MGGroupIdentifier alloc], "initWithURLComponents:", v6);

        v5 = v7;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MGGroupIdentifier components](self, "components");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MGGroupIdentifier components](v5, "components");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        MGGroupIdentifierCopyApplyingHashing(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MGGroupIdentifier components](self, "components");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "components");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0)
        {
          v11 = 1;
        }
        else
        {
          MGGroupIdentifierCopyApplyingHashing(self);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "components");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MGGroupIdentifier components](v5, "components");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v17, "isEqual:", v18);

          v12 = v16;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MGGroupIdentifier normalized](self, "normalized");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("com.apple.MediaGroups.normalized"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

@end

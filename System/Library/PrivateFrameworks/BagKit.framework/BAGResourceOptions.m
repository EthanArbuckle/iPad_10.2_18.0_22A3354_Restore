@implementation BAGResourceOptions

- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4
{
  return -[BAGResourceOptions initWithName:type:additionalOptions:](self, "initWithName:type:additionalOptions:", a3, a4, 0);
}

- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4 additionalOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BAGResourceOptions *v11;

  v8 = a5;
  v9 = a3;
  CUTGetMainBundleIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BAGResourceOptions initWithBundleID:name:type:additionalOptions:](self, "initWithBundleID:name:type:additionalOptions:", v10, v9, a4, v8);

  return v11;
}

- (BAGResourceOptions)initWithBundleID:(id)a3 name:(id)a4 type:(unint64_t)a5 additionalOptions:(id)a6
{
  id v12;
  id v13;
  id v14;
  BAGResourceOptions *v15;
  BAGResourceOptions *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceOptions.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceOptions.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  if (!BAGIsValidResourceType(a5))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceOptions.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidResourceType(type)"));

  }
  v21.receiver = self;
  v21.super_class = (Class)BAGResourceOptions;
  v15 = -[BAGResourceOptions init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    v16->_type = a5;
    objc_storeStrong((id *)&v16->_additionalOptions, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGResourceOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BAGResourceOptions *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("additionalOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[BAGResourceOptions initWithBundleID:name:type:additionalOptions:](self, "initWithBundleID:name:type:additionalOptions:", v5, v6, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BAGResourceOptions bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  -[BAGResourceOptions name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BAGResourceOptions type](self, "type"), CFSTR("type"));
  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("additionalOptions"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[BAGResourceOptions bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BAGResourceOptions name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[BAGResourceOptions type](self, "type");
  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;

  v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v16 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  -[BAGResourceOptions bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  -[BAGResourceOptions name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v5, "additionalOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v15 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToDictionary:", v14);

  if (!v12)
    goto LABEL_9;
LABEL_10:

  v17 = -[BAGResourceOptions type](self, "type");
  v18 = objc_msgSend(v5, "type");
  if ((v8 & v11) == 1)
  {
    if (v17 == v18)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }

LABEL_16:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[BAGResourceOptions bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGResourceOptions name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BAGResourceOptions type](self, "type");
  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithBundleID:name:type:additionalOptions:", v5, v6, v7, v8);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BAGResourceOptions bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGResourceOptions name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BAGResourceTypeToString(-[BAGResourceOptions type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGResourceOptions additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p bundleID: %@, name: %@, type: %@ additionalOptions: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

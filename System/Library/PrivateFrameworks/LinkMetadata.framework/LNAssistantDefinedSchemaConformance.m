@implementation LNAssistantDefinedSchemaConformance

- (LNAssistantDefinedSchemaConformance)initWithName:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNAssistantDefinedSchemaConformance *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *version;
  LNAssistantDefinedSchemaConformance *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantDefinedSchemaConformance.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantDefinedSchemaConformance.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAssistantDefinedSchemaConformance;
  v10 = -[LNAssistantDefinedSchemaConformance init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    version = v10->_version;
    v10->_version = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantDefinedSchemaConformance name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantDefinedSchemaConformance version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@, version: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNAssistantDefinedSchemaConformance *v4;
  LNAssistantDefinedSchemaConformance *v5;
  LNAssistantDefinedSchemaConformance *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNAssistantDefinedSchemaConformance *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNAssistantDefinedSchemaConformance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantDefinedSchemaConformance name](v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNAssistantDefinedSchemaConformance version](self, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantDefinedSchemaConformance version](v6, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNAssistantDefinedSchemaConformance)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNAssistantDefinedSchemaConformance *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
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
    self = -[LNAssistantDefinedSchemaConformance initWithName:version:](self, "initWithName:version:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNAssistantDefinedSchemaConformance name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[LNAssistantDefinedSchemaConformance version](self, "version");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

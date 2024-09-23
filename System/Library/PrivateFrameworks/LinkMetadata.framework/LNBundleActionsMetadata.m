@implementation LNBundleActionsMetadata

- (LNBundleActionsMetadata)initWithActions:(id)a3 systemProtocolDefaults:(id)a4
{
  id v8;
  id v9;
  void *v10;
  LNBundleActionsMetadata *v11;
  LNBundleActionsMetadata *v12;
  LNBundleActionsMetadata *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBundleActionsMetadata.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBundleActionsMetadata.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemProtocolDefaults"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNBundleActionsMetadata;
  v11 = -[LNBundleActionsMetadata init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actions, a3);
    objc_storeStrong((id *)&v12->_systemProtocolDefaults, a4);
    v13 = v12;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LNBundleActionsMetadata *v4;
  void *v5;
  void *v6;
  LNBundleActionsMetadata *v7;

  v4 = [LNBundleActionsMetadata alloc];
  -[LNBundleActionsMetadata actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleActionsMetadata systemProtocolDefaults](self, "systemProtocolDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNBundleActionsMetadata initWithActions:systemProtocolDefaults:](v4, "initWithActions:systemProtocolDefaults:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNBundleActionsMetadata actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

  -[LNBundleActionsMetadata systemProtocolDefaults](self, "systemProtocolDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemProtocolDefaults"));

}

- (LNBundleActionsMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  LNBundleActionsMetadata *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("systemProtocolDefaults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v9 && v14)
  {
    self = -[LNBundleActionsMetadata initWithActions:systemProtocolDefaults:](self, "initWithActions:systemProtocolDefaults:", v9, v14);
    v15 = self;
  }

  return v15;
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
  -[LNBundleActionsMetadata actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleActionsMetadata systemProtocolDefaults](self, "systemProtocolDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, actions: %@, systemProtocolDefaults: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNBundleActionsMetadata actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNBundleActionsMetadata systemProtocolDefaults](self, "systemProtocolDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNBundleActionsMetadata *v4;
  LNBundleActionsMetadata *v5;
  LNBundleActionsMetadata *v6;
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

  v4 = (LNBundleActionsMetadata *)a3;
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
    -[LNBundleActionsMetadata actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleActionsMetadata actions](v6, "actions");
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
      v12 = objc_msgSend(v9, "isEqualToDictionary:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNBundleActionsMetadata systemProtocolDefaults](self, "systemProtocolDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleActionsMetadata systemProtocolDefaults](v6, "systemProtocolDefaults");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToDictionary:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (NSDictionary)systemProtocolDefaults
{
  return self->_systemProtocolDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemProtocolDefaults, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

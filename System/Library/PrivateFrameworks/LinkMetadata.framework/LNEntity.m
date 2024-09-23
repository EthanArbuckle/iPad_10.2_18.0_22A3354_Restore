@implementation LNEntity

- (BOOL)isEqual:(id)a3
{
  LNEntity *v4;
  LNEntity *v5;
  LNEntity *v6;
  _BOOL4 v7;
  char v8;
  LNEntity *v9;
  void *v10;
  void *v11;
  LNEntity *v12;
  LNEntity *v13;
  LNEntity *v14;
  char v15;
  void *v16;
  void *v17;
  LNEntity *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  LNEntity *v22;
  LNEntity *v23;
  char v24;
  LNEntity *v25;
  void *v26;
  void *v27;
  LNEntity *v28;
  int v29;
  void *v30;
  void *v31;
  LNEntity *v32;
  LNEntity *v33;

  v4 = (LNEntity *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNEntity isTransient](self, "isTransient");
        if (v7 != -[LNEntity isTransient](v6, "isTransient"))
        {
LABEL_5:
          v8 = 0;
LABEL_46:

          goto LABEL_47;
        }
        if (-[LNEntity isTransient](self, "isTransient"))
        {
          -[LNEntity properties](self, "properties");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntity properties](v6, "properties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10;
          v13 = v11;
          if (v12 != v13)
          {
            v14 = v13;
            v8 = 0;
            if (!v12 || !v13)
            {
              v9 = v12;
              v25 = v13;
LABEL_43:

              v14 = v25;
              v9 = v12;
              goto LABEL_44;
            }
            v15 = -[LNEntity isEqualToArray:](v12, "isEqualToArray:", v13);

            if ((v15 & 1) == 0)
              goto LABEL_5;
            goto LABEL_30;
          }
          v14 = v12;
          v9 = v12;
        }
        else
        {
          -[LNEntity identifier](self, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntity identifier](v6, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v16;
          v18 = v17;
          v14 = v18;
          if (v9 == v18)
          {

          }
          else
          {
            v8 = 0;
            if (!v9 || !v18)
            {
LABEL_35:
              v25 = v14;
              v12 = v9;
              goto LABEL_43;
            }
            v19 = -[LNEntity isEqual:](v9, "isEqual:", v18);

            if (!v19)
              goto LABEL_34;
          }
          -[LNEntity properties](self, "properties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntity properties](v6, "properties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v20;
          v22 = v21;
          if (v12 != v22)
          {
            v23 = v22;
            v8 = 0;
            if (!v12 || !v22)
            {
LABEL_42:
              v33 = v9;
              v25 = v14;

              v14 = v23;
              v9 = v12;
              v12 = v33;
              goto LABEL_43;
            }
            v24 = -[LNEntity isEqualToArray:](v12, "isEqualToArray:", v22);

            if ((v24 & 1) == 0)
              goto LABEL_5;
            goto LABEL_30;
          }

        }
LABEL_30:
        -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNEntity managedAccountIdentifier](v6, "managedAccountIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v26;
        v28 = v27;
        v14 = v28;
        if (v9 == v28)
        {

LABEL_37:
          -[LNEntity prototypeMangledTypeName](self, "prototypeMangledTypeName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntity prototypeMangledTypeName](v6, "prototypeMangledTypeName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v30;
          v32 = v31;
          if (v12 == v32)
          {
            v8 = 1;
            v23 = v12;
          }
          else
          {
            v23 = v32;
            v8 = 0;
            if (v12 && v32)
              v8 = -[LNEntity isEqualToString:](v12, "isEqualToString:", v32);
          }
          goto LABEL_42;
        }
        v8 = 0;
        if (v9 && v28)
        {
          v29 = -[LNEntity isEqualToString:](v9, "isEqualToString:", v28);

          if (!v29)
          {
LABEL_34:
            v8 = 0;
LABEL_44:

            goto LABEL_45;
          }
          goto LABEL_37;
        }
        goto LABEL_35;
      }
      v8 = 0;
      v9 = v6;
      v6 = 0;
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
LABEL_45:

    goto LABEL_46;
  }
  v8 = 1;
LABEL_47:

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  if (-[LNEntity isTransient](self, "isTransient"))
  {
    -[LNEntity properties](self, "properties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[LNEntity identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hash");
    -[LNEntity properties](self, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "hash") ^ v5;

  }
  v7 = -[LNEntity isTransient](self, "isTransient");
  -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4 ^ objc_msgSend(v8, "hash");
  -[LNEntity prototypeMangledTypeName](self, "prototypeMangledTypeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ v7 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (LNEntityIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)managedAccountIdentifier
{
  return self->_managedAccountIdentifier;
}

- (NSString)prototypeMangledTypeName
{
  return self->_prototypeMangledTypeName;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeMangledTypeName, 0);
  objc_storeStrong((id *)&self->_managedAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  LNEntity *v14;
  uint64_t v15;
  NSString *prototypeMangledTypeName;
  LNEntity *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("properties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v17 = 0;
  }
  else
  {
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transient"));
    v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("persistentFileIdentifiable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managedAccountIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[LNEntity initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:", v11, v5, v12, v9, v13);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prototypeMangledTypeName"));
    v15 = objc_claimAutoreleasedReturnValue();
    prototypeMangledTypeName = v14->_prototypeMangledTypeName;
    v14->_prototypeMangledTypeName = (NSString *)v15;

    self = v14;
    v17 = self;
  }

  return v17;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 managedAccountIdentifier:(id)a6
{
  return -[LNEntity initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:", a3, a4, 0, a5, a6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isTransient](self, "isTransient"), CFSTR("transient"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isPersistentFileIdentifiable](self, "isPersistentFileIdentifiable"), CFSTR("persistentFileIdentifiable"));
  -[LNEntity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNEntity properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("properties"));

  -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("managedAccountIdentifier"));

  -[LNEntity prototypeMangledTypeName](self, "prototypeMangledTypeName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("prototypeMangledTypeName"));

}

- (LNEntity)initWithIdentifier:(id)a3
{
  return -[LNEntity initWithTransient:identifier:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:properties:managedAccountIdentifier:", 0, a3, MEMORY[0x1E0C9AA60], 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 persistentFileIdentifiable:(BOOL)a5 properties:(id)a6 managedAccountIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  LNEntity *v15;
  LNEntity *v16;
  uint64_t v17;
  LNEntityIdentifier *identifier;
  uint64_t v19;
  NSArray *properties;
  LNEntity *v21;
  objc_super v23;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)LNEntity;
  v15 = -[LNEntity init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_transient = a3;
    v15->_persistentFileIdentifiable = a5;
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (LNEntityIdentifier *)v17;

    v19 = objc_msgSend(v13, "copy");
    properties = v16->_properties;
    v16->_properties = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_managedAccountIdentifier, a7);
    v21 = v16;
  }

  return v16;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 prototypeMangledTypeName:(id)a6 managedAccountIdentifier:(id)a7
{
  _BOOL8 v10;
  id v12;
  LNEntity *v13;
  uint64_t v14;
  NSString *prototypeMangledTypeName;
  LNEntity *v16;

  v10 = a3;
  v12 = a6;
  v13 = -[LNEntity initWithTransient:identifier:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:properties:managedAccountIdentifier:", v10, a4, a5, a7);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    prototypeMangledTypeName = v13->_prototypeMangledTypeName;
    v13->_prototypeMangledTypeName = (NSString *)v14;

    v16 = v13;
  }

  return v13;
}

- (LNEntity)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  LNEntity *v13;
  uint64_t v14;
  NSString *prototypeMangledTypeName;
  LNEntity *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("properties"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v16 = 0;
  }
  else
  {
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transient"));
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("persistentFileIdentifiable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managedAccountIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LNEntity initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:persistentFileIdentifiable:properties:managedAccountIdentifier:", v10, v5, v11, v8, v12);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prototypeMangledTypeName"));
    v14 = objc_claimAutoreleasedReturnValue();
    prototypeMangledTypeName = v13->_prototypeMangledTypeName;
    v13->_prototypeMangledTypeName = (NSString *)v14;

    self = v13;
    v16 = self;
  }

  return v16;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isTransient](self, "isTransient"), CFSTR("transient"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isPersistentFileIdentifiable](self, "isPersistentFileIdentifiable"), CFSTR("persistentFileIdentifiable"));
  -[LNEntity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNEntity properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("properties"));

  -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("managedAccountIdentifier"));

  -[LNEntity prototypeMangledTypeName](self, "prototypeMangledTypeName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("prototypeMangledTypeName"));

}

- (NSString)description
{
  void *v2;
  objc_class *v4;
  _BOOL4 v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  void *v20;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNEntity isTransient](self, "isTransient");
  v6 = &stru_1E39A2988;
  v7 = CFSTR("(transient) ");
  if (!v5)
    v7 = &stru_1E39A2988;
  v18 = v7;
  -[LNEntity identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntity prototypeMangledTypeName](self, "prototypeMangledTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNEntity isPersistentFileIdentifiable](self, "isPersistentFileIdentifiable"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[LNEntity managedAccountIdentifier](self, "managedAccountIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("MAI: %@,"), v2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[LNEntity properties](self, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKeyPath:", CFSTR("description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@%@, prototypeMangledTypeName: %@, isFile: %@, %@ properties: [%@]>"), v20, self, v18, v8, v9, v10, v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

  }
  return (NSString *)v16;
}

- (BOOL)isPersistentFileIdentifiable
{
  return self->_persistentFileIdentifiable;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4
{
  return -[LNEntity initWithTransient:identifier:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:properties:managedAccountIdentifier:", 0, a3, a4, 0);
}

- (LNEntity)initWithIdentifier:(id)a3 managedAccountIdentifier:(id)a4
{
  return -[LNEntity initWithTransient:identifier:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:properties:managedAccountIdentifier:", 0, a3, MEMORY[0x1E0C9AA60], a4);
}

- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4 managedAccountIdentifier:(id)a5
{
  return -[LNEntity initWithTransient:identifier:properties:managedAccountIdentifier:](self, "initWithTransient:identifier:properties:managedAccountIdentifier:", 0, a3, a4, a5);
}

@end

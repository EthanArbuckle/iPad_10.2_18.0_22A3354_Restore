@implementation DACActivityDescriptor

+ (DACActivityDescriptor)activityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5
{
  id v7;
  id v8;
  id *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)[DACActivityDescriptor alloc], v8, (void *)a4, v7, 0);

  return (DACActivityDescriptor *)v9;
}

- (id)_initWithIdentifier:(void *)a3 priority:(void *)a4 policy:(char)a5 localOnly:
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v9 = a2;
  v10 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)DACActivityDescriptor;
    a1 = (id *)objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v11 = objc_msgSend(v9, "copy");
      v12 = a1[2];
      a1[2] = (id)v11;

      a1[3] = a3;
      objc_storeStrong(a1 + 4, a4);
      *((_BYTE *)a1 + 8) = a5;
    }
  }

  return a1;
}

+ (id)localOnlyActivityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5
{
  id v7;
  id v8;
  id *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)[DACActivityDescriptor alloc], v8, (void *)a4, v7, 1);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DACActivityDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DACActivityDescriptor priority](self, "priority");
  -[DACActivityDescriptor policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "options");
  v10 = -[DACActivityDescriptor isLocalOnly](self, "isLocalOnly");
  v11 = 78;
  if (v10)
    v11 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@, pri(%lu) pol(%lu) local(%c)>"), v5, self, v6, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (DACActivityDescriptor)initWithCoder:(id)a3
{
  id v4;
  DACActivityDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  DACActivityDescriptor *v9;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = (DACActivityDescriptor *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("policy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (DACActivityDescriptor *)-[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)&self->super.isa, v5, v7, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localOnly")));

    self = v5;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[DACActivityDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACActivityDescriptor priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("priority"));

  -[DACActivityDescriptor policy](self, "policy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("policy"));

  objc_msgSend(v7, "encodeBool:forKey:", -[DACActivityDescriptor isLocalOnly](self, "isLocalOnly"), CFSTR("localOnly"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  DACActivityDescriptor *v4;
  DACActivityDescriptor *v5;
  DACActivityDescriptor *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v4 = (DACActivityDescriptor *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (self == v4)
  {
    LOBYTE(self) = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (self)
    {
      -[DACActivityDescriptor identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DACActivityDescriptor identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8)
        && (v9 = -[DACActivityDescriptor priority](self, "priority"),
            v9 == -[DACActivityDescriptor priority](v6, "priority")))
      {
        -[DACActivityDescriptor policy](self, "policy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DACActivityDescriptor policy](v6, "policy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          v12 = -[DACActivityDescriptor isLocalOnly](self, "isLocalOnly");
          LODWORD(self) = v12 ^ -[DACActivityDescriptor isLocalOnly](v6, "isLocalOnly") ^ 1;
        }
        else
        {
          LOBYTE(self) = 0;
        }

      }
      else
      {
        LOBYTE(self) = 0;
      }

    }
  }
  else
  {
LABEL_9:
    LOBYTE(self) = 0;
  }
LABEL_16:

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DACActivityDescriptor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)comparator
{
  return &__block_literal_global;
}

uint64_t __35__DACActivityDescriptor_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "priority");
  v6 = objc_msgSend(v4, "priority");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (DACUnknownActivityPolicy)policy
{
  return self->_policy;
}

- (BOOL)isLocalOnly
{
  return self->_localOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

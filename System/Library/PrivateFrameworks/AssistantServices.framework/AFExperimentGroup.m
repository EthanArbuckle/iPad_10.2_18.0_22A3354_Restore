@implementation AFExperimentGroup

- (AFExperimentGroup)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentGroupMutation *);
  AFExperimentGroup *v5;
  AFExperimentGroup *v6;
  _AFExperimentGroupMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSDictionary *properties;
  objc_super v15;

  v4 = (void (**)(id, _AFExperimentGroupMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFExperimentGroup;
  v5 = -[AFExperimentGroup init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentGroupMutation initWithBase:]([_AFExperimentGroupMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentGroupMutation isDirty](v7, "isDirty"))
    {
      -[_AFExperimentGroupMutation getIdentifier](v7, "getIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      v6->_allocation = -[_AFExperimentGroupMutation getAllocation](v7, "getAllocation");
      -[_AFExperimentGroupMutation getProperties](v7, "getProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      properties = v6->_properties;
      v6->_properties = (NSDictionary *)v12;

    }
  }

  return v6;
}

- (AFExperimentGroup)init
{
  return -[AFExperimentGroup initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperimentGroup)initWithIdentifier:(id)a3 allocation:(unint64_t)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AFExperimentGroup *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__AFExperimentGroup_initWithIdentifier_allocation_properties___block_invoke;
  v14[3] = &unk_1E3A2D9B8;
  v16 = v9;
  v17 = a4;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  v12 = -[AFExperimentGroup initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (NSString)description
{
  return (NSString *)-[AFExperimentGroup _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentGroup;
  -[AFExperimentGroup description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, allocation = %llu, properties = %@}"), v5, self->_identifier, self->_allocation, self->_properties);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSDictionary hash](self->_properties, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFExperimentGroup *v4;
  AFExperimentGroup *v5;
  unint64_t allocation;
  NSString *v7;
  NSString *identifier;
  NSDictionary *v9;
  NSDictionary *properties;
  BOOL v11;

  v4 = (AFExperimentGroup *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      allocation = self->_allocation;
      if (allocation == -[AFExperimentGroup allocation](v5, "allocation"))
      {
        -[AFExperimentGroup identifier](v5, "identifier");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v7 || -[NSString isEqual:](identifier, "isEqual:", v7))
        {
          -[AFExperimentGroup properties](v5, "properties");
          v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          properties = self->_properties;
          v11 = properties == v9 || -[NSDictionary isEqual:](properties, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (AFExperimentGroup)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  AFExperimentGroup *v16;
  void *v18;
  uint64_t v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentGroup::identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentGroup::allocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "unsignedIntegerValue");

  v18 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("AFExperimentGroup::properties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AFExperimentGroup initWithIdentifier:allocation:properties:](self, "initWithIdentifier:allocation:properties:", v20, v19, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("AFExperimentGroup::identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFExperimentGroup::allocation"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_properties, CFSTR("AFExperimentGroup::properties"));
}

- (AFExperimentGroup)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFExperimentGroup *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("allocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("properties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    self = -[AFExperimentGroup initWithIdentifier:allocation:properties:](self, "initWithIdentifier:allocation:properties:", v7, v11, v13);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *identifier;
  void *v6;
  NSDictionary *properties;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("allocation"));

  properties = self->_properties;
  if (properties)
    objc_msgSend(v4, "setObject:forKey:", properties, CFSTR("properties"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)allocation
{
  return self->_allocation;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __62__AFExperimentGroup_initWithIdentifier_allocation_properties___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(v4, "setAllocation:", a1[6]);
  objc_msgSend(v4, "setProperties:", a1[5]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFExperimentGroupMutation *);
  _AFExperimentGroupMutation *v5;
  AFExperimentGroup *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSDictionary *properties;

  v4 = (void (**)(id, _AFExperimentGroupMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentGroupMutation initWithBase:]([_AFExperimentGroupMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentGroupMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperimentGroup);
      -[_AFExperimentGroupMutation getIdentifier](v5, "getIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      v6->_allocation = -[_AFExperimentGroupMutation getAllocation](v5, "getAllocation");
      -[_AFExperimentGroupMutation getProperties](v5, "getProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      properties = v6->_properties;
      v6->_properties = (NSDictionary *)v11;

    }
    else
    {
      v6 = (AFExperimentGroup *)-[AFExperimentGroup copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperimentGroup *)-[AFExperimentGroup copy](self, "copy");
  }

  return v6;
}

@end

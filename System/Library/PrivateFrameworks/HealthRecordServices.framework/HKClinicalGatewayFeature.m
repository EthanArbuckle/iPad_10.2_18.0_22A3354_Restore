@implementation HKClinicalGatewayFeature

- (HKClinicalGatewayFeature)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalGatewayFeature)initWithName:(id)a3 minCompatibleAPIVersion:(int64_t)a4 status:(int64_t)a5 interactions:(id)a6
{
  id v10;
  id v11;
  HKClinicalGatewayFeature *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSArray *interactions;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalGatewayFeature;
  v12 = -[HKClinicalGatewayFeature init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_minCompatibleAPIVersion = a4;
    v12->_status = a5;
    v15 = objc_msgSend(v11, "copy");
    interactions = v12->_interactions;
    v12->_interactions = (NSArray *)v15;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalGatewayFeature *v6;
  HKClinicalGatewayFeature *v7;
  HKClinicalGatewayFeature *v8;
  NSString *name;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  char v13;
  int64_t minCompatibleAPIVersion;
  int64_t status;
  NSArray *interactions;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSArray *v21;
  void *v22;

  v6 = (HKClinicalGatewayFeature *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    name = self->_name;
    -[HKClinicalGatewayFeature name](v8, "name");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (name != v10)
    {
      -[HKClinicalGatewayFeature name](v8, "name");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v11;
      v12 = self->_name;
      -[HKClinicalGatewayFeature name](v8, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4))
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
    if (minCompatibleAPIVersion == -[HKClinicalGatewayFeature minCompatibleAPIVersion](v8, "minCompatibleAPIVersion"))
    {
      status = self->_status;
      if (status == -[HKClinicalGatewayFeature status](v8, "status"))
      {
        interactions = self->_interactions;
        -[HKClinicalGatewayFeature interactions](v8, "interactions");
        v17 = objc_claimAutoreleasedReturnValue();
        if (interactions == (NSArray *)v17)
        {

          v13 = 1;
          goto LABEL_18;
        }
        v18 = (void *)v17;
        -[HKClinicalGatewayFeature interactions](v8, "interactions");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = self->_interactions;
          -[HKClinicalGatewayFeature interactions](v8, "interactions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSArray isEqualToArray:](v21, "isEqualToArray:", v22);

          goto LABEL_18;
        }

      }
    }
    v13 = 0;
LABEL_18:
    if (name != v10)
      goto LABEL_19;
LABEL_20:

    goto LABEL_21;
  }
  v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = self->_minCompatibleAPIVersion ^ self->_status ^ -[NSString hash](self->_name, "hash");
  return v3 ^ -[NSArray hash](self->_interactions, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minCompatibleAPIVersion, CFSTR("minCompatibleAPIVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactions, CFSTR("interactions"));

}

- (HKClinicalGatewayFeature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HKClinicalGatewayFeature *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("minCompatibleAPIVersion"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("status")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minCompatibleAPIVersion"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("interactions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[HKClinicalGatewayFeature initWithName:minCompatibleAPIVersion:status:interactions:](self, "initWithName:minCompatibleAPIVersion:status:interactions:", v5, v6, v7, v9);
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

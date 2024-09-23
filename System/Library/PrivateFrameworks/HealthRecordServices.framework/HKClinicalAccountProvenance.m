@implementation HKClinicalAccountProvenance

- (HKClinicalAccountProvenance)init
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

- (HKClinicalAccountProvenance)initWithGateway:(id)a3
{
  id v5;
  HKClinicalAccountProvenance *v6;
  HKClinicalAccountProvenance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAccountProvenance;
  v6 = -[HKClinicalAccountProvenance init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gateway, a3);

  return v7;
}

- (HKClinicalAccountProvenance)initWithSignedClinicalDataIssuer:(id)a3
{
  id v5;
  HKClinicalAccountProvenance *v6;
  HKClinicalAccountProvenance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAccountProvenance;
  v6 = -[HKClinicalAccountProvenance init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signedClinicalDataIssuer, a3);

  return v7;
}

- (int64_t)type
{
  void *v4;

  if (self->_gateway)
    return 0;
  if (!self->_signedClinicalDataIssuer)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HKClinicalAccountProvenance type].cold.1(v4, (uint64_t)self);
    return 0;
  }
  return 1;
}

- (NSString)title
{
  int64_t v3;
  uint64_t v4;

  v3 = -[HKClinicalAccountProvenance type](self, "type");
  v4 = 8;
  if (v3 == 1)
    v4 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "title");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)subtitle
{
  int64_t v3;
  uint64_t v4;

  v3 = -[HKClinicalAccountProvenance type](self, "type");
  v4 = 8;
  if (v3 == 1)
    v4 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "subtitle");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKClinicalBrand)brand
{
  void *v3;

  if (-[HKClinicalAccountProvenance type](self, "type") == 1)
  {
    v3 = 0;
  }
  else
  {
    -[HKClinicalGateway brand](self->_gateway, "brand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKClinicalBrand *)v3;
}

- (id)description
{
  int64_t v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = -[HKClinicalAccountProvenance type](self, "type");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 8;
  if (v3 == 1)
    v8 = 16;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v6, self, *(Class *)((char *)&self->super.isa + v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKClinicalGateway hash](self->_gateway, "hash");
  return -[HKSignedClinicalDataIssuer hash](self->_signedClinicalDataIssuer, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalAccountProvenance *v6;
  HKClinicalAccountProvenance *v7;
  HKClinicalAccountProvenance *v8;
  HKClinicalGateway *gateway;
  HKClinicalGateway *v10;
  uint64_t v11;
  HKClinicalGateway *v12;
  char v13;
  HKSignedClinicalDataIssuer *signedClinicalDataIssuer;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HKSignedClinicalDataIssuer *v19;
  void *v20;

  v6 = (HKClinicalAccountProvenance *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    gateway = self->_gateway;
    -[HKClinicalAccountProvenance gateway](v8, "gateway");
    v10 = (HKClinicalGateway *)objc_claimAutoreleasedReturnValue();
    if (gateway == v10)
      goto LABEL_9;
    -[HKClinicalAccountProvenance gateway](v8, "gateway");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_gateway;
    -[HKClinicalAccountProvenance gateway](v8, "gateway");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKClinicalGateway isEqual:](v12, "isEqual:", v4))
    {
LABEL_9:
      signedClinicalDataIssuer = self->_signedClinicalDataIssuer;
      -[HKClinicalAccountProvenance signedClinicalDataIssuer](v8, "signedClinicalDataIssuer");
      v15 = objc_claimAutoreleasedReturnValue();
      if (signedClinicalDataIssuer == (HKSignedClinicalDataIssuer *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKClinicalAccountProvenance signedClinicalDataIssuer](v8, "signedClinicalDataIssuer");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_signedClinicalDataIssuer;
          -[HKClinicalAccountProvenance signedClinicalDataIssuer](v8, "signedClinicalDataIssuer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HKSignedClinicalDataIssuer isEqual:](v19, "isEqual:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (gateway == v10)
        goto LABEL_17;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_17;
  }
  v13 = 1;
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKClinicalGateway *gateway;
  id v5;

  gateway = self->_gateway;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", gateway, CFSTR("Gateway"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedClinicalDataIssuer, CFSTR("SignedClinicalDataIssuer"));

}

- (HKClinicalAccountProvenance)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKClinicalAccountProvenance *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Gateway"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[HKClinicalAccountProvenance initWithGateway:](self, "initWithGateway:", v5);
    v6 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SignedClinicalDataIssuer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[HKClinicalAccountProvenance initWithSignedClinicalDataIssuer:](self, "initWithSignedClinicalDataIssuer:", v7);
      v6 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      v6 = 0;
    }

  }
  return v6;
}

- (HKClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKSignedClinicalDataIssuer)signedClinicalDataIssuer
{
  return self->_signedClinicalDataIssuer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedClinicalDataIssuer, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
}

- (void)type
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_2163C4000, v3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ has no valid provenance type assigned", (uint8_t *)&v6, 0x16u);

}

@end

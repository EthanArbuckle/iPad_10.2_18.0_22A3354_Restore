@implementation HKSignedClinicalDataRegistryPublicKeyFetchResult

- (HKSignedClinicalDataRegistryPublicKeyFetchResult)initWithKeyID:(id)a3 outcome:(unint64_t)a4 jwkData:(id)a5
{
  id v8;
  id v9;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v10;
  uint64_t v11;
  NSString *kid;
  uint64_t v13;
  NSData *jwkData;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSignedClinicalDataRegistryPublicKeyFetchResult;
  v10 = -[HKSignedClinicalDataRegistryPublicKeyFetchResult init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    kid = v10->_kid;
    v10->_kid = (NSString *)v11;

    v10->_outcome = a4;
    v13 = objc_msgSend(v9, "copy");
    jwkData = v10->_jwkData;
    v10->_jwkData = (NSData *)v13;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v6;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v7;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v8;
  NSString *kid;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  unint64_t v13;
  char v14;
  unint64_t outcome;
  NSData *jwkData;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSData *v21;
  void *v22;

  v6 = (HKSignedClinicalDataRegistryPublicKeyFetchResult *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    kid = self->_kid;
    -[HKSignedClinicalDataRegistryPublicKeyFetchResult kid](v8, "kid");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (kid == v10)
    {
      outcome = self->_outcome;
      if (outcome == -[HKSignedClinicalDataRegistryPublicKeyFetchResult outcome](v8, "outcome"))
        goto LABEL_11;
    }
    else
    {
      -[HKSignedClinicalDataRegistryPublicKeyFetchResult kid](v8, "kid");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v3 = (void *)v11;
        v12 = self->_kid;
        -[HKSignedClinicalDataRegistryPublicKeyFetchResult kid](v8, "kid");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4)
          || (v13 = self->_outcome, v13 != -[HKSignedClinicalDataRegistryPublicKeyFetchResult outcome](v8, "outcome")))
        {
          v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
LABEL_11:
        jwkData = self->_jwkData;
        -[HKSignedClinicalDataRegistryPublicKeyFetchResult jwkData](v8, "jwkData");
        v17 = objc_claimAutoreleasedReturnValue();
        if (jwkData == (NSData *)v17)
        {

          v14 = 1;
        }
        else
        {
          v18 = (void *)v17;
          -[HKSignedClinicalDataRegistryPublicKeyFetchResult jwkData](v8, "jwkData");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            v21 = self->_jwkData;
            -[HKSignedClinicalDataRegistryPublicKeyFetchResult jwkData](v8, "jwkData");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[NSData isEqual:](v21, "isEqual:", v22);

          }
          else
          {

            v14 = 0;
          }
        }
        if (kid == v10)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v14 = 1;
LABEL_21:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *kid;
  id v5;

  kid = self->_kid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", kid, CFSTR("kid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outcome, CFSTR("outcome"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jwkData, CFSTR("jwkData"));

}

- (HKSignedClinicalDataRegistryPublicKeyFetchResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("outcome")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outcome"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jwkData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKSignedClinicalDataRegistryPublicKeyFetchResult initWithKeyID:outcome:jwkData:](self, "initWithKeyID:outcome:jwkData:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (unint64_t)outcome
{
  return self->_outcome;
}

- (NSString)kid
{
  return self->_kid;
}

- (NSData)jwkData
{
  return self->_jwkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jwkData, 0);
  objc_storeStrong((id *)&self->_kid, 0);
}

@end

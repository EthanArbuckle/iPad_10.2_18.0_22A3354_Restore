@implementation HKClinicalBrand

- (HKClinicalBrand)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalBrand)initWithExternalID:(id)a3 batchID:(id)a4
{
  id v6;
  id v7;
  HKClinicalBrand *v8;
  uint64_t v9;
  NSString *externalID;
  uint64_t v11;
  NSString *batchID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalBrand;
  v8 = -[HKClinicalBrand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    externalID = v8->_externalID;
    v8->_externalID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    batchID = v8->_batchID;
    v8->_batchID = (NSString *)v11;

  }
  return v8;
}

+ (id)createFakeBrandForTestAccounts
{
  return -[HKClinicalBrand initWithExternalID:batchID:]([HKClinicalBrand alloc], "initWithExternalID:batchID:", CFSTR("INVALID_FAKEBRANDID"), CFSTR("INVALID_FAKEBRANDBATCHID"));
}

- (BOOL)isFakeBrandForTestAccounts
{
  return -[NSString hasSuffix:](self->_externalID, "hasSuffix:", CFSTR("_FAKEBRANDID"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[HKClinicalBrand externalID](self, "externalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[HKClinicalBrand batchID](self, "batchID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "batchID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKClinicalBrand externalID](self, "externalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKClinicalBrand batchID](self, "batchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKClinicalBrand externalID](self, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("externalID"));

  -[HKClinicalBrand batchID](self, "batchID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("batchID"));

}

- (HKClinicalBrand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  HKClinicalBrand *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batchID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    objc_msgSend(v4, "failWithError:", v10);

    v11 = 0;
  }
  else
  {
    self = -[HKClinicalBrand initWithExternalID:batchID:](self, "initWithExternalID:batchID:", v5, v6);
    v11 = self;
  }

  return v11;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end

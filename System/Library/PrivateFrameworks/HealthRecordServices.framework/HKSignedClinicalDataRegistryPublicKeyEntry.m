@implementation HKSignedClinicalDataRegistryPublicKeyEntry

- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwkData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKSignedClinicalDataRegistryPublicKeyEntry *v17;
  uint64_t v18;
  NSString *kid;
  uint64_t v20;
  NSDate *added;
  uint64_t v22;
  NSDate *removed;
  uint64_t v24;
  NSString *source;
  uint64_t v26;
  NSData *jwk;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSignedClinicalDataRegistryPublicKeyEntry;
  v17 = -[HKSignedClinicalDataRegistryPublicKeyEntry init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    kid = v17->_kid;
    v17->_kid = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    added = v17->_added;
    v17->_added = (NSDate *)v20;

    v22 = objc_msgSend(v14, "copy");
    removed = v17->_removed;
    v17->_removed = (NSDate *)v22;

    v24 = objc_msgSend(v15, "copy");
    source = v17->_source;
    v17->_source = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    jwk = v17->_jwk;
    v17->_jwk = (NSData *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKSignedClinicalDataRegistryPublicKeyEntry *v5;
  HKSignedClinicalDataRegistryPublicKeyEntry *v6;
  HKSignedClinicalDataRegistryPublicKeyEntry *v7;
  NSString *kid;
  NSString *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  char v14;
  NSDate *added;
  NSDate *v16;
  uint64_t v17;
  NSDate *v18;
  NSDate *removed;
  NSDate *v20;
  uint64_t v21;
  NSDate *v22;
  NSDate *v23;
  uint64_t v24;
  NSDate *v25;
  void *v26;
  NSDate *v27;
  NSString *source;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  NSData *jwk;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSData *v41;
  void *v42;
  NSDate *v43;
  NSDate *v44;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  NSDate *v50;
  NSString *v51;
  void *v52;
  void *v53;
  NSDate *v54;
  NSDate *v55;
  void *v56;
  void *v57;
  void *v58;

  v5 = (HKSignedClinicalDataRegistryPublicKeyEntry *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_53:

      goto LABEL_54;
    }
    kid = self->_kid;
    -[HKSignedClinicalDataRegistryPublicKeyEntry kid](v7, "kid");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (kid != v9)
    {
      -[HKSignedClinicalDataRegistryPublicKeyEntry kid](v7, "kid");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v14 = 0;
        goto LABEL_52;
      }
      v11 = (void *)v10;
      v12 = self->_kid;
      -[HKSignedClinicalDataRegistryPublicKeyEntry kid](v7, "kid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v58 = v11;
      v57 = v13;
    }
    added = self->_added;
    -[HKSignedClinicalDataRegistryPublicKeyEntry added](v7, "added");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (added != v16)
    {
      -[HKSignedClinicalDataRegistryPublicKeyEntry added](v7, "added");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_32:

LABEL_33:
        v14 = 0;
        goto LABEL_50;
      }
      v56 = (void *)v17;
      v18 = self->_added;
      -[HKSignedClinicalDataRegistryPublicKeyEntry added](v7, "added");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSDate isEqual:](v18, "isEqual:", v3) & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    removed = self->_removed;
    -[HKSignedClinicalDataRegistryPublicKeyEntry removed](v7, "removed");
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v55 = removed;
    if (removed == v20)
    {
      v54 = added;
      v27 = v16;
    }
    else
    {
      -[HKSignedClinicalDataRegistryPublicKeyEntry removed](v7, "removed");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v53 = v3;
        v14 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v21;
      v54 = added;
      v22 = v20;
      v23 = self->_removed;
      -[HKSignedClinicalDataRegistryPublicKeyEntry removed](v7, "removed");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if ((-[NSDate isEqual:](v25, "isEqual:", v24) & 1) == 0)
      {

        if (added == v16)
        {

          goto LABEL_33;
        }
        goto LABEL_31;
      }
      v27 = v16;
      v48 = v26;
      v20 = v22;
    }
    source = self->_source;
    -[HKSignedClinicalDataRegistryPublicKeyEntry source](v7, "source");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v51 = source;
    v53 = v3;
    if (source == (NSString *)v29)
    {
      v49 = (NSString *)v29;
      v50 = v20;
      v16 = v27;
    }
    else
    {
      -[HKSignedClinicalDataRegistryPublicKeyEntry source](v7, "source");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v14 = 0;
        v16 = v27;
        added = v54;
        v43 = v55;
        goto LABEL_37;
      }
      v47 = (void *)v31;
      v50 = v20;
      v32 = self->_source;
      -[HKSignedClinicalDataRegistryPublicKeyEntry source](v7, "source");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v35 = (void *)v33;
      v16 = v27;
      if (!-[NSString isEqualToString:](v34, "isEqualToString:", v33))
      {

        v14 = 0;
        v20 = v50;
        added = v54;
        v44 = v55;
        goto LABEL_45;
      }
      v46 = v35;
      v49 = (NSString *)v30;
    }
    jwk = self->_jwk;
    -[HKSignedClinicalDataRegistryPublicKeyEntry jwk](v7, "jwk");
    v37 = objc_claimAutoreleasedReturnValue();
    v14 = jwk == (NSData *)v37;
    if (jwk == (NSData *)v37)
    {

      v30 = v49;
      added = v54;
      if (v51 == v49)
        goto LABEL_41;
    }
    else
    {
      v38 = (void *)v37;
      -[HKSignedClinicalDataRegistryPublicKeyEntry jwk](v7, "jwk");
      v39 = objc_claimAutoreleasedReturnValue();
      added = v54;
      if (v39)
      {
        v40 = (void *)v39;
        v41 = self->_jwk;
        -[HKSignedClinicalDataRegistryPublicKeyEntry jwk](v7, "jwk");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSData isEqual:](v41, "isEqual:", v42);

        if (v51 == v49)
        {

        }
        else
        {

        }
        goto LABEL_44;
      }

      v30 = v49;
      if (v51 == v49)
      {
LABEL_41:

LABEL_44:
        v20 = v50;
        v44 = v55;
LABEL_45:
        if (v44 != v20)
        {
LABEL_46:

        }
LABEL_47:

        if (added != v16)
        {

        }
LABEL_50:
        v13 = v57;
        v11 = v58;
        if (kid != v9)
          goto LABEL_51;
LABEL_52:

        goto LABEL_53;
      }
    }

    v20 = v50;
    v43 = v55;
LABEL_37:

    if (v43 == v20)
      goto LABEL_47;
    goto LABEL_46;
  }
  v14 = 1;
LABEL_54:

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_added, CFSTR("added"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removed, CFSTR("removed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jwk, CFSTR("jwk"));

}

- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSignedClinicalDataRegistryPublicKeyEntry *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("added"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jwk"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HKSignedClinicalDataRegistryPublicKeyEntry initWithKeyID:added:removed:source:jwkData:](self, "initWithKeyID:added:removed:source:jwkData:", v5, v6, v7, v8, v9);

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

- (NSString)kid
{
  return self->_kid;
}

- (NSDate)added
{
  return self->_added;
}

- (NSDate)removed
{
  return self->_removed;
}

- (NSString)source
{
  return self->_source;
}

- (NSData)jwk
{
  return self->_jwk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jwk, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_kid, 0);
}

@end

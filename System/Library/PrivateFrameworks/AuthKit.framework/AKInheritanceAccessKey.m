@implementation AKInheritanceAccessKey

- (AKInheritanceAccessKey)initWithBeneficiairyIdentifier:(id)a3
{
  id v5;
  AKInheritanceAccessKey *v6;
  AKInheritanceAccessKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceAccessKey;
  v6 = -[AKInheritanceAccessKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_beneficiaryID, a3);

  return v7;
}

- (AKInheritanceAccessKey)initWithCoder:(id)a3
{
  id v4;
  AKInheritanceAccessKey *v5;
  uint64_t v6;
  NSUUID *beneficiaryID;
  uint64_t v8;
  NSData *wrappingKeyData;
  uint64_t v10;
  NSString *wrappingKeyString;
  uint64_t v12;
  NSData *wrappedKeyData;
  uint64_t v14;
  NSString *wrappedKeyString;
  uint64_t v16;
  NSData *claimTokenData;
  uint64_t v18;
  NSString *claimTokenString;

  v4 = a3;
  v5 = -[AKInheritanceAccessKey init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryID"));
    v6 = objc_claimAutoreleasedReturnValue();
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappingKeyData"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrappingKeyData = v5->_wrappingKeyData;
    v5->_wrappingKeyData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappingKeyString"));
    v10 = objc_claimAutoreleasedReturnValue();
    wrappingKeyString = v5->_wrappingKeyString;
    v5->_wrappingKeyString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappedKeyData"));
    v12 = objc_claimAutoreleasedReturnValue();
    wrappedKeyData = v5->_wrappedKeyData;
    v5->_wrappedKeyData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappedKeyString"));
    v14 = objc_claimAutoreleasedReturnValue();
    wrappedKeyString = v5->_wrappedKeyString;
    v5->_wrappedKeyString = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_claimTokenData"));
    v16 = objc_claimAutoreleasedReturnValue();
    claimTokenData = v5->_claimTokenData;
    v5->_claimTokenData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_claimTokenString"));
    v18 = objc_claimAutoreleasedReturnValue();
    claimTokenString = v5->_claimTokenString;
    v5->_claimTokenString = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beneficiaryID;
  id v5;

  beneficiaryID = self->_beneficiaryID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaryID, CFSTR("_beneficiaryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyData, CFSTR("_wrappingKeyData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyString, CFSTR("_wrappingKeyString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKeyData, CFSTR("_wrappedKeyData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKeyString, CFSTR("_wrappedKeyString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimTokenData, CFSTR("_claimTokenData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimTokenString, CFSTR("_claimTokenString"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_beneficiaryID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSData copy](self->_wrappingKeyData, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_wrappingKeyString, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSData copy](self->_wrappedKeyData, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_wrappedKeyString, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSData copy](self->_claimTokenData, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSString copy](self->_claimTokenString, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AKInheritanceAccessKey;
  -[AKInheritanceAccessKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInheritanceAccessKey beneficiaryID](self, "beneficiaryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nAccess code for beneficiary %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSUUID *beneficiaryID;
  void *v7;
  NSData *claimTokenData;
  void *v9;
  NSString *claimTokenString;
  void *v11;
  NSData *wrappedKeyData;
  void *v13;
  NSString *wrappedKeyString;
  void *v15;
  NSData *wrappingKeyData;
  void *v17;
  NSString *wrappingKeyString;
  void *v19;
  BOOL v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    beneficiaryID = self->_beneficiaryID;
    objc_msgSend(v5, "beneficiaryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSUUID isEqual:](beneficiaryID, "isEqual:", v7))
    {
      claimTokenData = self->_claimTokenData;
      objc_msgSend(v5, "claimTokenData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSData isEqualToData:](claimTokenData, "isEqualToData:", v9))
      {
        claimTokenString = self->_claimTokenString;
        objc_msgSend(v5, "claimTokenString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](claimTokenString, "isEqualToString:", v11))
        {
          wrappedKeyData = self->_wrappedKeyData;
          objc_msgSend(v5, "wrappedKeyData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSData isEqualToData:](wrappedKeyData, "isEqualToData:", v13))
          {
            wrappedKeyString = self->_wrappedKeyString;
            objc_msgSend(v5, "wrappedKeyString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](wrappedKeyString, "isEqualToString:", v15))
            {
              wrappingKeyData = self->_wrappingKeyData;
              objc_msgSend(v5, "wrappingKeyData");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSData isEqualToData:](wrappingKeyData, "isEqualToData:", v17))
              {
                wrappingKeyString = self->_wrappingKeyString;
                objc_msgSend(v5, "wrappingKeyString");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = -[NSString isEqualToString:](wrappingKeyString, "isEqualToString:", v19);

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSData)wrappingKeyData
{
  return self->_wrappingKeyData;
}

- (void)setWrappingKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_wrappingKeyData, a3);
}

- (NSString)wrappingKeyString
{
  return self->_wrappingKeyString;
}

- (void)setWrappingKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_wrappingKeyString, a3);
}

- (NSData)wrappedKeyData
{
  return self->_wrappedKeyData;
}

- (void)setWrappedKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedKeyData, a3);
}

- (NSString)wrappedKeyString
{
  return self->_wrappedKeyString;
}

- (void)setWrappedKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedKeyString, a3);
}

- (NSData)claimTokenData
{
  return self->_claimTokenData;
}

- (void)setClaimTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_claimTokenData, a3);
}

- (NSString)claimTokenString
{
  return self->_claimTokenString;
}

- (void)setClaimTokenString:(id)a3
{
  objc_storeStrong((id *)&self->_claimTokenString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimTokenString, 0);
  objc_storeStrong((id *)&self->_claimTokenData, 0);
  objc_storeStrong((id *)&self->_wrappedKeyString, 0);
  objc_storeStrong((id *)&self->_wrappedKeyData, 0);
  objc_storeStrong((id *)&self->_wrappingKeyString, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end

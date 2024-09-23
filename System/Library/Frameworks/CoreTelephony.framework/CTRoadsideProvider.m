@implementation CTRoadsideProvider

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerId=%ld"), -[CTRoadsideProvider providerId](self, "providerId"));
  -[CTRoadsideProvider providerName](self, "providerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerName=%@"), v4);

  -[CTRoadsideProvider bizId](self, "bizId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bizId=%@"), v5);

  if (-[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", supportsPayPerUse=%s"), v6);
  if (-[CTRoadsideProvider isActive](self, "isActive"))
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isActive=%s"), v7);
  if (-[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCarrierProvider=%s"), v8);
  -[CTRoadsideProvider associatedPhoneNumbers](self, "associatedPhoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", associatedPhoneNumbers=%@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToProvider:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = -[CTRoadsideProvider providerId](self, "providerId");
  if (v8 == objc_msgSend(v7, "providerId"))
  {
    -[CTRoadsideProvider providerName](self, "providerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != v10)
    {
      -[CTRoadsideProvider providerName](self, "providerName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "providerName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "isEqual:", v3))
      {
        v11 = 0;
        goto LABEL_17;
      }
    }
    -[CTRoadsideProvider bizId](self, "bizId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bizId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13
      || (-[CTRoadsideProvider bizId](self, "bizId"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "bizId"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "isEqual:", v5)))
    {
      v14 = -[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse");
      if (v14 == objc_msgSend(v7, "supportsPayPerUse")
        && (v15 = -[CTRoadsideProvider isActive](self, "isActive"), v15 == objc_msgSend(v7, "isActive"))
        && (v16 = -[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"),
            v16 == objc_msgSend(v7, "isCarrierProvider")))
      {
        -[CTRoadsideProvider associatedPhoneNumbers](self, "associatedPhoneNumbers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "associatedPhoneNumbers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == v21)
        {

          v11 = 1;
          v17 = 1;
        }
        else
        {
          -[CTRoadsideProvider associatedPhoneNumbers](self, "associatedPhoneNumbers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "associatedPhoneNumbers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v20, "isEqual:", v19);

          v17 = v11;
        }
      }
      else
      {
        v11 = 0;
        v17 = 0;
      }
      if (v12 == v13)
      {

        v11 = v17;
LABEL_16:
        if (v9 == v10)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_16;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTRoadsideProvider *v4;
  BOOL v5;

  v4 = (CTRoadsideProvider *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CTRoadsideProvider isEqualToProvider:](self, "isEqualToProvider:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setProviderId:", -[CTRoadsideProvider providerId](self, "providerId"));
  -[CTRoadsideProvider providerName](self, "providerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setProviderName:", v7);

  -[CTRoadsideProvider bizId](self, "bizId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setBizId:", v9);

  objc_msgSend(v5, "setSupportsPayPerUse:", -[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse"));
  objc_msgSend(v5, "setIsActive:", -[CTRoadsideProvider isActive](self, "isActive"));
  objc_msgSend(v5, "setIsCarrierProvider:", -[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"));
  -[CTRoadsideProvider associatedPhoneNumbers](self, "associatedPhoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssociatedPhoneNumbers:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[CTRoadsideProvider providerId](self, "providerId"), CFSTR("providerId"));
  -[CTRoadsideProvider providerName](self, "providerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("providerName"));

  -[CTRoadsideProvider bizId](self, "bizId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bizId"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider supportsPayPerUse](self, "supportsPayPerUse"), CFSTR("supportsPayPerUse"));
  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider isActive](self, "isActive"), CFSTR("isActive"));
  objc_msgSend(v7, "encodeBool:forKey:", -[CTRoadsideProvider isCarrierProvider](self, "isCarrierProvider"), CFSTR("isCarrierProvider"));
  -[CTRoadsideProvider associatedPhoneNumbers](self, "associatedPhoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("associatedPhoneNumbers"));

}

- (CTRoadsideProvider)initWithCoder:(id)a3
{
  id v4;
  CTRoadsideProvider *v5;
  uint64_t v6;
  NSString *providerName;
  uint64_t v8;
  NSString *bizId;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *associatedPhoneNumbers;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTRoadsideProvider;
  v5 = -[CTRoadsideProvider init](&v16, sel_init);
  if (v5)
  {
    v5->_providerId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("providerId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerName"));
    v6 = objc_claimAutoreleasedReturnValue();
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bizId"));
    v8 = objc_claimAutoreleasedReturnValue();
    bizId = v5->_bizId;
    v5->_bizId = (NSString *)v8;

    v5->_supportsPayPerUse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsPayPerUse"));
    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
    v5->_isCarrierProvider = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCarrierProvider"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("associatedPhoneNumbers"));
    v13 = objc_claimAutoreleasedReturnValue();
    associatedPhoneNumbers = v5->_associatedPhoneNumbers;
    v5->_associatedPhoneNumbers = (NSArray *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (NSString)bizId
{
  return self->_bizId;
}

- (void)setBizId:(id)a3
{
  objc_storeStrong((id *)&self->_bizId, a3);
}

- (BOOL)supportsPayPerUse
{
  return self->_supportsPayPerUse;
}

- (void)setSupportsPayPerUse:(BOOL)a3
{
  self->_supportsPayPerUse = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isCarrierProvider
{
  return self->_isCarrierProvider;
}

- (void)setIsCarrierProvider:(BOOL)a3
{
  self->_isCarrierProvider = a3;
}

- (NSArray)associatedPhoneNumbers
{
  return self->_associatedPhoneNumbers;
}

- (void)setAssociatedPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_associatedPhoneNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_bizId, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
}

@end

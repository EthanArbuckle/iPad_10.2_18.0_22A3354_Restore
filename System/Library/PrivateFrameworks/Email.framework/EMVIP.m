@implementation EMVIP

- (EMVIP)initWithIdentifier:(id)a3 name:(id)a4 emailAddresses:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMVIP *v11;
  EMVIP *v12;
  EMVIP *v13;
  id v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)EMVIP;
  v11 = -[EMVIP init](&v16, sel_init);
  if (v11)
  {
    if (!objc_msgSend(v10, "count"))
    {
      v13 = v11;
      v11 = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (v8)
    {
      if (v9)
      {
LABEL_5:
        v12 = (EMVIP *)v9;
LABEL_9:
        v13 = v12;
        -[EMVIP _commonInitWithIdentifier:name:emailAddresses:displayName:](v11, "_commonInitWithIdentifier:name:emailAddresses:displayName:", v8, v9, v10, v12);
        goto LABEL_10;
      }
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v14, "UUIDString");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_5;
    }
    objc_msgSend(v10, "anyObject");
    v12 = (EMVIP *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

- (void)_commonInitWithIdentifier:(id)a3 name:(id)a4 emailAddresses:(id)a5 displayName:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *identifier;
  NSString *v15;
  NSString *name;
  EAEmailAddressSet *v17;
  EAEmailAddressSet *emailAddresses;
  NSString *v19;
  NSString *displayName;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (NSString *)objc_msgSend(v21, "copy");
  identifier = self->_identifier;
  self->_identifier = v13;

  v15 = (NSString *)objc_msgSend(v10, "copy");
  name = self->_name;
  self->_name = v15;

  v17 = (EAEmailAddressSet *)objc_msgSend(v11, "copy");
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v17;

  v19 = (NSString *)objc_msgSend(v12, "copy");
  displayName = self->_displayName;
  self->_displayName = v19;

}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D1EF48];
  -[EMVIP name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "partiallyRedactedStringForString:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D1EF48];
  -[EMVIP emailAddresses](self, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "partiallyRedactedStringFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  v12 = &stru_1E70F6E90;
  if (v5)
    v12 = v5;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p> '%@' {%@}"), v11, self, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  EMVIP *v4;
  BOOL v5;

  v4 = (EMVIP *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[EMVIP _isEqualToVIP:](self, "_isEqualToVIP:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMVIP identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMVIP)initWithCoder:(id)a3
{
  id v4;
  EMVIP *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMVIP;
  v5 = -[EMVIP init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EMVIPEmailAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E458]), "initWithSerializedRepresentation:", v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMVIP _commonInitWithIdentifier:name:emailAddresses:displayName:](v5, "_commonInitWithIdentifier:name:emailAddresses:displayName:", v8, v9, v7, v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[EMVIP identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_identifier"));

  -[EMVIP name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_name"));

  -[EMVIP displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_displayName"));

  -[EMVIP emailAddresses](self, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("EMVIPEmailAddresses"));

}

- (BOOL)_isEqualToVIP:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[EMVIP identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (EAEmailAddressSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

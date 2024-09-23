@implementation STContactAddress

- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4
{
  return -[STContactAddress initWithType:stringValue:contactIdentifier:contactInternalGUID:](self, "initWithType:stringValue:contactIdentifier:contactInternalGUID:", a3, a4, 0, 0);
}

- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4 contactIdentifier:(id)a5 contactInternalGUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  STContactAddress *v13;
  STContactAddress *v14;
  uint64_t v15;
  NSString *stringValue;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STContactAddress;
  v13 = -[STContactAddress init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v15 = objc_msgSend(v10, "copy");
    stringValue = v14->_stringValue;
    v14->_stringValue = (NSString *)v15;

    objc_storeStrong((id *)&v14->_contactIdentifier, a5);
    objc_storeStrong((id *)&v14->_contactInternalGUID, a6);
  }

  return v14;
}

- (STContactAddress)initWithStringValue:(id)a3
{
  return -[STContactAddress initWithType:stringValue:](self, "initWithType:stringValue:", 0, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (id)stringValue
{
  return self->_stringValue;
}

- (id)contactIdentifier
{
  return self->_contactIdentifier;
}

- (id)contactInternalGUID
{
  return self->_contactInternalGUID;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  const __CFString *stringValue;
  NSURL *contactIdentifier;
  void *v9;
  const __CFString *contactInternalGUID;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p"), self);
  objc_msgSend(v3, "appendString:", CFSTR("; type="));
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("INVALID");
  else
    v6 = off_1E3A2D0A0[type];
  objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(v3, "appendString:", CFSTR("; stringValue="));
  if (self->_stringValue)
    stringValue = (const __CFString *)self->_stringValue;
  else
    stringValue = CFSTR("nil");
  objc_msgSend(v3, "appendString:", stringValue);
  objc_msgSend(v3, "appendString:", CFSTR("; contactIdentifier="));
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    -[NSURL absoluteString](contactIdentifier, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v9);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("nil"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("; contactInternalGUID="));
  if (self->_contactInternalGUID)
    contactInternalGUID = (const __CFString *)self->_contactInternalGUID;
  else
    contactInternalGUID = CFSTR("nil");
  objc_msgSend(v3, "appendString:", contactInternalGUID);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)_aceContextObjectValue
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D88310]);
  -[STContactAddress stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setData:", v4);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STContactAddress;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("_stringValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactInternalGUID, CFSTR("_contactInternalGUID"));

}

- (STContactAddress)initWithCoder:(id)a3
{
  id v4;
  STContactAddress *v5;
  uint64_t v6;
  NSString *stringValue;
  uint64_t v8;
  NSURL *contactIdentifier;
  uint64_t v10;
  NSString *contactInternalGUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STContactAddress;
  v5 = -[STSiriModelObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactInternalGUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactInternalGUID = v5->_contactInternalGUID;
    v5->_contactInternalGUID = (NSString *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInternalGUID, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

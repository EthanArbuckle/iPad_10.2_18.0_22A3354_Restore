@implementation CPSSystemAuthenticationRequest

- (NSString)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_service - 1;
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_service);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_250A11740[v4];
  }
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("service"));

  CUPrintFlags64();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("options"));

  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_appleAccountAltDSID, CFSTR("appleAccountAltDSID"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)authType
{
  unint64_t v2;

  v2 = *(_QWORD *)(self + 8) - 2;
  if (v2 < 3)
    return qword_2383EF7F8[v2];
  __break(1u);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSystemAuthenticationRequest)initWithCoder:(id)a3
{
  id v4;
  CPSSystemAuthenticationRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *appleAccountAltDSID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSSystemAuthenticationRequest;
  v5 = -[CPSSystemAuthenticationRequest init](&v10, sel_init);
  if (v5)
  {
    v5->_service = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("service"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("appleAccountAltDSID"));
    v7 = objc_claimAutoreleasedReturnValue();
    appleAccountAltDSID = v5->_appleAccountAltDSID;
    v5->_appleAccountAltDSID = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t service;
  id v5;

  service = self->_service;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", service, CFSTR("service"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleAccountAltDSID, CFSTR("appleAccountAltDSID"));

}

- (CPSSystemAuthenticationRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  CPSSystemAuthenticationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *appleAccountAltDSID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSSystemAuthenticationRequest;
  v5 = -[CPSSystemAuthenticationRequest init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_service = objc_msgSend(v7, "integerValue");

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v8, "integerValue");

    objc_msgSend(v6, "decodeStringForKey:", CFSTR("appleAccountAltDSID"));
    v9 = objc_claimAutoreleasedReturnValue();
    appleAccountAltDSID = v5->_appleAccountAltDSID;
    v5->_appleAccountAltDSID = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_service);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("service"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("options"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_appleAccountAltDSID, CFSTR("appleAccountAltDSID"));
}

- (int64_t)service
{
  return self->_service;
}

- (void)setService:(int64_t)a3
{
  self->_service = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)appleAccountAltDSID
{
  return self->_appleAccountAltDSID;
}

- (void)setAppleAccountAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountAltDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountAltDSID, 0);
}

@end

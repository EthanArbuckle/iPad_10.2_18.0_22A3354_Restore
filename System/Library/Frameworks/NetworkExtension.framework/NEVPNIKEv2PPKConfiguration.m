@implementation NEVPNIKEv2PPKConfiguration

- (NEVPNIKEv2PPKConfiguration)initWithIdentifier:(id)a3 keychainReference:(id)a4
{
  id v6;
  id v7;
  NEVPNIKEv2PPKConfiguration *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSData *keychainReference;
  NEVPNIKEv2PPKConfiguration *v13;
  NSObject *v15;
  uint8_t v16[16];
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNIKEv2PPKConfiguration;
  v8 = -[NEVPNIKEv2PPKConfiguration init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    keychainReference = v8->_keychainReference;
    v8->_keychainReference = (NSData *)v11;

    v8->_isMandatory = 1;
    v13 = v8;
  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "[super init] failed", v16, 2u);
    }

  }
  return v8;
}

- (NEVPNIKEv2PPKConfiguration)initWithCoder:(id)a3
{
  id v4;
  NEVPNIKEv2PPKConfiguration *v5;
  uint64_t v6;
  NEKeychainItem *keychainItem;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSData *keychainReference;
  NEVPNIKEv2PPKConfiguration *v12;
  NSObject *v14;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NEVPNIKEv2PPKConfiguration;
  v5 = -[NEVPNIKEv2PPKConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PPKKeychainItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PPKIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PPKReference"));
    v10 = objc_claimAutoreleasedReturnValue();
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v10;

    v5->_isMandatory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PPKMandatory"));
    v12 = v5;
  }
  else
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  id Property;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  objc_msgSend(v8, "encodeObject:forKey:", Property, CFSTR("PPKKeychainItem"));
  -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("PPKIdentifier"));

  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("PPKReference"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"), CFSTR("PPKMandatory"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  NEVPNIKEv2PPKConfiguration *v5;
  id Property;
  uint64_t v7;
  NEKeychainItem *keychainItem;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSData *keychainReference;

  v5 = -[NEVPNIKEv2PPKConfiguration init](+[NEVPNIKEv2PPKConfiguration allocWithZone:](NEVPNIKEv2PPKConfiguration, "allocWithZone:", a3), "init");
  if (v5)
  {
    if (self)
      Property = objc_getProperty(self, v4, 32, 1);
    else
      Property = 0;
    v7 = objc_msgSend(Property, "copy");
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v7;

    -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v13;

    v5->_isMandatory = -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory");
  }
  return v5;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  const char *v9;

  v4 = a3;
  -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = v6 != 0;

  if (!v6)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Use of a PPK requires an identifier"), v4);
  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else if (!self || !objc_getProperty(self, v9, 32, 1))
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Use of a PPK requires a key"), v4);
    v7 = 0;
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  const char *v9;
  id Property;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("identifier"), v5, a4 | 9);

  if (self)
    Property = objc_getProperty(self, v9, 32, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("keychainItem"), v5, a4 | 9);
  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("keychainReference"), v5, a4 | 9);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"), CFSTR("isMandatory"), v5, a4 | 8);
  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)keychainReference
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isMandatory
{
  return self->_isMandatory;
}

- (void)setIsMandatory:(BOOL)a3
{
  self->_isMandatory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_keychainReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

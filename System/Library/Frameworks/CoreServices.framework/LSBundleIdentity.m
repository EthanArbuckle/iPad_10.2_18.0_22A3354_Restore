@implementation LSBundleIdentity

- (NSString)identityString
{
  return self->_identityString;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (LSBundleIdentity)initWithIdentityString:(id)a3 personaUniqueString:(id)a4 personaType:(unint64_t)a5
{
  id v8;
  id v9;
  LSBundleIdentity *v10;
  uint64_t v11;
  NSString *identityString;
  uint64_t v13;
  NSString *personaUniqueString;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LSBundleIdentity;
  v10 = -[LSBundleIdentity init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identityString = v10->_identityString;
    v10->_identityString = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v13;

    v10->_personaType = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identityString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSBundleIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  LSBundleIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personaType"));

  if (v5)
  {
    v8 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:](self, "initWithIdentityString:personaUniqueString:personaType:", v5, v6, v7);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identityString;
  id v5;

  identityString = self->_identityString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identityString, CFSTR("identityString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personaUniqueString, CFSTR("personaUniqueString"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_personaType, CFSTR("personaType"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_identityString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *personaUniqueString;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v7 = -[NSString isEqual:](self->_identityString, "isEqual:", v5[1])
      && ((personaUniqueString = self->_personaUniqueString, personaUniqueString == (NSString *)v5[2])
       || -[NSString isEqual:](personaUniqueString, "isEqual:"))
      && self->_personaType == v5[3];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, self->_identityString);
}

+ (id)bundleIdentityForIdentityString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  __objc2_class **v12;
  void *v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("it"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v9 = 0;
    }
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v11)
    {
      if (v11 != 1)
      {
        v13 = 0;
        goto LABEL_15;
      }
      v12 = off_1E103BF08;
    }
    else
    {
      v12 = off_1E103BE00;
    }
    v13 = (void *)objc_msgSend(objc_alloc(*v12), "initWithIdentityString:parsedIdentityStringDictionary:error:", v3, v6, 0);
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (unint64_t)personaType
{
  return self->_personaType;
}

- (NSString)bundleIdentifier
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

@end

@implementation BMAccount

- (BMAccount)initWithAltDSID:(id)a3
{
  id v5;
  BMAccount *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *altDSID;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMAccount.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("altDSID"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BMAccount;
  v6 = -[BMAccount init](&v13, sel_init);
  if (v6)
  {
    +[BMAccount _hashOfString:](BMAccount, "_hashOfString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = objc_msgSend(v5, "copy");
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v9;

  }
  return v6;
}

- (BMAccount)initWithIdentifier:(id)a3
{
  id v5;
  BMAccount *v6;
  uint64_t v7;
  NSString *identifier;
  NSString *altDSID;
  BMAccount *v10;
  NSObject *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMAccount.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (+[BMAccount verifyFormattedLikeIdentifier:](BMAccount, "verifyFormattedLikeIdentifier:", v5))
  {
    v14.receiver = self;
    v14.super_class = (Class)BMAccount;
    v6 = -[BMAccount init](&v14, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;

      altDSID = v6->_altDSID;
      v6->_altDSID = 0;

    }
    self = v6;
    v10 = self;
  }
  else
  {
    __biome_log_for_category(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAccount initWithIdentifier:].cold.1((uint64_t)v5, v11);

    v10 = 0;
  }

  return v10;
}

+ (id)_hashOfString:(id)a3
{
  const char *v3;
  CC_LONG v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  v4 = strlen(v3);
  CC_SHA1(v3, v4, md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
  return v5;
}

+ (BOOL)verifyFormattedLikeIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  BOOL v21;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  CFIndex v28;
  uint64_t v29;
  uint64_t v30;
  CFRange v31;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 40)
  {
    v4 = (__CFString *)v3;
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_31;
    memset(v23, 0, sizeof(v23));
    Length = CFStringGetLength(v4);
    theString = v4;
    v27 = 0;
    v28 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v4);
    CStringPtr = 0;
    v25 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    v29 = 0;
    v30 = 0;
    v26 = CStringPtr;
    if (Length >= 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 64;
      while (1)
      {
        v13 = (unint64_t)v11 >= 4 ? 4 : v11;
        v14 = v28;
        if (v28 <= v11)
        {
          v15 = 0;
        }
        else if (v25)
        {
          v15 = v25[v11 + v27];
        }
        else if (v26)
        {
          v15 = v26[v27 + v11];
        }
        else
        {
          if (v30 <= v11 || v10 > v11)
          {
            v17 = v13 + v9;
            v18 = v12 - v13;
            v19 = v11 - v13;
            v20 = v19 + 64;
            if (v19 + 64 >= v28)
              v20 = v28;
            v29 = v19;
            v30 = v20;
            if (v28 >= v18)
              v14 = v18;
            v31.length = v14 + v17;
            v31.location = v19 + v27;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            v10 = v29;
          }
          v15 = *((_WORD *)v23 + v11 - v10);
        }
        if ((unsigned __int16)(v15 - 48) >= 0xAu && (unsigned __int16)(v15 - 97) >= 6u)
          break;
        ++v11;
        --v9;
        ++v12;
        if (Length == v11)
          goto LABEL_31;
      }
      v21 = 0;
    }
    else
    {
LABEL_31:
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));

}

- (BMAccount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BMAccount *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[BMAccount initWithAltDSID:](self, "initWithAltDSID:", v5);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BMAccount initWithIdentifier:](self, "initWithIdentifier:", v7);

  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_identifier, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMAccount(identifier: %@ altDSID: %@)"), self->_identifier, self->_altDSID);
}

- (NSString)biomeAccountIdentifier
{
  return self->_identifier;
}

- (NSString)accountIdentifier
{
  return self->_altDSID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "BMAccount passed invalid identifier %@", (uint8_t *)&v2, 0xCu);
}

@end

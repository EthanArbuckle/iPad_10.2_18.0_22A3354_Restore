@implementation CTLazuliDestination

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliDestination uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uri = %@"), v4);

  -[CTLazuliDestination extractedUri](self, "extractedUri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", extractedUri = %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isBot = %d"), -[CTLazuliDestination isBot](self, "isBot"));
  -[CTLazuliDestination identities](self, "identities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", identities = %@"), v6);

  -[CTLazuliDestination conversationID](self, "conversationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationID = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliDestination:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;

  v5 = a3;
  -[CTLazuliDestination uri](self, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[CTLazuliDestination extractedUri](self, "extractedUri");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractedUri");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9)
      || (v10 = -[CTLazuliDestination isBot](self, "isBot"), v10 != objc_msgSend(v5, "isBot")))
    {
      v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[CTLazuliDestination identities](self, "identities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v5, "identities"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliDestination identities](self, "identities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identities");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isEqualToCTLazuliAlternateIdentities:", v3))
      {
        v11 = 0;
        goto LABEL_13;
      }
      v17 = 1;
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    -[CTLazuliDestination conversationID](self, "conversationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEqualToString:", v14);

    if (!v17)
    {
LABEL_14:
      if (!v12)

      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliDestination *v4;
  CTLazuliDestination *v5;
  BOOL v6;

  v4 = (CTLazuliDestination *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliDestination isEqualToCTLazuliDestination:](self, "isEqualToCTLazuliDestination:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliDestination *v4;

  v4 = +[CTLazuliDestination allocWithZone:](CTLazuliDestination, "allocWithZone:", a3);
  -[CTLazuliDestination setUri:](v4, "setUri:", self->_uri);
  -[CTLazuliDestination setExtractedUri:](v4, "setExtractedUri:", self->_extractedUri);
  -[CTLazuliDestination setIsBot:](v4, "setIsBot:", self->_isBot);
  -[CTLazuliDestination setIdentities:](v4, "setIdentities:", self->_identities);
  -[CTLazuliDestination setConversationID:](v4, "setConversationID:", self->_conversationID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_uri, CFSTR("kUriKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extractedUri, CFSTR("kExtractedUriKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBot, CFSTR("kIsBotKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identities, CFSTR("kIdentitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_conversationID, CFSTR("kConversationIDKey"));

}

- (CTLazuliDestination)initWithCoder:(id)a3
{
  id v4;
  CTLazuliDestination *v5;
  uint64_t v6;
  NSString *uri;
  uint64_t v8;
  NSString *extractedUri;
  uint64_t v10;
  CTLazuliAlternateIdentities *identities;
  uint64_t v12;
  NSString *conversationID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliDestination;
  v5 = -[CTLazuliDestination init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUriKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    uri = v5->_uri;
    v5->_uri = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExtractedUriKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    extractedUri = v5->_extractedUri;
    v5->_extractedUri = (NSString *)v8;

    v5->_isBot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsBotKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentitiesKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    identities = v5->_identities;
    v5->_identities = (CTLazuliAlternateIdentities *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kConversationIDKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v12;

  }
  return v5;
}

- (CTLazuliDestination)initWithReflection:(const void *)a3
{
  CTLazuliDestination *v4;
  const void *v5;
  uint64_t v6;
  NSString *uri;
  char *v8;
  uint64_t v9;
  NSString *extractedUri;
  CTLazuliAlternateIdentities *v11;
  uint64_t v12;
  CTLazuliAlternateIdentities *identities;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  NSString *conversationID;
  CTLazuliDestination *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CTLazuliDestination;
  v4 = -[CTLazuliDestination init](&v21, sel_init);
  if (!v4)
    return v4;
  if (*((char *)a3 + 23) >= 0)
    v5 = a3;
  else
    v5 = *(const void **)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  uri = v4->_uri;
  v4->_uri = (NSString *)v6;

  if (*((char *)a3 + 47) >= 0)
    v8 = (char *)a3 + 24;
  else
    v8 = (char *)*((_QWORD *)a3 + 3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  extractedUri = v4->_extractedUri;
  v4->_extractedUri = (NSString *)v9;

  v4->_isBot = *((_BYTE *)a3 + 48);
  if (!*((_BYTE *)a3 + 80))
  {
    identities = v4->_identities;
    v4->_identities = 0;
    goto LABEL_12;
  }
  v11 = [CTLazuliAlternateIdentities alloc];
  if (*((_BYTE *)a3 + 80))
  {
    v12 = -[CTLazuliAlternateIdentities initWithReflection:](v11, "initWithReflection:", (char *)a3 + 56);
    identities = v4->_identities;
    v4->_identities = (CTLazuliAlternateIdentities *)v12;
LABEL_12:

    v16 = (char *)*((_QWORD *)a3 + 11);
    v15 = (char *)a3 + 88;
    v14 = v16;
    if (v15[23] >= 0)
      v17 = v15;
    else
      v17 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    conversationID = v4->_conversationID;
    v4->_conversationID = (NSString *)v18;

    return v4;
  }
  result = (CTLazuliDestination *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)extractedUri
{
  return self->_extractedUri;
}

- (void)setExtractedUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (CTLazuliAlternateIdentities)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_identities, a3);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_extractedUri, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end

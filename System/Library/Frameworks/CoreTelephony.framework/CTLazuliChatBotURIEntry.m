@implementation CTLazuliChatBotURIEntry

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotURIEntry addressUri](self, "addressUri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", addressUri = %@"), v4);

  v5 = -[CTLazuliChatBotURIEntry addressUriType](self, "addressUriType");
  v8 = -[CTLazuliChatBotURIEntry addressUriType](self, "addressUriType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", addressUriType = [%ld - %s]"), v5, print_CTLazuliChatBotAddressUriType(&v8));
  v6 = -[CTLazuliChatBotURIEntry label](self, "label");
  v8 = -[CTLazuliChatBotURIEntry label](self, "label");
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = [%ld - %s]"), v6, print_CTLazuliChatBotAddressLabelType(&v8));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotURIEntry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  int64_t v11;
  int64_t v12;

  v7 = a3;
  -[CTLazuliChatBotURIEntry addressUri](self, "addressUri");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "addressUri"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotURIEntry addressUri](self, "addressUri");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressUri");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", v5))
    {
      v10 = 0;
      goto LABEL_11;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v11 = -[CTLazuliChatBotURIEntry addressUriType](self, "addressUriType");
  if (v11 != objc_msgSend(v7, "addressUriType"))
  {
    v10 = 0;
    if (!v9)
      goto LABEL_12;
    goto LABEL_11;
  }
  v12 = -[CTLazuliChatBotURIEntry label](self, "label");
  v10 = v12 == objc_msgSend(v7, "label");
  if ((v9 & 1) != 0)
  {
LABEL_11:

  }
LABEL_12:
  if (!v8)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotURIEntry *v4;
  CTLazuliChatBotURIEntry *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotURIEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotURIEntry isEqualToCTLazuliChatBotURIEntry:](self, "isEqualToCTLazuliChatBotURIEntry:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotURIEntry *v4;

  v4 = +[CTLazuliChatBotURIEntry allocWithZone:](CTLazuliChatBotURIEntry, "allocWithZone:", a3);
  -[CTLazuliChatBotURIEntry setAddressUri:](v4, "setAddressUri:", self->_addressUri);
  -[CTLazuliChatBotURIEntry setAddressUriType:](v4, "setAddressUriType:", self->_addressUriType);
  -[CTLazuliChatBotURIEntry setLabel:](v4, "setLabel:", self->_label);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_addressUri, CFSTR("kAddressUriKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_addressUriType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kAddressUriTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_label);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kLabelKey"));

}

- (CTLazuliChatBotURIEntry)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotURIEntry *v5;
  uint64_t v6;
  NSString *addressUri;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotURIEntry;
  v5 = -[CTLazuliChatBotURIEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAddressUriKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    addressUri = v5->_addressUri;
    v5->_addressUri = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAddressUriTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_addressUriType = objc_msgSend(v8, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_label = objc_msgSend(v9, "longValue");

  }
  return v5;
}

- (CTLazuliChatBotURIEntry)initWithReflection:(const void *)a3
{
  CTLazuliChatBotURIEntry *v4;
  CTLazuliChatBotURIEntry *v5;
  const void *v6;
  uint64_t v7;
  NSString *addressUri;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotURIEntry;
  v4 = -[CTLazuliChatBotURIEntry init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0)
        v6 = a3;
      else
        v6 = *(const void **)a3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      addressUri = v5->_addressUri;
      v5->_addressUri = (NSString *)v7;
    }
    else
    {
      addressUri = v4->_addressUri;
      v4->_addressUri = 0;
    }

    v5->_addressUriType = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 8);
    v5->_label = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 9);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)addressUri
{
  return self->_addressUri;
}

- (void)setAddressUri:(id)a3
{
  objc_storeStrong((id *)&self->_addressUri, a3);
}

- (int64_t)addressUriType
{
  return self->_addressUriType;
}

- (void)setAddressUriType:(int64_t)a3
{
  self->_addressUriType = a3;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressUri, 0);
}

@end

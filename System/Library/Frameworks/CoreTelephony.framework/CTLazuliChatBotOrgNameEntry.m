@implementation CTLazuliChatBotOrgNameEntry

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotOrgNameEntry displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayName = %@"), v4);

  v5 = -[CTLazuliChatBotOrgNameEntry type](self, "type");
  v7 = -[CTLazuliChatBotOrgNameEntry type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v5, print_CTLazuliChatBotOrgNameType(&v7));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgNameEntry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  int64_t v11;

  v7 = a3;
  -[CTLazuliChatBotOrgNameEntry displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 0;
LABEL_7:
      v11 = -[CTLazuliChatBotOrgNameEntry type](self, "type");
      v10 = v11 == objc_msgSend(v7, "type");
      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  -[CTLazuliChatBotOrgNameEntry displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v9 = 1;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotOrgNameEntry *v4;
  CTLazuliChatBotOrgNameEntry *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotOrgNameEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotOrgNameEntry isEqualToCTLazuliChatBotOrgNameEntry:](self, "isEqualToCTLazuliChatBotOrgNameEntry:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotOrgNameEntry *v4;

  v4 = +[CTLazuliChatBotOrgNameEntry allocWithZone:](CTLazuliChatBotOrgNameEntry, "allocWithZone:", a3);
  -[CTLazuliChatBotOrgNameEntry setDisplayName:](v4, "setDisplayName:", self->_displayName);
  -[CTLazuliChatBotOrgNameEntry setType:](v4, "setType:", self->_type);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("kDisplayNameKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kTypeKey"));

}

- (CTLazuliChatBotOrgNameEntry)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotOrgNameEntry *v5;
  uint64_t v6;
  NSString *displayName;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgNameEntry;
  v5 = -[CTLazuliChatBotOrgNameEntry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "longValue");

  }
  return v5;
}

- (CTLazuliChatBotOrgNameEntry)initWithReflection:(const void *)a3
{
  CTLazuliChatBotOrgNameEntry *v4;
  CTLazuliChatBotOrgNameEntry *v5;
  const void *v6;
  uint64_t v7;
  NSString *displayName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgNameEntry;
  v4 = -[CTLazuliChatBotOrgNameEntry init](&v10, sel_init);
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
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v7;
    }
    else
    {
      displayName = v4->_displayName;
      v4->_displayName = 0;
    }

    v5->_type = encode_CTLazuliChatBotMediaLabelType((_DWORD *)a3 + 8);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

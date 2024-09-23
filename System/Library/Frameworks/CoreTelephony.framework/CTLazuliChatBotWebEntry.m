@implementation CTLazuliChatBotWebEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotWebEntry label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = %@"), v4);

  -[CTLazuliChatBotWebEntry url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", url = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotWebEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliChatBotWebEntry label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotWebEntry url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotWebEntry *v4;
  CTLazuliChatBotWebEntry *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotWebEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotWebEntry isEqualToCTLazuliChatBotWebEntry:](self, "isEqualToCTLazuliChatBotWebEntry:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotWebEntry *v4;

  v4 = +[CTLazuliChatBotWebEntry allocWithZone:](CTLazuliChatBotWebEntry, "allocWithZone:", a3);
  -[CTLazuliChatBotWebEntry setLabel:](v4, "setLabel:", self->_label);
  -[CTLazuliChatBotWebEntry setUrl:](v4, "setUrl:", self->_url);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("kLabelKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("kUrlKey"));

}

- (CTLazuliChatBotWebEntry)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotWebEntry *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSURL *url;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotWebEntry;
  v5 = -[CTLazuliChatBotWebEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUrlKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

  }
  return v5;
}

- (CTLazuliChatBotWebEntry)initWithReflection:(const void *)a3
{
  CTLazuliChatBotWebEntry *v4;
  const void *v5;
  uint64_t v6;
  NSString *label;
  void *v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  NSURL *url;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CTLazuliChatBotWebEntry;
  v4 = -[CTLazuliChatBotWebEntry init](&v20, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    label = v4->_label;
    v4->_label = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E98];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v12 = (char *)*((_QWORD *)a3 + 3);
    v10 = (char *)a3 + 24;
    v11 = v12;
    v13 = v10[23];
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v13 >= 0)
      v15 = v10;
    else
      v15 = v11;
    objc_msgSend(v9, "stringWithCString:encoding:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    url = v4->_url;
    v4->_url = (NSURL *)v17;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

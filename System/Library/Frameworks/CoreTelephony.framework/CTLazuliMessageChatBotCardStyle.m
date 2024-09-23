@implementation CTLazuliMessageChatBotCardStyle

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageChatBotCardStyle uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uri = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliMessageChatBotCardStyle uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotCardStyle *v4;
  CTLazuliMessageChatBotCardStyle *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotCardStyle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotCardStyle isEqualToCTLazuliMessageChatBotCardStyle:](self, "isEqualToCTLazuliMessageChatBotCardStyle:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotCardStyle *v4;

  v4 = +[CTLazuliMessageChatBotCardStyle allocWithZone:](CTLazuliMessageChatBotCardStyle, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotCardStyle setUri:](v4, "setUri:", self->_uri);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uri, CFSTR("kUriKey"));
}

- (CTLazuliMessageChatBotCardStyle)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotCardStyle *v5;
  uint64_t v6;
  NSURL *uri;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageChatBotCardStyle;
  v5 = -[CTLazuliMessageChatBotCardStyle init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUriKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    uri = v5->_uri;
    v5->_uri = (NSURL *)v6;

  }
  return v5;
}

- (CTLazuliMessageChatBotCardStyle)initWithReflection:(const void *)a3
{
  CTLazuliMessageChatBotCardStyle *v4;
  void *v5;
  void *v6;
  int v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  NSURL *uri;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardStyle;
  v4 = -[CTLazuliMessageChatBotCardStyle init](&v15, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *((char *)a3 + 23);
    v8 = *(const void **)a3;
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v7 >= 0)
      v10 = a3;
    else
      v10 = v8;
    objc_msgSend(v6, "stringWithCString:encoding:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    uri = v4->_uri;
    v4->_uri = (NSURL *)v12;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
}

@end

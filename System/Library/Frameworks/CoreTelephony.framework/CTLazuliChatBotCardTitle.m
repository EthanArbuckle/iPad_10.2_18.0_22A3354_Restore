@implementation CTLazuliChatBotCardTitle

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCardTitle text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", text = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotCardTitle text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCardTitle *v4;
  CTLazuliChatBotCardTitle *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCardTitle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCardTitle isEqualToCTLazuliChatBotCardTitle:](self, "isEqualToCTLazuliChatBotCardTitle:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCardTitle *v4;

  v4 = +[CTLazuliChatBotCardTitle allocWithZone:](CTLazuliChatBotCardTitle, "allocWithZone:", a3);
  -[CTLazuliChatBotCardTitle setText:](v4, "setText:", self->_text);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("kTextKey"));
}

- (CTLazuliChatBotCardTitle)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCardTitle *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotCardTitle;
  v5 = -[CTLazuliChatBotCardTitle init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliChatBotCardTitle)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCardTitle *v4;
  const void *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotCardTitle;
  v4 = -[CTLazuliChatBotCardTitle init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    text = v4->_text;
    v4->_text = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end

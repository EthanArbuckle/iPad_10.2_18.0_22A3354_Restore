@implementation CTLazuliChatBotPostbackData

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotPostbackData data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", data = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotPostbackData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotPostbackData data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotPostbackData *v4;
  CTLazuliChatBotPostbackData *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotPostbackData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotPostbackData isEqualToCTLazuliChatBotPostbackData:](self, "isEqualToCTLazuliChatBotPostbackData:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotPostbackData *v4;

  v4 = +[CTLazuliChatBotPostbackData allocWithZone:](CTLazuliChatBotPostbackData, "allocWithZone:", a3);
  -[CTLazuliChatBotPostbackData setData:](v4, "setData:", self->_data);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_data, CFSTR("kDataKey"));
}

- (CTLazuliChatBotPostbackData)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotPostbackData *v5;
  uint64_t v6;
  NSString *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotPostbackData;
  v5 = -[CTLazuliChatBotPostbackData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliChatBotPostbackData)initWithReflection:(const void *)a3
{
  CTLazuliChatBotPostbackData *v4;
  const void *v5;
  uint64_t v6;
  NSString *data;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotPostbackData;
  v4 = -[CTLazuliChatBotPostbackData init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

@implementation CTLazuliChatBotTelephoneNumber

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotTelephoneNumber number](self, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", number = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotTelephoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotTelephoneNumber number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotTelephoneNumber *v4;
  CTLazuliChatBotTelephoneNumber *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotTelephoneNumber *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotTelephoneNumber isEqualToCTLazuliChatBotTelephoneNumber:](self, "isEqualToCTLazuliChatBotTelephoneNumber:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotTelephoneNumber *v4;

  v4 = +[CTLazuliChatBotTelephoneNumber allocWithZone:](CTLazuliChatBotTelephoneNumber, "allocWithZone:", a3);
  -[CTLazuliChatBotTelephoneNumber setNumber:](v4, "setNumber:", self->_number);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_number, CFSTR("kNumberKey"));
}

- (CTLazuliChatBotTelephoneNumber)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotTelephoneNumber *v5;
  uint64_t v6;
  NSString *number;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotTelephoneNumber;
  v5 = -[CTLazuliChatBotTelephoneNumber init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNumberKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    number = v5->_number;
    v5->_number = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliChatBotTelephoneNumber)initWithReflection:(const void *)a3
{
  CTLazuliChatBotTelephoneNumber *v4;
  const void *v5;
  uint64_t v6;
  NSString *number;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotTelephoneNumber;
  v4 = -[CTLazuliChatBotTelephoneNumber init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    number = v4->_number;
    v4->_number = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
}

@end

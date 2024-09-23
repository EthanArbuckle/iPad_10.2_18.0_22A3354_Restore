@implementation CTLazuliGroupChatSubject

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatSubject displayString](self, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayString = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatSubject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliGroupChatSubject displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatSubject *v4;
  CTLazuliGroupChatSubject *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatSubject *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatSubject isEqualToCTLazuliGroupChatSubject:](self, "isEqualToCTLazuliGroupChatSubject:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatSubject *v4;

  v4 = +[CTLazuliGroupChatSubject allocWithZone:](CTLazuliGroupChatSubject, "allocWithZone:", a3);
  -[CTLazuliGroupChatSubject setDisplayString:](v4, "setDisplayString:", self->_displayString);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_displayString, CFSTR("kDisplayStringKey"));
}

- (CTLazuliGroupChatSubject)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatSubject *v5;
  uint64_t v6;
  NSString *displayString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatSubject;
  v5 = -[CTLazuliGroupChatSubject init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayStringKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliGroupChatSubject)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatSubject *v4;
  const void *v5;
  uint64_t v6;
  NSString *displayString;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatSubject;
  v4 = -[CTLazuliGroupChatSubject init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    displayString = v4->_displayString;
    v4->_displayString = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end

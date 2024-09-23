@implementation CTLazuliDeepLinkBase64String

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliDeepLinkBase64String base64String](self, "base64String");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", base64String = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliDeepLinkBase64String:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliDeepLinkBase64String base64String](self, "base64String");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64String");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliDeepLinkBase64String *v4;
  CTLazuliDeepLinkBase64String *v5;
  BOOL v6;

  v4 = (CTLazuliDeepLinkBase64String *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliDeepLinkBase64String isEqualToCTLazuliDeepLinkBase64String:](self, "isEqualToCTLazuliDeepLinkBase64String:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliDeepLinkBase64String *v4;

  v4 = +[CTLazuliDeepLinkBase64String allocWithZone:](CTLazuliDeepLinkBase64String, "allocWithZone:", a3);
  -[CTLazuliDeepLinkBase64String setBase64String:](v4, "setBase64String:", self->_base64String);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_base64String, CFSTR("kBase64StringKey"));
}

- (CTLazuliDeepLinkBase64String)initWithCoder:(id)a3
{
  id v4;
  CTLazuliDeepLinkBase64String *v5;
  uint64_t v6;
  NSString *base64String;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64String;
  v5 = -[CTLazuliDeepLinkBase64String init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBase64StringKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    base64String = v5->_base64String;
    v5->_base64String = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliDeepLinkBase64String)initWithReflection:(const void *)a3
{
  CTLazuliDeepLinkBase64String *v4;
  const void *v5;
  uint64_t v6;
  NSString *base64String;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64String;
  v4 = -[CTLazuliDeepLinkBase64String init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    base64String = v4->_base64String;
    v4->_base64String = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)base64String
{
  return self->_base64String;
}

- (void)setBase64String:(id)a3
{
  objc_storeStrong((id *)&self->_base64String, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base64String, 0);
}

@end

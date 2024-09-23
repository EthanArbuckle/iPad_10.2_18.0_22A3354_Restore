@implementation CTLazuliSuggestedActionDialPhoneNumber

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionDialPhoneNumber phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber = %@"), v4);

  -[CTLazuliSuggestedActionDialPhoneNumber fallbackUrl](self, "fallbackUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fallbackUrl = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDialPhoneNumber:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  -[CTLazuliSuggestedActionDialPhoneNumber phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[CTLazuliSuggestedActionDialPhoneNumber fallbackUrl](self, "fallbackUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "fallbackUrl"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliSuggestedActionDialPhoneNumber fallbackUrl](self, "fallbackUrl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fallbackUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionDialPhoneNumber *v4;
  CTLazuliSuggestedActionDialPhoneNumber *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionDialPhoneNumber *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionDialPhoneNumber isEqualToCTLazuliSuggestedActionDialPhoneNumber:](self, "isEqualToCTLazuliSuggestedActionDialPhoneNumber:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionDialPhoneNumber *v4;

  v4 = +[CTLazuliSuggestedActionDialPhoneNumber allocWithZone:](CTLazuliSuggestedActionDialPhoneNumber, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionDialPhoneNumber setPhoneNumber:](v4, "setPhoneNumber:", self->_phoneNumber);
  -[CTLazuliSuggestedActionDialPhoneNumber setFallbackUrl:](v4, "setFallbackUrl:", self->_fallbackUrl);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, CFSTR("kPhoneNumberKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackUrl, CFSTR("kFallbackUrlKey"));

}

- (CTLazuliSuggestedActionDialPhoneNumber)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionDialPhoneNumber *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *fallbackUrl;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliSuggestedActionDialPhoneNumber;
  v5 = -[CTLazuliSuggestedActionDialPhoneNumber init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPhoneNumberKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFallbackUrlKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliSuggestedActionDialPhoneNumber)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionDialPhoneNumber *v4;
  const void *v5;
  uint64_t v6;
  NSString *phoneNumber;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  NSString *fallbackUrl;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionDialPhoneNumber;
  v4 = -[CTLazuliSuggestedActionDialPhoneNumber init](&v15, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v6;

    if (*((_BYTE *)a3 + 48))
    {
      v10 = (char *)*((_QWORD *)a3 + 3);
      v9 = (char *)a3 + 24;
      v8 = v10;
      if (v9[23] >= 0)
        v11 = v9;
      else
        v11 = v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v12;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end

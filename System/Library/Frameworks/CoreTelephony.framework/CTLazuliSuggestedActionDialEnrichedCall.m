@implementation CTLazuliSuggestedActionDialEnrichedCall

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionDialEnrichedCall phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber = %@"), v4);

  -[CTLazuliSuggestedActionDialEnrichedCall fallbackUrl](self, "fallbackUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fallbackUrl = %@"), v5);

  -[CTLazuliSuggestedActionDialEnrichedCall subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", subject = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDialEnrichedCall:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;

  v6 = a3;
  -[CTLazuliSuggestedActionDialEnrichedCall phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[CTLazuliSuggestedActionDialEnrichedCall fallbackUrl](self, "fallbackUrl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "fallbackUrl"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSuggestedActionDialEnrichedCall fallbackUrl](self, "fallbackUrl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackUrl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_14;
    }
    v18 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[CTLazuliSuggestedActionDialEnrichedCall subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "subject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v15 = 0;
      v10 = 1;
LABEL_20:

      if ((v18 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  -[CTLazuliSuggestedActionDialEnrichedCall subject](self, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "isEqualToString:", v13);

  if (!v11)
  {
    v15 = (void *)v16;
    goto LABEL_20;
  }

  if (v18)
  {
LABEL_13:

  }
LABEL_14:
  if (!v9)

LABEL_17:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionDialEnrichedCall *v4;
  CTLazuliSuggestedActionDialEnrichedCall *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionDialEnrichedCall *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionDialEnrichedCall isEqualToCTLazuliSuggestedActionDialEnrichedCall:](self, "isEqualToCTLazuliSuggestedActionDialEnrichedCall:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionDialEnrichedCall *v4;

  v4 = +[CTLazuliSuggestedActionDialEnrichedCall allocWithZone:](CTLazuliSuggestedActionDialEnrichedCall, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionDialEnrichedCall setPhoneNumber:](v4, "setPhoneNumber:", self->_phoneNumber);
  -[CTLazuliSuggestedActionDialEnrichedCall setFallbackUrl:](v4, "setFallbackUrl:", self->_fallbackUrl);
  -[CTLazuliSuggestedActionDialEnrichedCall setSubject:](v4, "setSubject:", self->_subject);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, CFSTR("kPhoneNumberKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackUrl, CFSTR("kFallbackUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("kSubjectKey"));

}

- (CTLazuliSuggestedActionDialEnrichedCall)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionDialEnrichedCall *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *fallbackUrl;
  uint64_t v10;
  NSString *subject;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliSuggestedActionDialEnrichedCall;
  v5 = -[CTLazuliSuggestedActionDialEnrichedCall init](&v13, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSubjectKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;

  }
  return v5;
}

- (CTLazuliSuggestedActionDialEnrichedCall)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionDialEnrichedCall *v4;
  const void *v5;
  uint64_t v6;
  NSString *phoneNumber;
  char *v8;
  uint64_t v9;
  NSString *fallbackUrl;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  NSString *subject;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CTLazuliSuggestedActionDialEnrichedCall;
  v4 = -[CTLazuliSuggestedActionDialEnrichedCall init](&v18, sel_init);
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
      if (*((char *)a3 + 47) >= 0)
        v8 = (char *)a3 + 24;
      else
        v8 = (char *)*((_QWORD *)a3 + 3);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v9;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }

    if (*((_BYTE *)a3 + 80))
    {
      v13 = (char *)*((_QWORD *)a3 + 7);
      v12 = (char *)a3 + 56;
      v11 = v13;
      if (v12[23] >= 0)
        v14 = v12;
      else
        v14 = v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      subject = v4->_subject;
      v4->_subject = (NSString *)v15;
    }
    else
    {
      subject = v4->_subject;
      v4->_subject = 0;
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

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end

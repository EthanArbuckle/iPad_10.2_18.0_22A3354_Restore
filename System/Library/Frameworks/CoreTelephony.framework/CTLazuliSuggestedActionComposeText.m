@implementation CTLazuliSuggestedActionComposeText

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionComposeText phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber = %@"), v4);

  -[CTLazuliSuggestedActionComposeText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", text = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionComposeText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliSuggestedActionComposeText phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliSuggestedActionComposeText text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionComposeText *v4;
  CTLazuliSuggestedActionComposeText *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionComposeText *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionComposeText isEqualToCTLazuliSuggestedActionComposeText:](self, "isEqualToCTLazuliSuggestedActionComposeText:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionComposeText *v4;

  v4 = +[CTLazuliSuggestedActionComposeText allocWithZone:](CTLazuliSuggestedActionComposeText, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionComposeText setPhoneNumber:](v4, "setPhoneNumber:", self->_phoneNumber);
  -[CTLazuliSuggestedActionComposeText setText:](v4, "setText:", self->_text);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, CFSTR("kPhoneNumberKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("kTextKey"));

}

- (CTLazuliSuggestedActionComposeText)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionComposeText *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliSuggestedActionComposeText;
  v5 = -[CTLazuliSuggestedActionComposeText init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPhoneNumberKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliSuggestedActionComposeText)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionComposeText *v4;
  const void *v5;
  uint64_t v6;
  NSString *phoneNumber;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  NSString *text;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionComposeText;
  v4 = -[CTLazuliSuggestedActionComposeText init](&v15, sel_init);
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

    v10 = (char *)*((_QWORD *)a3 + 3);
    v9 = (char *)a3 + 24;
    v8 = v10;
    if (v9[23] >= 0)
      v11 = v9;
    else
      v11 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    text = v4->_text;
    v4->_text = (NSString *)v12;

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
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end

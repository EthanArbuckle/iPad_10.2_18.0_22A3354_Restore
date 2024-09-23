@implementation CTLazuliSuggestedActionComposeVideoRecording

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionComposeVideoRecording phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionComposeVideoRecording:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliSuggestedActionComposeVideoRecording phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionComposeVideoRecording *v4;
  CTLazuliSuggestedActionComposeVideoRecording *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionComposeVideoRecording *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionComposeVideoRecording isEqualToCTLazuliSuggestedActionComposeVideoRecording:](self, "isEqualToCTLazuliSuggestedActionComposeVideoRecording:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionComposeVideoRecording *v4;

  v4 = +[CTLazuliSuggestedActionComposeVideoRecording allocWithZone:](CTLazuliSuggestedActionComposeVideoRecording, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionComposeVideoRecording setPhoneNumber:](v4, "setPhoneNumber:", self->_phoneNumber);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_phoneNumber, CFSTR("kPhoneNumberKey"));
}

- (CTLazuliSuggestedActionComposeVideoRecording)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionComposeVideoRecording *v5;
  uint64_t v6;
  NSString *phoneNumber;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionComposeVideoRecording;
  v5 = -[CTLazuliSuggestedActionComposeVideoRecording init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPhoneNumberKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliSuggestedActionComposeVideoRecording)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionComposeVideoRecording *v4;
  const void *v5;
  uint64_t v6;
  NSString *phoneNumber;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionComposeVideoRecording;
  v4 = -[CTLazuliSuggestedActionComposeVideoRecording init](&v9, sel_init);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end

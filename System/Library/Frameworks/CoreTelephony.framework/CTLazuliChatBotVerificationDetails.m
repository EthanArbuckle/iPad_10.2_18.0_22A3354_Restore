@implementation CTLazuliChatBotVerificationDetails

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", verified = %d"), -[CTLazuliChatBotVerificationDetails verified](self, "verified"));
  -[CTLazuliChatBotVerificationDetails verifiedBy](self, "verifiedBy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", verifiedBy = %@"), v4);

  -[CTLazuliChatBotVerificationDetails expires](self, "expires");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", expires = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotVerificationDetails:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[CTLazuliChatBotVerificationDetails verified](self, "verified");
  if (v5 == objc_msgSend(v4, "verified"))
  {
    -[CTLazuliChatBotVerificationDetails verifiedBy](self, "verifiedBy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verifiedBy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[CTLazuliChatBotVerificationDetails expires](self, "expires");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "expires");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotVerificationDetails *v4;
  CTLazuliChatBotVerificationDetails *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotVerificationDetails *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotVerificationDetails isEqualToCTLazuliChatBotVerificationDetails:](self, "isEqualToCTLazuliChatBotVerificationDetails:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotVerificationDetails *v4;

  v4 = +[CTLazuliChatBotVerificationDetails allocWithZone:](CTLazuliChatBotVerificationDetails, "allocWithZone:", a3);
  -[CTLazuliChatBotVerificationDetails setVerified:](v4, "setVerified:", self->_verified);
  -[CTLazuliChatBotVerificationDetails setVerifiedBy:](v4, "setVerifiedBy:", self->_verifiedBy);
  -[CTLazuliChatBotVerificationDetails setExpires:](v4, "setExpires:", self->_expires);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_verified, CFSTR("kVerifiedKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verifiedBy, CFSTR("kVerifiedByKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expires, CFSTR("kExpiresKey"));

}

- (CTLazuliChatBotVerificationDetails)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotVerificationDetails *v5;
  uint64_t v6;
  NSString *verifiedBy;
  uint64_t v8;
  NSString *expires;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotVerificationDetails;
  v5 = -[CTLazuliChatBotVerificationDetails init](&v11, sel_init);
  if (v5)
  {
    v5->_verified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kVerifiedKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVerifiedByKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    verifiedBy = v5->_verifiedBy;
    v5->_verifiedBy = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExpiresKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    expires = v5->_expires;
    v5->_expires = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliChatBotVerificationDetails)initWithReflection:(const void *)a3
{
  CTLazuliChatBotVerificationDetails *v4;
  CTLazuliChatBotVerificationDetails *v5;
  char *v6;
  uint64_t v7;
  NSString *verifiedBy;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  NSString *expires;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CTLazuliChatBotVerificationDetails;
  v4 = -[CTLazuliChatBotVerificationDetails init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_verified = *(_BYTE *)a3;
    if (*((char *)a3 + 31) >= 0)
      v6 = (char *)a3 + 8;
    else
      v6 = (char *)*((_QWORD *)a3 + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    verifiedBy = v5->_verifiedBy;
    v5->_verifiedBy = (NSString *)v7;

    v11 = (char *)*((_QWORD *)a3 + 4);
    v10 = (char *)a3 + 32;
    v9 = v11;
    if (v10[23] >= 0)
      v12 = v10;
    else
      v12 = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    expires = v5->_expires;
    v5->_expires = (NSString *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (NSString)verifiedBy
{
  return self->_verifiedBy;
}

- (void)setVerifiedBy:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedBy, a3);
}

- (NSString)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_expires, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_verifiedBy, 0);
}

@end

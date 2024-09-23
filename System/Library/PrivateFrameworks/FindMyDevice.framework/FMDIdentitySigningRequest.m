@implementation FMDIdentitySigningRequest

- (FMDIdentitySigningRequest)initWithData:(id)a3
{
  id v4;
  FMDIdentitySigningRequest *v5;
  FMDIdentitySigningRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDIdentitySigningRequest;
  v5 = -[FMDIdentitySigningRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FMDIdentitySigningRequest setDataToSign:](v5, "setDataToSign:", v4);
    -[FMDIdentitySigningRequest setValidityInMinutes:](v6, "setValidityInMinutes:", 10);
  }

  return v6;
}

- (FMDIdentitySigningRequest)initWithCoder:(id)a3
{
  id v4;
  FMDIdentitySigningRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDIdentitySigningRequest;
  v5 = -[FMDIdentitySigningRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataToSign"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDIdentitySigningRequest setDataToSign:](v5, "setDataToSign:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validityInMinutes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDIdentitySigningRequest setValidityInMinutes:](v5, "setValidityInMinutes:", objc_msgSend(v7, "integerValue"));

    -[FMDIdentitySigningRequest setUseSCRT:](v5, "setUseSCRT:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useSCRT")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMDIdentitySigningRequest dataToSign](self, "dataToSign");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("dataToSign"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FMDIdentitySigningRequest validityInMinutes](self, "validityInMinutes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("validityInMinutes"));

  objc_msgSend(v6, "encodeBool:forKey:", -[FMDIdentitySigningRequest useSCRT](self, "useSCRT"), CFSTR("useSCRT"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataToSign
{
  return self->_dataToSign;
}

- (void)setDataToSign:(id)a3
{
  objc_storeStrong((id *)&self->_dataToSign, a3);
}

- (BOOL)useSCRT
{
  return self->_useSCRT;
}

- (void)setUseSCRT:(BOOL)a3
{
  self->_useSCRT = a3;
}

- (int64_t)validityInMinutes
{
  return self->_validityInMinutes;
}

- (void)setValidityInMinutes:(int64_t)a3
{
  self->_validityInMinutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToSign, 0);
}

@end

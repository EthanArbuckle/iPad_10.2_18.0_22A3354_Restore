@implementation SHMediaLibraryInfo

- (SHMediaLibraryInfo)initWithStatus:(int64_t)a3 encrypted:(BOOL)a4
{
  SHMediaLibraryInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryInfo;
  result = -[SHMediaLibraryInfo init](&v7, sel_init);
  if (result)
  {
    result->_status = a3;
    result->_isEncrypted = a4;
  }
  return result;
}

- (SHMediaLibraryInfo)initWithCoder:(id)a3
{
  id v4;
  SHMediaLibraryInfo *v5;
  void *v6;

  v4 = a3;
  v5 = -[SHMediaLibraryInfo initWithStatus:encrypted:](self, "initWithStatus:encrypted:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHMediaLibraryInfoStatus")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SHMediaLibraryInfoEncrypted")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryInfoIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHMediaLibraryInfo setIdentityToken:](v5, "setIdentityToken:", v6);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identityToken;
  id v5;

  identityToken = self->_identityToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identityToken, CFSTR("SHMediaLibraryInfoIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("SHMediaLibraryInfoStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEncrypted, CFSTR("SHMediaLibraryInfoEncrypted"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryInfo *v5;
  void *v6;
  void *v7;

  v5 = -[SHMediaLibraryInfo initWithStatus:encrypted:](+[SHMediaLibraryInfo allocWithZone:](SHMediaLibraryInfo, "allocWithZone:"), "initWithStatus:encrypted:", -[SHMediaLibraryInfo status](self, "status"), -[SHMediaLibraryInfo isEncrypted](self, "isEncrypted"));
  -[SHMediaLibraryInfo identityToken](self, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SHMediaLibraryInfo setIdentityToken:](v5, "setIdentityToken:", v7);

  return v5;
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityToken, 0);
}

@end

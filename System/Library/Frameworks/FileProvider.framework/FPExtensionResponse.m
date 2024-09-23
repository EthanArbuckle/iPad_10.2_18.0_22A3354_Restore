@implementation FPExtensionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPExtensionResponse)initWithCoder:(id)a3
{
  id v4;
  FPExtensionResponse *v5;
  uint64_t v6;
  NSFileProviderDomainVersion *domainVersion;
  uint64_t v8;
  NSDictionary *domainUserInfo;
  uint64_t v10;
  NSString *callDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPExtensionResponse;
  v5 = -[FPExtensionResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v6;

    objc_msgSend(v4, "fp_safeDecodeNSDictionaryForKey:", CFSTR("_domainUserInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    domainUserInfo = v5->_domainUserInfo;
    v5->_domainUserInfo = (NSDictionary *)v8;

    v5->_extensionPid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_extensionPid"));
    v5->_sequenceNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sequenceNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    callDescription = v5->_callDescription;
    v5->_callDescription = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSFileProviderDomainVersion *domainVersion;
  id v5;

  domainVersion = self->_domainVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainVersion, CFSTR("_domainVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainUserInfo, CFSTR("_domainUserInfo"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_extensionPid, CFSTR("_extensionPid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sequenceNumber, CFSTR("_sequenceNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callDescription, CFSTR("_callDescription"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<domver:%@ seqNum:%d:%d call:%@>"), self->_domainVersion, self->_extensionPid, self->_sequenceNumber, self->_callDescription);
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void)setDomainVersion:(id)a3
{
  objc_storeStrong((id *)&self->_domainVersion, a3);
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (void)setDomainUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_domainUserInfo, a3);
}

- (int)extensionPid
{
  return self->_extensionPid;
}

- (void)setExtensionPid:(int)a3
{
  self->_extensionPid = a3;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)callDescription
{
  return self->_callDescription;
}

- (void)setCallDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDescription, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
}

@end

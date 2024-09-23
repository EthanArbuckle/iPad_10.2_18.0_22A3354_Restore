@implementation DCPresentmentProposalReaderAnalytics

- (DCPresentmentProposalReaderAnalytics)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DCPresentmentProposalReaderAnalytics *v16;
  DCPresentmentProposalReaderAnalytics *v17;
  uint64_t v18;
  NSString *untrustedIdentifier;
  uint64_t v20;
  NSString *untrustedOrganization;
  uint64_t v22;
  NSString *untrustedIssuerIdentifier;
  uint64_t v24;
  NSString *untrustedIssuerOrganization;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DCPresentmentProposalReaderAnalytics;
  v16 = -[DCPresentmentProposalReaderAnalytics init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_trusted = a3;
    v18 = objc_msgSend(v12, "copy");
    untrustedIdentifier = v17->_untrustedIdentifier;
    v17->_untrustedIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    untrustedOrganization = v17->_untrustedOrganization;
    v17->_untrustedOrganization = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    untrustedIssuerIdentifier = v17->_untrustedIssuerIdentifier;
    v17->_untrustedIssuerIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    untrustedIssuerOrganization = v17->_untrustedIssuerOrganization;
    v17->_untrustedIssuerOrganization = (NSString *)v24;

  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCPresentmentProposalReaderAnalytics)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentProposalReaderAnalytics *v5;
  uint64_t v6;
  NSString *untrustedIdentifier;
  uint64_t v8;
  NSString *untrustedOrganization;
  uint64_t v10;
  NSString *untrustedIssuerIdentifier;
  uint64_t v12;
  NSString *untrustedIssuerOrganization;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DCPresentmentProposalReaderAnalytics;
  v5 = -[DCPresentmentProposalReaderAnalytics init](&v15, sel_init);
  if (v5)
  {
    v5->_trusted = objc_msgSend(v4, "decodeBoolForKey:", 0x24C307BA8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307BC8);
    v6 = objc_claimAutoreleasedReturnValue();
    untrustedIdentifier = v5->_untrustedIdentifier;
    v5->_untrustedIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307BE8);
    v8 = objc_claimAutoreleasedReturnValue();
    untrustedOrganization = v5->_untrustedOrganization;
    v5->_untrustedOrganization = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307C08);
    v10 = objc_claimAutoreleasedReturnValue();
    untrustedIssuerIdentifier = v5->_untrustedIssuerIdentifier;
    v5->_untrustedIssuerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307C28);
    v12 = objc_claimAutoreleasedReturnValue();
    untrustedIssuerOrganization = v5->_untrustedIssuerOrganization;
    v5->_untrustedIssuerOrganization = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 trusted;
  id v5;

  trusted = self->_trusted;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", trusted, 0x24C307BA8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIdentifier, 0x24C307BC8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedOrganization, 0x24C307BE8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIssuerIdentifier, 0x24C307C08);
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIssuerOrganization, 0x24C307C28);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DCPresentmentProposalReaderAnalytics isTrusted](self, "isTrusted"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[DCPresentmentProposalReaderAnalytics untrustedIdentifier](self, "untrustedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposalReaderAnalytics untrustedOrganization](self, "untrustedOrganization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposalReaderAnalytics untrustedIssuerIdentifier](self, "untrustedIssuerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposalReaderAnalytics untrustedIssuerOrganization](self, "untrustedIssuerOrganization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DCPresentmentProposalReaderAnalytics initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:]([DCPresentmentProposalReaderAnalytics alloc], "initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:", self->_trusted, self->_untrustedIdentifier, self->_untrustedOrganization, self->_untrustedIssuerIdentifier, self->_untrustedIssuerOrganization);
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (NSString)untrustedIdentifier
{
  return self->_untrustedIdentifier;
}

- (NSString)untrustedOrganization
{
  return self->_untrustedOrganization;
}

- (NSString)untrustedIssuerIdentifier
{
  return self->_untrustedIssuerIdentifier;
}

- (NSString)untrustedIssuerOrganization
{
  return self->_untrustedIssuerOrganization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end

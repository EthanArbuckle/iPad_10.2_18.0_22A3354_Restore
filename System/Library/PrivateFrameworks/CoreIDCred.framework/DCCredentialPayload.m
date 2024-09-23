@implementation DCCredentialPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[DCCredentialPayload payloadData](self, "payloadData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, 0x24C307248);

  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialPayload format](self, "format"), 0x24C307228);
  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialPayload protectionType](self, "protectionType"), 0x24C307288);
  -[DCCredentialPayload docType](self, "docType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, 0x24C307268);

  -[DCCredentialPayload createdAt](self, "createdAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, 0x24C3071E8);

  -[DCCredentialPayload updatedAt](self, "updatedAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, 0x24C307208);

  -[DCCredentialPayload validFrom](self, "validFrom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, 0x24C307548);

  -[DCCredentialPayload validUntil](self, "validUntil");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, 0x24C307568);

  -[DCCredentialPayload elementIdentifiersByNamespace](self, "elementIdentifiersByNamespace");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, 0x24C307588);

}

- (DCCredentialPayload)initWithCoder:(id)a3
{
  id v3;
  DCCredentialPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DCCredentialPayload;
  v3 = a3;
  v4 = -[DCCredentialPayload init](&v17, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307248);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setPayloadData:](v4, "setPayloadData:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307268);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setDocType:](v4, "setDocType:", v6);

  -[DCCredentialPayload setFormat:](v4, "setFormat:", objc_msgSend(v3, "decodeIntegerForKey:", 0x24C307228));
  -[DCCredentialPayload setProtectionType:](v4, "setProtectionType:", objc_msgSend(v3, "decodeIntegerForKey:", 0x24C307288));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3071E8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setCreatedAt:](v4, "setCreatedAt:", v7);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307208);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setUpdatedAt:](v4, "setUpdatedAt:", v8);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307548);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setValidFrom:](v4, "setValidFrom:", v9);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307568);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialPayload setValidUntil:](v4, "setValidUntil:", v10);

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, 0x24C307588);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[DCCredentialPayload setElementIdentifiersByNamespace:](v4, "setElementIdentifiersByNamespace:", v15);
  return v4;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (unint64_t)protectionType
{
  return self->_protectionType;
}

- (void)setProtectionType:(unint64_t)a3
{
  self->_protectionType = a3;
}

- (NSString)docType
{
  return self->_docType;
}

- (void)setDocType:(id)a3
{
  objc_storeStrong((id *)&self->_docType, a3);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAt, a3);
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (void)setValidFrom:(id)a3
{
  objc_storeStrong((id *)&self->_validFrom, a3);
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
  objc_storeStrong((id *)&self->_validUntil, a3);
}

- (NSDictionary)elementIdentifiersByNamespace
{
  return self->_elementIdentifiersByNamespace;
}

- (void)setElementIdentifiersByNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_elementIdentifiersByNamespace, a3);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSString)issuingJurisdiction
{
  return self->_issuingJurisdiction;
}

- (void)setIssuingJurisdiction:(id)a3
{
  objc_storeStrong((id *)&self->_issuingJurisdiction, a3);
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
  objc_storeStrong((id *)&self->_payloadData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersByNamespace, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_docType, 0);
}

@end

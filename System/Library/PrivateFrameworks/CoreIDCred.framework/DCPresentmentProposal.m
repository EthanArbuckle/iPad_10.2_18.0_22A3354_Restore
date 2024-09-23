@implementation DCPresentmentProposal

- (DCPresentmentProposal)initWithCredentialIdentifier:(id)a3 presentmentKeyIdentifier:(id)a4 presentmentPublicKey:(id)a5 partition:(id)a6 docType:(id)a7 elements:(id)a8 authACL:(id)a9 readerAuthCertificateData:(id)a10 readerMetadata:(id)a11 readerAnalytics:(id)a12 region:(id)a13 issuingJurisdiction:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  DCPresentmentProposal *v29;
  uint64_t v30;
  NSString *credentialIdentifier;
  uint64_t v32;
  NSString *presentmentKeyIdentifier;
  uint64_t v34;
  NSData *presentmentPublicKey;
  uint64_t v36;
  NSString *partition;
  uint64_t v38;
  NSString *docType;
  uint64_t v40;
  NSDictionary *elements;
  uint64_t v42;
  NSData *authACL;
  uint64_t v44;
  NSData *readerAuthCertificateData;
  uint64_t v46;
  DCPresentmentProposalReaderMetadata *readerMetadata;
  uint64_t v48;
  DCPresentmentProposalReaderAnalytics *readerAnalytics;
  uint64_t v50;
  NSString *region;
  uint64_t v52;
  NSString *issuingJurisdiction;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v58 = a6;
  v57 = a7;
  v56 = a8;
  v22 = v20;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)DCPresentmentProposal;
  v29 = -[DCPresentmentProposal init](&v59, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v19, "copy");
    credentialIdentifier = v29->_credentialIdentifier;
    v29->_credentialIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    presentmentKeyIdentifier = v29->_presentmentKeyIdentifier;
    v29->_presentmentKeyIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    presentmentPublicKey = v29->_presentmentPublicKey;
    v29->_presentmentPublicKey = (NSData *)v34;

    v36 = objc_msgSend(v58, "copy");
    partition = v29->_partition;
    v29->_partition = (NSString *)v36;

    v38 = objc_msgSend(v57, "copy");
    docType = v29->_docType;
    v29->_docType = (NSString *)v38;

    v40 = objc_msgSend(v56, "copy");
    elements = v29->_elements;
    v29->_elements = (NSDictionary *)v40;

    v42 = objc_msgSend(v23, "copy");
    authACL = v29->_authACL;
    v29->_authACL = (NSData *)v42;

    v44 = objc_msgSend(v24, "copy");
    readerAuthCertificateData = v29->_readerAuthCertificateData;
    v29->_readerAuthCertificateData = (NSData *)v44;

    v46 = objc_msgSend(v25, "copy");
    readerMetadata = v29->_readerMetadata;
    v29->_readerMetadata = (DCPresentmentProposalReaderMetadata *)v46;

    v48 = objc_msgSend(v26, "copy");
    readerAnalytics = v29->_readerAnalytics;
    v29->_readerAnalytics = (DCPresentmentProposalReaderAnalytics *)v48;

    v50 = objc_msgSend(v27, "copy");
    region = v29->_region;
    v29->_region = (NSString *)v50;

    v52 = objc_msgSend(v28, "copy");
    issuingJurisdiction = v29->_issuingJurisdiction;
    v29->_issuingJurisdiction = (NSString *)v52;

  }
  return v29;
}

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[DCPresentmentProposal credentialIdentifier](self, "credentialIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, 0x24C307168);

  -[DCPresentmentProposal presentmentKeyIdentifier](self, "presentmentKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, 0x24C3074C8);

  -[DCPresentmentProposal presentmentPublicKey](self, "presentmentPublicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, 0x24C3074E8);

  -[DCPresentmentProposal partition](self, "partition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, 0x24C307188);

  -[DCPresentmentProposal docType](self, "docType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, 0x24C307268);

  -[DCPresentmentProposal elements](self, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, 0x24C307948);

  -[DCPresentmentProposal authACL](self, "authACL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, 0x24C3078C8);

  -[DCPresentmentProposal readerAuthCertificateData](self, "readerAuthCertificateData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, 0x24C3078E8);

  -[DCPresentmentProposal readerMetadata](self, "readerMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, 0x24C307908);

  -[DCPresentmentProposal readerAnalytics](self, "readerAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, 0x24C307928);

  -[DCPresentmentProposal region](self, "region");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, 0x24C3076A8);

  -[DCPresentmentProposal issuingJurisdiction](self, "issuingJurisdiction");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, 0x24C3076C8);

}

- (DCPresentmentProposal)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentProposal *v5;
  uint64_t v6;
  NSString *credentialIdentifier;
  uint64_t v8;
  NSString *presentmentKeyIdentifier;
  uint64_t v10;
  NSData *presentmentPublicKey;
  uint64_t v12;
  NSString *partition;
  uint64_t v14;
  NSString *docType;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *elements;
  uint64_t v23;
  NSData *readerAuthCertificateData;
  uint64_t v25;
  NSData *authACL;
  uint64_t v27;
  DCPresentmentProposalReaderMetadata *readerMetadata;
  uint64_t v29;
  DCPresentmentProposalReaderAnalytics *readerAnalytics;
  uint64_t v31;
  NSString *region;
  uint64_t v33;
  NSString *issuingJurisdiction;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DCPresentmentProposal;
  v5 = -[DCPresentmentProposal init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307168);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3074C8);
    v8 = objc_claimAutoreleasedReturnValue();
    presentmentKeyIdentifier = v5->_presentmentKeyIdentifier;
    v5->_presentmentKeyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3074E8);
    v10 = objc_claimAutoreleasedReturnValue();
    presentmentPublicKey = v5->_presentmentPublicKey;
    v5->_presentmentPublicKey = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307188);
    v12 = objc_claimAutoreleasedReturnValue();
    partition = v5->_partition;
    v5->_partition = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307268);
    v14 = objc_claimAutoreleasedReturnValue();
    docType = v5->_docType;
    v5->_docType = (NSString *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, 0x24C307948);
    v21 = objc_claimAutoreleasedReturnValue();
    elements = v5->_elements;
    v5->_elements = (NSDictionary *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3078E8);
    v23 = objc_claimAutoreleasedReturnValue();
    readerAuthCertificateData = v5->_readerAuthCertificateData;
    v5->_readerAuthCertificateData = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3078C8);
    v25 = objc_claimAutoreleasedReturnValue();
    authACL = v5->_authACL;
    v5->_authACL = (NSData *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307908);
    v27 = objc_claimAutoreleasedReturnValue();
    readerMetadata = v5->_readerMetadata;
    v5->_readerMetadata = (DCPresentmentProposalReaderMetadata *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307928);
    v29 = objc_claimAutoreleasedReturnValue();
    readerAnalytics = v5->_readerAnalytics;
    v5->_readerAnalytics = (DCPresentmentProposalReaderAnalytics *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3076A8);
    v31 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3076C8);
    v33 = objc_claimAutoreleasedReturnValue();
    issuingJurisdiction = v5->_issuingJurisdiction;
    v5->_issuingJurisdiction = (NSString *)v33;

  }
  return v5;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal credentialIdentifier](self, "credentialIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal presentmentKeyIdentifier](self, "presentmentKeyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal partition](self, "partition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal docType](self, "docType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal elements](self, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal readerMetadata](self, "readerMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal readerAnalytics](self, "readerAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal region](self, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentProposal issuingJurisdiction](self, "issuingJurisdiction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %p; credentialIdentifier = %@; presentmentKeyIdentifier = %@; partition = %@; docType = %@; elements = %@; readerMetadata = %@; readerAnalytics = %@; region = %@; issuingJurisdiction = %@>"),
    v15,
    self,
    v14,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)readerIdentifier
{
  void *v2;
  void *v3;

  -[DCPresentmentProposal readerMetadata](self, "readerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)readerOrganization
{
  void *v2;
  void *v3;

  -[DCPresentmentProposal readerMetadata](self, "readerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "organization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)readerOrganizationalUnit
{
  void *v2;
  void *v3;

  -[DCPresentmentProposal readerMetadata](self, "readerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "organizationalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (NSString)presentmentKeyIdentifier
{
  return self->_presentmentKeyIdentifier;
}

- (NSData)presentmentPublicKey
{
  return self->_presentmentPublicKey;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSString)docType
{
  return self->_docType;
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (NSData)authACL
{
  return self->_authACL;
}

- (NSData)readerAuthCertificateData
{
  return self->_readerAuthCertificateData;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)issuingJurisdiction
{
  return self->_issuingJurisdiction;
}

- (DCPresentmentProposalReaderMetadata)readerMetadata
{
  return self->_readerMetadata;
}

- (DCPresentmentProposalReaderAnalytics)readerAnalytics
{
  return self->_readerAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerAnalytics, 0);
  objc_storeStrong((id *)&self->_readerMetadata, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_readerAuthCertificateData, 0);
  objc_storeStrong((id *)&self->_authACL, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_presentmentPublicKey, 0);
  objc_storeStrong((id *)&self->_presentmentKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end

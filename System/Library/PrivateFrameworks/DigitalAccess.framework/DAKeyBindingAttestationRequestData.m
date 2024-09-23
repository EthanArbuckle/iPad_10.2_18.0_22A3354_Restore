@implementation DAKeyBindingAttestationRequestData

- (DAKeyBindingAttestationRequestData)initWithSharingSessionIdentifier:(id)a3 subCaAttestation:(id)a4 casd:(id)a5 rsaCertData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DAKeyBindingAttestationRequestData *v15;
  DAKeyBindingAttestationRequestData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DAKeyBindingAttestationRequestData;
  v15 = -[DAKeyBindingAttestationRequestData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v16->_subCaAttestation, a4);
    objc_storeStrong((id *)&v16->_casd, a5);
    objc_storeStrong((id *)&v16->_rsaCertData, a6);
  }

  return v16;
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
  id v8;

  v4 = a3;
  -[DAKeyBindingAttestationRequestData sharingSessionIdentifier](self, "sharingSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingSessionIdentifier"));

  -[DAKeyBindingAttestationRequestData subCaAttestation](self, "subCaAttestation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subCaAttestation"));

  -[DAKeyBindingAttestationRequestData casd](self, "casd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("casd"));

  -[DAKeyBindingAttestationRequestData rsaCertData](self, "rsaCertData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rsaCertData"));

}

- (DAKeyBindingAttestationRequestData)initWithCoder:(id)a3
{
  id v4;
  DAKeyBindingAttestationRequestData *v5;
  uint64_t v6;
  NSUUID *sharingSessionIdentifier;
  uint64_t v8;
  NSData *subCaAttestation;
  uint64_t v10;
  NSData *casd;
  uint64_t v12;
  NSData *rsaCertData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeyBindingAttestationRequestData;
  v5 = -[DAKeyBindingAttestationRequestData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subCaAttestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    subCaAttestation = v5->_subCaAttestation;
    v5->_subCaAttestation = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("casd"));
    v10 = objc_claimAutoreleasedReturnValue();
    casd = v5->_casd;
    v5->_casd = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsaCertData"));
    v12 = objc_claimAutoreleasedReturnValue();
    rsaCertData = v5->_rsaCertData;
    v5->_rsaCertData = (NSData *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sharing Session ID    : %@\n"), self->_sharingSessionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SubCA attestation     : %@\n"), self->_subCaAttestation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CASD                  : %@\n"), self->_casd);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RSA cert data         : %@\n"), self->_rsaCertData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSData)subCaAttestation
{
  return self->_subCaAttestation;
}

- (NSData)casd
{
  return self->_casd;
}

- (NSData)rsaCertData
{
  return self->_rsaCertData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rsaCertData, 0);
  objc_storeStrong((id *)&self->_casd, 0);
  objc_storeStrong((id *)&self->_subCaAttestation, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end

@implementation DIIdentityProvisioningAttestations

- (DIIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8
{
  id v15;
  id v16;
  id v17;
  DIIdentityProvisioningAttestations *v18;
  DIIdentityProvisioningAttestations *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DIIdentityProvisioningAttestations;
  v18 = -[DIIdentityProvisioningAttestations init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_progenitorKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeys, a7);
    objc_storeStrong((id *)&v19->_serverAttestedProvisioningData, a8);
  }

  return v19;
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
  id v10;

  v4 = a3;
  -[DIIdentityProvisioningAttestations authorizationKeyAttestation](self, "authorizationKeyAttestation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authorizationKeyAttestation"));

  -[DIIdentityProvisioningAttestations deviceEncryptionKeyAttestation](self, "deviceEncryptionKeyAttestation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceEncryptionKeyAttestation"));

  -[DIIdentityProvisioningAttestations deviceEncryptionKeyAuthorization](self, "deviceEncryptionKeyAuthorization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deviceEncryptionKeyAuthorization"));

  -[DIIdentityProvisioningAttestations progenitorKeyCASDAttestation](self, "progenitorKeyCASDAttestation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("progenitorKeyCASDAttestation"));

  -[DIIdentityProvisioningAttestations transactionKeys](self, "transactionKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("transactionKeys"));

  -[DIIdentityProvisioningAttestations serverAttestedProvisioningData](self, "serverAttestedProvisioningData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("serverAttestedProvisioningData"));

}

- (DIIdentityProvisioningAttestations)initWithCoder:(id)a3
{
  id v4;
  DIIdentityProvisioningAttestations *v5;
  uint64_t v6;
  NSArray *authorizationKeyAttestation;
  uint64_t v8;
  NSArray *deviceEncryptionKeyAttestation;
  uint64_t v10;
  NSData *deviceEncryptionKeyAuthorization;
  uint64_t v12;
  NSData *progenitorKeyCASDAttestation;
  uint64_t v14;
  NSArray *transactionKeys;
  uint64_t v16;
  NSData *serverAttestedProvisioningData;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DIIdentityProvisioningAttestations;
  v5 = -[DIIdentityProvisioningAttestations init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("authorizationKeyAttestation"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("deviceEncryptionKeyAttestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeyAttestation = v5->_deviceEncryptionKeyAttestation;
    v5->_deviceEncryptionKeyAttestation = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("deviceEncryptionKeyAuthorization"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeyAuthorization = v5->_deviceEncryptionKeyAuthorization;
    v5->_deviceEncryptionKeyAuthorization = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("progenitorKeyCASDAttestation"));
    v12 = objc_claimAutoreleasedReturnValue();
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("transactionKeys"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("serverAttestedProvisioningData"));
    v16 = objc_claimAutoreleasedReturnValue();
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v16;

  }
  return v5;
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (NSArray)deviceEncryptionKeyAttestation
{
  return self->_deviceEncryptionKeyAttestation;
}

- (NSData)deviceEncryptionKeyAuthorization
{
  return self->_deviceEncryptionKeyAuthorization;
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
}

@end

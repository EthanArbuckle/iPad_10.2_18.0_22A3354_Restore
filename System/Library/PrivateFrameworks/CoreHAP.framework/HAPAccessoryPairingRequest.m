@implementation HAPAccessoryPairingRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_13;
  -[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_13;
  v10 = -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent");
  if (v10 != objc_msgSend(v6, "requiresUserConsent"))
    goto LABEL_13;
  -[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownershipToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();

  if (!v13)
    goto LABEL_13;
  -[HAPAccessoryPairingRequest ssid](self, "ssid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ssid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HMFEqualObjects();

  if (!v16)
    goto LABEL_13;
  -[HAPAccessoryPairingRequest psk](self, "psk");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "psk");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if (!v19)
    goto LABEL_13;
  -[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isoCountryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  if (!v22)
    goto LABEL_13;
  -[HAPAccessoryPairingRequest chipFabricID](self, "chipFabricID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chipFabricID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HMFEqualObjects();

  if (v25)
  {
    v26 = -[HAPAccessoryPairingRequest doNetworkScan](self, "doNetworkScan");
    v27 = v26 ^ objc_msgSend(v6, "doNetworkScan") ^ 1;
  }
  else
  {
LABEL_13:
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  -[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent");
  -[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;

  -[HAPAccessoryPairingRequest ssid](self, "ssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  -[HAPAccessoryPairingRequest psk](self, "psk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  -[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");

  -[HAPAccessoryPairingRequest chipFabricID](self, "chipFabricID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  return v13 ^ v15 ^ -[HAPAccessoryPairingRequest doNetworkScan](self, "doNetworkScan");
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPAccessoryPairingRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[HAPAccessoryPairingRequest init](+[HAPAccessoryPairingRequest allocWithZone:](HAPAccessoryPairingRequest, "allocWithZone:", a3), "init");
  -[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setPairingIdentity:](v4, "setPairingIdentity:", v5);

  -[HAPAccessoryPairingRequest setRequiresUserConsent:](v4, "setRequiresUserConsent:", -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent"));
  -[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setOwnershipToken:](v4, "setOwnershipToken:", v6);

  -[HAPAccessoryPairingRequest ssid](self, "ssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setSsid:](v4, "setSsid:", v7);

  -[HAPAccessoryPairingRequest psk](self, "psk");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setPsk:](v4, "setPsk:", v8);

  -[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setIsoCountryCode:](v4, "setIsoCountryCode:", v9);

  -[HAPAccessoryPairingRequest chipFabricID](self, "chipFabricID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest setChipFabricID:](v4, "setChipFabricID:", v10);

  -[HAPAccessoryPairingRequest setDoNetworkScan:](v4, "setDoNetworkScan:", -[HAPAccessoryPairingRequest doNetworkScan](self, "doNetworkScan"));
  return v4;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Pairing Identity"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent"))
  {
    v8 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Requires User Consent"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  -[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Ownership Token"), v13);
    objc_msgSend(v3, "addObject:", v14);

  }
  -[HAPAccessoryPairingRequest ssid](self, "ssid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest ssid](self, "ssid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("SSID"), v17);
    objc_msgSend(v3, "addObject:", v18);

  }
  -[HAPAccessoryPairingRequest psk](self, "psk");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest psk](self, "psk");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("PSK"), v21);
    objc_msgSend(v3, "addObject:", v22);

  }
  -[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("ISO Country Code"), v25);
    objc_msgSend(v3, "addObject:", v26);

  }
  -[HAPAccessoryPairingRequest chipFabricID](self, "chipFabricID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest chipFabricID](self, "chipFabricID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithName:value:", CFSTR("CHIP Fabric ID"), v29);
    objc_msgSend(v3, "addObject:", v30);

  }
  if (-[HAPAccessoryPairingRequest doNetworkScan](self, "doNetworkScan"))
  {
    v31 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HAPAccessoryPairingRequest doNetworkScan](self, "doNetworkScan");
    HMFBooleanToString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithName:value:", CFSTR("Do Network Scan"), v32);
    objc_msgSend(v3, "addObject:", v33);

  }
  v34 = (void *)objc_msgSend(v3, "copy");

  return v34;
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSData)ownershipToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwnershipToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)ssid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSsid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)psk
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPsk:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)chipFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChipFabricID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)doNetworkScan
{
  return self->_doNetworkScan;
}

- (void)setDoNetworkScan:(BOOL)a3
{
  self->_doNetworkScan = a3;
}

- (BOOL)isOwnerPairing
{
  return self->_ownerPairing;
}

- (void)setOwnerPairing:(BOOL)a3
{
  self->_ownerPairing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFabricID, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

@end

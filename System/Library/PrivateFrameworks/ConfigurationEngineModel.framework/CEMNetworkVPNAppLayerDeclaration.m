@implementation CEMNetworkVPNAppLayerDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.vpn.applayer");
}

+ (id)profileType
{
  return CFSTR("com.apple.vpn.managed.applayer");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VPNUUID");
  v6[1] = CFSTR("CellularSliceUUID");
  v6[2] = CFSTR("SafariDomains");
  v6[3] = CFSTR("OnDemandMatchAppEnabled");
  v6[4] = CFSTR("SMBDomains");
  v6[5] = CFSTR("ProviderType");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withSafariDomains:(id)a6 withOnDemandMatchAppEnabled:(id)a7 withSMBDomains:(id)a8 withProviderType:(id)a9
{
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;

  v14 = a3;
  v15 = (__CFString *)a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.network.vpn.applayer"));
  if (v14)
  {
    objc_msgSend(v21, "setDeclarationIdentifier:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeclarationIdentifier:", v23);

  }
  objc_msgSend(v21, "setPayloadVPNUUID:", v20);

  objc_msgSend(v21, "setPayloadCellularSliceUUID:", v19);
  objc_msgSend(v21, "setPayloadSafariDomains:", v18);

  objc_msgSend(v21, "setPayloadOnDemandMatchAppEnabled:", v17);
  objc_msgSend(v21, "setPayloadSMBDomains:", v16);

  if (v15)
    v24 = v15;
  else
    v24 = CFSTR("app-proxy");
  objc_msgSend(v21, "setPayloadProviderType:", v24);

  objc_msgSend(v21, "updateServerHash");
  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.network.vpn.applayer"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadVPNUUID:", v9);

  objc_msgSend(v10, "setPayloadCellularSliceUUID:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSString *v13;
  id v14;
  NSString *payloadVPNUUID;
  NSString *v16;
  NSString *payloadCellularSliceUUID;
  NSArray *v18;
  NSArray *payloadSafariDomains;
  NSNumber *v20;
  NSNumber *payloadOnDemandMatchAppEnabled;
  NSArray *v22;
  NSArray *payloadSMBDomains;
  NSString *v24;
  NSString *payloadProviderType;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNAppLayerDeclaration allowedPayloadKeys](CEMNetworkVPNAppLayerDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VPNUUID"), 1, 0, &v32);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadVPNUUID = self->_payloadVPNUUID;
  self->_payloadVPNUUID = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CellularSliceUUID"), 1, 0, &v31);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadCellularSliceUUID = self->_payloadCellularSliceUUID;
    self->_payloadCellularSliceUUID = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SafariDomains"), &__block_literal_global_24, 0, 0, &v30);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadSafariDomains = self->_payloadSafariDomains;
      self->_payloadSafariDomains = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchAppEnabled"), 0, 0, &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadOnDemandMatchAppEnabled = self->_payloadOnDemandMatchAppEnabled;
        self->_payloadOnDemandMatchAppEnabled = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SMBDomains"), &__block_literal_global_27, 0, 0, &v28);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadSMBDomains = self->_payloadSMBDomains;
          self->_payloadSMBDomains = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProviderType"), 0, CFSTR("app-proxy"), &v27);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadProviderType = self->_payloadProviderType;
            self->_payloadProviderType = v24;

          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __54__CEMNetworkVPNAppLayerDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CEMNetworkVPNAppLayerDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("VPNUUID"), self->_payloadVPNUUID, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CellularSliceUUID"), self->_payloadCellularSliceUUID, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SafariDomains"), self->_payloadSafariDomains, &__block_literal_global_30, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OnDemandMatchAppEnabled"), self->_payloadOnDemandMatchAppEnabled, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SMBDomains"), self->_payloadSMBDomains, &__block_literal_global_31_0, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProviderType"), self->_payloadProviderType, 0, CFSTR("app-proxy"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __71__CEMNetworkVPNAppLayerDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __71__CEMNetworkVPNAppLayerDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
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
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMNetworkVPNAppLayerDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVPNUUID, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadCellularSliceUUID, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSArray copy](self->_payloadSafariDomains, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadOnDemandMatchAppEnabled, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSArray copy](self->_payloadSMBDomains, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadProviderType, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadVPNUUID
{
  return self->_payloadVPNUUID;
}

- (void)setPayloadVPNUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadCellularSliceUUID
{
  return self->_payloadCellularSliceUUID;
}

- (void)setPayloadCellularSliceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadSafariDomains
{
  return self->_payloadSafariDomains;
}

- (void)setPayloadSafariDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadOnDemandMatchAppEnabled
{
  return self->_payloadOnDemandMatchAppEnabled;
}

- (void)setPayloadOnDemandMatchAppEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadSMBDomains
{
  return self->_payloadSMBDomains;
}

- (void)setPayloadSMBDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadProviderType
{
  return self->_payloadProviderType;
}

- (void)setPayloadProviderType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProviderType, 0);
  objc_storeStrong((id *)&self->_payloadSMBDomains, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchAppEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSafariDomains, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
}

@end

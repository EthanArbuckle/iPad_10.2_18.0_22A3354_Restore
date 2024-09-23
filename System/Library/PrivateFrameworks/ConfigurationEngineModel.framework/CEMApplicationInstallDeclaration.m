@implementation CEMApplicationInstallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.application.install");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Application");
  v6[1] = CFSTR("Mandatory");
  v6[2] = CFSTR("InstallWhenActivated");
  v6[3] = CFSTR("RemoveWhenDeactivated");
  v6[4] = CFSTR("ManageData");
  v6[5] = CFSTR("VPNUUID");
  v6[6] = CFSTR("CellularSliceUUID");
  v6[7] = CFSTR("PreventDataBackup");
  v6[8] = CFSTR("Configuration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
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
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMApplicationInstallDeclaration payloadApplication](self, "payloadApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("application"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7 withManageData:(id)a8 withVPNUUID:(id)a9 withCellularSliceUUID:(id)a10 withPreventDataBackup:(id)a11 withConfiguration:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v34;
  id v35;

  v16 = a3;
  v35 = a12;
  v17 = a11;
  v18 = a10;
  v34 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDeclarationType:", CFSTR("com.apple.configuration.application.install"));
  if (v16)
  {
    objc_msgSend(v24, "setDeclarationIdentifier:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDeclarationIdentifier:", v26);

    v16 = 0;
  }
  objc_msgSend(v24, "setPayloadApplication:", v23);

  objc_msgSend(v24, "setPayloadMandatory:", v22);
  v27 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v28 = v21;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setPayloadInstallWhenActivated:", v28);

  if (v20)
    v29 = v20;
  else
    v29 = v27;
  objc_msgSend(v24, "setPayloadRemoveWhenDeactivated:", v29);

  if (v19)
    v30 = v19;
  else
    v30 = v27;
  objc_msgSend(v24, "setPayloadManageData:", v30);

  objc_msgSend(v24, "setPayloadVPNUUID:", v34);
  objc_msgSend(v24, "setPayloadCellularSliceUUID:", v18);

  if (v17)
    v31 = v17;
  else
    v31 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v24, "setPayloadPreventDataBackup:", v31);

  objc_msgSend(v24, "setPayloadConfiguration:", v35);
  objc_msgSend(v24, "updateServerHash");

  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.application.install"));
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
  objc_msgSend(v10, "setPayloadApplication:", v9);

  objc_msgSend(v10, "setPayloadMandatory:", v8);
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
  NSString *payloadApplication;
  NSNumber *v16;
  NSNumber *payloadMandatory;
  NSNumber *v18;
  NSNumber *payloadInstallWhenActivated;
  NSNumber *v20;
  NSNumber *payloadRemoveWhenDeactivated;
  NSNumber *v22;
  NSNumber *payloadManageData;
  NSString *v24;
  NSString *payloadVPNUUID;
  NSString *v26;
  NSString *payloadCellularSliceUUID;
  NSNumber *v28;
  NSNumber *payloadPreventDataBackup;
  CEMAnyPayload *v30;
  CEMAnyPayload *payloadConfiguration;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationInstallDeclaration allowedPayloadKeys](CEMApplicationInstallDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v41 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Application"), 1, 0, &v41);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v41;
  payloadApplication = self->_payloadApplication;
  self->_payloadApplication = v13;

  if (!v14)
  {
    v40 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Mandatory"), 1, 0, &v40);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    payloadMandatory = self->_payloadMandatory;
    self->_payloadMandatory = v16;

    if (!v14)
    {
      v39 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("InstallWhenActivated"), 0, MEMORY[0x24BDBD1C8], &v39);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v39;
      payloadInstallWhenActivated = self->_payloadInstallWhenActivated;
      self->_payloadInstallWhenActivated = v18;

      if (!v14)
      {
        v38 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoveWhenDeactivated"), 0, MEMORY[0x24BDBD1C8], &v38);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v38;
        payloadRemoveWhenDeactivated = self->_payloadRemoveWhenDeactivated;
        self->_payloadRemoveWhenDeactivated = v20;

        if (!v14)
        {
          v37 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ManageData"), 0, MEMORY[0x24BDBD1C8], &v37);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          payloadManageData = self->_payloadManageData;
          self->_payloadManageData = v22;

          if (!v14)
          {
            v36 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VPNUUID"), 0, 0, &v36);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v36;
            payloadVPNUUID = self->_payloadVPNUUID;
            self->_payloadVPNUUID = v24;

            if (!v14)
            {
              v35 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CellularSliceUUID"), 0, 0, &v35);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v35;
              payloadCellularSliceUUID = self->_payloadCellularSliceUUID;
              self->_payloadCellularSliceUUID = v26;

              if (!v14)
              {
                v34 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreventDataBackup"), 0, MEMORY[0x24BDBD1C0], &v34);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v34;
                payloadPreventDataBackup = self->_payloadPreventDataBackup;
                self->_payloadPreventDataBackup = v28;

                if (!v14)
                {
                  v33 = 0;
                  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Configuration"), objc_opt_class(), 0, 0, &v33);
                  v30 = (CEMAnyPayload *)objc_claimAutoreleasedReturnValue();
                  v14 = v33;
                  payloadConfiguration = self->_payloadConfiguration;
                  self->_payloadConfiguration = v30;

                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  NSString *payloadApplication;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadApplication = self->_payloadApplication;
  if (payloadApplication)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadApplication);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Application"), payloadApplication, v7, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Application"), 0, 0, &stru_24C63AAC0);
  }
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Mandatory"), self->_payloadMandatory, 1, 0);
  v8 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("InstallWhenActivated"), self->_payloadInstallWhenActivated, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoveWhenDeactivated"), self->_payloadRemoveWhenDeactivated, 0, v8);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ManageData"), self->_payloadManageData, 0, v8);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("VPNUUID"), self->_payloadVPNUUID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CellularSliceUUID"), self->_payloadCellularSliceUUID, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PreventDataBackup"), self->_payloadPreventDataBackup, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Configuration"), self->_payloadConfiguration, &__block_literal_global_4, 0, 0);
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

uint64_t __71__CEMApplicationInstallDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CEMApplicationInstallDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadApplication, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadMandatory, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadInstallWhenActivated, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadRemoveWhenDeactivated, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadManageData, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadVPNUUID, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadCellularSliceUUID, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadPreventDataBackup, "copy");
  v20 = (void *)v4[18];
  v4[18] = v19;

  v21 = -[CEMAnyPayload copy](self->_payloadConfiguration, "copy");
  v22 = (void *)v4[19];
  v4[19] = v21;

  return v4;
}

- (NSString)payloadApplication
{
  return self->_payloadApplication;
}

- (void)setPayloadApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadMandatory
{
  return self->_payloadMandatory;
}

- (void)setPayloadMandatory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadInstallWhenActivated
{
  return self->_payloadInstallWhenActivated;
}

- (void)setPayloadInstallWhenActivated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadRemoveWhenDeactivated
{
  return self->_payloadRemoveWhenDeactivated;
}

- (void)setPayloadRemoveWhenDeactivated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadManageData
{
  return self->_payloadManageData;
}

- (void)setPayloadManageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadVPNUUID
{
  return self->_payloadVPNUUID;
}

- (void)setPayloadVPNUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadCellularSliceUUID
{
  return self->_payloadCellularSliceUUID;
}

- (void)setPayloadCellularSliceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadContentFilterUUID
{
  return self->_payloadContentFilterUUID;
}

- (void)setPayloadContentFilterUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadDNSProxyUUID
{
  return self->_payloadDNSProxyUUID;
}

- (void)setPayloadDNSProxyUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadPreventDataBackup
{
  return self->_payloadPreventDataBackup;
}

- (void)setPayloadPreventDataBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CEMAnyPayload)payloadConfiguration
{
  return self->_payloadConfiguration;
}

- (void)setPayloadConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPreventDataBackup, 0);
  objc_storeStrong((id *)&self->_payloadDNSProxyUUID, 0);
  objc_storeStrong((id *)&self->_payloadContentFilterUUID, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
  objc_storeStrong((id *)&self->_payloadManageData, 0);
  objc_storeStrong((id *)&self->_payloadRemoveWhenDeactivated, 0);
  objc_storeStrong((id *)&self->_payloadInstallWhenActivated, 0);
  objc_storeStrong((id *)&self->_payloadMandatory, 0);
  objc_storeStrong((id *)&self->_payloadApplication, 0);
}

@end

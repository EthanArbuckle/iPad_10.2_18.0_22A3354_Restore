@implementation CEMApplicationStoreMacOSDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.application.store.macos");
}

+ (id)profileType
{
  return CFSTR("com.apple.appstore");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("restrict-store-require-admin-to-install");
  v6[1] = CFSTR("restrict-store-softwareupdate-only");
  v6[2] = CFSTR("restrict-store-disable-app-adoption");
  v6[3] = CFSTR("DisableSoftwareUpdateNotifications");
  v6[4] = CFSTR("restrict-store-mdm-install-softwareupdate-only");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withRestrictStoreRequireAdminToInstall:(id)a4 withRestrictStoreSoftwareupdateOnly:(id)a5 withRestrictStoreDisableAppAdoption:(id)a6 withDisableSoftwareUpdateNotifications:(id)a7 withRestrictStoreMdmInstallSoftwareupdateOnly:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.application.store.macos"));
  if (v13)
  {
    objc_msgSend(v19, "setDeclarationIdentifier:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeclarationIdentifier:", v21);

  }
  v22 = (void *)MEMORY[0x24BDBD1C0];
  if (v18)
    v23 = v18;
  else
    v23 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setPayloadRestrictStoreRequireAdminToInstall:", v23);

  if (v17)
    v24 = v17;
  else
    v24 = v22;
  objc_msgSend(v19, "setPayloadRestrictStoreSoftwareupdateOnly:", v24);

  if (v16)
    v25 = v16;
  else
    v25 = v22;
  objc_msgSend(v19, "setPayloadRestrictStoreDisableAppAdoption:", v25);

  if (v15)
    v26 = v15;
  else
    v26 = v22;
  objc_msgSend(v19, "setPayloadDisableSoftwareUpdateNotifications:", v26);

  if (v14)
    v27 = v14;
  else
    v27 = v22;
  objc_msgSend(v19, "setPayloadRestrictStoreMdmInstallSoftwareupdateOnly:", v27);

  objc_msgSend(v19, "updateServerHash");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.application.store.macos"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
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
  NSNumber *v13;
  id v14;
  NSNumber *payloadRestrictStoreRequireAdminToInstall;
  NSNumber *v16;
  NSNumber *payloadRestrictStoreSoftwareupdateOnly;
  NSNumber *v18;
  NSNumber *payloadRestrictStoreDisableAppAdoption;
  NSNumber *v20;
  NSNumber *payloadDisableSoftwareUpdateNotifications;
  NSNumber *v22;
  NSNumber *payloadRestrictStoreMdmInstallSoftwareupdateOnly;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationStoreMacOSDeclaration allowedPayloadKeys](CEMApplicationStoreMacOSDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("restrict-store-require-admin-to-install"), 0, MEMORY[0x24BDBD1C0], &v29);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadRestrictStoreRequireAdminToInstall = self->_payloadRestrictStoreRequireAdminToInstall;
  self->_payloadRestrictStoreRequireAdminToInstall = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("restrict-store-softwareupdate-only"), 0, MEMORY[0x24BDBD1C0], &v28);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadRestrictStoreSoftwareupdateOnly = self->_payloadRestrictStoreSoftwareupdateOnly;
    self->_payloadRestrictStoreSoftwareupdateOnly = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("restrict-store-disable-app-adoption"), 0, MEMORY[0x24BDBD1C0], &v27);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadRestrictStoreDisableAppAdoption = self->_payloadRestrictStoreDisableAppAdoption;
      self->_payloadRestrictStoreDisableAppAdoption = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableSoftwareUpdateNotifications"), 0, MEMORY[0x24BDBD1C0], &v26);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadDisableSoftwareUpdateNotifications = self->_payloadDisableSoftwareUpdateNotifications;
        self->_payloadDisableSoftwareUpdateNotifications = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("restrict-store-mdm-install-softwareupdate-only"), 0, MEMORY[0x24BDBD1C0], &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadRestrictStoreMdmInstallSoftwareupdateOnly = self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly;
          self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly = v22;

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
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("restrict-store-require-admin-to-install"), self->_payloadRestrictStoreRequireAdminToInstall, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("restrict-store-softwareupdate-only"), self->_payloadRestrictStoreSoftwareupdateOnly, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("restrict-store-disable-app-adoption"), self->_payloadRestrictStoreDisableAppAdoption, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableSoftwareUpdateNotifications"), self->_payloadDisableSoftwareUpdateNotifications, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("restrict-store-mdm-install-softwareupdate-only"), self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMApplicationStoreMacOSDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadRestrictStoreRequireAdminToInstall, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadRestrictStoreSoftwareupdateOnly, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadRestrictStoreDisableAppAdoption, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadDisableSoftwareUpdateNotifications, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSNumber)payloadRestrictStoreRequireAdminToInstall
{
  return self->_payloadRestrictStoreRequireAdminToInstall;
}

- (void)setPayloadRestrictStoreRequireAdminToInstall:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadRestrictStoreSoftwareupdateOnly
{
  return self->_payloadRestrictStoreSoftwareupdateOnly;
}

- (void)setPayloadRestrictStoreSoftwareupdateOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadRestrictStoreDisableAppAdoption
{
  return self->_payloadRestrictStoreDisableAppAdoption;
}

- (void)setPayloadRestrictStoreDisableAppAdoption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadDisableSoftwareUpdateNotifications
{
  return self->_payloadDisableSoftwareUpdateNotifications;
}

- (void)setPayloadDisableSoftwareUpdateNotifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadRestrictStoreMdmInstallSoftwareupdateOnly
{
  return self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly;
}

- (void)setPayloadRestrictStoreMdmInstallSoftwareupdateOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly, 0);
  objc_storeStrong((id *)&self->_payloadDisableSoftwareUpdateNotifications, 0);
  objc_storeStrong((id *)&self->_payloadRestrictStoreDisableAppAdoption, 0);
  objc_storeStrong((id *)&self->_payloadRestrictStoreSoftwareupdateOnly, 0);
  objc_storeStrong((id *)&self->_payloadRestrictStoreRequireAdminToInstall, 0);
}

@end

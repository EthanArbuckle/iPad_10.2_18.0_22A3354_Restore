@implementation CEMSystemAllowedMediaDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.disk.allowed");
}

+ (id)profileType
{
  return CFSTR("com.apple.systemuiserver");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("logout-eject");
  v6[1] = CFSTR("mount-controls");
  v6[2] = CFSTR("unmount-controls");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
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

+ (id)buildWithIdentifier:(id)a3 withLogoutEject:(id)a4 withMountControls:(id)a5 withUnmountControls:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.system.disk.allowed"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadLogoutEject:", v12);

  objc_msgSend(v13, "setPayloadMountControls:", v11);
  objc_msgSend(v13, "setPayloadUnmountControls:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.disk.allowed"));
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
  CEMSystemAllowedMediaDeclaration_MediaItems *v13;
  id v14;
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadLogoutEject;
  CEMSystemAllowedMediaDeclaration_MediaItems *v16;
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadMountControls;
  CEMSystemAllowedMediaDeclaration_MediaItems *v18;
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadUnmountControls;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemAllowedMediaDeclaration allowedPayloadKeys](CEMSystemAllowedMediaDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("logout-eject"), objc_opt_class(), 0, 0, &v23);
  v13 = (CEMSystemAllowedMediaDeclaration_MediaItems *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadLogoutEject = self->_payloadLogoutEject;
  self->_payloadLogoutEject = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("mount-controls"), objc_opt_class(), 0, 0, &v22);
    v16 = (CEMSystemAllowedMediaDeclaration_MediaItems *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadMountControls = self->_payloadMountControls;
    self->_payloadMountControls = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("unmount-controls"), objc_opt_class(), 0, 0, &v21);
      v18 = (CEMSystemAllowedMediaDeclaration_MediaItems *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadUnmountControls = self->_payloadUnmountControls;
      self->_payloadUnmountControls = v18;

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
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadLogoutEject;
  uint64_t v7;
  id v8;
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadMountControls;
  id v10;
  CEMSystemAllowedMediaDeclaration_MediaItems *payloadUnmountControls;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadLogoutEject = self->_payloadLogoutEject;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v19[3] = &unk_24C638560;
  v8 = v4;
  v20 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("logout-eject"), payloadLogoutEject, v19, 0, 0);
  payloadMountControls = self->_payloadMountControls;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v17[3] = &unk_24C638560;
  v10 = v8;
  v18 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("mount-controls"), payloadMountControls, v17, 0, 0);
  payloadUnmountControls = self->_payloadUnmountControls;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v15[3] = &unk_24C638560;
  v16 = v10;
  v12 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("unmount-controls"), payloadUnmountControls, v15, 0, 0);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMSystemAllowedMediaDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[CEMSystemAllowedMediaDeclaration_MediaItems copy](self->_payloadLogoutEject, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMSystemAllowedMediaDeclaration_MediaItems copy](self->_payloadMountControls, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[CEMSystemAllowedMediaDeclaration_MediaItems copy](self->_payloadUnmountControls, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadLogoutEject
{
  return self->_payloadLogoutEject;
}

- (void)setPayloadLogoutEject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadMountControls
{
  return self->_payloadMountControls;
}

- (void)setPayloadMountControls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadUnmountControls
{
  return self->_payloadUnmountControls;
}

- (void)setPayloadUnmountControls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUnmountControls, 0);
  objc_storeStrong((id *)&self->_payloadMountControls, 0);
  objc_storeStrong((id *)&self->_payloadLogoutEject, 0);
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_7(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_8(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_9(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_10(uint64_t a1, void *a2)
{
  return a2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_11(uint64_t a1, void *a2)
{
  return a2;
}

@end

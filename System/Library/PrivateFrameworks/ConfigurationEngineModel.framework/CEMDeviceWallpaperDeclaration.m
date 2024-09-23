@implementation CEMDeviceWallpaperDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.device.wallpaper");
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
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("LockScreenAsset");
  v6[1] = CFSTR("HomeScreenAsset");
  v6[2] = CFSTR("allowWallpaperModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowWallpaperModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withLockScreenAsset:(id)a4 withHomeScreenAsset:(id)a5 withAllowWallpaperModification:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.device.wallpaper"));
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
  objc_msgSend(v13, "setPayloadLockScreenAsset:", v12);

  objc_msgSend(v13, "setPayloadHomeScreenAsset:", v11);
  if (v10)
    v16 = v10;
  else
    v16 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v13, "setPayloadAllowWallpaperModification:", v16);

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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.device.wallpaper"));
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
  NSString *v13;
  id v14;
  NSString *payloadLockScreenAsset;
  NSString *v16;
  NSString *payloadHomeScreenAsset;
  NSNumber *v18;
  NSNumber *payloadAllowWallpaperModification;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceWallpaperDeclaration allowedPayloadKeys](CEMDeviceWallpaperDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LockScreenAsset"), 0, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadLockScreenAsset = self->_payloadLockScreenAsset;
  self->_payloadLockScreenAsset = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HomeScreenAsset"), 0, 0, &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadHomeScreenAsset = self->_payloadHomeScreenAsset;
    self->_payloadHomeScreenAsset = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowWallpaperModification"), 0, MEMORY[0x24BDBD1C8], &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadAllowWallpaperModification = self->_payloadAllowWallpaperModification;
      self->_payloadAllowWallpaperModification = v18;

    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LockScreenAsset"), self->_payloadLockScreenAsset, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HomeScreenAsset"), self->_payloadHomeScreenAsset, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowWallpaperModification"), self->_payloadAllowWallpaperModification, 0, MEMORY[0x24BDBD1C8]);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  v12.super_class = (Class)CEMDeviceWallpaperDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadLockScreenAsset, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadHomeScreenAsset, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowWallpaperModification, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSString)payloadLockScreenAsset
{
  return self->_payloadLockScreenAsset;
}

- (void)setPayloadLockScreenAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadHomeScreenAsset
{
  return self->_payloadHomeScreenAsset;
}

- (void)setPayloadHomeScreenAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowWallpaperModification
{
  return self->_payloadAllowWallpaperModification;
}

- (void)setPayloadAllowWallpaperModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowWallpaperModification, 0);
  objc_storeStrong((id *)&self->_payloadHomeScreenAsset, 0);
  objc_storeStrong((id *)&self->_payloadLockScreenAsset, 0);
}

@end

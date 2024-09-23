@implementation CEMApplicationEnterpriseDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.asset.application.enterprise");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Descriptor");
  v6[1] = CFSTR("BundleIdentifier");
  v6[2] = CFSTR("AppPackage");
  v6[3] = CFSTR("AppPackage-Hash-MD5");
  v6[4] = CFSTR("DisplayImage");
  v6[5] = CFSTR("DisplayImage-Hash-MD5");
  v6[6] = CFSTR("FullSizeImage");
  v6[7] = CFSTR("FullSizeImage-Hash-MD5");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7 withDisplayImage:(id)a8 withDisplayImageHashMD5:(id)a9 withFullSizeImage:(id)a10 withFullSizeImageHashMD5:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  id v29;

  v16 = a3;
  v29 = a11;
  v27 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setDeclarationType:", CFSTR("com.apple.asset.application.enterprise"));
  if (v16)
  {
    objc_msgSend(v23, "setDeclarationIdentifier:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDeclarationIdentifier:", v25);

  }
  objc_msgSend(v23, "setPayloadDescriptor:", v22, v27);

  objc_msgSend(v23, "setPayloadBundleIdentifier:", v21);
  objc_msgSend(v23, "setPayloadAppPackage:", v20);

  objc_msgSend(v23, "setPayloadAppPackageHashMD5:", v19);
  objc_msgSend(v23, "setPayloadDisplayImage:", v18);

  objc_msgSend(v23, "setPayloadDisplayImageHashMD5:", v17);
  objc_msgSend(v23, "setPayloadFullSizeImage:", v28);

  objc_msgSend(v23, "setPayloadFullSizeImageHashMD5:", v29);
  objc_msgSend(v23, "updateServerHash");

  return v23;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.asset.application.enterprise"));
  if (v11)
  {
    objc_msgSend(v16, "setDeclarationIdentifier:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeclarationIdentifier:", v18);

  }
  objc_msgSend(v16, "setPayloadDescriptor:", v15);

  objc_msgSend(v16, "setPayloadBundleIdentifier:", v14);
  objc_msgSend(v16, "setPayloadAppPackage:", v13);

  objc_msgSend(v16, "setPayloadAppPackageHashMD5:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
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
  CEMAssetBaseDescriptor *v13;
  id v14;
  CEMAssetBaseDescriptor *payloadDescriptor;
  NSString *v16;
  NSString *payloadBundleIdentifier;
  CEMApplicationEnterpriseDeclaration_AppPackage *v18;
  CEMApplicationEnterpriseDeclaration_AppPackage *payloadAppPackage;
  NSString *v20;
  NSString *payloadAppPackageHashMD5;
  NSString *v22;
  NSString *payloadDisplayImage;
  NSString *v24;
  NSString *payloadDisplayImageHashMD5;
  NSString *v26;
  NSString *payloadFullSizeImage;
  NSString *v28;
  NSString *payloadFullSizeImageHashMD5;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationEnterpriseDeclaration allowedPayloadKeys](CEMApplicationEnterpriseDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v38 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Descriptor"), objc_opt_class(), 1, 0, &v38);
  v13 = (CEMAssetBaseDescriptor *)objc_claimAutoreleasedReturnValue();
  v14 = v38;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    v37 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v37);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    payloadBundleIdentifier = self->_payloadBundleIdentifier;
    self->_payloadBundleIdentifier = v16;

    if (!v14)
    {
      v36 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("AppPackage"), objc_opt_class(), 1, 0, &v36);
      v18 = (CEMApplicationEnterpriseDeclaration_AppPackage *)objc_claimAutoreleasedReturnValue();
      v14 = v36;
      payloadAppPackage = self->_payloadAppPackage;
      self->_payloadAppPackage = v18;

      if (!v14)
      {
        v35 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AppPackage-Hash-MD5"), 1, 0, &v35);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v35;
        payloadAppPackageHashMD5 = self->_payloadAppPackageHashMD5;
        self->_payloadAppPackageHashMD5 = v20;

        if (!v14)
        {
          v34 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisplayImage"), 0, 0, &v34);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v34;
          payloadDisplayImage = self->_payloadDisplayImage;
          self->_payloadDisplayImage = v22;

          if (!v14)
          {
            v33 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisplayImage-Hash-MD5"), 0, 0, &v33);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v33;
            payloadDisplayImageHashMD5 = self->_payloadDisplayImageHashMD5;
            self->_payloadDisplayImageHashMD5 = v24;

            if (!v14)
            {
              v32 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FullSizeImage"), 0, 0, &v32);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v32;
              payloadFullSizeImage = self->_payloadFullSizeImage;
              self->_payloadFullSizeImage = v26;

              if (!v14)
              {
                v31 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FullSizeImage-Hash-MD5"), 0, 0, &v31);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v31;
                payloadFullSizeImageHashMD5 = self->_payloadFullSizeImageHashMD5;
                self->_payloadFullSizeImageHashMD5 = v28;

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
  CEMAssetBaseDescriptor *payloadDescriptor;
  uint64_t v7;
  id v8;
  CEMApplicationEnterpriseDeclaration_AppPackage *payloadAppPackage;
  id v10;
  NSString *payloadDisplayImage;
  void *v12;
  NSString *payloadFullSizeImage;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadDescriptor = self->_payloadDescriptor;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v19[3] = &unk_24C638560;
  v8 = v4;
  v20 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Descriptor"), payloadDescriptor, v19, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("BundleIdentifier"), self->_payloadBundleIdentifier, 1, 0);
  payloadAppPackage = self->_payloadAppPackage;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v17[3] = &unk_24C638560;
  v10 = v8;
  v18 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("AppPackage"), payloadAppPackage, v17, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AppPackage-Hash-MD5"), self->_payloadAppPackageHashMD5, 1, 0);
  payloadDisplayImage = self->_payloadDisplayImage;
  if (payloadDisplayImage)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", self->_payloadDisplayImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("DisplayImage"), payloadDisplayImage, v12, CFSTR("<url>"), 0, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("DisplayImage"), 0, 0, CFSTR("<url>"), 0, &stru_24C63AAC0);
  }
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisplayImage-Hash-MD5"), self->_payloadDisplayImageHashMD5, 0, 0);
  payloadFullSizeImage = self->_payloadFullSizeImage;
  if (payloadFullSizeImage)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", self->_payloadFullSizeImage);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("FullSizeImage"), payloadFullSizeImage, v14, CFSTR("<url>"), 0, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("FullSizeImage"), 0, 0, CFSTR("<url>"), 0, &stru_24C63AAC0);
  }
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("FullSizeImage-Hash-MD5"), self->_payloadFullSizeImageHashMD5, 0, 0);
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

uint64_t __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CEMApplicationEnterpriseDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[CEMAssetBaseDescriptor copy](self->_payloadDescriptor, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadBundleIdentifier, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[CEMApplicationEnterpriseDeclaration_AppPackage copy](self->_payloadAppPackage, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadAppPackageHashMD5, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadDisplayImage, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadDisplayImageHashMD5, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadFullSizeImage, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSString copy](self->_payloadFullSizeImageHashMD5, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (CEMAssetBaseDescriptor)payloadDescriptor
{
  return self->_payloadDescriptor;
}

- (void)setPayloadDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMApplicationEnterpriseDeclaration_AppPackage)payloadAppPackage
{
  return self->_payloadAppPackage;
}

- (void)setPayloadAppPackage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadAppPackageHashMD5
{
  return self->_payloadAppPackageHashMD5;
}

- (void)setPayloadAppPackageHashMD5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadDisplayImage
{
  return self->_payloadDisplayImage;
}

- (void)setPayloadDisplayImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadDisplayImageHashMD5
{
  return self->_payloadDisplayImageHashMD5;
}

- (void)setPayloadDisplayImageHashMD5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadFullSizeImage
{
  return self->_payloadFullSizeImage;
}

- (void)setPayloadFullSizeImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadFullSizeImageHashMD5
{
  return self->_payloadFullSizeImageHashMD5;
}

- (void)setPayloadFullSizeImageHashMD5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFullSizeImageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadFullSizeImage, 0);
  objc_storeStrong((id *)&self->_payloadDisplayImageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadDisplayImage, 0);
  objc_storeStrong((id *)&self->_payloadAppPackageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadAppPackage, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

uint64_t __68__CEMApplicationEnterpriseDeclaration_AppPackage_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __85__CEMApplicationEnterpriseDeclaration_AppPackage_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end

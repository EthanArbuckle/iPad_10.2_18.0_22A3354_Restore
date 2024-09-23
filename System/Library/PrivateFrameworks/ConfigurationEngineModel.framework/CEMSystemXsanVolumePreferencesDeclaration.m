@implementation CEMSystemXsanVolumePreferencesDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.xsan.volumes");
}

+ (id)profileType
{
  return CFSTR("com.apple.xsan.preferences");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("onlyMount");
  v6[1] = CFSTR("denyMount");
  v6[2] = CFSTR("denyDLC");
  v6[3] = CFSTR("preferDLC");
  v6[4] = CFSTR("useDLC");
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withOnlyMount:(id)a4 withDenyMount:(id)a5 withDenyDLC:(id)a6 withPreferDLC:(id)a7 withUseDLC:(id)a8
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
  id v22;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.system.xsan.volumes"));
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
  objc_msgSend(v19, "setPayloadOnlyMount:", v18);

  objc_msgSend(v19, "setPayloadDenyMount:", v17);
  objc_msgSend(v19, "setPayloadDenyDLC:", v16);

  objc_msgSend(v19, "setPayloadPreferDLC:", v15);
  if (v14)
    v22 = v14;
  else
    v22 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setPayloadUseDLC:", v22);

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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.xsan.volumes"));
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
  NSArray *v13;
  id v14;
  NSArray *payloadOnlyMount;
  NSArray *v16;
  NSArray *payloadDenyMount;
  NSArray *v18;
  NSArray *payloadDenyDLC;
  NSArray *v20;
  NSArray *payloadPreferDLC;
  NSNumber *v22;
  NSNumber *payloadUseDLC;
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

  +[CEMSystemXsanVolumePreferencesDeclaration allowedPayloadKeys](CEMSystemXsanVolumePreferencesDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("onlyMount"), &__block_literal_global_41, 0, 0, &v29);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadOnlyMount = self->_payloadOnlyMount;
  self->_payloadOnlyMount = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("denyMount"), &__block_literal_global_21_1, 0, 0, &v28);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadDenyMount = self->_payloadDenyMount;
    self->_payloadDenyMount = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("denyDLC"), &__block_literal_global_22_1, 0, 0, &v27);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadDenyDLC = self->_payloadDenyDLC;
      self->_payloadDenyDLC = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("preferDLC"), &__block_literal_global_23_2, 0, 0, &v26);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadPreferDLC = self->_payloadPreferDLC;
        self->_payloadPreferDLC = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("useDLC"), 0, MEMORY[0x24BDBD1C0], &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadUseDLC = self->_payloadUseDLC;
          self->_payloadUseDLC = v22;

        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("onlyMount"), self->_payloadOnlyMount, &__block_literal_global_26_0, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("denyMount"), self->_payloadDenyMount, &__block_literal_global_27_4, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("denyDLC"), self->_payloadDenyDLC, &__block_literal_global_28_0, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("preferDLC"), self->_payloadPreferDLC, &__block_literal_global_29_1, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("useDLC"), self->_payloadUseDLC, 0, MEMORY[0x24BDBD1C0]);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSystemXsanVolumePreferencesDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadOnlyMount, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_payloadDenyMount, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSArray copy](self->_payloadDenyDLC, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadPreferDLC, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadUseDLC, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSArray)payloadOnlyMount
{
  return self->_payloadOnlyMount;
}

- (void)setPayloadOnlyMount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadDenyMount
{
  return self->_payloadDenyMount;
}

- (void)setPayloadDenyMount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadDenyDLC
{
  return self->_payloadDenyDLC;
}

- (void)setPayloadDenyDLC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadPreferDLC
{
  return self->_payloadPreferDLC;
}

- (void)setPayloadPreferDLC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadUseDLC
{
  return self->_payloadUseDLC;
}

- (void)setPayloadUseDLC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUseDLC, 0);
  objc_storeStrong((id *)&self->_payloadPreferDLC, 0);
  objc_storeStrong((id *)&self->_payloadDenyDLC, 0);
  objc_storeStrong((id *)&self->_payloadDenyMount, 0);
  objc_storeStrong((id *)&self->_payloadOnlyMount, 0);
}

@end

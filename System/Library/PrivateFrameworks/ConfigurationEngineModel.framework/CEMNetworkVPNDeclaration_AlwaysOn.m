@implementation CEMNetworkVPNDeclaration_AlwaysOn

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("TunnelConfigurations");
  v6[1] = CFSTR("UIToggleEnabled");
  v6[2] = CFSTR("ServiceExceptions");
  v6[3] = CFSTR("AllowCaptiveWebSheet");
  v6[4] = CFSTR("AllowAllCaptiveNetworkPlugins");
  v6[5] = CFSTR("AllowedCaptiveNetworkPlugins");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithTunnelConfigurations:(id)a3 withUIToggleEnabled:(id)a4 withServiceExceptions:(id)a5 withAllowCaptiveWebSheet:(id)a6 withAllowAllCaptiveNetworkPlugins:(id)a7 withAllowedCaptiveNetworkPlugins:(id)a8
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

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setPayloadTunnelConfigurations:", v18);

  if (v17)
    v20 = v17;
  else
    v20 = &unk_24C69CD58;
  objc_msgSend(v19, "setPayloadUIToggleEnabled:", v20);

  objc_msgSend(v19, "setPayloadServiceExceptions:", v16);
  if (v15)
    v21 = v15;
  else
    v21 = &unk_24C69CD58;
  objc_msgSend(v19, "setPayloadAllowCaptiveWebSheet:", v21);

  if (v14)
    v22 = v14;
  else
    v22 = &unk_24C69CD58;
  objc_msgSend(v19, "setPayloadAllowAllCaptiveNetworkPlugins:", v22);

  objc_msgSend(v19, "setPayloadAllowedCaptiveNetworkPlugins:", v13);
  return v19;
}

+ (id)buildRequiredOnlyWithTunnelConfigurations:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadTunnelConfigurations:", v3);

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
  NSArray *payloadTunnelConfigurations;
  NSNumber *v16;
  NSNumber *payloadUIToggleEnabled;
  NSArray *v18;
  NSArray *payloadServiceExceptions;
  NSNumber *v20;
  NSNumber *payloadAllowCaptiveWebSheet;
  NSNumber *v22;
  NSNumber *payloadAllowAllCaptiveNetworkPlugins;
  NSArray *v24;
  NSArray *payloadAllowedCaptiveNetworkPlugins;
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

  +[CEMNetworkVPNDeclaration_AlwaysOn allowedPayloadKeys](CEMNetworkVPNDeclaration_AlwaysOn, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("TunnelConfigurations"), objc_opt_class(), 0, 1, 0, &v32);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadTunnelConfigurations = self->_payloadTunnelConfigurations;
  self->_payloadTunnelConfigurations = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UIToggleEnabled"), 0, &unk_24C69CD58, &v31);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadUIToggleEnabled = self->_payloadUIToggleEnabled;
    self->_payloadUIToggleEnabled = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("ServiceExceptions"), objc_opt_class(), 0, 0, 0, &v30);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadServiceExceptions = self->_payloadServiceExceptions;
      self->_payloadServiceExceptions = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowCaptiveWebSheet"), 0, &unk_24C69CD58, &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadAllowCaptiveWebSheet = self->_payloadAllowCaptiveWebSheet;
        self->_payloadAllowCaptiveWebSheet = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowAllCaptiveNetworkPlugins"), 0, &unk_24C69CD58, &v28);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadAllowAllCaptiveNetworkPlugins = self->_payloadAllowAllCaptiveNetworkPlugins;
          self->_payloadAllowAllCaptiveNetworkPlugins = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("AllowedCaptiveNetworkPlugins"), objc_opt_class(), 0, 0, 0, &v27);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadAllowedCaptiveNetworkPlugins = self->_payloadAllowedCaptiveNetworkPlugins;
            self->_payloadAllowedCaptiveNetworkPlugins = v24;

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
  NSArray *payloadTunnelConfigurations;
  uint64_t v7;
  id v8;
  NSArray *payloadServiceExceptions;
  id v10;
  NSArray *payloadAllowedCaptiveNetworkPlugins;
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
  payloadTunnelConfigurations = self->_payloadTunnelConfigurations;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke;
  v19[3] = &unk_24C639728;
  v8 = v4;
  v20 = v8;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("TunnelConfigurations"), payloadTunnelConfigurations, v19, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UIToggleEnabled"), self->_payloadUIToggleEnabled, 0, &unk_24C69CD58);
  payloadServiceExceptions = self->_payloadServiceExceptions;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_2;
  v17[3] = &unk_24C639750;
  v10 = v8;
  v18 = v10;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("ServiceExceptions"), payloadServiceExceptions, v17, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowCaptiveWebSheet"), self->_payloadAllowCaptiveWebSheet, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowAllCaptiveNetworkPlugins"), self->_payloadAllowAllCaptiveNetworkPlugins, 0, &unk_24C69CD58);
  payloadAllowedCaptiveNetworkPlugins = self->_payloadAllowedCaptiveNetworkPlugins;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_3;
  v15[3] = &unk_24C639778;
  v16 = v10;
  v12 = v10;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("AllowedCaptiveNetworkPlugins"), payloadAllowedCaptiveNetworkPlugins, v15, 0, 0);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
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
  v18.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOn;
  v4 = -[CEMPayloadBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadTunnelConfigurations, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadUIToggleEnabled, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadServiceExceptions, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowCaptiveWebSheet, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowAllCaptiveNetworkPlugins, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadAllowedCaptiveNetworkPlugins, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSArray)payloadTunnelConfigurations
{
  return self->_payloadTunnelConfigurations;
}

- (void)setPayloadTunnelConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadUIToggleEnabled
{
  return self->_payloadUIToggleEnabled;
}

- (void)setPayloadUIToggleEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadServiceExceptions
{
  return self->_payloadServiceExceptions;
}

- (void)setPayloadServiceExceptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadAllowCaptiveWebSheet
{
  return self->_payloadAllowCaptiveWebSheet;
}

- (void)setPayloadAllowCaptiveWebSheet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadAllowAllCaptiveNetworkPlugins
{
  return self->_payloadAllowAllCaptiveNetworkPlugins;
}

- (void)setPayloadAllowAllCaptiveNetworkPlugins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadAllowedCaptiveNetworkPlugins
{
  return self->_payloadAllowedCaptiveNetworkPlugins;
}

- (void)setPayloadAllowedCaptiveNetworkPlugins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_payloadAllowCaptiveWebSheet, 0);
  objc_storeStrong((id *)&self->_payloadServiceExceptions, 0);
  objc_storeStrong((id *)&self->_payloadUIToggleEnabled, 0);
  objc_storeStrong((id *)&self->_payloadTunnelConfigurations, 0);
}

@end

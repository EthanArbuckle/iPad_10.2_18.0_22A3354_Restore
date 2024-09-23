@implementation CEMNetworkVPNDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.vpn");
}

+ (id)profileType
{
  return CFSTR("com.apple.vpn.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VPNType");
  v6[1] = CFSTR("VPNSubType");
  v6[2] = CFSTR("UserDefinedName");
  v6[3] = CFSTR("VendorConfig");
  v6[4] = CFSTR("VPN");
  v6[5] = CFSTR("IPv4");
  v6[6] = CFSTR("PPP");
  v6[7] = CFSTR("IPSec");
  v6[8] = CFSTR("IKEv2");
  v6[9] = CFSTR("Proxies");
  v6[10] = CFSTR("AlwaysOn");
  v6[11] = CFSTR("DisconnectOnIdle");
  v6[12] = CFSTR("DisconnectOnIdleTimer");
  v6[13] = CFSTR("DNS");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
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

+ (id)buildWithIdentifier:(id)a3 withVPNType:(id)a4 withVPNSubType:(id)a5 withUserDefinedName:(id)a6 withVendorConfig:(id)a7 withVPN:(id)a8 withIPv4:(id)a9 withPPP:(id)a10 withIPSec:(id)a11 withIKEv2:(id)a12 withProxies:(id)a13 withAlwaysOn:(id)a14 withDisconnectOnIdle:(id)a15 withDisconnectOnIdleTimer:(id)a16 withDNS:(id)a17
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v17 = a3;
  v43 = a17;
  v42 = a16;
  v41 = a15;
  v40 = a14;
  v39 = a13;
  v18 = a12;
  v19 = a11;
  v38 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setDeclarationType:", CFSTR("com.apple.configuration.network.vpn"));
  if (v17)
  {
    objc_msgSend(v26, "setDeclarationIdentifier:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v37 = v18;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = v19;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeclarationIdentifier:", v29);

    v19 = v28;
    v17 = 0;
    v18 = v37;
  }
  objc_msgSend(v26, "setPayloadVPNType:", v25);

  objc_msgSend(v26, "setPayloadVPNSubType:", v24);
  objc_msgSend(v26, "setPayloadUserDefinedName:", v23);

  objc_msgSend(v26, "setPayloadVendorConfig:", v22);
  objc_msgSend(v26, "setPayloadVPN:", v21);

  objc_msgSend(v26, "setPayloadIPv4:", v20);
  objc_msgSend(v26, "setPayloadPPP:", v38);

  objc_msgSend(v26, "setPayloadIPSec:", v19);
  objc_msgSend(v26, "setPayloadIKEv2:", v18);

  objc_msgSend(v26, "setPayloadProxies:", v39);
  objc_msgSend(v26, "setPayloadAlwaysOn:", v40);

  if (v41)
    v30 = v41;
  else
    v30 = &unk_24C69CD58;
  objc_msgSend(v26, "setPayloadDisconnectOnIdle:", v30);

  objc_msgSend(v26, "setPayloadDisconnectOnIdleTimer:", v42);
  objc_msgSend(v26, "setPayloadDNS:", v43);

  objc_msgSend(v26, "updateServerHash");
  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNType:(id)a4 withUserDefinedName:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.network.vpn"));
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
  objc_msgSend(v10, "setPayloadVPNType:", v9);

  objc_msgSend(v10, "setPayloadUserDefinedName:", v8);
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
  NSString *payloadVPNType;
  NSString *v16;
  NSString *payloadVPNSubType;
  NSString *v18;
  NSString *payloadUserDefinedName;
  CEMNetworkVPNDeclaration_VendorConfig *v20;
  CEMNetworkVPNDeclaration_VendorConfig *payloadVendorConfig;
  CEMNetworkVPNDeclaration_VPN *v22;
  CEMNetworkVPNDeclaration_VPN *payloadVPN;
  CEMNetworkVPNDeclaration_IPv4 *v24;
  CEMNetworkVPNDeclaration_IPv4 *payloadIPv4;
  CEMNetworkVPNDeclaration_PPP *v26;
  CEMNetworkVPNDeclaration_PPP *payloadPPP;
  CEMNetworkVPNDeclaration_IPSec *v28;
  CEMNetworkVPNDeclaration_IPSec *payloadIPSec;
  CEMNetworkVPNDeclaration_IKEv2 *v30;
  CEMNetworkVPNDeclaration_IKEv2 *payloadIKEv2;
  CEMNetworkVPNDeclaration_Proxies *v32;
  CEMNetworkVPNDeclaration_Proxies *payloadProxies;
  CEMNetworkVPNDeclaration_AlwaysOn *v34;
  CEMNetworkVPNDeclaration_AlwaysOn *payloadAlwaysOn;
  NSNumber *v36;
  NSNumber *payloadDisconnectOnIdle;
  NSNumber *v38;
  NSNumber *payloadDisconnectOnIdleTimer;
  CEMNetworkVPNDeclaration_DNS *v40;
  CEMNetworkVPNDeclaration_DNS *payloadDNS;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration allowedPayloadKeys](CEMNetworkVPNDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v56 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VPNType"), 1, 0, &v56);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v56;
  payloadVPNType = self->_payloadVPNType;
  self->_payloadVPNType = v13;

  if (!v14)
  {
    v55 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VPNSubType"), 0, 0, &v55);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v55;
    payloadVPNSubType = self->_payloadVPNSubType;
    self->_payloadVPNSubType = v16;

    if (!v14)
    {
      v54 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserDefinedName"), 1, 0, &v54);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v54;
      payloadUserDefinedName = self->_payloadUserDefinedName;
      self->_payloadUserDefinedName = v18;

      if (!v14)
      {
        v53 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("VendorConfig"), objc_opt_class(), 0, 0, &v53);
        v20 = (CEMNetworkVPNDeclaration_VendorConfig *)objc_claimAutoreleasedReturnValue();
        v14 = v53;
        payloadVendorConfig = self->_payloadVendorConfig;
        self->_payloadVendorConfig = v20;

        if (!v14)
        {
          v52 = 0;
          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("VPN"), objc_opt_class(), 0, 0, &v52);
          v22 = (CEMNetworkVPNDeclaration_VPN *)objc_claimAutoreleasedReturnValue();
          v14 = v52;
          payloadVPN = self->_payloadVPN;
          self->_payloadVPN = v22;

          if (!v14)
          {
            v51 = 0;
            -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("IPv4"), objc_opt_class(), 0, 0, &v51);
            v24 = (CEMNetworkVPNDeclaration_IPv4 *)objc_claimAutoreleasedReturnValue();
            v14 = v51;
            payloadIPv4 = self->_payloadIPv4;
            self->_payloadIPv4 = v24;

            if (!v14)
            {
              v50 = 0;
              -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("PPP"), objc_opt_class(), 0, 0, &v50);
              v26 = (CEMNetworkVPNDeclaration_PPP *)objc_claimAutoreleasedReturnValue();
              v14 = v50;
              payloadPPP = self->_payloadPPP;
              self->_payloadPPP = v26;

              if (!v14)
              {
                v49 = 0;
                -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("IPSec"), objc_opt_class(), 0, 0, &v49);
                v28 = (CEMNetworkVPNDeclaration_IPSec *)objc_claimAutoreleasedReturnValue();
                v14 = v49;
                payloadIPSec = self->_payloadIPSec;
                self->_payloadIPSec = v28;

                if (!v14)
                {
                  v48 = 0;
                  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("IKEv2"), objc_opt_class(), 0, 0, &v48);
                  v30 = (CEMNetworkVPNDeclaration_IKEv2 *)objc_claimAutoreleasedReturnValue();
                  v14 = v48;
                  payloadIKEv2 = self->_payloadIKEv2;
                  self->_payloadIKEv2 = v30;

                  if (!v14)
                  {
                    v47 = 0;
                    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Proxies"), objc_opt_class(), 0, 0, &v47);
                    v32 = (CEMNetworkVPNDeclaration_Proxies *)objc_claimAutoreleasedReturnValue();
                    v14 = v47;
                    payloadProxies = self->_payloadProxies;
                    self->_payloadProxies = v32;

                    if (!v14)
                    {
                      v46 = 0;
                      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("AlwaysOn"), objc_opt_class(), 0, 0, &v46);
                      v34 = (CEMNetworkVPNDeclaration_AlwaysOn *)objc_claimAutoreleasedReturnValue();
                      v14 = v46;
                      payloadAlwaysOn = self->_payloadAlwaysOn;
                      self->_payloadAlwaysOn = v34;

                      if (!v14)
                      {
                        v45 = 0;
                        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdle"), 0, &unk_24C69CD58, &v45);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v45;
                        payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                        self->_payloadDisconnectOnIdle = v36;

                        if (!v14)
                        {
                          v44 = 0;
                          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdleTimer"), 0, 0, &v44);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v44;
                          payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                          self->_payloadDisconnectOnIdleTimer = v38;

                          if (!v14)
                          {
                            v43 = 0;
                            -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("DNS"), objc_opt_class(), 0, 0, &v43);
                            v40 = (CEMNetworkVPNDeclaration_DNS *)objc_claimAutoreleasedReturnValue();
                            v14 = v43;
                            payloadDNS = self->_payloadDNS;
                            self->_payloadDNS = v40;

                          }
                        }
                      }
                    }
                  }
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
  CEMNetworkVPNDeclaration_VendorConfig *payloadVendorConfig;
  uint64_t v7;
  id v8;
  CEMNetworkVPNDeclaration_VPN *payloadVPN;
  id v10;
  CEMNetworkVPNDeclaration_IPv4 *payloadIPv4;
  id v12;
  CEMNetworkVPNDeclaration_PPP *payloadPPP;
  id v14;
  CEMNetworkVPNDeclaration_IPSec *payloadIPSec;
  id v16;
  CEMNetworkVPNDeclaration_IKEv2 *payloadIKEv2;
  id v18;
  CEMNetworkVPNDeclaration_Proxies *payloadProxies;
  id v20;
  CEMNetworkVPNDeclaration_AlwaysOn *payloadAlwaysOn;
  id v22;
  CEMNetworkVPNDeclaration_DNS *payloadDNS;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("VPNType"), self->_payloadVPNType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("VPNSubType"), self->_payloadVPNSubType, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UserDefinedName"), self->_payloadUserDefinedName, 1, 0);
  payloadVendorConfig = self->_payloadVendorConfig;
  v7 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v43[3] = &unk_24C638560;
  v8 = v4;
  v44 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("VendorConfig"), payloadVendorConfig, v43, 0, 0);
  payloadVPN = self->_payloadVPN;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v41[3] = &unk_24C638560;
  v10 = v8;
  v42 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("VPN"), payloadVPN, v41, 0, 0);
  payloadIPv4 = self->_payloadIPv4;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v39[3] = &unk_24C638560;
  v12 = v10;
  v40 = v12;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IPv4"), payloadIPv4, v39, 0, 0);
  payloadPPP = self->_payloadPPP;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  v37[3] = &unk_24C638560;
  v14 = v12;
  v38 = v14;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("PPP"), payloadPPP, v37, 0, 0);
  payloadIPSec = self->_payloadIPSec;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v35[3] = &unk_24C638560;
  v16 = v14;
  v36 = v16;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IPSec"), payloadIPSec, v35, 0, 0);
  payloadIKEv2 = self->_payloadIKEv2;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_6;
  v33[3] = &unk_24C638560;
  v18 = v16;
  v34 = v18;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IKEv2"), payloadIKEv2, v33, 0, 0);
  payloadProxies = self->_payloadProxies;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_7;
  v31[3] = &unk_24C638560;
  v20 = v18;
  v32 = v20;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Proxies"), payloadProxies, v31, 0, 0);
  payloadAlwaysOn = self->_payloadAlwaysOn;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_8;
  v29[3] = &unk_24C638560;
  v22 = v20;
  v30 = v22;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("AlwaysOn"), payloadAlwaysOn, v29, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdle"), self->_payloadDisconnectOnIdle, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdleTimer"), self->_payloadDisconnectOnIdleTimer, 0, 0);
  payloadDNS = self->_payloadDNS;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_9;
  v27[3] = &unk_24C638560;
  v28 = v22;
  v24 = v22;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("DNS"), payloadDNS, v27, 0, 0);
  v25 = (void *)objc_msgSend(v5, "copy");

  return v25;
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_9(uint64_t a1, void *a2)
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CEMNetworkVPNDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVPNType, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadVPNSubType, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadUserDefinedName, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[CEMNetworkVPNDeclaration_VendorConfig copy](self->_payloadVendorConfig, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[CEMNetworkVPNDeclaration_VPN copy](self->_payloadVPN, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[CEMNetworkVPNDeclaration_IPv4 copy](self->_payloadIPv4, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[CEMNetworkVPNDeclaration_PPP copy](self->_payloadPPP, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[CEMNetworkVPNDeclaration_IPSec copy](self->_payloadIPSec, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[CEMNetworkVPNDeclaration_IKEv2 copy](self->_payloadIKEv2, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[CEMNetworkVPNDeclaration_Proxies copy](self->_payloadProxies, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[CEMNetworkVPNDeclaration_AlwaysOn copy](self->_payloadAlwaysOn, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadDisconnectOnIdle, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadDisconnectOnIdleTimer, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[CEMNetworkVPNDeclaration_DNS copy](self->_payloadDNS, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (NSString)payloadVPNType
{
  return self->_payloadVPNType;
}

- (void)setPayloadVPNType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadVPNSubType
{
  return self->_payloadVPNSubType;
}

- (void)setPayloadVPNSubType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadUserDefinedName
{
  return self->_payloadUserDefinedName;
}

- (void)setPayloadUserDefinedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CEMNetworkVPNDeclaration_VendorConfig)payloadVendorConfig
{
  return self->_payloadVendorConfig;
}

- (void)setPayloadVendorConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CEMNetworkVPNDeclaration_VPN)payloadVPN
{
  return self->_payloadVPN;
}

- (void)setPayloadVPN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CEMNetworkVPNDeclaration_IPv4)payloadIPv4
{
  return self->_payloadIPv4;
}

- (void)setPayloadIPv4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CEMNetworkVPNDeclaration_PPP)payloadPPP
{
  return self->_payloadPPP;
}

- (void)setPayloadPPP:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CEMNetworkVPNDeclaration_IPSec)payloadIPSec
{
  return self->_payloadIPSec;
}

- (void)setPayloadIPSec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CEMNetworkVPNDeclaration_IKEv2)payloadIKEv2
{
  return self->_payloadIKEv2;
}

- (void)setPayloadIKEv2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CEMNetworkVPNDeclaration_Proxies)payloadProxies
{
  return self->_payloadProxies;
}

- (void)setPayloadProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CEMNetworkVPNDeclaration_AlwaysOn)payloadAlwaysOn
{
  return self->_payloadAlwaysOn;
}

- (void)setPayloadAlwaysOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadDisconnectOnIdle
{
  return self->_payloadDisconnectOnIdle;
}

- (void)setPayloadDisconnectOnIdle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadDisconnectOnIdleTimer
{
  return self->_payloadDisconnectOnIdleTimer;
}

- (void)setPayloadDisconnectOnIdleTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CEMNetworkVPNDeclaration_DNS)payloadDNS
{
  return self->_payloadDNS;
}

- (void)setPayloadDNS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDNS, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadAlwaysOn, 0);
  objc_storeStrong((id *)&self->_payloadProxies, 0);
  objc_storeStrong((id *)&self->_payloadIKEv2, 0);
  objc_storeStrong((id *)&self->_payloadIPSec, 0);
  objc_storeStrong((id *)&self->_payloadPPP, 0);
  objc_storeStrong((id *)&self->_payloadIPv4, 0);
  objc_storeStrong((id *)&self->_payloadVPN, 0);
  objc_storeStrong((id *)&self->_payloadVendorConfig, 0);
  objc_storeStrong((id *)&self->_payloadUserDefinedName, 0);
  objc_storeStrong((id *)&self->_payloadVPNSubType, 0);
  objc_storeStrong((id *)&self->_payloadVPNType, 0);
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __83__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __83__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __100__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __100__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __50__CEMNetworkVPNDeclaration_PPP_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_PPP_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_PPP_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkVPNDeclaration_PPP_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__CEMNetworkVPNDeclaration_Proxies_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __71__CEMNetworkVPNDeclaration_Proxies_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

@end

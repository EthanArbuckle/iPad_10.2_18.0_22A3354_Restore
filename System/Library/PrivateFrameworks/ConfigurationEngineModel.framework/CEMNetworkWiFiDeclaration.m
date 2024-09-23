@implementation CEMNetworkWiFiDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.wifi");
}

+ (id)profileType
{
  return CFSTR("com.apple.wifi.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[30];

  v6[29] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AutoJoin");
  v6[1] = CFSTR("SSID_STR");
  v6[2] = CFSTR("HIDDEN_NETWORK");
  v6[3] = CFSTR("ProxyType");
  v6[4] = CFSTR("EncryptionType");
  v6[5] = CFSTR("Password");
  v6[6] = CFSTR("PayloadCertificateUUID");
  v6[7] = CFSTR("EAPClientConfiguration");
  v6[8] = CFSTR("DisplayedOperatorName");
  v6[9] = CFSTR("DomainName");
  v6[10] = CFSTR("RoamingConsortiumOIs");
  v6[11] = CFSTR("ServiceProviderRoamingEnabled");
  v6[12] = CFSTR("IsHotspot");
  v6[13] = CFSTR("HESSID");
  v6[14] = CFSTR("NAIRealmNames");
  v6[15] = CFSTR("MCCAndMNCs");
  v6[16] = CFSTR("CaptiveBypass");
  v6[17] = CFSTR("QoSMarkingPolicy");
  v6[18] = CFSTR("Interface");
  v6[19] = CFSTR("SetupModes");
  v6[20] = CFSTR("Priority");
  v6[21] = CFSTR("EnableIPv6");
  v6[22] = CFSTR("TLSCertificateRequired");
  v6[23] = CFSTR("ProxyServer");
  v6[24] = CFSTR("ProxyServerPort");
  v6[25] = CFSTR("ProxyUsername");
  v6[26] = CFSTR("ProxyPassword");
  v6[27] = CFSTR("ProxyPACURL");
  v6[28] = CFSTR("ProxyPACFallbackAllowed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 29);
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

+ (id)buildWithIdentifier:(id)a3 withAutoJoin:(id)a4 withSSIDSTR:(id)a5 withHIDDENNETWORK:(id)a6 withProxyType:(id)a7 withEncryptionType:(id)a8 withPassword:(id)a9 withPayloadCertificateUUID:(id)a10 withEAPClientConfiguration:(id)a11 withDisplayedOperatorName:(id)a12 withDomainName:(id)a13 withRoamingConsortiumOIs:(id)a14 withServiceProviderRoamingEnabled:(id)a15 withIsHotspot:(id)a16 withHESSID:(id)a17 withNAIRealmNames:(id)a18 withMCCAndMNCs:(id)a19 withCaptiveBypass:(id)a20 withQoSMarkingPolicy:(id)a21 withInterface:(id)a22 withSetupModes:(id)a23 withPriority:(id)a24 withEnableIPv6:(id)a25 withTLSCertificateRequired:(id)a26 withProxyServer:(id)a27 withProxyServerPort:(id)a28 withProxyUsername:(id)a29 withProxyPassword:(id)a30 withProxyPACURL:(id)a31 withProxyPACFallbackAllowed:(id)a32
{
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  __CFString *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  const __CFString *v46;
  const __CFString *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v56;
  id v57;
  id v58;
  id v60;
  id v64;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;

  v32 = a3;
  v82 = a32;
  v81 = a31;
  v80 = a30;
  v79 = a29;
  v78 = a28;
  v33 = a27;
  v34 = a26;
  v77 = a25;
  v76 = a24;
  v75 = a23;
  v74 = a22;
  v73 = a21;
  v72 = a20;
  v71 = a19;
  v70 = a18;
  v69 = a17;
  v68 = a16;
  v67 = a15;
  v66 = a14;
  v64 = a13;
  v60 = a12;
  v58 = a11;
  v56 = a10;
  v57 = a9;
  v35 = (__CFString *)a8;
  v36 = (__CFString *)a7;
  v37 = a6;
  v38 = a5;
  v39 = a4;
  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "setDeclarationType:", CFSTR("com.apple.configuration.network.wifi"));
  if (v32)
  {
    objc_msgSend(v40, "setDeclarationIdentifier:", v32);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDeclarationIdentifier:", v42);

    v32 = 0;
  }
  v43 = (void *)MEMORY[0x24BDBD1C0];
  if (v39)
    v44 = v39;
  else
    v44 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v40, "setPayloadAutoJoin:", v44);

  objc_msgSend(v40, "setPayloadSSIDSTR:", v38);
  if (v37)
    v45 = v37;
  else
    v45 = v43;
  objc_msgSend(v40, "setPayloadHIDDENNETWORK:", v45);

  if (v36)
    v46 = v36;
  else
    v46 = CFSTR("None");
  objc_msgSend(v40, "setPayloadProxyType:", v46);

  if (v35)
    v47 = v35;
  else
    v47 = CFSTR("Any");
  objc_msgSend(v40, "setPayloadEncryptionType:", v47);

  objc_msgSend(v40, "setPayloadPassword:", v57);
  objc_msgSend(v40, "setPayloadPayloadCertificateUUID:", v56);

  objc_msgSend(v40, "setPayloadEAPClientConfiguration:", v58);
  objc_msgSend(v40, "setPayloadDisplayedOperatorName:", v60);

  objc_msgSend(v40, "setPayloadDomainName:", v64);
  objc_msgSend(v40, "setPayloadRoamingConsortiumOIs:", v66);

  if (v67)
    v48 = v67;
  else
    v48 = v43;
  objc_msgSend(v40, "setPayloadServiceProviderRoamingEnabled:", v48);

  if (v68)
    v49 = v68;
  else
    v49 = v43;
  objc_msgSend(v40, "setPayloadIsHotspot:", v49);

  objc_msgSend(v40, "setPayloadHESSID:", v69);
  objc_msgSend(v40, "setPayloadNAIRealmNames:", v70);

  objc_msgSend(v40, "setPayloadMCCAndMNCs:", v71);
  if (v72)
    v50 = v72;
  else
    v50 = v43;
  objc_msgSend(v40, "setPayloadCaptiveBypass:", v50);

  objc_msgSend(v40, "setPayloadQoSMarkingPolicy:", v73);
  objc_msgSend(v40, "setPayloadInterface:", v74);

  objc_msgSend(v40, "setPayloadSetupModes:", v75);
  if (v76)
    v51 = v76;
  else
    v51 = &unk_24C69CDD0;
  objc_msgSend(v40, "setPayloadPriority:", v51);

  if (v77)
    v52 = v77;
  else
    v52 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v40, "setPayloadEnableIPv6:", v52);

  if (v34)
    v53 = v34;
  else
    v53 = v43;
  objc_msgSend(v40, "setPayloadTLSCertificateRequired:", v53);

  objc_msgSend(v40, "setPayloadProxyServer:", v33);
  objc_msgSend(v40, "setPayloadProxyServerPort:", v78);

  objc_msgSend(v40, "setPayloadProxyUsername:", v79);
  objc_msgSend(v40, "setPayloadProxyPassword:", v80);

  objc_msgSend(v40, "setPayloadProxyPACURL:", v81);
  if (v82)
    v54 = v82;
  else
    v54 = v43;
  objc_msgSend(v40, "setPayloadProxyPACFallbackAllowed:", v54);

  objc_msgSend(v40, "updateServerHash");
  return v40;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.network.wifi"));
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
  NSNumber *payloadAutoJoin;
  NSString *v16;
  NSString *payloadSSIDSTR;
  NSNumber *v18;
  NSNumber *payloadHIDDENNETWORK;
  NSString *v20;
  NSString *payloadProxyType;
  NSString *v22;
  NSString *payloadEncryptionType;
  NSString *v24;
  NSString *payloadPassword;
  NSString *v26;
  NSString *payloadPayloadCertificateUUID;
  CEMNetworkWiFiDeclaration_EAPClientConfiguration *v28;
  CEMNetworkWiFiDeclaration_EAPClientConfiguration *payloadEAPClientConfiguration;
  NSString *v30;
  NSString *payloadDisplayedOperatorName;
  NSString *v32;
  NSString *payloadDomainName;
  NSArray *v34;
  NSArray *payloadRoamingConsortiumOIs;
  NSNumber *v36;
  NSNumber *payloadServiceProviderRoamingEnabled;
  NSNumber *v38;
  NSNumber *payloadIsHotspot;
  NSString *v40;
  NSString *payloadHESSID;
  NSArray *v42;
  NSArray *payloadNAIRealmNames;
  NSArray *v44;
  NSArray *payloadMCCAndMNCs;
  NSNumber *v46;
  NSNumber *payloadCaptiveBypass;
  CEMNetworkWiFiDeclaration_QoSMarkingPolicy *v48;
  CEMNetworkWiFiDeclaration_QoSMarkingPolicy *payloadQoSMarkingPolicy;
  NSString *v50;
  NSString *payloadInterface;
  NSArray *v52;
  NSArray *payloadSetupModes;
  NSNumber *v54;
  NSNumber *payloadPriority;
  NSNumber *v56;
  NSNumber *payloadEnableIPv6;
  NSNumber *v58;
  NSNumber *payloadTLSCertificateRequired;
  NSString *v60;
  NSString *payloadProxyServer;
  NSNumber *v62;
  NSNumber *payloadProxyServerPort;
  NSString *v64;
  NSString *payloadProxyUsername;
  NSString *v66;
  NSString *payloadProxyPassword;
  NSString *v68;
  NSString *payloadProxyPACURL;
  NSNumber *v70;
  NSNumber *payloadProxyPACFallbackAllowed;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkWiFiDeclaration allowedPayloadKeys](CEMNetworkWiFiDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v101 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutoJoin"), 0, MEMORY[0x24BDBD1C0], &v101);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v101;
  payloadAutoJoin = self->_payloadAutoJoin;
  self->_payloadAutoJoin = v13;

  if (!v14)
  {
    v100 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SSID_STR"), 0, 0, &v100);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v100;
    payloadSSIDSTR = self->_payloadSSIDSTR;
    self->_payloadSSIDSTR = v16;

    if (!v14)
    {
      v99 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HIDDEN_NETWORK"), 0, MEMORY[0x24BDBD1C0], &v99);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v99;
      payloadHIDDENNETWORK = self->_payloadHIDDENNETWORK;
      self->_payloadHIDDENNETWORK = v18;

      if (!v14)
      {
        v98 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyType"), 0, CFSTR("None"), &v98);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v98;
        payloadProxyType = self->_payloadProxyType;
        self->_payloadProxyType = v20;

        if (!v14)
        {
          v97 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EncryptionType"), 0, CFSTR("Any"), &v97);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v97;
          payloadEncryptionType = self->_payloadEncryptionType;
          self->_payloadEncryptionType = v22;

          if (!v14)
          {
            v96 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v96);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v96;
            payloadPassword = self->_payloadPassword;
            self->_payloadPassword = v24;

            if (!v14)
            {
              v95 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v95);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v95;
              payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
              self->_payloadPayloadCertificateUUID = v26;

              if (!v14)
              {
                v94 = 0;
                -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("EAPClientConfiguration"), objc_opt_class(), 0, 0, &v94);
                v28 = (CEMNetworkWiFiDeclaration_EAPClientConfiguration *)objc_claimAutoreleasedReturnValue();
                v14 = v94;
                payloadEAPClientConfiguration = self->_payloadEAPClientConfiguration;
                self->_payloadEAPClientConfiguration = v28;

                if (!v14)
                {
                  v93 = 0;
                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisplayedOperatorName"), 0, 0, &v93);
                  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v14 = v93;
                  payloadDisplayedOperatorName = self->_payloadDisplayedOperatorName;
                  self->_payloadDisplayedOperatorName = v30;

                  if (!v14)
                  {
                    v92 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DomainName"), 0, 0, &v92);
                    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v14 = v92;
                    payloadDomainName = self->_payloadDomainName;
                    self->_payloadDomainName = v32;

                    if (!v14)
                    {
                      v91 = 0;
                      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("RoamingConsortiumOIs"), &__block_literal_global_25, 0, 0, &v91);
                      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
                      v14 = v91;
                      payloadRoamingConsortiumOIs = self->_payloadRoamingConsortiumOIs;
                      self->_payloadRoamingConsortiumOIs = v34;

                      if (!v14)
                      {
                        v90 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServiceProviderRoamingEnabled"), 0, MEMORY[0x24BDBD1C0], &v90);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v90;
                        payloadServiceProviderRoamingEnabled = self->_payloadServiceProviderRoamingEnabled;
                        self->_payloadServiceProviderRoamingEnabled = v36;

                        if (!v14)
                        {
                          v89 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsHotspot"), 0, MEMORY[0x24BDBD1C0], &v89);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v89;
                          payloadIsHotspot = self->_payloadIsHotspot;
                          self->_payloadIsHotspot = v38;

                          if (!v14)
                          {
                            v88 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HESSID"), 0, 0, &v88);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v88;
                            payloadHESSID = self->_payloadHESSID;
                            self->_payloadHESSID = v40;

                            if (!v14)
                            {
                              v87 = 0;
                              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("NAIRealmNames"), &__block_literal_global_85, 0, 0, &v87);
                              v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
                              v14 = v87;
                              payloadNAIRealmNames = self->_payloadNAIRealmNames;
                              self->_payloadNAIRealmNames = v42;

                              if (!v14)
                              {
                                v86 = 0;
                                -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("MCCAndMNCs"), &__block_literal_global_86, 0, 0, &v86);
                                v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                v14 = v86;
                                payloadMCCAndMNCs = self->_payloadMCCAndMNCs;
                                self->_payloadMCCAndMNCs = v44;

                                if (!v14)
                                {
                                  v85 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CaptiveBypass"), 0, MEMORY[0x24BDBD1C0], &v85);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v85;
                                  payloadCaptiveBypass = self->_payloadCaptiveBypass;
                                  self->_payloadCaptiveBypass = v46;

                                  if (!v14)
                                  {
                                    v84 = 0;
                                    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("QoSMarkingPolicy"), objc_opt_class(), 0, 0, &v84);
                                    v48 = (CEMNetworkWiFiDeclaration_QoSMarkingPolicy *)objc_claimAutoreleasedReturnValue();
                                    v14 = v84;
                                    payloadQoSMarkingPolicy = self->_payloadQoSMarkingPolicy;
                                    self->_payloadQoSMarkingPolicy = v48;

                                    if (!v14)
                                    {
                                      v83 = 0;
                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Interface"), 0, 0, &v83);
                                      v50 = (NSString *)objc_claimAutoreleasedReturnValue();
                                      v14 = v83;
                                      payloadInterface = self->_payloadInterface;
                                      self->_payloadInterface = v50;

                                      if (!v14)
                                      {
                                        v82 = 0;
                                        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SetupModes"), &__block_literal_global_88, 0, 0, &v82);
                                        v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                        v14 = v82;
                                        payloadSetupModes = self->_payloadSetupModes;
                                        self->_payloadSetupModes = v52;

                                        if (!v14)
                                        {
                                          v81 = 0;
                                          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Priority"), 0, &unk_24C69CDD0, &v81);
                                          v54 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                          v14 = v81;
                                          payloadPriority = self->_payloadPriority;
                                          self->_payloadPriority = v54;

                                          if (!v14)
                                          {
                                            v80 = 0;
                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableIPv6"), 0, MEMORY[0x24BDBD1C8], &v80);
                                            v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                            v14 = v80;
                                            payloadEnableIPv6 = self->_payloadEnableIPv6;
                                            self->_payloadEnableIPv6 = v56;

                                            if (!v14)
                                            {
                                              v79 = 0;
                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSCertificateRequired"), 0, MEMORY[0x24BDBD1C0], &v79);
                                              v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                              v14 = v79;
                                              payloadTLSCertificateRequired = self->_payloadTLSCertificateRequired;
                                              self->_payloadTLSCertificateRequired = v58;

                                              if (!v14)
                                              {
                                                v78 = 0;
                                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyServer"), 0, 0, &v78);
                                                v60 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                v14 = v78;
                                                payloadProxyServer = self->_payloadProxyServer;
                                                self->_payloadProxyServer = v60;

                                                if (!v14)
                                                {
                                                  v77 = 0;
                                                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyServerPort"), 0, 0, &v77);
                                                  v62 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                  v14 = v77;
                                                  payloadProxyServerPort = self->_payloadProxyServerPort;
                                                  self->_payloadProxyServerPort = v62;

                                                  if (!v14)
                                                  {
                                                    v76 = 0;
                                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyUsername"), 0, 0, &v76);
                                                    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                    v14 = v76;
                                                    payloadProxyUsername = self->_payloadProxyUsername;
                                                    self->_payloadProxyUsername = v64;

                                                    if (!v14)
                                                    {
                                                      v75 = 0;
                                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPassword"), 0, 0, &v75);
                                                      v66 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                      v14 = v75;
                                                      payloadProxyPassword = self->_payloadProxyPassword;
                                                      self->_payloadProxyPassword = v66;

                                                      if (!v14)
                                                      {
                                                        v74 = 0;
                                                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPACURL"), 0, 0, &v74);
                                                        v68 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                        v14 = v74;
                                                        payloadProxyPACURL = self->_payloadProxyPACURL;
                                                        self->_payloadProxyPACURL = v68;

                                                        if (!v14)
                                                        {
                                                          v73 = 0;
                                                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPACFallbackAllowed"), 0, MEMORY[0x24BDBD1C0], &v73);
                                                          v70 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                          v14 = v73;
                                                          payloadProxyPACFallbackAllowed = self->_payloadProxyPACFallbackAllowed;
                                                          self->_payloadProxyPACFallbackAllowed = v70;

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
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
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
  id v4;
  void *v5;
  uint64_t v6;
  CEMNetworkWiFiDeclaration_EAPClientConfiguration *payloadEAPClientConfiguration;
  uint64_t v8;
  id v9;
  CEMNetworkWiFiDeclaration_QoSMarkingPolicy *payloadQoSMarkingPolicy;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AutoJoin"), self->_payloadAutoJoin, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SSID_STR"), self->_payloadSSIDSTR, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("HIDDEN_NETWORK"), self->_payloadHIDDENNETWORK, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyType"), self->_payloadProxyType, 0, CFSTR("None"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EncryptionType"), self->_payloadEncryptionType, 0, CFSTR("Any"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Password"), self->_payloadPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PayloadCertificateUUID"), self->_payloadPayloadCertificateUUID, 0, 0);
  payloadEAPClientConfiguration = self->_payloadEAPClientConfiguration;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v19[3] = &unk_24C638560;
  v9 = v4;
  v20 = v9;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("EAPClientConfiguration"), payloadEAPClientConfiguration, v19, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisplayedOperatorName"), self->_payloadDisplayedOperatorName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DomainName"), self->_payloadDomainName, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("RoamingConsortiumOIs"), self->_payloadRoamingConsortiumOIs, &__block_literal_global_92_0, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServiceProviderRoamingEnabled"), self->_payloadServiceProviderRoamingEnabled, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IsHotspot"), self->_payloadIsHotspot, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("HESSID"), self->_payloadHESSID, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("NAIRealmNames"), self->_payloadNAIRealmNames, &__block_literal_global_93_1, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("MCCAndMNCs"), self->_payloadMCCAndMNCs, &__block_literal_global_94, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CaptiveBypass"), self->_payloadCaptiveBypass, 0, v6);
  payloadQoSMarkingPolicy = self->_payloadQoSMarkingPolicy;
  v14 = v8;
  v15 = 3221225472;
  v16 = __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v17 = &unk_24C638560;
  v18 = v9;
  v11 = v9;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("QoSMarkingPolicy"), payloadQoSMarkingPolicy, &v14, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Interface"), self->_payloadInterface, 0, 0, v14, v15, v16, v17);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("SetupModes"), self->_payloadSetupModes, &__block_literal_global_95_1, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Priority"), self->_payloadPriority, 0, &unk_24C69CDD0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnableIPv6"), self->_payloadEnableIPv6, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("TLSCertificateRequired"), self->_payloadTLSCertificateRequired, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyServer"), self->_payloadProxyServer, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyServerPort"), self->_payloadProxyServerPort, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyUsername"), self->_payloadProxyUsername, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyPassword"), self->_payloadProxyPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyPACURL"), self->_payloadProxyPACURL, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProxyPACFallbackAllowed"), self->_payloadProxyPACFallbackAllowed, 0, v6);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

uint64_t __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
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
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)CEMNetworkWiFiDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v64, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAutoJoin, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadSSIDSTR, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadHIDDENNETWORK, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadProxyType, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadEncryptionType, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadPassword, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadPayloadCertificateUUID, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[CEMNetworkWiFiDeclaration_EAPClientConfiguration copy](self->_payloadEAPClientConfiguration, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSString copy](self->_payloadDisplayedOperatorName, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSString copy](self->_payloadDomainName, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSArray copy](self->_payloadRoamingConsortiumOIs, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadServiceProviderRoamingEnabled, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadIsHotspot, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSString copy](self->_payloadHESSID, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSArray copy](self->_payloadNAIRealmNames, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSArray copy](self->_payloadMCCAndMNCs, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadCaptiveBypass, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[CEMNetworkWiFiDeclaration_QoSMarkingPolicy copy](self->_payloadQoSMarkingPolicy, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSString copy](self->_payloadInterface, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  v43 = -[NSArray copy](self->_payloadSetupModes, "copy");
  v44 = (void *)v4[28];
  v4[28] = v43;

  v45 = -[NSNumber copy](self->_payloadPriority, "copy");
  v46 = (void *)v4[29];
  v4[29] = v45;

  v47 = -[NSNumber copy](self->_payloadEnableIPv6, "copy");
  v48 = (void *)v4[30];
  v4[30] = v47;

  v49 = -[NSNumber copy](self->_payloadTLSCertificateRequired, "copy");
  v50 = (void *)v4[31];
  v4[31] = v49;

  v51 = -[NSString copy](self->_payloadProxyServer, "copy");
  v52 = (void *)v4[32];
  v4[32] = v51;

  v53 = -[NSNumber copy](self->_payloadProxyServerPort, "copy");
  v54 = (void *)v4[33];
  v4[33] = v53;

  v55 = -[NSString copy](self->_payloadProxyUsername, "copy");
  v56 = (void *)v4[34];
  v4[34] = v55;

  v57 = -[NSString copy](self->_payloadProxyPassword, "copy");
  v58 = (void *)v4[35];
  v4[35] = v57;

  v59 = -[NSString copy](self->_payloadProxyPACURL, "copy");
  v60 = (void *)v4[36];
  v4[36] = v59;

  v61 = -[NSNumber copy](self->_payloadProxyPACFallbackAllowed, "copy");
  v62 = (void *)v4[37];
  v4[37] = v61;

  return v4;
}

- (NSNumber)payloadAutoJoin
{
  return self->_payloadAutoJoin;
}

- (void)setPayloadAutoJoin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadSSIDSTR
{
  return self->_payloadSSIDSTR;
}

- (void)setPayloadSSIDSTR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadHIDDENNETWORK
{
  return self->_payloadHIDDENNETWORK;
}

- (void)setPayloadHIDDENNETWORK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadProxyType
{
  return self->_payloadProxyType;
}

- (void)setPayloadProxyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadEncryptionType
{
  return self->_payloadEncryptionType;
}

- (void)setPayloadEncryptionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CEMNetworkWiFiDeclaration_EAPClientConfiguration)payloadEAPClientConfiguration
{
  return self->_payloadEAPClientConfiguration;
}

- (void)setPayloadEAPClientConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadDisplayedOperatorName
{
  return self->_payloadDisplayedOperatorName;
}

- (void)setPayloadDisplayedOperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)payloadRoamingConsortiumOIs
{
  return self->_payloadRoamingConsortiumOIs;
}

- (void)setPayloadRoamingConsortiumOIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadServiceProviderRoamingEnabled
{
  return self->_payloadServiceProviderRoamingEnabled;
}

- (void)setPayloadServiceProviderRoamingEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadIsHotspot
{
  return self->_payloadIsHotspot;
}

- (void)setPayloadIsHotspot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)payloadHESSID
{
  return self->_payloadHESSID;
}

- (void)setPayloadHESSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)payloadNAIRealmNames
{
  return self->_payloadNAIRealmNames;
}

- (void)setPayloadNAIRealmNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)payloadMCCAndMNCs
{
  return self->_payloadMCCAndMNCs;
}

- (void)setPayloadMCCAndMNCs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadCaptiveBypass
{
  return self->_payloadCaptiveBypass;
}

- (void)setPayloadCaptiveBypass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CEMNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy
{
  return self->_payloadQoSMarkingPolicy;
}

- (void)setPayloadQoSMarkingPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)payloadInterface
{
  return self->_payloadInterface;
}

- (void)setPayloadInterface:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)payloadSetupModes
{
  return self->_payloadSetupModes;
}

- (void)setPayloadSetupModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)payloadPriority
{
  return self->_payloadPriority;
}

- (void)setPayloadPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)payloadEnableIPv6
{
  return self->_payloadEnableIPv6;
}

- (void)setPayloadEnableIPv6:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)payloadTLSCertificateRequired
{
  return self->_payloadTLSCertificateRequired;
}

- (void)setPayloadTLSCertificateRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)payloadProxyServerPort
{
  return self->_payloadProxyServerPort;
}

- (void)setPayloadProxyServerPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)payloadProxyUsername
{
  return self->_payloadProxyUsername;
}

- (void)setPayloadProxyUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)payloadProxyPassword
{
  return self->_payloadProxyPassword;
}

- (void)setPayloadProxyPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)payloadProxyPACURL
{
  return self->_payloadProxyPACURL;
}

- (void)setPayloadProxyPACURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)payloadProxyPACFallbackAllowed
{
  return self->_payloadProxyPACFallbackAllowed;
}

- (void)setPayloadProxyPACFallbackAllowed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProxyPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadProxyServerPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateRequired, 0);
  objc_storeStrong((id *)&self->_payloadEnableIPv6, 0);
  objc_storeStrong((id *)&self->_payloadPriority, 0);
  objc_storeStrong((id *)&self->_payloadSetupModes, 0);
  objc_storeStrong((id *)&self->_payloadInterface, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingPolicy, 0);
  objc_storeStrong((id *)&self->_payloadCaptiveBypass, 0);
  objc_storeStrong((id *)&self->_payloadMCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_payloadNAIRealmNames, 0);
  objc_storeStrong((id *)&self->_payloadHESSID, 0);
  objc_storeStrong((id *)&self->_payloadIsHotspot, 0);
  objc_storeStrong((id *)&self->_payloadServiceProviderRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadRoamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayedOperatorName, 0);
  objc_storeStrong((id *)&self->_payloadEAPClientConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionType, 0);
  objc_storeStrong((id *)&self->_payloadProxyType, 0);
  objc_storeStrong((id *)&self->_payloadHIDDENNETWORK, 0);
  objc_storeStrong((id *)&self->_payloadSSIDSTR, 0);
  objc_storeStrong((id *)&self->_payloadAutoJoin, 0);
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __64__CEMNetworkWiFiDeclaration_QoSMarkingPolicy_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __81__CEMNetworkWiFiDeclaration_QoSMarkingPolicy_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end

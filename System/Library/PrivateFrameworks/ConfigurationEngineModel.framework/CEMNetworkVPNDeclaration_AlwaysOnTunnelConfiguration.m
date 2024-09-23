@implementation CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[24];

  v6[23] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RemoteAddress");
  v6[1] = CFSTR("LocalIdentifier");
  v6[2] = CFSTR("RemoteIdentifier");
  v6[3] = CFSTR("AuthenticationMethod");
  v6[4] = CFSTR("PayloadCertificateUUID");
  v6[5] = CFSTR("SharedSecret");
  v6[6] = CFSTR("ExtendedAuthEnabled");
  v6[7] = CFSTR("DisableRedirect");
  v6[8] = CFSTR("DisableMOBIKE");
  v6[9] = CFSTR("UseConfigurationAttributeInternalIPSubnet");
  v6[10] = CFSTR("EnablePFS");
  v6[11] = CFSTR("EnableCertificateRevocationCheck");
  v6[12] = CFSTR("NATKeepAliveOffloadEnable");
  v6[13] = CFSTR("NATKeepAliveInterval");
  v6[14] = CFSTR("AuthName");
  v6[15] = CFSTR("AuthPassword");
  v6[16] = CFSTR("DeadPeerDetectionRate");
  v6[17] = CFSTR("ProtocolType");
  v6[18] = CFSTR("ServerCertificateIssuerCommonName");
  v6[19] = CFSTR("ServerCertificateCommonName");
  v6[20] = CFSTR("IKESecurityAssociationParameters");
  v6[21] = CFSTR("ChildSecurityAssociationParameters");
  v6[22] = CFSTR("Interfaces");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withDisableRedirect:(id)a10 withDisableMOBIKE:(id)a11 withUseConfigurationAttributeInternalIPSubnet:(id)a12 withEnablePFS:(id)a13 withEnableCertificateRevocationCheck:(id)a14 withNATKeepAliveOffloadEnable:(id)a15 withNATKeepAliveInterval:(id)a16 withAuthName:(id)a17 withAuthPassword:(id)a18 withDeadPeerDetectionRate:(id)a19 withProtocolType:(id)a20 withServerCertificateIssuerCommonName:(id)a21 withServerCertificateCommonName:(id)a22 withIKESecurityAssociationParameters:(id)a23 withChildSecurityAssociationParameters:(id)a24 withInterfaces:(id)a25
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __CFString *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;

  v64 = a25;
  v63 = a24;
  v62 = a23;
  v61 = a22;
  v60 = a21;
  v59 = a20;
  v58 = (__CFString *)a19;
  v57 = a18;
  v56 = a17;
  v55 = a16;
  v54 = a15;
  v53 = a14;
  v52 = a13;
  v51 = a12;
  v25 = a11;
  v26 = a10;
  v27 = a9;
  v28 = a8;
  v29 = a7;
  v30 = a6;
  v31 = a5;
  v32 = a4;
  v33 = a3;
  v34 = (void *)objc_opt_new();
  objc_msgSend(v34, "setPayloadRemoteAddress:", v33);

  objc_msgSend(v34, "setPayloadLocalIdentifier:", v32);
  objc_msgSend(v34, "setPayloadRemoteIdentifier:", v31);

  objc_msgSend(v34, "setPayloadAuthenticationMethod:", v30);
  objc_msgSend(v34, "setPayloadPayloadCertificateUUID:", v29);

  objc_msgSend(v34, "setPayloadSharedSecret:", v28);
  if (v27)
    v35 = v27;
  else
    v35 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadExtendedAuthEnabled:", v35);

  if (v26)
    v36 = v26;
  else
    v36 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadDisableRedirect:", v36);

  if (v25)
    v37 = v25;
  else
    v37 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadDisableMOBIKE:", v37);

  if (v51)
    v38 = v51;
  else
    v38 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadUseConfigurationAttributeInternalIPSubnet:", v38);

  if (v52)
    v39 = v52;
  else
    v39 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadEnablePFS:", v39);

  if (v53)
    v40 = v53;
  else
    v40 = &unk_24C69CD58;
  objc_msgSend(v34, "setPayloadEnableCertificateRevocationCheck:", v40);

  if (v54)
    v41 = v54;
  else
    v41 = &unk_24C69CD70;
  objc_msgSend(v34, "setPayloadNATKeepAliveOffloadEnable:", v41);

  if (v55)
    v42 = v55;
  else
    v42 = &unk_24C69CD88;
  objc_msgSend(v34, "setPayloadNATKeepAliveInterval:", v42);

  objc_msgSend(v34, "setPayloadAuthName:", v56);
  objc_msgSend(v34, "setPayloadAuthPassword:", v57);

  if (v58)
    v43 = v58;
  else
    v43 = CFSTR("Low");
  objc_msgSend(v34, "setPayloadDeadPeerDetectionRate:", v43);

  objc_msgSend(v34, "setPayloadProtocolType:", v59);
  objc_msgSend(v34, "setPayloadServerCertificateIssuerCommonName:", v60);

  objc_msgSend(v34, "setPayloadServerCertificateCommonName:", v61);
  objc_msgSend(v34, "setPayloadIKESecurityAssociationParameters:", v62);

  objc_msgSend(v34, "setPayloadChildSecurityAssociationParameters:", v63);
  objc_msgSend(v34, "setPayloadInterfaces:", v64);

  return v34;
}

+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withProtocolType:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadRemoteAddress:", v15);

  objc_msgSend(v16, "setPayloadLocalIdentifier:", v14);
  objc_msgSend(v16, "setPayloadRemoteIdentifier:", v13);

  objc_msgSend(v16, "setPayloadAuthenticationMethod:", v12);
  objc_msgSend(v16, "setPayloadProtocolType:", v11);

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
  NSString *v13;
  id v14;
  NSString *payloadRemoteAddress;
  NSString *v16;
  NSString *payloadLocalIdentifier;
  NSString *v18;
  NSString *payloadRemoteIdentifier;
  NSString *v20;
  NSString *payloadAuthenticationMethod;
  NSString *v22;
  NSString *payloadPayloadCertificateUUID;
  NSString *v24;
  NSString *payloadSharedSecret;
  NSNumber *v26;
  NSNumber *payloadExtendedAuthEnabled;
  NSNumber *v28;
  NSNumber *payloadDisableRedirect;
  NSNumber *v30;
  NSNumber *payloadDisableMOBIKE;
  NSNumber *v32;
  NSNumber *payloadUseConfigurationAttributeInternalIPSubnet;
  NSNumber *v34;
  NSNumber *payloadEnablePFS;
  NSNumber *v36;
  NSNumber *payloadEnableCertificateRevocationCheck;
  NSNumber *v38;
  NSNumber *payloadNATKeepAliveOffloadEnable;
  NSNumber *v40;
  NSNumber *payloadNATKeepAliveInterval;
  NSString *v42;
  NSString *payloadAuthName;
  NSString *v44;
  NSString *payloadAuthPassword;
  NSString *v46;
  NSString *payloadDeadPeerDetectionRate;
  NSString *v48;
  NSString *payloadProtocolType;
  NSString *v50;
  NSString *payloadServerCertificateIssuerCommonName;
  NSString *v52;
  NSString *payloadServerCertificateCommonName;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *v54;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadIKESecurityAssociationParameters;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *v56;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadChildSecurityAssociationParameters;
  NSArray *v58;
  NSArray *payloadInterfaces;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
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
  id v83;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration allowedPayloadKeys](CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v83 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteAddress"), 1, 0, &v83);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v83;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    v82 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalIdentifier"), 1, 0, &v82);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v82;
    payloadLocalIdentifier = self->_payloadLocalIdentifier;
    self->_payloadLocalIdentifier = v16;

    if (!v14)
    {
      v81 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteIdentifier"), 1, 0, &v81);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v81;
      payloadRemoteIdentifier = self->_payloadRemoteIdentifier;
      self->_payloadRemoteIdentifier = v18;

      if (!v14)
      {
        v80 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationMethod"), 1, 0, &v80);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v80;
        payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
        self->_payloadAuthenticationMethod = v20;

        if (!v14)
        {
          v79 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v79);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v79;
          payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
          self->_payloadPayloadCertificateUUID = v22;

          if (!v14)
          {
            v78 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SharedSecret"), 0, 0, &v78);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v78;
            payloadSharedSecret = self->_payloadSharedSecret;
            self->_payloadSharedSecret = v24;

            if (!v14)
            {
              v77 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ExtendedAuthEnabled"), 0, &unk_24C69CD58, &v77);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v77;
              payloadExtendedAuthEnabled = self->_payloadExtendedAuthEnabled;
              self->_payloadExtendedAuthEnabled = v26;

              if (!v14)
              {
                v76 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableRedirect"), 0, &unk_24C69CD58, &v76);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v76;
                payloadDisableRedirect = self->_payloadDisableRedirect;
                self->_payloadDisableRedirect = v28;

                if (!v14)
                {
                  v75 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableMOBIKE"), 0, &unk_24C69CD58, &v75);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v75;
                  payloadDisableMOBIKE = self->_payloadDisableMOBIKE;
                  self->_payloadDisableMOBIKE = v30;

                  if (!v14)
                  {
                    v74 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UseConfigurationAttributeInternalIPSubnet"), 0, &unk_24C69CD58, &v74);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v74;
                    payloadUseConfigurationAttributeInternalIPSubnet = self->_payloadUseConfigurationAttributeInternalIPSubnet;
                    self->_payloadUseConfigurationAttributeInternalIPSubnet = v32;

                    if (!v14)
                    {
                      v73 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnablePFS"), 0, &unk_24C69CD58, &v73);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v73;
                      payloadEnablePFS = self->_payloadEnablePFS;
                      self->_payloadEnablePFS = v34;

                      if (!v14)
                      {
                        v72 = 0;
                        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableCertificateRevocationCheck"), 0, &unk_24C69CD58, &v72);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v72;
                        payloadEnableCertificateRevocationCheck = self->_payloadEnableCertificateRevocationCheck;
                        self->_payloadEnableCertificateRevocationCheck = v36;

                        if (!v14)
                        {
                          v71 = 0;
                          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NATKeepAliveOffloadEnable"), 0, &unk_24C69CD70, &v71);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v71;
                          payloadNATKeepAliveOffloadEnable = self->_payloadNATKeepAliveOffloadEnable;
                          self->_payloadNATKeepAliveOffloadEnable = v38;

                          if (!v14)
                          {
                            v70 = 0;
                            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NATKeepAliveInterval"), 0, &unk_24C69CD88, &v70);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v70;
                            payloadNATKeepAliveInterval = self->_payloadNATKeepAliveInterval;
                            self->_payloadNATKeepAliveInterval = v40;

                            if (!v14)
                            {
                              v69 = 0;
                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthName"), 0, 0, &v69);
                              v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                              v14 = v69;
                              payloadAuthName = self->_payloadAuthName;
                              self->_payloadAuthName = v42;

                              if (!v14)
                              {
                                v68 = 0;
                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthPassword"), 0, 0, &v68);
                                v44 = (NSString *)objc_claimAutoreleasedReturnValue();
                                v14 = v68;
                                payloadAuthPassword = self->_payloadAuthPassword;
                                self->_payloadAuthPassword = v44;

                                if (!v14)
                                {
                                  v67 = 0;
                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeadPeerDetectionRate"), 0, CFSTR("Low"), &v67);
                                  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
                                  v14 = v67;
                                  payloadDeadPeerDetectionRate = self->_payloadDeadPeerDetectionRate;
                                  self->_payloadDeadPeerDetectionRate = v46;

                                  if (!v14)
                                  {
                                    v66 = 0;
                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProtocolType"), 1, 0, &v66);
                                    v48 = (NSString *)objc_claimAutoreleasedReturnValue();
                                    v14 = v66;
                                    payloadProtocolType = self->_payloadProtocolType;
                                    self->_payloadProtocolType = v48;

                                    if (!v14)
                                    {
                                      v65 = 0;
                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerCertificateIssuerCommonName"), 0, 0, &v65);
                                      v50 = (NSString *)objc_claimAutoreleasedReturnValue();
                                      v14 = v65;
                                      payloadServerCertificateIssuerCommonName = self->_payloadServerCertificateIssuerCommonName;
                                      self->_payloadServerCertificateIssuerCommonName = v50;

                                      if (!v14)
                                      {
                                        v64 = 0;
                                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerCertificateCommonName"), 0, 0, &v64);
                                        v52 = (NSString *)objc_claimAutoreleasedReturnValue();
                                        v14 = v64;
                                        payloadServerCertificateCommonName = self->_payloadServerCertificateCommonName;
                                        self->_payloadServerCertificateCommonName = v52;

                                        if (!v14)
                                        {
                                          v63 = 0;
                                          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("IKESecurityAssociationParameters"), objc_opt_class(), 0, 0, &v63);
                                          v54 = (CEMNetworkVPNDeclaration_SecurityAssociationParameters *)objc_claimAutoreleasedReturnValue();
                                          v14 = v63;
                                          payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
                                          self->_payloadIKESecurityAssociationParameters = v54;

                                          if (!v14)
                                          {
                                            v62 = 0;
                                            -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ChildSecurityAssociationParameters"), objc_opt_class(), 0, 0, &v62);
                                            v56 = (CEMNetworkVPNDeclaration_SecurityAssociationParameters *)objc_claimAutoreleasedReturnValue();
                                            v14 = v62;
                                            payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
                                            self->_payloadChildSecurityAssociationParameters = v56;

                                            if (!v14)
                                            {
                                              v61 = 0;
                                              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Interfaces"), &__block_literal_global_964, 0, 0, &v61);
                                              v58 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                              v14 = v61;
                                              payloadInterfaces = self->_payloadInterfaces;
                                              self->_payloadInterfaces = v58;

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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadIKESecurityAssociationParameters;
  uint64_t v7;
  id v8;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadChildSecurityAssociationParameters;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoteAddress"), self->_payloadRemoteAddress, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LocalIdentifier"), self->_payloadLocalIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoteIdentifier"), self->_payloadRemoteIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthenticationMethod"), self->_payloadAuthenticationMethod, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PayloadCertificateUUID"), self->_payloadPayloadCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SharedSecret"), self->_payloadSharedSecret, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ExtendedAuthEnabled"), self->_payloadExtendedAuthEnabled, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisableRedirect"), self->_payloadDisableRedirect, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisableMOBIKE"), self->_payloadDisableMOBIKE, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UseConfigurationAttributeInternalIPSubnet"), self->_payloadUseConfigurationAttributeInternalIPSubnet, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnablePFS"), self->_payloadEnablePFS, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnableCertificateRevocationCheck"), self->_payloadEnableCertificateRevocationCheck, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("NATKeepAliveOffloadEnable"), self->_payloadNATKeepAliveOffloadEnable, 0, &unk_24C69CD70);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("NATKeepAliveInterval"), self->_payloadNATKeepAliveInterval, 0, &unk_24C69CD88);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthName"), self->_payloadAuthName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthPassword"), self->_payloadAuthPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DeadPeerDetectionRate"), self->_payloadDeadPeerDetectionRate, 0, CFSTR("Low"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProtocolType"), self->_payloadProtocolType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServerCertificateIssuerCommonName"), self->_payloadServerCertificateIssuerCommonName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServerCertificateCommonName"), self->_payloadServerCertificateCommonName, 0, 0);
  payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IKESecurityAssociationParameters"), payloadIKESecurityAssociationParameters, v18, 0, 0);
  payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
  v13 = v7;
  v14 = 3221225472;
  v15 = __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638560;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("ChildSecurityAssociationParameters"), payloadChildSecurityAssociationParameters, &v13, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Interfaces"), self->_payloadInterfaces, &__block_literal_global_965, 0, 0, v13, v14, v15, v16);
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
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
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration;
  v4 = -[CEMPayloadBase copyWithZone:](&v52, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRemoteAddress, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadLocalIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadRemoteIdentifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadAuthenticationMethod, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadPayloadCertificateUUID, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadSharedSecret, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadExtendedAuthEnabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadDisableRedirect, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadDisableMOBIKE, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadUseConfigurationAttributeInternalIPSubnet, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadEnablePFS, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_payloadEnableCertificateRevocationCheck, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSNumber copy](self->_payloadNATKeepAliveOffloadEnable, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSNumber copy](self->_payloadNATKeepAliveInterval, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSString copy](self->_payloadAuthName, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSString copy](self->_payloadAuthPassword, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSString copy](self->_payloadDeadPeerDetectionRate, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSString copy](self->_payloadProtocolType, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  v41 = -[NSString copy](self->_payloadServerCertificateIssuerCommonName, "copy");
  v42 = (void *)v4[20];
  v4[20] = v41;

  v43 = -[NSString copy](self->_payloadServerCertificateCommonName, "copy");
  v44 = (void *)v4[21];
  v4[21] = v43;

  v45 = -[CEMNetworkVPNDeclaration_SecurityAssociationParameters copy](self->_payloadIKESecurityAssociationParameters, "copy");
  v46 = (void *)v4[22];
  v4[22] = v45;

  v47 = -[CEMNetworkVPNDeclaration_SecurityAssociationParameters copy](self->_payloadChildSecurityAssociationParameters, "copy");
  v48 = (void *)v4[23];
  v4[23] = v47;

  v49 = -[NSArray copy](self->_payloadInterfaces, "copy");
  v50 = (void *)v4[24];
  v4[24] = v49;

  return v4;
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadLocalIdentifier
{
  return self->_payloadLocalIdentifier;
}

- (void)setPayloadLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadRemoteIdentifier
{
  return self->_payloadRemoteIdentifier;
}

- (void)setPayloadRemoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadExtendedAuthEnabled
{
  return self->_payloadExtendedAuthEnabled;
}

- (void)setPayloadExtendedAuthEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadDisableRedirect
{
  return self->_payloadDisableRedirect;
}

- (void)setPayloadDisableRedirect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadDisableMOBIKE
{
  return self->_payloadDisableMOBIKE;
}

- (void)setPayloadDisableMOBIKE:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadUseConfigurationAttributeInternalIPSubnet
{
  return self->_payloadUseConfigurationAttributeInternalIPSubnet;
}

- (void)setPayloadUseConfigurationAttributeInternalIPSubnet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadEnablePFS
{
  return self->_payloadEnablePFS;
}

- (void)setPayloadEnablePFS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadEnableCertificateRevocationCheck
{
  return self->_payloadEnableCertificateRevocationCheck;
}

- (void)setPayloadEnableCertificateRevocationCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadNATKeepAliveOffloadEnable
{
  return self->_payloadNATKeepAliveOffloadEnable;
}

- (void)setPayloadNATKeepAliveOffloadEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadNATKeepAliveInterval
{
  return self->_payloadNATKeepAliveInterval;
}

- (void)setPayloadNATKeepAliveInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadAuthPassword
{
  return self->_payloadAuthPassword;
}

- (void)setPayloadAuthPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)payloadDeadPeerDetectionRate
{
  return self->_payloadDeadPeerDetectionRate;
}

- (void)setPayloadDeadPeerDetectionRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)payloadProtocolType
{
  return self->_payloadProtocolType;
}

- (void)setPayloadProtocolType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)payloadServerCertificateIssuerCommonName
{
  return self->_payloadServerCertificateIssuerCommonName;
}

- (void)setPayloadServerCertificateIssuerCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)payloadServerCertificateCommonName
{
  return self->_payloadServerCertificateCommonName;
}

- (void)setPayloadServerCertificateCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadIKESecurityAssociationParameters
{
  return self->_payloadIKESecurityAssociationParameters;
}

- (void)setPayloadIKESecurityAssociationParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadChildSecurityAssociationParameters
{
  return self->_payloadChildSecurityAssociationParameters;
}

- (void)setPayloadChildSecurityAssociationParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)payloadInterfaces
{
  return self->_payloadInterfaces;
}

- (void)setPayloadInterfaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInterfaces, 0);
  objc_storeStrong((id *)&self->_payloadChildSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadIKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateCommonName, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateIssuerCommonName, 0);
  objc_storeStrong((id *)&self->_payloadProtocolType, 0);
  objc_storeStrong((id *)&self->_payloadDeadPeerDetectionRate, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveOffloadEnable, 0);
  objc_storeStrong((id *)&self->_payloadEnableCertificateRevocationCheck, 0);
  objc_storeStrong((id *)&self->_payloadEnablePFS, 0);
  objc_storeStrong((id *)&self->_payloadUseConfigurationAttributeInternalIPSubnet, 0);
  objc_storeStrong((id *)&self->_payloadDisableMOBIKE, 0);
  objc_storeStrong((id *)&self->_payloadDisableRedirect, 0);
  objc_storeStrong((id *)&self->_payloadExtendedAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end

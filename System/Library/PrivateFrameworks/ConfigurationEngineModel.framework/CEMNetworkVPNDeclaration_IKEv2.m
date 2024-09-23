@implementation CEMNetworkVPNDeclaration_IKEv2

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[25];

  v6[24] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RemoteAddress");
  v6[1] = CFSTR("LocalIdentifier");
  v6[2] = CFSTR("RemoteIdentifier");
  v6[3] = CFSTR("AuthenticationMethod");
  v6[4] = CFSTR("PayloadCertificateUUID");
  v6[5] = CFSTR("SharedSecret");
  v6[6] = CFSTR("ExtendedAuthEnabled");
  v6[7] = CFSTR("AuthName");
  v6[8] = CFSTR("DisableRedirect");
  v6[9] = CFSTR("DisableMOBIKE");
  v6[10] = CFSTR("UseConfigurationAttributeInternalIPSubnet");
  v6[11] = CFSTR("EnablePFS");
  v6[12] = CFSTR("EnableCertificateRevocationCheck");
  v6[13] = CFSTR("AuthPassword");
  v6[14] = CFSTR("DeadPeerDetectionRate");
  v6[15] = CFSTR("CertificateType");
  v6[16] = CFSTR("ServerCertificateIssuerCommonName");
  v6[17] = CFSTR("ServerCertificateCommonName");
  v6[18] = CFSTR("IKESecurityAssociationParameters");
  v6[19] = CFSTR("ChildSecurityAssociationParameters");
  v6[20] = CFSTR("TLSMinimumVersion");
  v6[21] = CFSTR("TLSMaximumVersion");
  v6[22] = CFSTR("NATKeepAliveOffloadEnable");
  v6[23] = CFSTR("NATKeepAliveInterval");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withAuthName:(id)a10 withDisableRedirect:(id)a11 withDisableMOBIKE:(id)a12 withUseConfigurationAttributeInternalIPSubnet:(id)a13 withEnablePFS:(id)a14 withEnableCertificateRevocationCheck:(id)a15 withAuthPassword:(id)a16 withDeadPeerDetectionRate:(id)a17 withCertificateType:(id)a18 withServerCertificateIssuerCommonName:(id)a19 withServerCertificateCommonName:(id)a20 withIKESecurityAssociationParameters:(id)a21 withChildSecurityAssociationParameters:(id)a22 withTLSMinimumVersion:(id)a23 withTLSMaximumVersion:(id)a24 withNATKeepAliveOffloadEnable:(id)a25 withNATKeepAliveInterval:(id)a26
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v49;
  id v56;
  id v57;
  id v58;
  id v59;
  __CFString *v60;
  __CFString *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  __CFString *v66;
  __CFString *v67;
  id v68;
  id v69;

  v69 = a26;
  v68 = a25;
  v67 = (__CFString *)a24;
  v66 = (__CFString *)a23;
  v65 = a22;
  v64 = a21;
  v63 = a20;
  v62 = a19;
  v61 = (__CFString *)a18;
  v60 = (__CFString *)a17;
  v59 = a16;
  v58 = a15;
  v57 = a14;
  v56 = a13;
  v26 = a12;
  v27 = a11;
  v49 = a10;
  v28 = a9;
  v29 = a8;
  v30 = a7;
  v31 = a6;
  v32 = a5;
  v33 = a4;
  v34 = a3;
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setPayloadRemoteAddress:", v34);

  objc_msgSend(v35, "setPayloadLocalIdentifier:", v33);
  objc_msgSend(v35, "setPayloadRemoteIdentifier:", v32);

  objc_msgSend(v35, "setPayloadAuthenticationMethod:", v31);
  objc_msgSend(v35, "setPayloadPayloadCertificateUUID:", v30);

  objc_msgSend(v35, "setPayloadSharedSecret:", v29);
  if (v28)
    v36 = v28;
  else
    v36 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadExtendedAuthEnabled:", v36);

  objc_msgSend(v35, "setPayloadAuthName:", v49);
  if (v27)
    v37 = v27;
  else
    v37 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadDisableRedirect:", v37);

  if (v26)
    v38 = v26;
  else
    v38 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadDisableMOBIKE:", v38);

  if (v56)
    v39 = v56;
  else
    v39 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadUseConfigurationAttributeInternalIPSubnet:", v39);

  if (v57)
    v40 = v57;
  else
    v40 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadEnablePFS:", v40);

  if (v58)
    v41 = v58;
  else
    v41 = &unk_24C69CD58;
  objc_msgSend(v35, "setPayloadEnableCertificateRevocationCheck:", v41);

  objc_msgSend(v35, "setPayloadAuthPassword:", v59);
  if (v60)
    v42 = v60;
  else
    v42 = CFSTR("Medium");
  objc_msgSend(v35, "setPayloadDeadPeerDetectionRate:", v42);

  if (v61)
    v43 = v61;
  else
    v43 = CFSTR("RSA");
  objc_msgSend(v35, "setPayloadCertificateType:", v43);

  objc_msgSend(v35, "setPayloadServerCertificateIssuerCommonName:", v62);
  objc_msgSend(v35, "setPayloadServerCertificateCommonName:", v63);

  objc_msgSend(v35, "setPayloadIKESecurityAssociationParameters:", v64);
  objc_msgSend(v35, "setPayloadChildSecurityAssociationParameters:", v65);

  if (v66)
    v44 = v66;
  else
    v44 = CFSTR("1.0");
  objc_msgSend(v35, "setPayloadTLSMinimumVersion:", v44);

  if (v67)
    v45 = v67;
  else
    v45 = CFSTR("1.2");
  objc_msgSend(v35, "setPayloadTLSMaximumVersion:", v45);

  if (v68)
    v46 = v68;
  else
    v46 = &unk_24C69CD70;
  objc_msgSend(v35, "setPayloadNATKeepAliveOffloadEnable:", v46);

  if (v69)
    v47 = v69;
  else
    v47 = &unk_24C69CD88;
  objc_msgSend(v35, "setPayloadNATKeepAliveInterval:", v47);

  return v35;
}

+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadRemoteAddress:", v12);

  objc_msgSend(v13, "setPayloadLocalIdentifier:", v11);
  objc_msgSend(v13, "setPayloadRemoteIdentifier:", v10);

  objc_msgSend(v13, "setPayloadAuthenticationMethod:", v9);
  return v13;
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
  NSString *v28;
  NSString *payloadAuthName;
  NSNumber *v30;
  NSNumber *payloadDisableRedirect;
  NSNumber *v32;
  NSNumber *payloadDisableMOBIKE;
  NSNumber *v34;
  NSNumber *payloadUseConfigurationAttributeInternalIPSubnet;
  NSNumber *v36;
  NSNumber *payloadEnablePFS;
  NSNumber *v38;
  NSNumber *payloadEnableCertificateRevocationCheck;
  NSString *v40;
  NSString *payloadAuthPassword;
  NSString *v42;
  NSString *payloadDeadPeerDetectionRate;
  NSString *v44;
  NSString *payloadCertificateType;
  NSString *v46;
  NSString *payloadServerCertificateIssuerCommonName;
  NSString *v48;
  NSString *payloadServerCertificateCommonName;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *v50;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadIKESecurityAssociationParameters;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *v52;
  CEMNetworkVPNDeclaration_SecurityAssociationParameters *payloadChildSecurityAssociationParameters;
  NSString *v54;
  NSString *payloadTLSMinimumVersion;
  NSString *v56;
  NSString *payloadTLSMaximumVersion;
  NSNumber *v58;
  NSNumber *payloadNATKeepAliveOffloadEnable;
  NSNumber *v60;
  NSNumber *payloadNATKeepAliveInterval;
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
  id v84;
  id v85;
  id v86;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_IKEv2 allowedPayloadKeys](CEMNetworkVPNDeclaration_IKEv2, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v86 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteAddress"), 1, 0, &v86);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v86;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    v85 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalIdentifier"), 1, 0, &v85);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v85;
    payloadLocalIdentifier = self->_payloadLocalIdentifier;
    self->_payloadLocalIdentifier = v16;

    if (!v14)
    {
      v84 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteIdentifier"), 1, 0, &v84);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v84;
      payloadRemoteIdentifier = self->_payloadRemoteIdentifier;
      self->_payloadRemoteIdentifier = v18;

      if (!v14)
      {
        v83 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationMethod"), 1, 0, &v83);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v83;
        payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
        self->_payloadAuthenticationMethod = v20;

        if (!v14)
        {
          v82 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v82);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v82;
          payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
          self->_payloadPayloadCertificateUUID = v22;

          if (!v14)
          {
            v81 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SharedSecret"), 0, 0, &v81);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v81;
            payloadSharedSecret = self->_payloadSharedSecret;
            self->_payloadSharedSecret = v24;

            if (!v14)
            {
              v80 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ExtendedAuthEnabled"), 0, &unk_24C69CD58, &v80);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v80;
              payloadExtendedAuthEnabled = self->_payloadExtendedAuthEnabled;
              self->_payloadExtendedAuthEnabled = v26;

              if (!v14)
              {
                v79 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthName"), 0, 0, &v79);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v79;
                payloadAuthName = self->_payloadAuthName;
                self->_payloadAuthName = v28;

                if (!v14)
                {
                  v78 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableRedirect"), 0, &unk_24C69CD58, &v78);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v78;
                  payloadDisableRedirect = self->_payloadDisableRedirect;
                  self->_payloadDisableRedirect = v30;

                  if (!v14)
                  {
                    v77 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableMOBIKE"), 0, &unk_24C69CD58, &v77);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v77;
                    payloadDisableMOBIKE = self->_payloadDisableMOBIKE;
                    self->_payloadDisableMOBIKE = v32;

                    if (!v14)
                    {
                      v76 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UseConfigurationAttributeInternalIPSubnet"), 0, &unk_24C69CD58, &v76);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v76;
                      payloadUseConfigurationAttributeInternalIPSubnet = self->_payloadUseConfigurationAttributeInternalIPSubnet;
                      self->_payloadUseConfigurationAttributeInternalIPSubnet = v34;

                      if (!v14)
                      {
                        v75 = 0;
                        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnablePFS"), 0, &unk_24C69CD58, &v75);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v75;
                        payloadEnablePFS = self->_payloadEnablePFS;
                        self->_payloadEnablePFS = v36;

                        if (!v14)
                        {
                          v74 = 0;
                          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableCertificateRevocationCheck"), 0, &unk_24C69CD58, &v74);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v74;
                          payloadEnableCertificateRevocationCheck = self->_payloadEnableCertificateRevocationCheck;
                          self->_payloadEnableCertificateRevocationCheck = v38;

                          if (!v14)
                          {
                            v73 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthPassword"), 0, 0, &v73);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v73;
                            payloadAuthPassword = self->_payloadAuthPassword;
                            self->_payloadAuthPassword = v40;

                            if (!v14)
                            {
                              v72 = 0;
                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeadPeerDetectionRate"), 0, CFSTR("Medium"), &v72);
                              v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                              v14 = v72;
                              payloadDeadPeerDetectionRate = self->_payloadDeadPeerDetectionRate;
                              self->_payloadDeadPeerDetectionRate = v42;

                              if (!v14)
                              {
                                v71 = 0;
                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertificateType"), 0, CFSTR("RSA"), &v71);
                                v44 = (NSString *)objc_claimAutoreleasedReturnValue();
                                v14 = v71;
                                payloadCertificateType = self->_payloadCertificateType;
                                self->_payloadCertificateType = v44;

                                if (!v14)
                                {
                                  v70 = 0;
                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerCertificateIssuerCommonName"), 0, 0, &v70);
                                  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
                                  v14 = v70;
                                  payloadServerCertificateIssuerCommonName = self->_payloadServerCertificateIssuerCommonName;
                                  self->_payloadServerCertificateIssuerCommonName = v46;

                                  if (!v14)
                                  {
                                    v69 = 0;
                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerCertificateCommonName"), 0, 0, &v69);
                                    v48 = (NSString *)objc_claimAutoreleasedReturnValue();
                                    v14 = v69;
                                    payloadServerCertificateCommonName = self->_payloadServerCertificateCommonName;
                                    self->_payloadServerCertificateCommonName = v48;

                                    if (!v14)
                                    {
                                      v68 = 0;
                                      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("IKESecurityAssociationParameters"), objc_opt_class(), 0, 0, &v68);
                                      v50 = (CEMNetworkVPNDeclaration_SecurityAssociationParameters *)objc_claimAutoreleasedReturnValue();
                                      v14 = v68;
                                      payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
                                      self->_payloadIKESecurityAssociationParameters = v50;

                                      if (!v14)
                                      {
                                        v67 = 0;
                                        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ChildSecurityAssociationParameters"), objc_opt_class(), 0, 0, &v67);
                                        v52 = (CEMNetworkVPNDeclaration_SecurityAssociationParameters *)objc_claimAutoreleasedReturnValue();
                                        v14 = v67;
                                        payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
                                        self->_payloadChildSecurityAssociationParameters = v52;

                                        if (!v14)
                                        {
                                          v66 = 0;
                                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSMinimumVersion"), 0, CFSTR("1.0"), &v66);
                                          v54 = (NSString *)objc_claimAutoreleasedReturnValue();
                                          v14 = v66;
                                          payloadTLSMinimumVersion = self->_payloadTLSMinimumVersion;
                                          self->_payloadTLSMinimumVersion = v54;

                                          if (!v14)
                                          {
                                            v65 = 0;
                                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSMaximumVersion"), 0, CFSTR("1.2"), &v65);
                                            v56 = (NSString *)objc_claimAutoreleasedReturnValue();
                                            v14 = v65;
                                            payloadTLSMaximumVersion = self->_payloadTLSMaximumVersion;
                                            self->_payloadTLSMaximumVersion = v56;

                                            if (!v14)
                                            {
                                              v64 = 0;
                                              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NATKeepAliveOffloadEnable"), 0, &unk_24C69CD70, &v64);
                                              v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                              v14 = v64;
                                              payloadNATKeepAliveOffloadEnable = self->_payloadNATKeepAliveOffloadEnable;
                                              self->_payloadNATKeepAliveOffloadEnable = v58;

                                              if (!v14)
                                              {
                                                v63 = 0;
                                                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NATKeepAliveInterval"), 0, &unk_24C69CD88, &v63);
                                                v60 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                v14 = v63;
                                                payloadNATKeepAliveInterval = self->_payloadNATKeepAliveInterval;
                                                self->_payloadNATKeepAliveInterval = v60;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthName"), self->_payloadAuthName, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisableRedirect"), self->_payloadDisableRedirect, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisableMOBIKE"), self->_payloadDisableMOBIKE, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UseConfigurationAttributeInternalIPSubnet"), self->_payloadUseConfigurationAttributeInternalIPSubnet, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnablePFS"), self->_payloadEnablePFS, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnableCertificateRevocationCheck"), self->_payloadEnableCertificateRevocationCheck, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthPassword"), self->_payloadAuthPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DeadPeerDetectionRate"), self->_payloadDeadPeerDetectionRate, 0, CFSTR("Medium"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CertificateType"), self->_payloadCertificateType, 0, CFSTR("RSA"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServerCertificateIssuerCommonName"), self->_payloadServerCertificateIssuerCommonName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServerCertificateCommonName"), self->_payloadServerCertificateCommonName, 0, 0);
  payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IKESecurityAssociationParameters"), payloadIKESecurityAssociationParameters, v18, 0, 0);
  payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
  v13 = v7;
  v14 = 3221225472;
  v15 = __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638560;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("ChildSecurityAssociationParameters"), payloadChildSecurityAssociationParameters, &v13, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("TLSMinimumVersion"), self->_payloadTLSMinimumVersion, 0, CFSTR("1.0"), v13, v14, v15, v16);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("TLSMaximumVersion"), self->_payloadTLSMaximumVersion, 0, CFSTR("1.2"));
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("NATKeepAliveOffloadEnable"), self->_payloadNATKeepAliveOffloadEnable, 0, &unk_24C69CD70);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("NATKeepAliveInterval"), self->_payloadNATKeepAliveInterval, 0, &unk_24C69CD88);
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
  uint64_t v51;
  void *v52;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)CEMNetworkVPNDeclaration_IKEv2;
  v4 = -[CEMPayloadBase copyWithZone:](&v54, sel_copyWithZone_, a3);
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

  v19 = -[NSString copy](self->_payloadAuthName, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadDisableRedirect, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadDisableMOBIKE, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadUseConfigurationAttributeInternalIPSubnet, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_payloadEnablePFS, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSNumber copy](self->_payloadEnableCertificateRevocationCheck, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSString copy](self->_payloadAuthPassword, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSString copy](self->_payloadDeadPeerDetectionRate, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSString copy](self->_payloadCertificateType, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSString copy](self->_payloadServerCertificateIssuerCommonName, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSString copy](self->_payloadServerCertificateCommonName, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  v41 = -[CEMNetworkVPNDeclaration_SecurityAssociationParameters copy](self->_payloadIKESecurityAssociationParameters, "copy");
  v42 = (void *)v4[20];
  v4[20] = v41;

  v43 = -[CEMNetworkVPNDeclaration_SecurityAssociationParameters copy](self->_payloadChildSecurityAssociationParameters, "copy");
  v44 = (void *)v4[21];
  v4[21] = v43;

  v45 = -[NSString copy](self->_payloadTLSMinimumVersion, "copy");
  v46 = (void *)v4[22];
  v4[22] = v45;

  v47 = -[NSString copy](self->_payloadTLSMaximumVersion, "copy");
  v48 = (void *)v4[23];
  v4[23] = v47;

  v49 = -[NSNumber copy](self->_payloadNATKeepAliveOffloadEnable, "copy");
  v50 = (void *)v4[24];
  v4[24] = v49;

  v51 = -[NSNumber copy](self->_payloadNATKeepAliveInterval, "copy");
  v52 = (void *)v4[25];
  v4[25] = v51;

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

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadDisableRedirect
{
  return self->_payloadDisableRedirect;
}

- (void)setPayloadDisableRedirect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadDisableMOBIKE
{
  return self->_payloadDisableMOBIKE;
}

- (void)setPayloadDisableMOBIKE:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadUseConfigurationAttributeInternalIPSubnet
{
  return self->_payloadUseConfigurationAttributeInternalIPSubnet;
}

- (void)setPayloadUseConfigurationAttributeInternalIPSubnet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadEnablePFS
{
  return self->_payloadEnablePFS;
}

- (void)setPayloadEnablePFS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadEnableCertificateRevocationCheck
{
  return self->_payloadEnableCertificateRevocationCheck;
}

- (void)setPayloadEnableCertificateRevocationCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadAuthPassword
{
  return self->_payloadAuthPassword;
}

- (void)setPayloadAuthPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadDeadPeerDetectionRate
{
  return self->_payloadDeadPeerDetectionRate;
}

- (void)setPayloadDeadPeerDetectionRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadCertificateType
{
  return self->_payloadCertificateType;
}

- (void)setPayloadCertificateType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)payloadServerCertificateIssuerCommonName
{
  return self->_payloadServerCertificateIssuerCommonName;
}

- (void)setPayloadServerCertificateIssuerCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)payloadServerCertificateCommonName
{
  return self->_payloadServerCertificateCommonName;
}

- (void)setPayloadServerCertificateCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadIKESecurityAssociationParameters
{
  return self->_payloadIKESecurityAssociationParameters;
}

- (void)setPayloadIKESecurityAssociationParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadChildSecurityAssociationParameters
{
  return self->_payloadChildSecurityAssociationParameters;
}

- (void)setPayloadChildSecurityAssociationParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)payloadTLSMinimumVersion
{
  return self->_payloadTLSMinimumVersion;
}

- (void)setPayloadTLSMinimumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)payloadTLSMaximumVersion
{
  return self->_payloadTLSMaximumVersion;
}

- (void)setPayloadTLSMaximumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadNATKeepAliveOffloadEnable
{
  return self->_payloadNATKeepAliveOffloadEnable;
}

- (void)setPayloadNATKeepAliveOffloadEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadNATKeepAliveInterval
{
  return self->_payloadNATKeepAliveInterval;
}

- (void)setPayloadNATKeepAliveInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNATKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveOffloadEnable, 0);
  objc_storeStrong((id *)&self->_payloadTLSMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTLSMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadChildSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadIKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateCommonName, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateIssuerCommonName, 0);
  objc_storeStrong((id *)&self->_payloadCertificateType, 0);
  objc_storeStrong((id *)&self->_payloadDeadPeerDetectionRate, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadEnableCertificateRevocationCheck, 0);
  objc_storeStrong((id *)&self->_payloadEnablePFS, 0);
  objc_storeStrong((id *)&self->_payloadUseConfigurationAttributeInternalIPSubnet, 0);
  objc_storeStrong((id *)&self->_payloadDisableMOBIKE, 0);
  objc_storeStrong((id *)&self->_payloadDisableRedirect, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
  objc_storeStrong((id *)&self->_payloadExtendedAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end

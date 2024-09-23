@implementation CEMAccountMailDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.mail");
}

+ (id)profileType
{
  return CFSTR("com.apple.mail.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[33];

  v6[32] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("EmailAccountDescription");
  v6[1] = CFSTR("EmailAccountName");
  v6[2] = CFSTR("EmailAccountType");
  v6[3] = CFSTR("EmailAddress");
  v6[4] = CFSTR("IncomingMailServerAuthentication");
  v6[5] = CFSTR("IncomingMailServerHostName");
  v6[6] = CFSTR("IncomingMailServerPortNumber");
  v6[7] = CFSTR("IncomingMailServerUseSSL");
  v6[8] = CFSTR("OutgoingPasswordSameAsIncomingPassword");
  v6[9] = CFSTR("OutgoingMailServerAuthentication");
  v6[10] = CFSTR("OutgoingMailServerPortNumber");
  v6[11] = CFSTR("OutgoingMailServerUseSSL");
  v6[12] = CFSTR("OutgoingMailServerUsername");
  v6[13] = CFSTR("PreventMove");
  v6[14] = CFSTR("PreventAppSheet");
  v6[15] = CFSTR("SMIMEEnabled");
  v6[16] = CFSTR("SMIMESigningEnabled");
  v6[17] = CFSTR("SMIMESigningCertificateUUID");
  v6[18] = CFSTR("SMIMEEncryptionEnabled");
  v6[19] = CFSTR("SMIMEEncryptionCertificateUUID");
  v6[20] = CFSTR("SMIMEEnablePerMessageSwitch");
  v6[21] = CFSTR("disableMailRecentsSyncing");
  v6[22] = CFSTR("allowMailDrop");
  v6[23] = CFSTR("IncomingMailServerIMAPPathPrefix");
  v6[24] = CFSTR("IncomingCredentials");
  v6[25] = CFSTR("OutgoingCredentials");
  v6[26] = CFSTR("SMIMESigningOverrideable");
  v6[27] = CFSTR("SMIMESigningCertificateUUIDOverrideable");
  v6[28] = CFSTR("SMIMEEncryptByDefault");
  v6[29] = CFSTR("SMIMEEncryptByDefaultOverrideable");
  v6[30] = CFSTR("SMIMEEncryptionCertificateUUIDOverrideable");
  v6[31] = CFSTR("SMIMEEnableEncryptionPerMessageSwitch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 32);
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
  return 2;
}

- (id)assetReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMAccountMailDeclaration payloadIncomingCredentials](self, "payloadIncomingCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("credential"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[CEMAccountMailDeclaration payloadOutgoingCredentials](self, "payloadOutgoingCredentials");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v6, CFSTR("credential"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

+ (id)buildWithIdentifier:(id)a3 withEmailAccountDescription:(id)a4 withEmailAccountName:(id)a5 withEmailAccountType:(id)a6 withEmailAddress:(id)a7 withIncomingMailServerAuthentication:(id)a8 withIncomingMailServerHostName:(id)a9 withIncomingMailServerPortNumber:(id)a10 withIncomingMailServerUseSSL:(id)a11 withOutgoingPasswordSameAsIncomingPassword:(id)a12 withOutgoingMailServerAuthentication:(id)a13 withOutgoingMailServerPortNumber:(id)a14 withOutgoingMailServerUseSSL:(id)a15 withOutgoingMailServerUsername:(id)a16 withPreventMove:(id)a17 withPreventAppSheet:(id)a18 withSMIMEEnabled:(id)a19 withSMIMESigningEnabled:(id)a20 withSMIMESigningCertificateUUID:(id)a21 withSMIMEEncryptionEnabled:(id)a22 withSMIMEEncryptionCertificateUUID:(id)a23 withSMIMEEnablePerMessageSwitch:(id)a24 withDisableMailRecentsSyncing:(id)a25 withAllowMailDrop:(id)a26 withIncomingMailServerIMAPPathPrefix:(id)a27 withIncomingCredentials:(id)a28 withOutgoingCredentials:(id)a29 withSMIMESigningOverrideable:(id)a30 withSMIMESigningCertificateUUIDOverrideable:(id)a31 withSMIMEEncryptByDefault:(id)a32 withSMIMEEncryptByDefaultOverrideable:(id)a33 withSMIMEEncryptionCertificateUUIDOverrideable:(id)a34 withSMIMEEnableEncryptionPerMessageSwitch:(id)a35
{
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v68;
  id v69;
  id v70;
  id v71;
  id v73;
  id v76;
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

  v35 = a3;
  v97 = a35;
  v96 = a34;
  v95 = a33;
  v36 = a32;
  v37 = a31;
  v38 = a30;
  v94 = a29;
  v93 = a28;
  v92 = a27;
  v91 = a26;
  v90 = a25;
  v89 = a24;
  v88 = a23;
  v87 = a22;
  v86 = a21;
  v85 = a20;
  v84 = a19;
  v83 = a18;
  v82 = a17;
  v81 = a16;
  v80 = a15;
  v76 = a14;
  v71 = a13;
  v69 = a12;
  v68 = a11;
  v39 = a10;
  v70 = a9;
  v73 = a8;
  v40 = a7;
  v41 = a6;
  v42 = a5;
  v43 = a4;
  v44 = (void *)objc_opt_new();
  objc_msgSend(v44, "setDeclarationType:", CFSTR("com.apple.configuration.account.mail"));
  if (v35)
  {
    objc_msgSend(v44, "setDeclarationIdentifier:", v35);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v79 = v37;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDeclarationIdentifier:", v46);

    v35 = 0;
    v37 = v79;
  }
  objc_msgSend(v44, "setPayloadEmailAccountDescription:", v43);

  objc_msgSend(v44, "setPayloadEmailAccountName:", v42);
  objc_msgSend(v44, "setPayloadEmailAccountType:", v41);

  objc_msgSend(v44, "setPayloadEmailAddress:", v40);
  objc_msgSend(v44, "setPayloadIncomingMailServerAuthentication:", v73);

  objc_msgSend(v44, "setPayloadIncomingMailServerHostName:", v70);
  if (v39)
    v47 = v39;
  else
    v47 = &unk_24C69CC50;
  objc_msgSend(v44, "setPayloadIncomingMailServerPortNumber:", v47);

  v48 = (void *)MEMORY[0x24BDBD1C0];
  if (v68)
    v49 = v68;
  else
    v49 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v44, "setPayloadIncomingMailServerUseSSL:", v49);

  if (v69)
    v50 = v69;
  else
    v50 = v48;
  objc_msgSend(v44, "setPayloadOutgoingPasswordSameAsIncomingPassword:", v50);

  objc_msgSend(v44, "setPayloadOutgoingMailServerAuthentication:", v71);
  if (v76)
    v51 = v76;
  else
    v51 = &unk_24C69CC68;
  objc_msgSend(v44, "setPayloadOutgoingMailServerPortNumber:", v51);

  if (v80)
    v52 = v80;
  else
    v52 = v48;
  objc_msgSend(v44, "setPayloadOutgoingMailServerUseSSL:", v52);

  objc_msgSend(v44, "setPayloadOutgoingMailServerUsername:", v81);
  if (v82)
    v53 = v82;
  else
    v53 = v48;
  objc_msgSend(v44, "setPayloadPreventMove:", v53);

  if (v83)
    v54 = v83;
  else
    v54 = v48;
  objc_msgSend(v44, "setPayloadPreventAppSheet:", v54);

  if (v84)
    v55 = v84;
  else
    v55 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEnabled:", v55);

  if (v85)
    v56 = v85;
  else
    v56 = v48;
  objc_msgSend(v44, "setPayloadSMIMESigningEnabled:", v56);

  objc_msgSend(v44, "setPayloadSMIMESigningCertificateUUID:", v86);
  if (v87)
    v57 = v87;
  else
    v57 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEncryptionEnabled:", v57);

  objc_msgSend(v44, "setPayloadSMIMEEncryptionCertificateUUID:", v88);
  if (v89)
    v58 = v89;
  else
    v58 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEnablePerMessageSwitch:", v58);

  if (v90)
    v59 = v90;
  else
    v59 = v48;
  objc_msgSend(v44, "setPayloadDisableMailRecentsSyncing:", v59);

  if (v91)
    v60 = v91;
  else
    v60 = v48;
  objc_msgSend(v44, "setPayloadAllowMailDrop:", v60);

  objc_msgSend(v44, "setPayloadIncomingMailServerIMAPPathPrefix:", v92);
  objc_msgSend(v44, "setPayloadIncomingCredentials:", v93);

  objc_msgSend(v44, "setPayloadOutgoingCredentials:", v94);
  if (v38)
    v61 = v38;
  else
    v61 = v48;
  objc_msgSend(v44, "setPayloadSMIMESigningOverrideable:", v61);

  if (v37)
    v62 = v37;
  else
    v62 = v48;
  objc_msgSend(v44, "setPayloadSMIMESigningCertificateUUIDOverrideable:", v62);

  if (v36)
    v63 = v36;
  else
    v63 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEncryptByDefault:", v63);

  if (v95)
    v64 = v95;
  else
    v64 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEncryptByDefaultOverrideable:", v64);

  if (v96)
    v65 = v96;
  else
    v65 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEncryptionCertificateUUIDOverrideable:", v65);

  if (v97)
    v66 = v97;
  else
    v66 = v48;
  objc_msgSend(v44, "setPayloadSMIMEEnableEncryptionPerMessageSwitch:", v66);

  objc_msgSend(v44, "updateServerHash");
  return v44;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAccountType:(id)a4 withIncomingMailServerAuthentication:(id)a5 withIncomingMailServerHostName:(id)a6 withOutgoingMailServerAuthentication:(id)a7
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
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.account.mail"));
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
  objc_msgSend(v16, "setPayloadEmailAccountType:", v15);

  objc_msgSend(v16, "setPayloadIncomingMailServerAuthentication:", v14);
  objc_msgSend(v16, "setPayloadIncomingMailServerHostName:", v13);

  objc_msgSend(v16, "setPayloadOutgoingMailServerAuthentication:", v12);
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
  NSString *v13;
  id v14;
  NSString *payloadEmailAccountDescription;
  NSString *v16;
  NSString *payloadEmailAccountName;
  NSString *v18;
  NSString *payloadEmailAccountType;
  NSString *v20;
  NSString *payloadEmailAddress;
  NSString *v22;
  NSString *payloadIncomingMailServerAuthentication;
  NSString *v24;
  NSString *payloadIncomingMailServerHostName;
  NSNumber *v26;
  NSNumber *payloadIncomingMailServerPortNumber;
  NSNumber *v28;
  NSNumber *payloadIncomingMailServerUseSSL;
  NSNumber *v30;
  NSNumber *payloadOutgoingPasswordSameAsIncomingPassword;
  NSString *v32;
  NSString *payloadOutgoingMailServerAuthentication;
  NSNumber *v34;
  NSNumber *payloadOutgoingMailServerPortNumber;
  NSNumber *v36;
  NSNumber *payloadOutgoingMailServerUseSSL;
  NSString *v38;
  NSString *payloadOutgoingMailServerUsername;
  NSNumber *v40;
  NSNumber *payloadPreventMove;
  NSNumber *v42;
  NSNumber *payloadPreventAppSheet;
  NSNumber *v44;
  NSNumber *payloadSMIMEEnabled;
  NSNumber *v46;
  NSNumber *payloadSMIMESigningEnabled;
  NSString *v48;
  NSString *payloadSMIMESigningCertificateUUID;
  NSNumber *v50;
  NSNumber *payloadSMIMEEncryptionEnabled;
  NSString *v52;
  NSString *payloadSMIMEEncryptionCertificateUUID;
  NSNumber *v54;
  NSNumber *payloadSMIMEEnablePerMessageSwitch;
  NSNumber *v56;
  NSNumber *payloadDisableMailRecentsSyncing;
  NSNumber *v58;
  NSNumber *payloadAllowMailDrop;
  NSString *v60;
  NSString *payloadIncomingMailServerIMAPPathPrefix;
  NSString *v62;
  NSString *payloadIncomingCredentials;
  NSString *v64;
  NSString *payloadOutgoingCredentials;
  NSNumber *v66;
  NSNumber *payloadSMIMESigningOverrideable;
  NSNumber *v68;
  NSNumber *payloadSMIMESigningCertificateUUIDOverrideable;
  NSNumber *v70;
  NSNumber *payloadSMIMEEncryptByDefault;
  NSNumber *v72;
  NSNumber *payloadSMIMEEncryptByDefaultOverrideable;
  NSNumber *v74;
  NSNumber *payloadSMIMEEncryptionCertificateUUIDOverrideable;
  NSNumber *v76;
  NSNumber *payloadSMIMEEnableEncryptionPerMessageSwitch;
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
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMAccountMailDeclaration allowedPayloadKeys](CEMAccountMailDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v110 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmailAccountDescription"), 0, 0, &v110);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v110;
  payloadEmailAccountDescription = self->_payloadEmailAccountDescription;
  self->_payloadEmailAccountDescription = v13;

  if (!v14)
  {
    v109 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmailAccountName"), 0, 0, &v109);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v109;
    payloadEmailAccountName = self->_payloadEmailAccountName;
    self->_payloadEmailAccountName = v16;

    if (!v14)
    {
      v108 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmailAccountType"), 1, 0, &v108);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v108;
      payloadEmailAccountType = self->_payloadEmailAccountType;
      self->_payloadEmailAccountType = v18;

      if (!v14)
      {
        v107 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmailAddress"), 0, 0, &v107);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v107;
        payloadEmailAddress = self->_payloadEmailAddress;
        self->_payloadEmailAddress = v20;

        if (!v14)
        {
          v106 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingMailServerAuthentication"), 1, 0, &v106);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v106;
          payloadIncomingMailServerAuthentication = self->_payloadIncomingMailServerAuthentication;
          self->_payloadIncomingMailServerAuthentication = v22;

          if (!v14)
          {
            v105 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingMailServerHostName"), 1, 0, &v105);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v105;
            payloadIncomingMailServerHostName = self->_payloadIncomingMailServerHostName;
            self->_payloadIncomingMailServerHostName = v24;

            if (!v14)
            {
              v104 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingMailServerPortNumber"), 0, &unk_24C69CC50, &v104);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v104;
              payloadIncomingMailServerPortNumber = self->_payloadIncomingMailServerPortNumber;
              self->_payloadIncomingMailServerPortNumber = v26;

              if (!v14)
              {
                v103 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingMailServerUseSSL"), 0, MEMORY[0x24BDBD1C0], &v103);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v103;
                payloadIncomingMailServerUseSSL = self->_payloadIncomingMailServerUseSSL;
                self->_payloadIncomingMailServerUseSSL = v28;

                if (!v14)
                {
                  v102 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingPasswordSameAsIncomingPassword"), 0, MEMORY[0x24BDBD1C0], &v102);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v102;
                  payloadOutgoingPasswordSameAsIncomingPassword = self->_payloadOutgoingPasswordSameAsIncomingPassword;
                  self->_payloadOutgoingPasswordSameAsIncomingPassword = v30;

                  if (!v14)
                  {
                    v101 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingMailServerAuthentication"), 1, 0, &v101);
                    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v14 = v101;
                    payloadOutgoingMailServerAuthentication = self->_payloadOutgoingMailServerAuthentication;
                    self->_payloadOutgoingMailServerAuthentication = v32;

                    if (!v14)
                    {
                      v100 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingMailServerPortNumber"), 0, &unk_24C69CC68, &v100);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v100;
                      payloadOutgoingMailServerPortNumber = self->_payloadOutgoingMailServerPortNumber;
                      self->_payloadOutgoingMailServerPortNumber = v34;

                      if (!v14)
                      {
                        v99 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingMailServerUseSSL"), 0, MEMORY[0x24BDBD1C0], &v99);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v99;
                        payloadOutgoingMailServerUseSSL = self->_payloadOutgoingMailServerUseSSL;
                        self->_payloadOutgoingMailServerUseSSL = v36;

                        if (!v14)
                        {
                          v98 = 0;
                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingMailServerUsername"), 0, 0, &v98);
                          v38 = (NSString *)objc_claimAutoreleasedReturnValue();
                          v14 = v98;
                          payloadOutgoingMailServerUsername = self->_payloadOutgoingMailServerUsername;
                          self->_payloadOutgoingMailServerUsername = v38;

                          if (!v14)
                          {
                            v97 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreventMove"), 0, MEMORY[0x24BDBD1C0], &v97);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v97;
                            payloadPreventMove = self->_payloadPreventMove;
                            self->_payloadPreventMove = v40;

                            if (!v14)
                            {
                              v96 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreventAppSheet"), 0, MEMORY[0x24BDBD1C0], &v96);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v96;
                              payloadPreventAppSheet = self->_payloadPreventAppSheet;
                              self->_payloadPreventAppSheet = v42;

                              if (!v14)
                              {
                                v95 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEnabled"), 0, MEMORY[0x24BDBD1C0], &v95);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v95;
                                payloadSMIMEEnabled = self->_payloadSMIMEEnabled;
                                self->_payloadSMIMEEnabled = v44;

                                if (!v14)
                                {
                                  v94 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMESigningEnabled"), 0, MEMORY[0x24BDBD1C0], &v94);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v94;
                                  payloadSMIMESigningEnabled = self->_payloadSMIMESigningEnabled;
                                  self->_payloadSMIMESigningEnabled = v46;

                                  if (!v14)
                                  {
                                    v93 = 0;
                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMESigningCertificateUUID"), 0, 0, &v93);
                                    v48 = (NSString *)objc_claimAutoreleasedReturnValue();
                                    v14 = v93;
                                    payloadSMIMESigningCertificateUUID = self->_payloadSMIMESigningCertificateUUID;
                                    self->_payloadSMIMESigningCertificateUUID = v48;

                                    if (!v14)
                                    {
                                      v92 = 0;
                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEncryptionEnabled"), 0, MEMORY[0x24BDBD1C0], &v92);
                                      v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                      v14 = v92;
                                      payloadSMIMEEncryptionEnabled = self->_payloadSMIMEEncryptionEnabled;
                                      self->_payloadSMIMEEncryptionEnabled = v50;

                                      if (!v14)
                                      {
                                        v91 = 0;
                                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEncryptionCertificateUUID"), 0, 0, &v91);
                                        v52 = (NSString *)objc_claimAutoreleasedReturnValue();
                                        v14 = v91;
                                        payloadSMIMEEncryptionCertificateUUID = self->_payloadSMIMEEncryptionCertificateUUID;
                                        self->_payloadSMIMEEncryptionCertificateUUID = v52;

                                        if (!v14)
                                        {
                                          v90 = 0;
                                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEnablePerMessageSwitch"), 0, MEMORY[0x24BDBD1C0], &v90);
                                          v54 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                          v14 = v90;
                                          payloadSMIMEEnablePerMessageSwitch = self->_payloadSMIMEEnablePerMessageSwitch;
                                          self->_payloadSMIMEEnablePerMessageSwitch = v54;

                                          if (!v14)
                                          {
                                            v89 = 0;
                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("disableMailRecentsSyncing"), 0, MEMORY[0x24BDBD1C0], &v89);
                                            v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                            v14 = v89;
                                            payloadDisableMailRecentsSyncing = self->_payloadDisableMailRecentsSyncing;
                                            self->_payloadDisableMailRecentsSyncing = v56;

                                            if (!v14)
                                            {
                                              v88 = 0;
                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMailDrop"), 0, MEMORY[0x24BDBD1C0], &v88);
                                              v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                              v14 = v88;
                                              payloadAllowMailDrop = self->_payloadAllowMailDrop;
                                              self->_payloadAllowMailDrop = v58;

                                              if (!v14)
                                              {
                                                v87 = 0;
                                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingMailServerIMAPPathPrefix"), 0, 0, &v87);
                                                v60 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                v14 = v87;
                                                payloadIncomingMailServerIMAPPathPrefix = self->_payloadIncomingMailServerIMAPPathPrefix;
                                                self->_payloadIncomingMailServerIMAPPathPrefix = v60;

                                                if (!v14)
                                                {
                                                  v86 = 0;
                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncomingCredentials"), 0, 0, &v86);
                                                  v62 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                  v14 = v86;
                                                  payloadIncomingCredentials = self->_payloadIncomingCredentials;
                                                  self->_payloadIncomingCredentials = v62;

                                                  if (!v14)
                                                  {
                                                    v85 = 0;
                                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutgoingCredentials"), 0, 0, &v85);
                                                    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                    v14 = v85;
                                                    payloadOutgoingCredentials = self->_payloadOutgoingCredentials;
                                                    self->_payloadOutgoingCredentials = v64;

                                                    if (!v14)
                                                    {
                                                      v84 = 0;
                                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMESigningOverrideable"), 0, MEMORY[0x24BDBD1C0], &v84);
                                                      v66 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                      v14 = v84;
                                                      payloadSMIMESigningOverrideable = self->_payloadSMIMESigningOverrideable;
                                                      self->_payloadSMIMESigningOverrideable = v66;

                                                      if (!v14)
                                                      {
                                                        v83 = 0;
                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMESigningCertificateUUIDOverrideable"), 0, MEMORY[0x24BDBD1C0], &v83);
                                                        v68 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                        v14 = v83;
                                                        payloadSMIMESigningCertificateUUIDOverrideable = self->_payloadSMIMESigningCertificateUUIDOverrideable;
                                                        self->_payloadSMIMESigningCertificateUUIDOverrideable = v68;

                                                        if (!v14)
                                                        {
                                                          v82 = 0;
                                                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEncryptByDefault"), 0, MEMORY[0x24BDBD1C0], &v82);
                                                          v70 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                          v14 = v82;
                                                          payloadSMIMEEncryptByDefault = self->_payloadSMIMEEncryptByDefault;
                                                          self->_payloadSMIMEEncryptByDefault = v70;

                                                          if (!v14)
                                                          {
                                                            v81 = 0;
                                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEncryptByDefaultOverrideable"), 0, MEMORY[0x24BDBD1C0], &v81);
                                                            v72 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                            v14 = v81;
                                                            payloadSMIMEEncryptByDefaultOverrideable = self->_payloadSMIMEEncryptByDefaultOverrideable;
                                                            self->_payloadSMIMEEncryptByDefaultOverrideable = v72;

                                                            if (!v14)
                                                            {
                                                              v80 = 0;
                                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEncryptionCertificateUUIDOverrideable"), 0, MEMORY[0x24BDBD1C0], &v80);
                                                              v74 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                              v14 = v80;
                                                              payloadSMIMEEncryptionCertificateUUIDOverrideable = self->_payloadSMIMEEncryptionCertificateUUIDOverrideable;
                                                              self->_payloadSMIMEEncryptionCertificateUUIDOverrideable = v74;

                                                              if (!v14)
                                                              {
                                                                v79 = 0;
                                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SMIMEEnableEncryptionPerMessageSwitch"), 0, MEMORY[0x24BDBD1C0], &v79);
                                                                v76 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                v14 = v79;
                                                                payloadSMIMEEnableEncryptionPerMessageSwitch = self->_payloadSMIMEEnableEncryptionPerMessageSwitch;
                                                                self->_payloadSMIMEEnableEncryptionPerMessageSwitch = v76;

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
  uint64_t v6;
  NSString *payloadIncomingCredentials;
  void *v8;
  NSString *payloadOutgoingCredentials;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EmailAccountDescription"), self->_payloadEmailAccountDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EmailAccountName"), self->_payloadEmailAccountName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EmailAccountType"), self->_payloadEmailAccountType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EmailAddress"), self->_payloadEmailAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IncomingMailServerAuthentication"), self->_payloadIncomingMailServerAuthentication, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IncomingMailServerHostName"), self->_payloadIncomingMailServerHostName, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IncomingMailServerPortNumber"), self->_payloadIncomingMailServerPortNumber, 0, &unk_24C69CC50);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IncomingMailServerUseSSL"), self->_payloadIncomingMailServerUseSSL, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OutgoingPasswordSameAsIncomingPassword"), self->_payloadOutgoingPasswordSameAsIncomingPassword, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OutgoingMailServerAuthentication"), self->_payloadOutgoingMailServerAuthentication, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OutgoingMailServerPortNumber"), self->_payloadOutgoingMailServerPortNumber, 0, &unk_24C69CC68);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OutgoingMailServerUseSSL"), self->_payloadOutgoingMailServerUseSSL, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OutgoingMailServerUsername"), self->_payloadOutgoingMailServerUsername, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PreventMove"), self->_payloadPreventMove, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PreventAppSheet"), self->_payloadPreventAppSheet, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEnabled"), self->_payloadSMIMEEnabled, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMESigningEnabled"), self->_payloadSMIMESigningEnabled, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMESigningCertificateUUID"), self->_payloadSMIMESigningCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEncryptionEnabled"), self->_payloadSMIMEEncryptionEnabled, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEncryptionCertificateUUID"), self->_payloadSMIMEEncryptionCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEnablePerMessageSwitch"), self->_payloadSMIMEEnablePerMessageSwitch, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("disableMailRecentsSyncing"), self->_payloadDisableMailRecentsSyncing, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("allowMailDrop"), self->_payloadAllowMailDrop, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IncomingMailServerIMAPPathPrefix"), self->_payloadIncomingMailServerIMAPPathPrefix, 0, 0);
  payloadIncomingCredentials = self->_payloadIncomingCredentials;
  if (payloadIncomingCredentials)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadIncomingCredentials);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("IncomingCredentials"), payloadIncomingCredentials, v8, &stru_24C63AAC0, 0, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("IncomingCredentials"), 0, 0, &stru_24C63AAC0, 0, &stru_24C63AAC0);
  }
  payloadOutgoingCredentials = self->_payloadOutgoingCredentials;
  if (payloadOutgoingCredentials)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadOutgoingCredentials);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("OutgoingCredentials"), payloadOutgoingCredentials, v10, &stru_24C63AAC0, 0, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("OutgoingCredentials"), 0, 0, &stru_24C63AAC0, 0, &stru_24C63AAC0);
  }
  v11 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMESigningOverrideable"), self->_payloadSMIMESigningOverrideable, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMESigningCertificateUUIDOverrideable"), self->_payloadSMIMESigningCertificateUUIDOverrideable, 0, v11);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEncryptByDefault"), self->_payloadSMIMEEncryptByDefault, 0, v11);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEncryptByDefaultOverrideable"), self->_payloadSMIMEEncryptByDefaultOverrideable, 0, v11);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEncryptionCertificateUUIDOverrideable"), self->_payloadSMIMEEncryptionCertificateUUIDOverrideable, 0, v11);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SMIMEEnableEncryptionPerMessageSwitch"), self->_payloadSMIMEEnableEncryptionPerMessageSwitch, 0, v11);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
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
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)CEMAccountMailDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v70, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEmailAccountDescription, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadEmailAccountName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadEmailAccountType, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadEmailAddress, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadIncomingMailServerAuthentication, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadIncomingMailServerHostName, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadIncomingMailServerPortNumber, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadIncomingMailServerUseSSL, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadOutgoingPasswordSameAsIncomingPassword, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSString copy](self->_payloadOutgoingMailServerAuthentication, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadOutgoingMailServerPortNumber, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadOutgoingMailServerUseSSL, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSString copy](self->_payloadOutgoingMailServerUsername, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSNumber copy](self->_payloadPreventMove, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadPreventAppSheet, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSNumber copy](self->_payloadSMIMEEnabled, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadSMIMESigningEnabled, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[NSString copy](self->_payloadSMIMESigningCertificateUUID, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSNumber copy](self->_payloadSMIMEEncryptionEnabled, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  v43 = -[NSString copy](self->_payloadSMIMEEncryptionCertificateUUID, "copy");
  v44 = (void *)v4[28];
  v4[28] = v43;

  v45 = -[NSNumber copy](self->_payloadSMIMEEnablePerMessageSwitch, "copy");
  v46 = (void *)v4[29];
  v4[29] = v45;

  v47 = -[NSNumber copy](self->_payloadDisableMailRecentsSyncing, "copy");
  v48 = (void *)v4[30];
  v4[30] = v47;

  v49 = -[NSNumber copy](self->_payloadAllowMailDrop, "copy");
  v50 = (void *)v4[31];
  v4[31] = v49;

  v51 = -[NSString copy](self->_payloadIncomingMailServerIMAPPathPrefix, "copy");
  v52 = (void *)v4[32];
  v4[32] = v51;

  v53 = -[NSString copy](self->_payloadIncomingCredentials, "copy");
  v54 = (void *)v4[33];
  v4[33] = v53;

  v55 = -[NSString copy](self->_payloadOutgoingCredentials, "copy");
  v56 = (void *)v4[34];
  v4[34] = v55;

  v57 = -[NSNumber copy](self->_payloadSMIMESigningOverrideable, "copy");
  v58 = (void *)v4[35];
  v4[35] = v57;

  v59 = -[NSNumber copy](self->_payloadSMIMESigningCertificateUUIDOverrideable, "copy");
  v60 = (void *)v4[36];
  v4[36] = v59;

  v61 = -[NSNumber copy](self->_payloadSMIMEEncryptByDefault, "copy");
  v62 = (void *)v4[37];
  v4[37] = v61;

  v63 = -[NSNumber copy](self->_payloadSMIMEEncryptByDefaultOverrideable, "copy");
  v64 = (void *)v4[38];
  v4[38] = v63;

  v65 = -[NSNumber copy](self->_payloadSMIMEEncryptionCertificateUUIDOverrideable, "copy");
  v66 = (void *)v4[39];
  v4[39] = v65;

  v67 = -[NSNumber copy](self->_payloadSMIMEEnableEncryptionPerMessageSwitch, "copy");
  v68 = (void *)v4[40];
  v4[40] = v67;

  return v4;
}

- (NSString)payloadEmailAccountDescription
{
  return self->_payloadEmailAccountDescription;
}

- (void)setPayloadEmailAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadEmailAccountName
{
  return self->_payloadEmailAccountName;
}

- (void)setPayloadEmailAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadEmailAccountType
{
  return self->_payloadEmailAccountType;
}

- (void)setPayloadEmailAccountType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadEmailAddress
{
  return self->_payloadEmailAddress;
}

- (void)setPayloadEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadIncomingMailServerAuthentication
{
  return self->_payloadIncomingMailServerAuthentication;
}

- (void)setPayloadIncomingMailServerAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadIncomingMailServerHostName
{
  return self->_payloadIncomingMailServerHostName;
}

- (void)setPayloadIncomingMailServerHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadIncomingMailServerPortNumber
{
  return self->_payloadIncomingMailServerPortNumber;
}

- (void)setPayloadIncomingMailServerPortNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadIncomingMailServerUseSSL
{
  return self->_payloadIncomingMailServerUseSSL;
}

- (void)setPayloadIncomingMailServerUseSSL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadOutgoingPasswordSameAsIncomingPassword
{
  return self->_payloadOutgoingPasswordSameAsIncomingPassword;
}

- (void)setPayloadOutgoingPasswordSameAsIncomingPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)payloadOutgoingMailServerAuthentication
{
  return self->_payloadOutgoingMailServerAuthentication;
}

- (void)setPayloadOutgoingMailServerAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadOutgoingMailServerPortNumber
{
  return self->_payloadOutgoingMailServerPortNumber;
}

- (void)setPayloadOutgoingMailServerPortNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadOutgoingMailServerUseSSL
{
  return self->_payloadOutgoingMailServerUseSSL;
}

- (void)setPayloadOutgoingMailServerUseSSL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)payloadOutgoingMailServerUsername
{
  return self->_payloadOutgoingMailServerUsername;
}

- (void)setPayloadOutgoingMailServerUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadPreventMove
{
  return self->_payloadPreventMove;
}

- (void)setPayloadPreventMove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadPreventAppSheet
{
  return self->_payloadPreventAppSheet;
}

- (void)setPayloadPreventAppSheet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadSMIMEEnabled
{
  return self->_payloadSMIMEEnabled;
}

- (void)setPayloadSMIMEEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadSMIMESigningEnabled
{
  return self->_payloadSMIMESigningEnabled;
}

- (void)setPayloadSMIMESigningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)payloadSMIMESigningCertificateUUID
{
  return self->_payloadSMIMESigningCertificateUUID;
}

- (void)setPayloadSMIMESigningCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)payloadSMIMEEncryptionEnabled
{
  return self->_payloadSMIMEEncryptionEnabled;
}

- (void)setPayloadSMIMEEncryptionEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)payloadSMIMEEncryptionCertificateUUID
{
  return self->_payloadSMIMEEncryptionCertificateUUID;
}

- (void)setPayloadSMIMEEncryptionCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)payloadSMIMEEnablePerMessageSwitch
{
  return self->_payloadSMIMEEnablePerMessageSwitch;
}

- (void)setPayloadSMIMEEnablePerMessageSwitch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)payloadDisableMailRecentsSyncing
{
  return self->_payloadDisableMailRecentsSyncing;
}

- (void)setPayloadDisableMailRecentsSyncing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)payloadAllowMailDrop
{
  return self->_payloadAllowMailDrop;
}

- (void)setPayloadAllowMailDrop:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)payloadIncomingMailServerIMAPPathPrefix
{
  return self->_payloadIncomingMailServerIMAPPathPrefix;
}

- (void)setPayloadIncomingMailServerIMAPPathPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)payloadIncomingCredentials
{
  return self->_payloadIncomingCredentials;
}

- (void)setPayloadIncomingCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)payloadOutgoingCredentials
{
  return self->_payloadOutgoingCredentials;
}

- (void)setPayloadOutgoingCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)payloadSMIMESigningOverrideable
{
  return self->_payloadSMIMESigningOverrideable;
}

- (void)setPayloadSMIMESigningOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)payloadSMIMESigningCertificateUUIDOverrideable
{
  return self->_payloadSMIMESigningCertificateUUIDOverrideable;
}

- (void)setPayloadSMIMESigningCertificateUUIDOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)payloadSMIMEEncryptByDefault
{
  return self->_payloadSMIMEEncryptByDefault;
}

- (void)setPayloadSMIMEEncryptByDefault:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)payloadSMIMEEncryptByDefaultOverrideable
{
  return self->_payloadSMIMEEncryptByDefaultOverrideable;
}

- (void)setPayloadSMIMEEncryptByDefaultOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)payloadSMIMEEncryptionCertificateUUIDOverrideable
{
  return self->_payloadSMIMEEncryptionCertificateUUIDOverrideable;
}

- (void)setPayloadSMIMEEncryptionCertificateUUIDOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)payloadSMIMEEnableEncryptionPerMessageSwitch
{
  return self->_payloadSMIMEEnableEncryptionPerMessageSwitch;
}

- (void)setPayloadSMIMEEnableEncryptionPerMessageSwitch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSMIMEEnableEncryptionPerMessageSwitch, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionCertificateUUIDOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptByDefaultOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptByDefault, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningCertificateUUIDOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingCredentials, 0);
  objc_storeStrong((id *)&self->_payloadIncomingCredentials, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_payloadAllowMailDrop, 0);
  objc_storeStrong((id *)&self->_payloadDisableMailRecentsSyncing, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEnablePerMessageSwitch, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPreventAppSheet, 0);
  objc_storeStrong((id *)&self->_payloadPreventMove, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingPasswordSameAsIncomingPassword, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerHostName, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadEmailAddress, 0);
  objc_storeStrong((id *)&self->_payloadEmailAccountType, 0);
  objc_storeStrong((id *)&self->_payloadEmailAccountName, 0);
  objc_storeStrong((id *)&self->_payloadEmailAccountDescription, 0);
}

@end

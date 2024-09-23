@implementation CEMNetworkDirectoryServiceDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.directoryservice");
}

+ (id)profileType
{
  return CFSTR("com.apple.DirectoryService.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[40];

  v6[39] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("HostName");
  v6[1] = CFSTR("UserName");
  v6[2] = CFSTR("Password");
  v6[3] = CFSTR("ClientID");
  v6[4] = CFSTR("Description");
  v6[5] = CFSTR("ADOrganizationalUnit");
  v6[6] = CFSTR("ADMountStyle");
  v6[7] = CFSTR("ADCreateMobileAccountAtLoginFlag");
  v6[8] = CFSTR("ADCreateMobileAccountAtLogin");
  v6[9] = CFSTR("ADWarnUserBeforeCreatingMAFlag");
  v6[10] = CFSTR("ADWarnUserBeforeCreatingMA");
  v6[11] = CFSTR("ADForceHomeLocalFlag");
  v6[12] = CFSTR("ADForceHomeLocal");
  v6[13] = CFSTR("ADUseWindowsUNCPathFlag");
  v6[14] = CFSTR("ADUseWindowsUNCPath");
  v6[15] = CFSTR("ADAllowMultiDomainAuthFlag");
  v6[16] = CFSTR("ADAllowMultiDomainAuth");
  v6[17] = CFSTR("ADDefaultUserShellFlag");
  v6[18] = CFSTR("ADDefaultUserShell");
  v6[19] = CFSTR("ADMapUIDAttributeFlag");
  v6[20] = CFSTR("ADMapUIDAttribute");
  v6[21] = CFSTR("ADMapGIDAttributeFlag");
  v6[22] = CFSTR("ADMapGIDAttribute");
  v6[23] = CFSTR("ADMapGGIDAttributeFlag");
  v6[24] = CFSTR("ADMapGGIDAttribute");
  v6[25] = CFSTR("ADPreferredDCServerFlag");
  v6[26] = CFSTR("ADPreferredDCServer");
  v6[27] = CFSTR("ADDomainAdminGroupListFlag");
  v6[28] = CFSTR("ADDomainAdminGroupList");
  v6[29] = CFSTR("ADNamespaceFlag");
  v6[30] = CFSTR("ADNamespace");
  v6[31] = CFSTR("ADPacketSignFlag");
  v6[32] = CFSTR("ADPacketSign");
  v6[33] = CFSTR("ADPacketEncryptFlag");
  v6[34] = CFSTR("ADPacketEncrypt");
  v6[35] = CFSTR("ADRestrictDDNSFlag");
  v6[36] = CFSTR("ADRestrictDDNS");
  v6[37] = CFSTR("ADTrustChangePassIntervalDaysFlag");
  v6[38] = CFSTR("ADTrustChangePassIntervalDays");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 39);
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

+ (id)buildWithIdentifier:(id)a3 withHostName:(id)a4 withUserName:(id)a5 withPassword:(id)a6 withClientID:(id)a7 withDescription:(id)a8 withADOrganizationalUnit:(id)a9 withADMountStyle:(id)a10 withADCreateMobileAccountAtLoginFlag:(id)a11 withADCreateMobileAccountAtLogin:(id)a12 withADWarnUserBeforeCreatingMAFlag:(id)a13 withADWarnUserBeforeCreatingMA:(id)a14 withADForceHomeLocalFlag:(id)a15 withADForceHomeLocal:(id)a16 withADUseWindowsUNCPathFlag:(id)a17 withADUseWindowsUNCPath:(id)a18 withADAllowMultiDomainAuthFlag:(id)a19 withADAllowMultiDomainAuth:(id)a20 withADDefaultUserShellFlag:(id)a21 withADDefaultUserShell:(id)a22 withADMapUIDAttributeFlag:(id)a23 withADMapUIDAttribute:(id)a24 withADMapGIDAttributeFlag:(id)a25 withADMapGIDAttribute:(id)a26 withADMapGGIDAttributeFlag:(id)a27 withADMapGGIDAttribute:(id)a28 withADPreferredDCServerFlag:(id)a29 withADPreferredDCServer:(id)a30 withADDomainAdminGroupListFlag:(id)a31 withADDomainAdminGroupList:(id)a32 withADNamespaceFlag:(id)a33 withADNamespace:(id)a34 withADPacketSignFlag:(id)a35 withADPacketSign:(id)a36 withADPacketEncryptFlag:(id)a37 withADPacketEncrypt:(id)a38 withADRestrictDDNSFlag:(id)a39 withADRestrictDDNS:(id)a40 withADTrustChangePassIntervalDaysFlag:(id)a41 withADTrustChangePassIntervalDays:(id)a42
{
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
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
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v86;
  id v89;
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
  id v111;
  id v112;
  id v113;

  v42 = a3;
  v113 = a42;
  v112 = a41;
  v111 = a40;
  v110 = a39;
  v109 = a38;
  v43 = a37;
  v44 = a36;
  v45 = a35;
  v46 = a34;
  v108 = a33;
  v107 = a32;
  v106 = a31;
  v105 = a30;
  v104 = a29;
  v103 = a28;
  v102 = a27;
  v101 = a26;
  v100 = a25;
  v99 = a24;
  v98 = a23;
  v97 = a22;
  v96 = a21;
  v95 = a20;
  v94 = a19;
  v93 = a18;
  v89 = a17;
  v84 = a16;
  v81 = a15;
  v78 = a14;
  v77 = a13;
  v79 = a12;
  v80 = a11;
  v82 = a10;
  v83 = a9;
  v86 = a8;
  v47 = a7;
  v48 = a6;
  v49 = a5;
  v50 = a4;
  v51 = (void *)objc_opt_new();
  objc_msgSend(v51, "setDeclarationType:", CFSTR("com.apple.configuration.network.directoryservice"));
  if (v42)
  {
    objc_msgSend(v51, "setDeclarationIdentifier:", v42);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v92 = v45;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "UUIDString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setDeclarationIdentifier:", v53);

    v42 = 0;
    v45 = v92;
  }
  objc_msgSend(v51, "setPayloadHostName:", v50);

  objc_msgSend(v51, "setPayloadUserName:", v49);
  objc_msgSend(v51, "setPayloadPassword:", v48);

  objc_msgSend(v51, "setPayloadClientID:", v47);
  objc_msgSend(v51, "setPayloadDescription:", v86);

  objc_msgSend(v51, "setPayloadADOrganizationalUnit:", v83);
  objc_msgSend(v51, "setPayloadADMountStyle:", v82);

  v54 = (void *)MEMORY[0x24BDBD1C0];
  if (v80)
    v55 = v80;
  else
    v55 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v51, "setPayloadADCreateMobileAccountAtLoginFlag:", v55);

  if (v79)
    v56 = v79;
  else
    v56 = v54;
  objc_msgSend(v51, "setPayloadADCreateMobileAccountAtLogin:", v56);

  if (v77)
    v57 = v77;
  else
    v57 = v54;
  objc_msgSend(v51, "setPayloadADWarnUserBeforeCreatingMAFlag:", v57);

  if (v78)
    v58 = v78;
  else
    v58 = v54;
  objc_msgSend(v51, "setPayloadADWarnUserBeforeCreatingMA:", v58);

  if (v81)
    v59 = v81;
  else
    v59 = v54;
  objc_msgSend(v51, "setPayloadADForceHomeLocalFlag:", v59);

  if (v84)
    v60 = v84;
  else
    v60 = v54;
  objc_msgSend(v51, "setPayloadADForceHomeLocal:", v60);

  if (v89)
    v61 = v89;
  else
    v61 = v54;
  objc_msgSend(v51, "setPayloadADUseWindowsUNCPathFlag:", v61);

  if (v93)
    v62 = v93;
  else
    v62 = v54;
  objc_msgSend(v51, "setPayloadADUseWindowsUNCPath:", v62);

  if (v94)
    v63 = v94;
  else
    v63 = v54;
  objc_msgSend(v51, "setPayloadADAllowMultiDomainAuthFlag:", v63);

  if (v95)
    v64 = v95;
  else
    v64 = v54;
  objc_msgSend(v51, "setPayloadADAllowMultiDomainAuth:", v64);

  if (v96)
    v65 = v96;
  else
    v65 = v54;
  objc_msgSend(v51, "setPayloadADDefaultUserShellFlag:", v65);

  objc_msgSend(v51, "setPayloadADDefaultUserShell:", v97);
  if (v98)
    v66 = v98;
  else
    v66 = v54;
  objc_msgSend(v51, "setPayloadADMapUIDAttributeFlag:", v66);

  objc_msgSend(v51, "setPayloadADMapUIDAttribute:", v99);
  if (v100)
    v67 = v100;
  else
    v67 = v54;
  objc_msgSend(v51, "setPayloadADMapGIDAttributeFlag:", v67);

  objc_msgSend(v51, "setPayloadADMapGIDAttribute:", v101);
  if (v102)
    v68 = v102;
  else
    v68 = v54;
  objc_msgSend(v51, "setPayloadADMapGGIDAttributeFlag:", v68);

  objc_msgSend(v51, "setPayloadADMapGGIDAttribute:", v103);
  if (v104)
    v69 = v104;
  else
    v69 = v54;
  objc_msgSend(v51, "setPayloadADPreferredDCServerFlag:", v69);

  objc_msgSend(v51, "setPayloadADPreferredDCServer:", v105);
  if (v106)
    v70 = v106;
  else
    v70 = v54;
  objc_msgSend(v51, "setPayloadADDomainAdminGroupListFlag:", v70);

  objc_msgSend(v51, "setPayloadADDomainAdminGroupList:", v107);
  if (v108)
    v71 = v108;
  else
    v71 = v54;
  objc_msgSend(v51, "setPayloadADNamespaceFlag:", v71);

  objc_msgSend(v51, "setPayloadADNamespace:", v46);
  if (v45)
    v72 = v45;
  else
    v72 = v54;
  objc_msgSend(v51, "setPayloadADPacketSignFlag:", v72);

  objc_msgSend(v51, "setPayloadADPacketSign:", v44);
  if (v43)
    v73 = v43;
  else
    v73 = v54;
  objc_msgSend(v51, "setPayloadADPacketEncryptFlag:", v73);

  objc_msgSend(v51, "setPayloadADPacketEncrypt:", v109);
  if (v110)
    v74 = v110;
  else
    v74 = v54;
  objc_msgSend(v51, "setPayloadADRestrictDDNSFlag:", v74);

  objc_msgSend(v51, "setPayloadADRestrictDDNS:", v111);
  if (v112)
    v75 = v112;
  else
    v75 = v54;
  objc_msgSend(v51, "setPayloadADTrustChangePassIntervalDaysFlag:", v75);

  objc_msgSend(v51, "setPayloadADTrustChangePassIntervalDays:", v113);
  objc_msgSend(v51, "updateServerHash");

  return v51;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withHostName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.network.directoryservice"));
  if (v5)
  {
    objc_msgSend(v7, "setDeclarationIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeclarationIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadHostName:", v6);

  objc_msgSend(v7, "updateServerHash");
  return v7;
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
  NSString *payloadHostName;
  NSString *v16;
  NSString *payloadUserName;
  NSString *v18;
  NSString *payloadPassword;
  NSString *v20;
  NSString *payloadClientID;
  NSString *v22;
  NSString *payloadDescription;
  NSString *v24;
  NSString *payloadADOrganizationalUnit;
  NSString *v26;
  NSString *payloadADMountStyle;
  NSNumber *v28;
  NSNumber *payloadADCreateMobileAccountAtLoginFlag;
  NSNumber *v30;
  NSNumber *payloadADCreateMobileAccountAtLogin;
  NSNumber *v32;
  NSNumber *payloadADWarnUserBeforeCreatingMAFlag;
  NSNumber *v34;
  NSNumber *payloadADWarnUserBeforeCreatingMA;
  NSNumber *v36;
  NSNumber *payloadADForceHomeLocalFlag;
  NSNumber *v38;
  NSNumber *payloadADForceHomeLocal;
  NSNumber *v40;
  NSNumber *payloadADUseWindowsUNCPathFlag;
  NSNumber *v42;
  NSNumber *payloadADUseWindowsUNCPath;
  NSNumber *v44;
  NSNumber *payloadADAllowMultiDomainAuthFlag;
  NSNumber *v46;
  NSNumber *payloadADAllowMultiDomainAuth;
  NSNumber *v48;
  NSNumber *payloadADDefaultUserShellFlag;
  NSString *v50;
  NSString *payloadADDefaultUserShell;
  NSNumber *v52;
  NSNumber *payloadADMapUIDAttributeFlag;
  NSString *v54;
  NSString *payloadADMapUIDAttribute;
  NSNumber *v56;
  NSNumber *payloadADMapGIDAttributeFlag;
  NSString *v58;
  NSString *payloadADMapGIDAttribute;
  NSNumber *v60;
  NSNumber *payloadADMapGGIDAttributeFlag;
  NSString *v62;
  NSString *payloadADMapGGIDAttribute;
  NSNumber *v64;
  NSNumber *payloadADPreferredDCServerFlag;
  NSString *v66;
  NSString *payloadADPreferredDCServer;
  NSNumber *v68;
  NSNumber *payloadADDomainAdminGroupListFlag;
  NSArray *v70;
  NSArray *payloadADDomainAdminGroupList;
  NSNumber *v72;
  NSNumber *payloadADNamespaceFlag;
  NSString *v74;
  NSString *payloadADNamespace;
  NSNumber *v76;
  NSNumber *payloadADPacketSignFlag;
  NSString *v78;
  NSString *payloadADPacketSign;
  NSNumber *v80;
  NSNumber *payloadADPacketEncryptFlag;
  NSString *v82;
  NSString *payloadADPacketEncrypt;
  NSNumber *v84;
  NSNumber *payloadADRestrictDDNSFlag;
  NSArray *v86;
  NSArray *payloadADRestrictDDNS;
  NSNumber *v88;
  NSNumber *payloadADTrustChangePassIntervalDaysFlag;
  NSNumber *v90;
  NSNumber *payloadADTrustChangePassIntervalDays;
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
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkDirectoryServiceDeclaration allowedPayloadKeys](CEMNetworkDirectoryServiceDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v131 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HostName"), 1, 0, &v131);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v131;
  payloadHostName = self->_payloadHostName;
  self->_payloadHostName = v13;

  if (!v14)
  {
    v130 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserName"), 0, 0, &v130);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v130;
    payloadUserName = self->_payloadUserName;
    self->_payloadUserName = v16;

    if (!v14)
    {
      v129 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v129);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v129;
      payloadPassword = self->_payloadPassword;
      self->_payloadPassword = v18;

      if (!v14)
      {
        v128 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ClientID"), 0, 0, &v128);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v128;
        payloadClientID = self->_payloadClientID;
        self->_payloadClientID = v20;

        if (!v14)
        {
          v127 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Description"), 0, 0, &v127);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v127;
          payloadDescription = self->_payloadDescription;
          self->_payloadDescription = v22;

          if (!v14)
          {
            v126 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADOrganizationalUnit"), 0, 0, &v126);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v126;
            payloadADOrganizationalUnit = self->_payloadADOrganizationalUnit;
            self->_payloadADOrganizationalUnit = v24;

            if (!v14)
            {
              v125 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMountStyle"), 0, 0, &v125);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v125;
              payloadADMountStyle = self->_payloadADMountStyle;
              self->_payloadADMountStyle = v26;

              if (!v14)
              {
                v124 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADCreateMobileAccountAtLoginFlag"), 0, MEMORY[0x24BDBD1C0], &v124);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v124;
                payloadADCreateMobileAccountAtLoginFlag = self->_payloadADCreateMobileAccountAtLoginFlag;
                self->_payloadADCreateMobileAccountAtLoginFlag = v28;

                if (!v14)
                {
                  v123 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADCreateMobileAccountAtLogin"), 0, MEMORY[0x24BDBD1C0], &v123);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v123;
                  payloadADCreateMobileAccountAtLogin = self->_payloadADCreateMobileAccountAtLogin;
                  self->_payloadADCreateMobileAccountAtLogin = v30;

                  if (!v14)
                  {
                    v122 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADWarnUserBeforeCreatingMAFlag"), 0, MEMORY[0x24BDBD1C0], &v122);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v122;
                    payloadADWarnUserBeforeCreatingMAFlag = self->_payloadADWarnUserBeforeCreatingMAFlag;
                    self->_payloadADWarnUserBeforeCreatingMAFlag = v32;

                    if (!v14)
                    {
                      v121 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADWarnUserBeforeCreatingMA"), 0, MEMORY[0x24BDBD1C0], &v121);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v121;
                      payloadADWarnUserBeforeCreatingMA = self->_payloadADWarnUserBeforeCreatingMA;
                      self->_payloadADWarnUserBeforeCreatingMA = v34;

                      if (!v14)
                      {
                        v120 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADForceHomeLocalFlag"), 0, MEMORY[0x24BDBD1C0], &v120);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v120;
                        payloadADForceHomeLocalFlag = self->_payloadADForceHomeLocalFlag;
                        self->_payloadADForceHomeLocalFlag = v36;

                        if (!v14)
                        {
                          v119 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADForceHomeLocal"), 0, MEMORY[0x24BDBD1C0], &v119);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v119;
                          payloadADForceHomeLocal = self->_payloadADForceHomeLocal;
                          self->_payloadADForceHomeLocal = v38;

                          if (!v14)
                          {
                            v118 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADUseWindowsUNCPathFlag"), 0, MEMORY[0x24BDBD1C0], &v118);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v118;
                            payloadADUseWindowsUNCPathFlag = self->_payloadADUseWindowsUNCPathFlag;
                            self->_payloadADUseWindowsUNCPathFlag = v40;

                            if (!v14)
                            {
                              v117 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADUseWindowsUNCPath"), 0, MEMORY[0x24BDBD1C0], &v117);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v117;
                              payloadADUseWindowsUNCPath = self->_payloadADUseWindowsUNCPath;
                              self->_payloadADUseWindowsUNCPath = v42;

                              if (!v14)
                              {
                                v116 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADAllowMultiDomainAuthFlag"), 0, MEMORY[0x24BDBD1C0], &v116);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v116;
                                payloadADAllowMultiDomainAuthFlag = self->_payloadADAllowMultiDomainAuthFlag;
                                self->_payloadADAllowMultiDomainAuthFlag = v44;

                                if (!v14)
                                {
                                  v115 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADAllowMultiDomainAuth"), 0, MEMORY[0x24BDBD1C0], &v115);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v115;
                                  payloadADAllowMultiDomainAuth = self->_payloadADAllowMultiDomainAuth;
                                  self->_payloadADAllowMultiDomainAuth = v46;

                                  if (!v14)
                                  {
                                    v114 = 0;
                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADDefaultUserShellFlag"), 0, MEMORY[0x24BDBD1C0], &v114);
                                    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v14 = v114;
                                    payloadADDefaultUserShellFlag = self->_payloadADDefaultUserShellFlag;
                                    self->_payloadADDefaultUserShellFlag = v48;

                                    if (!v14)
                                    {
                                      v113 = 0;
                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADDefaultUserShell"), 0, 0, &v113);
                                      v50 = (NSString *)objc_claimAutoreleasedReturnValue();
                                      v14 = v113;
                                      payloadADDefaultUserShell = self->_payloadADDefaultUserShell;
                                      self->_payloadADDefaultUserShell = v50;

                                      if (!v14)
                                      {
                                        v112 = 0;
                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapUIDAttributeFlag"), 0, MEMORY[0x24BDBD1C0], &v112);
                                        v52 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                        v14 = v112;
                                        payloadADMapUIDAttributeFlag = self->_payloadADMapUIDAttributeFlag;
                                        self->_payloadADMapUIDAttributeFlag = v52;

                                        if (!v14)
                                        {
                                          v111 = 0;
                                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapUIDAttribute"), 0, 0, &v111);
                                          v54 = (NSString *)objc_claimAutoreleasedReturnValue();
                                          v14 = v111;
                                          payloadADMapUIDAttribute = self->_payloadADMapUIDAttribute;
                                          self->_payloadADMapUIDAttribute = v54;

                                          if (!v14)
                                          {
                                            v110 = 0;
                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapGIDAttributeFlag"), 0, MEMORY[0x24BDBD1C0], &v110);
                                            v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                            v14 = v110;
                                            payloadADMapGIDAttributeFlag = self->_payloadADMapGIDAttributeFlag;
                                            self->_payloadADMapGIDAttributeFlag = v56;

                                            if (!v14)
                                            {
                                              v109 = 0;
                                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapGIDAttribute"), 0, 0, &v109);
                                              v58 = (NSString *)objc_claimAutoreleasedReturnValue();
                                              v14 = v109;
                                              payloadADMapGIDAttribute = self->_payloadADMapGIDAttribute;
                                              self->_payloadADMapGIDAttribute = v58;

                                              if (!v14)
                                              {
                                                v108 = 0;
                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapGGIDAttributeFlag"), 0, MEMORY[0x24BDBD1C0], &v108);
                                                v60 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                v14 = v108;
                                                payloadADMapGGIDAttributeFlag = self->_payloadADMapGGIDAttributeFlag;
                                                self->_payloadADMapGGIDAttributeFlag = v60;

                                                if (!v14)
                                                {
                                                  v107 = 0;
                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADMapGGIDAttribute"), 0, 0, &v107);
                                                  v62 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                  v14 = v107;
                                                  payloadADMapGGIDAttribute = self->_payloadADMapGGIDAttribute;
                                                  self->_payloadADMapGGIDAttribute = v62;

                                                  if (!v14)
                                                  {
                                                    v106 = 0;
                                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPreferredDCServerFlag"), 0, MEMORY[0x24BDBD1C0], &v106);
                                                    v64 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                    v14 = v106;
                                                    payloadADPreferredDCServerFlag = self->_payloadADPreferredDCServerFlag;
                                                    self->_payloadADPreferredDCServerFlag = v64;

                                                    if (!v14)
                                                    {
                                                      v105 = 0;
                                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPreferredDCServer"), 0, 0, &v105);
                                                      v66 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                      v14 = v105;
                                                      payloadADPreferredDCServer = self->_payloadADPreferredDCServer;
                                                      self->_payloadADPreferredDCServer = v66;

                                                      if (!v14)
                                                      {
                                                        v104 = 0;
                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADDomainAdminGroupListFlag"), 0, MEMORY[0x24BDBD1C0], &v104);
                                                        v68 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                        v14 = v104;
                                                        payloadADDomainAdminGroupListFlag = self->_payloadADDomainAdminGroupListFlag;
                                                        self->_payloadADDomainAdminGroupListFlag = v68;

                                                        if (!v14)
                                                        {
                                                          v103 = 0;
                                                          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("ADDomainAdminGroupList"), &__block_literal_global_19, 0, 0, &v103);
                                                          v70 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                                          v14 = v103;
                                                          payloadADDomainAdminGroupList = self->_payloadADDomainAdminGroupList;
                                                          self->_payloadADDomainAdminGroupList = v70;

                                                          if (!v14)
                                                          {
                                                            v102 = 0;
                                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADNamespaceFlag"), 0, MEMORY[0x24BDBD1C0], &v102);
                                                            v72 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                            v14 = v102;
                                                            payloadADNamespaceFlag = self->_payloadADNamespaceFlag;
                                                            self->_payloadADNamespaceFlag = v72;

                                                            if (!v14)
                                                            {
                                                              v101 = 0;
                                                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADNamespace"), 0, 0, &v101);
                                                              v74 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                              v14 = v101;
                                                              payloadADNamespace = self->_payloadADNamespace;
                                                              self->_payloadADNamespace = v74;

                                                              if (!v14)
                                                              {
                                                                v100 = 0;
                                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPacketSignFlag"), 0, MEMORY[0x24BDBD1C0], &v100);
                                                                v76 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                v14 = v100;
                                                                payloadADPacketSignFlag = self->_payloadADPacketSignFlag;
                                                                self->_payloadADPacketSignFlag = v76;

                                                                if (!v14)
                                                                {
                                                                  v99 = 0;
                                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPacketSign"), 0, 0, &v99);
                                                                  v78 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                  v14 = v99;
                                                                  payloadADPacketSign = self->_payloadADPacketSign;
                                                                  self->_payloadADPacketSign = v78;

                                                                  if (!v14)
                                                                  {
                                                                    v98 = 0;
                                                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPacketEncryptFlag"), 0, MEMORY[0x24BDBD1C0], &v98);
                                                                    v80 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                    v14 = v98;
                                                                    payloadADPacketEncryptFlag = self->_payloadADPacketEncryptFlag;
                                                                    self->_payloadADPacketEncryptFlag = v80;

                                                                    if (!v14)
                                                                    {
                                                                      v97 = 0;
                                                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADPacketEncrypt"), 0, 0, &v97);
                                                                      v82 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                      v14 = v97;
                                                                      payloadADPacketEncrypt = self->_payloadADPacketEncrypt;
                                                                      self->_payloadADPacketEncrypt = v82;

                                                                      if (!v14)
                                                                      {
                                                                        v96 = 0;
                                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADRestrictDDNSFlag"), 0, MEMORY[0x24BDBD1C0], &v96);
                                                                        v84 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                        v14 = v96;
                                                                        payloadADRestrictDDNSFlag = self->_payloadADRestrictDDNSFlag;
                                                                        self->_payloadADRestrictDDNSFlag = v84;

                                                                        if (!v14)
                                                                        {
                                                                          v95 = 0;
                                                                          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("ADRestrictDDNS"), &__block_literal_global_89, 0, 0, &v95);
                                                                          v86 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                                                          v14 = v95;
                                                                          payloadADRestrictDDNS = self->_payloadADRestrictDDNS;
                                                                          self->_payloadADRestrictDDNS = v86;

                                                                          if (!v14)
                                                                          {
                                                                            v94 = 0;
                                                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADTrustChangePassIntervalDaysFlag"), 0, MEMORY[0x24BDBD1C0], &v94);
                                                                            v88 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                            v14 = v94;
                                                                            payloadADTrustChangePassIntervalDaysFlag = self->_payloadADTrustChangePassIntervalDaysFlag;
                                                                            self->_payloadADTrustChangePassIntervalDaysFlag = v88;

                                                                            if (!v14)
                                                                            {
                                                                              v93 = 0;
                                                                              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ADTrustChangePassIntervalDays"), 0, 0, &v93);
                                                                              v90 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                              v14 = v93;
                                                                              payloadADTrustChangePassIntervalDays = self->_payloadADTrustChangePassIntervalDays;
                                                                              self->_payloadADTrustChangePassIntervalDays = v90;

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

uint64_t __59__CEMNetworkDirectoryServiceDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__CEMNetworkDirectoryServiceDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HostName"), self->_payloadHostName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UserName"), self->_payloadUserName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Password"), self->_payloadPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ClientID"), self->_payloadClientID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Description"), self->_payloadDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADOrganizationalUnit"), self->_payloadADOrganizationalUnit, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMountStyle"), self->_payloadADMountStyle, 0, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADCreateMobileAccountAtLoginFlag"), self->_payloadADCreateMobileAccountAtLoginFlag, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADCreateMobileAccountAtLogin"), self->_payloadADCreateMobileAccountAtLogin, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADWarnUserBeforeCreatingMAFlag"), self->_payloadADWarnUserBeforeCreatingMAFlag, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADWarnUserBeforeCreatingMA"), self->_payloadADWarnUserBeforeCreatingMA, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADForceHomeLocalFlag"), self->_payloadADForceHomeLocalFlag, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADForceHomeLocal"), self->_payloadADForceHomeLocal, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADUseWindowsUNCPathFlag"), self->_payloadADUseWindowsUNCPathFlag, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADUseWindowsUNCPath"), self->_payloadADUseWindowsUNCPath, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADAllowMultiDomainAuthFlag"), self->_payloadADAllowMultiDomainAuthFlag, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADAllowMultiDomainAuth"), self->_payloadADAllowMultiDomainAuth, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADDefaultUserShellFlag"), self->_payloadADDefaultUserShellFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADDefaultUserShell"), self->_payloadADDefaultUserShell, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapUIDAttributeFlag"), self->_payloadADMapUIDAttributeFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapUIDAttribute"), self->_payloadADMapUIDAttribute, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapGIDAttributeFlag"), self->_payloadADMapGIDAttributeFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapGIDAttribute"), self->_payloadADMapGIDAttribute, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapGGIDAttributeFlag"), self->_payloadADMapGGIDAttributeFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADMapGGIDAttribute"), self->_payloadADMapGGIDAttribute, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPreferredDCServerFlag"), self->_payloadADPreferredDCServerFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPreferredDCServer"), self->_payloadADPreferredDCServer, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADDomainAdminGroupListFlag"), self->_payloadADDomainAdminGroupListFlag, 0, v5);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("ADDomainAdminGroupList"), self->_payloadADDomainAdminGroupList, &__block_literal_global_92, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADNamespaceFlag"), self->_payloadADNamespaceFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADNamespace"), self->_payloadADNamespace, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPacketSignFlag"), self->_payloadADPacketSignFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPacketSign"), self->_payloadADPacketSign, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPacketEncryptFlag"), self->_payloadADPacketEncryptFlag, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADPacketEncrypt"), self->_payloadADPacketEncrypt, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADRestrictDDNSFlag"), self->_payloadADRestrictDDNSFlag, 0, v5);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("ADRestrictDDNS"), self->_payloadADRestrictDDNS, &__block_literal_global_93_0, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADTrustChangePassIntervalDaysFlag"), self->_payloadADTrustChangePassIntervalDaysFlag, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ADTrustChangePassIntervalDays"), self->_payloadADTrustChangePassIntervalDays, 0, 0);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

id __76__CEMNetworkDirectoryServiceDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __76__CEMNetworkDirectoryServiceDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  objc_super v84;

  v84.receiver = self;
  v84.super_class = (Class)CEMNetworkDirectoryServiceDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v84, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadHostName, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadUserName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadPassword, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadClientID, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadDescription, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadADOrganizationalUnit, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadADMountStyle, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadADCreateMobileAccountAtLoginFlag, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadADCreateMobileAccountAtLogin, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadADWarnUserBeforeCreatingMAFlag, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadADWarnUserBeforeCreatingMA, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadADForceHomeLocalFlag, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadADForceHomeLocal, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSNumber copy](self->_payloadADUseWindowsUNCPathFlag, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadADUseWindowsUNCPath, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSNumber copy](self->_payloadADAllowMultiDomainAuthFlag, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadADAllowMultiDomainAuth, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[NSNumber copy](self->_payloadADDefaultUserShellFlag, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSString copy](self->_payloadADDefaultUserShell, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  v43 = -[NSNumber copy](self->_payloadADMapUIDAttributeFlag, "copy");
  v44 = (void *)v4[28];
  v4[28] = v43;

  v45 = -[NSString copy](self->_payloadADMapUIDAttribute, "copy");
  v46 = (void *)v4[29];
  v4[29] = v45;

  v47 = -[NSNumber copy](self->_payloadADMapGIDAttributeFlag, "copy");
  v48 = (void *)v4[30];
  v4[30] = v47;

  v49 = -[NSString copy](self->_payloadADMapGIDAttribute, "copy");
  v50 = (void *)v4[31];
  v4[31] = v49;

  v51 = -[NSNumber copy](self->_payloadADMapGGIDAttributeFlag, "copy");
  v52 = (void *)v4[32];
  v4[32] = v51;

  v53 = -[NSString copy](self->_payloadADMapGGIDAttribute, "copy");
  v54 = (void *)v4[33];
  v4[33] = v53;

  v55 = -[NSNumber copy](self->_payloadADPreferredDCServerFlag, "copy");
  v56 = (void *)v4[34];
  v4[34] = v55;

  v57 = -[NSString copy](self->_payloadADPreferredDCServer, "copy");
  v58 = (void *)v4[35];
  v4[35] = v57;

  v59 = -[NSNumber copy](self->_payloadADDomainAdminGroupListFlag, "copy");
  v60 = (void *)v4[36];
  v4[36] = v59;

  v61 = -[NSArray copy](self->_payloadADDomainAdminGroupList, "copy");
  v62 = (void *)v4[37];
  v4[37] = v61;

  v63 = -[NSNumber copy](self->_payloadADNamespaceFlag, "copy");
  v64 = (void *)v4[38];
  v4[38] = v63;

  v65 = -[NSString copy](self->_payloadADNamespace, "copy");
  v66 = (void *)v4[39];
  v4[39] = v65;

  v67 = -[NSNumber copy](self->_payloadADPacketSignFlag, "copy");
  v68 = (void *)v4[40];
  v4[40] = v67;

  v69 = -[NSString copy](self->_payloadADPacketSign, "copy");
  v70 = (void *)v4[41];
  v4[41] = v69;

  v71 = -[NSNumber copy](self->_payloadADPacketEncryptFlag, "copy");
  v72 = (void *)v4[42];
  v4[42] = v71;

  v73 = -[NSString copy](self->_payloadADPacketEncrypt, "copy");
  v74 = (void *)v4[43];
  v4[43] = v73;

  v75 = -[NSNumber copy](self->_payloadADRestrictDDNSFlag, "copy");
  v76 = (void *)v4[44];
  v4[44] = v75;

  v77 = -[NSArray copy](self->_payloadADRestrictDDNS, "copy");
  v78 = (void *)v4[45];
  v4[45] = v77;

  v79 = -[NSNumber copy](self->_payloadADTrustChangePassIntervalDaysFlag, "copy");
  v80 = (void *)v4[46];
  v4[46] = v79;

  v81 = -[NSNumber copy](self->_payloadADTrustChangePassIntervalDays, "copy");
  v82 = (void *)v4[47];
  v4[47] = v81;

  return v4;
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadClientID
{
  return self->_payloadClientID;
}

- (void)setPayloadClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadADOrganizationalUnit
{
  return self->_payloadADOrganizationalUnit;
}

- (void)setPayloadADOrganizationalUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadADMountStyle
{
  return self->_payloadADMountStyle;
}

- (void)setPayloadADMountStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadADCreateMobileAccountAtLoginFlag
{
  return self->_payloadADCreateMobileAccountAtLoginFlag;
}

- (void)setPayloadADCreateMobileAccountAtLoginFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadADCreateMobileAccountAtLogin
{
  return self->_payloadADCreateMobileAccountAtLogin;
}

- (void)setPayloadADCreateMobileAccountAtLogin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadADWarnUserBeforeCreatingMAFlag
{
  return self->_payloadADWarnUserBeforeCreatingMAFlag;
}

- (void)setPayloadADWarnUserBeforeCreatingMAFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadADWarnUserBeforeCreatingMA
{
  return self->_payloadADWarnUserBeforeCreatingMA;
}

- (void)setPayloadADWarnUserBeforeCreatingMA:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadADForceHomeLocalFlag
{
  return self->_payloadADForceHomeLocalFlag;
}

- (void)setPayloadADForceHomeLocalFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadADForceHomeLocal
{
  return self->_payloadADForceHomeLocal;
}

- (void)setPayloadADForceHomeLocal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadADUseWindowsUNCPathFlag
{
  return self->_payloadADUseWindowsUNCPathFlag;
}

- (void)setPayloadADUseWindowsUNCPathFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadADUseWindowsUNCPath
{
  return self->_payloadADUseWindowsUNCPath;
}

- (void)setPayloadADUseWindowsUNCPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadADAllowMultiDomainAuthFlag
{
  return self->_payloadADAllowMultiDomainAuthFlag;
}

- (void)setPayloadADAllowMultiDomainAuthFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadADAllowMultiDomainAuth
{
  return self->_payloadADAllowMultiDomainAuth;
}

- (void)setPayloadADAllowMultiDomainAuth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)payloadADDefaultUserShellFlag
{
  return self->_payloadADDefaultUserShellFlag;
}

- (void)setPayloadADDefaultUserShellFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)payloadADDefaultUserShell
{
  return self->_payloadADDefaultUserShell;
}

- (void)setPayloadADDefaultUserShell:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)payloadADMapUIDAttributeFlag
{
  return self->_payloadADMapUIDAttributeFlag;
}

- (void)setPayloadADMapUIDAttributeFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)payloadADMapUIDAttribute
{
  return self->_payloadADMapUIDAttribute;
}

- (void)setPayloadADMapUIDAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)payloadADMapGIDAttributeFlag
{
  return self->_payloadADMapGIDAttributeFlag;
}

- (void)setPayloadADMapGIDAttributeFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)payloadADMapGIDAttribute
{
  return self->_payloadADMapGIDAttribute;
}

- (void)setPayloadADMapGIDAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)payloadADMapGGIDAttributeFlag
{
  return self->_payloadADMapGGIDAttributeFlag;
}

- (void)setPayloadADMapGGIDAttributeFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)payloadADMapGGIDAttribute
{
  return self->_payloadADMapGGIDAttribute;
}

- (void)setPayloadADMapGGIDAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)payloadADPreferredDCServerFlag
{
  return self->_payloadADPreferredDCServerFlag;
}

- (void)setPayloadADPreferredDCServerFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)payloadADPreferredDCServer
{
  return self->_payloadADPreferredDCServer;
}

- (void)setPayloadADPreferredDCServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)payloadADDomainAdminGroupListFlag
{
  return self->_payloadADDomainAdminGroupListFlag;
}

- (void)setPayloadADDomainAdminGroupListFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)payloadADDomainAdminGroupList
{
  return self->_payloadADDomainAdminGroupList;
}

- (void)setPayloadADDomainAdminGroupList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)payloadADNamespaceFlag
{
  return self->_payloadADNamespaceFlag;
}

- (void)setPayloadADNamespaceFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)payloadADNamespace
{
  return self->_payloadADNamespace;
}

- (void)setPayloadADNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)payloadADPacketSignFlag
{
  return self->_payloadADPacketSignFlag;
}

- (void)setPayloadADPacketSignFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)payloadADPacketSign
{
  return self->_payloadADPacketSign;
}

- (void)setPayloadADPacketSign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)payloadADPacketEncryptFlag
{
  return self->_payloadADPacketEncryptFlag;
}

- (void)setPayloadADPacketEncryptFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)payloadADPacketEncrypt
{
  return self->_payloadADPacketEncrypt;
}

- (void)setPayloadADPacketEncrypt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSNumber)payloadADRestrictDDNSFlag
{
  return self->_payloadADRestrictDDNSFlag;
}

- (void)setPayloadADRestrictDDNSFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSArray)payloadADRestrictDDNS
{
  return self->_payloadADRestrictDDNS;
}

- (void)setPayloadADRestrictDDNS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSNumber)payloadADTrustChangePassIntervalDaysFlag
{
  return self->_payloadADTrustChangePassIntervalDaysFlag;
}

- (void)setPayloadADTrustChangePassIntervalDaysFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSNumber)payloadADTrustChangePassIntervalDays
{
  return self->_payloadADTrustChangePassIntervalDays;
}

- (void)setPayloadADTrustChangePassIntervalDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadADTrustChangePassIntervalDays, 0);
  objc_storeStrong((id *)&self->_payloadADTrustChangePassIntervalDaysFlag, 0);
  objc_storeStrong((id *)&self->_payloadADRestrictDDNS, 0);
  objc_storeStrong((id *)&self->_payloadADRestrictDDNSFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPacketEncrypt, 0);
  objc_storeStrong((id *)&self->_payloadADPacketEncryptFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPacketSign, 0);
  objc_storeStrong((id *)&self->_payloadADPacketSignFlag, 0);
  objc_storeStrong((id *)&self->_payloadADNamespace, 0);
  objc_storeStrong((id *)&self->_payloadADNamespaceFlag, 0);
  objc_storeStrong((id *)&self->_payloadADDomainAdminGroupList, 0);
  objc_storeStrong((id *)&self->_payloadADDomainAdminGroupListFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPreferredDCServer, 0);
  objc_storeStrong((id *)&self->_payloadADPreferredDCServerFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapGGIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapGGIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapGIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapGIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapUIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapUIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADDefaultUserShell, 0);
  objc_storeStrong((id *)&self->_payloadADDefaultUserShellFlag, 0);
  objc_storeStrong((id *)&self->_payloadADAllowMultiDomainAuth, 0);
  objc_storeStrong((id *)&self->_payloadADAllowMultiDomainAuthFlag, 0);
  objc_storeStrong((id *)&self->_payloadADUseWindowsUNCPath, 0);
  objc_storeStrong((id *)&self->_payloadADUseWindowsUNCPathFlag, 0);
  objc_storeStrong((id *)&self->_payloadADForceHomeLocal, 0);
  objc_storeStrong((id *)&self->_payloadADForceHomeLocalFlag, 0);
  objc_storeStrong((id *)&self->_payloadADWarnUserBeforeCreatingMA, 0);
  objc_storeStrong((id *)&self->_payloadADWarnUserBeforeCreatingMAFlag, 0);
  objc_storeStrong((id *)&self->_payloadADCreateMobileAccountAtLogin, 0);
  objc_storeStrong((id *)&self->_payloadADCreateMobileAccountAtLoginFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMountStyle, 0);
  objc_storeStrong((id *)&self->_payloadADOrganizationalUnit, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadClientID, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
}

@end

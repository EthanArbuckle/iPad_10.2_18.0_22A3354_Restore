@implementation CRKEDUPayload

- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  CRKEDUPayload *v11;

  v6 = a4;
  v8 = a3;
  +[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cloudConfigEnablesEphemeralMultiUser");

  v11 = -[CRKEDUPayload initWithDictionary:isStub:isEphemeralMultiUserDevice:error:](self, "initWithDictionary:isStub:isEphemeralMultiUserDevice:error:", v8, v6, v10, a5);
  return v11;
}

- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  CRKEDUPayload *v11;
  CRKEDUPayload *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v17;
  objc_super v18;

  v8 = a4;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKEDUPayload;
  v11 = -[CRKEDUPayload init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isEphemeralMultiUserDevice = a5;
    v17 = 0;
    v13 = -[CRKEDUPayload parseDictionary:isStub:outError:](v11, "parseDictionary:isStub:outError:", v10, v8, &v17);
    v14 = v17;
    v15 = v14;
    if (!v13)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v14);

      v12 = 0;
    }

  }
  return v12;
}

- (BOOL)parseDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  NSString *v10;
  id v11;
  NSString *payloadDisplayName;
  NSString *v13;
  NSString *payloadDescriptionName;
  NSString *v15;
  NSString *organizationUUID;
  void *v17;
  NSString *v18;
  NSString *organizationName;
  NSString *v20;
  NSString *payloadCertificateUUID;
  NSData *v22;
  NSData *payloadCertificatePersistentID;
  NSArray *v24;
  NSArray *leaderPayloadCertificateAnchorUUID;
  NSArray *v26;
  NSArray *leaderPayloadCertificateAnchorPersistentID;
  NSArray *v28;
  NSArray *memberPayloadCertificateAnchorUUID;
  NSArray *v30;
  NSArray *memberPayloadCertificateAnchorPersistentID;
  NSString *v32;
  NSString *resourcePayloadCertificateUUID;
  NSData *v34;
  NSData *resourcePayloadCertificatePersistentID;
  void *v36;
  id v37;
  id v38;
  uint64_t i;
  void *v40;
  void *v41;
  id v42;
  NSArray *v43;
  NSArray *departments;
  uint64_t j;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSArray *v52;
  NSArray *groups;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  NSArray *v64;
  NSArray *users;
  NSString *v66;
  id v67;
  NSString *userIdentifier;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t m;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSArray *v78;
  NSArray *deviceGroups;
  id obj;
  id obja;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
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
  id v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v6 = a4;
  v137 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (_CRKLogGeneral_onceToken_6 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_6, &__block_literal_global_27);
  v9 = _CRKLogGeneral_logObj_6;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_6, OS_LOG_TYPE_DEBUG))
    -[CRKEDUPayload parseDictionary:isStub:outError:].cold.1(v9);
  v132 = 0;
  objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadDisplayName"), 0, &v132);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = v132;
  payloadDisplayName = self->_payloadDisplayName;
  self->_payloadDisplayName = v10;

  if (!v11)
  {
    v131 = 0;
    objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadDescription"), 0, &v131);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = v131;
    payloadDescriptionName = self->_payloadDescriptionName;
    self->_payloadDescriptionName = v13;

    if (!v11)
    {
      v130 = 0;
      objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OrganizationUUID"), v6 ^ 1, &v130);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v130;
      organizationUUID = self->_organizationUUID;
      self->_organizationUUID = v15;

      if (!v11)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", self->_organizationUUID);
        if (!v17 && !v6)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "crk_badFieldTypeErrorWithField:", CFSTR("OrganizationUUID"));
          v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

          goto LABEL_36;
        }
        v129 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OrganizationName"), v6 ^ 1, &v129);
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = v129;
        organizationName = self->_organizationName;
        self->_organizationName = v18;

        if (v11)
          goto LABEL_35;
        v128 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadCertificateUUID"), 0, &v128);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = v128;
        payloadCertificateUUID = self->_payloadCertificateUUID;
        self->_payloadCertificateUUID = v20;

        if (v11)
          goto LABEL_35;
        v127 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PayloadCertificatePersistentID"), 0, &v127);
        v22 = (NSData *)objc_claimAutoreleasedReturnValue();
        v11 = v127;
        payloadCertificatePersistentID = self->_payloadCertificatePersistentID;
        self->_payloadCertificatePersistentID = v22;

        if (v11)
          goto LABEL_35;
        v126 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("LeaderPayloadCertificateAnchorUUID"), 0, &v126);
        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v11 = v126;
        leaderPayloadCertificateAnchorUUID = self->_leaderPayloadCertificateAnchorUUID;
        self->_leaderPayloadCertificateAnchorUUID = v24;

        if (v11)
          goto LABEL_35;
        v125 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("LeaderPayloadCertificateAnchorPersistentID"), 0, &v125);
        v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v11 = v125;
        leaderPayloadCertificateAnchorPersistentID = self->_leaderPayloadCertificateAnchorPersistentID;
        self->_leaderPayloadCertificateAnchorPersistentID = v26;

        if (v11)
          goto LABEL_35;
        v124 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MemberPayloadCertificateAnchorUUID"), 0, &v124);
        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v11 = v124;
        memberPayloadCertificateAnchorUUID = self->_memberPayloadCertificateAnchorUUID;
        self->_memberPayloadCertificateAnchorUUID = v28;

        if (v11)
          goto LABEL_35;
        v123 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MemberPayloadCertificateAnchorPersistentID"), 0, &v123);
        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v11 = v123;
        memberPayloadCertificateAnchorPersistentID = self->_memberPayloadCertificateAnchorPersistentID;
        self->_memberPayloadCertificateAnchorPersistentID = v30;

        if (v11)
          goto LABEL_35;
        v122 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ResourcePayloadCertificateUUID"), 0, &v122);
        v32 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = v122;
        resourcePayloadCertificateUUID = self->_resourcePayloadCertificateUUID;
        self->_resourcePayloadCertificateUUID = v32;

        if (v11)
          goto LABEL_35;
        v121 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ResourcePayloadCertificatePersistentID"), 0, &v121);
        v34 = (NSData *)objc_claimAutoreleasedReturnValue();
        v11 = v121;
        resourcePayloadCertificatePersistentID = self->_resourcePayloadCertificatePersistentID;
        self->_resourcePayloadCertificatePersistentID = v34;

        if (v11)
          goto LABEL_35;
        v120 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ScreenObservationPermissionModificationAllowed"), 0, &v120);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v120;
        self->_screenObservationPermissionModificationAllowed = objc_msgSend(v36, "BOOLValue");

        if (v11)
          goto LABEL_35;
        v119 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Departments"), 0, &v119);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = v119;
        if (v38)
          goto LABEL_22;
        v90 = (void *)objc_opt_new();
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        obj = v37;
        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
        if (v86)
        {
          v82 = *(id *)v116;
          while (2)
          {
            for (i = 0; i != v86; ++i)
            {
              if (*(id *)v116 != v82)
                objc_enumerationMutation(obj);
              v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i), "mutableCopy");
              v114 = 0;
              -[CRKEDUPayload parseDepartmentFromDictionary:isStub:outError:](self, "parseDepartmentFromDictionary:isStub:outError:", v40, v6, &v114);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v114;

              if (v42)
              {

                goto LABEL_33;
              }
              objc_msgSend(v90, "addObject:", v41);

            }
            v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
            if (v86)
              continue;
            break;
          }
        }
        v42 = 0;
LABEL_33:

        v43 = (NSArray *)objc_msgSend(v90, "copy");
        departments = self->_departments;
        self->_departments = v43;

        v113 = v42;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Groups"), v6 ^ 1, &v113);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v113;

        if (v11)
          goto LABEL_34;
        v91 = (void *)objc_opt_new();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        obja = v37;
        v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
        if (v87)
        {
          v83 = *(id *)v110;
          while (2)
          {
            for (j = 0; j != v87; ++j)
            {
              if (*(id *)v110 != v83)
                objc_enumerationMutation(obja);
              v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * j), "mutableCopy");
              v108 = 0;
              -[CRKEDUPayload parseGroupFromDictionary:isStub:outError:](self, "parseGroupFromDictionary:isStub:outError:", v47, v6, &v108);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v108;

              if (v49)
                goto LABEL_52;
              objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("BeaconID"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKeyedSubscript:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "crk_valueNotUniqueErrorWithField:value:", CFSTR("BeaconID"), v50);
                v49 = (id)objc_claimAutoreleasedReturnValue();

LABEL_52:
                goto LABEL_53;
              }
              objc_msgSend(v91, "setObject:forKeyedSubscript:", v48, v50);

            }
            v49 = 0;
            v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
            if (v87)
              continue;
            break;
          }
        }
        else
        {
          v49 = 0;
        }
LABEL_53:

        objc_msgSend(v91, "allValues");
        v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
        groups = self->_groups;
        self->_groups = v52;

        v107 = v49;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Users"), v6 ^ 1, &v107);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v107;

        if (v55)
          goto LABEL_54;
        v92 = (void *)objc_opt_new();
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v84 = v54;
        v56 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v134, 16);
        if (v56)
        {
          v57 = v56;
          v88 = *(_QWORD *)v104;
          while (2)
          {
            for (k = 0; k != v57; ++k)
            {
              if (*(_QWORD *)v104 != v88)
                objc_enumerationMutation(v84);
              v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * k), "mutableCopy");
              v102 = 0;
              -[CRKEDUPayload parseUserFromDictionary:isStub:outError:](self, "parseUserFromDictionary:isStub:outError:", v59, v6, &v102);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = v102;

              if (v61)
                goto LABEL_67;
              objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Identifier"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              if (v63)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "crk_valueNotUniqueErrorWithField:value:", CFSTR("Identifier"), v62);
                v61 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
                goto LABEL_68;
              }
              objc_msgSend(v92, "setObject:forKeyedSubscript:", v60, v62);

            }
            v57 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v134, 16);
            v61 = 0;
            if (v57)
              continue;
            break;
          }
        }
        else
        {
          v61 = 0;
        }
LABEL_68:

        objc_msgSend(v92, "allValues");
        v64 = (NSArray *)objc_claimAutoreleasedReturnValue();
        users = self->_users;
        self->_users = v64;

        v101 = v61;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserIdentifier"), 0, &v101);
        v66 = (NSString *)objc_claimAutoreleasedReturnValue();
        v67 = v101;

        userIdentifier = self->_userIdentifier;
        self->_userIdentifier = v66;

        v11 = v67;
        if (!v67)
        {
          if (self->_userIdentifier
            && (objc_msgSend(v92, "objectForKeyedSubscript:"),
                v69 = (void *)objc_claimAutoreleasedReturnValue(),
                v69,
                !v69))
          {
            objc_msgSend(MEMORY[0x24BDD1540], "crk_malformedProfileErrorWithField:value:", CFSTR("UserIdentifier"), self->_userIdentifier);
            v71 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (-[CRKEDUPayload isEphemeralMultiUserDevice](self, "isEphemeralMultiUserDevice")
              || self->_userIdentifier)
            {

              v100 = 0;
              objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DeviceGroups"), 0, &v100);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v100;
              if (!v70)
              {
                v72 = (void *)objc_opt_new();
                v96 = 0u;
                v97 = 0u;
                v98 = 0u;
                v99 = 0u;
                v85 = v54;
                v93 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v133, 16);
                if (v93)
                {
                  v89 = *(_QWORD *)v97;
                  while (2)
                  {
                    for (m = 0; m != v93; ++m)
                    {
                      if (*(_QWORD *)v97 != v89)
                        objc_enumerationMutation(v85);
                      v74 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * m), "mutableCopy");
                      v95 = 0;
                      -[CRKEDUPayload parseDeviceGroupFromDictionary:isStub:outError:](self, "parseDeviceGroupFromDictionary:isStub:outError:", v74, v6, &v95);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = v95;

                      if (v37)
                        goto LABEL_91;
                      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("Name"));
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "objectForKeyedSubscript:", v76);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v77)
                      {
                        objc_msgSend(MEMORY[0x24BDD1540], "crk_valueNotUniqueErrorWithField:value:", CFSTR("Name"), v76);
                        v37 = (id)objc_claimAutoreleasedReturnValue();

LABEL_91:
                        goto LABEL_92;
                      }
                      objc_msgSend(v72, "setObject:forKeyedSubscript:", v75, v76);

                    }
                    v37 = 0;
                    v93 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v133, 16);
                    if (v93)
                      continue;
                    break;
                  }
                }
                else
                {
                  v37 = 0;
                }
LABEL_92:

                objc_msgSend(v72, "allValues");
                v78 = (NSArray *)objc_claimAutoreleasedReturnValue();
                deviceGroups = self->_deviceGroups;
                self->_deviceGroups = v78;

                v94 = v37;
                -[CRKEDUPayload areCredentialsValidForStub:error:](self, "areCredentialsValidForStub:error:", v6, &v94);
                v38 = v94;
LABEL_22:
                v11 = v38;
LABEL_34:

                goto LABEL_35;
              }
              v55 = v70;
LABEL_54:

              v11 = v55;
              goto LABEL_35;
            }
            objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", CFSTR("UserIdentifier"));
            v71 = objc_claimAutoreleasedReturnValue();
          }
          v11 = (id)v71;
        }

        goto LABEL_35;
      }
    }
  }
LABEL_36:
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (BOOL)areCredentialsValidForStub:(BOOL)a3 error:(id *)a4
{
  CRKEDUPayloadCredentialValidator *v5;

  v5 = -[CRKEDUPayloadCredentialValidator initWithPayload:isStub:isEphemeralMultiUserDevice:]([CRKEDUPayloadCredentialValidator alloc], "initWithPayload:isStub:isEphemeralMultiUserDevice:", self, a3, -[CRKEDUPayload isEphemeralMultiUserDevice](self, "isEphemeralMultiUserDevice"));
  LOBYTE(a4) = -[CRKEDUPayloadCredentialValidator areCredentialsValidWithError:](v5, "areCredentialsValidWithError:", a4);

  return (char)a4;
}

- (id)parseDepartmentFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = !v6;
  v16 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Name"), v8, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v10)
  {
    v11 = 0;
    goto LABEL_4;
  }
  v15 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("GroupBeaconIDs"), v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v10)
  {
LABEL_4:
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v12 = 0;
      *a5 = v10;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_12;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v13;
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("Name"));
  if (v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("GroupBeaconIDs"));
  v10 = 0;
LABEL_12:

  return v12;
}

- (id)parseGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a4;
  v7 = a3;
  v8 = !v6;
  v29 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("BeaconID"), v8, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  if (v10
    || (unint64_t)objc_msgSend(v9, "unsignedIntegerValue") >= 0x10000
    && (objc_msgSend(MEMORY[0x24BDD1540], "crk_unsupportedValueErrorWithField:value:", CFSTR("BeaconID"), v9),
        (v10 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v21 = 0;
    goto LABEL_3;
  }
  v28 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Name"), v8, &v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_3;
  }
  v27 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Description"), 0, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v27;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_3;
  }
  v26 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ConfigurationSource"), 0, &v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_3;
  }
  v25 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ImageURL"), 0, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_3;
  }
  v24 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("LeaderIdentifiers"), 0, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_3;
  }
  v23 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MemberIdentifiers"), v8, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  if (v10)
  {
    v11 = 0;
    goto LABEL_3;
  }
  v22 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DeviceGroupIdentifiers"), 0, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  if (v10)
  {
LABEL_3:
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v17 = 0;
      *a5 = v10;
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_10;
  }
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = v19;
  if (v9)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, CFSTR("BeaconID"));
  if (v21)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("Name"));
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("Description"));
  if (v15)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("ConfigurationSource"));
  if (v14)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("ImageURL"));
  if (v13)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, CFSTR("LeaderIdentifiers"));
  if (v12)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, CFSTR("MemberIdentifiers"));
  if (v11)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("DeviceGroupIdentifiers"));
  v17 = (void *)objc_msgSend(v20, "copy");

  v10 = 0;
LABEL_10:

  return v17;
}

- (id)parseUserFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v6 = a4;
  v7 = a3;
  v8 = !v6;
  v34 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Identifier"), v8, &v34);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v34;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_20;
  }
  v33 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Name"), v8, &v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v33;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_20;
  }
  v32 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("GivenName"), 0, &v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v22 = 0;
    goto LABEL_20;
  }
  v31 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("FamilyName"), 0, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v30 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PhoneticGivenName"), 0, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_20;
  }
  v29 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PhoneticFamilyName"), 0, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_20;
  }
  v28 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AppleID"), 0, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_20;
  }
  v27 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ImageURL"), 0, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v27;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_20;
  }
  v26 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("FullScreenImageURL"), 0, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;
  if (v10)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v25 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PasscodeType"), 0, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (v10)
  {
LABEL_20:
    v17 = (void *)v9;
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v18 = 0;
      *a5 = v10;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_23;
  }
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = v20;
  v17 = (void *)v9;
  if (v9)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"));
  if (v24)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("Name"));
  if (v23)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("GivenName"));
  if (v22)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("FamilyName"));
  if (v16)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("PhoneticGivenName"));
  if (v15)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("PhoneticFamilyName"));
  if (v14)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("AppleID"));
  if (v13)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, CFSTR("ImageURL"));
  if (v12)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, CFSTR("FullScreenImageURL"));
  if (v11)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, CFSTR("PasscodeType"));
  v18 = (void *)objc_msgSend(v21, "copy");

  v10 = 0;
LABEL_23:

  return v18;
}

- (id)parseDeviceGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = !v6;
  v19 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Identifier"), v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  v18 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Name"), v8, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v10)
  {
    v11 = 0;
    goto LABEL_6;
  }
  v17 = 0;
  objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SerialNumbers"), 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v10)
  {
LABEL_6:
    if (a5)
    {
      v10 = objc_retainAutorelease(v10);
      v13 = 0;
      *a5 = v10;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_9;
  }
  v15 = (void *)objc_opt_new();
  v16 = v15;
  if (v9)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"));
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("Name"));
  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("SerialNumbers"));
  v13 = (void *)objc_msgSend(v16, "copy");

  v10 = 0;
LABEL_9:

  return v13;
}

- (NSDictionary)configuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = (void *)objc_opt_new();
  -[CRKEDUPayload organizationUUID](self, "organizationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRKEDUPayload organizationUUID](self, "organizationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("OrganizationUUID"));

  }
  -[CRKEDUPayload organizationName](self, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRKEDUPayload organizationName](self, "organizationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("OrganizationName"));

  }
  -[CRKEDUPayload payloadCertificateUUID](self, "payloadCertificateUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRKEDUPayload payloadCertificateUUID](self, "payloadCertificateUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("PayloadCertificateUUID"));

  }
  -[CRKEDUPayload payloadCertificatePersistentID](self, "payloadCertificatePersistentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CRKEDUPayload payloadCertificatePersistentID](self, "payloadCertificatePersistentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("PayloadCertificatePersistentID"));

  }
  -[CRKEDUPayload leaderPayloadCertificateAnchorUUID](self, "leaderPayloadCertificateAnchorUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CRKEDUPayload leaderPayloadCertificateAnchorUUID](self, "leaderPayloadCertificateAnchorUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("LeaderPayloadCertificateAnchorUUID"));

  }
  -[CRKEDUPayload leaderPayloadCertificateAnchorPersistentID](self, "leaderPayloadCertificateAnchorPersistentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CRKEDUPayload leaderPayloadCertificateAnchorPersistentID](self, "leaderPayloadCertificateAnchorPersistentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("LeaderPayloadCertificateAnchorPersistentID"));

  }
  -[CRKEDUPayload memberPayloadCertificateAnchorUUID](self, "memberPayloadCertificateAnchorUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CRKEDUPayload memberPayloadCertificateAnchorUUID](self, "memberPayloadCertificateAnchorUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("MemberPayloadCertificateAnchorUUID"));

  }
  -[CRKEDUPayload memberPayloadCertificateAnchorPersistentID](self, "memberPayloadCertificateAnchorPersistentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CRKEDUPayload memberPayloadCertificateAnchorPersistentID](self, "memberPayloadCertificateAnchorPersistentID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("MemberPayloadCertificateAnchorPersistentID"));

  }
  -[CRKEDUPayload resourcePayloadCertificateUUID](self, "resourcePayloadCertificateUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CRKEDUPayload resourcePayloadCertificateUUID](self, "resourcePayloadCertificateUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("ResourcePayloadCertificateUUID"));

  }
  -[CRKEDUPayload resourcePayloadCertificatePersistentID](self, "resourcePayloadCertificatePersistentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CRKEDUPayload resourcePayloadCertificatePersistentID](self, "resourcePayloadCertificatePersistentID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ResourcePayloadCertificatePersistentID"));

  }
  -[CRKEDUPayload userIdentifier](self, "userIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CRKEDUPayload userIdentifier](self, "userIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("UserIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKEDUPayload screenObservationPermissionModificationAllowed](self, "screenObservationPermissionModificationAllowed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKEDUPayload screenObservationPermissionModificationAllowed](self, "screenObservationPermissionModificationAllowed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("ScreenObservationPermissionModificationAllowed"));

  }
  -[CRKEDUPayload departments](self, "departments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CRKEDUPayload departments](self, "departments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("Departments"));

  }
  -[CRKEDUPayload groups](self, "groups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CRKEDUPayload groups](self, "groups");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("Groups"));

  }
  -[CRKEDUPayload users](self, "users");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CRKEDUPayload users](self, "users");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("Users"));

  }
  -[CRKEDUPayload deviceGroups](self, "deviceGroups");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[CRKEDUPayload deviceGroups](self, "deviceGroups");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("DeviceGroups"));

  }
  v36 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v36;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = (void *)MEMORY[0x24BDD17C8];
  -[CRKEDUPayload organizationUUID](self, "organizationUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload organizationName](self, "organizationName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload payloadCertificateUUID](self, "payloadCertificateUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload payloadCertificatePersistentID](self, "payloadCertificatePersistentID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload leaderPayloadCertificateAnchorUUID](self, "leaderPayloadCertificateAnchorUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload leaderPayloadCertificateAnchorPersistentID](self, "leaderPayloadCertificateAnchorPersistentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload memberPayloadCertificateAnchorUUID](self, "memberPayloadCertificateAnchorUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload memberPayloadCertificateAnchorPersistentID](self, "memberPayloadCertificateAnchorPersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload resourcePayloadCertificateUUID](self, "resourcePayloadCertificateUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload resourcePayloadCertificatePersistentID](self, "resourcePayloadCertificatePersistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload userIdentifier](self, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRKEDUPayload screenObservationPermissionModificationAllowed](self, "screenObservationPermissionModificationAllowed"))
  {
    v7 = CFSTR("YES");
  }
  else
  {
    v7 = CFSTR("NO");
  }
  -[CRKEDUPayload departments](self, "departments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload groups](self, "groups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload users](self, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKEDUPayload deviceGroups](self, "deviceGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("organizationUUID: %@             organizationName: %@             payloadCertificateUUID: %@             payloadCertificatePersistentID: %@             leaderPayloadCertificateAnchorUUID: %@             leaderPayloadCertificateAnchorPersistentID: %@             memberPayloadCertificateAnchorUUID: %@             memberPayloadCertificateAnchorPersistentID: %@             resourcePayloadCertificateUUID: %@             resourcePayloadCertificatePersistentID: %@             userIdentifier: %@             screenObservationPermissionModificationAllowed: %@             departments: %@             groups: %@             users: %@             deviceGroups: %@"), v17, v16, v15, v21, v14, v20, v13, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)payloadDisplayName
{
  return self->_payloadDisplayName;
}

- (void)setPayloadDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDisplayName, a3);
}

- (NSString)payloadDescriptionName
{
  return self->_payloadDescriptionName;
}

- (void)setPayloadDescriptionName:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDescriptionName, a3);
}

- (NSString)organizationUUID
{
  return self->_organizationUUID;
}

- (void)setOrganizationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_organizationUUID, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSString)payloadCertificateUUID
{
  return self->_payloadCertificateUUID;
}

- (void)setPayloadCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadCertificateUUID, a3);
}

- (NSData)payloadCertificatePersistentID
{
  return self->_payloadCertificatePersistentID;
}

- (void)setPayloadCertificatePersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadCertificatePersistentID, a3);
}

- (NSArray)leaderPayloadCertificateAnchorUUID
{
  return self->_leaderPayloadCertificateAnchorUUID;
}

- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3
{
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorUUID, a3);
}

- (NSArray)leaderPayloadCertificateAnchorPersistentID
{
  return self->_leaderPayloadCertificateAnchorPersistentID;
}

- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorPersistentID, a3);
}

- (NSArray)memberPayloadCertificateAnchorUUID
{
  return self->_memberPayloadCertificateAnchorUUID;
}

- (void)setMemberPayloadCertificateAnchorUUID:(id)a3
{
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorUUID, a3);
}

- (NSArray)memberPayloadCertificateAnchorPersistentID
{
  return self->_memberPayloadCertificateAnchorPersistentID;
}

- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorPersistentID, a3);
}

- (NSString)resourcePayloadCertificateUUID
{
  return self->_resourcePayloadCertificateUUID;
}

- (void)setResourcePayloadCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePayloadCertificateUUID, a3);
}

- (NSData)resourcePayloadCertificatePersistentID
{
  return self->_resourcePayloadCertificatePersistentID;
}

- (void)setResourcePayloadCertificatePersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePayloadCertificatePersistentID, a3);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentifier, a3);
}

- (BOOL)screenObservationPermissionModificationAllowed
{
  return self->_screenObservationPermissionModificationAllowed;
}

- (void)setScreenObservationPermissionModificationAllowed:(BOOL)a3
{
  self->_screenObservationPermissionModificationAllowed = a3;
}

- (NSArray)departments
{
  return self->_departments;
}

- (void)setDepartments:(id)a3
{
  objc_storeStrong((id *)&self->_departments, a3);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGroups, a3);
}

- (BOOL)isEphemeralMultiUserDevice
{
  return self->_isEphemeralMultiUserDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_departments, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_resourcePayloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_resourcePayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorPersistentID, 0);
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorPersistentID, 0);
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_payloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_payloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_organizationUUID, 0);
  objc_storeStrong((id *)&self->_payloadDescriptionName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayName, 0);
}

- (void)parseDictionary:(os_log_t)log isStub:outError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218C99000, log, OS_LOG_TYPE_DEBUG, "Start CRKEDUPayload parsing", v1, 2u);
}

@end

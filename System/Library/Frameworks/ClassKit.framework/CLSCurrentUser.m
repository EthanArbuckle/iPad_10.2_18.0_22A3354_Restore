@implementation CLSCurrentUser

+ (NSString)magicValue
{
  return (NSString *)CFSTR("🚫🇬🇭🎁∪🆙");
}

+ (unint64_t)userRolesFromUserLocationIDsByAXMRoleType:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend_allKeys(a3, a2, (uint64_t)a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, v18, 16);
  if (v5)
  {
    v8 = v5;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v3);
        v12 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i), v6, v7);
        switch(v12)
        {
          case 6:
            v9 |= 1uLL;
            break;
          case 4:
            v9 |= 2uLL;
            break;
          case 1:
            v9 |= 8uLL;
            break;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSCurrentUser;
  return -[CLSCurrentUser init](&v3, sel_init);
}

- (unint64_t)_useRoles
{
  NSDictionary *locationIDsByAXMRoleType;

  locationIDsByAXMRoleType = self->_locationIDsByAXMRoleType;
  if (locationIDsByAXMRoleType)
    return MEMORY[0x1E0DE7D20](CLSCurrentUser, sel_userRolesFromUserLocationIDsByAXMRoleType_, locationIDsByAXMRoleType);
  else
    return self->_roles;
}

- (BOOL)_hasRole:(unint64_t)a3
{
  return (objc_msgSend__useRoles(self, a2, a3) & a3) != 0;
}

- (BOOL)hasRole:(unint64_t)a3
{
  return MEMORY[0x1E0DE7D20](self, sel__hasRole_, a3);
}

- (BOOL)isAdministrator
{
  return MEMORY[0x1E0DE7D20](self, sel__hasRole_, 8);
}

- (BOOL)isInstructor
{
  return MEMORY[0x1E0DE7D20](self, sel__hasRole_, 2);
}

- (BOOL)isStudent
{
  return MEMORY[0x1E0DE7D20](self, sel__hasRole_, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t hasMatchingPersona;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t hasDataSeparatedAccount;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t hasManagedAccount;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t hasEDUAccount;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t hasUbiquityEnabled;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend_init(v7, v8, v9);
  objc_msgSend_person(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_setPerson_(v10, v17, (uint64_t)v16);

  v20 = objc_msgSend_roles(self, v18, v19);
  objc_msgSend_setRoles_(v10, v21, v20);
  objc_msgSend_accountIdentifier(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccountIdentifier_(v10, v25, (uint64_t)v24);

  objc_msgSend_accountPersonaUniqueIdentifier(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccountPersonaUniqueIdentifier_(v10, v29, (uint64_t)v28);

  objc_msgSend_clientPersonaUniqueIdentifier(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientPersonaUniqueIdentifier_(v10, v33, (uint64_t)v32);

  v36 = objc_msgSend_requiresPersonaMatch(self, v34, v35);
  objc_msgSend_setRequiresPersonaMatch_(v10, v37, v36);
  hasMatchingPersona = objc_msgSend_hasMatchingPersona(self, v38, v39);
  objc_msgSend_setHasMatchingPersona_(v10, v41, hasMatchingPersona);
  hasDataSeparatedAccount = objc_msgSend_hasDataSeparatedAccount(self, v42, v43);
  objc_msgSend_setHasDataSeparatedAccount_(v10, v45, hasDataSeparatedAccount);
  hasManagedAccount = objc_msgSend_hasManagedAccount(self, v46, v47);
  objc_msgSend_setHasManagedAccount_(v10, v49, hasManagedAccount);
  hasEDUAccount = objc_msgSend_hasEDUAccount(self, v50, v51);
  objc_msgSend_setHasEDUAccount_(v10, v53, hasEDUAccount);
  hasUbiquityEnabled = objc_msgSend_hasUbiquityEnabled(self, v54, v55);
  objc_msgSend_setHasUbiquityEnabled_(v10, v57, hasUbiquityEnabled);
  objc_msgSend_organizationName(self, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOrganizationName_(v10, v61, (uint64_t)v60);

  v64 = objc_msgSend_organizationProgressTrackingAllowed(self, v62, v63);
  objc_msgSend_setOrganizationProgressTrackingAllowed_(v10, v65, v64);
  v68 = objc_msgSend_organizationMaidAnalyticsEnabled(self, v66, v67);
  objc_msgSend_setOrganizationMaidAnalyticsEnabled_(v10, v69, v68);
  v72 = objc_msgSend_personMaidAnalyticsEnabled(self, v70, v71);
  objc_msgSend_setPersonMaidAnalyticsEnabled_(v10, v73, v72);
  v76 = objc_msgSend_catalogEnvironment(self, v74, v75);
  objc_msgSend_setCatalogEnvironment_(v10, v77, v76);
  v80 = objc_msgSend_rosterServiceAuthenticationState(self, v78, v79);
  objc_msgSend_setRosterServiceAuthenticationState_(v10, v81, v80);
  v84 = objc_msgSend_handoutServiceAuthenticationState(self, v82, v83);
  objc_msgSend_setHandoutServiceAuthenticationState_(v10, v85, v84);
  v88 = objc_msgSend_iCloudDriveAuthenticationState(self, v86, v87);
  objc_msgSend_setICloudDriveAuthenticationState_(v10, v89, v88);
  objc_msgSend_schoolworkUbiquitousContainerURL(self, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSchoolworkUbiquitousContainerURL_(v10, v93, (uint64_t)v92);

  objc_msgSend_schoolworkUbiquitousContainerError(self, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSchoolworkUbiquitousContainerError_(v10, v97, (uint64_t)v96);

  objc_msgSend_schoolworkUbiquitousContainerURLSandboxExtension(self, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSchoolworkUbiquitousContainerURLSandboxExtension_(v10, v101, (uint64_t)v100);

  objc_msgSend_orgAdminUserRecordID(self, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOrgAdminUserRecordID_(v10, v105, (uint64_t)v104);

  objc_msgSend_orgAdminUserFetchError(self, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOrgAdminUserFetchError_(v10, v109, (uint64_t)v108);

  objc_msgSend_userRecordID(self, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserRecordID_(v10, v113, (uint64_t)v112);

  objc_msgSend_userFetchError(self, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserFetchError_(v10, v117, (uint64_t)v116);

  objc_msgSend_multimediaCacheDirectoryURL(self, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMultimediaCacheDirectoryURL_(v10, v121, (uint64_t)v120);

  objc_msgSend_multimediaCacheDirectoryURLError(self, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMultimediaCacheDirectoryURLError_(v10, v125, (uint64_t)v124);

  objc_msgSend_multimediaCacheDirectoryURLSandboxExtension(self, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMultimediaCacheDirectoryURLSandboxExtension_(v10, v129, (uint64_t)v128);

  v132 = objc_msgSend_allowSharingOutsideOrg(self, v130, v131);
  objc_msgSend_setAllowSharingOutsideOrg_(v10, v133, v132);
  v136 = objc_msgSend_classroomClassicAdHocModeEnabled(self, v134, v135);
  objc_msgSend_setClassroomClassicAdHocModeEnabled_(v10, v137, v136);
  return v10;
}

- (CLSCurrentUser)initWithCoder:(id)a3
{
  id v4;
  CLSCurrentUser *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CLSPerson *person;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSDictionary *locationIDsByAXMRoleType;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *accountIdentifier;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSString *accountPersonaUniqueIdentifier;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSString *clientPersonaUniqueIdentifier;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSString *organizationName;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  int v53;
  uint64_t v54;
  const char *v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  NSURL *schoolworkUbiquitousContainerURL;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSError *schoolworkUbiquitousContainerError;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  NSData *schoolworkUbiquitousContainerURLSandboxExtension;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  CKRecordID *orgAdminUserRecordID;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  NSError *orgAdminUserFetchError;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  CKRecordID *userRecordID;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  NSError *userFetchError;
  const char *v87;
  NSURL *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  NSURL *multimediaCacheDirectoryURL;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  NSError *multimediaCacheDirectoryURLError;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  NSData *multimediaCacheDirectoryURLSandboxExtension;
  const char *v104;
  NSURL *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  objc_super v111;

  v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)CLSCurrentUser;
  v5 = -[CLSCurrentUser init](&v111, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("person"));
    v8 = objc_claimAutoreleasedReturnValue();
    person = v5->_person;
    v5->_person = (CLSPerson *)v8;

    v5->_roles = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("roles"));
    v12 = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("devMode"));
    if (v12 == 2)
      v14 = 2;
    else
      v14 = v12 == 1;
    v5->_devMode = v14;
    v5->_catalogEnvironment = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("catalogEnvironment")) == 1;
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v15, v20, v16, v17, v18, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, CFSTR("locationIDsByAXMRoleType"));
    v23 = objc_claimAutoreleasedReturnValue();
    locationIDsByAXMRoleType = v5->_locationIDsByAXMRoleType;
    v5->_locationIDsByAXMRoleType = (NSDictionary *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("accountIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v27;

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, CFSTR("accountPersonaUniqueIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    accountPersonaUniqueIdentifier = v5->_accountPersonaUniqueIdentifier;
    v5->_accountPersonaUniqueIdentifier = (NSString *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, CFSTR("clientPersonaUniqueIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    clientPersonaUniqueIdentifier = v5->_clientPersonaUniqueIdentifier;
    v5->_clientPersonaUniqueIdentifier = (NSString *)v35;

    v5->_requiresPersonaMatch = objc_msgSend_decodeBoolForKey_(v4, v37, (uint64_t)CFSTR("requiresPersonaMatch"));
    v5->_hasMatchingPersona = objc_msgSend_decodeBoolForKey_(v4, v38, (uint64_t)CFSTR("hasMatchingPersona"));
    v5->_hasDataSeparatedAccount = objc_msgSend_decodeBoolForKey_(v4, v39, (uint64_t)CFSTR("hasDataSeparatedAccount"));
    v5->_hasManagedAccount = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)CFSTR("hasManagedAccount"));
    v5->_hasEDUAccount = objc_msgSend_decodeBoolForKey_(v4, v41, (uint64_t)CFSTR("hasEDUAccount"));
    v5->_hasUbiquityEnabled = objc_msgSend_decodeBoolForKey_(v4, v42, (uint64_t)CFSTR("hasUbiquityEnabled"));
    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, CFSTR("organizationName"));
    v45 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v45;

    v5->_organizationProgressTrackingAllowed = objc_msgSend_decodeBoolForKey_(v4, v47, (uint64_t)CFSTR("organizationProgressTrackingAllowed"));
    v5->_organizationMaidAnalyticsEnabled = objc_msgSend_decodeBoolForKey_(v4, v48, (uint64_t)CFSTR("organizationMaidAnalyticsEnabled"));
    v5->_personMaidAnalyticsEnabled = objc_msgSend_decodeBoolForKey_(v4, v49, (uint64_t)CFSTR("personMaidAnalyticsEnabled"));
    v51 = objc_msgSend_decodeIntegerForKey_(v4, v50, (uint64_t)CFSTR("rosterServiceAuthenticationState"));
    if (v51 == 2)
      v53 = 2;
    else
      v53 = v51 == 1;
    v5->_rosterServiceAuthenticationState = v53;
    v54 = objc_msgSend_decodeIntegerForKey_(v4, v52, (uint64_t)CFSTR("handoutServiceAuthenticationState"));
    if (v54 == 2)
      v56 = 2;
    else
      v56 = v54 == 1;
    v5->_handoutServiceAuthenticationState = v56;
    v57 = objc_msgSend_decodeIntegerForKey_(v4, v55, (uint64_t)CFSTR("iCloudDriveAuthenticationState"));
    v58 = v57 == 1;
    if (v57 == 2)
      v58 = 2;
    v5->_iCloudDriveAuthenticationState = v58;
    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, CFSTR("schoolworkUbiquitousContainerURL"));
    v61 = objc_claimAutoreleasedReturnValue();
    schoolworkUbiquitousContainerURL = v5->_schoolworkUbiquitousContainerURL;
    v5->_schoolworkUbiquitousContainerURL = (NSURL *)v61;

    v63 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v64, v63, CFSTR("schoolworkUbiquitousContainerError"));
    v65 = objc_claimAutoreleasedReturnValue();
    schoolworkUbiquitousContainerError = v5->_schoolworkUbiquitousContainerError;
    v5->_schoolworkUbiquitousContainerError = (NSError *)v65;

    v67 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, CFSTR("schoolworkUbiquitousContainerURLSandboxExtension"));
    v69 = objc_claimAutoreleasedReturnValue();
    schoolworkUbiquitousContainerURLSandboxExtension = v5->_schoolworkUbiquitousContainerURLSandboxExtension;
    v5->_schoolworkUbiquitousContainerURLSandboxExtension = (NSData *)v69;

    v71 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, CFSTR("orgAdminUserRecordID"));
    v73 = objc_claimAutoreleasedReturnValue();
    orgAdminUserRecordID = v5->_orgAdminUserRecordID;
    v5->_orgAdminUserRecordID = (CKRecordID *)v73;

    v75 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v75, CFSTR("orgAdminUserFetchError"));
    v77 = objc_claimAutoreleasedReturnValue();
    orgAdminUserFetchError = v5->_orgAdminUserFetchError;
    v5->_orgAdminUserFetchError = (NSError *)v77;

    v79 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, CFSTR("userRecordID"));
    v81 = objc_claimAutoreleasedReturnValue();
    userRecordID = v5->_userRecordID;
    v5->_userRecordID = (CKRecordID *)v81;

    v83 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, CFSTR("userFetchError"));
    v85 = objc_claimAutoreleasedReturnValue();
    userFetchError = v5->_userFetchError;
    v5->_userFetchError = (NSError *)v85;

    v88 = v5->_schoolworkUbiquitousContainerURL;
    if (v88)
    {
      v89 = (uint64_t)v5->_schoolworkUbiquitousContainerURLSandboxExtension;
      if (v89)
      {
        objc_msgSend_attachSandboxExtensionToken_(v88, v87, v89);
        v5->_hasSecurityScopedSchoolworkUbiquitousContainerURL = objc_msgSend_startAccessingSecurityScopedResource(v5->_schoolworkUbiquitousContainerURL, v90, v91);
      }
    }
    v92 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, CFSTR("multimediaCacheDirectoryURL"));
    v94 = objc_claimAutoreleasedReturnValue();
    multimediaCacheDirectoryURL = v5->_multimediaCacheDirectoryURL;
    v5->_multimediaCacheDirectoryURL = (NSURL *)v94;

    v96 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, CFSTR("multimediaCacheDirectoryURLError"));
    v98 = objc_claimAutoreleasedReturnValue();
    multimediaCacheDirectoryURLError = v5->_multimediaCacheDirectoryURLError;
    v5->_multimediaCacheDirectoryURLError = (NSError *)v98;

    v100 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, CFSTR("multimediaCacheDirectoryURLSandboxExtension"));
    v102 = objc_claimAutoreleasedReturnValue();
    multimediaCacheDirectoryURLSandboxExtension = v5->_multimediaCacheDirectoryURLSandboxExtension;
    v5->_multimediaCacheDirectoryURLSandboxExtension = (NSData *)v102;

    v105 = v5->_multimediaCacheDirectoryURL;
    if (v105)
    {
      v106 = (uint64_t)v5->_multimediaCacheDirectoryURLSandboxExtension;
      if (v106)
      {
        objc_msgSend_attachSandboxExtensionToken_(v105, v104, v106);
        v5->_hasSecurityScopedMultimediaCacheDirectoryURL = objc_msgSend_startAccessingSecurityScopedResource(v5->_multimediaCacheDirectoryURL, v107, v108);
      }
    }
    v5->_allowSharingOutsideOrg = objc_msgSend_decodeBoolForKey_(v4, v104, (uint64_t)CFSTR("allowSharingOutsideOrg"));
    v5->_classroomClassicAdHocModeEnabled = objc_msgSend_decodeBoolForKey_(v4, v109, (uint64_t)CFSTR("classroomClassicAdHocModeEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CLSPerson *person;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  id v38;

  person = self->_person;
  v38 = a3;
  objc_msgSend_encodeObject_forKey_(v38, v5, (uint64_t)person, CFSTR("person"));
  objc_msgSend_encodeInteger_forKey_(v38, v6, self->_roles, CFSTR("roles"));
  objc_msgSend_encodeInteger_forKey_(v38, v7, self->_devMode, CFSTR("devMode"));
  objc_msgSend_encodeInteger_forKey_(v38, v8, self->_catalogEnvironment, CFSTR("catalogEnvironment"));
  objc_msgSend_encodeObject_forKey_(v38, v9, (uint64_t)self->_locationIDsByAXMRoleType, CFSTR("locationIDsByAXMRoleType"));
  objc_msgSend_encodeObject_forKey_(v38, v10, (uint64_t)self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend_encodeObject_forKey_(v38, v11, (uint64_t)self->_accountPersonaUniqueIdentifier, CFSTR("accountPersonaUniqueIdentifier"));
  objc_msgSend_encodeObject_forKey_(v38, v12, (uint64_t)self->_clientPersonaUniqueIdentifier, CFSTR("clientPersonaUniqueIdentifier"));
  objc_msgSend_encodeBool_forKey_(v38, v13, self->_hasManagedAccount, CFSTR("hasManagedAccount"));
  objc_msgSend_encodeBool_forKey_(v38, v14, self->_hasEDUAccount, CFSTR("hasEDUAccount"));
  objc_msgSend_encodeBool_forKey_(v38, v15, self->_hasUbiquityEnabled, CFSTR("hasUbiquityEnabled"));
  objc_msgSend_encodeBool_forKey_(v38, v16, self->_requiresPersonaMatch, CFSTR("requiresPersonaMatch"));
  objc_msgSend_encodeBool_forKey_(v38, v17, self->_hasMatchingPersona, CFSTR("hasMatchingPersona"));
  objc_msgSend_encodeBool_forKey_(v38, v18, self->_hasDataSeparatedAccount, CFSTR("hasDataSeparatedAccount"));
  objc_msgSend_encodeObject_forKey_(v38, v19, (uint64_t)self->_organizationName, CFSTR("organizationName"));
  objc_msgSend_encodeBool_forKey_(v38, v20, self->_organizationProgressTrackingAllowed, CFSTR("organizationProgressTrackingAllowed"));
  objc_msgSend_encodeBool_forKey_(v38, v21, self->_organizationMaidAnalyticsEnabled, CFSTR("organizationMaidAnalyticsEnabled"));
  objc_msgSend_encodeBool_forKey_(v38, v22, self->_personMaidAnalyticsEnabled, CFSTR("personMaidAnalyticsEnabled"));
  objc_msgSend_encodeInteger_forKey_(v38, v23, self->_rosterServiceAuthenticationState, CFSTR("rosterServiceAuthenticationState"));
  objc_msgSend_encodeInteger_forKey_(v38, v24, self->_handoutServiceAuthenticationState, CFSTR("handoutServiceAuthenticationState"));
  objc_msgSend_encodeInteger_forKey_(v38, v25, self->_iCloudDriveAuthenticationState, CFSTR("iCloudDriveAuthenticationState"));
  objc_msgSend_encodeObject_forKey_(v38, v26, (uint64_t)self->_schoolworkUbiquitousContainerURL, CFSTR("schoolworkUbiquitousContainerURL"));
  objc_msgSend_encodeObject_forKey_(v38, v27, (uint64_t)self->_schoolworkUbiquitousContainerError, CFSTR("schoolworkUbiquitousContainerError"));
  objc_msgSend_encodeObject_forKey_(v38, v28, (uint64_t)self->_schoolworkUbiquitousContainerURLSandboxExtension, CFSTR("schoolworkUbiquitousContainerURLSandboxExtension"));
  objc_msgSend_encodeObject_forKey_(v38, v29, (uint64_t)self->_orgAdminUserRecordID, CFSTR("orgAdminUserRecordID"));
  objc_msgSend_encodeObject_forKey_(v38, v30, (uint64_t)self->_orgAdminUserFetchError, CFSTR("orgAdminUserFetchError"));
  objc_msgSend_encodeObject_forKey_(v38, v31, (uint64_t)self->_userRecordID, CFSTR("userRecordID"));
  objc_msgSend_encodeObject_forKey_(v38, v32, (uint64_t)self->_userFetchError, CFSTR("userFetchError"));
  objc_msgSend_encodeObject_forKey_(v38, v33, (uint64_t)self->_multimediaCacheDirectoryURL, CFSTR("multimediaCacheDirectoryURL"));
  objc_msgSend_encodeObject_forKey_(v38, v34, (uint64_t)self->_multimediaCacheDirectoryURLError, CFSTR("multimediaCacheDirectoryURLError"));
  objc_msgSend_encodeObject_forKey_(v38, v35, (uint64_t)self->_multimediaCacheDirectoryURLSandboxExtension, CFSTR("multimediaCacheDirectoryURLSandboxExtension"));
  objc_msgSend_encodeBool_forKey_(v38, v36, self->_allowSharingOutsideOrg, CFSTR("allowSharingOutsideOrg"));
  objc_msgSend_encodeBool_forKey_(v38, v37, self->_classroomClassicAdHocModeEnabled, CFSTR("classroomClassicAdHocModeEnabled"));

}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  if (self->_hasSecurityScopedSchoolworkUbiquitousContainerURL)
    objc_msgSend_stopAccessingSecurityScopedResource(self->_schoolworkUbiquitousContainerURL, a2, v2);
  if (self->_hasSecurityScopedMultimediaCacheDirectoryURL)
    objc_msgSend_stopAccessingSecurityScopedResource(self->_multimediaCacheDirectoryURL, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CLSCurrentUser;
  -[CLSCurrentUser dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  unsigned int v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  unsigned int v86;
  const char *v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  unsigned int v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  objc_super v141;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v141.receiver = self;
  v141.super_class = (Class)CLSCurrentUser;
  -[CLSCurrentUser description](&v141, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  objc_msgSend_organizationName(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR("\n  organizationName:                    %@"), v9);

  objc_msgSend_givenName(self->_person, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_middleName(self->_person, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_familyName(self->_person, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appleID(self->_person, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v23, (uint64_t)CFSTR("\n  person:                              %@ %@ %@ [%@]"), v13, v16, v19, v22);

  objc_msgSend_accountIdentifier(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR("\n  accountIdentifier:                   %@"), v26);

  objc_msgSend_accountPersonaUniqueIdentifier(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v31, (uint64_t)CFSTR("\n  accountPersonaUniqueIdentifier:      %@"), v30);

  objc_msgSend_clientPersonaUniqueIdentifier(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v35, (uint64_t)CFSTR("\n  clientPersonaUniqueIdentifier:       %@"), v34);

  if (objc_msgSend_hasDataSeparatedAccount(self, v36, v37))
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("\n  hasDataSeparatedAccount:             %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("\n  hasDataSeparatedAccount:             %s"), "NO");
  if (objc_msgSend_requiresPersonaMatch(self, v39, v40))
    objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR("\n  requiresPersonaMatch:                %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR("\n  requiresPersonaMatch:                %s"), "NO");
  if (objc_msgSend_hasMatchingPersona(self, v42, v43))
    objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR("\n  hasMatchingPersona:                  %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR("\n  hasMatchingPersona:                  %s"), "NO");
  if (objc_msgSend_isAdministrator(self, v45, v46))
    objc_msgSend_appendFormat_(v6, v47, (uint64_t)CFSTR("\n  isAdministrator:                     %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v47, (uint64_t)CFSTR("\n  isAdministrator:                     %s"), "NO");
  if (objc_msgSend_isInstructor(self, v48, v49))
    objc_msgSend_appendFormat_(v6, v50, (uint64_t)CFSTR("\n  isInstructor:                        %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v50, (uint64_t)CFSTR("\n  isInstructor:                        %s"), "NO");
  if (objc_msgSend_isStudent(self, v51, v52))
    objc_msgSend_appendFormat_(v6, v53, (uint64_t)CFSTR("\n  isStudent:                           %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v53, (uint64_t)CFSTR("\n  isStudent:                           %s"), "NO");
  if (objc_msgSend_hasManagedAccount(self, v54, v55))
    objc_msgSend_appendFormat_(v6, v56, (uint64_t)CFSTR("\n  hasManagedAccount:                   %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v56, (uint64_t)CFSTR("\n  hasManagedAccount:                   %s"), "NO");
  if (objc_msgSend_hasEDUAccount(self, v57, v58))
    objc_msgSend_appendFormat_(v6, v59, (uint64_t)CFSTR("\n  hasEDUAccount:                       %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v59, (uint64_t)CFSTR("\n  hasEDUAccount:                       %s"), "NO");
  if (objc_msgSend_hasUbiquityEnabled(self, v60, v61))
    objc_msgSend_appendFormat_(v6, v62, (uint64_t)CFSTR("\n  hasUbiquityEnabled:                  %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v62, (uint64_t)CFSTR("\n  hasUbiquityEnabled:                  %s"), "NO");
  if (objc_msgSend_organizationProgressTrackingAllowed(self, v63, v64))
    objc_msgSend_appendFormat_(v6, v65, (uint64_t)CFSTR("\n  organizationProgressTrackingAllowed: %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v65, (uint64_t)CFSTR("\n  organizationProgressTrackingAllowed: %s"), "NO");
  if (objc_msgSend_organizationMaidAnalyticsEnabled(self, v66, v67))
    objc_msgSend_appendFormat_(v6, v68, (uint64_t)CFSTR("\n  organizationMaidAnalyticsEnabled:    %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v68, (uint64_t)CFSTR("\n  organizationMaidAnalyticsEnabled:    %s"), "NO");
  if (objc_msgSend_personMaidAnalyticsEnabled(self, v69, v70))
    objc_msgSend_appendFormat_(v6, v71, (uint64_t)CFSTR("\n  personMaidAnalyticsEnabled:          %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v71, (uint64_t)CFSTR("\n  personMaidAnalyticsEnabled:          %s"), "NO");
  v74 = objc_msgSend_catalogEnvironment(self, v72, v73);
  NSStringFromClassKitCatalogEnvironment(v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v77, (uint64_t)CFSTR("\n  catalogEnvironment:                  %@"), v76);

  v80 = objc_msgSend_rosterServiceAuthenticationState(self, v78, v79);
  NSStringFromCLSAuthenticationState(v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v83, (uint64_t)CFSTR("\n  rosterServiceAuthenticationState:    %@"), v82);

  v86 = objc_msgSend_handoutServiceAuthenticationState(self, v84, v85);
  NSStringFromCLSAuthenticationState(v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v89, (uint64_t)CFSTR("\n  handoutServiceAuthenticationState:   %@"), v88);

  v92 = objc_msgSend_iCloudDriveAuthenticationState(self, v90, v91);
  NSStringFromCLSAuthenticationState(v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v95, (uint64_t)CFSTR("\n  iCloudDriveAuthenticationState:      %@"), v94);

  objc_msgSend_schoolworkUbiquitousContainerURL(self, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v102, (uint64_t)CFSTR("\n  schoolworkUbiquitousContainerURL:    %@"), v101);

  objc_msgSend_schoolworkUbiquitousContainerError(self, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v106, (uint64_t)CFSTR("\n  schoolworkUbiquitousContainerError:  %@"), v105);

  objc_msgSend_orgAdminUserRecordID(self, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v110, (uint64_t)CFSTR("\n  orgAdminUserRecordID:                %@"), v109);

  objc_msgSend_orgAdminUserFetchError(self, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v114, (uint64_t)CFSTR("\n  orgAdminUserFetchError:              %@"), v113);

  objc_msgSend_userRecordID(self, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v118, (uint64_t)CFSTR("\n  userRecordID:                        %@"), v117);

  objc_msgSend_userFetchError(self, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v122, (uint64_t)CFSTR("\n  userFetchError:                      %@"), v121);

  objc_msgSend_multimediaCacheDirectoryURL(self, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v129, (uint64_t)CFSTR("\n  multimediaCacheDirectoryURL:         %@"), v128);

  objc_msgSend_multimediaCacheDirectoryURLError(self, v130, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v133, (uint64_t)CFSTR("\n  multimediaCacheDirectoryURLError:    %@"), v132);

  if (objc_msgSend_allowSharingOutsideOrg(self, v134, v135))
    objc_msgSend_appendFormat_(v6, v136, (uint64_t)CFSTR("\n  allowSharingOutsideOrg:              %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v136, (uint64_t)CFSTR("\n  allowSharingOutsideOrg:              %s"), "NO");
  if (objc_msgSend_classroomClassicAdHocModeEnabled(self, v137, v138))
    objc_msgSend_appendFormat_(v6, v139, (uint64_t)CFSTR("\n  classroomClassicAdHocModeEnabled:    %s"), "YES");
  else
    objc_msgSend_appendFormat_(v6, v139, (uint64_t)CFSTR("\n  classroomClassicAdHocModeEnabled:    %s"), "NO");
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  unsigned int v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  unsigned int v77;
  const char *v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  unsigned int v83;
  const char *v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_organizationName(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("organizationName"));

  objc_msgSend_person(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("person"));

  objc_msgSend_accountIdentifier(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, CFSTR("accountIdentifier"));

  objc_msgSend_accountPersonaUniqueIdentifier(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, CFSTR("accountPersonaUniqueIdentifier"));

  objc_msgSend_clientPersonaUniqueIdentifier(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, CFSTR("clientPersonaUniqueIdentifier"));

  if (objc_msgSend_hasDataSeparatedAccount(self, v27, v28))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)CFSTR("YES"), CFSTR("hasDataSeparatedAccount"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)CFSTR("NO"), CFSTR("hasDataSeparatedAccount"));
  if (objc_msgSend_requiresPersonaMatch(self, v30, v31))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)CFSTR("YES"), CFSTR("requiresPersonaMatch"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)CFSTR("NO"), CFSTR("requiresPersonaMatch"));
  if (objc_msgSend_hasMatchingPersona(self, v33, v34))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)CFSTR("YES"), CFSTR("hasMatchingPersona"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)CFSTR("NO"), CFSTR("hasMatchingPersona"));
  if (objc_msgSend_isAdministrator(self, v36, v37))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)CFSTR("YES"), CFSTR("isAdministrator"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)CFSTR("NO"), CFSTR("isAdministrator"));
  if (objc_msgSend_isInstructor(self, v39, v40))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)CFSTR("YES"), CFSTR("isTeacher"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)CFSTR("NO"), CFSTR("isTeacher"));
  if (objc_msgSend_isStudent(self, v42, v43))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)CFSTR("YES"), CFSTR("isStudent"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)CFSTR("NO"), CFSTR("isStudent"));
  if (objc_msgSend_hasManagedAccount(self, v45, v46))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)CFSTR("YES"), CFSTR("hasManagedAccount"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)CFSTR("NO"), CFSTR("hasManagedAccount"));
  if (objc_msgSend_hasEDUAccount(self, v48, v49))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)CFSTR("YES"), CFSTR("hasEDUAccount"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)CFSTR("NO"), CFSTR("hasEDUAccount"));
  if (objc_msgSend_hasUbiquityEnabled(self, v51, v52))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)CFSTR("YES"), CFSTR("hasUbiquityEnabled"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)CFSTR("NO"), CFSTR("hasUbiquityEnabled"));
  if (objc_msgSend_organizationProgressTrackingAllowed(self, v54, v55))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v56, (uint64_t)CFSTR("YES"), CFSTR("organizationProgressTrackingAllowed"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v56, (uint64_t)CFSTR("NO"), CFSTR("organizationProgressTrackingAllowed"));
  if (objc_msgSend_organizationMaidAnalyticsEnabled(self, v57, v58))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)CFSTR("YES"), CFSTR("organizationMaidAnalyticsEnabled"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)CFSTR("NO"), CFSTR("organizationMaidAnalyticsEnabled"));
  if (objc_msgSend_personMaidAnalyticsEnabled(self, v60, v61))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)CFSTR("YES"), CFSTR("personMaidAnalyticsEnabled"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)CFSTR("NO"), CFSTR("personMaidAnalyticsEnabled"));
  v65 = objc_msgSend_catalogEnvironment(self, v63, v64);
  NSStringFromClassKitCatalogEnvironment(v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, CFSTR("catalogEnvironment"));

  v71 = objc_msgSend_rosterServiceAuthenticationState(self, v69, v70);
  NSStringFromCLSAuthenticationState(v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, CFSTR("rosterServiceAuthenticationState"));

  v77 = objc_msgSend_handoutServiceAuthenticationState(self, v75, v76);
  NSStringFromCLSAuthenticationState(v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, CFSTR("handoutServiceAuthenticationState"));

  v83 = objc_msgSend_iCloudDriveAuthenticationState(self, v81, v82);
  NSStringFromCLSAuthenticationState(v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, CFSTR("iCloudDriveAuthenticationState"));

  objc_msgSend_schoolworkUbiquitousContainerURL(self, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, CFSTR("schoolworkUbiquitousContainerURL"));

  objc_msgSend_schoolworkUbiquitousContainerError(self, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v97, (uint64_t)v96, CFSTR("schoolworkUbiquitousContainerError"));

  objc_msgSend_orgAdminUserRecordID(self, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v104, (uint64_t)v103, CFSTR("orgAdminUserRecordID"));

  objc_msgSend_orgAdminUserFetchError(self, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v108, (uint64_t)v107, CFSTR("orgAdminUserFetchError"));

  objc_msgSend_userRecordID(self, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v115, (uint64_t)v114, CFSTR("userRecordID"));

  objc_msgSend_userFetchError(self, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v119, (uint64_t)v118, CFSTR("userFetchError"));

  objc_msgSend_multimediaCacheDirectoryURL(self, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v126, (uint64_t)v125, CFSTR("multimediaCacheDirectoryURL"));

  objc_msgSend_multimediaCacheDirectoryURLError(self, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v130, (uint64_t)v129, CFSTR("multimediaCacheDirectoryURLError"));

  if (objc_msgSend_allowSharingOutsideOrg(self, v131, v132))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, (uint64_t)CFSTR("YES"), CFSTR("allowSharingOutsideOrg"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, (uint64_t)CFSTR("NO"), CFSTR("allowSharingOutsideOrg"));
  if (objc_msgSend_classroomClassicAdHocModeEnabled(self, v134, v135))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v136, (uint64_t)CFSTR("YES"), CFSTR("classroomClassicAdHocModeEnabled"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v136, (uint64_t)CFSTR("NO"), CFSTR("classroomClassicAdHocModeEnabled"));
  return v3;
}

- (int)devMode
{
  return self->_devMode;
}

- (void)setDevMode:(int)a3
{
  self->_devMode = a3;
}

- (CLSPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)accountPersonaUniqueIdentifier
{
  return self->_accountPersonaUniqueIdentifier;
}

- (void)setAccountPersonaUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clientPersonaUniqueIdentifier
{
  return self->_clientPersonaUniqueIdentifier;
}

- (void)setClientPersonaUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)hasDataSeparatedAccount
{
  return self->_hasDataSeparatedAccount;
}

- (void)setHasDataSeparatedAccount:(BOOL)a3
{
  self->_hasDataSeparatedAccount = a3;
}

- (BOOL)requiresPersonaMatch
{
  return self->_requiresPersonaMatch;
}

- (void)setRequiresPersonaMatch:(BOOL)a3
{
  self->_requiresPersonaMatch = a3;
}

- (BOOL)hasMatchingPersona
{
  return self->_hasMatchingPersona;
}

- (void)setHasMatchingPersona:(BOOL)a3
{
  self->_hasMatchingPersona = a3;
}

- (BOOL)hasManagedAccount
{
  return self->_hasManagedAccount;
}

- (void)setHasManagedAccount:(BOOL)a3
{
  self->_hasManagedAccount = a3;
}

- (BOOL)hasEDUAccount
{
  return self->_hasEDUAccount;
}

- (void)setHasEDUAccount:(BOOL)a3
{
  self->_hasEDUAccount = a3;
}

- (BOOL)hasUbiquityEnabled
{
  return self->_hasUbiquityEnabled;
}

- (void)setHasUbiquityEnabled:(BOOL)a3
{
  self->_hasUbiquityEnabled = a3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)organizationProgressTrackingAllowed
{
  return self->_organizationProgressTrackingAllowed;
}

- (void)setOrganizationProgressTrackingAllowed:(BOOL)a3
{
  self->_organizationProgressTrackingAllowed = a3;
}

- (BOOL)organizationMaidAnalyticsEnabled
{
  return self->_organizationMaidAnalyticsEnabled;
}

- (void)setOrganizationMaidAnalyticsEnabled:(BOOL)a3
{
  self->_organizationMaidAnalyticsEnabled = a3;
}

- (BOOL)personMaidAnalyticsEnabled
{
  return self->_personMaidAnalyticsEnabled;
}

- (void)setPersonMaidAnalyticsEnabled:(BOOL)a3
{
  self->_personMaidAnalyticsEnabled = a3;
}

- (BOOL)allowSharingOutsideOrg
{
  return self->_allowSharingOutsideOrg;
}

- (void)setAllowSharingOutsideOrg:(BOOL)a3
{
  self->_allowSharingOutsideOrg = a3;
}

- (BOOL)classroomClassicAdHocModeEnabled
{
  return self->_classroomClassicAdHocModeEnabled;
}

- (void)setClassroomClassicAdHocModeEnabled:(BOOL)a3
{
  self->_classroomClassicAdHocModeEnabled = a3;
}

- (int64_t)catalogEnvironment
{
  return self->_catalogEnvironment;
}

- (void)setCatalogEnvironment:(int64_t)a3
{
  self->_catalogEnvironment = a3;
}

- (int)rosterServiceAuthenticationState
{
  return self->_rosterServiceAuthenticationState;
}

- (void)setRosterServiceAuthenticationState:(int)a3
{
  self->_rosterServiceAuthenticationState = a3;
}

- (int)handoutServiceAuthenticationState
{
  return self->_handoutServiceAuthenticationState;
}

- (void)setHandoutServiceAuthenticationState:(int)a3
{
  self->_handoutServiceAuthenticationState = a3;
}

- (int)iCloudDriveAuthenticationState
{
  return self->_iCloudDriveAuthenticationState;
}

- (void)setICloudDriveAuthenticationState:(int)a3
{
  self->_iCloudDriveAuthenticationState = a3;
}

- (NSURL)schoolworkUbiquitousContainerURL
{
  return self->_schoolworkUbiquitousContainerURL;
}

- (void)setSchoolworkUbiquitousContainerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSError)schoolworkUbiquitousContainerError
{
  return self->_schoolworkUbiquitousContainerError;
}

- (void)setSchoolworkUbiquitousContainerError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CKRecordID)orgAdminUserRecordID
{
  return self->_orgAdminUserRecordID;
}

- (void)setOrgAdminUserRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_orgAdminUserRecordID, a3);
}

- (NSError)orgAdminUserFetchError
{
  return self->_orgAdminUserFetchError;
}

- (void)setOrgAdminUserFetchError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (void)setUserRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_userRecordID, a3);
}

- (NSError)userFetchError
{
  return self->_userFetchError;
}

- (void)setUserFetchError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)multimediaCacheDirectoryURL
{
  return self->_multimediaCacheDirectoryURL;
}

- (void)setMultimediaCacheDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSError)multimediaCacheDirectoryURLError
{
  return self->_multimediaCacheDirectoryURLError;
}

- (void)setMultimediaCacheDirectoryURLError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)roles
{
  return self->_roles;
}

- (void)setRoles:(unint64_t)a3
{
  self->_roles = a3;
}

- (NSDictionary)locationIDsByAXMRoleType
{
  return self->_locationIDsByAXMRoleType;
}

- (void)setLocationIDsByAXMRoleType:(id)a3
{
  objc_storeStrong((id *)&self->_locationIDsByAXMRoleType, a3);
}

- (NSData)schoolworkUbiquitousContainerURLSandboxExtension
{
  return self->_schoolworkUbiquitousContainerURLSandboxExtension;
}

- (void)setSchoolworkUbiquitousContainerURLSandboxExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)multimediaCacheDirectoryURLSandboxExtension
{
  return self->_multimediaCacheDirectoryURLSandboxExtension;
}

- (void)setMultimediaCacheDirectoryURLSandboxExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_locationIDsByAXMRoleType, 0);
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURLError, 0);
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_userFetchError, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_orgAdminUserFetchError, 0);
  objc_storeStrong((id *)&self->_orgAdminUserRecordID, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerError, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerURL, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_clientPersonaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accountPersonaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end

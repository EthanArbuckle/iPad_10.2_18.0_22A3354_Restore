@implementation MCEDUClassroomPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.education");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("EDU_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("EDU_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEDUClassroomPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCEDUClassroomPayload *v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  MCEDUClassroomPayload *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  MCEDUClassroomPayload *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  objc_super v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCEDUClassroomPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v39, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v11 = (void *)getCRKEDUPayloadClass_softClass;
    v43 = getCRKEDUPayloadClass_softClass;
    if (!getCRKEDUPayloadClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCRKEDUPayloadClass_block_invoke;
      v45 = &unk_1E41E35E0;
      v46 = &v40;
      __getCRKEDUPayloadClass_block_invoke((uint64_t)buf);
      v11 = (void *)v41[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v40, 8);
    if (v12)
    {
      v20 = [v12 alloc];
      -[MCPayload profile](v10, "profile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v22 = (void *)objc_msgSend(v20, "initWithDictionary:isStub:error:", v8, objc_msgSend(v21, "isStub"), &v38);
      v23 = (MCEDUClassroomPayload *)v38;

      objc_storeStrong((id *)&v10->_crk_payload, v22);
      if (v23)
      {
        -[MCEDUClassroomPayload translatedCRKError:](v10, "translatedCRKError:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (a5 && v24)
          *a5 = objc_retainAutorelease(v25);
        v27 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v28 = v27;
          v29 = (void *)objc_opt_class();
          v37 = v29;
          objc_msgSend(v26, "MCVerboseDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v30;
          _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse the payload: %{public}@", buf, 0x16u);

        }
        v31 = 0;
      }
      else
      {
        v31 = v10;
      }
      if (objc_msgSend(v8, "count"))
      {
        v33 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v34 = v33;
          -[MCPayload friendlyName](v31, "friendlyName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

        }
      }
      v10 = v23;
    }
    else
    {
      if (!a5)
      {
        v31 = 0;
        goto LABEL_21;
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("EDU_COULD_NOT_INSTALL"), v13, v14, v15, v16, v17, v18, v19, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2005, v22, CFSTR("MCFatalError"));
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    goto LABEL_22;
  }
  v31 = 0;
LABEL_22:

  return v31;
}

- (NSDictionary)configuration
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)verboseDescription
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)MCEDUClassroomPayload;
  -[MCPayload verboseDescription](&v50, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "organizationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("OrganizationUUID : %@\n"), v8);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "organizationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("OrganizationName : %@\n"), v12);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("UserIdentifier   : %@\n"), v16);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "departments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "departments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Departments      : %@\n"), v20);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "groups");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "groups");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Groups           : %@\n"), v24);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "users");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "users");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Users            : %@\n"), v28);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deviceGroups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "deviceGroups");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Device Groups    : %@\n"), v32);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "payloadCertificateUUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "payloadCertificateUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Identity          : %@\n"), v36);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leaderPayloadCertificateAnchorUUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leaderPayloadCertificateAnchorUUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Leader Anchors    : %@\n"), v40);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "memberPayloadCertificateAnchorUUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "memberPayloadCertificateAnchorUUID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Member Anchors    : %@\n"), v44);

  }
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "resourcePayloadCertificateUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "resourcePayloadCertificateUUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Resource Identity : %@\n"), v48);

  }
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCEDUClassroomPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCEDUClassroomPayload configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "organizationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MCLocalizedString(CFSTR("EDU_UNKNOWN_ORGANIZATION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  id obj;
  void *v69;
  MCEDUClassroomPayload *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v67 = (id)objc_opt_new();
  v70 = self;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "departments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "departments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v84 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          v87 = 0;
          v88 = &v87;
          v89 = 0x2020000000;
          v13 = (_QWORD *)getkCRKEDUDepartmentNameKeySymbolLoc_ptr;
          v90 = getkCRKEDUDepartmentNameKeySymbolLoc_ptr;
          if (!getkCRKEDUDepartmentNameKeySymbolLoc_ptr)
          {
            v14 = (void *)ClassroomKitLibrary();
            v13 = dlsym(v14, "kCRKEDUDepartmentNameKey");
            v88[3] = (uint64_t)v13;
            getkCRKEDUDepartmentNameKeySymbolLoc_ptr = (uint64_t)v13;
          }
          _Block_object_dispose(&v87, 8);
          if (!v13)
            -[MCEDUClassroomPayload payloadDescriptionKeyValueSections].cold.2();
          objc_msgSend(v12, "objectForKeyedSubscript:", *v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v9);
    }

    MCLocalizedString(CFSTR("EDU_DEPARTMENTS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v6, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v17);

  }
  -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "groups");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = (void *)objc_opt_new();
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "groups");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v80 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          getkCRKEDUDeviceGroupNameKey();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v29);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
      }
      while (v24);
    }

    MCLocalizedString(CFSTR("EDU_GROUPS"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v21, v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v31);

  }
  -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "users");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    v69 = (void *)objc_opt_new();
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "users");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
    if (!v36)
      goto LABEL_38;
    v37 = *(_QWORD *)v76;
    while (1)
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v76 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
        getkCRKEDUUserIdentifierKey();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "userIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "userIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", v41);

          if (!v46)
            goto LABEL_36;
        }
        else
        {

        }
        v87 = 0;
        v88 = &v87;
        v89 = 0x2020000000;
        v47 = (_QWORD *)getkCRKEDUUserNameKeySymbolLoc_ptr;
        v90 = getkCRKEDUUserNameKeySymbolLoc_ptr;
        if (!getkCRKEDUUserNameKeySymbolLoc_ptr)
        {
          v48 = (void *)ClassroomKitLibrary();
          v47 = dlsym(v48, "kCRKEDUUserNameKey");
          v88[3] = (uint64_t)v47;
          getkCRKEDUUserNameKeySymbolLoc_ptr = (uint64_t)v47;
        }
        _Block_object_dispose(&v87, 8);
        if (!v47)
          -[MCEDUClassroomPayload payloadDescriptionKeyValueSections].cold.1();
        objc_msgSend(v39, "objectForKeyedSubscript:", *v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v49);

LABEL_36:
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      if (!v36)
      {
LABEL_38:

        MCLocalizedString(CFSTR("EDU_USERS"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v69, v50, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v51);

        break;
      }
    }
  }
  -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "deviceGroups");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  if (v54)
  {
    v55 = (void *)objc_opt_new();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[MCEDUClassroomPayload crk_payload](v70, "crk_payload");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "deviceGroups");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v58; ++m)
        {
          if (*(_QWORD *)v72 != v59)
            objc_enumerationMutation(v57);
          v61 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
          getkCRKEDUDeviceGroupNameKey();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v63);

        }
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
      }
      while (v58);
    }

    MCLocalizedString(CFSTR("EDU_DEVICE_GROUPS"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v55, v64, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v65);

  }
  if (!objc_msgSend(v67, "count"))
  {

    v67 = 0;
  }
  return v67;
}

- (id)translatedCRKError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __CFString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  void *v90;
  void *v91;
  _QWORD *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  char v115;
  void *v116;
  char v117;
  void *v118;
  int v119;
  void *v120;
  int v121;
  void *v123;
  _BYTE buf[24];
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getCRKEDUProfileErrorDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
    {
      v8 = objc_msgSend(v4, "code");
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("MCProfileErrorDomain");
      switch(v8)
      {
        case 0:
          if (!v9)
            goto LABEL_49;
          getCRKEDUProfileErrorFieldKey();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          getCRKEDUProfileErrorValueKey();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_71;
          getkCRKEDUSingleUserIdentifierKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "isEqualToString:", v15);

          v24 = 0;
          if (!v16 || !v14)
            goto LABEL_72;
          MCErrorArray(CFSTR("EDU_USER_IDENTIFIER_NOT_FOUND_P_IDENTIFIER"), v17, v18, v19, v20, v21, v22, v23, v14);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_70;
        case 1:
          v44 = CFSTR("MCPayloadErrorDomain");

          if (v9)
          {
            getCRKEDUProfileErrorFieldKey();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            if (v81)
            {
              MCErrorArray(CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), v82, v83, v84, v85, v86, v87, v88, v81);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }
          v113 = 2002;
          goto LABEL_62;
        case 2:
          v44 = CFSTR("MCPayloadErrorDomain");

          if (v9)
          {
            getCRKEDUProfileErrorFieldKey();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), v47, v48, v49, v50, v51, v52, v53, v46);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }
          v113 = 2003;
          goto LABEL_62;
        case 3:
          if (!v9)
          {
            v24 = 0;
            goto LABEL_78;
          }
          getCRKEDUProfileErrorFieldKey();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          getCRKEDUProfileErrorValueKey();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "description");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 0;
          if (!v55 || !v57)
            goto LABEL_77;
          getkCRKEDUGroupBeaconIDKey();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v55, "isEqualToString:", v60);

          if ((v61 & 1) != 0)
          {
            v69 = CFSTR("EDU_GROUP_BEACON_INVALID_P_BEACONID");
LABEL_76:
            MCErrorArray(v69, v62, v63, v64, v65, v66, v67, v68, v59);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_77;
          }
          getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey();
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v55, "isEqualToString:", v116);

          if ((v117 & 1) != 0)
          {
            v69 = CFSTR("EDU_LEADER_CERTIFICATE_ANCHOR_UUID_INVALID_P_UUID");
            goto LABEL_76;
          }
          getkCRKEDUPayloadMemberCertificateAnchorUUIDKey();
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = objc_msgSend(v55, "isEqualToString:", v120);

          if (v121)
          {
            v69 = CFSTR("EDU_MEMBER_CERTIFICATE_ANCHOR_UUID_INVALID_P_UUID");
            goto LABEL_76;
          }
          v24 = 0;
LABEL_77:

LABEL_78:
          v113 = 1010;
LABEL_79:
          objc_msgSend(MEMORY[0x1E0CB35C8], "MCErrorWithDomain:code:descriptionArray:errorType:", v10, v113, v24, CFSTR("MCFatalError"));
          v26 = (id)objc_claimAutoreleasedReturnValue();

          break;
        case 4:
          if (!v9)
          {
LABEL_49:
            v24 = 0;
            goto LABEL_73;
          }
          getCRKEDUProfileErrorFieldKey();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          getCRKEDUProfileErrorValueKey();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 0;
          if (!v12 || !v14)
            goto LABEL_72;
          getkCRKEDUGroupBeaconIDKey();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v12, "isEqualToString:", v34);

          if ((v35 & 1) != 0)
          {
            v43 = CFSTR("EDU_GROUP_BEACON_NOT_UNIQUE_P_BEACONID");
          }
          else
          {
            getkCRKEDUUserIdentifierKey();
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v12, "isEqualToString:", v114);

            if ((v115 & 1) != 0)
            {
              v43 = CFSTR("EDU_USER_IDENTIFIER_NOT_UNIQUE_P_IDENTIFIER");
            }
            else
            {
              getkCRKEDUDeviceGroupNameKey();
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = objc_msgSend(v12, "isEqualToString:", v118);

              if (!v119)
              {
LABEL_71:
                v24 = 0;
                goto LABEL_72;
              }
              v43 = CFSTR("EDU_DEVICE_GROUP_NAME_NOT_UNIQUE_P_NAME");
            }
          }
          MCErrorArray(v43, v36, v37, v38, v39, v40, v41, v42, v14);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_70:
          v24 = (void *)v25;
LABEL_72:

LABEL_73:
          v113 = 1000;
          goto LABEL_79;
        case 5:
          v44 = CFSTR("MCPayloadErrorDomain");

          if (!v9)
            goto LABEL_47;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v89 = (_QWORD *)getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr;
          v125 = getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr;
          if (!getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr)
          {
            v90 = (void *)ClassroomKitLibrary();
            v89 = dlsym(v90, "CRKEDUProfileErrorProvidedKeysKey");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v89;
            getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr = (uint64_t)v89;
          }
          _Block_object_dispose(buf, 8);
          if (!v89)
            -[MCEDUClassroomPayload translatedCRKError:].cold.1();
          objc_msgSend(v9, "objectForKeyedSubscript:", *v89);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v92 = (_QWORD *)getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr;
          v125 = getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr;
          if (!getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr)
          {
            v93 = (void *)ClassroomKitLibrary();
            v92 = dlsym(v93, "CRKEDUProfileErrorAllOrNoneKeysKey");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v92;
            getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr = (uint64_t)v92;
          }
          _Block_object_dispose(buf, 8);
          if (!v92)
            -[MCEDUClassroomPayload translatedCRKError:].cold.2();
          objc_msgSend(v9, "objectForKeyedSubscript:", *v92);
          v94 = objc_claimAutoreleasedReturnValue();
          v95 = (void *)v94;
          v24 = 0;
          if (v91 && v94)
          {
            MCLocalizedString(CFSTR("WEB_FILTER_SEPARATOR"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "componentsJoinedByString:", v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "componentsJoinedByString:", v96);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            MCErrorArray(CFSTR("EDU_INVALID_COMBINATION_OF_KEYS_P_PROVIDED_KEYS_P_EXPECTED_KEYS"), v98, v99, v100, v101, v102, v103, v104, v97);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_52;
        case 6:
          v44 = CFSTR("MCPayloadErrorDomain");

          if (!v9)
            goto LABEL_47;
          getCRKEDUProfileErrorTopLevelUserIdentifierKey();
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v105);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v71)
            goto LABEL_50;
          MCErrorArray(CFSTR("EDU_TOP_USER_NOT_LEADER_OR_MEMBER_P_IDENTIFIER"), v106, v107, v108, v109, v110, v111, v112, v71);
          v79 = objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        case 7:
          v44 = CFSTR("MCPayloadErrorDomain");

          if (v9)
          {
            getCRKEDUProfileErrorTopLevelUserIdentifierKey();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              MCErrorArray(CFSTR("EDU_TOP_USER_IS_LEADER_AND_MEMBER_P_IDENTIFIER"), v72, v73, v74, v75, v76, v77, v78, v71);
              v79 = objc_claimAutoreleasedReturnValue();
LABEL_46:
              v24 = (void *)v79;
            }
            else
            {
LABEL_50:
              v24 = 0;
            }

          }
          else
          {
LABEL_47:
            v24 = 0;
          }
LABEL_52:
          v113 = 2000;
LABEL_62:
          v10 = v44;
          goto LABEL_79;
        default:
          v24 = 0;
          v113 = 0;
          goto LABEL_79;
      }
    }
    else
    {
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        v28 = v27;
        v29 = objc_opt_class();
        objc_msgSend(v4, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        getCRKEDUProfileErrorDomain();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2114;
        v125 = (uint64_t)v31;
        _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ was given error domain to translate: %{public}@, expected: %{public}@, not translating error.", buf, 0x20u);

      }
      v26 = v4;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSString)payloadCertificateUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadCertificateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setPayloadCertificateUUID:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadCertificateUUID:", v5);

}

- (NSData)payloadCertificatePersistentID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadCertificatePersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setPayloadCertificatePersistentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPayloadCertificatePersistentID:", v4);

}

- (NSArray)leaderPayloadCertificateAnchorUUID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaderPayloadCertificateAnchorUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeaderPayloadCertificateAnchorUUID:", v4);

}

- (NSArray)leaderPayloadCertificateAnchorPersistentID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaderPayloadCertificateAnchorPersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeaderPayloadCertificateAnchorPersistentID:", v4);

}

- (NSArray)memberPayloadCertificateAnchorUUID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memberPayloadCertificateAnchorUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setMemberPayloadCertificateAnchorUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMemberPayloadCertificateAnchorUUID:", v4);

}

- (NSArray)memberPayloadCertificateAnchorPersistentID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memberPayloadCertificateAnchorPersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMemberPayloadCertificateAnchorPersistentID:", v4);

}

- (NSString)resourcePayloadCertificateUUID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePayloadCertificateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setResourcePayloadCertificateUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourcePayloadCertificateUUID:", v4);

}

- (NSData)resourcePayloadCertificatePersistentID
{
  void *v2;
  void *v3;

  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePayloadCertificatePersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setResourcePayloadCertificatePersistentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCEDUClassroomPayload crk_payload](self, "crk_payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourcePayloadCertificatePersistentID:", v4);

}

- (CRKEDUPayload)crk_payload
{
  return self->_crk_payload;
}

- (void)setCrk_payload:(id)a3
{
  objc_storeStrong((id *)&self->_crk_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crk_payload, 0);
}

- (void)payloadDescriptionKeyValueSections
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCRKEDUDepartmentNameKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MCEDUClassroomPayload.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

- (void)translatedCRKError:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCRKEDUProfileErrorProvidedKeysKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MCEDUClassroomPayload.m"), 33, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

- (void)translatedCRKError:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCRKEDUProfileErrorAllOrNoneKeysKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MCEDUClassroomPayload.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

@end

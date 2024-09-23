@implementation MCExtensibleSingleSignOnPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.extensiblesso");
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

  return MCLocalizedFormat(CFSTR("EXTENSIBLE_SSO_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("EXTENSIBLE_SSO_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCExtensibleSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCExtensibleSingleSignOnPayload *v9;
  uint64_t v10;
  id v11;
  NSString *esso_type;
  void *v13;
  NSString *v14;
  uint64_t v15;
  NSString *esso_realm;
  uint64_t v17;
  NSString *esso_extensionIdentifier;
  uint64_t v19;
  NSString *esso_teamIdentifier;
  uint64_t v21;
  NSDictionary *esso_extensionData;
  NSString *esso_screenLockedBehavior;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  NSString *v36;
  uint64_t v37;
  NSArray *esso_deniedBundleIdentifiers;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSArray *esso_hosts;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  NSArray *esso_URLs;
  void *v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  NSArray *v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  _BOOL4 v102;
  void *v103;
  NSArray *v104;
  void *v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
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
  objc_super v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  id v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _QWORD v134[2];
  _QWORD v135[5];

  v135[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v127.receiver = self;
  v127.super_class = (Class)MCExtensibleSingleSignOnPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v127, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_19;
  v126 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Type"), 1, &v126);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v126;
  esso_type = v9->_esso_type;
  v9->_esso_type = (NSString *)v10;

  if (v11)
    goto LABEL_10;
  v135[0] = CFSTR("Credential");
  v135[1] = CFSTR("Redirect");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9->_esso_type;
  v125 = 0;
  +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v14, v13, CFSTR("Type"), &v125);
  v11 = v125;

  if (v11)
    goto LABEL_10;
  if (-[NSString isEqualToString:](v9->_esso_type, "isEqualToString:", CFSTR("Credential")))
  {
    v124 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Realm"), 0, &v124);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = v124;
    esso_realm = v9->_esso_realm;
    v9->_esso_realm = (NSString *)v15;

    if (v11)
      goto LABEL_10;
  }
  v123 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ExtensionIdentifier"), 1, &v123);
  v17 = objc_claimAutoreleasedReturnValue();
  v11 = v123;
  esso_extensionIdentifier = v9->_esso_extensionIdentifier;
  v9->_esso_extensionIdentifier = (NSString *)v17;

  if (v11)
    goto LABEL_10;
  v122 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TeamIdentifier"), 0, &v122);
  v19 = objc_claimAutoreleasedReturnValue();
  v11 = v122;
  esso_teamIdentifier = v9->_esso_teamIdentifier;
  v9->_esso_teamIdentifier = (NSString *)v19;

  if (v11)
    goto LABEL_10;
  v121 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ExtensionData"), 0, &v121);
  v21 = objc_claimAutoreleasedReturnValue();
  v11 = v121;
  esso_extensionData = v9->_esso_extensionData;
  v9->_esso_extensionData = (NSDictionary *)v21;

  if (v11)
    goto LABEL_10;
  v120 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ScreenLockedBehavior"), 0, &v120);
  v101 = objc_claimAutoreleasedReturnValue();
  v11 = v120;
  esso_screenLockedBehavior = v9->_esso_screenLockedBehavior;
  v9->_esso_screenLockedBehavior = (NSString *)v101;

  if (v11)
    goto LABEL_10;
  if (v9->_esso_screenLockedBehavior)
  {
    v134[0] = CFSTR("Cancel");
    v134[1] = CFSTR("DoNotHandle");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9->_esso_screenLockedBehavior;
    v119 = 0;
    +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v36, v35, CFSTR("ScreenLockedBehavior"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v119);
    v11 = v119;

    if (v11)
      goto LABEL_10;
  }
  v118 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("DeniedBundleIdentifiers"), 0, 0, &v118);
  v37 = objc_claimAutoreleasedReturnValue();
  v11 = v118;
  esso_deniedBundleIdentifiers = v9->_esso_deniedBundleIdentifiers;
  v9->_esso_deniedBundleIdentifiers = (NSArray *)v37;

  if (v11)
    goto LABEL_10;
  if (-[NSString isEqualToString:](v9->_esso_type, "isEqualToString:", CFSTR("Credential")))
  {
    v117 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("Hosts"), 1, 0, &v117);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v117;
    if (v40)
    {
LABEL_42:
      v11 = v40;
LABEL_43:

      goto LABEL_10;
    }
    if (!objc_msgSend(v39, "count"))
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD"), v41, v42, v43, v44, v45, v46, v47, CFSTR("Hosts"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v52, 0, CFSTR("MCFatalError"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v39, "count"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
    v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    obj = v39;
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
    v11 = 0;
    if (v96)
    {
      v95 = *(_QWORD *)v114;
LABEL_28:
      v48 = 0;
      v49 = v11;
      while (1)
      {
        if (*(_QWORD *)v114 != v95)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v48);
        v112 = v49;
        v102 = -[MCExtensibleSingleSignOnPayload _validateHost:outError:](v9, "_validateHost:outError:", v50, &v112);
        v11 = v112;

        if (!v102)
          break;
        objc_msgSend(v50, "lowercaseString");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v99, "containsObject:"))
        {
          v53 = (void *)MEMORY[0x1E0CB35C8];
          -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](v9, "esso_extensionIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          MCErrorArray(CFSTR("EXTENSIBLE_SSO_INTRA_HOST_CONFLICT_P_EXTENSION_ID_P_HOST"), v55, v56, v57, v58, v59, v60, v61, v54);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCExtensibleSingleSignOnErrorDomain"), 54006, v62, CFSTR("MCFatalError"));
          v63 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v63;
          break;
        }
        objc_msgSend(v99, "addObject:", v103);
        -[NSArray addObject:](v97, "addObject:", v50);

        ++v48;
        v49 = v11;
        if (v96 == v48)
        {
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
          if (v96)
            goto LABEL_28;
          break;
        }
      }
    }

    esso_hosts = v9->_esso_hosts;
    v9->_esso_hosts = v97;

    if (v11)
    {
LABEL_10:
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (a5)
        *a5 = objc_retainAutorelease(v24);
      v26 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        v28 = (void *)objc_opt_class();
        v29 = v28;
        objc_msgSend(v25, "MCVerboseDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v129 = v28;
        v130 = 2114;
        v131 = v30;
        _os_log_impl(&dword_19ECC4000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
      goto LABEL_15;
    }
  }
  if (!-[NSString isEqualToString:](v9->_esso_type, "isEqualToString:", CFSTR("Redirect")))
  {
    v11 = 0;
    goto LABEL_15;
  }
  v111 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("URLs"), 1, 0, &v111);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v111;
  if (v40)
    goto LABEL_42;
  if (!objc_msgSend(v39, "count"))
  {
    v79 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD"), v65, v66, v67, v68, v69, v70, v71, CFSTR("URLs"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v80, 0, CFSTR("MCFatalError"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v39, "count"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  v104 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v98 = v39;
  v72 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
  if (!v72)
  {
    v11 = 0;
    goto LABEL_62;
  }
  v73 = v72;
  v100 = *(_QWORD *)v108;
  while (2)
  {
    for (i = 0; i != v73; ++i)
    {
      if (*(_QWORD *)v108 != v100)
        objc_enumerationMutation(v98);
      v75 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
      v106 = 0;
      -[MCExtensibleSingleSignOnPayload _validateURLString:outError:](v9, "_validateURLString:outError:", v75, &v106);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v106;
      if (v77)
      {
        v11 = v77;
LABEL_61:

        goto LABEL_62;
      }
      objc_msgSend(v76, "normalizedURL");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v105, "containsObject:", v78))
      {
        v81 = (void *)MEMORY[0x1E0CB35C8];
        -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](v9, "esso_extensionIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "absoluteString");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        MCErrorArray(CFSTR("EXTENSIBLE_SSO_INTRA_URL_CONFLICT_P_EXTENSION_ID_P_URL"), v83, v84, v85, v86, v87, v88, v89, v82);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCExtensibleSingleSignOnErrorDomain"), 54004, v90, CFSTR("MCFatalError"));
        v91 = v78;
        v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_61;
      }
      objc_msgSend(v105, "addObject:", v78);
      -[NSArray addObject:](v104, "addObject:", v76);

    }
    v73 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
    v11 = 0;
    if (v73)
      continue;
    break;
  }
LABEL_62:

  esso_URLs = v9->_esso_URLs;
  v9->_esso_URLs = v104;

  if (v11)
    goto LABEL_10;
LABEL_15:
  if (objc_msgSend(v8, "count"))
  {
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v32 = v31;
      -[MCPayload friendlyName](v9, "friendlyName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v129 = v33;
      v130 = 2114;
      v131 = v8;
      _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_19:
  return v9;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)MCExtensibleSingleSignOnPayload;
  -[MCPayload verboseDescription](&v49, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Type        : %@\n"), v6);

  }
  -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Realm       : %@\n"), v8);

  }
  -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Extension ID: %@\n"), v10);

  }
  -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Team ID     : %@\n"), v12);

  }
  -[MCExtensibleSingleSignOnPayload esso_extensionData](self, "esso_extensionData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCExtensibleSingleSignOnPayload esso_extensionData](self, "esso_extensionData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Ext. Data   : [%ld entries]\n"), objc_msgSend(v14, "count"));

  }
  -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "appendString:", CFSTR("URLs        :\n"));
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v20), "absoluteString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("    %@\n"), v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v18);
    }

  }
  -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "appendString:", CFSTR("Hosts       :\n"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(v4, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v25);
    }

  }
  -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("ScreenLocked: %@\n"), v29);

  }
  -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v4, "appendString:", CFSTR("DenyBndlIds :\n"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v38;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(v4, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v35++));
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v33);
    }

  }
  return v4;
}

- (id)stubDictionary
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)MCExtensibleSingleSignOnPayload;
  -[MCPayload stubDictionary](&v33, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Type"));

  }
  -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Realm"));

  }
  -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ExtensionIdentifier"));

  }
  -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("TeamIdentifier"));

  }
  -[MCExtensibleSingleSignOnPayload esso_extensionData](self, "esso_extensionData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCExtensibleSingleSignOnPayload esso_extensionData](self, "esso_extensionData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ExtensionData"));

  }
  -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "absoluteString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("URLs"));
  }
  -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("Hosts"));

  }
  -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("ScreenLockedBehavior"));

  }
  -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("DeniedBundleIdentifiers"));

  }
  return v3;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  char v10;

  -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCContainingBundleIDForBundleID(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7 || (objc_msgSend(v5, "localizedName"), (v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.AppSSOKerberos.KerberosExtension"));

    if ((v10 & 1) != 0)
    {
      v8 = CFSTR("Kerberos");
    }
    else
    {
      -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  void *v13;
  MCKeyValue *v14;
  void *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  void *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  MCKeyValue *v24;
  void *v25;
  MCKeyValue *v26;
  void *v27;
  void *v28;
  MCKeyValue *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [MCKeyValue alloc];
    -[MCExtensibleSingleSignOnPayload esso_type](self, "esso_type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TYPE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v4, "addObject:", v9);
  }
  -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [MCKeyValue alloc];
    -[MCExtensibleSingleSignOnPayload esso_realm](self, "esso_realm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("REALM"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v12, v13);

    objc_msgSend(v4, "addObject:", v14);
  }
  -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [MCKeyValue alloc];
    -[MCExtensibleSingleSignOnPayload esso_extensionIdentifier](self, "esso_extensionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXTENSION_ID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v4, "addObject:", v19);
  }
  -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = [MCKeyValue alloc];
    -[MCExtensibleSingleSignOnPayload esso_teamIdentifier](self, "esso_teamIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TEAM_ID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v22, v23);

    objc_msgSend(v4, "addObject:", v24);
  }
  -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = [MCKeyValue alloc];
    -[MCExtensibleSingleSignOnPayload esso_screenLockedBehavior](self, "esso_screenLockedBehavior");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("SCREEN_LOCKED_BEHAVIOR"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MCKeyValue initWithLocalizedString:localizedKey:](v26, "initWithLocalizedString:localizedKey:", v27, v28);

    objc_msgSend(v4, "addObject:", v29);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[MCExtensibleSingleSignOnPayload esso_URLs](self, "esso_URLs", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v54;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v54 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v38), "absoluteString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v39);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v36);
    }

    MCLocalizedString(CFSTR("URLS"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v33, v40, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v41);
  }
  -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    -[MCExtensibleSingleSignOnPayload esso_hosts](self, "esso_hosts");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("HOSTS"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v44, v45, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v46);
  }
  -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");

  if (v48)
  {
    -[MCExtensibleSingleSignOnPayload esso_deniedBundleIdentifiers](self, "esso_deniedBundleIdentifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("DENIED_BUNDLE_IDENTIFIERS"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v49, v50, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v51);
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (BOOL)_validateHost:(id)a3 outError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v13 = objc_msgSend(v5, "length");
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("EXTENSIBLE_SSO_INVALID_HOST_P_HOST"), v6, v7, v8, v9, v10, v11, v12, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCExtensibleSingleSignOnErrorDomain"), 54001, v15, CFSTR("MCFatalError"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v16);

  }
  return v13 != 0;
}

- (id)_validateURLString:(id)a3 outError:(id *)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v6);
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("http"));
  if (v9)
  {
    objc_msgSend(v7, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https")))
      goto LABEL_7;
  }
  objc_msgSend(v7, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
LABEL_6:

    if (!v9)
    {
LABEL_8:

LABEL_9:
      v19 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("EXTENSIBLE_SSO_INVALID_URL_P_URL"), v12, v13, v14, v15, v16, v17, v18, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCExtensibleSingleSignOnErrorDomain"), 54000, v20, CFSTR("MCFatalError"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = objc_retainAutorelease(v21);

      v22 = 0;
      goto LABEL_12;
    }
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v7, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v7, "fragment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v9)
  if (v25)
    goto LABEL_9;
  objc_msgSend(v7, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_9;
LABEL_12:

  return v22;
}

- (NSString)esso_type
{
  return self->_esso_type;
}

- (void)setEsso_type:(id)a3
{
  objc_storeStrong((id *)&self->_esso_type, a3);
}

- (NSString)esso_realm
{
  return self->_esso_realm;
}

- (void)setEsso_realm:(id)a3
{
  objc_storeStrong((id *)&self->_esso_realm, a3);
}

- (NSString)esso_extensionIdentifier
{
  return self->_esso_extensionIdentifier;
}

- (void)setEsso_extensionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_esso_extensionIdentifier, a3);
}

- (NSString)esso_teamIdentifier
{
  return self->_esso_teamIdentifier;
}

- (void)setEsso_teamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_esso_teamIdentifier, a3);
}

- (NSDictionary)esso_extensionData
{
  return self->_esso_extensionData;
}

- (void)setEsso_extensionData:(id)a3
{
  objc_storeStrong((id *)&self->_esso_extensionData, a3);
}

- (NSArray)esso_URLs
{
  return self->_esso_URLs;
}

- (void)setEsso_URLs:(id)a3
{
  objc_storeStrong((id *)&self->_esso_URLs, a3);
}

- (NSArray)esso_hosts
{
  return self->_esso_hosts;
}

- (void)setEsso_hosts:(id)a3
{
  objc_storeStrong((id *)&self->_esso_hosts, a3);
}

- (NSString)esso_screenLockedBehavior
{
  return self->_esso_screenLockedBehavior;
}

- (void)setEsso_screenLockedBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_esso_screenLockedBehavior, a3);
}

- (NSArray)esso_deniedBundleIdentifiers
{
  return self->_esso_deniedBundleIdentifiers;
}

- (void)setEsso_deniedBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_esso_deniedBundleIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_esso_deniedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_esso_screenLockedBehavior, 0);
  objc_storeStrong((id *)&self->_esso_hosts, 0);
  objc_storeStrong((id *)&self->_esso_URLs, 0);
  objc_storeStrong((id *)&self->_esso_extensionData, 0);
  objc_storeStrong((id *)&self->_esso_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_esso_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_esso_realm, 0);
  objc_storeStrong((id *)&self->_esso_type, 0);
}

@end

@implementation MCNetworkUsageRulesPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.networkusagerules");
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

  return MCLocalizedFormat(CFSTR("NETWORK_USAGE_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("NETWORK_USAGE_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCNetworkUsageRulesPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCNetworkUsageRulesPayload *v9;
  uint64_t v10;
  id v11;
  NSArray *SIMRules;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  _BOOL8 v37;
  uint64_t v38;
  void *applicationRules;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  objc_super v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v67.receiver = self;
  v67.super_class = (Class)MCNetworkUsageRulesPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v67, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_48;
  v66 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SIMRules"), 0, &v66);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v66;
  SIMRules = v9->_SIMRules;
  v9->_SIMRules = (NSArray *)v10;

  if (v11)
    goto LABEL_39;
  v13 = v9->_SIMRules;
  if (!v13)
    goto LABEL_30;
  if (-[NSArray count](v13, "count"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v21 = v9->_SIMRules;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v63;
      v56 = v21;
      v53 = *(_QWORD *)v63;
      while (2)
      {
        v24 = 0;
        v54 = v22;
        do
        {
          if (*(_QWORD *)v63 != v23)
          {
            v25 = v24;
            objc_enumerationMutation(v21);
            v24 = v25;
          }
          v55 = v24;
          v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v24);
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ICCIDs"));
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_35;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v27, "count"))
            goto LABEL_35;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v27, "count"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v27 = v27;
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v59;
            v52 = v26;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v59 != v31)
                  objc_enumerationMutation(v27);
                v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v33, "length"))
                  goto LABEL_32;
                objc_msgSend(v33, "uppercaseString");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v28, "containsObject:", v34))
                {

LABEL_32:
                  v35 = v27;
                  goto LABEL_33;
                }
                objc_msgSend(v28, "addObject:", v34);

              }
              v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
              v26 = v52;
              if (v30)
                continue;
              break;
            }
          }

          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("WiFiAssistPolicy"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
          {
LABEL_33:
            v21 = v56;
LABEL_34:

LABEL_35:
LABEL_36:

            goto LABEL_37;
          }
          objc_opt_class();
          v21 = v56;
          if ((objc_opt_isKindOfClass() & 1) == 0 || (int)objc_msgSend(v35, "intValue") < 2)
            goto LABEL_34;
          v36 = objc_msgSend(v35, "intValue");

          if (v36 > 3)
            goto LABEL_36;
          v24 = v55 + 1;
          v23 = v53;
        }
        while (v55 + 1 != v54);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        if (v22)
          continue;
        break;
      }
    }

LABEL_30:
    v37 = v9->_SIMRules == 0;
    v57 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ApplicationRules"), v37, &v57);
    v38 = objc_claimAutoreleasedReturnValue();
    v11 = v57;
    applicationRules = v9->_applicationRules;
    v9->_applicationRules = (NSArray *)v38;
    goto LABEL_38;
  }
LABEL_37:
  v40 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD"), v14, v15, v16, v17, v18, v19, v20, CFSTR("SIMRules"));
  applicationRules = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, applicationRules, 0, CFSTR("MCFatalError"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  if (v11)
  {
LABEL_39:
    -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a5)
      *a5 = objc_retainAutorelease(v41);
    v43 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v44 = v43;
      v45 = (void *)objc_opt_class();
      v46 = v45;
      objc_msgSend(v42, "MCVerboseDescription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v45;
      v70 = 2114;
      v71 = v47;
      _os_log_impl(&dword_19ECC4000, v44, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v48 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v49 = v48;
      -[MCPayload friendlyName](v9, "friendlyName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v50;
      v70 = 2114;
      v71 = v8;
      _os_log_impl(&dword_19ECC4000, v49, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_48:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCNetworkUsageRulesPayload;
  -[MCPayload stubDictionary](&v9, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ApplicationRules"));

  }
  -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SIMRules"));

  }
  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCNetworkUsageRulesPayload;
  -[MCPayload verboseDescription](&v10, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Application Rules : %@\n"), v6);

  }
  -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("SIM Rules         : %@\n"), v8);

  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  MCKeyValue *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  MCKeyValue *v22;
  void *v23;
  void *v24;
  void *v25;
  MCKeyValue *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  MCKeyValue *v31;
  void *v32;
  void *v33;
  void *v34;
  MCKeyValue *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  MCKeyValue *v47;
  void *v48;
  MCKeyValue *v49;
  void *v50;
  void *v51;
  int v52;
  __CFString *v53;
  uint64_t v54;
  void *v55;
  MCKeyValue *v56;
  void *v57;
  void *v58;
  MCKeyValue *v59;
  void *v60;
  uint64_t v61;
  MCNetworkUsageRulesPayload *v63;
  id obj;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v69 = v3;
  if (v6)
  {
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v63 = self;
    -[MCNetworkUsageRulesPayload applicationRules](self, "applicationRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (v67)
    {
      v65 = *(id *)v89;
      do
      {
        v7 = 0;
        do
        {
          if (*(id *)v89 != v65)
            objc_enumerationMutation(obj);
          v70 = v7;
          v8 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v7);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppIdentifierMatches"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v8;
          if (objc_msgSend(v72, "count"))
          {
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v9 = v72;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v85;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v85 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "length"))
                  {
                    v15 = [MCKeyValue alloc];
                    MCLocalizedString(CFSTR("NETWORK_USAGE_APP_RULE"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = -[MCKeyValue initWithLocalizedString:localizedKey:](v15, "initWithLocalizedString:localizedKey:", v14, v16);

                    objc_msgSend(v4, "addObject:", v17);
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
              }
              while (v11);
            }

            v3 = v69;
            v8 = v74;
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AllowCellularData"));
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AllowCellularData"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v8 = v74;
            if ((isKindOfClass & 1) != 0)
            {
              v22 = [MCKeyValue alloc];
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("AllowCellularData"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              MCLocalizedStringForBool(objc_msgSend(v23, "BOOLValue"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              MCLocalizedString(CFSTR("NETWORK_USAGE_ALLOW_CELLULAR"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", v24, v25);

              v8 = v74;
              objc_msgSend(v4, "addObject:", v26);

            }
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AllowRoamingCellularData"));
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AllowRoamingCellularData"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v30 = objc_opt_isKindOfClass();

            if ((v30 & 1) != 0)
            {
              v31 = [MCKeyValue alloc];
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("AllowRoamingCellularData"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              MCLocalizedStringForBool(objc_msgSend(v32, "BOOLValue"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              MCLocalizedString(CFSTR("NETWORK_USAGE_ALLOW_ROAMING"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[MCKeyValue initWithLocalizedString:localizedKey:](v31, "initWithLocalizedString:localizedKey:", v33, v34);

              objc_msgSend(v4, "addObject:", v35);
            }
          }
          if (objc_msgSend(v4, "count"))
          {
            +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v36);

            v37 = objc_opt_new();
            v4 = (void *)v37;
          }

          v7 = v70 + 1;
        }
        while (v70 + 1 != v67);
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      }
      while (v67);
    }

    self = v63;
  }
  -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[MCNetworkUsageRulesPayload SIMRules](self, "SIMRules");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    if (!v71)
      goto LABEL_55;
    v68 = *(_QWORD *)v81;
    while (1)
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v81 != v68)
          objc_enumerationMutation(v66);
        v73 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v40);
        v75 = v40;
        objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ICCIDs"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v77;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v77 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
              v47 = [MCKeyValue alloc];
              MCLocalizedString(CFSTR("NETWORK_USAGE_ICCID"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = -[MCKeyValue initWithLocalizedString:localizedKey:](v47, "initWithLocalizedString:localizedKey:", v46, v48);

              objc_msgSend(v4, "addObject:", v49);
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          }
          while (v43);
        }
        objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("WiFiAssistPolicy"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
        {
          v52 = objc_msgSend(v50, "intValue");
          if (v52 == 3)
          {
            v53 = CFSTR("NETWORK_USAGE_UNLIMITED_CELLULAR_DATA");
LABEL_48:
            MCLocalizedString(v53);
            v54 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v52 == 2)
            {
              v53 = CFSTR("NETWORK_USAGE_DEFAULT_CELLULAR_DATA");
              goto LABEL_48;
            }
            MCFormattedStringForNumber(v51);
            v54 = objc_claimAutoreleasedReturnValue();
          }
          v55 = (void *)v54;
          v56 = [MCKeyValue alloc];
          objc_msgSend(CFSTR("NETWORK_USAGE_WIFI_ASSIST_POLICY"), "MCAppendGreenteaSuffix");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[MCKeyValue initWithLocalizedString:localizedKey:](v56, "initWithLocalizedString:localizedKey:", v55, v58);

          objc_msgSend(v4, "addObject:", v59);
        }
        if (objc_msgSend(v4, "count"))
        {
          +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v60);

          v61 = objc_opt_new();
          v4 = (void *)v61;
        }

        v40 = v75 + 1;
      }
      while (v75 + 1 != v71);
      v71 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
      if (!v71)
      {
LABEL_55:

        v3 = v69;
        break;
      }
    }
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  MCLocalizedString(CFSTR("INSTALL_WARNING_NETWORK_USAGE_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_NETWORK_USAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)applicationRules
{
  return self->_applicationRules;
}

- (void)setApplicationRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)SIMRules
{
  return self->_SIMRules;
}

- (void)setSIMRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMRules, 0);
  objc_storeStrong((id *)&self->_applicationRules, 0);
}

@end

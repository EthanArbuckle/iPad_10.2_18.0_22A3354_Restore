@implementation MCSingleAppPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.app.lock"));
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

  return MCLocalizedFormat(CFSTR("SINGLE_APP_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SINGLE_APP_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSingleAppPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSingleAppPayload *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  int v25;
  void *v26;
  id v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  objc_super v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MCSingleAppPayload;
  v10 = -[MCAppWhitelistPayloadBase initWithDictionary:profile:outError:](&v82, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_71;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v11 = 0;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("App"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v81);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v81;
  if (v14)
  {
    v11 = v14;

LABEL_62:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v11);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (a5)
      *a5 = objc_retainAutorelease(v44);
    v46 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v47 = v46;
      v48 = (void *)objc_opt_class();
      v49 = v48;
      objc_msgSend(v45, "MCVerboseDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v48;
      v85 = 2114;
      v86 = v50;
      _os_log_impl(&dword_19ECC4000, v47, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
    goto LABEL_67;
  }
  v80 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowLogout"), 0, &v80);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v80;
  if (!v11)
  {
    v10->_allowLogout = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v13, "objectForKey:", CFSTR("Identifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v16;
    if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Identifier"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

      goto LABEL_61;
    }
    v60 = v15;
    v62 = v12;
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v18;
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "appTags");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v20, "containsObject:", CFSTR("hidden"));

      objc_msgSend(v19, "bundleType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA57E8]);

      objc_msgSend(v19, "appState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isRestricted");

      v17 = v71;
      v25 = objc_msgSend(v19, "isLaunchProhibited");
      if ((v68 & 1) != 0 || (v22 & 1) != 0 || (v24 & 1) != 0 || v25)
      {
        +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("Identifier"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v62;
        v15 = v60;
LABEL_59:

        goto LABEL_60;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setObject:forKey:", v17, CFSTR("Identifier"));
    objc_msgSend(v13, "objectForKey:", CFSTR("Options"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v62;
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Options"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v60;
LABEL_58:

        goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v55 = v26;
      v27 = v26;
      v69 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      if (v69)
      {
        v66 = *(_QWORD *)v77;
        v65 = v13;
        while (2)
        {
          for (i = 0; i != v69; ++i)
          {
            if (*(_QWORD *)v77 != v66)
              objc_enumerationMutation(v27);
            v29 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v27, "objectForKey:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v29);
                v11 = (id)objc_claimAutoreleasedReturnValue();

                v12 = v62;
                v15 = v60;
                v26 = v55;
                goto LABEL_58;
              }
              v31 = v27;
              +[MCAppWhitelistPayloadBase knownOptionsKeys](MCSingleAppPayload, "knownOptionsKeys");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "containsObject:", v29);

              if (v33)
              {
                objc_msgSend(v63, "setObject:forKey:", v30, v29);
                v27 = v31;
                v13 = v65;
              }
              else
              {
                v34 = _MCLogObjects;
                v27 = v31;
                v13 = v65;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v84 = v29;
                  _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring unknown option: %{public}@", buf, 0xCu);
                }
              }
            }

          }
          v69 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          if (v69)
            continue;
          break;
        }
      }

      if (objc_msgSend(v63, "count"))
        objc_msgSend(v59, "setObject:forKey:", v63, CFSTR("Options"));

      v12 = v62;
      v26 = v55;
    }
    objc_msgSend(v13, "objectForKey:");
    v35 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v35;
    if (v35)
    {
      v36 = (void *)v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("UserEnabledOptions"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
        v15 = v60;
LABEL_57:

        goto LABEL_58;
      }
      v56 = v26;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v37 = v36;
      v70 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      if (v70)
      {
        v67 = *(_QWORD *)v73;
        v64 = v37;
        while (2)
        {
          for (j = 0; j != v70; ++j)
          {
            if (*(_QWORD *)v73 != v67)
              objc_enumerationMutation(v37);
            v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            objc_msgSend(v37, "objectForKey:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v39);
                v11 = (id)objc_claimAutoreleasedReturnValue();

                v12 = v62;
                v15 = v60;
                v26 = v56;
                goto LABEL_57;
              }
              +[MCAppWhitelistPayloadBase knownUserEnabledOptionKeys](MCSingleAppPayload, "knownUserEnabledOptionKeys");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "containsObject:", v39);

              if (v42)
              {
                objc_msgSend(v58, "setObject:forKey:", v40, v39);
                v37 = v64;
              }
              else
              {
                v43 = _MCLogObjects;
                v37 = v64;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v84 = v39;
                  _os_log_impl(&dword_19ECC4000, v43, OS_LOG_TYPE_DEFAULT, "Ignoring unknown option: %{public}@", buf, 0xCu);
                }
              }
            }

          }
          v70 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          if (v70)
            continue;
          break;
        }
      }

      if (objc_msgSend(v58, "count"))
        objc_msgSend(v59, "setObject:forKey:", v58, CFSTR("UserEnabledOptions"));

      v12 = v62;
      v26 = v56;
    }
    objc_msgSend(v12, "addObject:", v59);
    -[MCAppWhitelistPayloadBase setWhitelistedAppsAndOptions:](v10, "setWhitelistedAppsAndOptions:", v12);
    v11 = 0;
    goto LABEL_56;
  }
LABEL_61:

  if (v11)
    goto LABEL_62;
LABEL_67:
  if (objc_msgSend(v8, "count"))
  {
    v51 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v52 = v51;
      -[MCPayload friendlyName](v10, "friendlyName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v53;
      v85 = 2114;
      v86 = v8;
      _os_log_impl(&dword_19ECC4000, v52, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_71:
  return v10;
}

- (NSString)applicationBundleID
{
  void *v2;
  void *v3;
  void *v4;

  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)mustInstallNonInteractively
{
  return 1;
}

- (id)restrictions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MCSingleAppPayload;
  -[MCAppWhitelistPayloadBase restrictions](&v10, sel_restrictions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "MCMutableDeepCopy");

  v15[0] = CFSTR("allowMultipleAppsInAppLock");
  v13[0] = CFSTR("value");
  v13[1] = CFSTR("preference");
  v14[0] = MEMORY[0x1E0C9AAA0];
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("allowAppLockLogout");
  v11[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppPayload allowLogout](self, "allowLogout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("preference");
  v12[0] = v6;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("restrictedBool"));

  return v4;
}

- (id)subtitle1Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("SINGLE_APP_LABEL_COLON"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    goto LABEL_3;
  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("Identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_3:
    MCLocalizedFormat(CFSTR("SINGLE_APP_UNKNOWN"), v5, v6, v7, v8, v9, v10, v11, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (BOOL)allowLogout
{
  return self->_allowLogout;
}

@end

@implementation MCCellularPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.cellular");
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

  return MCLocalizedFormat(CFSTR("CELLULAR_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CELLULAR_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCellularPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCCellularPayload *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  MCAPNConfiguration *v23;
  id *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  MCAPNConfiguration *attachAPN;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  MCAPNConfiguration *v38;
  void *v39;
  MCAPNConfiguration *v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  id v52;
  objc_super v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v53.receiver = self;
  v53.super_class = (Class)MCCellularPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v53, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_13;
  v52 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AttachAPN"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v52;
  if (v11)
    goto LABEL_3;
  if (!v10)
    goto LABEL_16;
  v23 = [MCAPNConfiguration alloc];
  v24 = a5;
  v25 = (void *)objc_msgSend(v10, "mutableCopy");
  v51 = 0;
  v26 = v10;
  v27 = -[MCAPNConfiguration initWithDictionary:outError:](v23, "initWithDictionary:outError:", v25, &v51);
  v11 = v51;
  attachAPN = v9->_attachAPN;
  v9->_attachAPN = (MCAPNConfiguration *)v27;
  v10 = v26;

  a5 = v24;
  if (v11)
  {
LABEL_3:

  }
  else
  {
LABEL_16:
    v50 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("APNs"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v50;
    v31 = v30;
    if (v29)
    {
      v42 = v10;
      v43 = a5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v41 = v29;
      v32 = v29;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v47 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            v38 = [MCAPNConfiguration alloc];
            v39 = (void *)objc_msgSend(v37, "mutableCopy");
            v45 = v31;
            v40 = -[MCAPNConfiguration initWithDictionary:outError:](v38, "initWithDictionary:outError:", v39, &v45);
            v11 = v45;

            if (v11)
            {

              goto LABEL_31;
            }
            if (v40)
              objc_msgSend(v44, "addObject:", v40);

            v31 = 0;
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          v31 = 0;
          v11 = 0;
          if (v34)
            continue;
          break;
        }
      }
      else
      {
        v11 = v31;
      }
LABEL_31:

      if (objc_msgSend(v44, "count"))
        objc_storeStrong((id *)&v9->_APNs, v44);

      v10 = v42;
      a5 = v43;
      v29 = v41;
    }
    else
    {
      v11 = v30;
    }

    if (!v11)
      goto LABEL_9;
  }
  -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v12);
  v14 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v15 = v14;
    v16 = (void *)objc_opt_class();
    v17 = v16;
    objc_msgSend(v13, "MCVerboseDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    v56 = 2114;
    v57 = v18;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v9 = 0;
LABEL_9:
  if (objc_msgSend(v8, "count"))
  {
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      -[MCPayload friendlyName](v9, "friendlyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v21;
      v56 = 2114;
      v57 = v8;
      _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_13:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MCCellularPayload;
  -[MCPayload stubDictionary](&v23, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCCellularPayload attachAPN](self, "attachAPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCCellularPayload attachAPN](self, "attachAPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stubDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AttachAPN"));

  }
  -[MCCellularPayload APNs](self, "APNs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    -[MCCellularPayload APNs](self, "APNs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MCCellularPayload APNs](self, "APNs", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "stubDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("APNs"));
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
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)MCCellularPayload;
  -[MCPayload verboseDescription](&v20, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCCellularPayload attachAPN](self, "attachAPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Attach APN  :\n%@\n"), v6);

  }
  -[MCCellularPayload APNs](self, "APNs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[MCCellularPayload APNs](self, "APNs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%d APN configurations.\n"), objc_msgSend(v9, "count"));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MCCellularPayload APNs](self, "APNs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  void *v21;
  MCKeyValue *v22;
  void *v23;
  void *v24;
  MCKeyValue *v25;
  void *v26;
  MCKeyValue *v27;
  void *v28;
  void *v29;
  MCKeyValue *v30;
  void *v31;
  MCKeyValue *v32;
  void *v33;
  void *v34;
  MCKeyValue *v35;
  void *v36;
  MCKeyValue *v37;
  void *v38;
  void *v39;
  MCKeyValue *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MCKeyValue *v45;
  void *v46;
  MCKeyValue *v47;
  void *v48;
  MCKeyValue *v49;
  void *v50;
  void *v51;
  void *v52;
  MCKeyValue *v53;
  void *v54;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[MCCellularPayload APNs](self, "APNs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCCellularPayload attachAPN](self, "attachAPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  -[MCCellularPayload APNs](self, "APNs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v58;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v58 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = [MCKeyValue alloc];
          objc_msgSend(v14, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("CELLULAR_CONFIG_NAME"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v18, v19);

          objc_msgSend(v15, "addObject:", v20);
        }
        objc_msgSend(v14, "authenticationType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = [MCKeyValue alloc];
          objc_msgSend(v14, "localizedAuthenticationType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("AUTHENTICATION_TYPE"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", v23, v24);

          objc_msgSend(v15, "addObject:", v25);
        }
        objc_msgSend(v14, "username");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = [MCKeyValue alloc];
          objc_msgSend(v14, "username");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("USERNAME"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[MCKeyValue initWithLocalizedString:localizedKey:](v27, "initWithLocalizedString:localizedKey:", v28, v29);

          objc_msgSend(v15, "addObject:", v30);
        }
        objc_msgSend(v14, "password");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("PRESENT"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("PASSWORD"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[MCKeyValue initWithLocalizedString:localizedKey:](v32, "initWithLocalizedString:localizedKey:", v33, v34);

          objc_msgSend(v15, "addObject:", v35);
        }
        objc_msgSend(v14, "proxyServer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = [MCKeyValue alloc];
          objc_msgSend(v14, "proxyServer");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("PROXY"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[MCKeyValue initWithLocalizedString:localizedKey:](v37, "initWithLocalizedString:localizedKey:", v38, v39);

          objc_msgSend(v15, "addObject:", v40);
        }
        objc_msgSend(v14, "proxyPort");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v42 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v14, "proxyPort");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v43, "intValue"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("PORT"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = -[MCKeyValue initWithLocalizedString:localizedKey:](v45, "initWithLocalizedString:localizedKey:", v44, v46);

          objc_msgSend(v15, "addObject:", v47);
        }
        objc_msgSend(v14, "enableXLAT464");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          v49 = [MCKeyValue alloc];
          objc_msgSend(v14, "enableXLAT464");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedStringForBool(objc_msgSend(v50, "BOOLValue"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("CELLULAR_ENABLE_XLAT464"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = -[MCKeyValue initWithLocalizedString:localizedKey:](v49, "initWithLocalizedString:localizedKey:", v51, v52);

          objc_msgSend(v15, "addObject:", v53);
        }
        if (objc_msgSend(v15, "count"))
        {
          +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v15);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v54);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (id)attachAPNConfigurationLabel
{
  void *v2;
  void *v3;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    MCLocalizedString(CFSTR("ATTACH_APN_LABEL_COLON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)APNConfigurationDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCCellularPayload attachAPN](self, "attachAPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)APNsLabel
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  -[MCCellularPayload APNs](self, "APNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = CFSTR("APN_CONFIG_SINGULAR_COLON");
  }
  else
  {
    -[MCCellularPayload APNs](self, "APNs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 < 2)
    {
      v8 = 0;
      return v8;
    }
    v5 = CFSTR("APN_CONFIG_COUNT_PLURAL_COLON");
  }
  MCLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)APNsDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[MCCellularPayload APNs](self, "APNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[MCCellularPayload APNs](self, "APNs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(v5, "count");

    if (v9 < 2)
    {
      v12 = 0;
      return v12;
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[MCCellularPayload APNs](self, "APNs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;

  return v12;
}

- (id)subtitle1Label
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCCellularPayload attachAPNConfigurationLabel](self, "attachAPNConfigurationLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCCellularPayload APNs](self, "APNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MCCellularPayload APNsLabel](self, "APNsLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCCellularPayload APNConfigurationDescription](self, "APNConfigurationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCCellularPayload APNs](self, "APNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MCCellularPayload APNsDescription](self, "APNsDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCCellularPayload APNs](self, "APNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MCCellularPayload APNsLabel](self, "APNsLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)subtitle2Description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MCCellularPayload attachAPN](self, "attachAPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCCellularPayload APNs](self, "APNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MCCellularPayload APNsDescription](self, "APNsDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  MCLocalizedString(CFSTR("INSTALL_WARNING_CELLULAR_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_CELLULAR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MCAPNConfiguration)attachAPN
{
  return self->_attachAPN;
}

- (void)setAttachAPN:(id)a3
{
  objc_storeStrong((id *)&self->_attachAPN, a3);
}

- (NSArray)APNs
{
  return self->_APNs;
}

- (void)setAPNs:(id)a3
{
  objc_storeStrong((id *)&self->_APNs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APNs, 0);
  objc_storeStrong((id *)&self->_attachAPN, 0);
}

@end

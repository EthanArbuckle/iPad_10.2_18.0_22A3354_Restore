@implementation MCTVRemotePayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.tvremote");
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

  return MCLocalizedFormat(CFSTR("TVREMOTE_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("TVREMOTE_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCTVRemotePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCTVRemotePayload *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSArray *v23;
  void *v24;
  NSArray *v25;
  NSArray *allowedTVIDs;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id *v38;
  NSArray *obj;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MCTVRemotePayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v52, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_31;
  v51 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AllowedTVs"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v51);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v51;
  if (v11)
  {
    v12 = v11;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v10;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v48;
      v43 = v13;
      v38 = a5;
      v44 = v14;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v46 = 0;
        +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v16, CFSTR("TVDeviceID"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v46);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v46;
        if (v19)
        {
          v12 = v19;

          goto LABEL_20;
        }
        objc_msgSend(v18, "uppercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("TVDeviceID"));
        objc_msgSend(v44, "addObject:", v20);
        v45 = 0;
        +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v16, CFSTR("TVDeviceName"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v45);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v45;
        if (v22)
        {
          v12 = v22;

          goto LABEL_20;
        }
        if (v21)
        {
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("TVDeviceName"));
          objc_msgSend(v40, "addObject:", v21);
        }
        objc_msgSend(v43, "addObject:", v17);

        if (v41 == ++v15)
        {
          a5 = v38;
          v13 = v43;
          v14 = v44;
          v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v41)
            goto LABEL_6;
          goto LABEL_16;
        }
      }
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("AllowedTVs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      v23 = obj;
      v24 = v40;
      allowedTVIDs = obj;
      a5 = v38;
      v13 = v43;
      v14 = v44;
      goto LABEL_21;
    }
LABEL_16:
    v23 = obj;

    objc_storeStrong((id *)&v9->_allowedTVs, v13);
    v24 = v40;
    objc_storeStrong((id *)&v9->_allowedTVNames, v40);
    v25 = v14;
    v12 = 0;
    allowedTVIDs = v9->_allowedTVIDs;
    v9->_allowedTVIDs = v25;
LABEL_21:

    if (!v12)
      goto LABEL_27;
  }
  -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a5)
    *a5 = objc_retainAutorelease(v27);
  v29 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v30 = v29;
    v31 = (void *)objc_opt_class();
    v32 = v31;
    objc_msgSend(v28, "MCVerboseDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v31;
    v55 = 2114;
    v56 = v33;
    _os_log_impl(&dword_19ECC4000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v9 = 0;
LABEL_27:
  if (objc_msgSend(v8, "count"))
  {
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      -[MCPayload friendlyName](v9, "friendlyName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v36;
      v55 = 2114;
      v56 = v8;
      _os_log_impl(&dword_19ECC4000, v35, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_31:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCTVRemotePayload;
  -[MCPayload stubDictionary](&v7, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("AllowedTVs"));

  }
  return v3;
}

- (id)subtitle1Label
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    MCLocalizedString(CFSTR("TVREMOTE_REMOTES_TITLE_COLON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)subtitle1Description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    MCLocalizedFormat(CFSTR("TVREMOTE_REMOTE_COUNT"), v7, v8, v9, v10, v11, v12, v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)subtitle2Label
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    MCLocalizedString(CFSTR("TVREMOTE_TVS_TITLE_COLON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)subtitle2Description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    MCLocalizedFormat(CFSTR("TVREMOTE_TV_COUNT"), v7, v8, v9, v10, v11, v12, v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v34.receiver = self;
  v34.super_class = (Class)MCTVRemotePayload;
  -[MCPayload description](&v34, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Allowed Remotes   : %lu entries\n"), objc_msgSend(v7, "count"));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v5, "appendFormat:", CFSTR("                  %@\n"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v10);
    }

  }
  -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Allowed TVs       : %lu entries\n"), objc_msgSend(v14, "count"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[MCTVRemotePayload allowedTVs](self, "allowedTVs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TVDeviceID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TVDeviceName"));
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            v23 = (const __CFString *)v21;
          else
            v23 = &stru_1E41E70C8;
          objc_msgSend(v5, "appendFormat:", CFSTR("                  %@ (%@)\n"), v20, v23);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v16);
    }

  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TVREMOTE_ALLOWED_REMOTES"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  -[MCTVRemotePayload allowedTVIDs](self, "allowedTVIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[MCTVRemotePayload allowedTVIDs](self, "allowedTVIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TVREMOTE_ALLOWED_TVS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v3, "addObject:", v13);

  }
  -[MCTVRemotePayload allowedTVNames](self, "allowedTVNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[MCTVRemotePayload allowedTVNames](self, "allowedTVNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TVREMOTE_ALLOWED_TV_NAMES"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v16, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v3, "addObject:", v18);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return v3;
}

- (id)restrictions
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("union"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("tvRemoteAllowedRemotes"));
    -[MCTVRemotePayload allowedRemotes](self, "allowedRemotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("values"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTVRemotePayload allowedTVIDs](self, "allowedTVIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("tvRemoteAllowedTVs"));
    -[MCTVRemotePayload allowedTVIDs](self, "allowedTVIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("values"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTVRemotePayload allowedTVNames](self, "allowedTVNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("tvRemoteAllowedTVNames"));
    -[MCTVRemotePayload allowedTVNames](self, "allowedTVNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("values"));

  }
  return v3;
}

- (NSArray)allowedTVIDs
{
  return self->_allowedTVIDs;
}

- (NSArray)allowedTVNames
{
  return self->_allowedTVNames;
}

- (NSArray)allowedRemotes
{
  return self->_allowedRemotes;
}

- (void)setAllowedRemotes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedRemotes, a3);
}

- (NSArray)allowedTVs
{
  return self->_allowedTVs;
}

- (void)setAllowedTVs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTVs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTVs, 0);
  objc_storeStrong((id *)&self->_allowedRemotes, 0);
  objc_storeStrong((id *)&self->_allowedTVNames, 0);
  objc_storeStrong((id *)&self->_allowedTVIDs, 0);
}

@end

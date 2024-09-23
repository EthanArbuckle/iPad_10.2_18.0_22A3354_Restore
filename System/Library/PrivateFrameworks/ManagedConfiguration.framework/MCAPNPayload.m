@implementation MCAPNPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.apn.managed"));
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

  return MCLocalizedFormat(CFSTR("APN_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("APN_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)apnDomainName
{
  return CFSTR("com.apple.managedCarrier");
}

- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  v9 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), (uint64_t)a2, a3, (uint64_t)a4, v4, v5, v6, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), a3, v10, CFSTR("MCFatalError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *j;
  void *v20;
  const __CFString *v21;
  MCAPNPayload *v22;
  uint64_t v23;
  void *v25;
  id *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCAPNPayload.m"), 82, CFSTR("Invalid argument"));

  }
  v26 = a4;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (!v7)
  {
    v17 = 0;
    goto LABEL_31;
  }
  v8 = v7;
  v9 = *(_QWORD *)v34;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v11, "objectForKey:", CFSTR("DefaultsDomainName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.managedCarrier")) & 1) == 0)
      {
        v21 = CFSTR("DefaultsDomainName");
        v22 = self;
        v23 = 2004;
LABEL_28:
        -[MCAPNPayload _validationErrorType:forInvalidKey:](v22, "_validationErrorType:forInvalidKey:", v23, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("DefaultsData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v21 = CFSTR("DefaultsData");
        v22 = self;
        v23 = 2002;
        goto LABEL_28;
      }
      v14 = v13;
      objc_msgSend(v13, "objectForKey:", CFSTR("apns"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        -[MCAPNPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2002, CFSTR("apns"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v15;
      v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v30;
        while (2)
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "objectForKey:", CFSTR("apn"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              -[MCAPNPayload _validationErrorType:forInvalidKey:](self, "_validationErrorType:forInvalidKey:", 2002, CFSTR("apn"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_21;
            }

          }
          v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_21:

      if (v17)
        goto LABEL_31;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    v17 = 0;
    if (v8)
      continue;
    break;
  }
LABEL_31:

  if (v26)
    *v26 = objc_retainAutorelease(v17);

  return v17 == 0;
}

- (void)_finishInitializationWithContents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MCAPNInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v25 = v5;
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v5), "objectForKey:", CFSTR("DefaultsData"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("apns"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
              v14 = objc_alloc_init(MCAPNInfo);
              objc_msgSend(v13, "objectForKey:", CFSTR("apn"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCAPNInfo setApnName:](v14, "setApnName:", v15);

              objc_msgSend(v13, "objectForKey:", CFSTR("username"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCAPNInfo setUsername:](v14, "setUsername:", v16);

              objc_msgSend(v13, "objectForKey:", CFSTR("password"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
                -[MCAPNInfo setPassword:](v14, "setPassword:", v18);

              }
              else
              {
                -[MCAPNInfo setPassword:](v14, "setPassword:", v17);
              }
              objc_msgSend(v13, "objectForKey:", CFSTR("proxy"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCAPNInfo setProxy:](v14, "setProxy:", v19);

              objc_msgSend(v13, "objectForKey:", CFSTR("proxyPort"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCAPNInfo setProxyPort:](v14, "setProxyPort:", v20);

              objc_msgSend(v4, "addObject:", v14);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v10);
        }

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v4, "count"))
    objc_storeStrong((id *)&self->_apnInfos, v4);

}

- (MCAPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCAPNPayload *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MCAPNPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v29, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v28 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    if (!v11 && v10)
    {
      v27 = 0;
      -[MCAPNPayload _checkForValidContents:outError:](v9, "_checkForValidContents:outError:", v10, &v27);
      v11 = v27;
    }
    -[MCPayload profile](v9, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isStub");

    if (v13)
    {
      if (v11
        || (v26 = 0,
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("WasInstalled"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v26), v25 = (void *)objc_claimAutoreleasedReturnValue(), v11 = v26, !v25))
      {
        v9->_wasInstalled = 1;
      }
      else
      {
        v9->_wasInstalled = objc_msgSend(v25, "BOOLValue");

      }
    }
    else
    {
      v9->_wasInstalled = 0;
    }
    if (v11)
    {
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a5)
        *a5 = objc_retainAutorelease(v14);
      v16 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        v18 = (void *)objc_opt_class();
        v19 = v18;
        objc_msgSend(v15, "MCVerboseDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v18;
        v32 = 2114;
        v33 = v20;
        _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      v21 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v22 = v21;
        -[MCPayload friendlyName](v9, "friendlyName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_19ECC4000, v22, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }
    if (!v11)
      -[MCAPNPayload _finishInitializationWithContents:](v9, "_finishInitializationWithContents:", v10);

  }
  return v9;
}

- (id)apnDefaults
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_apnInfos, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_apnInfos;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "defaultsRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("apns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_strippedAPNDefaults
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_apnInfos, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_apnInfos;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "strippedDefaultsRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("apns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCAPNPayload;
  -[MCPayload stubDictionary](&v10, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCAPNPayload apnDomainName](MCAPNPayload, "apnDomainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("DefaultsDomainName"));

  -[MCAPNPayload _strippedAPNDefaults](self, "_strippedAPNDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("DefaultsData"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("PayloadContent"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasInstalled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("WasInstalled"));

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCAPNPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\napns: %@"), self->_apnInfos);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedString(CFSTR("NAME_COLON"));
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_apnInfos, "count"))
  {
    -[NSArray firstObject](self->_apnInfos, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "apnName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MCLocalizedString(CFSTR("NAME_MISSING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)subtitle2Label
{
  return MCLocalizedString(CFSTR("USERNAME_COLON"));
}

- (id)subtitle2Description
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_apnInfos, "count"))
  {
    -[NSArray firstObject](self->_apnInfos, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MCLocalizedString(CFSTR("USERNAME_MISSING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  void *v32;
  void *v33;
  MCKeyValue *v34;
  void *v35;
  MCKeyValue *v36;
  void *v37;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_apnInfos;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v41;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v8, "apnName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = [MCKeyValue alloc];
          objc_msgSend(v8, "apnName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("APN_NAME"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v12, v13);

          objc_msgSend(v9, "addObject:", v14);
        }
        objc_msgSend(v8, "username");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = [MCKeyValue alloc];
          objc_msgSend(v8, "username");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("USERNAME"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

          objc_msgSend(v9, "addObject:", v19);
        }
        objc_msgSend(v8, "password");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("PRESENT"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("PASSWORD"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v22, v23);

          objc_msgSend(v9, "addObject:", v24);
        }
        objc_msgSend(v8, "proxy");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = [MCKeyValue alloc];
          objc_msgSend(v8, "proxy");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          MCLocalizedString(CFSTR("PROXY"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[MCKeyValue initWithLocalizedString:localizedKey:](v26, "initWithLocalizedString:localizedKey:", v27, v28);

          objc_msgSend(v9, "addObject:", v29);
        }
        objc_msgSend(v8, "proxyPort");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "proxyPort");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v32, "intValue"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("PORT"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[MCKeyValue initWithLocalizedString:localizedKey:](v34, "initWithLocalizedString:localizedKey:", v33, v35);

          objc_msgSend(v9, "addObject:", v36);
        }
        if (objc_msgSend(v9, "count"))
        {
          +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v9);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v37);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v5);
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

- (BOOL)wasInstalled
{
  return self->_wasInstalled;
}

- (void)setWasInstalled:(BOOL)a3
{
  self->_wasInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apnInfos, 0);
}

@end

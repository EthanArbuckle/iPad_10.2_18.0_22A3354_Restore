@implementation MCDefaultsPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.defaults.managed"));
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

  return MCLocalizedFormat(CFSTR("DEFAULTS_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("DEFAULTS_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isAllowedToWriteDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCPayload profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signerCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfile evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:](MCProfile, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:", v6, v4, &v8);

  LOBYTE(v5) = v8;
  return (char)v5;
}

- (MCDefaultsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCDefaultsPayload *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *defaultsByDomain;
  void *v31;
  NSDictionary *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v54;
  id v55;
  id obj;
  NSDictionary *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v63.receiver = self;
  v63.super_class = (Class)MCDefaultsPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v63, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_51;
  v62 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v62);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v62;
  if (v12)
    goto LABEL_42;
  -[MCPayload profile](v10, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isStub");

  if ((v14 & 1) == 0 && v11 && !-[MCDefaultsPayload isAllowedToWriteDefaults](v10, "isAllowedToWriteDefaults"))
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "friendlyName");
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    MCErrorArray(CFSTR("ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID"), v33, v34, v35, v36, v37, v38, v39, v32);
    defaultsByDomain = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDefaultsErrorDomain"), 10001, defaultsByDomain, CFSTR("MCFatalError"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v40, "MCCopyAsPrimaryError");

    v15 = v32;
    goto LABEL_40;
  }
  if (objc_msgSend(v11, "count"))
    v15 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  else
    v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("DefaultsData"));
    defaultsByDomain = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(defaultsByDomain, "MCCopyAsPrimaryError");
    goto LABEL_40;
  }
  v55 = v9;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (!v16)
  {
LABEL_28:

    v9 = v55;
    goto LABEL_39;
  }
  v17 = v16;
  v18 = *(_QWORD *)v59;
  v54 = v11;
  v57 = v15;
LABEL_12:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v59 != v18)
      objc_enumerationMutation(obj);
    v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v19);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("PayloadContent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v21, "MCCopyAsPrimaryError");
      goto LABEL_38;
    }
    objc_msgSend(v20, "objectForKey:", CFSTR("DefaultsDomainName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      -[MCPayload profile](v10, "profile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isStub");

      if ((v27 & 1) == 0)
      {
        +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", CFSTR("DefaultsDomainName"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v22, "MCCopyAsPrimaryError");
        goto LABEL_37;
      }
      goto LABEL_26;
    }
    objc_msgSend(v20, "objectForKey:", CFSTR("DefaultsData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("DefaultsData"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    v23 = v57;
    -[NSDictionary objectForKey:](v57, "objectForKey:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("DefaultsData"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v42, "MCCopyAsPrimaryError");

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addEntriesFromDictionary:", v22);

      v22 = v25;
      v23 = v57;
    }
    -[NSDictionary setObject:forKey:](v23, "setObject:forKey:", v22, v21);

LABEL_26:
    if (v17 == ++v19)
    {
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      v11 = v54;
      v15 = v57;
      if (v17)
        goto LABEL_12;
      goto LABEL_28;
    }
  }
  -[MCPayload profile](v10, "profile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isStub");

  if ((v29 & 1) != 0)
    goto LABEL_26;
  +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", CFSTR("DefaultsData"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
  v24 = v41;
  v12 = (id)objc_msgSend(v41, "MCCopyAsPrimaryError");
LABEL_36:

LABEL_37:
LABEL_38:
  v11 = v54;
  v9 = v55;
  v15 = v57;

  if (v12)
    goto LABEL_41;
LABEL_39:
  v15 = v15;
  v12 = 0;
  defaultsByDomain = v10->_defaultsByDomain;
  v10->_defaultsByDomain = v15;
LABEL_40:

LABEL_41:
  if (v12)
  {
LABEL_42:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (a5)
      *a5 = objc_retainAutorelease(v43);
    v45 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v46 = v45;
      v47 = (void *)objc_opt_class();
      v48 = v47;
      objc_msgSend(v44, "MCVerboseDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v47;
      v66 = 2114;
      v67 = v49;
      _os_log_impl(&dword_19ECC4000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v50 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v51 = v50;
      -[MCPayload friendlyName](v10, "friendlyName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v52;
      v66 = 2114;
      v67 = v8;
      _os_log_impl(&dword_19ECC4000, v51, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_51:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MCDefaultsPayload;
  -[MCPayload stubDictionary](&v21, sel_stubDictionary);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MCDefaultsPayload domains](self, "domains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MCDefaultsPayload domains](self, "domains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MCDefaultsPayload defaultsForDomain:](self, "defaultsForDomain:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
        {
          v22[0] = CFSTR("DefaultsDomainName");
          v22[1] = CFSTR("DefaultsData");
          v23[0] = v11;
          v23[1] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v16, "setObject:forKey:", v5, CFSTR("PayloadContent"));
  return v16;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDefaultsPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_defaultsByDomain)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ndefaults: %@"), self->_defaultsByDomain);
  return v4;
}

- (id)domains
{
  return -[NSDictionary allKeys](self->_defaultsByDomain, "allKeys");
}

- (id)defaultsForDomain:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_defaultsByDomain, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MCLocalizedString(CFSTR("DEFAULTS_DESCRIPTION_SINGULAR_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsByDomain, 0);
}

@end

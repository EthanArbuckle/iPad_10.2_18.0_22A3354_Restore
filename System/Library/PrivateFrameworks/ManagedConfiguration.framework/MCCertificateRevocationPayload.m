@implementation MCCertificateRevocationPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.security.certificaterevocation");
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_REVOCATION_DESCRIPTION_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_REVOCATION_DESCRIPTION_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCertificateRevocationPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCCertificateRevocationPayload *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  id obja;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MCCertificateRevocationPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v50, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_40;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnabledForCerts"), 0, &v49);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v49;
  if (v12)
    goto LABEL_31;
  if (!v11)
  {
    v12 = 0;
    goto LABEL_30;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (!v13)
  {
    v12 = 0;
    goto LABEL_29;
  }
  v14 = v13;
  v15 = *(_QWORD *)v46;
  v42 = *MEMORY[0x1E0CD6C18];
  v41 = *MEMORY[0x1E0CD6C20];
  v40 = v11;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v46 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Algorithm"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend((id)objc_opt_class(), "missingFieldErrorWithField:underlyingError:", CFSTR("Algorithm"), 0);
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v12 = (id)v26;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Algorithm"));
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      v18 = v18;
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("sha256")) & 1) != 0)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Hash"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v51[0] = v42;
            v51[1] = v41;
            v52[0] = v18;
            v52[1] = v19;
            v20 = (void *)MEMORY[0x1E0C99D80];
            v21 = v19;
            objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v22);
            goto LABEL_17;
          }
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Hash"));
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "missingFieldErrorWithField:underlyingError:", CFSTR("Hash"), 0);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (id)v27;

LABEL_28:
        v11 = v40;

        goto LABEL_29;
      }
      v23 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        -[MCPayload friendlyName](v9, "friendlyName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = v25;
        v55 = 2112;
        v56 = v18;
        _os_log_impl(&dword_19ECC4000, v24, OS_LOG_TYPE_DEFAULT, "Payload \"%@\" has an unsupported hash algorithm \"%@\". The hash will be ignored.", buf, 0x16u);

      }
LABEL_17:

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    v12 = 0;
    v11 = v40;
    if (v14)
      continue;
    break;
  }
LABEL_29:

LABEL_30:
  objc_storeStrong((id *)&v9->_hashDictionaries, v10);
  if (v12)
  {
LABEL_31:
    -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a5)
      *a5 = objc_retainAutorelease(v28);
    v30 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      v32 = (void *)objc_opt_class();
      obja = v32;
      objc_msgSend(v29, "MCVerboseDescription");
      v33 = v8;
      v34 = v11;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v32;
      v55 = 2112;
      v56 = v35;
      _os_log_impl(&dword_19ECC4000, v31, OS_LOG_TYPE_ERROR, "%@ Can't parse payload: %@", buf, 0x16u);

      v11 = v34;
      v8 = v33;

    }
    v9 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v36 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      -[MCPayload friendlyName](v9, "friendlyName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v38;
      v55 = 2112;
      v56 = v8;
      _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_INFO, "Payload “%@” contains ignored fields. They are: %@", buf, 0x16u);

    }
  }

LABEL_40:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSArray *obj;
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
  v21.super_class = (Class)MCCertificateRevocationPayload;
  -[MCPayload stubDictionary](&v21, sel_stubDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_hashDictionaries, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_hashDictionaries;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0CD6C18];
    v8 = *MEMORY[0x1E0CD6C20];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v22[0] = CFSTR("Algorithm");
        objc_msgSend(v10, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = CFSTR("Hash");
        v23[0] = v11;
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v9;
      }
      while (v5 != v9);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v5);
  }

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v3, CFSTR("EnabledForCerts"));
  return v15;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCCertificateRevocationPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_hashDictionaries)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nhashDictionaries:\n%@"), self->_hashDictionaries);
  return v4;
}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;

  v2 = -[NSArray count](self->_hashDictionaries, "count");
  if (v2)
  {
    if (v2 == (void *)1)
      v3 = CFSTR("CERTIFICATE_REVOCATION_ADDITION_SINGULAR");
    else
      v3 = CFSTR("CERTIFICATE_REVOCATION_ADDITION_PLURAL");
    MCLocalizedString(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (NSArray)hashDictionaries
{
  return self->_hashDictionaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashDictionaries, 0);
}

@end

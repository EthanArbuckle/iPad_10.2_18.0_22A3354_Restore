@implementation MCCertificateTransparencyPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.security.certificatetransparency");
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_TRANSPARENCY_DESCRIPTION_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_TRANSPARENCY_DESCRIPTION_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCertificateTransparencyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCCertificateTransparencyPayload *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  MCCertificateTransparencyPayload *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  id obja;
  id objb;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  objc_super v82;
  _BYTE v83[128];
  _QWORD v84[2];
  _QWORD v85[2];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MCCertificateTransparencyPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v82, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_54;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DisabledForCerts"), 0, &v81);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v81;
  if (v13)
    goto LABEL_45;
  if (!v12)
  {
    v27 = 0;
    goto LABEL_30;
  }
  v63 = v9;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (!v14)
  {
    v27 = 0;
    goto LABEL_29;
  }
  v15 = v14;
  v16 = *(_QWORD *)v78;
  v67 = *MEMORY[0x1E0CD6C70];
  v66 = *MEMORY[0x1E0CD6C78];
  v64 = v12;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v78 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Algorithm"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend((id)objc_opt_class(), "missingFieldErrorWithField:underlyingError:", CFSTR("Algorithm"), 0);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v27 = (void *)v28;
        v12 = v64;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Algorithm"));
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      v19 = v19;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("sha256")) & 1) != 0)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Hash"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v84[0] = v67;
            v84[1] = v66;
            v85[0] = v19;
            v85[1] = v20;
            v21 = (void *)MEMORY[0x1E0C99D80];
            v22 = v20;
            objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v71, "addObject:", v23);
            goto LABEL_17;
          }
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Hash"));
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "missingFieldErrorWithField:underlyingError:", CFSTR("Hash"), 0);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v29;

        v12 = v64;
LABEL_28:

        goto LABEL_29;
      }
      v24 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        -[MCPayload friendlyName](v10, "friendlyName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v87 = v26;
        v88 = 2112;
        v89 = v19;
        _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_DEFAULT, "Payload \"%@\" has an unsupported hash algorithm \"%@\". The hash will be ignored.", buf, 0x16u);

      }
LABEL_17:

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    v27 = 0;
    v12 = v64;
    if (v15)
      continue;
    break;
  }
LABEL_29:

  v9 = v63;
LABEL_30:
  v76 = v27;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("DisabledForDomains"), 0, 0, &v76);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v76;

  if (v13)
  {

    goto LABEL_45;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v32)
  {
    v33 = v32;
    v65 = v12;
    v34 = *(_QWORD *)v73;
    while (2)
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v73 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
        if ((objc_msgSend((id)objc_opt_class(), "isValidDomainRule:", v36) & 1) == 0)
        {
          obja = (id)MEMORY[0x1E0CB35C8];
          objc_msgSend(v9, "friendlyName");
          v37 = v9;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          MCErrorArray(CFSTR("ERROR_CERTIFICATE_TRANSPARENCY_BAD_DOMAIN"), v39, v40, v41, v42, v43, v44, v45, v38);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCCertificateTransparencyErrorDomain"), 53000, v46, CFSTR("MCFatalError"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (id)objc_msgSend(v47, "MCCopyAsPrimaryError");

          v9 = v37;
          goto LABEL_42;
        }
        objc_msgSend(v11, "addObject:", v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v33)
        continue;
      break;
    }
    v13 = 0;
LABEL_42:
    v12 = v65;
  }
  else
  {
    v13 = 0;
  }

  objc_storeStrong((id *)&v10->_hashDictionaries, v71);
  objc_storeStrong((id *)&v10->_domainRules, v11);

  if (v13)
  {
LABEL_45:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v13);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a5)
      *a5 = objc_retainAutorelease(v48);
    v50 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v51 = v50;
      v52 = (void *)objc_opt_class();
      objb = v52;
      objc_msgSend(v49, "MCVerboseDescription");
      v53 = v10;
      v54 = v8;
      v55 = v11;
      v56 = v12;
      v57 = v9;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v52;
      v88 = 2112;
      v89 = v58;
      _os_log_impl(&dword_19ECC4000, v51, OS_LOG_TYPE_ERROR, "%@ Can't parse payload: %@", buf, 0x16u);

      v9 = v57;
      v12 = v56;
      v11 = v55;
      v8 = v54;
      v10 = v53;

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v59 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v60 = v59;
      -[MCPayload friendlyName](v10, "friendlyName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v61;
      v88 = 2112;
      v89 = v8;
      _os_log_impl(&dword_19ECC4000, v60, OS_LOG_TYPE_INFO, "Payload “%@” contains ignored fields. They are: %@", buf, 0x16u);

    }
  }

LABEL_54:
  return v10;
}

+ (BOOL)isValidDomainRule:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR(".")))
  {
    if (objc_msgSend(v3, "length") == 1)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "substringFromIndex:", 1);
      v4 = _CFHostIsDomainTopLevelForCertificatePolicy() == 0;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)stubDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  v21.super_class = (Class)MCCertificateTransparencyPayload;
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
    v7 = *MEMORY[0x1E0CD6C70];
    v8 = *MEMORY[0x1E0CD6C78];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
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

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v5);
  }

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v3, CFSTR("DisabledForCerts"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", self->_domainRules, CFSTR("DisabledForDomains"));

  return v15;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCCertificateTransparencyPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_hashDictionaries)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nhashDictionaries:\n%@"), self->_hashDictionaries);
  if (self->_domainRules)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ndomainRules:\n%@"), self->_domainRules);
  return v4;
}

- (id)subtitle1Label
{
  NSUInteger v3;
  NSUInteger v4;
  __CFString *v5;
  void *v6;

  v3 = -[NSArray count](self->_hashDictionaries, "count");
  v4 = -[NSArray count](self->_domainRules, "count") + v3;
  if (v4)
  {
    if (v4 == 1)
      v5 = CFSTR("CERTIFICATE_TRANSPARENCY_EXCEPTION_SINGULAR");
    else
      v5 = CFSTR("CERTIFICATE_TRANSPARENCY_EXCEPTION_PLURAL");
    MCLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)hashDictionaries
{
  return self->_hashDictionaries;
}

- (NSArray)domainRules
{
  return self->_domainRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainRules, 0);
  objc_storeStrong((id *)&self->_hashDictionaries, 0);
}

@end

@implementation MCDomainsPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.domains");
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

  return MCLocalizedFormat(CFSTR("DOMAINS_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("DOMAINS_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)invalidDomainPatternErrorWithPattern:(id)a3 field:(id)a4
{
  void *v5;
  id v6;
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

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  MCErrorArray(CFSTR("DOMAINS_INVALID_PATTERN_P_PATTERN"), v7, v8, v9, v10, v11, v12, v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDomainsErrorDomain"), 38000, v14, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPayload badFieldValueErrorWithField:underlyingError:](MCPayload, "badFieldValueErrorWithField:underlyingError:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)tooManyDomainsErrorWithMaxCount:(id)a3 field:(id)a4
{
  void *v5;
  id v6;
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

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  MCErrorArray(CFSTR("DOMAINS_TOO_MANY_DOMAIN_ENTRIES_P_MAX"), v7, v8, v9, v10, v11, v12, v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDomainsErrorDomain"), 38001, v14, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPayload badFieldValueErrorWithField:underlyingError:](MCPayload, "badFieldValueErrorWithField:underlyingError:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)tooManyAppsErrorWithMaxCount:(id)a3 field:(id)a4
{
  void *v5;
  id v6;
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

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  MCErrorArray(CFSTR("DOMAINS_TOO_MANY_APP_ENTRIES_P_MAX"), v7, v8, v9, v10, v11, v12, v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDomainsErrorDomain"), 38001, v14, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPayload badFieldValueErrorWithField:underlyingError:](MCPayload, "badFieldValueErrorWithField:underlyingError:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)isPatternValid:(id)a3 forField:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  BOOL v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) != 0)
    {
      if (isPatternValid_forField_outError__onceToken != -1)
        dispatch_once(&isPatternValid_forField_outError__onceToken, &__block_literal_global_10);
      if (objc_msgSend(v7, "rangeOfCharacterFromSet:", isPatternValid_forField_outError__punctuation) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v7, "pathComponents");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "count")
          || (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("/")),
              v13,
              v14))
        {
          +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        objc_msgSend(v12, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/"));

        if (v18)
        {
          objc_msgSend(v12, "subarrayWithRange:", 0, objc_msgSend(v12, "count") - 1);
          v19 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v19;
        }
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v12 = v12;
        v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(v12);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "length", (_QWORD)v37))
              {
                +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8);
                v15 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_29;
              }
            }
            v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v21)
              continue;
            break;
          }
        }

        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("*")) & 1) != 0
          || (objc_msgSend(v24, "isEqualToString:", CFSTR("*.")) & 1) != 0
          || objc_msgSend(v24, "isEqualToString:", CFSTR(".")))
        {
          goto LABEL_26;
        }
        if ((unint64_t)objc_msgSend(v24, "length") >= 2)
        {
          objc_msgSend(v24, "substringWithRange:", 0, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("*")) & 1) != 0)
          {
            objc_msgSend(v24, "substringWithRange:", 1, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("."));

            if ((v28 & 1) == 0)
              goto LABEL_26;
          }
          else
          {

          }
          if (objc_msgSend(v24, "rangeOfString:options:", CFSTR(":"), 12, (_QWORD)v37) != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_26;
        }
        v29 = objc_msgSend(v24, "rangeOfString:options:", CFSTR(":"), 4, (_QWORD)v37);
        if (v29)
        {
          v30 = v29;
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_40;
          if (v29 != objc_msgSend(v24, "length") - 1
            && objc_msgSend(v24, "rangeOfString:options:range:", CFSTR(":"), 0, 0, v30) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v24, "substringFromIndex:", v30 + 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "invertedSet");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v31, "rangeOfCharacterFromSet:", v33);

            if (v34 != 0x7FFFFFFFFFFFFFFFLL)
            {
              +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = v31;
              v15 = (id)v35;

              goto LABEL_27;
            }

LABEL_40:
            v15 = 0;
            goto LABEL_30;
          }
        }
LABEL_26:
        +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8, (_QWORD)v37);
        v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_29:
        if (!v15)
          goto LABEL_30;
        goto LABEL_10;
      }
    }
  }
  +[MCDomainsPayload invalidDomainPatternErrorWithPattern:field:](MCDomainsPayload, "invalidDomainPatternErrorWithPattern:field:", v7, v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_30:
    v16 = 1;
    goto LABEL_31;
  }
LABEL_10:
  if (a5)
  {
    v15 = objc_retainAutorelease(v15);
    v16 = 0;
    *a5 = v15;
  }
  else
  {
    v16 = 0;
  }
LABEL_31:

  return v16;
}

uint64_t __53__MCDomainsPayload_isPatternValid_forField_outError___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)isPatternValid_forField_outError__punctuation;
  isPatternValid_forField_outError__punctuation = (uint64_t)v0;

  return objc_msgSend((id)isPatternValid_forField_outError__punctuation, "addCharactersInString:", CFSTR("@#?!&"));
}

- (MCDomainsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCDomainsPayload *v9;
  MCDomainsPayload *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id *v27;
  void *v28;
  NSDictionary *v29;
  NSDictionary *restrictions;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  MCDomainsPayload *v66;
  id *v67;
  void *v68;
  id v69;
  id obj;
  void *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  objc_super v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  _BYTE v97[128];
  const __CFString *v98;
  void *v99;
  _BYTE v100[128];
  const __CFString *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v92.receiver = self;
  v92.super_class = (Class)MCDomainsPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v92, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  v10 = v9;
  if (!v9)
    goto LABEL_25;
  v66 = v9;
  v67 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  v63 = v8;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("WebDomains"), 0, &v91);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v91;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
  obj = v13;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v88;
    while (2)
    {
      v17 = 0;
      v18 = v12;
      do
      {
        if (*(_QWORD *)v88 != v16)
          objc_enumerationMutation(obj);
        +[MCDomainsCacheEntry normalizedPatternString:](MCDomainsCacheEntry, "normalizedPatternString:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v18;
        v20 = +[MCDomainsPayload isPatternValid:forField:outError:](MCDomainsPayload, "isPatternValid:forField:outError:", v19, CFSTR("WebDomains"), &v86);
        v12 = v86;

        if (!v20)
        {
          v21 = 0;
          v22 = 0;
          v62 = 0;
          v68 = obj;
          v69 = 0;
          v8 = v63;
          v24 = v64;
          v25 = v65;
          v10 = v66;
          goto LABEL_14;
        }
        objc_msgSend(v71, "addObject:", v19);

        ++v17;
        v18 = v12;
      }
      while (v15 != v17);
      v13 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
      if (v15)
        continue;
      break;
    }
  }

  if (v12)
  {
    v21 = 0;
    v22 = 0;
    v69 = 0;
    v23 = 0;
    v8 = v63;
    v24 = v64;
    v25 = v65;
    v10 = v66;
    v26 = 0x1E0C99000;
    v27 = v67;
    if (!v67)
      goto LABEL_19;
LABEL_17:
    if (v12)
    {
      v12 = objc_retainAutorelease(v12);
      *v27 = v12;
    }
    goto LABEL_19;
  }
  v8 = v63;
  v24 = v64;
  v25 = v65;
  v10 = v66;
  v27 = a5;
  if (v13)
  {
    v103 = CFSTR("values");
    objc_msgSend(v71, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v33, CFSTR("managedWebDomains"));

  }
  v85 = 0;
  objc_msgSend(v63, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EmailDomains"), 0, &v85);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v85;
  if (v34)
  {
    v12 = v34;
    v21 = 0;
    v22 = 0;
    v69 = 0;
    v26 = 0x1E0C99000;
    if (!v67)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (v23)
  {
    v101 = CFSTR("values");
    v102 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v35, CFSTR("managedEmailDomains"));

  }
  -[MCPayload profile](v66, "profile");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "isStub"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isSupervised");

    if (!v38)
    {
      v12 = 0;
      v28 = 0;
      v22 = 0;
      v21 = 0;
      v26 = 0x1E0C99000;
      goto LABEL_20;
    }
  }
  v62 = v23;
  v84 = 0;
  objc_msgSend(v63, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SafariPasswordAutoFillDomains"), 0, &v84);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v84;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v39, "count"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v40 = v39;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
  v69 = v40;
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v81;
    while (2)
    {
      v44 = 0;
      v45 = v12;
      do
      {
        if (*(_QWORD *)v81 != v43)
          objc_enumerationMutation(v69);
        +[MCDomainsCacheEntry normalizedPatternString:](MCDomainsCacheEntry, "normalizedPatternString:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v44));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v45;
        v47 = +[MCDomainsPayload isPatternValid:forField:outError:](MCDomainsPayload, "isPatternValid:forField:outError:", v46, CFSTR("SafariPasswordAutoFillDomains"), &v79);
        v12 = v79;

        if (!v47)
        {
          v21 = 0;
          v22 = 0;
          v19 = v69;
          v8 = v63;
          v24 = v64;
          v25 = v65;
          v10 = v66;
          goto LABEL_47;
        }
        objc_msgSend(v68, "addObject:", v46);

        ++v44;
        v45 = v12;
      }
      while (v42 != v44);
      v40 = v69;
      v42 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
      if (v42)
        continue;
      break;
    }
  }

  if (v12)
  {
    v21 = 0;
    v22 = 0;
    v8 = v63;
    v24 = v64;
    v25 = v65;
    v10 = v66;
    goto LABEL_15;
  }
  v8 = v63;
  v24 = v64;
  v25 = v65;
  v27 = v67;
  v23 = v62;
  if (v40)
  {
    v98 = CFSTR("values");
    objc_msgSend(v68, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v49, CFSTR("allowedSafariPasswordAutoFillDomains"));

  }
  v78 = 0;
  objc_msgSend(v63, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CrossSiteTrackingPreventionRelaxedDomains"), 0, &v78);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v78;
  v10 = v66;
  if (!v50)
  {
    if ((unint64_t)objc_msgSend(v22, "count") >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCDomainsPayload tooManyDomainsErrorWithMaxCount:field:](MCDomainsPayload, "tooManyDomainsErrorWithMaxCount:field:", v51, CFSTR("CrossSiteTrackingPreventionRelaxedDomains"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v22, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v22 = v22;
    v61 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
    if (v61)
    {
      v12 = 0;
      v60 = *(_QWORD *)v75;
      while (2)
      {
        v52 = 0;
        v53 = v12;
        do
        {
          if (*(_QWORD *)v75 != v60)
            objc_enumerationMutation(v22);
          +[MCDomainsCacheEntry normalizedPatternString:](MCDomainsCacheEntry, "normalizedPatternString:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v52), v60);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v53;
          v55 = +[MCDomainsPayload isPatternValid:forField:outError:](MCDomainsPayload, "isPatternValid:forField:outError:", v54, CFSTR("CrossSiteTrackingPreventionRelaxedDomains"), &v73);
          v12 = v73;

          if (!v55)
          {

            goto LABEL_66;
          }
          objc_msgSend(v19, "addObject:", v54);

          ++v52;
          v53 = v12;
        }
        while (v61 != v52);
        v61 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
        if (v61)
          continue;
        break;
      }
LABEL_66:

      v25 = v65;
      v10 = v66;
      v24 = v64;
      if (v12)
      {
        v21 = 0;
LABEL_14:

LABEL_15:
        v26 = 0x1E0C99000uLL;
        v27 = v67;
        v23 = v62;
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (v22)
    {
      v95 = CFSTR("values");
      objc_msgSend(v19, "allObjects");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v57, CFSTR("crossSiteTrackingPreventionRelaxedDomains"));

    }
    v72 = 0;
    objc_msgSend(v63, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CrossSiteTrackingPreventionRelaxedApps"), 0, &v72);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v72;
    if (v58)
    {
      v12 = v58;
    }
    else if ((unint64_t)objc_msgSend(v21, "count") < 0xB
           || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10),
               v59 = (void *)objc_claimAutoreleasedReturnValue(),
               v8 = v63,
               +[MCDomainsPayload tooManyAppsErrorWithMaxCount:field:](MCDomainsPayload, "tooManyAppsErrorWithMaxCount:field:", v59, CFSTR("CrossSiteTrackingPreventionRelaxedApps")), v12 = (id)objc_claimAutoreleasedReturnValue(), v59, !v12))
    {
      if (v21)
      {
        v93 = CFSTR("values");
        v94 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v46, CFSTR("crossSiteTrackingPreventionRelaxedApps"));
        v12 = 0;
LABEL_47:

      }
      else
      {
        v12 = 0;
      }
    }
    goto LABEL_14;
  }
  v12 = v50;
LABEL_53:
  v21 = 0;
  v26 = 0x1E0C99000;
LABEL_16:

  if (v27)
    goto LABEL_17;
LABEL_19:
  v28 = v69;
LABEL_20:
  objc_msgSend(*(id *)(v26 + 3592), "dictionary");
  v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
    -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v24, CFSTR("intersection"));
  if (objc_msgSend(v25, "count"))
    -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v25, CFSTR("union"));
  restrictions = v10->_restrictions;
  v10->_restrictions = v29;

LABEL_25:
  return v10;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCDomainsPayload;
  -[MCPayload stubDictionary](&v15, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDomainsPayload restrictions](self, "restrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("managedWebDomains"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WebDomains"));
  -[MCDomainsPayload restrictions](self, "restrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("managedEmailDomains"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("EmailDomains"));
  -[MCDomainsPayload restrictions](self, "restrictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("allowedSafariPasswordAutoFillDomains"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SafariPasswordAutoFillDomains"));
  -[MCDomainsPayload restrictions](self, "restrictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("crossSiteTrackingPreventionRelaxedDomains"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("CrossSiteTrackingPreventionRelaxedDomains"));
  -[MCDomainsPayload restrictions](self, "restrictions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("crossSiteTrackingPreventionRelaxedApps"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("CrossSiteTrackingPreventionRelaxedApps"));

  return v3;
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

  v3 = (void *)objc_opt_new();
  -[MCDomainsPayload restrictions](self, "restrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("managedWebDomains"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    MCLocalizedString(CFSTR("MANAGED_SAFARI_WEB_DOMAINS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v7);
  }
  -[MCDomainsPayload restrictions](self, "restrictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("managedEmailDomains"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    MCLocalizedString(CFSTR("UNMARKED_EMAIL_DOMAINS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v11);
  }
  -[MCDomainsPayload restrictions](self, "restrictions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("allowedSafariPasswordAutoFillDomains"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    MCLocalizedString(CFSTR("SAFARI_PASSWORD_AUTOFILL_DOMAINS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v15);
  }
  -[MCDomainsPayload restrictions](self, "restrictions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("crossSiteTrackingPreventionRelaxedDomains"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    MCLocalizedString(CFSTR("CROSS_SITE_TRACKING_PREVENTION_RELAXED_DOMAINS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v19);
  }
  -[MCDomainsPayload restrictions](self, "restrictions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("crossSiteTrackingPreventionRelaxedApps"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    MCLocalizedString(CFSTR("CROSS_SITE_TRACKING_PREVENTION_RELAXED_APPS"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (void)setRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_restrictions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end

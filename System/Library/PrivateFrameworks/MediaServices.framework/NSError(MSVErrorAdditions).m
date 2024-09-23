@implementation NSError(MSVErrorAdditions)

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, 0, 0, a5, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = (void *)objc_msgSend(a7, "mutableCopy");
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  if (v17)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v17, a9);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB2938]);

  }
  if (v15)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);
  if (objc_msgSend(v16, "count"))
  {
    v23 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB2F70]);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, a4, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)msv_errorByRemovingUnsafeUserInfo
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a1, "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "msv_filter:", &__block_literal_global_1989);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "msv_errorByRemovingUnsafeUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

    v8 = *MEMORY[0x1E0CB2F70];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "msv_map:", &__block_literal_global_4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);

    objc_msgSend(v4, "msv_compactMapValues:", &__block_literal_global_6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v2 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v2, "isEqual:", v11);

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(a1, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(a1, "code"), v11);
        v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
        goto LABEL_9;
      }
    }
    v15 = a1;
    goto LABEL_8;
  }
  v15 = a1;
LABEL_9:

  return v15;
}

- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:debugDescription:
{
  id v12;
  id v13;
  void *v14;

  v12 = a5;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", v13, a4, a1, 0, 0, v12, &a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:
{
  id v13;
  id v14;
  id v15;
  void *v16;

  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", v15, a4, a1, 0, v14, v13, &a9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

    goto LABEL_13;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "isEqual:", v4);

  if (v7)
  {
LABEL_13:
    v14 = a1;
    goto LABEL_15;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "msv_errorByUnwrappingDomain:", v4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (id)v13;

          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_15:

  return v14;
}

- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions code:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a1, "code") != a4)
    goto LABEL_4;
  objc_msgSend(a1, "domain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {

    goto LABEL_15;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "isEqual:", v6);

  if (v9)
  {
LABEL_15:
    v16 = a1;
    goto LABEL_16;
  }
LABEL_4:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "msv_errorByUnwrappingDomain:code:", v6, a4);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (id)v15;

          goto LABEL_16;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = 0;
LABEL_16:

  return v16;
}

- (id)msv_firstValueForUserInfoKey:()MSVErrorAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(a1, "underlyingErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      while (1)
      {
        objc_msgSend(v11, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v4);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (v7)
          break;
        objc_msgSend(v9, "msv_removeFirstObject");
        objc_msgSend(v11, "underlyingErrors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v13);

        objc_msgSend(v9, "firstObject");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        v11 = v7;
        if (!v7)
          goto LABEL_10;
      }

    }
    else
    {
      v7 = 0;
    }
LABEL_10:

  }
  return v7;
}

- (__CFString)msv_codeDescription
{
  uint64_t quot;
  uint64_t v3;
  char *v4;
  ldiv_t v5;
  uint64_t v6;
  const UInt8 *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (*v13)(uint64_t);
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  quot = objc_msgSend(a1, "code");
  v3 = quot;
  v4 = (char *)&v18 + 1;
  do
  {
    v5 = ldiv(quot, 10);
    quot = v5.quot;
    if (v5.rem >= 0)
      LOBYTE(v6) = v5.rem;
    else
      v6 = -v5.rem;
    *(v4 - 2) = v6 + 48;
    v7 = (const UInt8 *)(v4 - 2);
    --v4;
  }
  while (v5.quot);
  if (v3 < 0)
  {
    *(v4 - 2) = 45;
    v7 = (const UInt8 *)(v4 - 2);
  }
  v8 = (__CFString *)CFStringCreateWithBytes(0, v7, (char *)&v18 - (char *)v7, 0x8000100u, 0);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("NSStringFrom%@Code"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (void (*)(uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)objc_msgSend(v12, "UTF8String"));
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v13(objc_msgSend(a1, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%@)"), v15, v8);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v16;
  }

  return v8;
}

- (id)msv_description
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2938];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "localizedDescription");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(a1, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "msv_codeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("<%@.%@ \"%@\" {\n"), v9, v10, v8);

  objc_msgSend(a1, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB3388]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2F70]);
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    objc_msgSend(v12, "msv_compactDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("    userInfo: %@;\n"), v14);

  }
  objc_msgSend(a1, "underlyingErrors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v29 = v16;
    v30 = v13;
    v31 = v12;
    v32 = v8;
    objc_msgSend(v2, "appendString:", CFSTR("    underlyingErrors: ["));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(a1, "underlyingErrors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "msv_description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v35 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v2, "appendFormat:", CFSTR("\n        %@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v24);
          }
          objc_msgSend(v2, "appendString:", CFSTR(","));

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v18);
    }

    objc_msgSend(v2, "appendString:", CFSTR("\n    ];\n"));
    v12 = v31;
    v8 = v32;
    v16 = v29;
    v13 = v30;
  }
  objc_msgSend(v2, "appendString:", CFSTR("}>"));
  if (!(v13 | v16))
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), &stru_1E43EA7B0, 0, 0, objc_msgSend(v2, "length"));
  v27 = (void *)objc_msgSend(v2, "copy");

  return v27;
}

- (id)msv_underlyingError
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "underlyingErrors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)msv_analyticSignature
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    v4 = v3;
    v5 = *MEMORY[0x1E0CB2F70];
    v15 = *MEMORY[0x1E0CB3388];
    while (1)
    {
      objc_msgSend(v4, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("%@-%lld"), v6, objc_msgSend(v4, "code"));

      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if ((_NSIsNSArray() & 1) == 0)
      {

        v8 = 0;
      }
      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
        break;
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v4;
        v4 = v9;
      }
      else
      {
        objc_msgSend(v4, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v15);
        v12 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v12;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      objc_msgSend(v2, "appendString:", CFSTR(">"));

      if (!v4)
        return v2;
    }
    objc_msgSend(v2, "appendString:", CFSTR("["));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__NSError_MSVErrorAdditions__msv_analyticSignature__block_invoke;
    v16[3] = &unk_1E43E8DC0;
    v13 = v2;
    v17 = v13;
    v8 = v8;
    v18 = v8;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
    objc_msgSend(v13, "appendString:", CFSTR("]"));

    v4 = v17;
LABEL_13:

  }
  return v2;
}

- (id)msv_signature
{
  int *v4;
  id v5;
  char *v6;
  size_t v7;
  int v8;
  int v9;
  char *v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int32 v48;
  void *v49;
  void *v50;
  uint64_t *v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unint64_t v59;
  unsigned __int32 v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t *v71;
  ldiv_t v72;
  uint64_t v73;
  char *v74;
  const UInt8 *v75;
  unsigned __int8 *v76;
  char *v77;
  char *v78;
  uint64_t m;
  unsigned int v80;
  char *v81;
  id v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  _BYTE *v87;
  unint64_t v88;
  unsigned __int8 *v89;
  char *v90;
  char *v91;
  uint64_t j;
  unsigned int v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t quot;
  lldiv_t v98;
  uint64_t v99;
  CFStringRef v100;
  unsigned __int8 *v101;
  char *v102;
  char *v103;
  uint64_t k;
  unsigned int v105;
  char *v106;
  char *v107;
  uint64_t v108;
  _BYTE *v109;
  unint64_t v110;
  unsigned __int8 *v111;
  char *v112;
  char *v113;
  uint64_t i;
  unsigned int v115;
  char *v116;
  __CFString *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  ldiv_t v121;
  uint64_t v122;
  const UInt8 *v123;
  __CFString *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  id v135;
  void *v137;
  void *v138;
  _QWORD v139[6];
  __int128 v140;
  uint32x4_t v141;
  uint64_t v142;
  uint64_t v143;
  _OWORD v144[10];
  uint64_t v145;
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _BYTE v149[72];
  __int128 v150;
  _OWORD v151[3];
  uint64_t v152;
  _QWORD v153[3];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v145 = 0;
  memset(v144, 0, sizeof(v144));
  v140 = xmmword_1A07D4D00;
  v141.i64[0] = 0x85EBCA7724234428;
  v141.i64[1] = 0x61C8864F00000000;
  v4 = (int *)&v142;
  v142 = 0;
  v143 = 0;
  LODWORD(v144[0]) = 0;
  objc_msgSend(a1, "domain");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (char *)objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "length");
  if (v6)
  {
    v8 = v7;
    DWORD2(v140) = v7;
    HIDWORD(v140) = v7 > 0xF;
    if (v7 <= 0xF)
    {
      memcpy(&v142, v6, v7);
      v9 = LODWORD(v144[0]) + v8;
LABEL_10:
      LODWORD(v144[0]) = v9;
      goto LABEL_11;
    }
    v10 = &v6[v7];
    v11 = (unint64_t)&v6[v7 - 16];
    if ((unint64_t)v6 <= v11)
    {
      v12 = 0;
      v13 = 1640531535;
      v14 = 606290984;
      v15 = -2048144777;
      do
      {
        HIDWORD(v16) = v14 - 2048144777 * *(_DWORD *)v6;
        LODWORD(v16) = HIDWORD(v16);
        v14 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v15 - 2048144777 * *((_DWORD *)v6 + 1);
        LODWORD(v16) = HIDWORD(v16);
        v15 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v12 - 2048144777 * *((_DWORD *)v6 + 2);
        LODWORD(v16) = HIDWORD(v16);
        v12 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v13 - 2048144777 * *((_DWORD *)v6 + 3);
        LODWORD(v16) = HIDWORD(v16);
        v13 = -1640531535 * (v16 >> 19);
        v6 += 16;
      }
      while ((unint64_t)v6 <= v11);
      v141.i64[0] = __PAIR64__(v15, v14);
      v141.i64[1] = __PAIR64__(v13, v12);
    }
    if (v6 < v10)
    {
      v9 = (_DWORD)v10 - (_DWORD)v6;
      __memcpy_chk();
      goto LABEL_10;
    }
  }
LABEL_11:

  memset(&v149[8], 0, 64);
  *(_QWORD *)v149 = v140;
  if ((uint64_t)v140 <= 3000)
  {
    if ((uint64_t)v140 <= 1999)
    {
      if (!(_QWORD)v140)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_58;
      }
      if ((_QWORD)v140 != 1000)
        goto LABEL_58;
      v17 = (*((_QWORD *)&v140 + 1) + v141.i64[0]) ^ __ROR8__(v141.i64[0], 51);
      v18 = v141.i64[1] + (v142 ^ v143);
      v19 = __ROR8__(v142 ^ v143, 48);
      v20 = (v18 ^ v19) + __ROR8__(*((_QWORD *)&v140 + 1) + v141.i64[0], 32);
      v21 = v20 ^ __ROR8__(v18 ^ v19, 43);
      v22 = v18 + v17;
      v23 = v22 ^ __ROR8__(v17, 47);
      v24 = (v20 ^ v143) + v23;
      v25 = v24 ^ __ROR8__(v23, 51);
      v26 = (__ROR8__(v22, 32) ^ 0xFFLL) + v21;
      v27 = __ROR8__(v21, 48);
      v28 = __ROR8__(v24, 32) + (v26 ^ v27);
      v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
      v30 = v25 + v26;
      v31 = v30 ^ __ROR8__(v25, 47);
      v32 = v31 + v28;
      v33 = v32 ^ __ROR8__(v31, 51);
      v34 = __ROR8__(v30, 32) + v29;
      v35 = __ROR8__(v29, 48);
      v36 = __ROR8__(v32, 32) + (v34 ^ v35);
      v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
      v38 = v33 + v34;
      v39 = v38 ^ __ROR8__(v33, 47);
      v40 = v39 + v36;
      v41 = v40 ^ __ROR8__(v39, 51);
      v42 = __ROR8__(v38, 32) + v37;
      v43 = __ROR8__(v37, 48);
      v44 = __ROR8__(v40, 32) + (v42 ^ v43);
      v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
      v46 = v41 + v42;
      *((_QWORD *)&v140 + 1) = v44;
      v141.i64[0] = v46 ^ __ROR8__(v41, 47);
      v141.i64[1] = __ROR8__(v46, 32);
      v142 = v45;
      v47 = v141.i64[0] ^ v44 ^ v141.i64[1] ^ v45;
      goto LABEL_45;
    }
    if ((_QWORD)v140 != 2000)
    {
      if ((_QWORD)v140 != 3000)
        goto LABEL_58;
      if (HIDWORD(v140))
        v48 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v141, (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(v141, (uint32x4_t)xmmword_1A07D4D10)));
      else
        v48 = v141.i32[2] + 374761393;
      v60 = DWORD2(v140) + v48;
      v61 = v144[0] & 0xF;
      if (v61 >= 4)
      {
        do
        {
          v62 = *v4++;
          HIDWORD(v63) = v60 - 1028477379 * v62;
          LODWORD(v63) = HIDWORD(v63);
          v60 = 668265263 * (v63 >> 15);
          v61 -= 4;
        }
        while (v61 > 3);
      }
      for (; v61; --v61)
      {
        v64 = *(unsigned __int8 *)v4;
        v4 = (int *)((char *)v4 + 1);
        HIDWORD(v65) = v60 + 374761393 * v64;
        LODWORD(v65) = HIDWORD(v65);
        v60 = -1640531535 * (v65 >> 21);
      }
      v66 = (-2048144777 * (v60 ^ (v60 >> 15))) ^ ((-2048144777 * (v60 ^ (v60 >> 15))) >> 13);
      v67 = (-1028477379 * v66) ^ ((-1028477379 * v66) >> 16);
      goto LABEL_57;
    }
    switch(v141.u8[3])
    {
      case 1u:
        v53 = v141.u8[0];
        break;
      case 2u:
        v53 = v141.u16[0];
        break;
      case 3u:
        v53 = v141.u16[0] | (v141.u8[2] << 16);
        break;
      default:
        v68 = DWORD2(v140);
        goto LABEL_56;
    }
    v68 = (461845907 * ((380141568 * v53) | ((-862048943 * v53) >> 17))) ^ DWORD2(v140);
LABEL_56:
    v69 = -2048144789 * (v68 ^ HIDWORD(v140) ^ ((v68 ^ HIDWORD(v140)) >> 16));
    v67 = (-1028477387 * (v69 ^ (v69 >> 13))) ^ ((-1028477387 * (v69 ^ (v69 >> 13))) >> 16);
    DWORD2(v140) = v67;
LABEL_57:
    *(_DWORD *)&v149[8] = v67;
    goto LABEL_58;
  }
  if ((uint64_t)v140 > 4000)
  {
    switch((_QWORD)v140)
    {
      case 0xFA1:
        CC_SHA1_Final(&v149[8], (CC_SHA1_CTX *)((char *)&v140 + 8));
        break;
      case 0x10A0:
        CC_SHA256_Final(&v149[8], (CC_SHA256_CTX *)((char *)&v140 + 8));
        break;
      case 0x11A0:
        CC_SHA512_Final(&v149[8], (CC_SHA512_CTX *)((char *)&v140 + 8));
        break;
    }
    goto LABEL_58;
  }
  if ((_QWORD)v140 == 3001)
  {
    v51 = (uint64_t *)v144;
    if (*((_QWORD *)&v140 + 1) < 0x20uLL)
      v52 = v142 + 0x27D4EB2F165667C5;
    else
      v52 = 0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((__ROR8__(v141.i64[1], 57) + __ROR8__(v141.i64[0], 63) + __ROR8__(v142, 52) + __ROR8__(v143, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v141.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v141.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v142, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v143, 33)));
    v54 = v52 + *((_QWORD *)&v140 + 1);
    v55 = BYTE8(v140) & 0x1F;
    if (v55 >= 8)
    {
      do
      {
        v56 = *v51++;
        v54 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v56, 33)) ^ v54, 37);
        v55 -= 8;
      }
      while (v55 > 7);
    }
    if (v55 >= 4)
    {
      v57 = *(_DWORD *)v51;
      v51 = (uint64_t *)((char *)v51 + 4);
      v54 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v57) ^ v54, 41);
      v55 -= 4;
    }
    for (; v55; --v55)
    {
      v58 = *(unsigned __int8 *)v51;
      v51 = (uint64_t *)((char *)v51 + 1);
      v54 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v58) ^ v54, 53);
    }
    v59 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v54 ^ (v54 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v54 ^ (v54 >> 33))) >> 29));
    v47 = v59 ^ HIDWORD(v59);
LABEL_45:
    *(_QWORD *)&v149[8] = v47;
    goto LABEL_58;
  }
  if ((_QWORD)v140 == 4000)
    CC_MD5_Final(&v149[8], (CC_MD5_CTX *)((char *)&v140 + 8));
LABEL_58:
  v150 = *(_OWORD *)v149;
  v151[0] = *(_OWORD *)&v149[16];
  v151[1] = *(_OWORD *)&v149[32];
  v151[2] = *(_OWORD *)&v149[48];
  v152 = *(_QWORD *)&v149[64];
  if (*(uint64_t *)v149 > 3999)
  {
    if (*(uint64_t *)v149 > 4255)
    {
      if (*(_QWORD *)v149 == 4256)
      {
        v111 = (unsigned __int8 *)&v150 + 8;
        v112 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v113 = v112;
        for (i = 0; i != 64; i += 2)
        {
          v115 = *v111++;
          v116 = &v112[i];
          *v116 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v115 >> 4];
          v116[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v115 & 0xF];
        }
        v82 = objc_alloc(MEMORY[0x1E0CB3940]);
        v83 = v113;
        v84 = 64;
      }
      else
      {
        if (*(_QWORD *)v149 != 4512)
          goto LABEL_117;
        v89 = (unsigned __int8 *)&v150 + 8;
        v90 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v91 = v90;
        for (j = 0; j != 128; j += 2)
        {
          v93 = *v89++;
          v94 = &v90[j];
          *v94 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v93 >> 4];
          v94[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v93 & 0xF];
        }
        v82 = objc_alloc(MEMORY[0x1E0CB3940]);
        v83 = v91;
        v84 = 128;
      }
    }
    else if (*(_QWORD *)v149 == 4000)
    {
      v101 = (unsigned __int8 *)&v150 + 8;
      v102 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v103 = v102;
      for (k = 0; k != 32; k += 2)
      {
        v105 = *v101++;
        v106 = &v102[k];
        *v106 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v105 >> 4];
        v106[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v105 & 0xF];
      }
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      v83 = v103;
      v84 = 32;
    }
    else
    {
      if (*(_QWORD *)v149 != 4001)
        goto LABEL_117;
      v76 = (unsigned __int8 *)&v150 + 8;
      v77 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v78 = v77;
      for (m = 0; m != 40; m += 2)
      {
        v80 = *v76++;
        v81 = &v77[m];
        *v81 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v80 >> 4];
        v81[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v80 & 0xF];
      }
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      v83 = v78;
      v84 = 40;
    }
LABEL_102:
    v100 = (CFStringRef)objc_msgSend(v82, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v83, v84, 4, 1);
    goto LABEL_103;
  }
  if (*(uint64_t *)v149 > 2999)
  {
    if (*(_QWORD *)v149 == 3000)
    {
      LODWORD(v153[0]) = bswap32(DWORD2(v150));
      v107 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v108 = 0;
      v109 = v107 + 1;
      do
      {
        v110 = *((unsigned __int8 *)v153 + v108);
        *(v109 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v110 >> 4];
        *v109 = MSVFastHexStringFromBytes_hexCharacters_3379[v110 & 0xF];
        v109 += 2;
        ++v108;
      }
      while (v108 != 4);
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      v83 = v107;
      v84 = 8;
    }
    else
    {
      if (*(_QWORD *)v149 != 3001)
        goto LABEL_117;
      v153[0] = bswap64(*((unint64_t *)&v150 + 1));
      v85 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v86 = 0;
      v87 = v85 + 1;
      do
      {
        v88 = *((unsigned __int8 *)v153 + v86);
        *(v87 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v88 >> 4];
        *v87 = MSVFastHexStringFromBytes_hexCharacters_3379[v88 & 0xF];
        v87 += 2;
        ++v86;
      }
      while (v86 != 8);
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      v83 = v85;
      v84 = 16;
    }
    goto LABEL_102;
  }
  if (*(_QWORD *)v149 == 1000)
  {
    v95 = *((_QWORD *)&v150 + 1);
    v96 = (char *)&v154 + 1;
    quot = *((_QWORD *)&v150 + 1);
    do
    {
      v98 = lldiv(quot, 10);
      quot = v98.quot;
      if (v98.rem >= 0)
        LOBYTE(v99) = v98.rem;
      else
        v99 = -v98.rem;
      *(v96 - 2) = v99 + 48;
      v75 = (const UInt8 *)(v96 - 2);
      --v96;
    }
    while (v98.quot);
    if (v95 < 0)
    {
      *(v96 - 2) = 45;
      v75 = (const UInt8 *)(v96 - 2);
    }
    v74 = (char *)((char *)&v154 - (char *)v75);
    goto LABEL_92;
  }
  if (*(_QWORD *)v149 != 2000)
  {
LABEL_117:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "handleFailureInFunction:file:lineNumber:description:", v138, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v117 = &stru_1E43EA7B0;
    goto LABEL_104;
  }
  v70 = DWORD2(v150);
  v71 = &v154;
  do
  {
    v72 = ldiv(v70, 10);
    v70 = v72.quot;
    if (v72.rem >= 0)
      LOBYTE(v73) = v72.rem;
    else
      v73 = -v72.rem;
    *((_BYTE *)v71 - 1) = v73 + 48;
    v71 = (uint64_t *)((char *)v71 - 1);
  }
  while (v72.quot);
  v74 = (char *)((char *)&v154 - (char *)v71);
  v75 = (const UInt8 *)v71;
LABEL_92:
  v100 = CFStringCreateWithBytes(0, v75, (CFIndex)v74, 0x8000100u, 0);
LABEL_103:
  v117 = (__CFString *)v100;
LABEL_104:
  v148[0] = v117;
  v118 = objc_msgSend(a1, "code");
  v119 = v118;
  v120 = (char *)v151 + 9;
  do
  {
    v121 = ldiv(v118, 10);
    v118 = v121.quot;
    if (v121.rem >= 0)
      LOBYTE(v122) = v121.rem;
    else
      v122 = -v121.rem;
    *(v120 - 2) = v122 + 48;
    v123 = (const UInt8 *)(v120 - 2);
    --v120;
  }
  while (v121.quot);
  if (v119 < 0)
  {
    *(v120 - 2) = 45;
    v123 = (const UInt8 *)(v120 - 2);
  }
  v124 = (__CFString *)CFStringCreateWithBytes(0, v123, (char *)v151 + 8 - (char *)v123, 0x8000100u, 0);
  v148[1] = v124;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "componentsJoinedByString:", CFSTR(":"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "underlyingErrors");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = MEMORY[0x1E0C809B0];
  v139[1] = 3221225472;
  v139[2] = __43__NSError_MSVErrorAdditions__msv_signature__block_invoke;
  v139[3] = &unk_1E43E8DE8;
  v139[4] = a1;
  v139[5] = a2;
  objc_msgSend(v127, "msv_map:", v139);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v128, "count") == 1)
  {
    v147[0] = v126;
    objc_msgSend(v128, "firstObject");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v147[1] = v129;
    v130 = v147;
LABEL_115:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "componentsJoinedByString:", CFSTR("/"));
    v134 = objc_claimAutoreleasedReturnValue();

    v126 = (void *)v134;
    goto LABEL_116;
  }
  if ((unint64_t)objc_msgSend(v128, "count") >= 2)
  {
    v131 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v128, "componentsJoinedByString:", CFSTR(","));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "stringWithFormat:", CFSTR("[%@]"), v132);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    v146[0] = v126;
    v146[1] = v129;
    v130 = v146;
    goto LABEL_115;
  }
LABEL_116:
  v135 = v126;

  return v135;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, a5, 0, 0, a6, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, 0, a5, a6, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:userInfo:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, a5, 0, a6, a7, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, a5, 0, a6, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:userInfo:debugDescription:
{
  objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, a5, a6, a7, &a9, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation NSError(DMCUtilities)

+ (uint64_t)DMCErrorWithDomain:()DMCUtilities code:descriptionArray:errorType:
{
  return objc_msgSend(a1, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", a3, a4, a5, 0, 0, 0, a6);
}

+ (uint64_t)DMCErrorWithDomain:()DMCUtilities code:descriptionArray:underlyingError:errorType:
{
  return objc_msgSend(a1, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", a3, a4, a5, 0, 0, a6, a7);
}

+ (uint64_t)DMCErrorWithDomain:()DMCUtilities code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:
{
  return objc_msgSend(a1, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:addtionalUserInfo:", a9, 0);
}

+ (id)DMCErrorWithDomain:()DMCUtilities code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:addtionalUserInfo:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v35;

  v34 = a4;
  v35 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    DMCLocalizedString(CFSTR("UNKNOWN_ERROR"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v28, *MEMORY[0x1E0CB2D50]);

    DMCUSEnglishString(CFSTR("UNKNOWN_ERROR"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("USEnglishDescription");
    goto LABEL_7;
  }
  objc_msgSend(v14, "objectAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v14, "objectAtIndex:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if ((v24 & 1) == 0)
  {
    objc_msgSend(v14, "objectAtIndex:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v25, CFSTR("USEnglishDescription"));

  }
  if ((unint64_t)objc_msgSend(v14, "count", v34) >= 3)
  {
    objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("descriptionParameters");
LABEL_7:
    objc_msgSend(v20, "setObject:forKey:", v26, v27, v34);

  }
  if (!v15)
  {
    if (!v17)
      goto LABEL_20;
    objc_msgSend(v17, "DMCFindPrimaryError");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
      v29 = v17;
    objc_msgSend(v29, "localizedDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v30, *MEMORY[0x1E0CB2D80]);

    objc_msgSend(v29, "DMCUSEnglishDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      objc_msgSend(v20, "setObject:forKey:", v31, CFSTR("USEnglishSuggestion"));

    goto LABEL_19;
  }
  objc_msgSend(v20, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D80]);
  if (v16)
    objc_msgSend(v20, "setObject:forKey:", v16, CFSTR("USEnglishSuggestion"));
  if (v17)
LABEL_19:
    objc_msgSend(v20, "setObject:forKey:", v17, *MEMORY[0x1E0CB3388]);
LABEL_20:
  if (v18)
    objc_msgSend(v20, "setObject:forKey:", v18, CFSTR("DMCErrorType"));
  if (v19)
    objc_msgSend(v20, "addEntriesFromDictionary:", v19);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v35, v34, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)DMCUSEnglishDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("USEnglishDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)DMCUSEnglishSuggestion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("USEnglishSuggestion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)DMCErrorType
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("DMCErrorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)DMCVerboseDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "localizedDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v5, "appendFormat:", CFSTR("Desc   : %@\n"), v6);
  objc_msgSend(a1, "localizedRecoverySuggestion");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR("Sugg   : %@\n"), v8);
  objc_msgSend(a1, "DMCUSEnglishDescription");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v5, "appendFormat:", CFSTR("US Desc: %@\n"), v10);
  v27 = v7;
  objc_msgSend(a1, "DMCUSEnglishSuggestion");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v5, "appendFormat:", CFSTR("US Sugg: %@\n"), v12);
  objc_msgSend(a1, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Domain : %@\nCode   : %d\n"), v14, objc_msgSend(a1, "code"));

  objc_msgSend(a1, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("DMCErrorType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v5, "appendFormat:", CFSTR("Type   : %@\n"), v16);
  v26 = v9;
  objc_msgSend(a1, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("descriptionParameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v5, "appendFormat:", CFSTR("Params : %@\n"), v18);
  objc_msgSend(a1, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "DMCVerboseDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("...Underlying error:\n%@"), v22);

  }
  objc_msgSend(a1, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "removeObjectForKey:", *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v24, "removeObjectForKey:", *MEMORY[0x1E0CB2D80]);
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("USEnglishDescription"));
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("USEnglishSuggestion"));
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("DMCErrorType"));
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("descriptionParameters"));
  objc_msgSend(v24, "removeObjectForKey:", v20);
  if (objc_msgSend(v24, "count"))
    objc_msgSend(v5, "appendFormat:", CFSTR("Extra info:\n%@"), v24);

  return v5;
}

- (id)DMCFindPrimaryError
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    while (1)
    {
      objc_msgSend(v3, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("isPrimary"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v5, "BOOLValue"))
            break;
        }
      }
      objc_msgSend(v3, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v2);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
      if (!v7)
        goto LABEL_6;
    }
    v8 = v3;

  }
  else
  {
LABEL_6:
    v8 = 0;
  }

  return v8;
}

- (uint64_t)DMCContainsErrorDomain:()DMCUtilities code:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a1;
  if (v7)
  {
    v8 = v7;
    v9 = *MEMORY[0x1E0CB3388];
    do
    {
      objc_msgSend(v8, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v6))
      {
        v11 = objc_msgSend(v8, "code");

        if (v11 == a4)
        {
          v14 = 1;
          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v13;
    }
    while (v13);
    v14 = 0;
LABEL_10:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)DMCCopyAsPrimaryError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isPrimary"));

  v5 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v3);
  v7 = objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

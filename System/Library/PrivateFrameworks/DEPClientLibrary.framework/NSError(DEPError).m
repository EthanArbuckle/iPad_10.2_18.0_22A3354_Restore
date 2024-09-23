@implementation NSError(DEPError)

+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:errorType:
{
  return objc_msgSend(a1, "DEPErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", a3, a4, a5, 0, 0, 0, a6);
}

+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:underlyingError:errorType:
{
  return objc_msgSend(a1, "DEPErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", a3, a4, a5, 0, 0, a6, a7);
}

+ (id)DEPErrorWithDomain:()DEPError code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    DEPLocalizedString(CFSTR("UNKNOWN_ERROR"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v30, *MEMORY[0x1E0CB2D50]);

    DEPUSEnglishString(CFSTR("UNKNOWN_ERROR"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CFSTR("USEnglishDescription");
    goto LABEL_7;
  }
  v38 = v17;
  v21 = v14;
  v22 = a4;
  objc_msgSend(v15, "objectAtIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v23, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v15, "objectAtIndex:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if ((v26 & 1) == 0)
  {
    objc_msgSend(v15, "objectAtIndex:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v27, CFSTR("USEnglishDescription"));

  }
  a4 = v22;
  v14 = v21;
  v17 = v38;
  if ((unint64_t)objc_msgSend(v15, "count") >= 3)
  {
    objc_msgSend(v15, "subarrayWithRange:", 2, objc_msgSend(v15, "count") - 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CFSTR("descriptionParameters");
LABEL_7:
    objc_msgSend(v20, "setObject:forKey:", v28, v29);

  }
  if (!v16)
  {
    if (!v18)
      goto LABEL_20;
    v39 = v17;
    v31 = v14;
    v32 = a4;
    objc_msgSend(v18, "DEPFindPrimaryError");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
      v33 = v18;
    objc_msgSend(v33, "localizedDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v34, *MEMORY[0x1E0CB2D80]);

    objc_msgSend(v33, "DEPUSEnglishDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(v20, "setObject:forKey:", v35, CFSTR("USEnglishSuggestion"));

    a4 = v32;
    v14 = v31;
    v17 = v39;
    goto LABEL_19;
  }
  objc_msgSend(v20, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D80]);
  if (v17)
    objc_msgSend(v20, "setObject:forKey:", v17, CFSTR("USEnglishSuggestion"));
  if (v18)
LABEL_19:
    objc_msgSend(v20, "setObject:forKey:", v18, *MEMORY[0x1E0CB3388]);
LABEL_20:
  if (v19)
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("DEPErrorType"));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, a4, v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)DEPUSEnglishDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("USEnglishDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)DEPFindPrimaryError
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

@end

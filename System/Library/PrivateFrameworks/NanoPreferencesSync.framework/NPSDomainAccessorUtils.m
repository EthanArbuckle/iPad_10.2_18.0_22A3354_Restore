@implementation NPSDomainAccessorUtils

+ (id)stringForObject:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "stringValue");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

    v3 = (id)v4;
  }
  return v3;
}

+ (id)arrayForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)dictionaryForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)dataForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)stringArrayForObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    v6 = v4;
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v6 = 0;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
      v6 = v4;
    }
LABEL_13:

    return v6;
  }
  else
  {

    return 0;
  }
}

+ (int64_t)integerForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v6 = objc_msgSend(v5, "integerValue");
    if (a4)
    {
      v7 = 1;
LABEL_8:
      *a4 = v7;
    }
  }
  else
  {
    v6 = 0;
    if (a4)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }

  return v6;
}

+ (int64_t)longForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v6 = objc_msgSend(v5, "longLongValue");
    if (a4)
    {
      v7 = 1;
LABEL_8:
      *a4 = v7;
    }
  }
  else
  {
    v6 = 0;
    if (a4)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }

  return v6;
}

+ (float)floatForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5;
  float v6;
  float v7;
  BOOL v8;

  v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    if (a4)
    {
      v8 = 1;
LABEL_8:
      *a4 = v8;
    }
  }
  else
  {
    v7 = 0.0;
    if (a4)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }

  return v7;
}

+ (double)doubleForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5;
  double v6;
  double v7;
  BOOL v8;

  v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    if (a4)
    {
      v8 = 1;
LABEL_8:
      *a4 = v8;
    }
  }
  else
  {
    v7 = 0.0;
    if (a4)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }

  return v7;
}

+ (BOOL)BOOLForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  char v7;
  BOOL v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "length");
    if (objc_msgSend(v5, "compare:options:range:", CFSTR("YES"), 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", CFSTR("Y"), 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", CFSTR("true"), 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", CFSTR("1"), 1, 0, v6))
    {
      if (!objc_msgSend(v5, "compare:options:range:", CFSTR("NO"), 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", CFSTR("N"), 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", CFSTR("false"), 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", CFSTR("0"), 1, 0, v6))
      {
        v7 = 0;
        if (!a4)
          goto LABEL_17;
        goto LABEL_14;
      }
LABEL_18:
      v8 = 0;
      v7 = 0;
      if (!a4)
        goto LABEL_17;
      goto LABEL_16;
    }
    v8 = 1;
    v7 = 1;
    if (a4)
      goto LABEL_16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v7 = objc_msgSend(v5, "BOOLValue");
    if (a4)
    {
LABEL_14:
      v8 = 1;
LABEL_16:
      *a4 = v8;
    }
  }
LABEL_17:

  return v7;
}

+ (id)URLForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSClassFromString(CFSTR("NSData"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v3 = v3;
    v12 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
    if (v6)
    {
      v7 = (void *)nps_daemon_log;
      if (os_log_type_enabled((os_log_t)nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = objc_msgSend(v3, "length");
        *(_DWORD *)buf = 134217984;
        v14 = v9;
        _os_log_impl(&dword_1B5280000, v8, OS_LOG_TYPE_DEFAULT, "URL unarchiving fail from %ld bytes of data", buf, 0xCu);

      }
    }
  }
  else
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
      return v5;
    }
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "stringByExpandingTildeInPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)objectForURL:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  uint64_t *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isFileURL") & 1) != 0)
  {
    if (!objc_msgSend(v3, "isFileReferenceURL"))
    {
      objc_msgSend(v3, "absoluteURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAbbreviatingWithTildeInPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      goto LABEL_10;
    }
    v4 = (void *)MEMORY[0x1E0CB36F8];
    v13 = 0;
    v5 = (id *)&v13;
    v6 = &v13;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB36F8];
    v14 = 0;
    v5 = (id *)&v14;
    v6 = &v14;
  }
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, v6, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (v8)
  {
    v9 = v8;
    v10 = nps_daemon_log;
    if (os_log_type_enabled((os_log_t)nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "URL archiving of %@ returned error %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

@end

@implementation DESJSONPredicate

+ (id)parseJSON:(id)a3
{
  const char *v3;
  const char *v4;
  size_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = v3;
  if (v3)
    v5 = strlen(v3);
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, v5);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (!v7)
    NSLog(CFSTR("parse error: %@"), v8);

  return v7;
}

+ (id)fetchObjectAtPath:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  unsigned int v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        if (!v12)
          goto LABEL_17;
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", v13);
          v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_17;
          v14 = v12;
          v15 = objc_msgSend(v13, "intValue", (_QWORD)v19);
          v16 = objc_msgSend(v14, "count");
          if ((v15 & 0x80000000) != 0 || (int)v15 >= v16)
          {

LABEL_17:
            v17 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v14, "objectAtIndex:", v15);
          v6 = (id)objc_claimAutoreleasedReturnValue();

        }
        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = v6;
  v17 = v12;
LABEL_18:

  return v17;
}

+ (id)parsePath:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  if (objc_msgSend(v3, "length"))
  {
    v14 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "stringByReplacingOccurrencesOfString:withString:", CFSTR("~1"), CFSTR("/"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~0"), CFSTR("~"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v3 = v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

+ (BOOL)evaluateDefOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("op"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (v9 == 0) ^ objc_msgSend(CFSTR("defined"), "isEqualToString:", v10);

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (BOOL)evaluateStringOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("op"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v12;
      if (objc_msgSend(v7, "hasSuffix:", CFSTR("-")))
      {
        objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "uppercaseString");
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "uppercaseString");
        v17 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v17;
        v7 = (void *)v15;
        v14 = (void *)v16;
      }
      if (objc_msgSend(CFSTR("starts"), "isEqualToString:", v7))
      {
        v18 = objc_msgSend(v14, "hasPrefix:", v9);
      }
      else if (objc_msgSend(CFSTR("ends"), "isEqualToString:", v7))
      {
        v18 = objc_msgSend(v14, "hasSuffix:", v9);
      }
      else if (objc_msgSend(CFSTR("contains"), "isEqualToString:", v7))
      {
        v18 = objc_msgSend(v14, "containsString:", v9);
      }
      else
      {
        if (!objc_msgSend(CFSTR("test"), "isEqualToString:", v7))
        {
          v13 = 0;
          goto LABEL_20;
        }
        v18 = objc_msgSend(v14, "isEqualToString:", v9);
      }
      v13 = v18;
LABEL_20:

      goto LABEL_21;
    }
  }
  v13 = 0;
LABEL_22:

  return v13;
}

+ (BOOL)evaluateRegexOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("op"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v11, v5);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;
        v16 = objc_msgSend(v7, "hasSuffix:", CFSTR("-"));
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v9, v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "numberOfMatchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length")) != 0;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)evaluateNumericOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("op"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v11, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v13 = v12;
      if ((objc_msgSend(CFSTR("less"), "isEqualToString:", v7) & 1) != 0)
      {
        v14 = -1;
      }
      else
      {
        if (!objc_msgSend(CFSTR("more"), "isEqualToString:", v7))
        {
          v10 = 0;
          goto LABEL_14;
        }
        v14 = 1;
      }
      v10 = objc_msgSend(v13, "compare:", v9) == v14;
LABEL_14:

      goto LABEL_15;
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

+ (BOOL)_testStrings:(id)a3 test:(id)a4 caseInsensitive:(BOOL)a5
{
  if (a5)
    return objc_msgSend(a3, "caseInsensitiveCompare:", a4) == 0;
  else
    return objc_msgSend(a3, "isEqualToString:", a4);
}

+ (BOOL)evaluateArrayOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  void *v20;
  id v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("op"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v11, "isEqualToString:", CFSTR("in-"));

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
      {
        v14 = v13;
        v20 = v9;
        v21 = v6;
        v15 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (+[DESJSONPredicate _testStrings:test:caseInsensitive:](DESJSONPredicate, "_testStrings:test:caseInsensitive:", v10, v17, v22))
              {
                goto LABEL_18;
              }
            }
            else if ((objc_msgSend(v17, "isEqual:", v10) & 1) != 0)
            {
LABEL_18:
              v18 = 1;
              goto LABEL_19;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            continue;
          break;
        }
        v18 = 0;
LABEL_19:
        v9 = v20;
        v6 = v21;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)isNumber:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFGetTypeID(v3);
    v5 = v4 != CFBooleanGetTypeID();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isBoolean:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFGetTypeID(v3);
    v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)obj:(id)a3 matchesRegex:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v6, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "count") == 1)
        v11 = -1;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

+ (BOOL)isDate:(id)a3
{
  return +[DESJSONPredicate obj:matchesRegex:](DESJSONPredicate, "obj:matchesRegex:", a3, CFSTR("^[0-9]{4}-[01][0-9]-[0-3][0-9]$"));
}

+ (BOOL)isDateTime:(id)a3
{
  return +[DESJSONPredicate obj:matchesRegex:](DESJSONPredicate, "obj:matchesRegex:", a3, CFSTR("^[0-9]{4}-[01][0-9]-[0-3][0-9][Tt][0-2][0-9]:[0-5][0-9]:[0-6][0-9](\\.[0-9]+)?([Zz]|[-+][0-1][0-9]:[0-5][0-9])$"));
}

+ (BOOL)isTime:(id)a3
{
  return +[DESJSONPredicate obj:matchesRegex:](DESJSONPredicate, "obj:matchesRegex:", a3, CFSTR("^[0-2][0-9]:[0-5][0-9]:[0-6][0-9](\\.[0-9]+)?([Zz]|[-+][0-1][0-9]:[0-5][0-9])$"));
}

+ (BOOL)evaluateTypeOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char isKindOfClass;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("string")))
          goto LABEL_6;
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("number")))
        {
          isKindOfClass = +[DESJSONPredicate isNumber:](DESJSONPredicate, "isNumber:", v11);
          goto LABEL_14;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("BOOLean")))
        {
          isKindOfClass = +[DESJSONPredicate isBoolean:](DESJSONPredicate, "isBoolean:", v11);
          goto LABEL_14;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("object"))
          || objc_msgSend(v8, "isEqualToString:", CFSTR("array"))
          || objc_msgSend(v8, "isEqualToString:", CFSTR("null")))
        {
LABEL_6:
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
LABEL_14:
          v9 = isKindOfClass;
          goto LABEL_20;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("undefined")) & 1) == 0)
        {
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("date")))
          {
            isKindOfClass = +[DESJSONPredicate isDate:](DESJSONPredicate, "isDate:", v11);
            goto LABEL_14;
          }
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("date-time")))
          {
            isKindOfClass = +[DESJSONPredicate isDateTime:](DESJSONPredicate, "isDateTime:", v11);
            goto LABEL_14;
          }
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("time")))
          {
            isKindOfClass = +[DESJSONPredicate isTime:](DESJSONPredicate, "isTime:", v11);
            goto LABEL_14;
          }
        }
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("undefined")) & 1) != 0)
      {
        v9 = 1;
LABEL_20:

        goto LABEL_21;
      }
      v9 = 0;
      goto LABEL_20;
    }
    v9 = 0;
  }
LABEL_21:

  return v9 & 1;
}

+ (BOOL)evaluateAnd:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!+[DESJSONPredicate evaluatePredicate:onObj:](DESJSONPredicate, "evaluatePredicate:onObj:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (BOOL)evaluateOr:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if (+[DESJSONPredicate evaluatePredicate:onObj:](DESJSONPredicate, "evaluatePredicate:onObj:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v6, (_QWORD)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (BOOL)evaluateBoolOp:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("op"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("apply"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = v5;
      if (v8)
      {
        +[DESJSONPredicate parsePath:](DESJSONPredicate, "parsePath:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[DESJSONPredicate fetchObjectAtPath:from:](DESJSONPredicate, "fetchObjectAtPath:from:", v12, v11);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v13;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("and")))
      {
        v14 = +[DESJSONPredicate evaluateAnd:onObj:](DESJSONPredicate, "evaluateAnd:onObj:", v10, v11);
      }
      else
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("not")))
        {
          v15 = !+[DESJSONPredicate evaluateAnd:onObj:](DESJSONPredicate, "evaluateAnd:onObj:", v10, v11);
LABEL_13:

          goto LABEL_14;
        }
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("or")))
        {
          LOBYTE(v15) = 0;
          goto LABEL_13;
        }
        v14 = +[DESJSONPredicate evaluateOr:onObj:](DESJSONPredicate, "evaluateOr:onObj:", v10, v11);
      }
      LOBYTE(v15) = v14;
      goto LABEL_13;
    }
  }
  LOBYTE(v15) = 0;
LABEL_14:

  return v15;
}

+ (BOOL)evaluateDict:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  if (evaluateDict_onObj__onceToken != -1)
    dispatch_once(&evaluateDict_onObj__onceToken, &__block_literal_global_1);
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("op"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)evaluateDict_onObj__BOOLOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateBoolOp:onObj:](DESJSONPredicate, "evaluateBoolOp:onObj:", v5, v6);
    }
    else if (objc_msgSend((id)evaluateDict_onObj__defOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateDefOp:onObj:](DESJSONPredicate, "evaluateDefOp:onObj:", v5, v6);
    }
    else if (objc_msgSend((id)evaluateDict_onObj__stringOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateStringOp:onObj:](DESJSONPredicate, "evaluateStringOp:onObj:", v5, v6);
    }
    else if (objc_msgSend((id)evaluateDict_onObj__regexOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateRegexOp:onObj:](DESJSONPredicate, "evaluateRegexOp:onObj:", v5, v6);
    }
    else if (objc_msgSend((id)evaluateDict_onObj__numericOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateNumericOp:onObj:](DESJSONPredicate, "evaluateNumericOp:onObj:", v5, v6);
    }
    else if (objc_msgSend((id)evaluateDict_onObj__arrayOps, "containsObject:", v9))
    {
      v10 = +[DESJSONPredicate evaluateArrayOp:onObj:](DESJSONPredicate, "evaluateArrayOp:onObj:", v5, v6);
    }
    else
    {
      if (!objc_msgSend((id)evaluateDict_onObj__typeOps, "containsObject:", v9))
      {
        v11 = 0;
        goto LABEL_20;
      }
      v10 = +[DESJSONPredicate evaluateTypeOp:onObj:](DESJSONPredicate, "evaluateTypeOp:onObj:", v5, v6);
    }
    v11 = v10;
LABEL_20:

    goto LABEL_21;
  }
  v11 = 1;
LABEL_21:

  return v11;
}

void __39__DESJSONPredicate_evaluateDict_onObj___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  const __CFString *v32;
  _QWORD v33[2];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v34[0] = CFSTR("and");
  v34[1] = CFSTR("not");
  v34[2] = CFSTR("or");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)evaluateDict_onObj__BOOLOps;
  evaluateDict_onObj__BOOLOps = v2;

  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v33[0] = CFSTR("defined");
  v33[1] = CFSTR("undefined");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithArray:", v5);
  v7 = (void *)evaluateDict_onObj__defOps;
  evaluateDict_onObj__defOps = v6;

  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v32 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "initWithArray:", v9);
  v11 = (void *)evaluateDict_onObj__typeOps;
  evaluateDict_onObj__typeOps = v10;

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v31[0] = CFSTR("in");
  v31[1] = CFSTR("in-");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initWithArray:", v13);
  v15 = (void *)evaluateDict_onObj__arrayOps;
  evaluateDict_onObj__arrayOps = v14;

  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v30[0] = CFSTR("less");
  v30[1] = CFSTR("more");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "initWithArray:", v17);
  v19 = (void *)evaluateDict_onObj__numericOps;
  evaluateDict_onObj__numericOps = v18;

  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29[0] = CFSTR("matches");
  v29[1] = CFSTR("matches-");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "initWithArray:", v21);
  v23 = (void *)evaluateDict_onObj__regexOps;
  evaluateDict_onObj__regexOps = v22;

  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v28[0] = CFSTR("contains");
  v28[1] = CFSTR("contains-");
  v28[2] = CFSTR("ends");
  v28[3] = CFSTR("ends-");
  v28[4] = CFSTR("starts");
  v28[5] = CFSTR("starts-");
  v28[6] = CFSTR("test");
  v28[7] = CFSTR("test-");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "initWithArray:", v25);
  v27 = (void *)evaluateDict_onObj__stringOps;
  evaluateDict_onObj__stringOps = v26;

}

+ (BOOL)evaluatePredicate:(id)a3 onObj:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[DESJSONPredicate evaluateDict:onObj:](DESJSONPredicate, "evaluateDict:onObj:", v5, v6);

  return v7;
}

+ (BOOL)evaluateJson:(id)a3 onJson:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[DESJSONPredicate parseJSON:](DESJSONPredicate, "parseJSON:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESJSONPredicate parseJSON:](DESJSONPredicate, "parseJSON:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = +[DESJSONPredicate evaluatePredicate:onObj:](DESJSONPredicate, "evaluatePredicate:onObj:", v6, v7);
  return (char)v5;
}

@end

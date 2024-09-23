@implementation NSHTTPCookie(AppleMediaServices)

- (uint64_t)ams_isCookieValidForBag
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR(".apple.com"));

  if (!v3)
    return 0;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("itspod")) & 1) != 0)
  {
    objc_msgSend(a1, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("100"));

    return v6 ^ 1u;
  }
  else
  {

    return 1;
  }
}

- (uint64_t)_domainMatchesURL:()AppleMediaServices
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "hasSuffix:", v9);

  return v10;
}

- (uint64_t)ams_matchesURL:()AppleMediaServices
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "_domainMatchesURL:", v4)
    && objc_msgSend(a1, "_pathMatchesURL:", v4)
    && objc_msgSend(a1, "_secureOnlyMatchesURL:", v4))
  {
    v5 = objc_msgSend(a1, "_httpOnlyMatchesURL:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_pathMatchesURL:()AppleMediaServices
{
  void *v3;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "path");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("/");
  }
  objc_msgSend(a1, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[__CFString hasPrefix:](v5, "hasPrefix:", v8);
    if (v9
      && (objc_msgSend(a1, "path"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v3, "hasSuffix:", CFSTR("/")) & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(a1, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString hasPrefix:](v5, "hasPrefix:", v10))
      {
        objc_msgSend(a1, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString substringFromIndex:](v5, "substringFromIndex:", objc_msgSend(v11, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v12, "hasPrefix:", CFSTR("/"));

        if ((v9 & 1) == 0)
          goto LABEL_13;
      }
      else
      {

        v7 = 0;
        if (!v9)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
    }

    goto LABEL_13;
  }
  v7 = 1;
LABEL_14:

  return v7;
}

- (uint64_t)_httpOnlyMatchesURL:()AppleMediaServices
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "isHTTPOnly"))
    v5 = objc_msgSend(v4, "ams_isHTTP");
  else
    v5 = 1;

  return v5;
}

- (uint64_t)_secureOnlyMatchesURL:()AppleMediaServices
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "isSecure"))
    v5 = objc_msgSend(v4, "ams_isSecure");
  else
    v5 = 1;

  return v5;
}

- (uint64_t)ams_isDeleted
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "expiresDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToDate:", v2);

  return v3;
}

- (BOOL)ams_isExpired
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "expiresDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "expiresDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4) != 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)ams_cookieByMarkingCookieAsDeleted:()AppleMediaServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0C92AA8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C92AB8]);

  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperties:", v4);
  return v6;
}

- (uint64_t)ams_isEqualToCookie:()AppleMediaServices
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;

  v5 = a3;
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v12 = 0;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(a1, "portList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "portList"), (v58 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "portList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "portList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:", v3))
      {
        v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v57 = v11;
      v59 = 1;
    }
    else
    {
      v58 = 0;
      v59 = 0;
    }
    objc_msgSend(a1, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v13;
    v15 = (void *)v13;
    v16 = (void *)v14;
    if (!objc_msgSend(v15, "isEqualToString:", v14))
    {
      v12 = 0;
      goto LABEL_20;
    }
    objc_msgSend(a1, "value");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v18 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v17;
    v19 = (void *)v17;
    v20 = (void *)v18;
    if (!objc_msgSend(v19, "isEqualToString:", v18)
      || (v55 = v16, v21 = objc_msgSend(a1, "version"), v22 = v21 == objc_msgSend(v5, "version"), v16 = v55, !v22))
    {

      v12 = 0;
      if ((v59 & 1) == 0)
      {
LABEL_25:
        if (!v10)

        goto LABEL_28;
      }
      goto LABEL_23;
    }
    v53 = v3;
    objc_msgSend(a1, "expiresDate");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v54 || (objc_msgSend(v5, "expiresDate"), (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "expiresDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expiresDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v23;
      if ((objc_msgSend(v23, "isEqual:", v3) & 1) == 0)
      {

        v25 = (void *)v54;
        if (!v54)
        {

          v25 = 0;
        }

        v12 = 0;
        v3 = v53;
        if ((v59 & 1) == 0)
          goto LABEL_25;
LABEL_23:
        v11 = v57;
        goto LABEL_24;
      }
      v50 = 1;
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    v51 = v20;
    v26 = objc_msgSend(a1, "isSessionOnly");
    if (v26 != objc_msgSend(v5, "isSessionOnly")
      || (v27 = objc_msgSend(a1, "isHTTPOnly"), v27 != objc_msgSend(v5, "isHTTPOnly"))
      || (v28 = objc_msgSend(a1, "isSecure"), v28 != objc_msgSend(v5, "isSecure")))
    {
      v12 = 0;
      v29 = v58;
      v16 = v55;
      if ((v50 & 1) != 0)
      {
LABEL_39:
        v58 = v29;

LABEL_65:
        v3 = v53;
        v36 = (void *)v54;
        if (!v54)
        {

          v36 = 0;
        }

LABEL_20:
        if (!v59)
          goto LABEL_25;
        goto LABEL_23;
      }
LABEL_64:
      v58 = v29;
      goto LABEL_65;
    }
    objc_msgSend(a1, "sameSitePolicy");
    v16 = v55;
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48 || (objc_msgSend(v5, "sameSitePolicy"), (v41 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "sameSitePolicy");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sameSitePolicy");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v30;
      if (!objc_msgSend(v30, "isEqual:", v46))
      {
        v12 = 0;
        goto LABEL_60;
      }
      v44 = 1;
    }
    else
    {
      v41 = 0;
      v44 = 0;
    }
    objc_msgSend(a1, "comment");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45 || (objc_msgSend(v5, "comment"), (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "comment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "comment");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v31;
      if (!objc_msgSend(v31, "isEqual:", v42))
      {
        v12 = 0;
        goto LABEL_56;
      }
      v40 = 1;
    }
    else
    {
      v38 = 0;
      v40 = 0;
    }
    objc_msgSend(a1, "commentURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 || (objc_msgSend(v5, "commentURL"), (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "commentURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commentURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v32, "isEqual:", v33);

      if (v39)
      {

        v16 = v55;
        if ((v40 & 1) == 0)
          goto LABEL_57;
        goto LABEL_56;
      }
    }
    else
    {
      v37 = 0;
      v12 = 1;
    }
    v16 = v55;

    if ((v40 & 1) == 0)
    {
LABEL_57:
      v34 = (void *)v45;
      if (!v45)
      {

        v34 = 0;
      }

      if (!v44)
      {
LABEL_61:
        v35 = (void *)v48;
        if (!v48)
        {

          v35 = 0;
        }

        v29 = v58;
        if (v50)
          goto LABEL_39;
        goto LABEL_64;
      }
LABEL_60:

      goto LABEL_61;
    }
LABEL_56:

    goto LABEL_57;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (uint64_t)ams_isEquivalent:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    objc_msgSend(a1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(a1, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

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

  return v11;
}

- (uint64_t)ams_shouldReplaceCookie:()AppleMediaServices
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (!objc_msgSend(a1, "ams_isEquivalent:", v4))
  {
LABEL_7:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "expiresDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(v4, "expiresDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(a1, "expiresDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "expiresDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "compare:", v9),
        v9,
        v8,
        (unint64_t)(v10 + 1) >= 3))
  {
LABEL_6:
    if ((objc_msgSend(a1, "ams_isExpired") & 1) == 0)
    {
      v11 = objc_msgSend(v4, "ams_isExpired");
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v11 = (((_BYTE)v10 + 1) & 7) == 2;
LABEL_9:

  return v11;
}

- (id)hashedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<NSHTTPCookie: %p {"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  name = %@,"), v3);

  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  domain = %@,"), v4);

  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  path = %@,"), v5);

  objc_msgSend(a1, "expiresDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  expires = %@,"), v6);

  v7 = objc_msgSend(a1, "isSecure");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  isSecure = %@,"), v8);
  objc_msgSend(a1, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AMSHashIfNeeded(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  value = %@,"), v10);

  objc_msgSend(v2, "appendString:", CFSTR("\n}>"));
  return v2;
}

@end

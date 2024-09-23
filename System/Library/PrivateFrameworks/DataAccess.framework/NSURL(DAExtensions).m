@implementation NSURL(DAExtensions)

- (uint64_t)da_isEqualToDAVURL:()DAExtensions
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  int v35;
  void *v36;
  int v37;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;

  v5 = a3;
  objc_msgSend(a1, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      objc_msgSend(a1, "host");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_47;
      v13 = (void *)v12;
      objc_msgSend(a1, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "caseInsensitiveCompare:", v15))
      {

        goto LABEL_47;
      }
      v44 = v15;
      v45 = v14;
      v46 = v13;
    }
    objc_msgSend(a1, "scheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 != v17)
    {
      objc_msgSend(a1, "scheme");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_22;
      objc_msgSend(a1, "scheme");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheme");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "caseInsensitiveCompare:", v3))
      {
        v20 = 0;
        goto LABEL_18;
      }
      v40 = v19;
      v41 = (void *)v18;
    }
    objc_msgSend(a1, "user");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "user");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 != (void *)v22)
    {
      v23 = (void *)v22;
      v42 = v3;
      objc_msgSend(a1, "user");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "user");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v16 != v17)
      {
        v19 = v40;
        v18 = (uint64_t)v41;
        v20 = v43;
        v3 = v42;
LABEL_18:

        if (v10 == v11)
        {

        }
        else
        {

        }
        if ((v20 & 1) == 0)
        {
LABEL_39:
          v9 = 0;
          goto LABEL_49;
        }
        goto LABEL_36;
      }

      if (v10 == v11)
      {

      }
      else
      {

      }
      if ((v43 & 1) == 0)
        goto LABEL_39;
LABEL_36:
      objc_msgSend(a1, "relativePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relativePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "da_appendSlashIfNeeded");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "da_appendSlashIfNeeded");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (v28)
      {
        objc_msgSend(a1, "port");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "intValue");

        objc_msgSend(v5, "port");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "intValue");

        if (v30 == v32)
        {
          v9 = 1;
LABEL_48:

          goto LABEL_49;
        }
        objc_msgSend(a1, "scheme");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("http"));

        if ((v34 & 1) != 0)
        {
          v35 = 80;
        }
        else
        {
          objc_msgSend(a1, "scheme");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("https"));

          if (v37)
            v35 = 443;
          else
            v35 = -1;
        }
        if (!v30 || v30 == v35)
        {
          if (v32)
            v39 = v32 == v35;
          else
            v39 = 1;
          v9 = v39;
          goto LABEL_48;
        }
      }
LABEL_47:
      v9 = 0;
      goto LABEL_48;
    }

    if (v16 == v17)
    {

      if (v10 != v11)
      {

      }
      goto LABEL_36;
    }

    LOBYTE(v18) = 1;
LABEL_22:

    if (v10 != v11)
    {

    }
    if ((v18 & 1) == 0)
      goto LABEL_39;
    goto LABEL_36;
  }
  v9 = 1;
LABEL_49:

  return v9;
}

- (id)da_urlBySettingScheme:()DAExtensions keepUsername:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v8, "setScheme:", v7);

  if ((a4 & 1) == 0)
    objc_msgSend(v8, "setUser:", 0);
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)da_urlBySettingHost:()DAExtensions keepUsername:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v8, "setHost:", v7);

  if ((a4 & 1) == 0)
    objc_msgSend(v8, "setUser:", 0);
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)da_urlBySettingPort:()DAExtensions keepUsername:
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  if (objc_msgSend(v7, "intValue"))
    v9 = v7;
  else
    v9 = 0;
  objc_msgSend(v8, "setPort:", v9);

  if ((a4 & 1) == 0)
    objc_msgSend(v8, "setUser:", 0);
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)da_urlBySettingPath:()DAExtensions keepUsername:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v8, "setPath:", v7);

  if ((a4 & 1) == 0)
    objc_msgSend(v8, "setUser:", 0);
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)da_urlBySettingUsername:()DAExtensions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v6, "setUser:", v5);

  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)da_urlBySettingPassword:()DAExtensions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v6, "setPassword:", v5);

  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)da_urlByRemovingUsername
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v1, "setUser:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)da_urlForLogging
{
  NSObject *v2;
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    v4 = a1;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(a1, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheme:", v6);

    objc_msgSend(a1, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v7);

    objc_msgSend(v5, "URL");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)da_urlBySettingScheme:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingScheme:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingHost:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingHost:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingPort:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingPort:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingPath:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingPath:keepUsername:", a3, 0);
}

- (CFStringRef)da_rawPath
{
  return (id)CFURLCopyPath(a1);
}

- (id)da_pathWithoutTrailingRemovingSlash
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(a1, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("/"));

    if (v4)
    {
      objc_msgSend(v2, "stringByAppendingString:", CFSTR("/"));
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
  }
  return v2;
}

+ (CFURLRef)da_URLWithDirtyString:()DAExtensions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  CFURLRef v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (__CFString *)objc_msgSend(v6, "mutableCopy");
  -[__CFString replaceOccurrencesOfString:withString:options:range:](v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("%20"), 2, 0, -[__CFString length](v7, "length"));
  v8 = CFURLCreateWithString(0, v7, 0);

  return v8;
}

+ (id)da_URLWithScheme:()DAExtensions host:user:port:uri:
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if ((_DWORD)a6)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "da_classicPortForScheme:", v11) == a6;
    if (!v13)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 1;
  if (v13)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("@%@"), v12);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v18;
  }
LABEL_4:
  v19 = (void *)MEMORY[0x1E0C99E98];
  if (v14)
  {
    if (v15)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@%@"), v11, v12, v14, v24);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@:%u%@"), v11, v12, a6, v14);
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@/"), v11, v12, v23, v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@:%u/"), v11, v12, a6, v24);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "da_URLWithDirtyString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (uint64_t)da_URLWithScheme:()DAExtensions host:port:uri:
{
  return objc_msgSend(a1, "da_URLWithScheme:host:user:port:uri:", a3, a4, 0, a5, a6);
}

+ (uint64_t)da_classicPortForScheme:()DAExtensions
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v4 = 443;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ftp")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end

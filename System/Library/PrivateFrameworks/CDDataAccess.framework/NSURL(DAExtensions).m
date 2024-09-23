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
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(a1, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && (objc_msgSend(a1, "user"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(a1, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%@"), v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &stru_1E7B93480;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "port");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(":%@"), v23);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "da_rawPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    v17 = CFSTR("?");
  else
    v17 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  if (v19)
  {
    objc_msgSend(a1, "query");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v26, v25, v14, v15, v17, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v11)
  {

  }
  return v21;
}

- (id)da_urlBySettingHost:()DAExtensions keepUsername:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  if (a4 && (objc_msgSend(a1, "user"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(a1, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%@"), v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "scheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &stru_1E7B93480;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "port");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(":%@"), v23);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "da_rawPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    v17 = CFSTR("?");
  else
    v17 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  if (v19)
  {
    objc_msgSend(a1, "query");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v26, v25, v14, v15, v17, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v11)
  {

  }
  return v21;
}

- (id)da_urlBySettingPort:()DAExtensions keepUsername:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  objc_msgSend(a1, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(a1, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "user");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%@"), v23);
      v9 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v9;
    }
  }
  if (!objc_msgSend(v6, "intValue"))
  {

    v6 = 0;
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &stru_1E7B93480;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), v6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "da_rawPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
    v15 = CFSTR("?");
  else
    v15 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  if (v17)
  {
    objc_msgSend(a1, "query");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v10, v23, v12, v13, v15, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  if (v6)

  return v19;
}

- (id)da_urlBySettingPath:()DAExtensions keepUsername:
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(a1, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && (objc_msgSend(a1, "user"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(a1, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%@"), v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = &stru_1E7B93480;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "port");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(":%@"), v23);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    v17 = CFSTR("?");
  else
    v17 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  if (v19)
  {
    objc_msgSend(a1, "query");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v11, v25, v15, v26, v17, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v12)
  {

  }
  return v21;
}

- (id)da_urlBySettingUsername:()DAExtensions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v23 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("@%@"), v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "scheme");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &stru_1E7B93480;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "port");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(":%@"), v20);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "da_rawPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    v14 = CFSTR("?");
  else
    v14 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  if (v16)
  {
    objc_msgSend(a1, "query");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v24, v6, v11, v12, v14, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  if (v8)
  {

  }
  return v18;
}

- (id)da_urlByRemovingUsername
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "scheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &stru_1E7B93480;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "port");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR(":%@"), v15);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E7B93480;
  }
  objc_msgSend(a1, "da_rawPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    v9 = CFSTR("?");
  else
    v9 = &stru_1E7B93480;
  objc_msgSend(a1, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  if (v11)
  {
    objc_msgSend(a1, "query");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@://%@%@%@%@%@"), v18, v2, v6, v7, v9, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  if (v3)
  {

  }
  return v13;
}

- (id)da_urlForLogging
{
  NSObject *v2;
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    v4 = a1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v9);
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

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
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("@%@"), v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v16;
  }
LABEL_4:
  v17 = (void *)MEMORY[0x1E0C99E98];
  if (v14)
  {
    if (v15)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@%@"), v11, v12, v14, v22);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@:%u%@"), v11, v12, a6, v14);
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@/"), v11, v12, v21, v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@:%u/"), v11, v12, a6, v22);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "da_URLWithDirtyString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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

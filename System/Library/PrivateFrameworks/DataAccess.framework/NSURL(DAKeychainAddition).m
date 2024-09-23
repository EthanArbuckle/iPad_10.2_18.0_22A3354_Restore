@implementation NSURL(DAKeychainAddition)

- (__CFString)uri
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFString *)CFURLCopyPath((CFURLRef)a1);
  v4 = v3;
  if (v3)
  {
    if (v2)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString stringByURLQuoting](v3, "stringByURLQuoting");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@?%@"), v6, v2);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v3;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)URLWithoutUsername
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "port");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    objc_msgSend(a1, "uri");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "da_URLWithScheme:host:port:uri:", v4, v5, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (id)URLByRemovingLastPathComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/")) & 1) != 0)
  {
    v7 = &stru_1E68CCDC0;
  }
  else
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "da_URLWithScheme:host:port:uri:", v2, v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithUsername:withPassword:", v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)URLWithUsername:()DAKeychainAddition withPassword:
{
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (!v6 || -[__CFString isEqualToString:](v6, "isEqualToString:", &stru_1E68CCDC0))
  {
    objc_msgSend(a1, "URLWithoutUsername");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v9 = (id)v8;
    goto LABEL_5;
  }
  if (!v7)
  {
    objc_msgSend(a1, "URLWithUsername:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(a1, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR("://"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLWithoutUsername");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (objc_msgSend(v15, "hasPrefix:", v12))
  {
    v16 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v6, &stru_1E68CCDC0, CFSTR("?@/|:"), 0x8000100u);
    v17 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v7, &stru_1E68CCDC0, CFSTR("?@/|:"), 0x8000100u);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertString:atIndex:", v18, objc_msgSend(v12, "length"));

    objc_msgSend(MEMORY[0x1E0C99E98], "da_URLWithDirtyString:", v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }

LABEL_5:
  return v9;
}

- (id)URLWithUsername:()DAKeychainAddition
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && !-[__CFString isEqualToString:](v4, "isEqualToString:", &stru_1E68CCDC0))
  {
    objc_msgSend(a1, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("://"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v10, "hasPrefix:", v8))
    {
      v11 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v5, &stru_1E68CCDC0, CFSTR("?@/|:"), 0x8000100u);
      -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("@"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertString:atIndex:", v12, objc_msgSend(v8, "length"));

      objc_msgSend(MEMORY[0x1E0C99E98], "da_URLWithDirtyString:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = a1;
    }

  }
  else
  {
    objc_msgSend(a1, "URLWithoutUsername");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end

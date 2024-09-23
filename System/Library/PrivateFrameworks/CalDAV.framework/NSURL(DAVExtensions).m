@implementation NSURL(DAVExtensions)

+ (uint64_t)classicPortForScheme:()DAVExtensions
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", DAVHTTPScheme) & 1) != 0)
  {
    v4 = 80;
  }
  else if (objc_msgSend(v3, "isEqualToString:", DAVHTTPSScheme))
  {
    v4 = 443;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)URLWithScheme:()DAVExtensions host:port:uri:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (!(_DWORD)a5)
  {
    if (v11)
      goto LABEL_6;
LABEL_9:
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@/"), v9, v10, v18, v19);
    goto LABEL_10;
  }
  v13 = objc_msgSend((id)objc_opt_class(), "classicPortForScheme:", v9);
  if (!v12)
  {
    if (v13 != (_DWORD)a5)
    {
      v14 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@:%u/"), v9, v10, a5, v19);
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v13 == (_DWORD)a5)
  {
LABEL_6:
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@%@"), v9, v10, v12, v19);
    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@:%u%@"), v9, v10, a5, v12);
LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithDirtyString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)URLWithDirtyString:()DAVExtensions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCF48];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDirtyString:", v4);

  return v5;
}

- (CFURLRef)initWithDirtyString:()DAVExtensions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  CFURLRef v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (__CFString *)objc_msgSend(v7, "mutableCopy");
  -[__CFString replaceOccurrencesOfString:withString:options:range:](v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("%20"), 2, 0, -[__CFString length](v8, "length"));
  v9 = CFURLCreateWithString(0, v8, 0);
  if (!v9)
  {
    -[__CFString stringByXMLUnquoting](v8, "stringByXMLUnquoting");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = CFURLCreateWithString(0, v10, 0);
    if (!v9)
    {
      v11 = v10;
      v12 = -[__CFString rangeOfString:](v11, "rangeOfString:", CFSTR("://"));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0;
      }
      else
      {
        v15 = v12 + v13;
        -[__CFString substringFromIndex:](v11, "substringFromIndex:", v12 + v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("/"));
        v19 = v18;
        v20 = objc_msgSend(v16, "rangeOfString:", CFSTR("?"));
        if (v19)
          v22 = v21 == 0;
        else
          v22 = 1;
        if (v22)
        {
          if (v19)
          {
            v23 = v19 + v15 + v17;
          }
          else if (v21)
          {
            v23 = v21 + v15 + v20;
          }
          else
          {
            v23 = -[__CFString length](v11, "length");
          }
        }
        else if (v17 < v20)
        {
          v23 = v19 + v15 + v17;
        }
        else
        {
          v23 = v21 + v15 + v20;
        }
        -[__CFString substringWithRange:](v11, "substringWithRange:", 0, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString substringFromIndex:](v11, "substringFromIndex:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v11 = (__CFString *)v24;
      }
      if (objc_msgSend(v14, "length") || -[__CFString length](v11, "length"))
      {
        if (initWithDirtyString__onceToken != -1)
          dispatch_once(&initWithDirtyString__onceToken, &__block_literal_global_52);
        -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v11, "stringByAddingPercentEncodingWithAllowedCharacters:", initWithDirtyString__allowedCharacterSet);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if (v14)
          {
            objc_msgSend(v14, "stringByAppendingString:", v25);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = CFURLCreateWithString(0, v26, 0);

          }
          else
          {
            v9 = CFURLCreateWithString(0, v25, 0);
          }
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  v27 = (void *)objc_msgSend(a1, "initWithString:", &stru_24C1FD208);

  return v9;
}

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
      v5 = (void *)MEMORY[0x24BDD17C8];
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

- (id)URLWithUsername:()DAVExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", &stru_24C1FD208))
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
      objc_msgSend(MEMORY[0x24BDD14A8], "URLUserAllowedCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByAppendingString:", CFSTR("@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertString:atIndex:", v13, objc_msgSend(v8, "length"));

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithDirtyString:", v10);
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
    v3 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "port");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    objc_msgSend(a1, "uri");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithScheme:host:port:uri:", v4, v5, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (id)URLWithoutPassword
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "URLWithoutUsername");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithUsername:", v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = a1;
  }

  return v4;
}

- (uint64_t)absoluteURLisEqual:()DAVExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSlashIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendSlashIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (id)calDAV_leastInfoStringRepresentationRelativeToParentURL:()DAVExtensions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v22;
  int v23;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "port");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v12, "intValue");

  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x24BDBCF48], "classicPortForScheme:", v5);
  }

  objc_msgSend(v4, "port");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "port");
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "intValue");

    v5 = v14;
  }
  else
  {
    v22 = objc_msgSend(MEMORY[0x24BDBCF48], "classicPortForScheme:", v6);
  }

  v16 = (void *)v7;
  if (v5 | v6 && (!v6 || !objc_msgSend((id)v5, "isEqualToString:", v6))
    || v7 | v8 && (!v8 || !objc_msgSend((id)v7, "isEqualToString:", v8)))
  {
    goto LABEL_20;
  }
  if (!(v9 | v10))
  {
    if (v23 == v22)
      goto LABEL_19;
LABEL_20:
    if (!(v9 | v10))
    {
LABEL_23:
      objc_msgSend(a1, "URLWithoutUsername");
      v17 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "absoluteString");
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (!v10)
    {
LABEL_25:
      objc_msgSend(a1, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_22:
    if (objc_msgSend((id)v9, "isEqualToString:", v10))
      goto LABEL_23;
    goto LABEL_25;
  }
  if (!v10)
    goto LABEL_20;
  if (!objc_msgSend((id)v9, "isEqualToString:", v10) || v23 != v22)
    goto LABEL_22;
LABEL_19:
  objc_msgSend(a1, "absoluteURL");
  v17 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CDVRawPath");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v20 = (void *)v19;

  v5 = v17;
LABEL_26:

  return v20;
}

@end

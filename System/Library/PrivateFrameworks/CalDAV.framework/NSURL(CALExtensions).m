@implementation NSURL(CALExtensions)

- (id)queryParameters
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "query");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("&"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "length", (_QWORD)v15))
        {
          objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("="));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 2)
          {
            objc_msgSend(v10, "objectAtIndex:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndex:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              v13 = v11 == 0;
            else
              v13 = 1;
            if (!v13 && objc_msgSend(v11, "length"))
              objc_msgSend(v3, "setObject:forKey:", v12, v11);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)URLWithUsername:()CALExtensions withPassword:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", &stru_24C1FD208))
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
    objc_msgSend(MEMORY[0x24BDD14A8], "URLUserAllowedCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "URLPasswordAllowedCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@@"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertString:atIndex:", v20, objc_msgSend(v12, "length"));

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithDirtyString:", v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }

LABEL_5:
  return v9;
}

+ (id)davCompatibleFilenameForFilename:()CALExtensions
{
  id v3;
  void *v4;
  id v5;
  _BYTE *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  const __CFString *v9;
  unsigned int v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (_BYTE *)objc_msgSend(v5, "UTF8String");
  v7 = *v6;
  if (*v6)
  {
    v8 = v6 + 1;
    do
    {
      if ((v7 - 48) < 0xA)
      {
        v9 = CFSTR("%c");
      }
      else
      {
        v9 = CFSTR("%c");
        if ((v7 & 0xDF) - 65 >= 0x1A)
        {
          if ((v7 - 33) > 0x3E
            || (v9 = CFSTR("%c"), ((1 << (v7 - 33)) & 0x40000000000033C1) == 0))
          {
            if ((_DWORD)v7 == 126)
              v9 = CFSTR("%c");
            else
              v9 = CFSTR("%02X");
          }
        }
      }
      objc_msgSend(v4, "appendFormat:", v9, v7);
      v10 = *v8++;
      v7 = v10;
    }
    while (v10);
  }

  return v4;
}

+ (id)iDiskSmallNameCompatibleNameForFilename:()CALExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "davCompatibleFilenameForFilename:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "length") < 0x1F)
  {
    v10 = v8;
  }
  else
  {
    do
    {
      objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 1, 1);
      objc_msgSend(v7, "stringByAppendingPathExtension:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "davCompatibleFilenameForFilename:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v10;
    }
    while ((unint64_t)objc_msgSend(v10, "length") > 0x1E);
  }
  objc_msgSend(v7, "stringByAppendingPathExtension:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)initWithScheme:()CALExtensions host:port:path:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  if ((objc_msgSend(v11, "isAbsolutePath") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("path %@ is not absolute."), v11);
  objc_msgSend(v10, "stringByAddingPercentEscapes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEscapes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "standardizedURLPath");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = 0;
  if (v13 && v14 && v15)
  {
    v18 = objc_alloc(MEMORY[0x24BDD17C8]);
    if ((_DWORD)a5)
      v19 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@://%@:%i%@"), v13, v14, a5, v16);
    else
      v19 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@://%@%@"), v13, v14, v16, v22);
    v20 = (void *)v19;
    a1 = (id)objc_msgSend(a1, "initWithString:", v19);

    v17 = a1;
  }

  return v17;
}

- (id)unquotedPassword
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "password");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)serverURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "port");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v2)
  {
    objc_msgSend(a1, "port");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@:%@/"), v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@/"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)pathWithoutTrailingRemovingSlash
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

- (CFStringRef)pathWithoutDecodingAndRemovingTrailingSlash
{
  return (id)CFURLCopyPath(a1);
}

@end

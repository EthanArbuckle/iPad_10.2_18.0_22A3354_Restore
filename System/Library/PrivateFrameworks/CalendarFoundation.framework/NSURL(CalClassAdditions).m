@implementation NSURL(CalClassAdditions)

- (BOOL)isOnRemoteFileSystem
{
  void *v1;
  void *v2;
  id v3;
  int v4;
  _BOOL8 v5;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  memset(&v7, 0, 512);
  v4 = statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v7);
  v5 = (v4 | v7.f_flags & 0x1000) == 0;

  return v5;
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

- (uint64_t)compareToLocalURL:()CalClassAdditions
{
  const __CFURL *v4;
  CFStringRef v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  int v25;

  v4 = a3;
  if (v4)
  {
    v5 = CFURLCopyPath(a1);
    v6 = (__CFString *)CFURLCopyPath(v4);
    v7 = v6;
    if (v6)
    {
      v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", v5) ^ 1;
      if (!v5)
        goto LABEL_5;
    }
    else
    {
      v8 = v5 != 0;
      if (!v5)
      {
LABEL_5:
        if (v7)
          CFRelease(v7);
        if ((v8 & 1) != 0)
          goto LABEL_8;
        -[__CFURL port](v4, "port");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFURL port](a1, "port");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
        {
          if (v11 && (objc_msgSend(v10, "isEqualToNumber:", v11) & 1) != 0)
          {
LABEL_12:
            -[__CFURL absoluteString](v4, "absoluteString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeSlashIfNeeded");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            -[__CFURL absoluteString](a1, "absoluteString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeSlashIfNeeded");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14 && v16 && !objc_msgSend(v16, "caseInsensitiveCompare:", v14))
            {
              v9 = 1;
LABEL_33:

              goto LABEL_34;
            }
            -[__CFURL host](v4, "host");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFURL host](a1, "host");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
              goto LABEL_24;
            v19 = objc_msgSend(v17, "length");
            v20 = objc_msgSend(v18, "length");
            if (v19 >= v20)
              v21 = v18;
            else
              v21 = v17;
            if (v19 >= v20)
              v22 = v17;
            else
              v22 = v18;
            v23 = v21;
            v24 = v22;
            if (objc_msgSend(v23, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v25 = objc_msgSend(v24, "hasPrefix:", v23);

              if (v25)
              {
LABEL_24:
                v9 = 1;
LABEL_32:

                goto LABEL_33;
              }
            }
            else
            {

            }
            v9 = 0;
            goto LABEL_32;
          }
        }
        else if (!v11)
        {
          goto LABEL_12;
        }
        v9 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    CFRelease(v5);
    goto LABEL_5;
  }
LABEL_8:
  v9 = 0;
LABEL_35:

  return v9;
}

+ (id)URLWithContactIdentifier:()CalClassAdditions
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("addressbook://%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)davCompatibleFilenameForFilename:()CalClassAdditions
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
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
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

- (CFURLRef)initWithCalDirtyString:()CalClassAdditions
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
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;

  v4 = (void *)MEMORY[0x1E0CB3500];
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
    -[__CFString CDVStringByXMLUnquoting](v8, "CDVStringByXMLUnquoting");
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
        objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if (v14)
          {
            objc_msgSend(v14, "stringByAppendingString:", v26);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = CFURLCreateWithString(0, v27, 0);

          }
          else
          {
            v9 = CFURLCreateWithString(0, v26, 0);
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
  v28 = (void *)objc_msgSend(a1, "initWithString:", &stru_1E2A86598);

  return v9;
}

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

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "query");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("&"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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

- (id)URLWithUsername:()CalClassAdditions withPassword:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", &stru_1E2A86598))
  {
    v8 = a1;
    v9 = 0;
LABEL_4:
    objc_msgSend(v8, "CDVURLWithUser:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = a1;
    v9 = v6;
    goto LABEL_4;
  }
  objc_msgSend(a1, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("://"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CDVURLWithUser:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (objc_msgSend(v16, "hasPrefix:", v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLUserAllowedCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "URLPasswordAllowedCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@@"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertString:atIndex:", v21, objc_msgSend(v13, "length"));

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithCalDirtyString:", v16);
  }
  else
  {
    v10 = a1;
  }

LABEL_5:
  return v10;
}

- (uint64_t)initWithScheme:()CalClassAdditions host:port:path:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (!(_DWORD)a5)
  {
    v20 = (id)objc_opt_new();
    objc_msgSend(v20, "setScheme:", v10);
    objc_msgSend(v20, "setHost:", v11);
    objc_msgSend(v20, "setPath:", v13);
    objc_msgSend(v20, "URL");
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0;
    v17 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v12, "isAbsolutePath") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("path %@ is not absolute."), v13);
  objc_msgSend(v10, "stringByAddingPercentEscapes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEscapes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "standardizedURLPath");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = 0;
  if (v14 && v15 && v16)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@:%i%@"), v14, v15, a5, v16);
    v20 = (id)objc_msgSend(a1, "initWithString:", v19);

    a1 = v20;
    v18 = (uint64_t)v20;
LABEL_9:

  }
  return v18;
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

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
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

- (uint64_t)compareToLocalString:()CalClassAdditions
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compareToLocalURL:", v2);

  return v3;
}

- (uint64_t)isEqualToURLIgnoringScheme:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "isEqual:", v4);
  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else if (v4)
  {
    __55__NSURL_CalClassAdditions__isEqualToURLIgnoringScheme___block_invoke(v5, a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __55__NSURL_CalClassAdditions__isEqualToURLIgnoringScheme___block_invoke((uint64_t)v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
      v6 = objc_msgSend(v7, "isEqualToString:", v8);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hostWithoutWWW
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(CFSTR("//"), "length");
  v3 = objc_msgSend(CFSTR("www."), "length");
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("//")))
  {
    objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v2, &stru_1E2A86598);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v4;
  }
  objc_msgSend(v1, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("www."));

  if (v6)
  {
    objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v3, &stru_1E2A86598);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v7;
  }
  return v1;
}

- (BOOL)cal_caseInsensitiveHasScheme:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v4) == 0;
  else
    v7 = 0;

  return v7;
}

- (uint64_t)cal_hasSchemeMailto
{
  return objc_msgSend(a1, "cal_caseInsensitiveHasScheme:", CFSTR("mailto"));
}

- (uint64_t)cal_hasSchemeTel
{
  return objc_msgSend(a1, "cal_caseInsensitiveHasScheme:", CFSTR("tel"));
}

- (id)cal_resourceSpecifierNoLeadingSlashes
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "resourceSpecifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("//")))
  {
    v2 = v1;
    v3 = 2;
  }
  else
  {
    if (!objc_msgSend(v1, "hasPrefix:", CFSTR("/")))
    {
      v4 = v1;
      goto LABEL_7;
    }
    v2 = v1;
    v3 = 1;
  }
  objc_msgSend(v2, "substringFromIndex:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v5 = v4;

  return v5;
}

- (id)cal_emailAddressString
{
  void *v2;

  if (objc_msgSend(a1, "cal_hasSchemeMailto"))
  {
    objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)cal_phoneNumberString
{
  void *v2;

  if (objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)cal_isEquivalentToEmailAddress:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (v4 && objc_msgSend(a1, "cal_hasSchemeMailto"))
  {
    objc_msgSend(v4, "stringRemovingMailto");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

    v4 = (id)v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)cal_isEquivalentToPhoneNumber:()CalClassAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (v4 && objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    objc_msgSend(v4, "stringRemovingTel");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

    v4 = (id)v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (uint64_t)URLForMail:()CalClassAdditions
{
  return objc_msgSend(a1, "_URLForAddress:scheme:noAddress:", a3, CFSTR("mailto"), CFSTR("invalid:nomail"));
}

+ (uint64_t)URLForTel:()CalClassAdditions
{
  return objc_msgSend(a1, "_URLForAddress:scheme:noAddress:", a3, CFSTR("tel"), CFSTR("invalid:notel"));
}

+ (id)_URLForAddress:()CalClassAdditions scheme:noAddress:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(a1, "_isValidURI:", v8) & 1) == 0)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("mailto"))
        && (objc_msgSend(v8, "rangeOfString:", CFSTR("@")), v11)
        || objc_msgSend(v9, "isEqualToString:", CFSTR("tel"))
        && objc_msgSend(v8, "cal_isPhoneNumber"))
      {
        objc_msgSend(v8, "trimWhiteSpace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%@"), v9, v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        v8 = v12;
      }
      else
      {
        v16 = v10;
      }

      v8 = v16;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)_isValidURI:()CalClassAdditions
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
    v4 = v5 != 0;
  }

  return v4;
}

+ (uint64_t)URLForNoMail
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("invalid:nomail"));
}

+ (uint64_t)URLForNoTel
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("invalid:notel"));
}

- (uint64_t)isNoMail
{
  return objc_msgSend(a1, "_hasDescription:", CFSTR("invalid:nomail"));
}

- (uint64_t)isNoTel
{
  return objc_msgSend(a1, "_hasDescription:", CFSTR("invalid:notel"));
}

- (uint64_t)_hasDescription:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v9);

  }
  return v8;
}

- (id)cal_hostAfterGoogleRedirects
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "hasSuffixCaseInsensitive:", CFSTR(".google.com")))
    goto LABEL_9;
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("q=")))
    goto LABEL_8;
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("/url"));

  if (!v5)
  {
LABEL_9:
    v10 = v2;
    goto LABEL_10;
  }
  objc_msgSend(a1, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("q="), "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "cal_hostAfterGoogleRedirects"), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    goto LABEL_9;
  }
  v10 = (id)v9;

LABEL_10:
  return v10;
}

@end

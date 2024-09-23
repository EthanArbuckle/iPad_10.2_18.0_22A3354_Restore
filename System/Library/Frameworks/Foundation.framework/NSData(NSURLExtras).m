@implementation NSData(NSURLExtras)

- (const)_web_guessedMIMETypeForXML
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  int64_t v7;
  const __CFString *v8;
  const char *v9;
  const char *v10;
  char *v11;

  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "bytes");
  v4 = 1024;
  if (v2 < 1024)
    v4 = v2;
  if (v4 >= 7)
  {
    v5 = (char *)v3;
    v6 = 0;
    v7 = v4 - 6;
    v8 = CFSTR("application/rss+xml");
    while (1)
    {
      v9 = (const char *)memchr(v5, 60, v7);
      if (!v9)
        return 0;
      v10 = v9;
      if ((v6 & 1) != 0)
        break;
      if (!strncasecmp_l(v9, "<rdf", 4uLL, 0))
        goto LABEL_15;
      if (!strncasecmp_l(v10, "<rss", 4uLL, 0))
        return v8;
      if (!strncasecmp_l(v10, "<feed", 5uLL, 0))
        return CFSTR("application/atom+xml");
      if (strncasecmp_l(v10, "<?", 2uLL, 0) && strncasecmp_l(v10, "<!", 2uLL, 0))
        return 0;
      v6 = 0;
LABEL_16:
      v11 = &v5[v7];
      v5 = (char *)(v10 + 1);
      v7 = v11 - (v10 + 1);
      if (v7 <= 0)
        return 0;
    }
    if (!strncasecmp_l(v9, "<channel", 8uLL, 0))
      return v8;
LABEL_15:
    v6 = 1;
    goto LABEL_16;
  }
  return 0;
}

- (__CFString)_web_guessedMIMEType
{
  __CFString *v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;
  char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  int64_t v13;
  char *v14;
  unint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  BOOL v22;
  int v23;

  v2 = (__CFString *)objc_msgSend(a1, "_web_guessedMIMETypeForXML");
  if (-[__CFString length](v2, "length"))
    return v2;
  v4 = objc_msgSend(a1, "length");
  v5 = objc_msgSend(a1, "bytes");
  v6 = (const char *)v5;
  if (v4 >= 1024)
    v7 = 1024;
  else
    v7 = v4;
  if (v7 >= 7)
  {
    v2 = CFSTR("text/html");
    v8 = v7 - 6;
    v9 = (char *)v5;
    do
    {
      v10 = (const char *)memchr(v9, 60, v8);
      if (!v10)
        break;
      v11 = v10;
      if (!strncasecmp_l(v10, "<html>", 6uLL, 0)
        || !strncasecmp_l(v11, "<a ", 3uLL, 0)
        || !strncasecmp_l(v11, "<script", 7uLL, 0)
        || !strncasecmp_l(v11, "<title>", 7uLL, 0))
      {
        return v2;
      }
      v12 = &v9[v8];
      v9 = (char *)(v11 + 1);
      v8 = v12 - (v11 + 1);
    }
    while (v8 > 0);
  }
  v13 = v7 - 8;
  if (v13 >= 1)
  {
    v14 = (char *)v6;
    v2 = CFSTR("text/html");
    do
    {
      v15 = (unint64_t)memchr(v14, 116, v13);
      v16 = (const char *)memchr(v14, 84, v13);
      if (!(v15 | (unint64_t)v16))
        break;
      if (v15 >= (unint64_t)v16)
        v17 = v16;
      else
        v17 = (const char *)v15;
      if (!v16)
        v17 = (const char *)v15;
      if (v15)
        v18 = v17;
      else
        v18 = v16;
      if (!strncasecmp_l(v18, "text/html", 9uLL, 0))
        return v2;
      v19 = &v14[v13];
      v14 = (char *)(v18 + 1);
      v13 = v19 - (v18 + 1);
    }
    while (v13 > 0);
  }
  if (v4 >= 11)
  {
    if (!strncmp(v6, "BEGIN:VCARD", 0xBuLL))
      return CFSTR("text/vcard");
    if ((unint64_t)v4 >= 0xF && !strncmp(v6, "BEGIN:VCALENDAR", 0xFuLL))
      return CFSTR("text/calendar");
    goto LABEL_33;
  }
  if (v4 >= 1)
  {
LABEL_33:
    v20 = 0;
    v2 = CFSTR("text/plain");
    while (1)
    {
      if ((v6[v20] - 127) <= 0xA0u)
      {
        v21 = v6[v20];
        v22 = v21 > 0xD;
        v23 = (1 << v21) & 0x2600;
        if (v22 || v23 == 0)
          break;
      }
      if (v4 == ++v20)
        return v2;
    }
    goto LABEL_43;
  }
  v20 = 0;
LABEL_43:
  if (v20 == v4)
    return CFSTR("text/plain");
  if (v4 >= 4 && !strncmp(v6, "\xFF\xD8\xFF\xE0mage/jpeg", 4uLL))
    return &stru_1E0F59F70;
  return 0;
}

- (uint64_t)_web_guessedMIMETypeForExtension:()NSURLExtras
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "_web_guessedMIMEType");
  v5 = v4;
  if ((!v4 || objc_msgSend(v4, "isEqualToString:", CFSTR("text/plain"))) && objc_msgSend(a3, "length"))
    return objc_msgSend(+[NSURLFileTypeMappings sharedMappings](NSURLFileTypeMappings, "sharedMappings"), "MIMETypeForExtension:", a3);
  else
    return (uint64_t)v5;
}

- (void)_web_parseRFC822HeaderFields
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  _BYTE *v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  __CFString *v20;
  __CFString *v21;
  CFIndex v22;
  int v23;
  int v24;
  BOOL v25;
  unsigned int CharacterAtIndex;
  UniChar v27;
  char *v28;
  UniChar *v29;
  NSString *v30;
  unsigned __int8 *v31;
  int v32;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  uint64_t v37;
  NSString *v38;
  uint64_t v39;
  void *v41;
  CFIndex v42;
  _BYTE *v43;
  char *v44;
  UniChar *chars;
  __CFString *theString;
  uint64_t numChars;
  CFRange v48;
  CFRange v49;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_msgSend(a1, "bytes");
  v4 = objc_msgSend(a1, "length");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
LABEL_3:
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = *(unsigned __int8 *)(v3 + v8);
      if (v9 == 10)
        break;
      if (v9 == 13)
      {
        if (v5 - 1 == v8)
          return v2;
        v10 = (unsigned __int8 *)(v3 + v8);
        v11 = (_BYTE *)(v3 + v8 + 1);
        if (*v11 == 10)
          v11 = (_BYTE *)(v3 + v8 + 2);
        if (!(_DWORD)v8)
          return v2;
LABEL_14:
        v12 = *(unsigned __int8 *)v3;
        v43 = v11;
        if (v12 == 9 || v12 == 32)
        {
          if (v6)
          {
            v13 = objc_msgSend(v2, "objectForKey:", v6);
            v14 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithBytes:length:encoding:", v3, v7 >> 32, CFStringConvertEncodingToNSStringEncoding(0x201u));
            v15 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@%@"), v13, v14);
            objc_msgSend(v2, "setObject:forKey:", v15, v6);

          }
          goto LABEL_58;
        }
        v16 = 0;
        do
        {
          v17 = v16;
          v18 = (unsigned __int8 *)(v3 + v16++);
        }
        while (v18 != v10 && *v18 != 58);
        v19 = (unsigned __int8 *)(v3 + v16);
        if ((unsigned __int8 *)(v3 + v16 - 1) != v10)
        {
          v20 = (__CFString *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithBytes:length:encoding:", v3, v16 - 1, CFStringConvertEncodingToNSStringEncoding(0x201u));
          v21 = v20;
          theString = v20;
          numChars = CFStringGetLength(v20);
          if (numChars < 1)
            goto LABEL_44;
          v22 = 0;
          v44 = 0;
          chars = 0;
          v23 = 0;
          v24 = 0;
          v41 = v2;
          v42 = numChars + 1;
          v25 = 1;
          while (1)
          {
            CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v22);
            v27 = CharacterAtIndex;
            if (v25 && CharacterAtIndex >= 0x61 && CharacterAtIndex <= 0x7A)
            {
              v27 = CharacterAtIndex - 32;
              if (v23)
                goto LABEL_28;
            }
            else
            {
              if (v25 || CharacterAtIndex < 0x41 || CharacterAtIndex > 0x5A)
                goto LABEL_40;
              v27 = CharacterAtIndex + 32;
              if (v23)
              {
LABEL_28:
                if (v24)
                  goto LABEL_38;
                v28 = v44;
                goto LABEL_36;
              }
            }
            v48.location = 0;
            v48.length = numChars;
            if (CFStringGetBytes(theString, v48, 0x201u, 0, 0, 0, 0, 0) != numChars)
            {
              v29 = (UniChar *)MEMORY[0x186DA6248](0, 2 * numChars, 0x1000040BDFB0063, 0);
              v49.location = 0;
              v49.length = numChars;
              chars = v29;
              CFStringGetCharacters(theString, v49, v29);
LABEL_38:
              chars[v22] = v27;
              v24 = 1;
              goto LABEL_39;
            }
            v28 = (char *)MEMORY[0x186DA6248](0, v42, 1714459658, 0);
            CFStringGetCString(theString, v28, v42, 0x201u);
LABEL_36:
            v24 = 0;
            v44 = v28;
            v28[v22] = v27;
LABEL_39:
            v23 = 1;
LABEL_40:
            v25 = v27 == 45;
            if (numChars == ++v22)
            {
              v2 = v41;
              if (v23)
              {
                if (v24)
                  v30 = (NSString *)CFStringCreateWithCharacters(0, chars, numChars);
                else
                  v30 = -[NSString initWithCString:encoding:]([NSString alloc], "initWithCString:encoding:", v44, CFStringConvertEncodingToNSStringEncoding(0x201u));
LABEL_46:
                v6 = v30;
                if (v19 == v10)
                {
LABEL_54:
                  v34 = -[NSString initWithString:]([NSString alloc], "initWithString:", &stru_1E0F56070);
                }
                else
                {
                  v31 = &v10[~v3 - v17];
                  while (1)
                  {
                    v32 = *v19;
                    if (v32 != 32 && v32 != 9)
                      break;
                    ++v19;
                    --v31;
                    if (v19 == v10)
                      goto LABEL_54;
                  }
                  v34 = (NSString *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithBytes:length:encoding:", v19, v31, CFStringConvertEncodingToNSStringEncoding(0x201u));
                }
                v35 = v34;
                v36 = v34;
                v37 = objc_msgSend(v2, "objectForKey:", v6);
                if (v37)
                {
                  v35 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@, %@"), v37, v35);
                  v38 = v35;
                }
                objc_msgSend(v2, "setObject:forKey:", v35, v6);
                break;
              }
LABEL_44:
              v30 = theString;
              goto LABEL_46;
            }
          }
        }
LABEL_58:
        v39 = v5 + v3;
        v3 = (uint64_t)v43;
        v5 = v39 - (_QWORD)v43;
        if (v39 - (uint64_t)v43 <= 0)
          return v2;
        goto LABEL_3;
      }
      ++v8;
      v7 += 0x100000000;
      if (v5 == v8)
        return v2;
    }
    v10 = (unsigned __int8 *)(v3 + v8);
    v11 = (_BYTE *)(v3 + v8 + 1);
    if ((_DWORD)v8)
      goto LABEL_14;
  }
  return v2;
}

- (void)_replaceCString:()NSURLExtras withCString:
{
  size_t v7;
  char *v8;
  int64_t v9;
  char v10;
  _BYTE *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v17;
  size_t v18;

  v7 = strlen(__s);
  v18 = strlen(a4);
  v8 = (char *)objc_msgSend(a1, "bytes");
  v9 = objc_msgSend(a1, "length");
  v10 = *__s;
  v11 = memchr(v8, *__s, v9);
  if (v11)
  {
    v17 = a1;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = v11 - v8;
      v15 = v11 - v8 + v7;
      if (v15 > v9)
        break;
      if (!memcmp(v11, __s, v7))
      {
        if (!v13)
          v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        objc_msgSend(v13, "appendBytes:length:", &v8[v12], v14 - v12, v17);
        objc_msgSend(v13, "appendBytes:length:", a4, v18);
        v10 = *__s;
        v12 = v15;
      }
      else
      {
        v15 = v14 + 1;
      }
      v11 = memchr(&v8[v15], v10, v9 - v15);
    }
    while (v11);
    a1 = v17;
    if (v13)
    {
      if (v9 > v12)
        objc_msgSend(v13, "appendBytes:length:", &v8[v12], v9 - v12);
      return v13;
    }
  }
  return a1;
}

@end

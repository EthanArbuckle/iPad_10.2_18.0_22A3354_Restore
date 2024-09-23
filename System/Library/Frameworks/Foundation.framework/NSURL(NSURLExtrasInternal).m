@implementation NSURL(NSURLExtrasInternal)

- (const)_web_URLByRemovingLastPathComponent_nowarn
{
  const __CFURL *v1;
  UInt8 *v2;
  CFIndex v3;
  CFRange v4;
  CFRange v5;
  CFIndex length;
  CFIndex location;
  CFIndex v8;
  UInt8 *v9;
  CFIndex v10;
  CFIndex v11;
  UInt8 *v12;
  int v13;
  int v14;
  CFIndex v15;
  UInt8 *v16;
  CFStringEncoding v17;
  CFURLRef v18;
  UInt8 buffer[2048];
  uint64_t v21;

  v1 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  v2 = buffer;
  if (CFURLGetBytes(a1, buffer, 2048) == -1)
  {
    v3 = CFURLGetBytes(v1, 0, 0);
    v2 = (UInt8 *)malloc_type_malloc(v3, 0x9C75F076uLL);
    CFURLGetBytes(v1, v2, v3);
  }
  v4 = CFURLGetByteRangeForComponent(v1, kCFURLComponentParameterString, 0);
  v5 = CFURLGetByteRangeForComponent(v1, kCFURLComponentPath, 0);
  length = v4.location + v4.length - v5.location;
  if (v4.location == -1)
    length = v5.length;
  if (v5.location == -1)
    location = v4.location;
  else
    location = v5.location;
  if (v5.location == -1)
    v8 = v4.length;
  else
    v8 = length;
  if (location == -1 || !v8)
  {
    if (v2 != buffer)
      free(v2);
    return 0;
  }
  else
  {
    v9 = &v2[location];
    v10 = location + v8;
    do
    {
      v11 = v10;
      v12 = &v2[v10];
      if (v12 <= v9)
        break;
      v13 = *(v12 - 1);
      v10 = v11 - 1;
    }
    while (v13 == 47);
    do
    {
      v15 = v11;
      v16 = &v2[v11];
      if (v16 <= v9)
        break;
      v14 = *(v16 - 1);
      v11 = v15 - 1;
    }
    while (v14 != 47);
    v17 = _CFURLGetEncoding();
    v18 = CFURLCreateWithBytes(0, v2, v15, v17, 0);
    if (v2 != buffer)
      free(v2);
    if (v18)
      return v18;
  }
  return v1;
}

- (id)_web_URLByRemovingUserAndPath_nowarn
{
  id v2;
  CFStringRef cf;
  CFStringRef v5;
  void *v6;

  cf = CFURLCopyScheme(a1);
  v5 = CFURLCopyHostName(a1);
  CFURLGetPortNumber(a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &stru_1E0F56070, 0);
  v2 = (id)_CFURLCreateFromComponents();
  if (cf)
    CFRelease(cf);
  if (v5)
    CFRelease(v5);

  return v2;
}

- (const)_web_URLByRemovingUserAndQueryAndFragment_nowarn
{
  const __CFURL *v1;
  CFRange v2;
  CFIndex location;
  CFIndex v4;
  CFIndex v5;
  UInt8 *v6;
  CFIndex v7;
  CFIndex v8;
  CFIndex v9;
  CFIndex v10;
  CFStringEncoding v11;
  CFURLRef v12;
  UInt8 buffer[2048];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentUserInfo, 0);
  location = CFURLGetByteRangeForComponent(v1, kCFURLComponentQuery, 0).location;
  v4 = CFURLGetByteRangeForComponent(v1, kCFURLComponentFragment, 0).location;
  v5 = v4;
  if (v2.location != -1 || location != -1 || v4 != -1)
  {
    v6 = buffer;
    v7 = CFURLGetBytes(v1, buffer, 2048);
    if (v7 == -1)
    {
      v8 = CFURLGetBytes(v1, 0, 0);
      v6 = (UInt8 *)malloc_type_malloc(v8, 0xBFD07460uLL);
      CFURLGetBytes(v1, v6, v8);
    }
    else
    {
      v8 = v7;
    }
    v9 = v5 - 1;
    if (v5 == -1)
      v9 = v8;
    if (location == -1)
      v10 = v9;
    else
      v10 = location - 1;
    if (v2.location != -1)
    {
      memmove(&v6[v2.location], &v6[v2.location + 1 + v2.length], v10 + ~(v2.location + v2.length));
      v10 += ~v2.length;
    }
    v11 = _CFURLGetEncoding();
    v12 = CFURLCreateWithBytes(0, v6, v10, v11, 0);
    if (v6 != buffer)
      free(v6);
    if (v12)
      return v12;
  }
  return v1;
}

- (const)_URLByEscapingSpacesAndControlChars
{
  const __CFURL *v1;
  uint64_t v2;
  uint64_t v3;
  UInt8 *v4;
  uint64_t v5;
  UInt8 *v6;
  unsigned __int8 *v7;
  char *v8;
  int64_t v9;
  unint64_t v10;
  const __CFURL *v11;
  UInt8 buffer[2048];
  uint64_t v14;

  v1 = a1;
  v14 = *MEMORY[0x1E0C80C00];
  v2 = CFURLGetBytes(a1, 0, 0);
  v3 = v2;
  if (v2 < 2049)
  {
    v4 = buffer;
    CFURLGetBytes(v1, buffer, v2);
    if (v3 < 1)
      return v1;
  }
  else
  {
    v4 = (UInt8 *)malloc_type_malloc(3 * v2, 0xE6E88B96uLL);
    CFURLGetBytes(v1, v4, v3);
  }
  v5 = 0;
  v6 = &v4[v3];
  while (v4[v5] - 127 >= 0xFFFFFFA2)
  {
    if (&v4[++v5] >= v6)
      goto LABEL_12;
  }
  v7 = &v4[v5];
  if (v3 >= 683 && v4 == buffer)
  {
    v8 = (char *)malloc_type_malloc(3 * v3, 0x306744D8uLL);
    memmove(v8, buffer, v3);
    v7 = (unsigned __int8 *)&v8[v4 - buffer + v5];
    v6 = (UInt8 *)&v8[v3];
    v4 = (UInt8 *)v8;
  }
  v9 = v7 - v4;
  v10 = escapeChars(v7, v6 - v7);
  v1 = CFURLCreateAbsoluteURLWithBytes(0, v4, v9 + v10, 0x600u, 0, 1u);
  v11 = v1;
LABEL_12:
  if (buffer != v4)
    free(v4);
  return v1;
}

+ (uint64_t)_URLWithDataAsString:()NSURLExtrasInternal relativeToURL:
{
  if (a3)
    return objc_msgSend(a1, "_URLWithData:relativeToURL:", objc_msgSend((id)objc_msgSend(a3, "_web_stringByTrimmingWhitespace"), "dataUsingEncoding:", 5), a4);
  else
    return 0;
}

+ (uint64_t)_URLWithData:()NSURLExtrasInternal relativeToURL:
{
  uint64_t v6;
  CFIndex v7;
  const UInt8 *v8;
  const UInt8 *v9;
  CFURLRef v10;
  const __CFURL *v11;

  if (!a3)
    return 0;
  v6 = objc_msgSend(a3, "length");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = (const UInt8 *)objc_msgSend(a3, "bytes");
    v9 = v8;
    if (a4 && *v8 == 59)
      a4 = (void *)objc_msgSend(a4, "_web_URLByRemovingLastPathComponent_nowarn");
    v10 = CFURLCreateAbsoluteURLWithBytes(0, v9, v7, 0x8000100u, (CFURLRef)a4, 1u);
    if (!v10)
      v10 = CFURLCreateAbsoluteURLWithBytes(0, v9, v7, 0x201u, (CFURLRef)a4, 1u);
    v11 = v10;
    return (uint64_t)v10;
  }
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E0F56070);
}

- (const)_hostString
{
  CFRange v2;
  CFIndex location;
  CFIndex length;
  CFIndex v5;
  UInt8 *v6;
  CFIndex v8;
  UInt8 *v9;
  NSString *v10;
  UInt8 v11[2056];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentHost, 0);
  if (v2.location == -1)
    return &stru_1E0F56070;
  location = v2.location;
  length = v2.length;
  v5 = 2048;
  MEMORY[0x1E0C80A78](v2.location);
  v6 = v11;
  if (CFURLGetBytes(a1, v11, 2048) == -1)
  {
    v5 = CFURLGetBytes(a1, 0, 0);
    v6 = (UInt8 *)malloc_type_malloc(v5, 0xFE60D66uLL);
    CFURLGetBytes(a1, v6, v5);
    if (!v2.length)
      goto LABEL_10;
  }
  else if (!v2.length)
  {
    goto LABEL_10;
  }
  if (v2.length == 9)
  {
    if (objc_msgSend((id)-[__CFURL scheme](a1, "scheme"), "caseInsensitiveCompare:", CFSTR("file"))
      && !strncasecmp_l("localhost", (const char *)&v6[v2.location], 9uLL, 0))
    {
LABEL_10:
      if (v6 != v11)
        free(v6);
      return &stru_1E0F56070;
    }
    goto LABEL_14;
  }
  if (v2.length >= 1)
  {
LABEL_14:
    v8 = v2.location;
    while (v6[v8] - 127 >= 0xFFFFFFA2)
    {
      if (&v6[++v8] >= &v6[v2.location + v2.length])
        goto LABEL_17;
    }
    v9 = v6;
    if (v5 < 3 * v2.length)
      v9 = (UInt8 *)malloc_type_malloc(3 * v2.length, 0x618B91BFuLL);
    memmove(v9, &v6[v2.location], v2.length);
    if (v6 != v11 && v6 != v9)
      free(v6);
    location = 0;
    length = escapeChars(&v9[v8], v2.length - v8) + v8;
    goto LABEL_24;
  }
LABEL_17:
  v9 = v6;
LABEL_24:
  v10 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", &v9[location], length, 1);
  if (v11 != v9)
    free(v9);
  return (const __CFString *)v10;
}

@end

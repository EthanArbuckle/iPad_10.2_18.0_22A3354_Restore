@implementation MCLURLDataLoader

+ (id)dateFromRFC1123:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  tm v8;
  time_t v9;
  tm v10;
  time_t v11;
  tm __b;
  char *v13;
  id v14;
  const char *v15;
  const char *v16;
  int v17;
  id location[3];
  id v19;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v16 = (const char *)objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String");
    v14 = 0;
    v13 = 0;
    v15 = "%a, %d %b %Y %H:%M:%S %Z";
    memset(&__b, 0, sizeof(__b));
    v13 = strptime_l(v16, "%a, %d %b %Y %H:%M:%S %Z", &__b, 0);
    if (v13
      && (v11 = mktime(&__b),
          v3 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v11), v4 = v14, v14 = v3, v4, v14))
    {
      v19 = v14;
      v17 = 1;
    }
    else
    {
      v15 = "%A, %d-%b-%y %H:%M:%S %Z";
      memset(&v10, 0, sizeof(v10));
      v13 = strptime_l(v16, "%A, %d-%b-%y %H:%M:%S %Z", &v10, 0);
      if (v13
        && (v9 = mktime(&v10),
            v5 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v9), v6 = v14, v14 = v5, v6, v14))
      {
        v19 = v14;
        v17 = 1;
      }
      else
      {
        v15 = "%a %b %e %H:%M:%S %Y";
        memset(&v8, 0, sizeof(v8));
        v13 = strptime_l(v16, "%a %b %e %H:%M:%S %Y", &v8, 0);
        if (v13)
          v19 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)mktime(&v8));
        else
          v19 = 0;
        v17 = 1;
      }
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v19 = 0;
    v17 = 1;
  }
  objc_storeStrong(location, 0);
  return v19;
}

+ (id)fileExtensionForMimeType:(id)a3
{
  __CFString *v3;
  __CFString *v5;
  __CFString *obj;
  id v7;
  const __CFString *PreferredIdentifierForTag;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  PreferredIdentifierForTag = 0;
  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1660], (CFStringRef)location[0], 0);
  v7 = 0;
  if (PreferredIdentifierForTag)
  {
    obj = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC1658]);
    CFRelease(PreferredIdentifierForTag);
    if (obj)
    {
      objc_storeStrong(&v7, obj);
      CFRelease(obj);
    }
  }
  if (v7)
    v3 = (__CFString *)v7;
  else
    v3 = &stru_24E09C510;
  v5 = v3;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)mimeTypeForFileExtension:(id)a3
{
  id v4;
  __CFString *obj;
  id v6;
  const __CFString *PreferredIdentifierForTag;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  PreferredIdentifierForTag = 0;
  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], (CFStringRef)location[0], 0);
  v6 = 0;
  if (PreferredIdentifierForTag)
  {
    obj = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC1660]);
    CFRelease(PreferredIdentifierForTag);
    if (obj)
    {
      objc_storeStrong(&v6, obj);
      CFRelease(obj);
    }
  }
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)setCookie:(id)a3
{
  NSHTTPCookieStorage *v3;
  id location[2];
  MCLURLDataLoader *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[MCLURLDataLoader cookieStorage](v5, "cookieStorage");
  -[NSHTTPCookieStorage setCookie:](v3, "setCookie:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  const __CFString *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  id v11;
  NSHTTPCookieStorage *v12;
  void *v13;
  id v14;
  NSHTTPCookieStorage *v15;
  id v18;
  NSArray *v19;
  BOOL v20;
  id v21;
  id location[2];
  MCLURLDataLoader *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = a5;
  v19 = 0;
  if (objc_msgSend(v21, "length"))
  {
    v13 = (void *)MEMORY[0x24BDBCF48];
    if (v20)
      v5 = CFSTR("https");
    else
      v5 = CFSTR("http");
    v14 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@"), v5, v21);
    v18 = (id)objc_msgSend(v13, "URLWithString:");

    v15 = -[MCLURLDataLoader cookieStorage](v23, "cookieStorage");
    v6 = -[NSHTTPCookieStorage cookiesForURL:](v15, "cookiesForURL:", v18);
    v7 = v19;
    v19 = v6;

    objc_storeStrong(&v18, 0);
  }
  else
  {
    v12 = -[MCLURLDataLoader cookieStorage](v23, "cookieStorage");
    v8 = -[NSHTTPCookieStorage cookies](v12, "cookies");
    v9 = v19;
    v19 = v8;

  }
  v11 = -[MCLURLDataLoader findCookie:inDomain:secure:cookies:](v23, "findCookie:inDomain:secure:cookies:", location[0]);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 cookies:(id)a6
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  MCLURLDataLoader *v11;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(_QWORD *, void *, _BYTE *);
  void *v19;
  id v20;
  id v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;
  BOOL v31;
  id v32;
  id location[2];
  MCLURLDataLoader *v34;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  v30 = 0;
  objc_storeStrong(&v30, a6);
  v23 = 0;
  v24 = &v23;
  v25 = 838860800;
  v26 = 48;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v22 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = v34;
  v8 = location[0];
  v9 = v31;
  v10 = v30;
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __63__MCLURLDataLoader_Cookie__findCookie_inDomain_secure_cookies___block_invoke;
  v19 = &unk_24E09A058;
  v20 = v32;
  v21[0] = v22;
  v21[1] = &v23;
  -[MCLURLDataLoader enumerateCookies:secure:cookies:withBlock:](v11, "enumerateCookies:secure:cookies:withBlock:", v8, v9, v10, &v15);
  v7 = (id)v24[5];
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __63__MCLURLDataLoader_Cookie__findCookie_inDomain_secure_cookies___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v3;
  BOOL v4;
  int v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10 = 0;
  LOBYTE(v7) = 0;
  if (a1[4])
  {
    v11 = (id)objc_msgSend(location[0], "domain");
    v10 = 1;
    v7 = objc_msgSend(v11, "isEqualToString:", a1[4]) ^ 1;
  }
  if ((v10 & 1) != 0)

  if ((v7 & 1) == 0)
  {
    v3 = (id)objc_msgSend(location[0], "expiresDate");
    v8 = 0;
    v4 = 1;
    if (v3)
    {
      v9 = (id)objc_msgSend(location[0], "expiresDate");
      v8 = 1;
      v4 = objc_msgSend(v9, "compare:", a1[5]) != -1;
    }
    if ((v8 & 1) != 0)

    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), location[0]);
      *a3 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)findMatchingCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  id v5;
  id v6;
  NSArray *v8;
  NSHTTPCookieStorage *v9;
  id v10;
  id v11;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  int v28;
  char v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id v36;
  id location[2];
  MCLURLDataLoader *v38;
  id v39;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0;
  v29 = 0;
  if (objc_msgSend(location[0], "length"))
  {
    v31 = v33;
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", location[0], 0, &v31);
    objc_storeStrong(&v33, v31);
    v30 = v11;
    v29 = 1;
    v5 = v11;
  }
  else
  {
    v5 = 0;
  }
  v32 = v5;
  if ((v29 & 1) != 0)

  if (v33)
  {
    NSLog(CFSTR("Unable to process expression: %@. Error: %@"), location[0], v33);
    v39 = v34;
    v28 = 1;
  }
  else
  {
    v24 = 0;
    if (objc_msgSend(v36, "length"))
    {
      v26 = v33;
      v10 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v36, 0, &v26);
      objc_storeStrong(&v33, v26);
      v25 = v10;
      v24 = 1;
      v6 = v10;
    }
    else
    {
      v6 = 0;
    }
    v27 = v6;
    if ((v24 & 1) != 0)

    if (v33)
    {
      NSLog(CFSTR("Unable to process expression: %@. Error: %@"), v36, v33);
      v39 = v34;
      v28 = 1;
    }
    else
    {
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = -[MCLURLDataLoader cookieStorage](v38, "cookieStorage");
      v8 = -[NSHTTPCookieStorage cookies](v9, "cookies");
      v14 = MEMORY[0x24BDAC760];
      v15 = -1073741824;
      v16 = 0;
      v17 = __64__MCLURLDataLoader_Cookie__findMatchingCookies_inDomain_secure___block_invoke;
      v18 = &unk_24E09A080;
      v19 = v32;
      v20 = v27;
      v21 = v23;
      v22 = v34;
      -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", &v14);

      v39 = v34;
      v28 = 1;
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v39;
}

void __64__MCLURLDataLoader_Cookie__findMatchingCookies_inDomain_secure___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  void *v15;
  id v16;
  id v17;
  char v19;
  id v20;
  id v21[4];
  id location[10];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v21[3] = a3;
  v21[2] = a4;
  v21[1] = (id)a1;
  v15 = *(void **)(a1 + 32);
  v17 = (id)objc_msgSend(location[0], "name");
  v16 = (id)objc_msgSend(location[0], "name");
  v4 = (void *)objc_msgSend(v16, "length");
  location[7] = 0;
  location[6] = v4;
  location[8] = 0;
  location[9] = v4;
  v21[0] = (id)objc_msgSend(v15, "firstMatchInString:options:range:", v17, 0, 0, v4);

  if (!*(_QWORD *)(a1 + 32) || v21[0] && objc_msgSend(v21[0], "range") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(void **)(a1 + 40);
    v12 = (id)objc_msgSend(location[0], "domain");
    v11 = (id)objc_msgSend(location[0], "domain");
    v5 = (void *)objc_msgSend(v11, "length");
    location[3] = 0;
    location[2] = v5;
    location[4] = 0;
    location[5] = v5;
    v6 = (id)objc_msgSend(v10, "firstMatchInString:options:range:", v12, 0, 0, v5);
    v7 = v21[0];
    v21[0] = v6;

    if (!*(_QWORD *)(a1 + 40) || v21[0] && objc_msgSend(v21[0], "range") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = (id)objc_msgSend(location[0], "expiresDate");
      v19 = 0;
      v9 = 1;
      if (v8)
      {
        v20 = (id)objc_msgSend(location[0], "expiresDate");
        v19 = 1;
        v9 = objc_msgSend(v20, "compare:", *(_QWORD *)(a1 + 48)) != -1;
      }
      if ((v19 & 1) != 0)

      if (v9)
        objc_msgSend(*(id *)(a1 + 56), "addObject:", location[0]);
    }
  }
  objc_storeStrong(v21, 0);
  objc_storeStrong(location, 0);
}

- (id)allCookies
{
  NSHTTPCookieStorage *v3;
  NSArray *v4;

  v3 = -[MCLURLDataLoader cookieStorage](self, "cookieStorage");
  v4 = -[NSHTTPCookieStorage cookies](v3, "cookies");

  return v4;
}

- (BOOL)deleteCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  char v6;
  id v7;
  id v8;
  BOOL v9;
  MCLURLDataLoader *v10;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  char v24;
  BOOL v25;
  id v26;
  id location[2];
  MCLURLDataLoader *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x20000000;
  v23 = 32;
  v24 = 0;
  v19 = -[MCLURLDataLoader cookieStorage](v28, "cookieStorage");
  v10 = v28;
  v7 = location[0];
  v8 = v26;
  v9 = v25;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __57__MCLURLDataLoader_Cookie__deleteCookie_inDomain_secure___block_invoke;
  v17 = &unk_24E09A0A8;
  v18[0] = v19;
  v18[1] = &v20;
  -[MCLURLDataLoader enumerateCookies:inDomain:secure:withBlock:](v10, "enumerateCookies:inDomain:secure:withBlock:", v7, v8, v9, &v13);
  v6 = *((_BYTE *)v21 + 24);
  objc_storeStrong(v18, 0);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __57__MCLURLDataLoader_Cookie__deleteCookie_inDomain_secure___block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "deleteCookie:", location[0]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong(location, 0);
}

- (void)deleteCookiesMatchingPredicate:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  id v9;
  NSHTTPCookieStorage *v10;
  NSHTTPCookieStorage *v11;
  id location[2];
  MCLURLDataLoader *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = -[MCLURLDataLoader cookieStorage](v13, "cookieStorage");
  v3 = -[NSHTTPCookieStorage cookies](v11, "cookies");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __59__MCLURLDataLoader_Cookie__deleteCookiesMatchingPredicate___block_invoke;
  v8 = &unk_24E09A0D0;
  v9 = location[0];
  v10 = v11;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __59__MCLURLDataLoader_Cookie__deleteCookiesMatchingPredicate___block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(a1[4], "evaluateWithObject:", location[0]) & 1) != 0)
    objc_msgSend(a1[5], "deleteCookie:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)enumerateCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 withBlock:(id)a6
{
  const __CFString *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSHTTPCookieStorage *v11;
  void *v12;
  id v13;
  NSHTTPCookieStorage *v14;
  id v18;
  NSArray *v19;
  id v20;
  BOOL v21;
  id v22;
  id location[2];
  MCLURLDataLoader *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = a5;
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  if (objc_msgSend(v22, "length"))
  {
    v12 = (void *)MEMORY[0x24BDBCF48];
    if (v21)
      v6 = CFSTR("https");
    else
      v6 = CFSTR("http");
    v13 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@"), v6, v22);
    v18 = (id)objc_msgSend(v12, "URLWithString:");

    v14 = -[MCLURLDataLoader cookieStorage](v24, "cookieStorage");
    v7 = -[NSHTTPCookieStorage cookiesForURL:](v14, "cookiesForURL:", v18);
    v8 = v19;
    v19 = v7;

    objc_storeStrong(&v18, 0);
  }
  else
  {
    v11 = -[MCLURLDataLoader cookieStorage](v24, "cookieStorage");
    v9 = -[NSHTTPCookieStorage cookies](v11, "cookies");
    v10 = v19;
    v19 = v9;

  }
  -[MCLURLDataLoader enumerateCookies:secure:cookies:withBlock:](v24, "enumerateCookies:secure:cookies:withBlock:", location[0], v21, v19, v20);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)enumerateCookies:(id)a3 secure:(BOOL)a4 cookies:(id)a5 withBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  BOOL v15;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v9 = v14;
  v10 = location[0];
  v12 = v15;
  v11 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __70__MCLURLDataLoader_Cookie__enumerateCookies_secure_cookies_withBlock___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2;
  BOOL v3;
  char v5;
  id v6;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  if (!*(_QWORD *)(a1 + 32)
    || (v6 = (id)objc_msgSend(location[0], "name"),
        v5 = 1,
        v3 = 0,
        (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0))
  {
    v2 = 1;
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      v2 = (objc_msgSend(location[0], "isSecure") & 1) == (*(_BYTE *)(a1 + 48) & 1);
    v3 = v2;
  }
  if ((v5 & 1) != 0)

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

- (id)cookiesForURL:(id)a3
{
  NSHTTPCookieStorage *v4;
  NSArray *v5;
  id location[2];
  MCLURLDataLoader *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[MCLURLDataLoader cookieStorage](v7, "cookieStorage");
  v5 = -[NSHTTPCookieStorage cookiesForURL:](v4, "cookiesForURL:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (id)downloadImageFromURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  MCLURLDataLoader *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v8 = v14;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", location[0]);
  v10 = -[MCLURLDataLoader downloadImageWithRequest:category:completionHandler:](v8, "downloadImageWithRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)downloadImageWithRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  NSObject *queue;
  id v7;
  id v10;
  id v11;
  id v12;
  id v13;
  MCLURLDataLoader *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  MCLURLDataLoader *v21;
  id v22;
  id v23;
  id v24[5];
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31[3];
  id v32;
  _QWORD v33[2];
  int v34;
  int v35;
  char v36;
  _QWORD v37[2];
  int v38;
  int v39;
  char v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id location[2];
  MCLURLDataLoader *v46;

  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v43 = 0;
  objc_storeStrong(&v43, a5);
  v42 = (id)objc_msgSend(location[0], "URL");
  v11 = -[MCLURLDataLoader imagesDownloadDirectory](v46, "imagesDownloadDirectory");
  v10 = +[MCLURLDataLoader uniqueImageKeyForURL:](MCLURLDataLoader, "uniqueImageKeyForURL:", v42);
  v41 = (id)objc_msgSend(v11, "stringByAppendingPathComponent:");

  v37[0] = 0;
  v37[1] = v37;
  v38 = 0x20000000;
  v39 = 32;
  v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v34 = 0x20000000;
  v35 = 32;
  v36 = 0;
  v14 = v46;
  v12 = location[0];
  v13 = v41;
  v25 = MEMORY[0x24BDAC760];
  v26 = -1073741824;
  v27 = 0;
  v28 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke;
  v29 = &unk_24E09A170;
  v31[1] = v37;
  v30 = v41;
  v31[2] = v33;
  v31[0] = v43;
  v32 = -[MCLURLDataLoader downloadRequest:toPath:category:completionHandler:](v14, "downloadRequest:toPath:category:completionHandler:", v12, v13, CFSTR("low"), &v25);
  queue = dispatch_get_global_queue(2, 0);
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_4;
  v19 = &unk_24E09A1C0;
  v20 = v41;
  v24[1] = v37;
  v24[2] = v33;
  v24[0] = v43;
  v21 = v46;
  v22 = v44;
  v23 = v32;
  dispatch_async(queue, &v15);

  v7 = v32;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v31, 0);
  objc_storeStrong(&v30, 0);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v37, 8);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v3;
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14[2];
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(_QWORD *);
  void *v19;
  id v20;
  id v21;
  id v22[2];
  id v23[2];
  id v24;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = (id)a1;
  if (v24 || (objc_msgSend(location[0], "responseOk") & 1) == 0)
  {
    v3 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_3;
    v11 = &unk_24E09A148;
    v14[1] = *(id *)(a1 + 56);
    v14[0] = *(id *)(a1 + 40);
    v12 = v24;
    v13 = location[0];
    dispatch_async(v3, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v14, 0);
  }
  else if ((objc_msgSend(location[0], "cachedResponse") & 1) == 0
         || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) == 0)
  {
    v23[0] = UIImageWithContentsOfFile(*(void **)(a1 + 32), 1);
    queue = MEMORY[0x24BDAC9B8];
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_2;
    v19 = &unk_24E09A148;
    v22[1] = *(id *)(a1 + 56);
    v22[0] = *(id *)(a1 + 40);
    v20 = v23[0];
    v21 = location[0];
    dispatch_async(queue, &v15);

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(v22, 0);
    objc_storeStrong(v23, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4]);
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
}

void __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_4(uint64_t a1)
{
  id v1;
  NSObject *queue;
  id v4;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v15 = a1;
  v14 = 0;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = 0;
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", *(_QWORD *)(a1 + 32), &v14) & 1) != 0)
    v5 = v14 ^ 1;

  if ((v5 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v13 = UIImageWithContentsOfFile(*(void **)(a1 + 32), 0);
    if (v13)
    {
      queue = MEMORY[0x24BDAC9B8];
      v6 = MEMORY[0x24BDAC760];
      v7 = -1073741824;
      v8 = 0;
      v9 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_5;
      v10 = &unk_24E09A198;
      v12[1] = *(id *)(a1 + 80);
      v12[0] = *(id *)(a1 + 64);
      v11 = v13;
      dispatch_async(queue, &v6);

      objc_storeStrong(&v11, 0);
      objc_storeStrong(v12, 0);
    }
    else
    {
      v1 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      objc_msgSend(v1, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);

    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setCategory:forTask:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_5(uint64_t result)
{
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

- (id)imagesDownloadDirectory
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&imagesDownloadDirectory_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_11);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)imagesDownloadDirectory_imagesDownloadDirectory;
}

void __50__MCLURLDataLoader_Image__imagesDownloadDirectory__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  NSArray *v3;
  id v4;

  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
  v0 = (id)objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MCLURLDataLoaderImages"));
  v1 = (void *)imagesDownloadDirectory_imagesDownloadDirectory;
  imagesDownloadDirectory_imagesDownloadDirectory = (uint64_t)v0;

  v4 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
  objc_msgSend(v4, "addCacheLocation:", imagesDownloadDirectory_imagesDownloadDirectory);

}

+ (id)uniqueImageKeyForURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  id *v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id v26;
  id location[2];
  id v28;
  id v29;
  dispatch_once_t *v30;

  v28 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = (dispatch_once_t *)&uniqueImageKeyForURL__onceToken;
  v29 = 0;
  objc_storeStrong(&v29, &__block_literal_global_5);
  if (*v30 != -1)
    dispatch_once(v30, v29);
  objc_storeStrong(&v29, 0);
  v26 = (id)objc_msgSend(v28, "uniqueKeyForURL:", location[0]);
  v19 = 0;
  v20 = (id *)&v19;
  v21 = 838860800;
  v22 = 48;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = (id)objc_msgSend(v26, "pathExtension");
  v11 = (id)objc_msgSend(v26, "stringByDeletingPathExtension");
  v3 = (id)objc_msgSend(v11, "stringByAppendingString:", uniqueImageKeyForURL__screenScale);
  v4 = v26;
  v26 = v3;

  if (!objc_msgSend(v20[5], "length"))
  {
    objc_storeStrong(v20 + 5, CFSTR("image"));
    v10 = objc_alloc(MEMORY[0x24BDD1808]);
    v18 = (id)objc_msgSend(v10, "initWithURL:resolvingAgainstBaseURL:", location[0], 0);
    v9 = (id)objc_msgSend(v18, "queryItems");
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __48__MCLURLDataLoader_Image__uniqueImageKeyForURL___block_invoke_15;
    v16 = &unk_24E09A228;
    v17 = &v19;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);

    objc_storeStrong(&v18, 0);
  }
  if (objc_msgSend(v20[5], "length"))
  {
    v5 = (id)objc_msgSend(v26, "stringByAppendingPathExtension:", v20[5]);
    v6 = v26;
    v26 = v5;

  }
  v8 = v26;
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v8;
}

void __48__MCLURLDataLoader_Image__uniqueImageKeyForURL___block_invoke()
{
  double v0;
  id v1;
  unint64_t v2;
  char v3;
  id v4;

  v1 = (id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  objc_msgSend(v1, "scale");
  v2 = (unint64_t)v0;

  v3 = 0;
  if (v2 <= 1)
  {
    objc_storeStrong((id *)&uniqueImageKeyForURL__screenScale, &stru_24E09C510);
  }
  else
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%lux"), v2);
    v3 = 1;
    objc_storeStrong((id *)&uniqueImageKeyForURL__screenScale, v4);
  }
  if ((v3 & 1) != 0)

}

void __48__MCLURLDataLoader_Image__uniqueImageKeyForURL___block_invoke_15(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  char v5;
  id v8;
  char v9;
  char v10;
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = (id)objc_msgSend(location[0], "value");
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("png"));

  if ((v9 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("png"));
    *a4 = 1;
  }
  else
  {
    v4 = (id)objc_msgSend(location[0], "value");
    v10 = 0;
    v5 = 1;
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("jpeg")) & 1) == 0)
    {
      v11 = (id)objc_msgSend(location[0], "value");
      v10 = 1;
      v5 = objc_msgSend(v11, "hasPrefix:", CFSTR("jpg"));
    }
    if ((v10 & 1) != 0)

    if ((v5 & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("jpeg"));
      *a4 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

+ (void)addSessionConfigurator:(id)a3
{
  void *v3;
  id v4;
  id location[3];
  id v6;
  dispatch_once_t *v7;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (dispatch_once_t *)&addSessionConfigurator__onceToken;
  v6 = 0;
  objc_storeStrong(&v6, &__block_literal_global_12);
  if (*v7 != -1)
    dispatch_once(v7, v6);
  objc_storeStrong(&v6, 0);
  v3 = (void *)_sessionConfigurators;
  v4 = _Block_copy(location[0]);
  objc_msgSend(v3, "addObject:");

  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_addSessionConfigurator___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)_sessionConfigurators;
  _sessionConfigurators = (uint64_t)v0;

}

+ (id)shared
{
  uint64_t obj;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __26__MCLURLDataLoader_shared__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&shared_onceToken_1;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)shared;
}

uint64_t __26__MCLURLDataLoader_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared;
  shared = (uint64_t)v1;

  return objc_msgSend((id)shared, "configureSession");
}

- (MCLURLDataLoader)init
{
  uint64_t v2;
  NSMutableDictionary *priorities;
  uint64_t v4;
  NSMutableArray *taskQueue;
  NSRecursiveLock *v6;
  NSRecursiveLock *taskQueueLock;
  uint64_t v8;
  NSMutableDictionary *activeTasks;
  uint64_t v10;
  NSMutableArray *sessionTasks;
  uint64_t v12;
  NSMutableOrderedSet *duplicateTasks;
  uint64_t v14;
  NSMutableOrderedSet *rewriteRules;
  NSString *v16;
  NSString *downloadCacheDirectory;
  NSHTTPCookieStorage *v18;
  NSHTTPCookieStorage *cookieStorage;
  MCLURLDataLoader *v21;
  NSMutableDictionary *v22;
  id v23;
  id v24;
  id v25;
  NSArray *v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  SEL v31;
  MCLURLDataLoader *v32;
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  v32 = 0;
  v30.receiver = self;
  v30.super_class = (Class)MCLURLDataLoader;
  v32 = -[MCLURLDataLoader init](&v30, sel_init);
  objc_storeStrong((id *)&v32, v32);
  if (v32)
  {
    v32->_backgroundTaskIdentifier = *MEMORY[0x24BEBE030];
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
    priorities = v32->_priorities;
    v32->_priorities = (NSMutableDictionary *)v2;

    v22 = v32->_priorities;
    v33[0] = CFSTR("suspended");
    v34[0] = &unk_24E0A4D80;
    v33[1] = CFSTR("lowest");
    v34[1] = &unk_24E0A4D98;
    v33[2] = CFSTR("low");
    v34[2] = &unk_24E0A4DB0;
    v33[3] = CFSTR("normal");
    v34[3] = &unk_24E0A4DC8;
    v33[4] = CFSTR("high");
    v34[4] = &unk_24E0A4DE0;
    v33[5] = CFSTR("highest");
    v34[5] = &unk_24E0A4DF8;
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
    -[NSMutableDictionary addEntriesFromDictionary:](v22, "addEntriesFromDictionary:");

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 128);
    taskQueue = v32->_taskQueue;
    v32->_taskQueue = (NSMutableArray *)v4;

    v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    taskQueueLock = v32->_taskQueueLock;
    v32->_taskQueueLock = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:");
    activeTasks = v32->_activeTasks;
    v32->_activeTasks = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 20);
    sessionTasks = v32->_sessionTasks;
    v32->_sessionTasks = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", 20);
    duplicateTasks = v32->_duplicateTasks;
    v32->_duplicateTasks = (NSMutableOrderedSet *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", 4);
    rewriteRules = v32->_rewriteRules;
    v32->_rewriteRules = (NSMutableOrderedSet *)v14;

    v26 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v25 = -[NSArray objectAtIndex:](v26, "objectAtIndex:", 0);
    v24 = (id)objc_msgSend((id)objc_opt_class(), "description");
    v16 = (NSString *)(id)objc_msgSend(v25, "stringByAppendingPathComponent:");
    downloadCacheDirectory = v32->_downloadCacheDirectory;
    v32->_downloadCacheDirectory = v16;

    v18 = (NSHTTPCookieStorage *)(id)objc_msgSend(MEMORY[0x24BDD15B0], "sharedHTTPCookieStorage");
    cookieStorage = v32->_cookieStorage;
    v32->_cookieStorage = v18;

    -[MCLURLDataLoader setupCache:](v32, "setupCache:", 0);
    v27 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v27, "addObserver:selector:name:object:", v32, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BEBDF98]);

    v28 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v28, "addObserver:selector:name:object:", v32, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x24BEBE008], 0);

    v29 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v29, "addObserver:selector:name:object:", v32, sel_applicationDidBecomeActiveNotification_, *MEMORY[0x24BEBDF88], 0);

  }
  v21 = v32;
  objc_storeStrong((id *)&v32, 0);
  return v21;
}

- (void)dispose
{
  NSOperationQueue *v2;
  id v3[2];
  MCLURLDataLoader *v4;

  v4 = self;
  v3[1] = (id)a2;
  v3[0] = self->_session;
  objc_storeStrong((id *)&v4->_session, 0);
  objc_msgSend(v3[0], "invalidateAndCancel");
  v2 = v4->_operationQueue;
  objc_storeStrong((id *)&v4->_operationQueue, 0);
  -[NSOperationQueue cancelAllOperations](v2, "cancelAllOperations");
  objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.01);
  -[NSRecursiveLock lock](v4->_taskQueueLock, "lock");
  -[NSMutableArray removeAllObjects](v4->_taskQueue, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v4->_activeTasks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v4->_sessionTasks, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](v4->_duplicateTasks, "removeAllObjects");
  -[NSRecursiveLock unlock](v4->_taskQueueLock, "unlock");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](v2, "waitUntilAllOperationsAreFinished");
  objc_storeStrong((id *)&v4->_cache, 0);
  objc_storeStrong((id *)&v2, 0);
  objc_storeStrong(v3, 0);
}

- (NSURLCache)cache
{
  NSString *v2;
  NSString *cachePath;
  id v4;
  uint64_t v5;
  NSURLCache *cache;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  MCLURLDataLoader *v17;
  id v18;
  uint64_t v19;
  SEL v20;
  MCLURLDataLoader *v21;
  id location;
  dispatch_once_t *v23;

  v21 = self;
  v20 = a2;
  if (!self->_cache)
  {
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = objc_msgSend(v10, "integerForKey:", CFSTR("MCLURLDataLoader.cacheVersion"));

    v19 = v11;
    if (!v11)
    {
      v8 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      objc_msgSend(v8, "setInteger:forKey:", 0, CFSTR("MCLURLDataLoader.cacheVersion"));

      v9 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      objc_msgSend(v9, "synchronize");

    }
    v18 = (id)objc_msgSend((id)objc_opt_class(), "description");
    v2 = (NSString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%ld"), v18, v19);
    cachePath = v21->_cachePath;
    v21->_cachePath = v2;

    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __25__MCLURLDataLoader_cache__block_invoke;
    v16 = &unk_24E099940;
    v17 = v21;
    v23 = (dispatch_once_t *)&cache_onceToken;
    location = 0;
    objc_storeStrong(&location, &v12);
    if (*v23 != -1)
      dispatch_once(v23, location);
    objc_storeStrong(&location, 0);
    v4 = objc_alloc(MEMORY[0x24BDD1800]);
    v5 = objc_msgSend(v4, "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 1000000000, v21->_cachePath);
    cache = v21->_cache;
    v21->_cache = (NSURLCache *)v5;

    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  return v21->_cache;
}

uint64_t __25__MCLURLDataLoader_cache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearOldCaches:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a1, a1);
}

- (void)setupCache:(BOOL)a3
{
  NSString *downloadCacheDirectory;
  NSSet *v4;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *, uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  SEL v16;
  MCLURLDataLoader *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = 0;
  downloadCacheDirectory = v17->_downloadCacheDirectory;
  v12 = 0;
  v5 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", downloadCacheDirectory, 1, 0, &v12);
  objc_storeStrong(&v13, v12);
  if ((v5 & 1) == 0)
    NSLog(CFSTR("Error creating downloads directory: %@"), v13);
  if (v15)
  {
    v4 = -[MCLURLDataLoader cacheLocations](v17, "cacheLocations");
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __31__MCLURLDataLoader_setupCache___block_invoke;
    v10 = &unk_24E099558;
    v11 = v14;
    -[NSSet enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", &v6);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
}

void __31__MCLURLDataLoader_setupCache___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v3;
  char v4;
  void *v7;
  id v8;
  char v9;
  id v10;
  id v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = a3;
  v13 = a1;
  v7 = (void *)a1[4];
  v8 = (id)objc_msgSend(location[0], "stringByDeletingLastPathComponent");
  v9 = objc_msgSend(v7, "isWritableFileAtPath:");

  if ((v9 & 1) != 0)
  {
    v11 = 0;
    v3 = (void *)a1[4];
    v10 = 0;
    v4 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", location[0], 1, 0, &v10);
    objc_storeStrong(&v11, v10);
    if ((v4 & 1) == 0)
      NSLog(CFSTR("Error creating cache directory: %@"), v11);
    objc_storeStrong(&v11, 0);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)clearOldCaches:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  MCLURLDataLoader *v11;
  id v12[2];
  void *v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Clear Cache"), 0);

  v13 = (void *)v4;
  queue = dispatch_get_global_queue(2, 0);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __35__MCLURLDataLoader_clearOldCaches___block_invoke;
  v10 = &unk_24E09A2E8;
  v11 = v15;
  v12[0] = location[0];
  v12[1] = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __35__MCLURLDataLoader_clearOldCaches___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backgroundClearOldCaches:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) != *MEMORY[0x24BEBE030])
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    objc_msgSend(v1, "endBackgroundTask:", *(_QWORD *)(a1 + 48));

  }
}

- (void)backgroundClearOldCaches:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  NSSet *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  MCLURLDataLoader *v16;
  id v17;
  id v18;
  id v19[2];
  int v20;
  int v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  MCLURLDataLoader *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (id)objc_msgSend(v4, "bundleIdentifier");
  v30 = (id)objc_msgSend(v5, "stringByAppendingPathComponent:");

  v29 = (id)objc_msgSend((id)objc_opt_class(), "description");
  v28 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (id)objc_msgSend(v28, "contentsOfDirectoryAtPath:error:", v30, 0);
  v8 = MEMORY[0x24BDAC760];
  v19[1] = (id)MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke;
  v23 = &unk_24E09A310;
  v24 = location[0];
  v25 = v29;
  v26 = v30;
  v27 = v28;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:");

  v19[0] = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -604800.0);
  v18 = (id)objc_msgSend(v30, "stringByAppendingPathComponent:", location[0]);
  objc_msgSend((id)objc_opt_class(), "removeFilesOlderThan:inDirectory:", v19[0], v18);
  v9 = -[MCLURLDataLoader cacheLocations](v32, "cacheLocations");
  v10 = v8;
  v11 = -1073741824;
  v12 = 0;
  v13 = __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke_2;
  v14 = &unk_24E09A338;
  v15 = v28;
  v16 = v32;
  v17 = v19[0];
  -[NSSet enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  char v5;
  id obj;
  id v10;
  id v11[4];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[3] = a3;
  v11[2] = a4;
  v11[1] = (id)a1;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", location[0]) & 1) == 0
    && (objc_msgSend(location[0], "hasPrefix:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v11[0] = 0;
    v10 = (id)objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", location[0]);
    v4 = *(void **)(a1 + 56);
    obj = v11[0];
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v10, &obj);
    objc_storeStrong(v11, obj);
    if ((v5 & 1) == 0)
      NSLog(CFSTR("Error deleting caches directory: %@"), v11[0]);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(*(id *)(a1 + 32), "isDeletableFileAtPath:", location[0]) & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "removeFilesOlderThan:inDirectory:", *(_QWORD *)(a1 + 48), location[0]);
  objc_storeStrong(location, 0);
}

+ (void)removeFilesOlderThan:(id)a3 inDirectory:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (id)objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v15, 0);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __53__MCLURLDataLoader_removeFilesOlderThan_inDirectory___block_invoke;
  v10 = &unk_24E09A360;
  v11 = v15;
  v12 = v14;
  v13 = location[0];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __53__MCLURLDataLoader_removeFilesOlderThan_inDirectory___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  char v5;
  id v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id v14[4];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  v14[2] = a4;
  v14[1] = (id)a1;
  v14[0] = (id)objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", location[0]);
  v13 = (id)objc_msgSend(*(id *)(a1 + 40), "attributesOfItemAtPath:error:", v14[0], 0);
  v9 = (id)objc_msgSend(v13, "fileModificationDate");
  LOBYTE(v10) = 0;
  if (objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 48)) == -1)
    v10 = objc_msgSend(location[0], "hasPrefix:", CFSTR("Cache.db")) ^ 1;

  if ((v10 & 1) != 0)
  {
    v12 = 0;
    v4 = *(void **)(a1 + 40);
    v11 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v14[0], &v11);
    objc_storeStrong(&v12, v11);
    if ((v5 & 1) == 0)
      NSLog(CFSTR("Error deleting cache file: %@"), v12);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (void)clearCache
{
  NSString *downloadCacheDirectory;
  NSSet *v3;
  id v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22[2];
  id v23[2];
  MCLURLDataLoader *v24;

  v24 = self;
  v23[1] = (id)a2;
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MCLURLDataLoaderWillClearCache"), v24);

  v23[0] = v24->_cache;
  -[MCLURLDataLoader dispose](v24, "dispose");
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = objc_msgSend(v7, "integerForKey:");

  v9 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22[1] = (id)(v8 + 1);
  objc_msgSend(v9, "setInteger:forKey:");

  v10 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  objc_msgSend(v10, "synchronize");

  objc_msgSend(v23[0], "removeAllCachedResponses");
  v22[0] = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = 0;
  v20 = -[NSString stringByAppendingPathExtension:](v24->_downloadCacheDirectory, "stringByAppendingPathExtension:", CFSTR("0"));
  downloadCacheDirectory = v24->_downloadCacheDirectory;
  v19 = v21;
  v11 = objc_msgSend(v22[0], "moveItemAtPath:toPath:error:", downloadCacheDirectory, v20, &v19);
  objc_storeStrong(&v21, v19);
  if ((v11 & 1) == 0
    || (v18 = v21,
        v5 = objc_msgSend(v22[0], "removeItemAtPath:error:", v20, &v18),
        objc_storeStrong(&v21, v18),
        (v5 & 1) == 0))
  {
    NSLog(CFSTR("Error deleting downloads directory: %@"), v21);
  }
  v3 = -[MCLURLDataLoader cacheLocations](v24, "cacheLocations");
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __30__MCLURLDataLoader_clearCache__block_invoke;
  v16 = &unk_24E099558;
  v17 = v22[0];
  -[NSSet enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", &v12);

  -[MCLURLDataLoader setupCache:](v24, "setupCache:", 1);
  -[MCLURLDataLoader configureSession](v24, "configureSession");
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MCLURLDataLoaderDidClearCache"), v24);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(v23, 0);
}

void __30__MCLURLDataLoader_clearCache__block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  NSObject *queue;
  char v5;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18[3];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v18[2] = a3;
  v18[1] = a1;
  v18[0] = 0;
  v17 = (id)objc_msgSend(location[0], "stringByAppendingPathExtension:", CFSTR("0"));
  if ((objc_msgSend(a1[4], "fileExistsAtPath:", location[0]) & 1) != 0)
  {
    v3 = a1[4];
    v15 = v18[0];
    v5 = objc_msgSend(v3, "moveItemAtPath:toPath:error:", location[0], v17, &v15);
    objc_storeStrong(v18, v15);
    if ((v5 & 1) != 0)
    {
      queue = dispatch_get_global_queue(-32768, 0);
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __30__MCLURLDataLoader_clearCache__block_invoke_2;
      v12 = &unk_24E099990;
      v13 = a1[4];
      v14 = v17;
      dispatch_async(queue, &v8);

      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      NSLog(CFSTR("Error moving cache directory: %@"), v18[0]);
    }
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  if (!v16)
    v16 = 0;
  objc_storeStrong(location, 0);
}

void __30__MCLURLDataLoader_clearCache__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v6[0] = 0;
  v2 = (void *)a1[4];
  v3 = a1[5];
  obj = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &obj);
  objc_storeStrong(v6, obj);
  if ((v4 & 1) == 0)
    NSLog(CFSTR("Error deleting cache directory: %@"), v6[0]);
  objc_storeStrong(v6, 0);
}

- (void)removeCachedResponseForRequest:(id)a3
{
  NSOperationQueue *operationQueue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (id)objc_msgSend(location[0], "mutableCopy");
  objc_msgSend((id)objc_opt_class(), "applyDefaultRequestHeaders:", v12);
  -[MCLURLDataLoader processURLRequestRewrite:](v14, "processURLRequestRewrite:", v12);
  objc_initWeak(&v11, v14);
  operationQueue = v14->_operationQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__MCLURLDataLoader_removeCachedResponseForRequest___block_invoke;
  v8 = &unk_24E09A388;
  objc_copyWeak(&v10, &v11);
  v9 = v12;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __51__MCLURLDataLoader_removeCachedResponseForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "backgroundRemoveCachedResponseForRequest:", *(_QWORD *)(a1 + 32));

}

- (void)backgroundRemoveCachedResponseForRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id obj;
  uint64_t v16;
  NSString *downloadCacheDirectory;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD __b[8];
  id v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  MCLURLDataLoader *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[MCLURLDataLoader _removeCachedResponseForRequest:force:](v28, "_removeCachedResponseForRequest:force:", location[0], 1);
  downloadCacheDirectory = v28->_downloadCacheDirectory;
  v19 = (id)objc_msgSend(location[0], "URL");
  v18 = +[MCLURLDataLoader uniqueKeyForURL:](MCLURLDataLoader, "uniqueKeyForURL:");
  v26 = -[NSString stringByAppendingPathComponent:](downloadCacheDirectory, "stringByAppendingPathComponent:");

  v25 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (id)objc_msgSend(v26, "pathExtension");
  v21 = objc_msgSend(v20, "length") != 0;

  if (v21)
  {
    objc_msgSend(v25, "removeItemAtPath:error:", v26, 0);
  }
  else
  {
    v24 = (id)objc_msgSend(v26, "lastPathComponent");
    memset(__b, 0, sizeof(__b));
    v13 = v25;
    v14 = (id)objc_msgSend(v26, "stringByDeletingLastPathComponent");
    obj = (id)objc_msgSend(v13, "enumeratorAtPath:");

    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v16)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v16;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(obj);
        v23 = *(id *)(__b[1] + 8 * v11);
        v7 = (id)objc_msgSend(v23, "stringByDeletingPathExtension");
        v8 = objc_msgSend(v7, "isEqualToString:", v24);

        if ((v8 & 1) != 0)
        {
          v4 = v25;
          v3 = v26;
          v6 = (id)objc_msgSend(v23, "pathExtension");
          v5 = (id)objc_msgSend(v3, "stringByAppendingPathExtension:");
          objc_msgSend(v4, "removeItemAtPath:error:");

        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v12)
            break;
        }
      }
    }

    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)flushCache
{
  -[NSURLSession flushWithCompletionHandler:](self->_session, "flushWithCompletionHandler:", &__block_literal_global_73, a2, self);
}

- (void)addCacheLocation:(id)a3
{
  id v3;
  NSArray *v4;
  NSSet *v5;
  NSSet *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(_QWORD *, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  MCLURLDataLoader *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = v20;
  v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", location[0], 1, 0, &v19);
  objc_storeStrong(&v20, v19);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Error creating cache directory: %@"), v20);
  v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = -[NSArray firstObject](v4, "firstObject");
  v18 = (id)objc_msgSend(v3, "stringByDeletingLastPathComponent");

  v6 = -[MCLURLDataLoader cacheLocations](v22, "cacheLocations");
  v11 = MEMORY[0x24BDAC760];
  v12 = -1073741824;
  v13 = 0;
  v14 = __37__MCLURLDataLoader_addCacheLocation___block_invoke;
  v15 = &unk_24E09A3D0;
  v16 = v18;
  v5 = -[NSSet objectsPassingTest:](v6, "objectsPassingTest:", &v11);
  v17 = (id)-[NSSet mutableCopy](v5, "mutableCopy");

  objc_msgSend(v17, "addObject:", location[0]);
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_msgSend(v17, "allObjects");
  objc_msgSend(v8, "setObject:forKey:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

uint64_t __37__MCLURLDataLoader_addCacheLocation___block_invoke(_QWORD *a1, void *a2)
{
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = objc_msgSend(location[0], "hasPrefix:", a1[4]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (NSArray)rewriteRules
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_rewriteRules, "array", a2, self);
}

- (void)addRewriteRule:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[NSMutableOrderedSet addObject:](v4->_rewriteRules, "addObject:", location[0]);
  -[NSMutableOrderedSet sortWithOptions:usingComparator:](v4->_rewriteRules, "sortWithOptions:usingComparator:", 16, &__block_literal_global_76);
  objc_storeStrong(location, 0);
}

uint64_t __35__MCLURLDataLoader_addRewriteRule___block_invoke(void *a1, void *a2, void *a3)
{
  float v3;
  float v4;
  float v7;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_msgSend(location[0], "priority");
  v7 = v3;
  objc_msgSend(v8, "priority");
  if ((float)(v7 - v4) == 0.0)
  {
    v10 = 0;
  }
  else if ((float)(v7 - v4) <= 0.0)
  {
    v10 = -1;
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)removeRewriteRule:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[NSMutableOrderedSet removeObject:](v4->_rewriteRules, "removeObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)removeRewriteRulesWithName:(id)a3
{
  NSMutableOrderedSet *rewriteRules;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id v10;
  id location[2];
  MCLURLDataLoader *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  rewriteRules = v12->_rewriteRules;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__MCLURLDataLoader_removeRewriteRulesWithName___block_invoke;
  v8 = &unk_24E09A438;
  v9 = location[0];
  v10 = (id)-[NSMutableOrderedSet indexesOfObjectsPassingTest:](rewriteRules, "indexesOfObjectsPassingTest:");
  -[NSMutableOrderedSet removeObjectsAtIndexes:](v12->_rewriteRules, "removeObjectsAtIndexes:", v10);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __47__MCLURLDataLoader_removeRewriteRulesWithName___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  char v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "name");
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)removeRewriteRules:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[NSMutableOrderedSet removeObjectsInArray:](v4->_rewriteRules, "removeObjectsInArray:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)removeAllRewriteRules
{
  -[NSMutableOrderedSet removeAllObjects](self->_rewriteRules, "removeAllObjects", a2, self);
}

- (void)applyRewriteRules:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[MCLURLDataLoader processURLRequestRewrite:](v4, "processURLRequestRewrite:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  MCLURLDataLoader *v12;
  BOOL v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v15->_backgroundTaskIdentifier == *MEMORY[0x24BEBE030])
  {
    v13 = 0;
    -[NSRecursiveLock lock](v15->_taskQueueLock, "lock");
    v6 = -[NSMutableDictionary count](v15->_activeTasks, "count");
    v13 = v6 + -[NSMutableArray count](v15->_taskQueue, "count") != 0;
    -[NSRecursiveLock unlock](v15->_taskQueueLock, "unlock");
    if (v13)
    {
      v5 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v4 = (id)objc_msgSend((id)objc_opt_class(), "description");
      v7 = MEMORY[0x24BDAC760];
      v8 = -1073741824;
      v9 = 0;
      v10 = __62__MCLURLDataLoader_applicationDidEnterBackgroundNotification___block_invoke;
      v11 = &unk_24E099940;
      v12 = v15;
      v3 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", v4, &v7);
      v15->_backgroundTaskIdentifier = v3;

      objc_storeStrong((id *)&v12, 0);
    }
    if (v15->_backgroundTaskIdentifier == *MEMORY[0x24BEBE030])
      -[MCLURLDataLoader suspend](v15, "suspend");
  }
  objc_storeStrong(location, 0);
}

uint64_t __62__MCLURLDataLoader_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suspend", a1, a1);
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[MCLURLDataLoader notifyBackgroundStopped](v4, "notifyBackgroundStopped");
  v4->_resuming = 1;
  -[MCLURLDataLoader resume](v4, "resume");
  objc_storeStrong(location, 0);
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_resuming = 0;
  -[MCLURLDataLoader resume](v4, "resume");
  objc_storeStrong(location, 0);
}

- (void)suspend
{
  NSOperationQueue *operationQueue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location[2];
  MCLURLDataLoader *v10;

  v10 = self;
  location[1] = (id)a2;
  if (!self->_suspended)
  {
    v10->_suspended = 1;
    objc_initWeak(location, v10);
    operationQueue = v10->_operationQueue;
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __27__MCLURLDataLoader_suspend__block_invoke;
    v7 = &unk_24E099C50;
    objc_copyWeak(&v8, location);
    -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v3);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __27__MCLURLDataLoader_suspend__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationSuspendSession");

}

- (void)resume
{
  NSOperationQueue *operationQueue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location[2];
  MCLURLDataLoader *v10;

  v10 = self;
  location[1] = (id)a2;
  if (self->_suspended)
  {
    objc_initWeak(location, v10);
    operationQueue = v10->_operationQueue;
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __26__MCLURLDataLoader_resume__block_invoke;
    v7 = &unk_24E099C50;
    objc_copyWeak(&v8, location);
    -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v3);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __26__MCLURLDataLoader_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationResumeSession");

}

+ (void)restart:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend((id)shared, "internalRestart:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)internalRestart:(id)a3
{
  NSOperationQueue *operationQueue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
  v15->_suspended = 1;
  objc_initWeak(&v12, v15);
  operationQueue = v15->_operationQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __36__MCLURLDataLoader_internalRestart___block_invoke;
  v8 = &unk_24E09A460;
  objc_copyWeak(&v11, &v12);
  v9 = v13;
  v10 = location[0];
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v4);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](v15->_operationQueue, "waitUntilAllOperationsAreFinished");
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v12);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

uint64_t __36__MCLURLDataLoader_internalRestart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "operationRestartSession");

  return objc_msgSend(*(id *)(a1 + 32), "addOperationWithBlock:", *(_QWORD *)(a1 + 40));
}

- (void)notifyBackgroundStopped
{
  id v2;

  if (self->_backgroundTaskIdentifier != *MEMORY[0x24BEBE030])
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    objc_msgSend(v2, "endBackgroundTask:", self->_backgroundTaskIdentifier);

    self->_backgroundTaskIdentifier = *MEMORY[0x24BEBE030];
  }
}

- (void)notifyEmptyQueue
{
  id v2;
  BOOL v3;

  if (!self->_resuming)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = objc_msgSend(v2, "applicationState") != 2;

    if (!v3)
      -[MCLURLDataLoader suspend](self, "suspend");
  }
}

- (void)notifyEnqueue
{
  double v2;
  id v3;
  BOOL v4;
  char v5;
  id v6;

  v3 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = 0;
  v4 = 0;
  if (objc_msgSend(v3, "applicationState") == 2)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = 1;
    objc_msgSend(v6, "backgroundTimeRemaining");
    v4 = v2 > 5.0;
  }
  if ((v5 & 1) != 0)

  if (v4)
    -[MCLURLDataLoader resume](self, "resume");
}

- (int64_t)priorityForCategory:(id)a3
{
  id v4;
  int64_t v5;
  id location[2];
  MCLURLDataLoader *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v7->_priorities, "objectForKeyedSubscript:", location[0]);
  v5 = objc_msgSend(v4, "integerValue");

  objc_storeStrong(location, 0);
  return v5;
}

- (void)setPriority:(int64_t)a3 forCategory:(id)a4
{
  id v4;
  id v5;
  NSMutableArray *taskQueue;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(id *, void *);
  void *v15;
  MCLURLDataLoader *v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id location;
  int64_t v27;
  SEL v28;
  MCLURLDataLoader *v29;

  v29 = self;
  v28 = a2;
  v27 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v25 = 0;
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v29->_priorities, "objectForKeyedSubscript:", location);
  v10 = objc_msgSend(v9, "integerValue");

  v25 = v10;
  if (v10 != v27)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29->_priorities, "setObject:forKeyedSubscript:");

    -[NSRecursiveLock lock](v29->_taskQueueLock, "lock");
    v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v24 = (id)objc_msgSend(v5, "initWithCapacity:", -[NSMutableArray count](v29->_taskQueue, "count"));
    taskQueue = v29->_taskQueue;
    v7 = MEMORY[0x24BDAC760];
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __44__MCLURLDataLoader_setPriority_forCategory___block_invoke;
    v21 = &unk_24E09A488;
    v22 = location;
    v23 = v24;
    -[NSMutableArray enumerateObjectsUsingBlock:](taskQueue, "enumerateObjectsUsingBlock:", &v17);
    -[NSRecursiveLock unlock](v29->_taskQueueLock, "unlock");
    v8 = v24;
    v11 = v7;
    v12 = -1073741824;
    v13 = 0;
    v14 = __44__MCLURLDataLoader_setPriority_forCategory___block_invoke_2;
    v15 = &unk_24E09A4B0;
    v16 = v29;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v11);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&location, 0);
}

void __44__MCLURLDataLoader_setPriority_forCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "category");
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v4 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

void __44__MCLURLDataLoader_setPriority_forCategory___block_invoke_2(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "enqueueTask:reschedule:", location[0], 1);
  objc_storeStrong(location, 0);
}

- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id location[2];
  MCLURLDataLoader *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v8 = -[MCLURLDataLoader loadRequest:category:completionHandler:receiveData:](v12, "loadRequest:category:completionHandler:receiveData:", location[0], v10, v9, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5 receiveData:(id)a6
{
  MCLURLDataLoaderTask *v6;
  MCLURLDataLoaderTask *v8;
  __CFString *v9;
  MCLURLDataLoaderTask *v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  MCLURLDataLoader *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  if (v16)
    v9 = (__CFString *)v16;
  else
    v9 = &stru_24E09C510;
  objc_storeStrong(&v16, v9);
  v6 = [MCLURLDataLoaderTask alloc];
  v13 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v6, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", location[0]);
  -[MCLURLDataLoader enqueueTask:reschedule:](v18, "enqueueTask:reschedule:", v13, 0);
  v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)loadURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  MCLURLDataLoader *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v8 = v14;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", location[0]);
  v10 = -[MCLURLDataLoader loadRequest:category:completionHandler:](v8, "loadRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)downloadRequest:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6
{
  MCLURLDataLoaderTask *v6;
  MCLURLDataLoaderTask *v8;
  __CFString *v9;
  MCLURLDataLoaderTask *v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  MCLURLDataLoader *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  if (v15)
    v9 = (__CFString *)v15;
  else
    v9 = &stru_24E09C510;
  objc_storeStrong(&v15, v9);
  v6 = [MCLURLDataLoaderTask alloc];
  v13 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v6, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", location[0], v16, v15, v14);
  -[MCLURLDataLoader enqueueTask:reschedule:](v18, "enqueueTask:reschedule:", v13, 0);
  v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)downloadURL:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6
{
  MCLURLDataLoader *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  MCLURLDataLoader *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v10 = v17;
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", location[0]);
  v12 = -[MCLURLDataLoader downloadRequest:toPath:category:completionHandler:](v10, "downloadRequest:toPath:category:completionHandler:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (id)downloadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  NSString *v5;
  NSString *v6;
  id v8;
  NSString *downloadCacheDirectory;
  id v12;
  id v13;
  NSString *v14;
  BOOL v15;
  NSString *v16;
  id v17;
  id v18;
  id location[2];
  MCLURLDataLoader *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  downloadCacheDirectory = v20->_downloadCacheDirectory;
  v13 = (id)objc_msgSend(location[0], "URL");
  v12 = +[MCLURLDataLoader uniqueKeyForURL:](MCLURLDataLoader, "uniqueKeyForURL:");
  v16 = -[NSString stringByAppendingPathComponent:](downloadCacheDirectory, "stringByAppendingPathComponent:");

  v14 = -[NSString pathExtension](v16, "pathExtension");
  v15 = -[NSString length](v14, "length") != 0;

  if (!v15)
  {
    v5 = -[NSString stringByAppendingPathExtension:](v16, "stringByAppendingPathExtension:", CFSTR("[content_type]"));
    v6 = v16;
    v16 = v5;

  }
  v8 = -[MCLURLDataLoader downloadRequest:toPath:category:completionHandler:](v20, "downloadRequest:toPath:category:completionHandler:", location[0], v16, v18, v17);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)downloadURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  MCLURLDataLoader *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v8 = v14;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", location[0]);
  v10 = -[MCLURLDataLoader downloadRequest:category:completionHandler:](v8, "downloadRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)cancelTask:(id)a3
{
  NSOperationQueue *operationQueue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  MCLURLDataLoader *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "setCancelled:", 1);
  objc_initWeak(&v11, v13);
  operationQueue = v13->_operationQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __31__MCLURLDataLoader_cancelTask___block_invoke;
  v8 = &unk_24E09A388;
  objc_copyWeak(&v10, &v11);
  v9 = location[0];
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __31__MCLURLDataLoader_cancelTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "operationCancelTask:", *(_QWORD *)(a1 + 32));

}

- (void)cancelTasks:(id)a3
{
  id v3;
  NSOperationQueue *operationQueue;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[3];
  id from;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "enumerateObjectsUsingBlock:", &__block_literal_global_83);
  objc_initWeak(&from, v15);
  v5 = (void *)objc_msgSend(location[0], "copy");
  v3 = location[0];
  location[0] = v5;

  operationQueue = v15->_operationQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __32__MCLURLDataLoader_cancelTasks___block_invoke_2;
  v10 = &unk_24E09A540;
  v11 = location[0];
  objc_copyWeak(v12, &from);
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v6);
  objc_destroyWeak(v12);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setCancelled:", 1);
  objc_storeStrong(location, 0);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(id *, void *);
  void *v6;
  id v7[3];

  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v1 = *(void **)(a1 + 32);
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __32__MCLURLDataLoader_cancelTasks___block_invoke_3;
  v6 = &unk_24E09A518;
  objc_copyWeak(v7, (id *)(a1 + 40));
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v2);
  objc_destroyWeak(v7);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke_3(id *a1, void *a2)
{
  id WeakRetained;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "operationCancelTask:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setCategory:(id)a3 forTask:(id)a4
{
  id v5;
  char v6;
  id v7;
  id location[2];
  MCLURLDataLoader *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = (id)objc_msgSend(v7, "category");
  v6 = objc_msgSend(v5, "isEqualToString:", location[0]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "setCategory:", location[0]);
    -[MCLURLDataLoader enqueueTask:reschedule:](v9, "enqueueTask:reschedule:", v7, 1);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setCategory:(id)a3 forTasks:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  MCLURLDataLoader *v12;
  id v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = v13;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __41__MCLURLDataLoader_setCategory_forTasks___block_invoke;
  v10 = &unk_24E09A488;
  v11 = location[0];
  v12 = v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:");
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __41__MCLURLDataLoader_setCategory_forTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "category");
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(location[0], "setCategory:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "enqueueTask:reschedule:", location[0], 1);
  }
  objc_storeStrong(location, 0);
}

+ (id)uniqueKeyForURL:(id)a3
{
  size_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  unint64_t v17;
  int v18;
  char *v19;
  id v20;
  id location[3];
  id v22;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = (id)objc_msgSend(location[0], "absoluteString");

  v19 = (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
  if (v19)
  {
    v3 = strlen(v19);
    v17 = XXH64((unsigned int *)v19, v3, 0);
    v11 = (id)objc_msgSend(location[0], "path");
    v14 = 0;
    if (v11)
    {
      v4 = v11;
    }
    else
    {
      v15 = (id)objc_msgSend(location[0], "resourceSpecifier");
      v14 = 1;
      v4 = v15;
    }
    v16 = v4;
    if ((v14 & 1) != 0)

    v13 = (id)objc_msgSend(v16, "lastPathComponent");
    v12 = (id)objc_msgSend(v13, "pathExtension");
    v10 = (id)objc_msgSend(v13, "stringByDeletingPathExtension");
    v5 = (id)objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("-%llX"), v17);
    v6 = v13;
    v13 = v5;

    if (objc_msgSend(v12, "length"))
    {
      v7 = (id)objc_msgSend(v13, "stringByAppendingPathExtension:", v12);
      v8 = v13;
      v13 = v7;

    }
    v22 = v13;
    v18 = 1;
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v22 = 0;
    v18 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v22;
}

- (id)downloadCachesDirectory
{
  return self->_downloadCacheDirectory;
}

- (NSSet)cacheLocations
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_msgSend(v5, "arrayForKey:", CFSTR("MCLURLDataLoader.cacheLocations"));
  v6 = (id)objc_msgSend(v3, "setWithArray:");

  return (NSSet *)v6;
}

- (void)configureSession
{
  NSURLSession *v2;
  NSURLSession *session;
  void *v4;
  NSOperationQueue *v5;
  id v6;
  id v7;

  if (!self->_session)
  {
    v4 = (void *)MEMORY[0x24BDD1850];
    v6 = -[MCLURLDataLoader defaultSessionConfiguration](self, "defaultSessionConfiguration");
    v5 = -[MCLURLDataLoader operationQueue](self, "operationQueue");
    v2 = (NSURLSession *)(id)objc_msgSend(v4, "sessionWithConfiguration:delegate:delegateQueue:", v6, self);
    session = self->_session;
    self->_session = v2;

    v7 = (id)objc_msgSend((id)objc_opt_class(), "description");
    -[NSURLSession setSessionDescription:](self->_session, "setSessionDescription:");

  }
}

- (id)defaultSessionConfiguration
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10;
  id v11[2];
  MCLURLDataLoader *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  -[MCLURLDataLoader configureSession:](v12, "configureSession:", v11[0]);
  v3 = (void *)_sessionConfigurators;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __47__MCLURLDataLoader_defaultSessionConfiguration__block_invoke;
  v9 = &unk_24E09A568;
  v10 = v11[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __47__MCLURLDataLoader_defaultSessionConfiguration__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*((void (**)(id, _QWORD))location[0] + 2))(location[0], a1[4]);
  objc_storeStrong(location, 0);
}

- (void)configureSession:(id)a3
{
  NSURLCache *v3;
  id location[2];
  MCLURLDataLoader *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "setTimeoutIntervalForRequest:", 15.0);
  objc_msgSend(location[0], "setTimeoutIntervalForResource:", 36000.0);
  objc_msgSend(location[0], "setNetworkServiceType:");
  objc_msgSend(location[0], "setAllowsCellularAccess:", 1);
  objc_msgSend(location[0], "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(location[0], "setHTTPShouldSetCookies:", 1);
  objc_msgSend(location[0], "setHTTPCookieStorage:", v5->_cookieStorage);
  objc_msgSend(location[0], "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(location[0], "setHTTPAdditionalHeaders:", 0);
  objc_msgSend(location[0], "setHTTPMaximumConnectionsPerHost:", 10);
  v3 = -[MCLURLDataLoader cache](v5, "cache");
  objc_msgSend(location[0], "setURLCache:");

  objc_msgSend(location[0], "setRequestCachePolicy:", 0);
  objc_storeStrong(location, 0);
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *v2;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v5;
  id v6;
  NSObject *v7;

  if (!self->_operationQueue)
  {
    v2 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v2;

    v5 = self->_operationQueue;
    v6 = (id)objc_msgSend((id)objc_opt_class(), "description");
    -[NSOperationQueue setName:](v5, "setName:");

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = dispatch_get_global_queue(2, 0);
    -[NSOperationQueue setUnderlyingQueue:](self->_operationQueue, "setUnderlyingQueue:");

    -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", 25);
  }
  return self->_operationQueue;
}

- (void)operationCancelTask:(id)a3
{
  NSMutableArray *sessionTasks;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *, uint64_t, _BYTE *);
  void *v8;
  MCLURLDataLoader *v9;
  id v10;
  id location[2];
  MCLURLDataLoader *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[NSRecursiveLock lock](v12->_taskQueueLock, "lock");
  -[NSMutableArray removeObject:](v12->_taskQueue, "removeObject:", location[0]);
  -[NSMutableOrderedSet removeObject:](v12->_duplicateTasks, "removeObject:", location[0]);
  -[NSRecursiveLock unlock](v12->_taskQueueLock, "unlock");
  sessionTasks = v12->_sessionTasks;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __40__MCLURLDataLoader_operationCancelTask___block_invoke;
  v8 = &unk_24E09A5B8;
  v9 = v12;
  v10 = location[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionTasks, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLURLDataLoader_operationCancelTask___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id v15[2];
  _BYTE *v16;
  uint64_t v17;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = a3;
  v16 = a4;
  v15[1] = a1;
  v15[0] = (id)objc_msgSend(a1[4], "loaderTaskForSessionTask:", location[0]);
  if (v15[0] == a1[5])
  {
    if ((objc_msgSend(a1[5], "download") & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = location[0];
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __40__MCLURLDataLoader_operationCancelTask___block_invoke_2;
      v12 = &unk_24E09A590;
      v13 = a1[4];
      v14 = a1[5];
      objc_msgSend(v4, "cancelByProducingResumeData:", &v8);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      objc_msgSend(location[0], "cancel");
    }
    *v16 = 1;
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLURLDataLoader_operationCancelTask___block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "storeResumeData:forTask:", location[0], *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

- (void)enqueueTask:(id)a3 reschedule:(BOOL)a4
{
  uint64_t v4;
  NSOperationQueue *operationQueue;
  id v6;
  NSMutableArray *taskQueue;
  uint64_t v8;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(_QWORD *, void *, void *);
  void *v21;
  MCLURLDataLoader *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  id location[2];
  MCLURLDataLoader *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  -[NSRecursiveLock lock](v29->_taskQueueLock, "lock");
  if (a4)
  {
    if ((-[NSMutableArray containsObject:](v29->_taskQueue, "containsObject:", location[0]) & 1) == 0)
    {
      -[NSRecursiveLock unlock](v29->_taskQueueLock, "unlock");
      v26 = 1;
      goto LABEL_8;
    }
    -[NSMutableArray removeObject:](v29->_taskQueue, "removeObject:", location[0]);
  }
  v25 = 0;
  taskQueue = v29->_taskQueue;
  v6 = location[0];
  v4 = -[NSMutableArray count](taskQueue, "count");
  v31 = 0;
  v30 = v4;
  v32 = 0;
  v33 = v4;
  v23 = 0;
  v24 = v4;
  v17 = MEMORY[0x24BDAC760];
  v18 = -1073741824;
  v19 = 0;
  v20 = __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke;
  v21 = &unk_24E09A5E0;
  v22 = v29;
  v25 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](taskQueue, "indexOfObject:inSortedRange:options:usingComparator:", v6, v23, v24, 1536, &v17);
  -[NSMutableArray insertObject:atIndex:](v29->_taskQueue, "insertObject:atIndex:", location[0], v25);
  v8 = v25;
  v27 = v8 == -[NSMutableArray count](v29->_taskQueue, "count") - 1;
  -[NSRecursiveLock unlock](v29->_taskQueueLock, "unlock");
  -[MCLURLDataLoader notifyEnqueue](v29, "notifyEnqueue");
  if (v27)
  {
    objc_initWeak(&v16, v29);
    operationQueue = v29->_operationQueue;
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke_2;
    v14 = &unk_24E099C50;
    objc_copyWeak(&v15, &v16);
    -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", &v10);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v16);
  }
  objc_storeStrong((id *)&v22, 0);
  v26 = 0;
LABEL_8:
  objc_storeStrong(location, 0);
}

uint64_t __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v6;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id location[2];
  uint64_t v15;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = 0;
  objc_storeStrong(&v13, a3);
  v6 = (void *)a1[4];
  v11 = (id)objc_msgSend(location[0], "category");
  v9 = objc_msgSend(v6, "priorityForCategory:");
  v8 = (void *)a1[4];
  v10 = (id)objc_msgSend(v13, "category");
  v12 = v9 - objc_msgSend(v8, "priorityForCategory:");

  if (v12)
  {
    v3 = -1;
    if (v12 > 0)
      v3 = 1;
    v15 = v3;
  }
  else
  {
    v15 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v15;
}

void __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationReschedule");

}

- (void)operationReschedule
{
  NSURLSessionDownloadTask *v2;
  id v3;
  NSURLSessionDownloadTask *v4;
  id v5;
  double v6;
  int v7;
  id v8;
  MCLURLDataLoader *v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  id v13;
  BOOL v14;
  NSMutableDictionary *activeTasks;
  unint64_t v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id v21;
  id location;
  BOOL v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(_QWORD *, void *, void *, _BYTE *);
  void *v28;
  id v29[2];
  uint64_t v30;
  uint64_t *v31;
  int v32;
  int v33;
  char v34;
  int v35;
  id v36[2];
  MCLURLDataLoader *v37;

  v37 = self;
  v36[1] = (id)a2;
  if (!self->_suspended && (unint64_t)-[NSMutableDictionary count](v37->_activeTasks, "count") < 0x14)
  {
    -[NSRecursiveLock lock](v37->_taskQueueLock, "lock");
    v36[0] = (id)-[NSMutableArray lastObject](v37->_taskQueue, "lastObject");
    if (v37->_session
      && v36[0]
      && (v16 = -[NSMutableDictionary count](v37->_activeTasks, "count"),
          v16 < -[MCLURLDataLoader connectionsLimitForPriorityOfTask:](v37, "connectionsLimitForPriorityOfTask:", v36[0])))
    {
      -[NSMutableArray removeLastObject](v37->_taskQueue, "removeLastObject");
      -[NSRecursiveLock unlock](v37->_taskQueueLock, "unlock");
      v30 = 0;
      v31 = &v30;
      v32 = 0x20000000;
      v33 = 32;
      v34 = 0;
      activeTasks = v37->_activeTasks;
      v24 = MEMORY[0x24BDAC760];
      v25 = -1073741824;
      v26 = 0;
      v27 = __39__MCLURLDataLoader_operationReschedule__block_invoke;
      v28 = &unk_24E09A608;
      v29[0] = v36[0];
      v29[1] = &v30;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeTasks, "enumerateKeysAndObjectsUsingBlock:", &v24);
      if ((v31[3] & 1) != 0)
      {
        -[NSMutableOrderedSet addObject:](v37->_duplicateTasks, "addObject:", v36[0]);
        v35 = 1;
      }
      else if (v37->_session)
      {
        v23 = 0;
        location = 0;
        v20 = 0;
        v13 = -[MCLURLDataLoader configuredURLRequestForTask:download:resumeData:](v37, "configuredURLRequestForTask:download:resumeData:", v36[0], &v23, &v20);
        objc_storeStrong(&location, v20);
        v21 = v13;
        v18 = 0;
        v14 = 0;
        if (v23)
        {
          v19 = (id)objc_msgSend(v36[0], "receiveDataHandler");
          v18 = 1;
          v14 = v19 == 0;
        }
        v23 = v14;
        if ((v18 & 1) != 0)

        objc_msgSend(v36[0], "setRequest:", v21);
        v17 = 0;
        if (location)
        {
          v2 = -[NSURLSession downloadTaskWithResumeData:](v37->_session, "downloadTaskWithResumeData:", location);
          v3 = v17;
          v17 = v2;

        }
        else
        {
          if (v23)
            v4 = -[NSURLSession downloadTaskWithRequest:](v37->_session, "downloadTaskWithRequest:", v21);
          else
            v4 = -[NSURLSession dataTaskWithRequest:](v37->_session, "dataTaskWithRequest:", v21);
          v5 = v17;
          v17 = v4;

        }
        if (v17)
        {
          v11 = v36[0];
          v12 = v37->_activeTasks;
          v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "taskIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11);

          v9 = v37;
          v8 = (id)objc_msgSend(v36[0], "category");
          if (-[MCLURLDataLoader priorityForCategory:](v9, "priorityForCategory:") <= 0)
            v7 = *MEMORY[0x24BDD1348];
          else
            v7 = *MEMORY[0x24BDD1350];
          LODWORD(v6) = v7;
          objc_msgSend(v17, "setPriority:", v6);

          -[NSMutableArray addObject:](v37->_sessionTasks, "addObject:", v17);
          objc_msgSend(v17, "resume");
        }
        -[MCLURLDataLoader operationReschedule](v37, "operationReschedule");
        objc_storeStrong(&v17, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&location, 0);
        v35 = 0;
      }
      else
      {
        v35 = 1;
      }
      objc_storeStrong(v29, 0);
      _Block_object_dispose(&v30, 8);
    }
    else
    {
      -[NSRecursiveLock unlock](v37->_taskQueueLock, "unlock");
      if (!v36[0] && !-[NSMutableDictionary count](v37->_activeTasks, "count"))
        -[MCLURLDataLoader notifyEmptyQueue](v37, "notifyEmptyQueue");
      v35 = 1;
    }
    objc_storeStrong(v36, 0);
  }
}

void __39__MCLURLDataLoader_operationReschedule__block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  if (+[MCLURLDataLoader task:equalsToTask:](MCLURLDataLoader, "task:equalsToTask:", v7, a1[4]))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)operationSuspendSession
{
  id v2;
  NSMutableOrderedSet *duplicateTasks;
  void *v4;
  NSMutableArray *sessionTasks;
  void *v6;
  int v7;
  int v8;
  void (*v9)(id *, void *, void *, void *);
  void *v10;
  id v11[2];
  int v12;
  int v13;
  void (*v14)(id *, void *);
  void *v15;
  id v16[2];
  int v17;
  int v18;
  void (*v19)(id *, void *);
  void *v20;
  id v21[2];
  MCLURLDataLoader *v22;

  v22 = self;
  v21[1] = (id)a2;
  -[NSRecursiveLock lock](self->_taskQueueLock, "lock");
  v2 = (id)-[NSMutableDictionary allValues](v22->_activeTasks, "allValues");
  v4 = (void *)MEMORY[0x24BDAC760];
  v16[1] = (id)MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke;
  v20 = &unk_24E09A4B0;
  v21[0] = v22;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  duplicateTasks = v22->_duplicateTasks;
  v11[1] = v4;
  v12 = -1073741824;
  v13 = 0;
  v14 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_2;
  v15 = &unk_24E09A4B0;
  v16[0] = v22;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](duplicateTasks, "enumerateObjectsUsingBlock:");
  -[NSRecursiveLock unlock](v22->_taskQueueLock, "unlock");
  -[NSMutableOrderedSet removeAllObjects](v22->_duplicateTasks, "removeAllObjects");
  sessionTasks = v22->_sessionTasks;
  v6 = v4;
  v7 = -1073741824;
  v8 = 0;
  v9 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_3;
  v10 = &unk_24E09A630;
  v11[0] = v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionTasks, "enumerateObjectsUsingBlock:");
  -[NSMutableDictionary removeAllObjects](v22->_activeTasks, "removeAllObjects");
  -[MCLURLDataLoader notifyBackgroundStopped](v22, "notifyBackgroundStopped");
  objc_storeStrong(v11, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(v21, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "enqueueTask:reschedule:", location[0], 0);
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_2(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "enqueueTask:reschedule:", location[0], 0);
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v4;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id v15[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  v15[2] = a4;
  v15[1] = a1;
  v15[0] = (id)objc_msgSend(a1[4], "loaderTaskForSessionTask:", location[0]);
  if ((objc_msgSend(v15[0], "download") & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = location[0];
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_4;
    v12 = &unk_24E09A590;
    v13 = a1[4];
    v14 = v15[0];
    objc_msgSend(v4, "cancelByProducingResumeData:", &v8);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    objc_msgSend(location[0], "cancel");
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_4(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "storeResumeData:forTask:", location[0], *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

- (void)operationResumeSession
{
  self->_suspended = 0;
  -[MCLURLDataLoader operationReschedule](self, "operationReschedule", a2, self);
}

- (void)operationRestartSession
{
  id v2[2];
  MCLURLDataLoader *v3;

  v3 = self;
  v2[1] = (id)a2;
  -[MCLURLDataLoader operationSuspendSession](self, "operationSuspendSession");
  v2[0] = v3->_session;
  objc_storeStrong((id *)&v3->_session, 0);
  objc_msgSend(v2[0], "invalidateAndCancel");
  -[MCLURLDataLoader configureSession](v3, "configureSession");
  -[MCLURLDataLoader operationResumeSession](v3, "operationResumeSession");
  objc_storeStrong(v2, 0);
}

+ (BOOL)task:(id)a3 equalsToTask:(id)a4
{
  char v5;
  id v7;
  id v8;
  char v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id location[3];
  char v24;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v7 = (id)objc_msgSend(location[0], "URL");
  v8 = (id)objc_msgSend(v22, "URL");
  v20 = 0;
  v18 = 0;
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v10 = 0;
  v9 = 0;
  if ((objc_msgSend(v7, "isEqual:") & 1) != 0)
  {
    v21 = (id)objc_msgSend(location[0], "targetPath");
    v20 = 1;
    v19 = (id)objc_msgSend(v22, "targetPath");
    v18 = 1;
    v5 = 1;
    if (v21 != v19)
    {
      v17 = (id)objc_msgSend(location[0], "targetPath");
      v16 = 1;
      v15 = (id)objc_msgSend(v17, "stringByDeletingPathExtension");
      v14 = 1;
      v13 = (id)objc_msgSend(v22, "targetPath");
      v12 = 1;
      v11 = (id)objc_msgSend(v13, "stringByDeletingPathExtension");
      v10 = 1;
      v5 = objc_msgSend(v15, "isEqualToString:");
    }
    v9 = v5;
  }
  v24 = v9 & 1;
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  if ((v14 & 1) != 0)

  if ((v16 & 1) != 0)
  if ((v18 & 1) != 0)

  if ((v20 & 1) != 0)
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (id)duplicateTasksForTask:(id)a3
{
  id v4;
  NSMutableOrderedSet *duplicateTasks;
  uint64_t v6;
  NSMutableArray *taskQueue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  id v14[2];
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  MCLURLDataLoader *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  duplicateTasks = v31->_duplicateTasks;
  v6 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = -1073741824;
  v24 = 0;
  v25 = __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke;
  v26 = &unk_24E09A488;
  v27 = location[0];
  v28 = v29;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](duplicateTasks, "enumerateObjectsUsingBlock:", &v22);
  -[NSRecursiveLock lock](v31->_taskQueueLock, "lock");
  v15 = 0;
  v16 = &v15;
  v17 = 838860800;
  v18 = 48;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  taskQueue = v31->_taskQueue;
  v8 = v6;
  v9 = -1073741824;
  v10 = 0;
  v11 = __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke_97;
  v12 = &unk_24E09A658;
  v13 = location[0];
  v14[1] = &v15;
  v14[0] = v29;
  -[NSMutableArray enumerateObjectsUsingBlock:](taskQueue, "enumerateObjectsUsingBlock:", &v8);
  if (v16[5])
    -[NSMutableArray removeObjectsAtIndexes:](v31->_taskQueue, "removeObjectsAtIndexes:", v16[5]);
  -[NSRecursiveLock unlock](v31->_taskQueueLock, "unlock");
  v4 = v29;
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (+[MCLURLDataLoader task:equalsToTask:](MCLURLDataLoader, "task:equalsToTask:", *(_QWORD *)(a1 + 32), location[0]))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", location[0]);
  }
  objc_storeStrong(location, 0);
}

void __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke_97(uint64_t a1, void *a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (+[MCLURLDataLoader task:equalsToTask:](MCLURLDataLoader, "task:equalsToTask:", *(_QWORD *)(a1 + 32), location[0]))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndex:", a3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (id)loaderTaskForSessionTask:(id)a3
{
  NSMutableDictionary *activeTasks;
  id v5;
  id v6;
  id location[2];
  MCLURLDataLoader *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  activeTasks = v8->_activeTasks;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(location[0], "taskIdentifier"));
  v6 = (id)-[NSMutableDictionary objectForKeyedSubscript:](activeTasks, "objectForKeyedSubscript:");

  objc_storeStrong(location, 0);
  return v6;
}

+ (void)applyDefaultRequestHeaders:(id)a3
{
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_msgSend(v6, "stringForKey:", CFSTR("UserAgentApp"));
  v10 = 0;
  v8 = 0;
  if (v7)
  {
    v3 = v7;
  }
  else
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = 1;
    v9 = (id)objc_msgSend(v11, "stringForKey:", CFSTR("UserAgent"));
    v8 = 1;
    v3 = v9;
  }
  v12 = v3;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  objc_msgSend(location[0], "setValue:forHTTPHeaderField:", v12, CFSTR("User-Agent"));
  v4 = (id)objc_msgSend(location[0], "HTTPMethod");
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("GET"));

  if ((v5 & 1) != 0)
    objc_msgSend(location[0], "setHTTPMethod:", CFSTR("GET"));
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)configuredURLRequestForTask:(id)a3 download:(BOOL *)a4 resumeData:(id *)a5
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  BOOL v27;
  char v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  BOOL v46;
  id v49;
  id v50;
  MCLURLDataLoader *v51;
  id v52;
  uint64_t v53;
  id v54;
  char v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  id v62;
  BOOL v63;
  char v64;
  id v65;
  id v66;
  char v67;
  id v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  id v76;
  id v77;
  id v78;
  char v79;
  id v80;
  _QWORD __b[8];
  id v82;
  id v83;
  id v84;
  id v85;
  int v86;
  uint64_t v87;
  id v88;
  id *v89;
  BOOL *v90;
  id location[2];
  MCLURLDataLoader *v92;
  id v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v92 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v90 = a4;
  v89 = a5;
  v49 = (id)objc_msgSend(location[0], "request");
  v88 = (id)objc_msgSend(v49, "mutableCopy");

  v50 = (id)objc_msgSend(location[0], "request");
  objc_msgSend(v50, "timeoutInterval");
  objc_msgSend(v88, "setTimeoutInterval:");

  objc_msgSend((id)objc_opt_class(), "applyDefaultRequestHeaders:", v88);
  -[MCLURLDataLoader processURLRequestRewrite:](v92, "processURLRequestRewrite:", v88);
  v51 = v92;
  v52 = (id)objc_msgSend(location[0], "category");
  v53 = -[MCLURLDataLoader priorityForCategory:](v51, "priorityForCategory:");

  v87 = v53;
  if (v53 >= 0)
    v5 = 0;
  else
    v5 = 3;
  objc_msgSend(v88, "setNetworkServiceType:", v5);
  objc_msgSend(v88, "setAllowsCellularAccess:", v87 != -2);
  v54 = (id)objc_msgSend(v88, "HTTPMethod");
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("GET"));

  if ((v55 & 1) != 0)
  {
    v6 = (id)objc_msgSend(location[0], "receiveDataHandler");
    v46 = v6 == 0;

    if (v46)
    {
      v85 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      if ((objc_msgSend(location[0], "download") & 1) != 0)
      {
        v84 = (id)objc_msgSend(location[0], "targetPath");
        if ((objc_msgSend(v84, "hasSuffix:", CFSTR("[content_type]")) & 1) != 0)
        {
          v7 = (id)objc_msgSend(v84, "stringByDeletingPathExtension");
          v8 = v84;
          v84 = v7;

          v83 = (id)objc_msgSend(v84, "lastPathComponent");
          memset(__b, 0, sizeof(__b));
          v42 = v85;
          v43 = (id)objc_msgSend(v84, "stringByDeletingLastPathComponent");
          obj = (id)objc_msgSend(v42, "enumeratorAtPath:");

          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v94, 16);
          if (v45)
          {
            v39 = *(_QWORD *)__b[2];
            v40 = 0;
            v41 = v45;
            while (1)
            {
              v38 = v40;
              if (*(_QWORD *)__b[2] != v39)
                objc_enumerationMutation(obj);
              v82 = *(id *)(__b[1] + 8 * v40);
              v36 = (id)objc_msgSend(v82, "stringByDeletingPathExtension");
              v37 = objc_msgSend(v36, "isEqualToString:", v83);

              if ((v37 & 1) != 0)
                break;
              ++v40;
              if (v38 + 1 >= v41)
              {
                v40 = 0;
                v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v94, 16);
                if (!v41)
                  goto LABEL_18;
              }
            }
            v34 = location[0];
            v35 = (id)objc_msgSend(v82, "pathExtension");
            objc_msgSend(v34, "applyFileExtension:");

            v86 = 2;
          }
          else
          {
LABEL_18:
            v86 = 0;
          }

          objc_storeStrong(&v83, 0);
        }
        objc_storeStrong(&v84, 0);
      }
      v80 = -[MCLURLDataLoader _cachedResponseForRequest:](v92, "_cachedResponseForRequest:", v88);
      if (v80)
      {
        v79 = 1;
        if (objc_msgSend(v88, "cachePolicy"))
        {
          -[MCLURLDataLoader _removeCachedResponseForRequest:](v92, "_removeCachedResponseForRequest:", v88);
          v79 = 0;
        }
        else if ((objc_msgSend(location[0], "download") & 1) != 0)
        {
          v78 = 0;
          v30 = v85;
          v32 = (id)objc_msgSend(location[0], "targetPath");
          v76 = v78;
          v31 = (id)objc_msgSend(v30, "attributesOfItemAtPath:error:");
          objc_storeStrong(&v78, v76);
          v77 = v31;

          v74 = 0;
          v33 = 0;
          if (!v31)
          {
            v29 = v85;
            v75 = (id)objc_msgSend(location[0], "targetPath");
            v74 = 1;
            v33 = objc_msgSend(v29, "fileExistsAtPath:");
          }
          if ((v74 & 1) != 0)

          if ((v33 & 1) != 0)
            NSLog(CFSTR("Error getting file attributes: %@"), v78);
          v9 = -[MCLURLDataLoader cachableFileAttributes:](v92, "cachableFileAttributes:", v77);
          v10 = v77;
          v77 = v9;

          v72 = 0;
          v28 = 0;
          if (v77)
          {
            v73 = (id)objc_msgSend(v80, "userInfo");
            v72 = 1;
            v28 = objc_msgSend(v77, "isEqualToDictionary:");
          }
          v79 = v28 & 1;
          if ((v72 & 1) != 0)

          if ((v79 & 1) == 0)
          {
            -[MCLURLDataLoader _removeCachedResponseForRequest:](v92, "_removeCachedResponseForRequest:", v88);
            *v90 = 1;
            objc_msgSend(v88, "setCachePolicy:", 1);
          }
          objc_storeStrong(&v77, 0);
          objc_storeStrong(&v78, 0);
        }
        else
        {
          v11 = (id)objc_msgSend(v80, "userInfo");
          v27 = v11 == 0;

          if (!v27)
          {
            -[MCLURLDataLoader _removeCachedResponseForRequest:](v92, "_removeCachedResponseForRequest:", v88);
            objc_msgSend(v88, "setCachePolicy:", 1);
            v79 = 0;
          }
        }
        if ((v79 & 1) != 0)
        {
          v24 = (id)objc_msgSend(v80, "response");
          v71 = (id)objc_msgSend(v24, "allHeaderFields");

          v25 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
          v26 = objc_msgSend(v25, "containsString:", CFSTR("private"));

          v70 = v26 & 1;
          if ((v26 & 1) == 0)
          {
            v23 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Etag"));
            v67 = 0;
            if (v23)
            {
              v12 = v23;
            }
            else
            {
              v68 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ETag"));
              v67 = 1;
              v12 = v68;
            }
            v69 = v12;
            if ((v67 & 1) != 0)

            v22 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
            v64 = 0;
            if (v22)
            {
              v13 = v22;
            }
            else
            {
              v65 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Date"));
              v64 = 1;
              v13 = v65;
            }
            v66 = v13;
            if ((v64 & 1) != 0)

            if (objc_msgSend(v69, "length"))
              objc_msgSend(v88, "setValue:forHTTPHeaderField:", v69, CFSTR("If-None-Match"));
            v63 = 0;
            v20 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Expires"));
            v61 = 0;
            v21 = 1;
            if (!objc_msgSend(v20, "length"))
            {
              v62 = (id)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
              v61 = 1;
              v21 = objc_msgSend(v62, "length") != 0;
            }
            if ((v61 & 1) != 0)

            v63 = v21;
            if (objc_msgSend(v66, "length") && (!v63 || !objc_msgSend(v69, "length")))
              objc_msgSend(v88, "setValue:forHTTPHeaderField:", v66, CFSTR("If-Modified-Since"));
            objc_storeStrong(&v66, 0);
            objc_storeStrong(&v69, 0);
          }
          objc_storeStrong(&v71, 0);
        }
      }
      else if ((objc_msgSend(location[0], "download") & 1) != 0)
      {
        objc_msgSend(v88, "setCachePolicy:", 1);
        *v90 = 1;
        if (v89)
        {
          v19 = (id)objc_msgSend(location[0], "targetPath");
          v60 = (id)objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("partial"));

          if ((objc_msgSend(v85, "fileExistsAtPath:", v60) & 1) != 0)
          {
            v59 = 0;
            v14 = objc_alloc(MEMORY[0x24BDBCE50]);
            v57 = v59;
            v18 = (void *)objc_msgSend(v14, "initWithContentsOfFile:options:error:", v60, 2, &v57);
            objc_storeStrong(&v59, v57);
            v58 = v18;
            if (v59)
            {
              NSLog(CFSTR("Error reading resume data: %@"), v59);
            }
            else if ((objc_msgSend((id)objc_opt_class(), "isValidResumeData:", v58) & 1) != 0)
            {
              v15 = objc_retainAutorelease(v58);
              *v89 = v15;
            }
            else
            {
              NSLog(CFSTR("Corrupted resume data."));
            }
            objc_storeStrong(&v58, 0);
            objc_storeStrong(&v59, 0);
          }
          objc_storeStrong(&v60, 0);
        }
      }
      if ((objc_msgSend(location[0], "download") & 1) != 0)
      {
        v17 = (id)objc_msgSend(location[0], "targetPath");
        v56 = (id)objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("partial"));

        objc_msgSend(v85, "removeItemAtPath:error:", v56);
        objc_storeStrong(&v56, 0);
      }
      v93 = v88;
      v86 = 1;
      objc_storeStrong(&v80, 0);
      objc_storeStrong(&v85, 0);
    }
    else
    {
      v93 = v88;
      v86 = 1;
    }
  }
  else
  {
    objc_msgSend(v88, "setCachePolicy:", 1);
    v93 = v88;
    v86 = 1;
  }
  objc_storeStrong(&v88, 0);
  objc_storeStrong(location, 0);
  return v93;
}

- (void)processURLRequestRewrite:(id)a3
{
  NSMutableOrderedSet *rewriteRules;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *, void *, void *);
  void *v8;
  id v9;
  id location[2];
  MCLURLDataLoader *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  rewriteRules = v11->_rewriteRules;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__MCLURLDataLoader_processURLRequestRewrite___block_invoke;
  v8 = &unk_24E09A680;
  v9 = location[0];
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](rewriteRules, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_processURLRequestRewrite___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v8;
  id v9;
  id v10[2];
  void *v11;
  id v12[4];
  id location[6];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "URL");
  v12[0] = (id)objc_msgSend(v8, "absoluteString");

  v4 = (void *)objc_msgSend(v12[0], "length");
  location[3] = 0;
  location[2] = v4;
  location[4] = 0;
  location[5] = v4;
  v10[1] = 0;
  v11 = v4;
  v9 = (id)objc_msgSend(location[0], "matchPattern");
  v10[0] = (id)objc_msgSend(v9, "firstMatchInString:options:range:", v12[0], 0, 0, v11);

  if (v10[0] && objc_msgSend(v10[0], "range") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(location[0], "rewriteURLRequest:", a1[4]);
  objc_storeStrong(v10, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)connectionsLimitForPriorityOfTask:(id)a3
{
  MCLURLDataLoader *v4;
  id v5;
  uint64_t v6;
  id location[2];
  MCLURLDataLoader *v8;
  unint64_t v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v8;
  v5 = (id)objc_msgSend(location[0], "category");
  v6 = -[MCLURLDataLoader priorityForCategory:](v4, "priorityForCategory:");

  switch(v6)
  {
    case -9223372036854775808:
      v9 = 0;
      break;
    case -2:
      v9 = 1;
      break;
    case -1:
      v9 = 5;
      break;
    default:
      if (v6 && (unint64_t)(v6 - 1) <= 1)
        v9 = 20;
      else
        v9 = 10;
      break;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)cachableFileAttributes:(id)a3
{
  id v3;
  char v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id location[3];
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  v7 = 0;
  v5 = 0;
  if (location[0])
  {
    v13[0] = *MEMORY[0x24BDD0D08];
    v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(location[0], "fileSize"));
    v9 = 1;
    v14[0] = v10;
    v13[1] = *MEMORY[0x24BDD0C98];
    v8 = (id)objc_msgSend(location[0], "fileModificationDate");
    v7 = 1;
    v14[1] = v8;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v5 = 1;
    v3 = v6;
  }
  else
  {
    v3 = 0;
  }
  v12 = v3;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  objc_storeStrong(location, 0);
  return v12;
}

- (void)task:(id)a3 completedWithError:(id)a4
{
  NSMutableDictionary *activeTasks;
  id v5;
  id v6;
  id v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MCLURLDataLoader *v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  MCLURLDataLoader *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v8 = (id)objc_msgSend(v18, "domain");
  v9 = 0;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
    v9 = objc_msgSend(v18, "code") == -999;

  if (v9)
  {
    objc_storeStrong(&v18, 0);
    objc_msgSend(location[0], "setCancelled:", 1);
  }
  objc_msgSend(location[0], "applyMimeType");
  objc_msgSend(location[0], "dispatchCompletion:", v18);
  activeTasks = v20->_activeTasks;
  v5 = (id)-[NSMutableDictionary allKeysForObject:](activeTasks, "allKeysForObject:", location[0]);
  -[NSMutableDictionary removeObjectsForKeys:](activeTasks, "removeObjectsForKeys:");

  v6 = -[MCLURLDataLoader duplicateTasksForTask:](v20, "duplicateTasksForTask:", location[0]);
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __44__MCLURLDataLoader_task_completedWithError___block_invoke;
  v14 = &unk_24E09A6A8;
  v15 = v20;
  v16 = location[0];
  v17 = v18;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v10);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __44__MCLURLDataLoader_task_completedWithError___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  id v3;
  id v4;
  id v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", location[0]);
  if ((objc_msgSend(*(id *)(a1 + 40), "cancelled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "enqueueTask:reschedule:", location[0], 0);
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "request");
    objc_msgSend(location[0], "setRequest:");

    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "response");
    objc_msgSend(location[0], "setResponse:");

    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "responseData");
    objc_msgSend(location[0], "setResponseData:");

    v2 = objc_msgSend(*(id *)(a1 + 40), "cachedResponse");
    objc_msgSend(location[0], "setCachedResponse:", v2 & 1);
    objc_msgSend(location[0], "applyMimeType");
    objc_msgSend(location[0], "dispatchCompletion:", *(_QWORD *)(a1 + 48));
  }
  objc_storeStrong(location, 0);
}

- (id)downloadCachedResponse:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  MCLURLDataLoader *v22;
  id v23;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = (id)objc_msgSend(location[0], "targetPath");
  v19 = 0;
  v13 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = v19;
  v12 = (id)objc_msgSend(v13, "attributesOfItemAtPath:error:", v20, &v17);
  objc_storeStrong(&v19, v17);
  v18 = v12;

  if (v18)
  {
    v9 = objc_msgSend(v18, "fileSize");
    v10 = (id)objc_msgSend(location[0], "response");
    v11 = v9 == objc_msgSend(v10, "expectedContentLength");

    if (v11)
    {
      v3 = -[MCLURLDataLoader cachableFileAttributes:](v22, "cachableFileAttributes:", v18);
      v4 = v18;
      v18 = v3;

      v15 = (id)objc_msgSend((id)objc_opt_class(), "downloadData");
      v7 = (void *)objc_opt_class();
      v8 = (id)objc_msgSend(location[0], "response");
      v14 = (id)objc_msgSend(v7, "duplicateResponse:withContentLength:", v8, objc_msgSend(v15, "length"));

      v5 = objc_alloc(MEMORY[0x24BDD1498]);
      v23 = (id)objc_msgSend(v5, "initWithResponse:data:userInfo:storagePolicy:", v14, v15, v18, 0);
      v16 = 1;
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      v23 = 0;
      v16 = 1;
    }
  }
  else
  {
    if (v19)
      NSLog(CFSTR("Error getting file attributes: %@"), v19);
    v23 = 0;
    v16 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23;
}

+ (id)downloadData
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&downloadData_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_136);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)downloadData_staticData;
}

void __32__MCLURLDataLoader_downloadData__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = (id)objc_msgSend(CFSTR("DOWNLOAD"), "dataUsingEncoding:", 4, a1, a1);
  v2 = (void *)downloadData_staticData;
  downloadData_staticData = (uint64_t)v1;

}

+ (id)duplicateResponse:(id)a3 withContentLength:(int64_t)a4
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int64_t v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v7 = (id)objc_msgSend(location[0], "allHeaderFields");
  v12 = (id)objc_msgSend(v7, "mutableCopy");

  v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), v13);
  objc_msgSend(v12, "setObject:forKeyedSubscript:");

  v9 = objc_alloc(MEMORY[0x24BDD15B8]);
  v10 = (id)objc_msgSend(location[0], "URL");
  v4 = objc_msgSend(location[0], "statusCode");
  v11 = (void *)objc_msgSend(v9, "initWithURL:statusCode:HTTPVersion:headerFields:", v10, v4, CFSTR("HTTP/1.1"), v12);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)updateDownloadCacheEntry:(id)a3
{
  MCLURLDataLoader *v3;
  id v4;
  NSURLCache *cache;
  id v6;
  MCLURLDataLoader *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  char v13;
  id v14;
  int v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id location[2];
  MCLURLDataLoader *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = (id)objc_msgSend(location[0], "request");
  v22 = 0;
  v13 = 0;
  if ((objc_msgSend(location[0], "responseOk") & 1) != 0)
  {
    v23 = (id)objc_msgSend(v24, "HTTPMethod");
    v22 = 1;
    v13 = objc_msgSend(v23, "isEqualToString:", CFSTR("GET"));
  }
  if ((v22 & 1) != 0)

  if ((v13 & 1) == 0)
    goto LABEL_20;
  v9 = (id)objc_msgSend(location[0], "response");
  v10 = (id)objc_msgSend(v9, "allHeaderFields");
  v11 = (id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
  v20 = 0;
  v18 = 0;
  v16 = 0;
  v12 = 1;
  if ((objc_msgSend(v11, "containsString:", CFSTR("no-cache")) & 1) == 0)
  {
    v21 = (id)objc_msgSend(location[0], "response");
    v20 = 1;
    v19 = (id)objc_msgSend(v21, "allHeaderFields");
    v18 = 1;
    v17 = (id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Pragma"));
    v16 = 1;
    v12 = objc_msgSend(v17, "containsString:", CFSTR("no-cache"));
  }
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  if ((v20 & 1) != 0)

  if ((v12 & 1) == 0)
  {
    v14 = -[MCLURLDataLoader downloadCachedResponse:](v26, "downloadCachedResponse:", location[0]);
    if (v14)
    {
      cache = v26->_cache;
      v6 = (id)objc_msgSend(location[0], "request");
      -[NSURLCache storeCachedResponse:forRequest:](cache, "storeCachedResponse:forRequest:", v14);

    }
    else
    {
      v3 = v26;
      v4 = (id)objc_msgSend(location[0], "request");
      -[MCLURLDataLoader _removeCachedResponseForRequest:](v3, "_removeCachedResponseForRequest:");

    }
    objc_storeStrong(&v14, 0);
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v7 = v26;
  v8 = (id)objc_msgSend(location[0], "request");
  -[MCLURLDataLoader _removeCachedResponseForRequest:](v7, "_removeCachedResponseForRequest:");

  v15 = 1;
LABEL_21:
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)storeResumeData:(id)a3 forTask:(id)a4
{
  id v4;
  char v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  if (location[0])
  {
    v4 = (id)objc_msgSend(v10, "targetPath");
    v9 = (id)objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("partial"));

    v8 = 0;
    v7 = 0;
    v5 = objc_msgSend(location[0], "writeToFile:options:error:", v9, 1, &v7);
    objc_storeStrong(&v8, v7);
    if ((v5 & 1) == 0)
      NSLog(CFSTR("Error writing resume file: %@"), v8);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidResumeData:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];
  char v12;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!objc_msgSend(location[0], "length"))
    goto LABEL_9;
  v10 = 0;
  v8 = 0;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", location[0], 0, 0, &v8);
  objc_storeStrong(&v10, v8);
  v9 = v5;
  if (!v5
    || ((v7 = (id)objc_msgSend(v9, "objectForKey:", CFSTR("NSURLSessionResumeInfoLocalPath")), !objc_msgSend(v7, "length"))? (v6 = 0): (v4 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), v12 = objc_msgSend(v4, "fileExistsAtPath:", v7) & 1, v4, v6 = 1), objc_storeStrong(&v7, 0), !v6))
  {
    v6 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  if (!v6)
LABEL_9:
    v12 = 0;
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  NSMutableDictionary *activeTasks;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  -[NSRecursiveLock lock](v14->_taskQueueLock, "lock");
  activeTasks = v14->_activeTasks;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__MCLURLDataLoader_URLSession_didBecomeInvalidWithError___block_invoke;
  v10 = &unk_24E09A6F0;
  v11 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeTasks, "enumerateKeysAndObjectsUsingBlock:");
  -[NSMutableDictionary removeAllObjects](v14->_activeTasks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v14->_sessionTasks, "removeAllObjects");
  -[NSRecursiveLock unlock](v14->_taskQueueLock, "unlock");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __57__MCLURLDataLoader_URLSession_didBecomeInvalidWithError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  objc_msgSend(v5, "dispatchCompletion:", a1[4]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __69__MCLURLDataLoader_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  v8 = &unk_24E099940;
  v9 = location[0];
  objc_msgSend(v3, "addOperationWithBlock:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __69__MCLURLDataLoader_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_getAssociatedObject(a1[4], &BACKGROUND_SESSION_COMPLETION_HANDLER_KEY);
  objc_setAssociatedObject(a1[4], &BACKGROUND_SESSION_COMPLETION_HANDLER_KEY, 0, 0);
  if (location[0])
    (*((void (**)(void))location[0] + 2))();
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;
  id v9;
  BOOL v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  MCLURLDataLoader *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19 = -[MCLURLDataLoader loaderTaskForSessionTask:](v23, "loaderTaskForSessionTask:", v21);
  v5 = (id)objc_msgSend(v19, "response");
  v12 = v5 != 0;

  if (!v12)
  {
    v9 = (id)objc_msgSend(v21, "response");
    objc_msgSend(v19, "setResponse:");

  }
  -[NSMutableArray removeObject:](v23->_sessionTasks, "removeObject:", v21);
  v18 = 0;
  v16 = 0;
  v8 = 0;
  if (v20)
  {
    v17 = (id)objc_msgSend(v20, "domain");
    v16 = 1;
    v8 = 0;
    if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
      v8 = objc_msgSend(v20, "code") == -999;
  }
  if ((v16 & 1) != 0)

  v18 = v8;
  v14 = 0;
  v7 = 0;
  if (!v8)
  {
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (id)objc_msgSend(v21, "response");
      v14 = 1;
      v7 = objc_msgSend(v15, "expectedContentLength") >= 500000;
    }
  }
  if ((v14 & 1) != 0)

  if (v7)
  {
    v6 = (id)objc_msgSend(v20, "userInfo");
    v13 = (id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1340]);

    -[MCLURLDataLoader storeResumeData:forTask:](v23, "storeResumeData:forTask:", v13, v19);
    objc_storeStrong(&v13, 0);
  }
  if (!v18 || !v23->_suspended)
  {
    -[MCLURLDataLoader task:completedWithError:](v23, "task:completedWithError:", v19, v20);
    -[MCLURLDataLoader operationReschedule](v23, "operationReschedule");
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MCLURLDataLoader *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  MCLURLDataLoader *v24;
  id v25;
  id v26;
  BOOL v27;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id location[2];
  MCLURLDataLoader *v49;

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = 0;
  objc_storeStrong(&v47, a4);
  v46 = 0;
  objc_storeStrong(&v46, a5);
  v45 = 0;
  objc_storeStrong(&v45, a6);
  v44 = -[MCLURLDataLoader loaderTaskForSessionTask:](v49, "loaderTaskForSessionTask:", v47);
  objc_msgSend(v44, "setResponse:", v46);
  if ((objc_msgSend(v44, "cancelled") & 1) != 0)
  {
    (*((void (**)(id, _QWORD))v45 + 2))(v45, 0);
  }
  else if ((objc_msgSend(v44, "download") & 1) != 0)
  {
    v24 = v49;
    v25 = (id)objc_msgSend(v44, "request");
    v43 = -[MCLURLDataLoader _cachedResponseForRequest:](v24, "_cachedResponseForRequest:");

    v26 = (id)objc_msgSend(v44, "originalRequest");
    v41 = 0;
    v27 = 0;
    if (!objc_msgSend(v26, "cachePolicy"))
    {
      v42 = (id)objc_msgSend(v43, "userInfo");
      v41 = 1;
      v27 = v42 != 0;
    }
    if ((v41 & 1) != 0)

    if (v27)
    {
      v19 = (id)objc_msgSend(v44, "response");
      v18 = (id)objc_msgSend(v19, "allHeaderFields");
      v40 = (id)objc_msgSend(v18, "mutableCopy");

      v21 = (id)objc_msgSend(v43, "response");
      v20 = (id)objc_msgSend(v21, "allHeaderFields");
      v39 = (id)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v40, "removeObjectForKey:");
      objc_msgSend(v39, "removeObjectForKey:", CFSTR("Date"));
      v22 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v38 = (id)objc_msgSend(v40, "objectsForKeys:notFoundMarker:", &unk_24E0A4D08);

      v23 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v37 = (id)objc_msgSend(v39, "objectsForKeys:notFoundMarker:", &unk_24E0A4D20);

      if ((objc_msgSend(v44, "responseOk") & 1) == 0 || (objc_msgSend(v38, "isEqualToArray:", v37) & 1) != 0)
      {
        if ((objc_msgSend(v44, "responseOk") & 1) != 0 && (objc_msgSend(v40, "isEqualToDictionary:", v39) & 1) == 0)
          -[MCLURLDataLoader updateDownloadCacheEntry:](v49, "updateDownloadCacheEntry:", v44);
        objc_msgSend(v44, "setCachedResponse:", 1);
        (*((void (**)(id, _QWORD))v45 + 2))(v45, 0);
      }
      else
      {
        (*((void (**)(id, uint64_t))v45 + 2))(v45, 2);
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t))v45 + 2))(v45, 2);
    }
    objc_storeStrong(&v43, 0);
  }
  else
  {
    v16 = v49;
    v17 = (id)objc_msgSend(v44, "request");
    v36 = -[MCLURLDataLoader _cachedResponseForRequest:](v16, "_cachedResponseForRequest:");

    if (v36)
    {
      v11 = (id)objc_msgSend(v44, "response");
      v10 = (id)objc_msgSend(v11, "allHeaderFields");
      v35 = (id)objc_msgSend(v10, "mutableCopy");

      v13 = (id)objc_msgSend(v36, "response");
      v12 = (id)objc_msgSend(v13, "allHeaderFields");
      v34 = (id)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v35, "removeObjectForKey:");
      objc_msgSend(v34, "removeObjectForKey:", CFSTR("Date"));
      v14 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v33 = (id)objc_msgSend(v35, "objectsForKeys:notFoundMarker:", &unk_24E0A4D38);

      v15 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v32 = (id)objc_msgSend(v34, "objectsForKeys:notFoundMarker:", &unk_24E0A4D50);

      if ((objc_msgSend(v44, "responseOk") & 1) != 0 && (objc_msgSend(v33, "isEqualToArray:", v32) & 1) != 0)
        objc_msgSend(v44, "setCachedResponse:", 1);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    v31 = (id)objc_msgSend(v44, "receiveDataHandler");
    if (v31)
    {
      (*((void (**)(id, id, _QWORD))v31 + 2))(v31, v44, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDBCEC8]);
      if (objc_msgSend(v46, "expectedContentLength"))
      {
        if ((unint64_t)objc_msgSend(v46, "expectedContentLength") >= 0xF4240)
          v8 = 1000000;
        else
          v8 = objc_msgSend(v46, "expectedContentLength");
        v7 = v8;
      }
      else
      {
        v7 = 100000;
      }
      v6 = (id)objc_msgSend(v9, "initWithCapacity:", v7);
      objc_msgSend(v44, "setResponseData:");

    }
    (*((void (**)(id, uint64_t))v45 + 2))(v45, 1);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  NSMutableDictionary *v5;
  id v6;
  NSMutableDictionary *activeTasks;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = -[MCLURLDataLoader loaderTaskForSessionTask:](v15, "loaderTaskForSessionTask:", v13);
  activeTasks = v15->_activeTasks;
  v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "taskIdentifier"));
  -[NSMutableDictionary removeObjectForKey:](activeTasks, "removeObjectForKey:");

  if (v11)
  {
    v5 = v15->_activeTasks;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "taskIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11);

  }
  -[NSMutableArray removeObject:](v15->_sessionTasks, "removeObject:", v13);
  -[NSMutableArray addObject:](v15->_sessionTasks, "addObject:", v12);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v5;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  MCLURLDataLoader *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10 = -[MCLURLDataLoader loaderTaskForSessionTask:](v14, "loaderTaskForSessionTask:", v12);
  if ((objc_msgSend(v10, "cancelled") & 1) != 0)
  {
    objc_msgSend(v12, "cancel");
    v9 = 1;
  }
  else
  {
    v8 = (id)objc_msgSend(v10, "receiveDataHandler");
    if (v8)
    {
      (*((void (**)(id, id, id))v8 + 2))(v8, v10, v11);
    }
    else
    {
      v5 = (id)objc_msgSend(v10, "responseData");
      objc_msgSend(v5, "appendData:", v11);

    }
    objc_storeStrong(&v8, 0);
    v9 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  BOOL v6;
  id v7;
  id v8;
  char v9;
  BOOL v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[2];
  MCLURLDataLoader *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v22 = 0;
  objc_storeStrong(&v22, a6);
  v21 = -[MCLURLDataLoader loaderTaskForSessionTask:](v26, "loaderTaskForSessionTask:", v24);
  v19 = 0;
  v13 = 1;
  if (v21)
  {
    v13 = 1;
    if ((objc_msgSend(v21, "download") & 1) == 0)
    {
      v20 = (id)objc_msgSend(v21, "receiveDataHandler");
      v19 = 1;
      v13 = v20 != 0;
    }
  }
  if ((v19 & 1) != 0)

  if (v13)
  {
    (*((void (**)(id, _QWORD))v22 + 2))(v22, 0);
  }
  else
  {
    v7 = (id)objc_msgSend(v23, "response");
    v18 = (id)objc_msgSend(v7, "allHeaderFields");

    v8 = (id)objc_msgSend(v24, "originalRequest");
    v16 = 0;
    v14 = 0;
    v9 = 1;
    if (objc_msgSend(v8, "cachePolicy") != 1)
    {
      v17 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
      v16 = 1;
      v6 = 0;
      if (!v17)
      {
        v15 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Expires"));
        v14 = 1;
        v6 = v15 == 0;
      }
      v9 = v6;
    }
    if ((v14 & 1) != 0)

    if ((v16 & 1) != 0)
    if ((v9 & 1) != 0)
      (*((void (**)(id, _QWORD))v22 + 2))(v22, 0);
    else
      (*((void (**)(id, id))v22 + 2))(v22, v23);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v7;
  id v8;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  MCLURLDataLoader *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v18 = -[MCLURLDataLoader loaderTaskForSessionTask:](v24, "loaderTaskForSessionTask:", v22);
  if ((objc_msgSend(v18, "cancelled") & 1) != 0)
  {
    objc_msgSend(v22, "cancel");
    v17 = 1;
  }
  else
  {
    v16 = (id)objc_msgSend(v18, "redirectHandler");
    if (v16)
    {
      v15 = (id)(*((uint64_t (**)(id, id, id, id))v16 + 2))(v16, v18, v21, v20);
      if (v15)
      {
        objc_msgSend(v18, "setRequest:", v15);
        v14 = (id)objc_msgSend(v15, "mutableCopy");
        v8 = v14;
        objc_msgSend(v15, "timeoutInterval");
        objc_msgSend(v8, "setTimeoutInterval:");
        objc_msgSend((id)objc_opt_class(), "applyDefaultRequestHeaders:", v14);
        -[MCLURLDataLoader processURLRequestRewrite:](v24, "processURLRequestRewrite:", v14);
        objc_storeStrong(&v15, v14);
        objc_storeStrong(&v14, 0);
      }
      (*((void (**)(id, id))v19 + 2))(v19, v15);
      if (!v15 && objc_msgSend(v21, "statusCode") == 301)
      {
        objc_msgSend(v18, "setResponse:", v21);
        objc_msgSend(v22, "cancel");
      }
      objc_storeStrong(&v15, 0);
    }
    else
    {
      objc_msgSend(v18, "setRequest:", v20);
      v13 = (id)objc_msgSend(v20, "mutableCopy");
      v7 = v13;
      objc_msgSend(v20, "timeoutInterval");
      objc_msgSend(v7, "setTimeoutInterval:");
      objc_msgSend((id)objc_opt_class(), "applyDefaultRequestHeaders:", v13);
      -[MCLURLDataLoader processURLRequestRewrite:](v24, "processURLRequestRewrite:", v13);
      (*((void (**)(id, id))v19 + 2))(v19, v13);
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v16, 0);
    v17 = 0;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  MCLURLDataLoader *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = -[MCLURLDataLoader loaderTaskForSessionTask:](v31, "loaderTaskForSessionTask:", v29);
  v16 = (id)objc_msgSend(v29, "response");
  objc_msgSend(v27, "setResponse:");

  if ((objc_msgSend(v27, "responseOk") & 1) != 0)
  {
    v25 = 0;
    objc_msgSend(v27, "applyMimeType");
    v24 = (id)objc_msgSend(v27, "targetPath");
    v23 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    if ((objc_msgSend(v23, "fileExistsAtPath:", v24) & 1) != 0)
    {
      v12 = (id)objc_msgSend(v27, "response");
      v13 = objc_msgSend(v12, "expectedContentLength");

      v22 = v13;
      if (v13 >= 0)
      {
        v10 = (id)objc_msgSend(v28, "path");
        v20 = v25;
        v9 = (id)objc_msgSend(v23, "attributesOfItemAtPath:error:");
        objc_storeStrong(&v25, v20);
        v21 = v9;

        v18 = 0;
        v11 = 1;
        if (v9)
        {
          v11 = 1;
          if (objc_msgSend(v21, "fileSize") >= v22)
          {
            v19 = (id)objc_msgSend((id)objc_opt_class(), "downloadData");
            v18 = 1;
            v11 = v22 == objc_msgSend(v19, "length");
          }
        }
        if ((v18 & 1) != 0)

        if (v11)
        {
          objc_msgSend(v27, "setCachedResponse:", 1);
          v26 = 1;
        }
        else
        {
          v26 = 0;
        }
        objc_storeStrong(&v21, 0);
        if (v26)
          goto LABEL_19;
      }
      objc_msgSend(v23, "removeItemAtPath:error:", v24, 0);
    }
    v6 = v23;
    v5 = v28;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
    v17 = v25;
    v8 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v5);
    objc_storeStrong(&v25, v17);

    if ((v8 & 1) != 0)
      -[MCLURLDataLoader updateDownloadCacheEntry:](v31, "updateDownloadCacheEntry:", v27);
    else
      -[MCLURLDataLoader task:completedWithError:](v31, "task:completedWithError:", v27, v25);
    v26 = 0;
LABEL_19:
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    goto LABEL_20;
  }
  v26 = 1;
LABEL_20:
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  double v7;
  id v12[4];
  id v13;
  id location[2];
  MCLURLDataLoader *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12[3] = (id)a5;
  v12[2] = (id)a6;
  v12[1] = (id)a7;
  v12[0] = -[MCLURLDataLoader loaderTaskForSessionTask:](v15, "loaderTaskForSessionTask:", v13);
  HIDWORD(v7) = HIDWORD(a6);
  *(float *)&v7 = (float)((float)a6 * 1.0) / (float)a7;
  objc_msgSend(v12[0], "setProgress:", v7);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_removeCachedResponseForRequest:(id)a3
{
  id location[2];
  MCLURLDataLoader *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[MCLURLDataLoader _removeCachedResponseForRequest:force:](v4, "_removeCachedResponseForRequest:force:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)_removeCachedResponseForRequest:(id)a3 force:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  BOOL v14;
  id location[2];
  MCLURLDataLoader *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  if (a4)
  {
    v13 = &unk_24E0A4E10;
    v12 = &unk_24E0A4E38;
    v4 = objc_alloc(MEMORY[0x24BDD15B8]);
    v5 = (id)objc_msgSend(location[0], "URL");
    v11 = objc_msgSend(v4, "initWithURL:statusCode:HTTPVersion:headerFields:");

    v7 = objc_alloc(MEMORY[0x24BDD1498]);
    v6 = (id)v11;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v10 = (id)objc_msgSend(v7, "initWithResponse:data:userInfo:storagePolicy:", v6);

    -[NSURLCache storeCachedResponse:forRequest:](v16->_cache, "storeCachedResponse:forRequest:", v10, location[0]);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  -[NSURLCache removeCachedResponseForRequest:](v16->_cache, "removeCachedResponseForRequest:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)_cachedResponseForRequest:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  id location[2];
  MCLURLDataLoader *v10;
  id v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = -[NSURLCache cachedResponseForRequest:](v10->_cache, "cachedResponseForRequest:", location[0]);
  if (v8
    && (v5 = (id)objc_msgSend(v8, "userInfo"),
        v4 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IGNORE")),
        v6 = objc_msgSend(v4, "BOOLValue"),
        v4,
        v5,
        (v6 & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = location[0];
      objc_msgSend(v7, "setCachePolicy:", 1);
      objc_storeStrong(&v7, 0);
    }
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteRules, 0);
  objc_storeStrong((id *)&self->_duplicateTasks, 0);
  objc_storeStrong((id *)&self->_sessionTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_taskQueueLock, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloadCacheDirectory, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

@end

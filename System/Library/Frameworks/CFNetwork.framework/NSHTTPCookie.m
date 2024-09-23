@implementation NSHTTPCookie

- (NSString)comment
{
  HTTPCookie *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  v3 = -[NSHTTPCookie _inner](self, "_inner");
  v4 = (unsigned int *)(*((uint64_t (**)(HTTPCookie *))v3->var0 + 2))(v3);
  if (*v4 >= 0x24 && (v5 = v4[8], (_DWORD)v5) && (v6 = *v4, v6 > v5))
  {
    v7 = (char *)v4 + v5;
    v8 = (char *)v4 + v6;
    v9 = v7;
    while (*v9)
    {
      if (++v9 >= v8)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v7 = 0;
  }
  return (NSString *)(id)createCookieString(self, v7);
}

- (NSURL)commentURL
{
  HTTPCookie *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  CFStringRef CookieString;
  const __CFString *v11;
  const __CFAllocator *v12;
  CFURLRef v13;

  v3 = -[NSHTTPCookie _inner](self, "_inner");
  v4 = (unsigned int *)(*((uint64_t (**)(HTTPCookie *))v3->var0 + 2))(v3);
  if (*v4 >= 0x28 && (v5 = v4[9], (_DWORD)v5) && (v6 = *v4, v6 > v5))
  {
    v7 = (char *)v4 + v5;
    v8 = (char *)v4 + v6;
    v9 = v7;
    while (*v9)
    {
      if (++v9 >= v8)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v7 = 0;
  }
  CookieString = createCookieString(self, v7);
  if (CookieString)
  {
    v11 = CookieString;
    v12 = CFGetAllocator(self);
    v13 = CFURLCreateWithString(v12, v11, 0);
    CFRelease(v11);
  }
  else
  {
    v13 = 0;
  }
  return (NSURL *)v13;
}

- (NSString)value
{
  return (NSString *)(id)CFHTTPCookieCopyValue(self);
}

- (NSString)path
{
  return (NSString *)(id)CFHTTPCookieCopyPath(self);
}

- (NSString)domain
{
  return (NSString *)(id)CFHTTPCookieCopyDomain(self);
}

- (NSString)name
{
  return (NSString *)(id)CFHTTPCookieCopyName(self);
}

- (NSDate)expiresDate
{
  HTTPCookie *v4;
  uint64_t v5;
  double v6;
  const __CFAllocator *v7;

  if (-[NSHTTPCookie isSessionOnly](self, "isSessionOnly"))
    return 0;
  v4 = -[NSHTTPCookie _inner](self, "_inner");
  v5 = (*((uint64_t (**)(HTTPCookie *))v4->var0 + 2))(v4);
  if (*(_DWORD *)v5 >= 0xCu && (*(_DWORD *)(v5 + 8) & 2) != 0)
    return 0;
  v6 = 0.0;
  if (*(_DWORD *)v5 >= 0x30u)
    v6 = floor(*(double *)(v5 + 40));
  v7 = CFGetAllocator(self);
  return (NSDate *)CFDateCreate(v7, v6);
}

- (BOOL)isSessionOnly
{
  HTTPCookie *v2;
  _DWORD *v3;
  _BOOL4 v4;

  v2 = -[NSHTTPCookie _inner](self, "_inner");
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu)
    return (v3[2] >> 1) & 1;
  else
    LOBYTE(v4) = 0;
  return v4;
}

- (id)ensureCookieValid
{
  id *v1;
  void *v2;
  uint64_t v3;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    if (!v2
      || !objc_msgSend(v2, "_inner")
      || (v3 = objc_msgSend(v1[1], "_inner"), !(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3)))
    {

      return 0;
    }
  }
  return v1;
}

- (HTTPCookie)_inner
{
  return (HTTPCookie *)-[NSHTTPCookieInternal _inner](self->_cookiePrivate, "_inner");
}

- (void)dealloc
{
  objc_super v3;

  self->_cookiePrivate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookie;
  -[NSHTTPCookie dealloc](&v3, sel_dealloc);
}

- (NSHTTPCookie)initWithProperties:(NSDictionary *)properties
{
  id v4;
  id v5;

  v4 = -[NSHTTPCookieInternal_Data _initWithProperties:fromString:]([NSHTTPCookieInternal_Data alloc], "_initWithProperties:fromString:", properties, 0);
  v5 = -[NSHTTPCookie _initWithInternal:](self, "_initWithInternal:", v4);

  return (NSHTTPCookie *)-[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
}

- (id)_initWithInternal:(id)a3
{
  id result;
  id v5;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSHTTPCookie;
    result = -[NSHTTPCookie init](&v6, sel_init);
    if (result)
    {
      v5 = result;
      *((_QWORD *)result + 1) = a3;
      return -[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
    }
  }
  else
  {

    return 0;
  }
  return result;
}

+ (NSHTTPCookie)cookieWithProperties:(NSDictionary *)properties
{
  return -[NSHTTPCookie initWithProperties:]([NSHTTPCookie alloc], "initWithProperties:", properties);
}

+ (id)_cf2nsCookies:(__CFArray *)a3
{
  if (a3)
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
  else
    return 0;
}

- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4
{
  id result;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  result = -[NSHTTPCookie init](&v8, sel_init);
  if (result)
  {
    v7 = result;
    *((_QWORD *)result + 1) = -[NSHTTPCookieInternal_Ref _initWithReference:index:]([NSHTTPCookieInternal_Ref alloc], "_initWithReference:index:", a3, a4);
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (BOOL)isSecure
{
  HTTPCookie *v2;
  _DWORD *v3;
  _BOOL4 v4;

  v2 = -[NSHTTPCookie _inner](self, "_inner");
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu)
    return v3[2] & 1;
  else
    LOBYTE(v4) = 0;
  return v4;
}

- (NSArray)portList
{
  return (NSArray *)CFHTTPCookieCopyPortArray((OpaqueCFHTTPCookie *)self);
}

- (BOOL)isHTTPOnly
{
  HTTPCookie *v2;
  _DWORD *v3;
  _BOOL4 v4;

  v2 = -[NSHTTPCookie _inner](self, "_inner");
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu)
    return (v3[2] >> 2) & 1;
  else
    LOBYTE(v4) = 0;
  return v4;
}

- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  result = -[NSHTTPCookie init](&v8, sel_init);
  if (result)
  {
    v7 = result;
    *((_QWORD *)result + 1) = -[NSHTTPCookieInternal_Data _initWithProperties:fromString:]([NSHTTPCookieInternal_Data alloc], "_initWithProperties:fromString:", a3, v4);
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (NSDictionary)properties
{
  NSDictionary *result;
  uint64_t v3;

  result = (NSDictionary *)self->_cookiePrivate;
  if (result)
  {
    v3 = -[NSDictionary _inner](result, "_inner");
    return (NSDictionary *)(id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  }
  return result;
}

- (NSHTTPCookieStringPolicy)sameSitePolicy
{
  HTTPCookie *v2;
  _DWORD *v3;
  char v4;
  int v5;
  unsigned int v6;
  uint64_t *v7;

  if (self->_cookiePrivate)
  {
    v2 = -[NSHTTPCookie _inner](self, "_inner");
    v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
    if (*v3 >= 0xCu)
      v4 = v3[2] & 0x7F;
    else
      v4 = 0;
    if ((v4 & 0x10) != 0)
      v5 = 3;
    else
      v5 = 1;
    if ((v4 & 8) != 0)
      v6 = v5;
    else
      v6 = ((v4 & 0x10) >> 3) ^ 2;
    if (v6 < 2)
    {
      v7 = &_kCFHTTPCookieSameSiteLax;
      return (NSHTTPCookieStringPolicy)*v7;
    }
    if (v6 == 3)
    {
      v7 = &_kCFHTTPCookieSameSiteStrict;
      return (NSHTTPCookieStringPolicy)*v7;
    }
  }
  return 0;
}

+ (NSDictionary)requestHeaderFieldsWithCookies:(NSArray *)cookies
{
  __CFArray *v3;
  __CFArray *v4;
  CFDictionaryRef v5;

  v3 = +[NSHTTPCookie _ns2cfCookies:](NSHTTPCookie, "_ns2cfCookies:", cookies);
  if (v3 && (v4 = v3, v5 = CFHTTPCookieCopyRequestHeaderFields(0, v3), CFRelease(v4), v5))
    return (NSDictionary *)v5;
  else
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

+ (__CFArray)_ns2cfCookies:(id)a3
{
  if (a3)
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFArrayRef)a3);
  else
    return 0;
}

+ (NSArray)cookiesWithResponseHeaderFields:(NSDictionary *)headerFields forURL:(NSURL *)URL
{
  return (NSArray *)+[NSHTTPCookie _cookiesWithResponseHeaderFields:forURL:singleCookie:]((uint64_t)NSHTTPCookie, (const __CFDictionary *)headerFields, (const __CFURL *)URL, 0);
}

+ (uint64_t)_cookiesWithResponseHeaderFields:(const __CFURL *)a3 forURL:(int)a4 singleCookie:
{
  CFArrayRef v7;
  CFArrayRef v8;
  id v9;

  objc_opt_self();
  if (a2
    && a3
    && (!a4
      ? (v7 = CFHTTPCookieCreateWithResponseHeaderFields(0, a2, a3))
      : (v7 = _CFHTTPParsedCookiesWithResponseHeaderFields(0, a2, a3)),
        (v8 = v7) != 0
     && (v9 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v7), CFRelease(v8), v9)))
  {
    return (uint64_t)v9;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
}

+ (id)_cookieForSetCookieString:(id)a3 forURL:(id)a4 partition:(id)a5
{
  return (id)(id)_CFHTTPCookieCreateWithStringAndPartition((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)a3, (const __CFURL *)a4, a5);
}

- (id)_initWithHeader:(const CompactCookieHeader *)a3
{
  id result;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookie;
  result = -[NSHTTPCookie init](&v6, sel_init);
  if (result)
  {
    v5 = result;
    *((_QWORD *)result + 1) = -[NSHTTPCookieInternal_Data _initWithHeader:]([NSHTTPCookieInternal_Data alloc], "_initWithHeader:", a3);
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
  }
  return result;
}

- (id)_initWithCookie:(id)a3 partition:(id)a4
{
  id result;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  result = -[NSHTTPCookie init](&v8, sel_init);
  if (result)
  {
    v7 = result;
    *((_QWORD *)result + 1) = -[NSHTTPCookieInternal_Data _initWithCookie:partition:]([NSHTTPCookieInternal_Data alloc], "_initWithCookie:partition:", a3, a4);
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (NSHTTPCookie)initWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3
{
  NSHTTPCookie *result;
  NSHTTPCookie *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookie;
  result = -[NSHTTPCookie init](&v6, sel_init);
  if (result)
  {
    v5 = result;
    result->_cookiePrivate = (NSHTTPCookieInternal *)*((id *)a3 + 1);
    return (NSHTTPCookie *)-[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
  }
  return result;
}

- (NSHTTPCookie)init
{
  NSLog(CFSTR("NSHTTPCookie must be created by calling initWithDictionary:"), a2);

  return 0;
}

- (NSUInteger)version
{
  HTTPCookie *v2;
  _DWORD *v3;

  v2 = -[NSHTTPCookie _inner](self, "_inner");
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 8u)
    return v3[1];
  else
    return 0;
}

- (id)_storagePartition
{
  HTTPCookie *v2;
  CompactCookieHeader *v3;
  const UInt8 *EnumeratedString;

  if (self->_cookiePrivate
    && (v2 = -[NSHTTPCookie _inner](self, "_inner"),
        v3 = (CompactCookieHeader *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2),
        (EnumeratedString = CompactCookieHeader::getEnumeratedString(v3, 15, 0)) != 0))
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", EnumeratedString);
  }
  else
  {
    return 0;
  }
}

- (id)OriginURL
{
  __CFString *v3;

  if (-[NSHTTPCookie isSecure](self, "isSecure"))
    v3 = CFSTR("https://");
  else
    v3 = CFSTR("http://");
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", -[NSHTTPCookie domain](self, "domain")));
}

- (id)Version
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSHTTPCookie version](self, "version"));
}

- (id)Secure
{
  if (-[NSHTTPCookie isSecure](self, "isSecure"))
    return CFSTR("TRUE");
  else
    return CFSTR("FALSE");
}

- (id)Discard
{
  if (-[NSHTTPCookie isSessionOnly](self, "isSessionOnly"))
    return CFSTR("TRUE");
  else
    return CFSTR("FALSE");
}

- (id)Port
{
  return -[NSArray componentsJoinedByString:](-[NSHTTPCookie portList](self, "portList"), "componentsJoinedByString:", CFSTR(","));
}

- (id)MaxAge
{
  double ExpirationTime;
  double Current;

  if (-[NSHTTPCookie isSessionOnly](self, "isSessionOnly"))
    return CFSTR("0");
  ExpirationTime = CFHTTPCookieGetExpirationTime(self);
  Current = CFAbsoluteTimeGetCurrent();
  if (ExpirationTime <= Current)
    return CFSTR("0");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), ExpirationTime - Current);
}

- (int64_t)_compareForHeaderOrder:(id)a3
{
  NSUInteger v5;
  unint64_t v6;
  int64_t result;
  HTTPCookie *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  v5 = -[NSString length](-[NSHTTPCookie path](self, "path"), "length");
  v6 = objc_msgSend((id)objc_msgSend(a3, "path"), "length");
  if (v5 > v6)
    return -1;
  if (v5 < v6)
    return 1;
  v8 = -[NSHTTPCookie _inner](self, "_inner");
  v9 = (*((uint64_t (**)(HTTPCookie *))v8->var0 + 2))(v8);
  v10 = 0.0;
  v11 = 0.0;
  if (*(_DWORD *)v9 >= 0x38u)
    v11 = floor(*(double *)(v9 + 48));
  v12 = objc_msgSend(a3, "_inner");
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  if (*(_DWORD *)v13 >= 0x38u)
    v10 = floor(*(double *)(v13 + 48));
  if (v11 - v10 < 0.0)
    return -1;
  if (v11 - v10 > 0.0)
    return 1;
  result = -[NSString compare:](-[NSHTTPCookie domain](self, "domain", v11 - v10), "compare:", objc_msgSend(a3, "domain"));
  if (!result)
    return -[NSString compare:](-[NSHTTPCookie name](self, "name"), "compare:", objc_msgSend(a3, "name"));
  return result;
}

- (id)_key
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@%@"), -[NSHTTPCookie name](self, "name"), -[NSHTTPCookie domain](self, "domain"), -[NSHTTPCookie path](self, "path"));
}

- (BOOL)_isExpired
{
  double ExpirationTime;

  ExpirationTime = CFHTTPCookieGetExpirationTime(self);
  return ExpirationTime != 0.0 && ExpirationTime <= CFAbsoluteTimeGetCurrent();
}

- (id)description
{
  void *v3;
  HTTPCookie *v4;
  uint64_t v5;
  double v6;
  CFDateRef v7;
  const __CFString *v8;
  NSString *v9;
  const __CFString *v10;
  NSString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSString *v15;
  NSURL *v16;
  NSURL *v17;
  NSArray *v18;
  NSArray *v19;

  v3 = (void *)objc_msgSend(CFSTR("<NSHTTPCookie\n"), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tversion:%ld\n"), -[NSHTTPCookie version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tname:%@\n"), quoteMaybe(-[NSHTTPCookie name](self, "name")));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tvalue:%@\n"), quoteMaybe(-[NSHTTPCookie value](self, "value")));
  objc_msgSend(v3, "appendFormat:", CFSTR("\texpiresDate:%@\n"), quoteMaybe(-[NSDate description](-[NSHTTPCookie expiresDate](self, "expiresDate"), "description")));
  v4 = -[NSHTTPCookie _inner](self, "_inner");
  v5 = (*((uint64_t (**)(HTTPCookie *))v4->var0 + 2))(v4);
  if (*(_DWORD *)v5 >= 0x38u)
  {
    v6 = floor(*(double *)(v5 + 48));
    if (v6 != 0.0)
    {
      v7 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
      objc_msgSend(v3, "appendFormat:", CFSTR("\tcreated:%@\n"), quoteMaybe((NSString *)-[__CFDate description](v7, "description")));
      CFRelease(v7);
    }
  }
  if (-[NSHTTPCookie isSessionOnly](self, "isSessionOnly"))
    v8 = CFSTR("TRUE");
  else
    v8 = CFSTR("FALSE");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tsessionOnly:%@\n"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdomain:%@\n"), quoteMaybe(-[NSHTTPCookie domain](self, "domain")));
  v9 = -[NSHTTPCookie _storagePartition](self, "_storagePartition");
  if (-[NSString length](v9, "length"))
    v10 = (const __CFString *)quoteMaybe(v9);
  else
    v10 = CFSTR("none");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpartition:%@\n"), v10);
  v11 = -[NSHTTPCookie sameSitePolicy](self, "sameSitePolicy");
  if (-[NSString length](v11, "length"))
    v12 = (const __CFString *)quoteMaybe(v11);
  else
    v12 = CFSTR("none");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tsameSite:%@\n"), v12);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpath:%@\n"), quoteMaybe(-[NSHTTPCookie path](self, "path")));
  if (-[NSHTTPCookie isSecure](self, "isSecure"))
    v13 = CFSTR("TRUE");
  else
    v13 = CFSTR("FALSE");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisSecure:%@\n"), v13);
  if (-[NSHTTPCookie isHTTPOnly](self, "isHTTPOnly"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\tisHTTPOnly: %@\n"), CFSTR("YES"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" path:\"%@\"), -[NSHTTPCookie path](self, "path"));
  if (-[NSHTTPCookie isSecure](self, "isSecure"))
    v14 = CFSTR("TRUE");
  else
    v14 = CFSTR("FALSE");
  objc_msgSend(v3, "appendFormat:", CFSTR(" isSecure:%@"), v14);
  if (-[NSHTTPCookie isHTTPOnly](self, "isHTTPOnly"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isHTTPOnly: %@"), CFSTR("YES"));
  v15 = -[NSHTTPCookie comment](self, "comment");
  if (-[NSString length](v15, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\tcomment:%@\n"), quoteMaybe(v15));
  v16 = -[NSHTTPCookie commentURL](self, "commentURL");
  if (v16)
  {
    v17 = v16;
    if (objc_msgSend((id)-[NSURL description](v16, "description"), "length"))
      objc_msgSend(v3, "appendFormat:", CFSTR("\tcommentURL:%@\n"), quoteMaybe((NSString *)-[NSURL description](v17, "description")));
  }
  v18 = -[NSHTTPCookie portList](self, "portList");
  if (v18)
  {
    v19 = v18;
    if (-[NSArray count](v18, "count"))
      objc_msgSend(v3, "appendFormat:", CFSTR("\tports:{ %@ }\n"), -[NSArray componentsJoinedByString:](v19, "componentsJoinedByString:", CFSTR(",")));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
      LOBYTE(v5) = -[NSHTTPCookieInternal isEqual:](self->_cookiePrivate, "isEqual:", *((_QWORD *)a3 + 1));
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](-[NSHTTPCookie path](self, "path"), "hash");
  v4 = (16 * v3) ^ (v3 >> 28);
  v5 = -[NSString hash](-[NSHTTPCookie name](self, "name"), "hash");
  v6 = (16 * (v4 ^ v5)) ^ ((v4 ^ v5) >> 28) ^ -[NSString hash](-[NSHTTPCookie value](self, "value"), "hash");
  return -[NSString hash](-[NSHTTPCookie domain](self, "domain"), "hash") ^ (v6 >> 28) ^ (16 * v6);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", -[NSHTTPCookie properties](self, "properties"));
}

- (NSHTTPCookie)initWithCoder:(id)a3
{
  return -[NSHTTPCookie initWithProperties:](self, "initWithProperties:", objc_msgSend(a3, "decodeObject"));
}

+ (NSHTTPCookie)cookieWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3
{
  return (NSHTTPCookie *)a3;
}

+ (id)_parsedCookiesWithResponseHeaderFields:(id)a3 forURL:(id)a4
{
  return (id)+[NSHTTPCookie _cookiesWithResponseHeaderFields:forURL:singleCookie:]((uint64_t)NSHTTPCookie, (const __CFDictionary *)a3, (const __CFURL *)a4, 1);
}

@end

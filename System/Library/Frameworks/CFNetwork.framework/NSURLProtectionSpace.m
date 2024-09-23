@implementation NSURLProtectionSpace

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive;
  const void *v5;

  Archive = _CFURLProtectionSpaceCreateArchive((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](self, "_cfurlprtotectionspace"));
  if (Archive)
  {
    v5 = Archive;
    if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
      objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("__nsurlprotectionspace_proto_plist"));
    else
      objc_msgSend(a3, "encodeObject:", v5);
    CFRelease(v5);
  }
}

- (NSString)authenticationMethod
{
  NSURLProtectionSpaceInternal *internal;
  char *v3;
  unsigned int v4;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (char *)internal + 16;
  if (!internal)
    v3 = 0;
  v4 = *((_DWORD *)v3 + 14) - 2;
  if (v4 > 0xA)
    return (NSString *)CFSTR("NSURLAuthenticationMethodDefault");
  else
    return &off_1E14F7060[v4]->isa;
}

- (id)_initWithCFURLProtectionSpace:(_CFURLProtectionSpace *)a3
{
  NSURLProtectionSpace *v4;
  NSURLProtectionSpace *v5;
  objc_super v7;

  if (!self)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)NSURLProtectionSpace;
  v4 = -[NSURLProtectionSpace init](&v7, sel_init);
  if (!v4)
    return 0;
  v5 = v4;
  v4->_internal = 0;
  if (!a3)
  {

    return 0;
  }
  CFRetain(a3);
  v5->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(a3);
  return v5;
}

- (_CFURLProtectionSpace)_CFURLProtectionSpace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (_CFURLProtectionSpace)_cfurlprtotectionspace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (void)dealloc
{
  NSURLProtectionSpaceInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
    CFRelease(internal);
  v4.receiver = self;
  v4.super_class = (Class)NSURLProtectionSpace;
  -[NSURLProtectionSpace dealloc](&v4, sel_dealloc);
}

- (SecTrustRef)serverTrust
{
  NSURLProtectionSpaceInternal *internal;
  char *v3;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (char *)internal + 16;
  if (!internal)
    v3 = 0;
  return (SecTrustRef)*((_QWORD *)v3 + 9);
}

- (BOOL)isProxy
{
  return CFURLProtectionSpaceIsProxy((uint64_t)self->_internal);
}

- (NSString)realm
{
  NSURLProtectionSpaceInternal *internal;
  id *v3;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (id *)((char *)internal + 16);
  if (!internal)
    v3 = 0;
  return (NSString *)v3[6];
}

- (NSString)protocol
{
  NSURLProtectionSpaceInternal *internal;
  NSString *result;
  char *v4;
  unsigned int v5;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  result = 0;
  v4 = (char *)internal + 16;
  if (!internal)
    v4 = 0;
  v5 = *((_DWORD *)v4 + 11) - 1;
  if (v5 <= 7)
    return &off_1E14F70B8[v5]->isa;
  return result;
}

- (NSInteger)port
{
  NSURLProtectionSpaceInternal *internal;
  char *v3;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (char *)internal + 16;
  if (!internal)
    v3 = 0;
  return *((int *)v3 + 10);
}

- (NSString)host
{
  NSURLProtectionSpaceInternal *internal;
  id *v3;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (id *)((char *)internal + 16);
  if (!internal)
    v3 = 0;
  return (NSString *)v3[4];
}

- (NSString)proxyType
{
  NSURLProtectionSpaceInternal *internal;
  NSString *result;
  char *v5;
  unsigned int v6;

  if (!CFURLProtectionSpaceIsProxy((uint64_t)self->_internal))
    return 0;
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  result = 0;
  v5 = (char *)internal + 16;
  if (!internal)
    v5 = 0;
  v6 = *((_DWORD *)v5 + 11) - 1;
  if (v6 <= 7)
    return &off_1E14F70B8[v6]->isa;
  return result;
}

- (NSArray)distinguishedNames
{
  NSURLProtectionSpaceInternal *internal;
  char *v3;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v3 = (char *)internal + 16;
  if (!internal)
    v3 = 0;
  return (NSArray *)*((_QWORD *)v3 + 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLProtectionSpace)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  NSURLProtectionSpace *v15;
  uint64_t v17;
  void *v18;

  if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v18 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v17, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("__nsurlprotectionspace_proto_plist"));
  }
  else
  {
    v13 = (const void *)objc_msgSend(a3, "decodeObject");
  }
  if (!v13)
    return (NSURLProtectionSpace *)-[NSURLProtectionSpace _initWithCFURLProtectionSpace:](self, "_initWithCFURLProtectionSpace:", 0);
  v14 = (const void *)_CFURLProtectionSpaceCreateFromArchive((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v13);
  v15 = -[NSURLProtectionSpace _initWithCFURLProtectionSpace:](self, "_initWithCFURLProtectionSpace:", v14);
  if (v14)
    CFRelease(v14);
  return v15;
}

- (NSURLProtectionSpace)initWithHost:(NSString *)host port:(NSInteger)port protocol:(NSString *)protocol realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  int v10;
  NSURLProtectionSpace *v12;
  NSURLProtectionSpace *v13;
  int v14;
  int v15;
  const void *v16;
  objc_super v18;

  if (!self)
    return 0;
  v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)NSURLProtectionSpace;
  v12 = -[NSURLProtectionSpace init](&v18, sel_init);
  if (!v12)
    return 0;
  v13 = v12;
  v12->_internal = 0;
  v14 = authMethodToAuthScheme(authenticationMethod);
  if (protocol && !-[NSString isEqualToString:](protocol, "isEqualToString:", CFSTR("http")))
  {
    if (-[NSString isEqualToString:](protocol, "isEqualToString:", CFSTR("https")))
    {
      v15 = 2;
    }
    else if (-[NSString isEqualToString:](protocol, "isEqualToString:", CFSTR("ftp")))
    {
      v15 = 3;
    }
    else if (-[NSString isEqualToString:](protocol, "isEqualToString:", CFSTR("ftps")))
    {
      v15 = 4;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 1;
  }
  v16 = (const void *)CFURLProtectionSpaceCreate(0, (const __CFString *)host, v10, v15, (const __CFString *)realm, v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

- (NSURLProtectionSpace)initWithProxyHost:(NSString *)host port:(NSInteger)port type:(NSString *)type realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  int v10;
  NSURLProtectionSpace *v12;
  NSURLProtectionSpace *v13;
  int v14;
  int v15;
  const void *v16;
  objc_super v18;

  if (!self)
    return 0;
  v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)NSURLProtectionSpace;
  v12 = -[NSURLProtectionSpace init](&v18, sel_init);
  if (!v12)
    return 0;
  v13 = v12;
  v12->_internal = 0;
  v14 = authMethodToAuthScheme(authenticationMethod);
  if (type && !-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("http")))
  {
    if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("https")))
    {
      v15 = 6;
    }
    else if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("ftp")))
    {
      v15 = 7;
    }
    else if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("SOCKS")))
    {
      v15 = 8;
    }
    else
    {
      v15 = 5;
    }
  }
  else
  {
    v15 = 5;
  }
  v16 = (const void *)CFURLProtectionSpaceCreate(0, (const __CFString *)host, v10, v15, (const __CFString *)realm, v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

- (NSURLProtectionSpace)init
{

  return 0;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSInteger v9;
  const __CFString *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)NSURLProtectionSpace;
  v4 = -[NSURLProtectionSpace description](&v12, sel_description);
  v5 = -[NSURLProtectionSpace host](self, "host");
  v6 = -[NSURLProtectionSpace protocol](self, "protocol");
  v7 = -[NSURLProtectionSpace authenticationMethod](self, "authenticationMethod");
  v8 = -[NSURLProtectionSpace realm](self, "realm");
  v9 = -[NSURLProtectionSpace port](self, "port");
  if (-[NSURLProtectionSpace isProxy](self, "isProxy"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Host:%@, Server:%@, Auth-Scheme:%@, Realm:%@, Port:%ld, Proxy:%@, Proxy-Type:%@"), v4, v5, v6, v7, v8, v9, v10, -[NSURLProtectionSpace proxyType](self, "proxyType"));
}

- (BOOL)receivesCredentialSecurely
{
  return CFURLProtectionSpaceReceivesCredentialSecurely((uint64_t)self->_internal) != 0;
}

- (unint64_t)hash
{
  return CFHash(self->_internal);
}

- (BOOL)isEqual:(id)a3
{
  NSURLProtectionSpaceInternal *internal;
  const void *v6;

  if (self == a3)
  {
    LOBYTE(internal) = 1;
  }
  else
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    internal = self->_internal;
    if (!internal)
      return (char)internal;
    v6 = (const void *)*((_QWORD *)a3 + 1);
    if (!v6)
    {
LABEL_6:
      LOBYTE(internal) = 0;
      return (char)internal;
    }
    LOBYTE(internal) = CFEqual(internal, v6) != 0;
  }
  return (char)internal;
}

- (void)_setDistinguishedNames:(id)a3
{
  NSURLProtectionSpaceInternal *internal;
  URLProtectionSpace *v5;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  if (internal)
    v5 = (NSURLProtectionSpaceInternal *)((char *)internal + 16);
  else
    v5 = 0;
  URLProtectionSpace::setDistinguishedNames(v5, a3);
}

- (void)_setServerTrust:(__SecTrust *)a3
{
  NSURLProtectionSpaceInternal *internal;
  char *v5;
  __SecTrust *v6;
  CFTypeRef v7;

  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  if (internal)
    v5 = (char *)internal + 16;
  else
    v5 = 0;
  v6 = (__SecTrust *)*((_QWORD *)v5 + 9);
  if (v6 != a3)
  {
    if (v6)
      CFRelease(v6);
    if (a3)
      v7 = CFRetain(a3);
    else
      v7 = 0;
    *((_QWORD *)v5 + 9) = v7;
  }
}

- (id)_webKitPropertyListData
{
  void *v3;
  void *v4;
  NSURLProtectionSpaceInternal *internal;
  char *v6;
  void *v7;
  NSURLProtectionSpaceInternal *v8;
  char *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace host](self, "host"), CFSTR("host"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSURLProtectionSpace port](self, "port")), CFSTR("port"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v6 = (char *)internal + 16;
  if (!internal)
    v6 = 0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "numberWithInt:", *((unsigned int *)v6 + 11)), CFSTR("type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace realm](self, "realm"), CFSTR("realm"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v9 = (char *)v8 + 16;
  if (!v8)
    v9 = 0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithInt:", *((unsigned int *)v9 + 14)), CFSTR("scheme"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace distinguishedNames](self, "distinguishedNames"), CFSTR("distnames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace serverTrust](self, "serverTrust"), CFSTR("trust"));
  return v3;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  CFTypeID v17;
  NSURLProtectionSpace *v18;
  NSURLProtectionSpace *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("host"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("port"));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v8 = (const __CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("realm"));
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("scheme"));
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("distnames"));
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
  }
  v21 = (void *)v9;
  v22 = (void *)v7;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
LABEL_15:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_26;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          goto LABEL_15;
        break;
      }
    }
  }
  v15 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("trust"));
  v16 = v15;
  if (v15)
  {
    v17 = CFGetTypeID(v15);
    if (v17 != SecTrustGetTypeID())
    {
LABEL_26:

      return 0;
    }
  }
  if (!self)
    return 0;
  v27.receiver = self;
  v27.super_class = (Class)NSURLProtectionSpace;
  v18 = -[NSURLProtectionSpace init](&v27, sel_init);
  if (!v18)
    return 0;
  v19 = v18;
  v18->_internal = 0;
  v18->_internal = (NSURLProtectionSpaceInternal *)CFURLProtectionSpaceCreate(*MEMORY[0x1E0C9AE00], v5, objc_msgSend(v6, "intValue"), objc_msgSend(v22, "intValue"), v8, objc_msgSend(v21, "intValue"));
  -[NSURLProtectionSpace _setDistinguishedNames:](v19, "_setDistinguishedNames:", v10);
  -[NSURLProtectionSpace _setServerTrust:](v19, "_setServerTrust:", v16);
  return v19;
}

@end

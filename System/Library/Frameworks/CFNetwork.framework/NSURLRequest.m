@implementation NSURLRequest

+ (NSURLRequest)requestWithURL:(NSURL *)URL
{
  return (NSURLRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", URL);
}

- (NSURLRequest)initWithURL:(NSURL *)URL
{
  return -[NSURLRequest initWithURL:cachePolicy:timeoutInterval:](self, "initWithURL:cachePolicy:timeoutInterval:", URL, 0, (double)(unint64_t)NSURLRequestTimeoutInterval);
}

+ (NSURLRequest)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval
{
  return (NSURLRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:cachePolicy:timeoutInterval:", URL, cachePolicy, timeoutInterval);
}

- (NSURLRequest)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval
{
  NSURLRequest *v8;
  char isKindOfClass;
  NSURLRequestInternal *v10;
  uint64_t v11;
  uint64_t v12;
  CFURLRef v13;
  __int16 v14;
  __int16 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NSURLRequest;
  v8 = -[NSURLRequest init](&v17, sel_init);
  if (v8)
  {
    objc_opt_self();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = objc_alloc_init(NSURLRequestInternal);
    v11 = -[NSURLRequestInternal _inner](v10, "_inner");
    v12 = v11;
    if ((isKindOfClass & 1) != 0)
      *(_WORD *)(v11 + 64) |= 2u;
    if (URL)
      v13 = CFURLCopyAbsoluteURL((CFURLRef)URL);
    else
      v13 = 0;
    if (cachePolicy)
      v14 = 1033;
    else
      v14 = 9;
    v15 = *(_WORD *)(v12 + 64) & 0xFFEF | v14;
    *(_WORD *)(v12 + 64) = v15;
    *(_QWORD *)(v12 + 8) = v13;
    *(_QWORD *)(v12 + 16) = cachePolicy;
    if (timeoutInterval != 60.0)
      *(_WORD *)(v12 + 64) = v15 | 0x800;
    *(NSTimeInterval *)(v12 + 24) = timeoutInterval;
    *(_QWORD *)(v12 + 32) = 0;
    v8->_internal = v10;
    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (NSURL)mainDocumentURL
{
  return *(NSURL **)(-[NSURLRequest _inner](self, "_inner") + 32);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLRequest;
  -[NSURLRequest dealloc](&v3, sel_dealloc);
}

- (id)_initWithCFURLRequest:(_CFURLRequest *)a3
{
  NSURLRequest *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSURLRequest;
    v4 = -[NSURLRequest init](&v6, sel_init);
    if (v4)
      v4->_internal = (NSURLRequestInternal *)objc_msgSend(*((id *)a3 + 1), "copy");
  }
  else
  {

    return 0;
  }
  return v4;
}

- (NSURLRequest)initWithCoder:(id)a3
{
  const __CFURL *v5;
  NSURLRequestCachePolicy v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  __CFHTTPMessage *Request;
  void *v12;
  void *v13;
  void *v14;
  const __CFAllocator *v15;
  NSURLRequestCachePolicy v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const void **v20;
  int64_t i;
  uint64_t v22;
  const __CFDictionary *v23;
  NSURLRequest *v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  const void *v41;
  CFTypeRef v42;
  OpaqueCFHTTPCookieStorage *v43;
  _QWORD *v44;
  _QWORD *v45;
  __CFArray *v46;
  __CFArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  int v52;
  uint64_t v53;
  __int16 v54;
  __int16 v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  __CFArray *v76;
  uint64_t v77;
  __CFArray *v78;
  CFTypeRef v79;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  __CFHTTPMessage *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  double v93;
  int v94;
  int v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v95 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v95, 4);
  if (v95 == 2)
  {
    LODWORD(v93) = 0;
    v94 = 0;
    if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
    {
      if (-[NSURLRequest initWithCoder:]::onceToken != -1)
        dispatch_once(&-[NSURLRequest initWithCoder:]::onceToken, &__block_literal_global_13334);
      v18 = (void *)objc_msgSend(a3, "allowedClasses");
      v19 = objc_msgSend(v18, "setByAddingObjectsFromSet:", -[NSURLRequest initWithCoder:]::plistClasses);
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v93, 4);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v94, 4);
    if (v94 > 0x16)
      goto LABEL_44;
    v20 = (const void **)malloc_type_malloc(8 * v94, 0xC0040B8AA526DuLL);
    if (v94 >= 1)
    {
      for (i = 0; i < v94; v20[i++] = (const void *)v22)
      {
        if (objc_msgSend(a3, "requiresSecureCoding")
          && objc_msgSend(a3, "allowsKeyedCoding"))
        {
          v22 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v19, +[NSURLRequest getObjectKeyWithIndex:]((uint64_t)NSURLRequest, i));
        }
        else
        {
          v22 = objc_msgSend(a3, "decodeObject");
        }
      }
    }
    if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
      v23 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v19, CFSTR("__nsurlrequest_proto_props"));
    else
      v23 = (const __CFDictionary *)objc_msgSend(a3, "decodeObject");
    v9 = _CFURLRequestCreateFromArchiveList((uint64_t)v23, SLODWORD(v93), v20, v94, v23);
    free(v20);
  }
  else
  {
    if (v95 != 1)
    {
LABEL_44:

      return 0;
    }
    v5 = (const __CFURL *)objc_msgSend(a3, "decodeObject");
    v94 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v94, 4);
    v93 = 0.0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v93, 8);
    v6 = objc_msgSend(a3, "decodeObject");
    v7 = (void *)objc_msgSend(a3, "decodeObject");
    v8 = objc_msgSend(a3, "decodeObject");
    objc_opt_class();
    v9 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (*(_QWORD *)(v8 + 8))
        v10 = *(const __CFString **)(v8 + 8);
      else
        v10 = CFSTR("GET");
      Request = CFHTTPMessageCreateRequest(0, v10, v5, CFSTR("HTTP/1.1"));
      v12 = *(void **)(v8 + 16);
      if (v12 && objc_msgSend(v12, "count"))
        _CFHTTPMessageSetMultipleHeaderFields(Request, *(CFDictionaryRef *)(v8 + 16));
      v13 = *(void **)(v8 + 32);
      if (v13 && objc_msgSend(v13, "length"))
        CFHTTPMessageSetBody(Request, *(CFDataRef *)(v8 + 32));
      v14 = *(void **)(v8 + 24);
      if (v14 && objc_msgSend(v14, "count") || !*(_BYTE *)(v8 + 48))
      {
        v9 = (void *)_constructRequestFromParts(Request, 0, (const __CFArray *)v94, v6, v93, (const __CFURL *)1);
        if (v9)
        {
          if (*(_QWORD *)(v8 + 24))
          {
            if (-[NSURLRequest initWithCoder:]::sMainStorage)
              goto LABEL_51;
            pthread_mutex_lock(&-[NSURLRequest initWithCoder:]::gDefaultCookieStorageLock);
            if (!-[NSURLRequest initWithCoder:]::sMainStorage)
              -[NSURLRequest initWithCoder:]::sMainStorage = (uint64_t)CFHTTPCookieStorageCreateFromFile(0, 0, 0);
            pthread_mutex_unlock(&-[NSURLRequest initWithCoder:]::gDefaultCookieStorageLock);
            if (-[NSURLRequest initWithCoder:]::sMainStorage)
            {
LABEL_51:
              v44 = _CookieStorageCreateInMemory(0, v43);
              if (v44)
              {
                v45 = v44;
                v46 = +[NSHTTPCookie _ns2cfCookies:](NSHTTPCookie, "_ns2cfCookies:", *(_QWORD *)(v8 + 24));
                if (v46)
                {
                  v47 = v46;
                  v84 = Request;
                  v91 = 0u;
                  v92 = 0u;
                  v89 = 0u;
                  v90 = 0u;
                  v48 = -[__CFArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
                  if (v48)
                  {
                    v49 = v48;
                    v50 = *(_QWORD *)v90;
                    do
                    {
                      for (j = 0; j != v49; ++j)
                      {
                        if (*(_QWORD *)v90 != v50)
                          objc_enumerationMutation(v47);
                        CFHTTPCookieStorageSetCookie(v45, *(OpaqueCFHTTPCookie **)(*((_QWORD *)&v89 + 1) + 8 * j));
                      }
                      v49 = -[__CFArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
                    }
                    while (v49);
                  }
                  CFRelease(v47);
                  CFURLRequestSetHTTPCookieStorage(v9, v45);
                  Request = v84;
                }
                CFRelease(v45);
              }
            }
          }
          v52 = *(unsigned __int8 *)(v8 + 48);
          v53 = objc_msgSend(v9, "_inner");
          v54 = *(_WORD *)(v53 + 64);
          v55 = v54 | 0x21;
          v56 = v54 & 0xFFDE | 0x20;
          if (v52)
            v56 = v55;
          *(_WORD *)(v53 + 64) = v56;
          objc_opt_self();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v57 = objc_msgSend(v9, "copy");
            CFRelease(v9);
            v9 = (void *)v57;
          }
        }
      }
      else
      {
        objc_opt_self();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = Request;
          v16 = v6;
          v17 = 1;
        }
        else
        {
          v15 = Request;
          v16 = v6;
          v17 = 0;
        }
        v9 = (void *)_constructRequestFromParts(v15, 0, (const __CFArray *)v94, v16, v93, (const __CFURL *)v17);
      }
      CFRelease(Request);
      if (v9)
      {
        if (v7)
        {
          if (objc_msgSend(v7, "count"))
          {
            v81 = (void *)objc_msgSend(v7, "keyEnumerator");
            v82 = objc_msgSend(v81, "nextObject");
            if (v82)
            {
              v83 = (const __CFString *)v82;
              do
              {
                _CFURLRequestSetProtocolProperty(v9, v83, (CFStringRef)objc_msgSend(v7, "objectForKey:", v83));
                v83 = (const __CFString *)objc_msgSend(v81, "nextObject");
              }
              while (v83);
            }
          }
        }
      }
    }
  }
  if (!v9)
    goto LABEL_44;
  v24 = -[NSURLRequest _initWithCFURLRequest:](self, "_initWithCFURLRequest:", v9);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTimeoutTime"));
    *(_QWORD *)(-[NSURLRequest _inner](v24, "_inner") + 144) = v25;
    v26 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresShortConnectionTimeout"));
    *(_BYTE *)(-[NSURLRequest _inner](v24, "_inner") + 152) = v26;
    v27 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("preventHSTSStorage"));
    *(_BYTE *)(-[NSURLRequest _inner](v24, "_inner") + 153) = v27;
    v28 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ignoreHSTS"));
    *(_BYTE *)(-[NSURLRequest _inner](v24, "_inner") + 154) = v28;
    v29 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("schemeWasUpgradedDueToDynamicHSTS"));
    *(_BYTE *)(-[NSURLRequest _inner](v24, "_inner") + 155) = v29;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("payloadTransmissionTimeout"));
    *(_QWORD *)(-[NSURLRequest _inner](v24, "_inner") + 184) = v30;
    v31 = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("allowedProtocolTypes"));
    *(_QWORD *)(-[NSURLRequest _inner](v24, "_inner") + 96) = v31;
    v32 = (__CFString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundInterfaceIdentifier"));
    URLRequest::setBoundInterfaceIdentifier((URLRequest *)-[NSURLRequest _inner](v24, "_inner"), v32);
    v33 = -[NSURLRequest _inner](v24, "_inner");
    *(_DWORD *)(v33 + 208) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("allowsExpensiveNetworkAccess"));
    v34 = -[NSURLRequest _inner](v24, "_inner");
    *(_DWORD *)(v34 + 212) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("allowsConstrainedNetworkAccess"));
    v35 = -[NSURLRequest _inner](v24, "_inner");
    *(_DWORD *)(v35 + 216) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("allowsUCA"));
    v36 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v36 + 156) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("assumesHTTP3Capable"));
    v37 = -[NSURLRequest _inner](v24, "_inner");
    *(_QWORD *)(v37 + 176) = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("attribution"));
    v38 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v38 + 157) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("knownTracker"));
    v39 = -[NSURLRequest _inner](v24, "_inner");
    v40 = (const void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackerContext"));
    v41 = *(const void **)(v39 + 120);
    if (v41 != v40)
    {
      if (v41)
        CFRelease(v41);
      if (v40)
        v42 = CFRetain(v40);
      else
        v42 = 0;
      *(_QWORD *)(v39 + 120) = v42;
    }
    v58 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v58 + 158) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("privacyProxyFailClosed"));
    v59 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v59 + 159) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("privacyProxyFailClosedForUnreachableNonMainHosts"));
    v60 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v60 + 160) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("privacyProxyFailClosedForUnreachableHosts"));
    v61 = -[NSURLRequest _inner](v24, "_inner");
    *(_DWORD *)(v61 + 168) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("requiresDNSSECValidation"));
    v62 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v62 + 172) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsPersistentDNS"));
    v63 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v63 + 161) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("prohibitPrivacyProxy"));
    v64 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v64 + 162) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowPrivateAccessTokensForThirdParty"));
    v65 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v65 + 163) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("useEnhancedPrivacyMode"));
    v66 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v66 + 164) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("blockTrackers"));
    v67 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v67 + 165) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("failInsecureLoadWithHTTPSDNSRecord"));
    v68 = -[NSURLRequest _inner](v24, "_inner");
    *(_BYTE *)(v68 + 166) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isWebSearchContent"));
    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    v71 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0), CFSTR("contentDispositionEncodingFallbackArray"));
    objc_opt_class();
    v85 = 0u;
    v86 = 0u;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v71 = 0;
    v87 = 0uLL;
    v88 = 0uLL;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v86;
      while (2)
      {
        for (k = 0; k != v73; ++k)
        {
          if (*(_QWORD *)v86 != v74)
            objc_enumerationMutation(v71);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v71 = 0;
            goto LABEL_80;
          }
        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        if (v73)
          continue;
        break;
      }
    }
LABEL_80:
    v76 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, v71);
    v77 = -[NSURLRequest _inner](v24, "_inner");
    v78 = *(__CFArray **)(v77 + 80);
    if (v78 != v76)
    {
      if (v78)
        CFRelease(v78);
      if (v76)
        v79 = CFRetain(v76);
      else
        v79 = 0;
      *(_QWORD *)(v77 + 80) = v79;
    }
    if (v76)
      CFRelease(v76);
  }
  CFRelease(v9);
  return v24;
}

- (void)_inner
{
  return -[NSURLRequestInternal _inner](self->_internal, "_inner");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSURLRequestInternal *v4;
  id v5;

  v4 = objc_alloc_init(NSURLRequestInternal);
  URLRequest::initialize((URLRequest *)-[NSURLRequestInternal _inner](v4, "_inner"), (const URLRequest *)-[NSURLRequestInternal _inner](self->_internal, "_inner"));
  if (!v4)
    return 0;
  v5 = -[NSURLRequest _initWithInternal:]([NSMutableURLRequest alloc], "_initWithInternal:", v4);

  return v5;
}

- (id)_initWithInternal:(id)a3
{
  NSURLRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSURLRequest;
  v4 = -[NSURLRequest init](&v6, sel_init);
  if (v4)
    v4->_internal = (NSURLRequestInternal *)a3;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *Default;
  void **v6;
  void **v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  const void *v11;
  __CFDictionary *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __CFDictionary *v16;
  void *v17;
  double v18;
  double v19;
  void **v20;
  __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 buf;
  uint64_t (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 2;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  Default = CFAllocatorGetDefault();
  v6 = (void **)-[NSURLRequest copy](self, "copy");
  v7 = v6;
  if (v6)
  {
    URLRequest::createArchiveList((URLRequest *)objc_msgSend(v6, "_inner"), Default, &v23, (const void ***)&v20, &v22, &v21);
    CFRelease(v7);
    v8 = v22;
    v9 = v23;
    v7 = v20;
  }
  else
  {
    v9 = 0;
    v8 = 22;
    v22 = 22;
  }
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v24);
  v24 = v9;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v24);
  v24 = v8;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v24);
  if (v8 >= 1)
  {
    v10 = 0;
    while (1)
    {
      v11 = v7[v10];
      if (objc_msgSend(a3, "requiresSecureCoding"))
      {
        if (objc_msgSend(a3, "allowsKeyedCoding"))
          break;
      }
      objc_msgSend(a3, "encodeObject:", v11);
      if (v11)
        goto LABEL_11;
LABEL_12:
      if (v8 == ++v10)
        goto LABEL_13;
    }
    objc_msgSend(a3, "encodeObject:forKey:", v11, +[NSURLRequest getObjectKeyWithIndex:]((uint64_t)NSURLRequest, v10));
    if (!v11)
      goto LABEL_12;
LABEL_11:
    CFRelease(v11);
    goto LABEL_12;
  }
LABEL_13:
  CFAllocatorDeallocate(Default, v7);
  v12 = v21;
  v13 = objc_opt_self();
  if (v12 && (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v12, 200) & 1) == 0)
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v14 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_fault_impl(&dword_183ECA000, v14, OS_LOG_TYPE_FAULT, "API MISUSE: %@ properties set by +[NSURLProtocol setProperty:forKey:inRequest:] should only include property list types (NSArray, NSDictionary, NSString, NSData, NSDate, NSNumber).", (uint8_t *)&buf, 0xCu);
    }
  }
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v26 = __60__NSURLRequest_sanitizedProtocolPropertiesForSerialization___block_invoke;
  v27 = &unk_1E14FC148;
  v28 = v13;
  v15 = (void *)-[__CFDictionary keysOfEntriesPassingTest:](v12, "keysOfEntriesPassingTest:", &buf);
  v16 = v12;
  if (objc_msgSend(v15, "count"))
  {
    v17 = (void *)-[__CFDictionary mutableCopy](v12, "mutableCopy");
    objc_msgSend(v17, "removeObjectsForKeys:", objc_msgSend(v15, "allObjects"));
    v16 = v17;
  }
  if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
    objc_msgSend(a3, "encodeObject:forKey:", v16, CFSTR("__nsurlrequest_proto_props"));
  else
    objc_msgSend(a3, "encodeObject:", v16);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v18 = *(double *)(-[NSURLRequest _inner](self, "_inner") + 144);
    v19 = *(double *)(-[NSURLRequest _inner](self, "_inner") + 184);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTimeoutTime"), v18);
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _requiresShortConnectionTimeout](self, "_requiresShortConnectionTimeout"), CFSTR("requiresShortConnectionTimeout"));
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _preventHSTSStorage](self, "_preventHSTSStorage"), CFSTR("preventHSTSStorage"));
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _ignoreHSTS](self, "_ignoreHSTS"), CFSTR("ignoreHSTS"));
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _schemeWasUpgradedDueToDynamicHSTS](self, "_schemeWasUpgradedDueToDynamicHSTS"), CFSTR("schemeWasUpgradedDueToDynamicHSTS"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("payloadTransmissionTimeout"), v19);
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 96), CFSTR("allowedProtocolTypes"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSURLRequest boundInterfaceIdentifier](self, "boundInterfaceIdentifier"), CFSTR("boundInterfaceIdentifier"));
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 208), CFSTR("allowsExpensiveNetworkAccess"));
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 212), CFSTR("allowsConstrainedNetworkAccess"));
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 216), CFSTR("allowsUCA"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 156) != 0, CFSTR("assumesHTTP3Capable"));
    objc_msgSend(a3, "encodeInteger:forKey:", *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176), CFSTR("attribution"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 157) != 0, CFSTR("knownTracker"));
    objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 120), CFSTR("trackerContext"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 158) != 0, CFSTR("privacyProxyFailClosed"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 159) != 0, CFSTR("privacyProxyFailClosedForUnreachableNonMainHosts"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 160) != 0, CFSTR("privacyProxyFailClosedForUnreachableHosts"));
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 168), CFSTR("requiresDNSSECValidation"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 172) != 0, CFSTR("allowsPersistentDNS"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 161) != 0, CFSTR("prohibitPrivacyProxy"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 162) != 0, CFSTR("allowPrivateAccessTokensForThirdParty"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 163) != 0, CFSTR("useEnhancedPrivacyMode"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 164) != 0, CFSTR("blockTrackers"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 165) != 0, CFSTR("failInsecureLoadWithHTTPSDNSRecord"));
    objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 166) != 0, CFSTR("isWebSearchContent"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSURLRequest contentDispositionEncodingFallbackArray](self, "contentDispositionEncodingFallbackArray"), CFSTR("contentDispositionEncodingFallbackArray"));
    v12 = v21;
  }
  if (v12)
    CFRelease(v12);
}

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  objc_opt_self();
  if (a2 >= 0x1F)
    __assert_rtn("+[NSURLRequest getObjectKeyWithIndex:]", "NSURLRequest.mm", 372, "false");
  return _objectKeys[a2];
}

- (BOOL)_requiresShortConnectionTimeout
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 152) != 0;
}

- (BOOL)_schemeWasUpgradedDueToDynamicHSTS
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 155) != 0;
}

- (BOOL)_preventHSTSStorage
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 153) != 0;
}

- (BOOL)_ignoreHSTS
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 154) != 0;
}

- (id)boundInterfaceIdentifier
{
  const __CFString *v2;
  __CFString *Copy;

  v2 = *(const __CFString **)(-[NSURLRequest _inner](self, "_inner") + 112);
  if (v2)
    Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
  else
    Copy = 0;
  return Copy;
}

- (NSDictionary)allHTTPHeaderFields
{
  HTTPMessage *v2;

  v2 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2)
    v2 = HTTPMessage::copyAllHeaderFields(v2);
  return (NSDictionary *)v2;
}

- (__CFURL)cfURL
{
  return *(__CFURL **)(-[NSURLRequest _inner](self, "_inner") + 8);
}

- (void)_setProperty:(id)a3 forKey:(id)a4
{
  _CFURLRequestSetProtocolProperty(self, (const __CFString *)a4, (CFStringRef)a3);
}

- (id)_allHTTPHeaderFieldsAsArrays
{
  HTTPMessage *v2;
  CFDictionaryRef v3;

  if (self->_internal && (v2 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56)) != 0)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    v3 = HTTPMessage::copyAsMultiValueDict(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSURL)URL
{
  return *(NSURL **)(-[NSURLRequest _inner](self, "_inner") + 8);
}

- (NSString)HTTPMethod
{
  return (NSString *)(id)CFURLRequestCopyHTTPRequestMethod(self);
}

- (BOOL)_isIdempotent
{
  uint64_t v2;
  const __CFString *v3;
  uint8_t v5[16];

  v2 = *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (!v2)
    goto LABEL_6;
  v3 = *(const __CFString **)(v2 + 152);
  if (!v3)
    return (char)v3;
  if (CFStringCompare(v3, (CFStringRef)&gConstantCFStringValueTable[2590], 0) == kCFCompareEqualTo)
  {
LABEL_6:
    LOBYTE(v3) = 1;
    return (char)v3;
  }
  v3 = *(const __CFString **)(v2 + 152);
  if (v3
    || (LODWORD(v3) = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT), (_DWORD)v3)
    && (*(_WORD *)v5 = 0,
        _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "these should always be initialized now", v5, 2u), (v3 = *(const __CFString **)(v2 + 152)) != 0))
  {
    LOBYTE(v3) = CFStringCompare(v3, (CFStringRef)&gConstantCFStringValueTable[2597], 0) == kCFCompareEqualTo;
  }
  return (char)v3;
}

- (NSData)HTTPBody
{
  HTTPMessage *v2;

  v2 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2)
    v2 = HTTPMessage::copyBody(v2);
  return (NSData *)v2;
}

- (NSInputStream)HTTPBodyStream
{
  return (NSInputStream *)(id)CFURLRequestCopyHTTPRequestBodyStream(self);
}

- (double)_payloadTransmissionTimeout
{
  return *(double *)(-[NSURLRequest _inner](self, "_inner") + 184);
}

- (id)_startTimeoutDate
{
  if (*(double *)(-[NSURLRequest _inner](self, "_inner") + 144) <= 0.0)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
}

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  HTTPMessage *v4;

  v4 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v4)
    v4 = (HTTPMessage *)HTTPMessage::copyHeaderFieldValue(v4, (const __CFString *)field);
  return (NSString *)v4;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLRequest;
  return -[NSString stringByAppendingFormat:](-[NSURLRequest description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" { URL: %@ }"), -[NSURLRequest URL](self, "URL"));
}

- (id)_propertyForKey:(id)a3
{
  return _CFURLRequestCopyProtocolPropertyForKey(self, (const __CFString *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLRequestCachePolicy)cachePolicy
{
  return (uint64_t)*(int *)(-[NSURLRequest _inner](self, "_inner") + 16);
}

- (id)contentDispositionEncodingFallbackArray
{
  const void *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  void *v6;
  BOOL v7;
  CFIndex v8;
  void *v9;
  CFStringEncoding ValueAtIndex;

  v2 = *(const void **)(-[NSURLRequest _inner](self, "_inner") + 80);
  if (v2 && (v3 = (const __CFArray *)CFRetain(v2)) != 0)
  {
    v4 = v3;
    Count = CFArrayGetCount(v3);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    if (v6)
      v7 = Count < 1;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = 0;
      do
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v8);
        objc_msgSend(v6, "addObject:", objc_msgSend(v9, "numberWithUnsignedLong:", CFStringConvertEncodingToNSStringEncoding(ValueAtIndex)));
        ++v8;
      }
      while (Count != v8);
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return (id)objc_msgSend(v6, "copy");
}

- (unint64_t)hash
{
  return -[NSURLRequestInternal hash](self->_internal, "hash");
}

- (NSURLRequest)init
{
  return -[NSURLRequest initWithURL:](self, "initWithURL:", 0);
}

+ (void)setAllowsAnyHTTPSCertificate:(BOOL)a3 forHost:(id)a4
{
  NSObject *v4;
  _QWORD v5[5];
  BOOL v6;
  uint8_t buf[16];

  if (a4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__NSURLRequest_NSHTTPURLRequest__setAllowsAnyHTTPSCertificate_forHost___block_invoke;
    v5[3] = &unk_1E14FC198;
    v5[4] = a4;
    v6 = a3;
    withHostsSPILocked((uint64_t)v5);
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to setAllowsAnyHTTPSCertificate:forHost:", buf, 2u);
    }
  }
}

uint64_t __71__NSURLRequest_NSHTTPURLRequest__setAllowsAnyHTTPSCertificate_forHost___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(a2, "addObject:", v4);
  else
    return objc_msgSend(a2, "removeObject:", v4);
}

- (BOOL)HTTPShouldHandleCookies
{
  return *(_WORD *)(-[NSURLRequest _inner](self, "_inner") + 64) & 1;
}

- (NSTimeInterval)timeoutInterval
{
  return *(double *)(-[NSURLRequest _inner](self, "_inner") + 24);
}

- (NSURLRequestAttribution)attribution
{
  return *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176);
}

id __30__NSURLRequest_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  -[NSURLRequest initWithCoder:]::plistClasses = (uint64_t)result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSURLRequestInternal isEqual:](self->_internal, "isEqual:", *((_QWORD *)a3 + 1));
}

id __72__NSURLRequest_NSHTTPURLRequest__allowsSpecificHTTPSCertificateForHost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  result = (id)objc_msgSend(a3, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "lowercaseString"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __67__NSURLRequest_NSHTTPURLRequest__allowsAnyHTTPSCertificateForHost___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", objc_msgSend(*(id *)(a1 + 32), "lowercaseString"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isSafeRequestForBackgroundDownload
{
  NSString *v2;

  v2 = -[NSString lowercaseString](-[NSURL scheme](-[NSURLRequest URL](self, "URL"), "scheme"), "lowercaseString");
  return -[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("http"))
      || -[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("https"));
}

- (double)_timeWindowDuration
{
  return *(double *)(-[NSURLRequest _inner](self, "_inner") + 136);
}

- (double)_timeWindowDelay
{
  return *(double *)(-[NSURLRequest _inner](self, "_inner") + 128);
}

- (BOOL)allowsCellularAccess
{
  return (*(unsigned __int16 *)(-[NSURLRequest _inner](self, "_inner") + 64) >> 3) & 1;
}

- (BOOL)_useEnhancedPrivacyMode
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 163) != 0;
}

- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 159) != 0;
}

+ (id)allowsSpecificHTTPSCertificateForHost:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD v6[6];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  if (a3)
  {
    *(_QWORD *)buf = 0;
    v8 = buf;
    v9 = 0x3052000000;
    v10 = __Block_byref_object_copy__13473;
    v11 = __Block_byref_object_dispose__13474;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__NSURLRequest_NSHTTPURLRequest__allowsSpecificHTTPSCertificateForHost___block_invoke;
    v6[3] = &unk_1E14FC170;
    v6[4] = a3;
    v6[5] = buf;
    withHostsSPILocked((uint64_t)v6);
    v3 = *((id *)v8 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to allowsSpecificHTTPSCertificateForHost", buf, 2u);
    }
    return 0;
  }
  return v3;
}

+ (BOOL)allowsAnyHTTPSCertificateForHost:(id)a3
{
  BOOL v3;
  NSObject *v4;
  _QWORD v6[6];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  char v10;

  if (a3)
  {
    *(_QWORD *)buf = 0;
    v8 = buf;
    v9 = 0x2020000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__NSURLRequest_NSHTTPURLRequest__allowsAnyHTTPSCertificateForHost___block_invoke;
    v6[3] = &unk_1E14FC170;
    v6[4] = a3;
    v6[5] = buf;
    withHostsSPILocked((uint64_t)v6);
    v3 = v8[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to allowsAnyHTTPSCertificateForHost:", buf, 2u);
    }
    return 0;
  }
  return v3;
}

- (id)_copyReplacingURLWithURL:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)-[NSURLRequest mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setURL:", a3);
  if (!v4)
    return 0;
  v5 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", v4);
  CFRelease(v4);
  return v5;
}

- (BOOL)_URLHasScheme:(id)a3
{
  if (!a3)
    __assert_rtn("-[NSURLRequest _URLHasScheme:]", "NSURLRequest.mm", 591, "scheme");
  return objc_msgSend((id)objc_msgSend(*(id *)(-[NSURLRequest _inner](self, "_inner") + 8), "scheme"), "_web_isCaseInsensitiveEqualToString:", a3);
}

- (void)_removePropertyForKey:(id)a3
{
  _CFURLRequestSetProtocolProperty(self, (const __CFString *)a3, 0);
}

- (id)_allProtocolProperties
{
  return *(id *)(-[NSURLRequest _inner](self, "_inner") + 40);
}

- (NSURLRequestNetworkServiceType)networkServiceType
{
  return (uint64_t)*(int *)(-[NSURLRequest _inner](self, "_inner") + 104);
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 212) != 2;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 208) != 2;
}

- (BOOL)assumesHTTP3Capable
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 156) != 0;
}

- (BOOL)requiresDNSSECValidation
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 168) == 1;
}

- (BOOL)allowsPersistentDNS
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 172) != 0;
}

- (BOOL)_isKnownTracker
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 157) != 0;
}

- (BOOL)_isNonAppInitiated
{
  return *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176) == 1;
}

- (id)_trackerContext
{
  return *(id *)(-[NSURLRequest _inner](self, "_inner") + 120);
}

- (BOOL)_privacyProxyFailClosed
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 158) != 0;
}

- (BOOL)_privacyProxyFailClosedForUnreachableHosts
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 160) != 0;
}

- (BOOL)_prohibitPrivacyProxy
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 161) != 0;
}

- (BOOL)_allowPrivateAccessTokensForThirdParty
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 162) != 0;
}

- (BOOL)_blockTrackers
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 164) != 0;
}

- (BOOL)_failInsecureLoadWithHTTPSDNSRecord
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 165) != 0;
}

- (BOOL)_isWebSearchContent
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 166) != 0;
}

- (unint64_t)_allowedProtocolTypes
{
  return *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 96);
}

- (BOOL)_allowsUCA
{
  return *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 216) == 1;
}

uint64_t __60__NSURLRequest_sanitizedProtocolPropertiesForSerialization___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)estimatedPropertyListSize(a3) <= 0x4000)
    return objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", a3, 200) ^ 1;
  if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
    dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
  v6 = __CFNAPIMisuseFaultLogHandle::logger;
  if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = a2;
    v11 = 2112;
    v12 = v8;
    _os_log_fault_impl(&dword_183ECA000, v6, OS_LOG_TYPE_FAULT, "Dropping oversized protocol property key %@ in %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

+ (__CFArray)newCFContentDispositionEncodingFallbackArray:(uint64_t)a1
{
  __CFArray *Mutable;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CFStringEncoding v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(a2);
        v8 = CFStringConvertNSStringEncodingToEncoding(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedLongValue"));
        CFArrayAppendValue(Mutable, (const void *)v8);
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return Mutable;
}

+ (void)setDefaultTimeoutInterval:(double)a3
{
  NSURLRequestTimeoutInterval = (unint64_t)a3;
}

+ (double)defaultTimeoutInterval
{
  return (double)(unint64_t)NSURLRequestTimeoutInterval;
}

- (id)_webKitPropertyListData
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFArray *v12;
  CFArrayRef Copy;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (void *)-[NSURLRequest copy](self, "copy");
  v4 = objc_msgSend(v3, "_inner");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 19);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(v4 + 40), CFSTR("protocolProperties"));
  v6 = MEMORY[0x1E0C9AAB0];
  v7 = MEMORY[0x1E0C9AAA0];
  if ((*(_WORD *)(v4 + 64) & 2) != 0)
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("isMutable"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(v4 + 8), CFSTR("URL"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 24)), CFSTR("timeout"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v4 + 16)), CFSTR("cachePolicy"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(v4 + 32), CFSTR("mainDocumentURL"));
  if ((*(_WORD *)(v4 + 64) & 1) != 0)
    v9 = v6;
  else
    v9 = v7;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("shouldHandleHTTPCookies"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (*(unsigned __int16 *)(v4 + 64) >> 4) & 0x18 | (*(unsigned __int16 *)(v4 + 64) >> 3) & 0x7C0 | (*(unsigned __int16 *)(v4 + 64) >> 2) & 0x1000 | (*(unsigned __int16 *)(v4 + 64) >> 4) & 6u), CFSTR("explicitFlags"));
  if ((*(_WORD *)(v4 + 64) & 8) != 0)
    v10 = v6;
  else
    v10 = v7;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("allowCellular"));
  if ((*(_WORD *)(v4 + 64) & 0x10) != 0)
    v11 = v6;
  else
    v11 = v7;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("preventsIdleSystemSleep"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 128)), CFSTR("timeWindowDelay"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 136)), CFSTR("timeWindowDuration"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v4 + 104)), CFSTR("networkServiceType"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(v4 + 88)), CFSTR("requestPriority"));
  if (*(_QWORD *)(v4 + 56))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isHTTP"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", (id)CFHTTPMessageCopyRequestMethod((CFHTTPMessageRef)(*(_QWORD *)(v4 + 56) - 16)), CFSTR("httpMethod"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", HTTPMessage::copyAsMultiValueDict(*(HTTPMessage **)(v4 + 56)), CFSTR("headerFields"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFHTTPMessageCopyBody((CFHTTPMessageRef)(*(_QWORD *)(v4 + 56) - 16)), CFSTR("body"));
    v12 = *(const __CFArray **)(*(_QWORD *)(v4 + 56) + 208);
    if (v12)
      Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12);
    else
      Copy = 0;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", Copy, CFSTR("bodyParts"));
  }
  if (v3)
    CFRelease(v3);
  v14 = (void *)objc_msgSend(v5, "mutableCopy");
  if (v5)
    CFRelease(v5);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(-[NSURLRequest _inner](self, "_inner") + 144)), CFSTR("startTimeoutTime"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLRequest _requiresShortConnectionTimeout](self, "_requiresShortConnectionTimeout")), CFSTR("requiresShortConnectionTimeout"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLRequest _preventHSTSStorage](self, "_preventHSTSStorage")), CFSTR("preventHSTSStorage"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLRequest _ignoreHSTS](self, "_ignoreHSTS")), CFSTR("ignoreHSTS"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLRequest _schemeWasUpgradedDueToDynamicHSTS](self, "_schemeWasUpgradedDueToDynamicHSTS")), CFSTR("schemeWasUpgradedDueToDynamicHSTS"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(-[NSURLRequest _inner](self, "_inner") + 184)), CFSTR("payloadTransmissionTimeout"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 96)), CFSTR("allowedProtocolTypes"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", -[NSURLRequest boundInterfaceIdentifier](self, "boundInterfaceIdentifier"), CFSTR("boundInterfaceIdentifier"));
  v15 = *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 208);
  if (v15 == 1)
    v16 = v6;
  else
    v16 = 0;
  if (v15 == 2)
    v17 = v7;
  else
    v17 = v16;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("allowsExpensiveNetworkAccess"));
  v18 = *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 212);
  if (v18 == 1)
    v19 = v6;
  else
    v19 = 0;
  if (v18 == 2)
    v20 = v7;
  else
    v20 = v19;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("allowsConstrainedNetworkAccess"));
  v21 = *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 216);
  if (v21 == 1)
    v22 = v6;
  else
    v22 = 0;
  if (v21 == 2)
    v23 = v7;
  else
    v23 = v22;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("allowsUCA"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 156) != 0), CFSTR("assumesHTTP3Capable"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 176)), CFSTR("attribution"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 157) != 0), CFSTR("knownTracker"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 120), CFSTR("trackerContext"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 158) != 0), CFSTR("privacyProxyFailClosed"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 159) != 0), CFSTR("privacyProxyFailClosedForUnreachableNonMainHosts"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 160) != 0), CFSTR("privacyProxyFailClosedForUnreachableHosts"));
  v24 = *(_DWORD *)(-[NSURLRequest _inner](self, "_inner") + 168);
  if (v24 == 1)
    v25 = v6;
  else
    v25 = 0;
  if (v24 == 2)
    v26 = v7;
  else
    v26 = v25;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, CFSTR("requiresDNSSECValidation"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 172) != 0), CFSTR("allowsPersistentDNS"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 161) != 0), CFSTR("prohibitPrivacyProxy"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 162) != 0), CFSTR("allowPrivateAccessTokensForThirdParty"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 163) != 0), CFSTR("useEnhancedPrivacyMode"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 164) != 0), CFSTR("blockTrackers"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 165) != 0), CFSTR("failInsecureLoadWithHTTPSDNSRecord"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 166) != 0), CFSTR("isWebSearchContent"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", -[NSURLRequest contentDispositionEncodingFallbackArray](self, "contentDispositionEncodingFallbackArray"), CFSTR("contentDispositionEncodingFallbackArray"));
  return v14;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  NSURLRequestInternal *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  const void *v12;
  CFTypeRef v13;
  uint64_t v15;
  CFTypeRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  __int16 v21;
  _OWORD *Instance;
  HTTPRequest *v23;
  const void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  _BYTE *v31;
  void *v32;
  _BYTE *v33;
  void *v34;
  _BYTE *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  __CFString *v42;
  _QWORD *v43;
  const void *v44;
  uint64_t v45;
  void *v46;
  _DWORD *v47;
  int v48;
  uint64_t v49;
  void *v50;
  _DWORD *v51;
  int v52;
  uint64_t v53;
  void *v54;
  _DWORD *v55;
  int v56;
  void *v57;
  _BYTE *v58;
  void *v59;
  _QWORD *v60;
  void *v61;
  _BYTE *v62;
  uint64_t v63;
  __CFString *v64;
  _QWORD *v65;
  const void *v66;
  void *v67;
  _BYTE *v68;
  void *v69;
  _BYTE *v70;
  void *v71;
  _BYTE *v72;
  uint64_t v73;
  void *v74;
  _DWORD *v75;
  int v76;
  void *v77;
  _BYTE *v78;
  void *v79;
  _BYTE *v80;
  void *v81;
  _BYTE *v82;
  void *v83;
  _BYTE *v84;
  void *v85;
  _BYTE *v86;
  void *v87;
  _BYTE *v88;
  void *v89;
  _BYTE *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  __CFArray *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  const __CFString *theString;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  uint8_t buf[8];
  CFTypeRef cf;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(NSURLRequestInternal);
  v6 = -[NSURLRequestInternal _inner](v5, "_inner");
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("protocolProperties"));
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isMutable"));
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v9 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("URL"));
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("timeout"));
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("cachePolicy"));
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v12 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mainDocumentURL"));
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v108 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("shouldHandleHTTPCookies"));
  if (v108)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v107 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("explicitFlags"));
  if (v107)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v106 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowCellular"));
  if (v106)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v105 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preventsIdleSystemSleep"));
  if (v105)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v104 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("timeWindowDelay"));
  if (v104)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v103 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("timeWindowDuration"));
  if (v103)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v102 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("networkServiceType"));
  if (v102)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v101 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requestPriority"));
  if (v101)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  v100 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isHTTP"));
  if (v100)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  theString = (const __CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("httpMethod"));
  if (theString)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  if ((v98 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("headerFields"))) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v97 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("body"))) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v96 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bodyParts"))) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  if (objc_msgSend(v8, "BOOLValue"))
    *(_WORD *)(v6 + 64) |= 2u;
  if (v9)
    v13 = CFRetain(v9);
  else
    v13 = 0;
  *(_QWORD *)(v6 + 8) = v13;
  objc_msgSend(v10, "doubleValue");
  *(_QWORD *)(v6 + 24) = v15;
  *(_QWORD *)(v6 + 16) = objc_msgSend(v11, "unsignedIntegerValue");
  if (v12)
    v16 = CFRetain(v12);
  else
    v16 = 0;
  *(_QWORD *)(v6 + 32) = v16;
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFFE | objc_msgSend(v108, "BOOLValue");
  v17 = objc_msgSend(v107, "integerValue");
  if (!v17)
    goto LABEL_62;
  if ((v17 & 2) != 0)
  {
    *(_WORD *)(v6 + 64) |= 0x20u;
    if ((v17 & 4) == 0)
    {
LABEL_53:
      if ((v17 & 8) == 0)
        goto LABEL_54;
      goto LABEL_104;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_53;
  }
  *(_WORD *)(v6 + 64) |= 0x40u;
  if ((v17 & 8) == 0)
  {
LABEL_54:
    if ((v17 & 0x10) == 0)
      goto LABEL_55;
    goto LABEL_105;
  }
LABEL_104:
  *(_WORD *)(v6 + 64) |= 0x80u;
  if ((v17 & 0x10) == 0)
  {
LABEL_55:
    if ((v17 & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_106;
  }
LABEL_105:
  *(_WORD *)(v6 + 64) |= 0x100u;
  if ((v17 & 0x40) == 0)
  {
LABEL_56:
    if ((v17 & 0x80) == 0)
      goto LABEL_57;
    goto LABEL_107;
  }
LABEL_106:
  *(_WORD *)(v6 + 64) |= 0x200u;
  if ((v17 & 0x80) == 0)
  {
LABEL_57:
    if ((v17 & 0x100) == 0)
      goto LABEL_58;
    goto LABEL_108;
  }
LABEL_107:
  *(_WORD *)(v6 + 64) |= 0x400u;
  if ((v17 & 0x100) == 0)
  {
LABEL_58:
    if ((v17 & 0x200) == 0)
      goto LABEL_59;
LABEL_109:
    *(_WORD *)(v6 + 64) |= 0x1000u;
    if ((v17 & 0x400) == 0)
    {
LABEL_60:
      if ((v17 & 0x1000) == 0)
        goto LABEL_62;
      goto LABEL_61;
    }
    goto LABEL_110;
  }
LABEL_108:
  *(_WORD *)(v6 + 64) |= 0x800u;
  if ((v17 & 0x200) != 0)
    goto LABEL_109;
LABEL_59:
  if ((v17 & 0x400) == 0)
    goto LABEL_60;
LABEL_110:
  *(_WORD *)(v6 + 64) |= 0x2000u;
  if ((v17 & 0x1000) != 0)
LABEL_61:
    *(_WORD *)(v6 + 64) |= 0x4000u;
LABEL_62:
  objc_msgSend(v104, "doubleValue");
  *(_QWORD *)(v6 + 128) = v18;
  objc_msgSend(v103, "doubleValue");
  *(_QWORD *)(v6 + 136) = v19;
  *(_DWORD *)(v6 + 104) = objc_msgSend(v102, "intValue");
  *(_QWORD *)(v6 + 88) = objc_msgSend(v101, "integerValue");
  if (objc_msgSend(v106, "BOOLValue"))
    v20 = 8;
  else
    v20 = 0;
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFF7 | v20;
  if (objc_msgSend(v105, "BOOLValue"))
    v21 = 16;
  else
    v21 = 0;
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFEF | v21;
  if (objc_msgSend(v100, "BOOLValue"))
  {
    if (*(_QWORD *)(v6 + 56) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "can't be here", buf, 2u);
    }
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    v23 = (HTTPRequest *)Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      v23 = (HTTPRequest *)(Instance + 1);
      Instance[13] = 0u;
      Instance[14] = 0u;
      Instance[11] = 0u;
      Instance[12] = 0u;
      Instance[9] = 0u;
      Instance[10] = 0u;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }
    HTTPMethodMixedValue::HTTPMethodMixedValue((HTTPMethodMixedValue *)buf, theString);
    HTTPRequest::HTTPRequest(v23, (CFTypeRef *)buf, *(const __CFURL **)(v6 + 8));
    *(_QWORD *)(v6 + 56) = v23;
    *(_QWORD *)buf = &off_1E14E9A00;
    if (cf)
    {
      CFRelease(cf);
      v23 = *(HTTPRequest **)(v6 + 56);
    }
    HTTPMessage::ensureParserFinished((HTTPMessage *)v23);
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v6 + 56) + 64))(*(_QWORD *)(v6 + 56), v97);
    if (v98)
    {
      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = ___ZN10URLRequest10initializeEPK14__CFDictionary_block_invoke;
      v113[3] = &__block_descriptor_40_e34_v32__0__NSString_8__NSArray_16_B24l;
      v113[4] = v6;
      objc_msgSend(v98, "enumerateKeysAndObjectsUsingBlock:", v113);
    }
    if (v96)
    {
      v24 = (const void *)objc_msgSend(v96, "mutableCopy");
      HTTPRequest::setBodyParts(*(HTTPRequest **)(v6 + 56), v24);
      if (v24)
        CFRelease(v24);
    }
  }
  if (v7)
    *(_QWORD *)(v6 + 40) = objc_msgSend(v7, "mutableCopy");
  self = -[NSURLRequest _initWithInternal:](self, "_initWithInternal:", v5);

  v25 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("startTimeoutTime"));
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v26 = -[NSURLRequest _inner](self, "_inner");
  objc_msgSend(v25, "doubleValue");
  v26[18] = v27;
  v28 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requiresShortConnectionTimeout"));
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v29 = -[NSURLRequest _inner](self, "_inner");
  v29[152] = objc_msgSend(v28, "BOOLValue");
  v30 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preventHSTSStorage"));
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v31 = -[NSURLRequest _inner](self, "_inner");
  v31[153] = objc_msgSend(v30, "BOOLValue");
  v32 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ignoreHSTS"));
  if (v32)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v33 = -[NSURLRequest _inner](self, "_inner");
  v33[154] = objc_msgSend(v32, "BOOLValue");
  v34 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("schemeWasUpgradedDueToDynamicHSTS"));
  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v35 = -[NSURLRequest _inner](self, "_inner");
  v35[155] = objc_msgSend(v34, "BOOLValue");
  v36 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("payloadTransmissionTimeout"));
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v37 = -[NSURLRequest _inner](self, "_inner");
  objc_msgSend(v36, "doubleValue");
  v37[23] = v38;
  v39 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowedProtocolTypes"));
  if (v39)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v40 = -[NSURLRequest _inner](self, "_inner");
  v40[12] = objc_msgSend(v39, "integerValue");
  v41 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boundInterfaceIdentifier"));
  if (v41)
  {
    v42 = (__CFString *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    URLRequest::setBoundInterfaceIdentifier((URLRequest *)-[NSURLRequest _inner](self, "_inner"), v42);
  }
  else
  {
    v43 = -[NSURLRequest _inner](self, "_inner");
    v44 = (const void *)v43[14];
    if (v44)
    {
      CFRelease(v44);
      v43[14] = 0;
    }
  }
  v45 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowsExpensiveNetworkAccess"));
  if (v45)
  {
    v46 = (void *)v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    v47 = -[NSURLRequest _inner](self, "_inner");
    if (objc_msgSend(v46, "BOOLValue"))
      v48 = 1;
    else
      v48 = 2;
  }
  else
  {
    v47 = -[NSURLRequest _inner](self, "_inner");
    v48 = 0;
  }
  v47[52] = v48;
  v49 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowsConstrainedNetworkAccess"));
  if (v49)
  {
    v50 = (void *)v49;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    v51 = -[NSURLRequest _inner](self, "_inner");
    if (objc_msgSend(v50, "BOOLValue"))
      v52 = 1;
    else
      v52 = 2;
  }
  else
  {
    v51 = -[NSURLRequest _inner](self, "_inner");
    v52 = 0;
  }
  v51[53] = v52;
  v53 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowsUCA"));
  if (v53)
  {
    v54 = (void *)v53;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    v55 = -[NSURLRequest _inner](self, "_inner");
    if (objc_msgSend(v54, "BOOLValue"))
      v56 = 1;
    else
      v56 = 2;
  }
  else
  {
    v55 = -[NSURLRequest _inner](self, "_inner");
    v56 = 0;
  }
  v55[54] = v56;
  v57 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("assumesHTTP3Capable"));
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v58 = -[NSURLRequest _inner](self, "_inner");
  v58[156] = objc_msgSend(v57, "BOOLValue");
  v59 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attribution"));
  if (v59)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v60 = -[NSURLRequest _inner](self, "_inner");
  v60[22] = objc_msgSend(v59, "integerValue");
  v61 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("knownTracker"));
  if (v61)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v62 = -[NSURLRequest _inner](self, "_inner");
  v62[157] = objc_msgSend(v61, "BOOLValue");
  v63 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("trackerContext"));
  if (v63)
  {
    v64 = (__CFString *)v63;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    URLRequest::setTrackerContext((URLRequest *)-[NSURLRequest _inner](self, "_inner"), v64);
  }
  else
  {
    v65 = -[NSURLRequest _inner](self, "_inner");
    v66 = (const void *)v65[15];
    if (v66)
    {
      CFRelease(v66);
      v65[15] = 0;
    }
  }
  v67 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privacyProxyFailClosed"));
  if (v67)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v68 = -[NSURLRequest _inner](self, "_inner");
  v68[158] = objc_msgSend(v67, "BOOLValue");
  v69 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privacyProxyFailClosedForUnreachableNonMainHosts"));
  if (v69)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v70 = -[NSURLRequest _inner](self, "_inner");
  v70[159] = objc_msgSend(v69, "BOOLValue");
  v71 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privacyProxyFailClosedForUnreachableHosts"));
  if (v71)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v72 = -[NSURLRequest _inner](self, "_inner");
  v72[160] = objc_msgSend(v71, "BOOLValue");
  v73 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requiresDNSSECValidation"));
  if (v73)
  {
    v74 = (void *)v73;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[NSURLRequest _inner](self, "_inner");
      if (objc_msgSend(v74, "BOOLValue"))
        v76 = 1;
      else
        v76 = 2;
      goto LABEL_155;
    }
LABEL_44:

    return 0;
  }
  v75 = -[NSURLRequest _inner](self, "_inner");
  v76 = 0;
LABEL_155:
  v75[42] = v76;
  v77 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowsPersistentDNS"));
  if (v77)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v78 = -[NSURLRequest _inner](self, "_inner");
  v78[172] = objc_msgSend(v77, "BOOLValue");
  v79 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("prohibitPrivacyProxy"));
  if (v79)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v80 = -[NSURLRequest _inner](self, "_inner");
  v80[161] = objc_msgSend(v79, "BOOLValue");
  v81 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowPrivateAccessTokensForThirdParty"));
  if (v81)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v82 = -[NSURLRequest _inner](self, "_inner");
  v82[162] = objc_msgSend(v81, "BOOLValue");
  v83 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("useEnhancedPrivacyMode"));
  if (v83)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v84 = -[NSURLRequest _inner](self, "_inner");
  v84[163] = objc_msgSend(v83, "BOOLValue");
  v85 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("blockTrackers"));
  if (v85)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v86 = -[NSURLRequest _inner](self, "_inner");
  v86[164] = objc_msgSend(v85, "BOOLValue");
  v87 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("failInsecureLoadWithHTTPSDNSRecord"));
  if (v87)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v88 = -[NSURLRequest _inner](self, "_inner");
  v88[165] = objc_msgSend(v87, "BOOLValue");
  v89 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWebSearchContent"));
  if (v89)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
  }
  v90 = -[NSURLRequest _inner](self, "_inner");
  v90[166] = objc_msgSend(v89, "BOOLValue");
  v91 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("contentDispositionEncodingFallbackArray"));
  objc_opt_class();
  v109 = 0u;
  v110 = 0u;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v91 = 0;
  v111 = 0uLL;
  v112 = 0uLL;
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
  if (v92)
  {
    v93 = *(_QWORD *)v110;
    while (2)
    {
      for (i = 0; i != v92; ++i)
      {
        if (*(_QWORD *)v110 != v93)
          objc_enumerationMutation(v91);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v91 = 0;
          goto LABEL_181;
        }
      }
      v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
      if (v92)
        continue;
      break;
    }
  }
LABEL_181:
  v95 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, v91);
  HTTPNetStreamInfo::setRequestFragment((HTTPNetStreamInfo *)-[NSURLRequest _inner](self, "_inner"), v95);
  if (v95)
    CFRelease(v95);
  return self;
}

- (NSURLRequest)initWithHTTPPropertyList:(id)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const __CFAllocator *v16;
  size_t v17;
  const __CFURL *v18;
  CFHTTPMessageRef Request;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  NSURLRequest *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[2];
  void (*v30)(uint64_t);
  void *v31;
  CFHTTPMessageRef v32;
  _QWORD v33[2];
  void (*v34)(uint64_t);
  void *v35;
  const __CFURL *v36;
  _QWORD v37[2];
  void (*v38)(uint64_t);
  void *v39;
  void *v40;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("headerFields")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_34:

    return 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_34;
      v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_34;
      v11 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_34;
      if (objc_msgSend(v10, "hasPrefix:", CFSTR(":")))
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR(":method")) & 1) != 0)
        {
          v8 = (const __CFString *)v11;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR(":scheme")) & 1) != 0)
        {
          v7 = v11;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR(":authority")) & 1) != 0)
        {
          v26 = v11;
        }
        else
        {
          v12 = objc_msgSend(v10, "isEqualToString:", CFSTR(":path"));
          v13 = v27;
          if (v12)
            v13 = v11;
          v27 = v13;
        }
        if (++v6 < objc_msgSend(v5, "count"))
          continue;
      }
      goto LABEL_21;
    }
  }
  v8 = 0;
  v7 = 0;
  v26 = 0;
  v27 = 0;
  v6 = 0;
LABEL_21:
  if (!v8 || !v7 || !v26 || !v27)
    goto LABEL_34;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@%@"), v7, v26, v27);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v38 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke;
  v39 = &unk_1E14FE118;
  v40 = v14;
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v17 = strlen(v15);
  v18 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v15, v17, 0x8000100u, 0, 0);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_2;
  v35 = &__block_descriptor_40_e5_v8__0l;
  v36 = v18;
  Request = CFHTTPMessageCreateRequest(v16, v8, v18, CFSTR("HTTP/1.1"));
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
  HTTPMessage::ensureParserFinished((CFHTTPMessageRef)((char *)Request + 16));
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v30 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_3;
  v31 = &__block_descriptor_40_e5_v8__0l;
  v32 = Request;
  while (1)
  {
    if (v6 >= objc_msgSend(v5, "count"))
    {
      v25 = _constructRequestFromParts(Request, 0, 0, NSURLRequestUseProtocolCachePolicy, (double)(unint64_t)NSURLRequestTimeoutInterval, 0);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4;
      v28[3] = &__block_descriptor_40_e5_v8__0l;
      v28[4] = v25;
      v23 = -[NSURLRequest _initWithCFURLRequest:](self, "_initWithCFURLRequest:", v25);
      __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4((uint64_t)v28);
      goto LABEL_39;
    }
    v20 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v21 = (__CFString *)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("name"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v22 = (__CFString *)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("value"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (-[__CFString hasPrefix:](v21, "hasPrefix:", CFSTR(":")) & 1) != 0)
      break;
    _CFHTTPMessageAddHeaderFieldValue((uint64_t)Request, v21, v22);
    ++v6;
  }

  v23 = 0;
LABEL_39:
  v30((uint64_t)v29);
  v34((uint64_t)v33);
  v38((uint64_t)v37);
  return v23;
}

- (id)HTTPPropertyList
{
  uint64_t v2;
  __CFHTTPMessage *v3;
  id v4;
  uint64_t v5;
  CFStringRef v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFURL *v9;
  CFStringRef v10;
  char *v11;
  void *v12;
  _QWORD v14[4];
  uint64_t v15;
  _QWORD v16[5];
  CFTypeRef cf;
  CFTypeRef v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  CFStringRef v22;
  _QWORD v23[2];
  void (*v24)(uint64_t);
  void *v25;
  CFStringRef v26;
  _QWORD v27[2];
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2)
    v3 = (__CFHTTPMessage *)(v2 - 16);
  else
    v3 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke;
  v29 = &unk_1E14FE118;
  v30 = v4;
  v6 = CFHTTPMessageCopyRequestMethod(v3);
  v23[0] = v5;
  v23[1] = 3221225472;
  v24 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_2;
  v25 = &unk_1E14FE118;
  v26 = v6;
  v7 = CFSTR("GET");
  if (v6)
    v7 = v6;
  v39[0] = CFSTR("name");
  v39[1] = CFSTR("value");
  v40[0] = CFSTR(":method");
  v40[1] = v7;
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
  if (v2)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    if (*(_BYTE *)(v2 + 24))
      v8 = 0;
    else
      v8 = v2;
  }
  else
  {
    v8 = 0;
  }
  v9 = (const __CFURL *)HTTPRequestParserClient::requestURL((HTTPRequestParserClient *)(v8 + 128));
  v10 = CFURLCopyScheme(v9);
  v19[0] = v5;
  v19[1] = 3221225472;
  v20 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_3;
  v21 = &unk_1E14FE118;
  v22 = v10;
  if (v10)
  {
    v37[0] = CFSTR("name");
    v37[1] = CFSTR("value");
    v38[0] = CFSTR(":scheme");
    v38[1] = v10;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
  }
  HTTPUtilities::createAuthorityStringFromURL((HTTPUtilities *)&v18, v9);
  if (v18)
  {
    v35[0] = CFSTR("name");
    v35[1] = CFSTR("value");
    v36[0] = CFSTR(":authority");
    v36[1] = v18;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  }
  HTTPUtilities::createPathStringFromURL((HTTPUtilities *)&cf, v9);
  if (cf)
  {
    v33[0] = CFSTR("name");
    v33[1] = CFSTR("value");
    v34[0] = CFSTR(":path");
    v34[1] = cf;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
  }
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
  if (v2)
    v11 = (char *)v3 + 16;
  else
    v11 = 0;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_4;
  v16[3] = &unk_1E14FC1E8;
  v16[4] = v4;
  (*(void (**)(char *, _QWORD *))(*(_QWORD *)v11 + 56))(v11, v16);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5;
  v14[3] = &unk_1E14FE118;
  v15 = objc_msgSend(v4, "copy");
  v31 = CFSTR("headerFields");
  v32 = v15;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5((uint64_t)v14);
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);
  v20((uint64_t)v19);
  v24((uint64_t)v23);
  v28((uint64_t)v27);
  return v12;
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke(uint64_t a1)
{

}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_2(uint64_t a1)
{

}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_3(uint64_t a1)
{

}

uint64_t __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_4(uint64_t a1, HTTPUtilities *this, uint64_t a3)
{
  uint64_t result;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  result = HTTPUtilities::isHeaderAllowed(this, (const __CFString *)this);
  if ((_DWORD)result)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = CFSTR("name");
    v8[1] = CFSTR("value");
    v9[0] = this;
    v9[1] = a3;
    return objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  return result;
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5(uint64_t a1)
{

}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke(uint64_t a1)
{

}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (id)HTTPContentType
{
  return -[NSURLRequest valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
}

- (id)HTTPExtraCookies
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2)
  {
    v3 = *(void **)(v2 + 184);
    if (v3)
      v3 = (void *)CFRetain(v3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)HTTPReferrer
{
  return -[NSURLRequest valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", CFSTR("Referer"));
}

- (id)HTTPUserAgent
{
  return -[NSURLRequest valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
}

- (BOOL)HTTPShouldUsePipelining
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  BOOL result;
  uint8_t v6[16];

  v2 = *(_QWORD *)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (!v2 || !*(_BYTE *)(v2 + 216))
    return 0;
  v3 = *(const __CFString **)(v2 + 152);
  result = v3
        && (CFStringCompare(v3, (CFStringRef)&gConstantCFStringValueTable[2590], 0) == kCFCompareEqualTo
         || ((v4 = *(const __CFString **)(v2 + 152)) != 0
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
          && (*(_WORD *)v6 = 0,
              _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "these should always be initialized now", v6, 2u), (v4 = *(const __CFString **)(v2 + 152)) != 0))&& CFStringCompare(v4, (CFStringRef)&gConstantCFStringValueTable[2597], 0) == kCFCompareEqualTo)|| *(_BYTE *)(v2 + 218) != 0;
  return result;
}

- (unint64_t)expectedWorkload
{
  return 0;
}

+ (void)setAllowsSpecificHTTPSCertificate:(id)a3 forHost:(id)a4
{
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[16];

  if (a4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__NSURLRequest_NSHTTPURLRequest__setAllowsSpecificHTTPSCertificate_forHost___block_invoke;
    v5[3] = &unk_1E14FC1C0;
    v5[4] = a4;
    v5[5] = a3;
    withHostsSPILocked((uint64_t)v5);
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to setAllowsSpecificHTTPSCertificate:forHost:", buf, 2u);
    }
  }
}

uint64_t __76__NSURLRequest_NSHTTPURLRequest__setAllowsSpecificHTTPSCertificate_forHost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    return objc_msgSend(a3, "removeObjectForKey:", v5);
  v7 = (void *)objc_msgSend(a3, "objectForKey:", v5);
  if (v7)
    v6 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  return objc_msgSend(a3, "setObject:forKey:", v6, v5);
}

@end

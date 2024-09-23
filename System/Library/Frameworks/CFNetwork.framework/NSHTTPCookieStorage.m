@implementation NSHTTPCookieStorage

- (NSArray)cookiesForURL:(NSURL *)URL
{
  unsigned int v5;
  NSObject *v6;
  OpaqueCFHTTPCookieStorage *v7;
  OpaqueCFHTTPCookieStorage *v8;
  const __CFArray *v9;
  NSArray *v10;
  uint8_t v12[16];

  if (URL)
  {
    v5 = -[NSString isEqualToString:](-[NSURL scheme](URL, "scheme"), "isEqualToString:", 0x1EDD00AE0)
      || -[NSString isEqualToString:](-[NSURL scheme](URL, "scheme"), "isEqualToString:", 0x1EDD00BF8);
    v7 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v7)
    {
      v8 = v7;
      CFRetain(v7);
      v9 = CFHTTPCookieStorageCopyCookiesForURL(v8, URL, v5);
      CFRelease(v8);
      if (v9)
      {
        v10 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v9);
        CFRelease(v9);
        return v10;
      }
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v6 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_183ECA000, v6, OS_LOG_TYPE_ERROR, "cookiesForURL called with a nil url", v12, 2u);
    }
  }
  return 0;
}

- (void)setCookie:(NSHTTPCookie *)cookie
{
  OpaqueCFHTTPCookieStorage *v4;
  OpaqueCFHTTPCookieStorage *v5;

  if (cookie)
  {
    v4 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v4)
    {
      v5 = v4;
      CFRetain(v4);
      CFHTTPCookieStorageSetCookie(v5, -[NSHTTPCookie _GetInternalCFHTTPCookie](cookie, "_GetInternalCFHTTPCookie"));
      CFRelease(v5);
    }
  }
}

- (OpaqueCFHTTPCookieStorage)_cookieStorage
{
  NSHTTPCookieStorageInternal *internal;
  uint64_t v3;

  internal = self->_internal;
  if (!internal)
    return 0;
  v3 = 16;
  if (!internal->privateBrowsing)
    v3 = 8;
  return *(OpaqueCFHTTPCookieStorage **)((char *)&internal->super.isa + v3);
}

+ (NSHTTPCookieStorage)sharedHTTPCookieStorage
{
  NSHTTPCookieStorage *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedCookieStorageLock);
  v2 = (NSHTTPCookieStorage *)sSharedInstance;
  if (!sSharedInstance)
  {
    if (+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce != -1)
      dispatch_once(&+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce, &__block_literal_global_28_15047);
    v2 = (NSHTTPCookieStorage *)sSharedInstance;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedCookieStorageLock);
  return v2;
}

- (BOOL)_overrideSessionCookieAcceptPolicy
{
  return self->__overrideSessionCookieAcceptPolicy;
}

- (void)_setSubscribedDomainsForCookieChanges:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  OpaqueCFHTTPCookieStorage *v14;
  OpaqueCFHTTPCookieStorage *v15;
  os_unfair_lock_s *v16;
  const void *v17;
  const void *v18;
  CFTypeRef v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, (uint64_t)v10, v5, (uint64_t)v10);
        -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, objc_msgSend(CFSTR("."), "stringByAppendingString:", v10), v5, (uint64_t)v10);
        if (objc_msgSend(v10, "length"))
        {
          v11 = 0;
          do
          {
            if (objc_msgSend(v10, "characterAtIndex:", v11) == 46)
            {
              v12 = (const __CFString *)objc_msgSend(v10, "substringFromIndex:", v11);
              if (isTopLevelDomain(v12, 1))
                break;
              -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, (uint64_t)v12, v5, (uint64_t)v10);
            }
            ++v11;
          }
          while (v11 < objc_msgSend(v10, "length"));
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  v13 = objc_msgSend(v5, "count");
  v14 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v14)
  {
    v15 = v14;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v16 = (os_unfair_lock_s *)((char *)v15 + 16);
  }
  else
  {
    v16 = 0;
  }
  if (v13)
    v17 = v5;
  else
    v17 = 0;
  os_unfair_lock_lock(v16 + 30);
  v18 = *(const void **)&v16[20]._os_unfair_lock_opaque;
  if (v18)
    CFRelease(v18);
  if (v17)
    v19 = CFRetain(v17);
  else
    v19 = 0;
  *(_QWORD *)&v16[20]._os_unfair_lock_opaque = v19;
  os_unfair_lock_unlock(v16 + 30);
}

- (uint64_t)_addDomain:(void *)a3 toSubScriberDictionary:(uint64_t)a4 forSubscriber:
{
  void *v7;
  void *v8;

  if (result)
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", a2);
    if (v7)
    {
      return objc_msgSend(v7, "addObject:", a4);
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v8, "addObject:", a4);
      return objc_msgSend(a3, "setObject:forKeyedSubscript:", v8, a2);
    }
  }
  return result;
}

- (NSArray)cookies
{
  NSArray *result;
  char *v3;
  __CFArray *v4;
  NSArray *v5;

  result = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (result)
  {
    v3 = (char *)result;
    CFRetain(result);
    v4 = CFHTTPCookieStorageCopyCookies(v3);
    v5 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v4);
    CFRelease(v4);
    CFRelease(v3);
    return v5;
  }
  return result;
}

- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  NSHTTPCookieStorage *v4;
  NSHTTPCookieStorageInternal *v5;
  NSHTTPCookieStorage *v6;
  NSHTTPCookieStorageInternal *v7;
  OpaqueCFHTTPCookieStorage *v8;
  const __CFAllocator *v9;
  OpaqueCFHTTPCookieStorage *v10;
  objc_super v12;
  objc_super v13;

  v12.receiver = self;
  v12.super_class = (Class)NSHTTPCookieStorage;
  v4 = -[NSHTTPCookieStorage init](&v12, sel_init);
  if (v4)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1)
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
    if (newCookieStorageEnabled(void)::enabled)
    {

      return +[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorageToCookie2Storage, "sharedHTTPCookieStorage");
    }
    else
    {
      v5 = [NSHTTPCookieStorageInternal alloc];
      if (v5)
      {
        v13.receiver = v5;
        v13.super_class = (Class)NSHTTPCookieStorageInternal;
        v6 = -[NSHTTPCookieStorage init](&v13, sel_init);
        v7 = (NSHTTPCookieStorageInternal *)v6;
        if (v6)
        {
          v6->_internal = (NSHTTPCookieStorageInternal *)a3;
          if (a3)
          {
            CFRetain(a3);
            v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          }
          else
          {
            NSLog(CFSTR("Cannot get default cookie store - using a memory store for this process"));
            v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v7->storage = (OpaqueCFHTTPCookieStorage *)_CookieStorageCreateInMemory((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v10);
          }
          v7->privateStorage = (OpaqueCFHTTPCookieStorage *)_CookieStorageCreateInMemory(v9, v8);
          v7->dataLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
          v7->privateBrowsing = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      v4->_internal = v7;
    }
  }
  return v4;
}

NSHTTPCookieStorageToCookie2Storage *__46__NSHTTPCookieStorage_sharedHTTPCookieStorage__block_invoke()
{
  NSObject *v0;
  NSHTTPCookieStorageToCookie2Storage *result;
  NSHTTPCookieStorageToCookie2Storage *v2;
  uint8_t v3[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v0 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEFAULT, "Initializing NSHTTPCookieStorage singleton", v3, 2u);
  }
  if (newCookieStorageEnabled(void)::onceToken != -1)
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
  if (newCookieStorageEnabled(void)::enabled)
  {
    result = objc_alloc_init(NSHTTPCookieStorageToCookie2Storage);
    sSharedInstance = (uint64_t)result;
  }
  else
  {
    result = -[NSHTTPCookieStorage _initWithCFHTTPCookieStorage:]([NSHTTPCookieStorage alloc], "_initWithCFHTTPCookieStorage:", _CFHTTPCookieStorageGetDefault());
    sSharedInstance = (uint64_t)result;
    if (result)
    {
      v2 = result;
      result = (NSHTTPCookieStorageToCookie2Storage *)result->super._internal;
      if (result)
        return (NSHTTPCookieStorageToCookie2Storage *)-[NSHTTPCookieStorageToCookie2Storage registerForPostingNotificationsWithContext:](result, "registerForPostingNotificationsWithContext:", v2);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieStorage;
  -[NSHTTPCookieStorage dealloc](&v3, sel_dealloc);
}

- (id)_getCookiesForDomain:(id)a3
{
  OpaqueCFHTTPCookieStorage *v4;
  OpaqueCFHTTPCookieStorage *v5;
  char *v6;
  __CFArray *v7;
  const __CFString *v8;
  _QWORD *v9;
  const CompactCookieArray *v10;
  uint64_t v11;
  const char *v12;
  CookieUtils *v13;
  char *v14;
  _QWORD *v15;
  const CompactCookieArray *v16;
  char *v17;
  _QWORD *v18;
  const CompactCookieArray *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  const CompactCookieArray *v25;
  _QWORD v26[2];
  void (*v27)(uint64_t);
  void *v28;
  const CompactCookieArray *v29;
  _QWORD v30[3];
  _BYTE v31[256];
  void *v32;
  _QWORD v33[3];
  _BYTE v34[256];
  void *v35;
  _QWORD v36[3];
  uint64_t v37;
  void *v38;
  _QWORD v39[3];
  uint64_t v40;
  void *v41;
  void (**v42)(CookieHostName *__hidden);
  char *v43;
  uint64_t v44;
  _BYTE v45[256];
  void *v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v4)
  {
    v5 = v4;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v6 = (char *)v5 + 16;
  }
  else
  {
    v6 = 0;
  }
  v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  CFGetAllocator(v6 - 16);
  v46 = v45;
  v45[0] = 0;
  v44 = 0;
  v42 = &off_1E14E6B50;
  v43 = v45;
  v47 = 0;
  CookieHostName::initializeFromString((CookieHostName *)&v42, (__CFString *)a3, v8);
  if (v44)
  {
    v39[0] = &off_1E14E9488;
    DomainAndPartition::init(v39, 0, 0, v43 + 1);
    v9 = (_QWORD *)*((_QWORD *)v6 + 2);
    DomainAndPartition::DomainAndPartition((uint64_t)v36, (uint64_t)v39);
    v10 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v9, (uint64_t)v36, 1);
    v36[0] = &off_1E14E9488;
    if (v38 && v38 != &v37)
      free(v38);
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v27 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke;
    v28 = &__block_descriptor_40_e5_v8__0l;
    v29 = v10;
    appendCompactCookieArray(v10, v7);
    if (v44)
      v13 = (CookieUtils *)(v43 + 1);
    else
      v13 = 0;
    if (CookieUtils::looksLikeIPAddress(v13, v12))
    {
      if (v44)
        v14 = v43;
      else
        v14 = 0;
      v33[0] = &off_1E14E9488;
      DomainAndPartition::init(v33, 0, 0, v14);
      v15 = (_QWORD *)*((_QWORD *)v6 + 2);
      DomainAndPartition::DomainAndPartition((uint64_t)v30, (uint64_t)v33);
      v16 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v15, (uint64_t)v30, 1);
      v30[0] = &off_1E14E9488;
      if (v32 && v32 != v31)
        free(v32);
      v21 = v11;
      v22 = 3221225472;
      v23 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_3;
      v24 = &__block_descriptor_40_e5_v8__0l;
      v25 = v16;
      appendCompactCookieArray(v16, v7);
      ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_3((uint64_t)&v21);
      v33[0] = &off_1E14E9488;
      if (v35 && v35 != v34)
        free(v35);
    }
    else
    {
      do
      {
        if (v44)
          v17 = v43;
        else
          v17 = 0;
        v33[0] = &off_1E14E9488;
        DomainAndPartition::init(v33, 0, 0, v17);
        v18 = (_QWORD *)*((_QWORD *)v6 + 2);
        DomainAndPartition::DomainAndPartition((uint64_t)v30, (uint64_t)v33);
        v19 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v18, (uint64_t)v30, 1);
        v30[0] = &off_1E14E9488;
        if (v32 && v32 != v31)
          free(v32);
        v21 = v11;
        v22 = 3221225472;
        v23 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_2;
        v24 = &__block_descriptor_40_e5_v8__0l;
        v25 = v19;
        appendCompactCookieArray(v19, v7);
        v23((uint64_t)&v21);
        v33[0] = &off_1E14E9488;
        if (v35 && v35 != v34)
          free(v35);
      }
      while (CookieHostName::trimFirstComponent((CookieHostName *)&v42));
    }
    v27((uint64_t)v26);
    v39[0] = &off_1E14E9488;
    if (v41 && v41 != &v40)
      free(v41);
  }
  if (!CFArrayGetCount(v7) && v7)
  {
    CFRelease(v7);
    v7 = 0;
  }
  v42 = &off_1E14E6B50;
  if (v46 != v45)
    free(v46);
  return v7;
}

- (void)set_overrideSessionCookieAcceptPolicy:(BOOL)a3
{
  self->__overrideSessionCookieAcceptPolicy = a3;
}

- (void)setCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)cookieAcceptPolicy
{
  OpaqueCFHTTPCookieStorage *v4;
  char *v5;

  v4 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v4)
  {
    v5 = (char *)v4;
    CFRetain(v4);
    if (cookieAcceptPolicy <= (NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain|NSHTTPCookieAcceptPolicyNever))
      CFHTTPCookieStorageSetCookieAcceptPolicy(v5, cookieAcceptPolicy);
    CFRelease(v5);
  }
}

- (NSHTTPCookieStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieStorage;
  return -[NSHTTPCookieStorage init](&v3, sel_init);
}

- (NSHTTPCookieAcceptPolicy)cookieAcceptPolicy
{
  OpaqueCFHTTPCookieStorage *v2;
  uint64_t v3;

  v2 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (!v2)
    return 2;
  v3 = CFHTTPCookieStorageGetCookieAcceptPolicy((char *)v2) - 1;
  if (v3 <= 2)
    return v3 + 1;
  else
    return 0;
}

- (void)_setCookiesRemovedHandler:(id)a3 onQueue:(id)a4
{
  OpaqueCFHTTPCookieStorage *v6;
  OpaqueCFHTTPCookieStorage *v7;
  char *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;

  v6 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v6)
  {
    v7 = v6;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v8 = (char *)v7 + 16;
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 30);
  v9 = (const void *)*((_QWORD *)v8 + 14);
  if (v9)
  {
    _Block_release(v9);
    *((_QWORD *)v8 + 14) = 0;
  }
  v10 = *((_QWORD *)v8 + 12);
  if (v10)
  {
    dispatch_release(v10);
    *((_QWORD *)v8 + 12) = 0;
  }
  if (a3)
  {
    *((_QWORD *)v8 + 14) = _Block_copy(a3);
    if (!a4)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      a4 = dispatch_queue_create("cookies_deleted_handler_queue_default", v11);
LABEL_15:
      *((_QWORD *)v8 + 12) = a4;
      goto LABEL_16;
    }
LABEL_14:
    dispatch_retain((dispatch_object_t)a4);
    goto LABEL_15;
  }
  if (a4)
    goto LABEL_14;
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 30);
}

- (void)_setCookiesChangedHandler:(id)a3 onQueue:(id)a4
{
  OpaqueCFHTTPCookieStorage *v6;
  OpaqueCFHTTPCookieStorage *v7;
  char *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;

  v6 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v6)
  {
    v7 = v6;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v8 = (char *)v7 + 16;
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 30);
  v9 = (const void *)*((_QWORD *)v8 + 13);
  if (v9)
  {
    _Block_release(v9);
    *((_QWORD *)v8 + 13) = 0;
  }
  v10 = *((_QWORD *)v8 + 11);
  if (v10)
  {
    dispatch_release(v10);
    *((_QWORD *)v8 + 11) = 0;
  }
  if (a3)
  {
    *((_QWORD *)v8 + 13) = _Block_copy(a3);
    if (!a4)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      a4 = dispatch_queue_create("cookies_added_handler_queue_default", v11);
LABEL_15:
      *((_QWORD *)v8 + 11) = a4;
      goto LABEL_16;
    }
LABEL_14:
    dispatch_retain((dispatch_object_t)a4);
    goto LABEL_15;
  }
  if (a4)
    goto LABEL_14;
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 30);
}

- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6
{
  __CFArray *v10;
  const __CFArray *v11;
  OpaqueCFHTTPCookieStorage *v12;
  OpaqueCFHTTPCookieStorage *v13;
  const __CFBoolean *Value;
  int v15;
  PrivateHTTPCookieStorage *v16;
  int CookieAcceptPolicy;
  _BYTE v18[104];

  v10 = +[NSHTTPCookie _ns2cfCookies:](NSHTTPCookie, "_ns2cfCookies:", a3);
  if (v10)
  {
    v11 = v10;
    v12 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v12)
    {
      v13 = v12;
      if (newCookieStorageEnabled(void)::onceToken != -1)
        dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
      if (newCookieStorageEnabled(void)::enabled)
      {
        -[OpaqueCFHTTPCookieStorage _setCookies:forURL:mainDocumentURL:policyProperties:](v13, "_setCookies:forURL:mainDocumentURL:policyProperties:", v11, a4, a5, a6);
      }
      else
      {
        if (a6
          && (Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a6, CFSTR("_kCFHTTPCookiePolicyPropertyAllowHTTPOnlyOverwrite"))) != 0)
        {
          if (CFBooleanGetValue(Value))
            v15 = 1;
          else
            v15 = 2;
        }
        else
        {
          v15 = 2;
        }
        if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
          dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
        v16 = (PrivateHTTPCookieStorage *)*((_QWORD *)v13 + 4);
        if (v16)
          CookieAcceptPolicy = PrivateHTTPCookieStorage::getCookieAcceptPolicy(v16);
        else
          CookieAcceptPolicy = 2;
        HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v18, a4, a5, 0, CookieAcceptPolicy, v15, (const __CFDictionary *)a6);
        if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
          dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
        HTTPCookieStorage::setCookiesWithPolicy((HTTPCookieStorage *)((char *)v13 + 16), v11, (const HTTPCookieStoragePolicy *)v18);
        HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v18);
      }
    }
    CFRelease(v11);
  }
}

- (void)_saveCookies:(id)a3
{
  NSHTTPCookieStorageInternal *internal;
  OpaqueCFHTTPCookieStorage *storage;

  internal = self->_internal;
  if (internal)
  {
    storage = internal->storage;
    if (storage)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
      HTTPCookieStorage::syncStorageWithCompletion((uint64_t)storage + 16, 1, (uint64_t)a3);
    }
  }
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7
{
  OpaqueCFHTTPCookieStorage *v12;
  OpaqueCFHTTPCookieStorage *v13;
  uint64_t v14;
  id v15;
  CFMutableArrayRef v16;
  _BYTE v17[104];

  v12 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00AE0) & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00BF8);
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v17, a3, a4, (uint64_t)a5, 0, 0, (const __CFDictionary *)a6);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v16 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)((char *)v13 + 16), (const HTTPCookieStoragePolicy *)v17, (const __CFURL *)v14);
    v15 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v16);
    if (v16)
      CFRelease(v16);
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v17);
  }
  else
  {
    v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  (*((void (**)(id, id))a7 + 2))(a7, v15);
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  _BOOL4 v4;
  NSHTTPCookieStorage *v6;
  NSHTTPCookieStorageInternal *v7;
  NSHTTPCookieStorage *v8;
  const __CFAllocator *v9;
  _QWORD *v10;
  __CFDictionary *MutableDictionary;
  OpaqueCFHTTPCookieStorage *v12;
  objc_super v14;
  objc_super v15;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSHTTPCookieStorage;
  v6 = -[NSHTTPCookieStorage init](&v14, sel_init);
  if (v6)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1)
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
    if (newCookieStorageEnabled(void)::enabled)
    {

      return +[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorageToCookie2Storage, "sharedHTTPCookieStorage");
    }
    else
    {
      v7 = [NSHTTPCookieStorageInternal alloc];
      if (v7)
      {
        v15.receiver = v7;
        v15.super_class = (Class)NSHTTPCookieStorageInternal;
        v8 = -[NSHTTPCookieStorage init](&v15, sel_init);
        if (v8)
        {
          v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
          if (v4)
            v10 = (_QWORD *)MEMORY[0x1E0C9AE40];
          MutableDictionary = cfTypeCreateMutableDictionary(v9, CFSTR("ident"), a3, CFSTR("persistent"), *v10, 0, 0);
          v8->_internal = (NSHTTPCookieStorageInternal *)_CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v9, MutableDictionary, 1);
          CFRelease(MutableDictionary);
          *(_QWORD *)&v8->__overrideSessionCookieAcceptPolicy = _CookieStorageCreateInMemory(v9, v12);
          v8[1].super.isa = (Class)objc_alloc_init(MEMORY[0x1E0CB38E0]);
          LOBYTE(v8[1]._internal) = 0;
        }
      }
      else
      {
        v8 = 0;
      }
      v6->_internal = (NSHTTPCookieStorageInternal *)v8;
    }
  }
  return v6;
}

- (void)_setPrivateBrowsingEnabled:(BOOL)a3
{
  NSHTTPCookieStorageInternal *internal;
  _BOOL4 v4;
  NSHTTPCookieStorageInternal *v6;

  internal = self->_internal;
  if (internal)
  {
    v4 = a3;
    -[NSRecursiveLock lock](internal->dataLock, "lock");
    v6 = self->_internal;
    if (v6->privateBrowsing != v4)
    {
      v6->privateBrowsing = v4;
      v6 = self->_internal;
      if (!v4)
      {
        CFHTTPCookieStorageDeleteAllCookies((char *)v6->privateStorage);
        v6 = self->_internal;
      }
    }
    -[NSRecursiveLock unlock](v6->dataLock, "unlock");
  }
}

- (void)_saveCookies
{
  -[NSHTTPCookieStorageInternal _syncCookies](self->_internal, "_syncCookies");
}

- (void)deleteCookie:(NSHTTPCookie *)cookie
{
  OpaqueCFHTTPCookieStorage *v4;
  char *v5;

  if (cookie)
  {
    v4 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v4)
    {
      v5 = (char *)v4;
      CFRetain(v4);
      CFHTTPCookieStorageDeleteCookie(v5, -[NSHTTPCookie _GetInternalCFHTTPCookie](cookie, "_GetInternalCFHTTPCookie"));
      CFRelease(v5);
    }
  }
}

- (void)removeCookiesSinceDate:(NSDate *)date
{
  OpaqueCFHTTPCookieStorage *v4;
  OpaqueCFHTTPCookieStorage *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (date)
  {
    v4 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v4)
    {
      v5 = v4;
      CFRetain(v4);
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = ___ZN17HTTPCookieStorage22deleteCookiesSinceDateEPK8__CFDate_block_invoke;
      v8[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
      v8[4] = (char *)v5 + 16;
      v6 = (_QWORD *)*((_QWORD *)v5 + 4);
      v7 = v6[4];
      if (v7)
        pthread_mutex_lock((pthread_mutex_t *)(v7 + 8));
      (*(void (**)(_QWORD *, NSDate *, _QWORD *))(*v6 + 144))(v6, date, v8);
      if (v7)
        pthread_mutex_unlock((pthread_mutex_t *)(v7 + 8));
      HTTPCookieStorage::notifyObserversOfChanges((HTTPCookieStorage *)((char *)v5 + 16));
      CFRelease(v5);
    }
  }
}

- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4
{
  uint64_t v7;
  OpaqueCFHTTPCookieStorage *v8;
  OpaqueCFHTTPCookieStorage *v9;
  CFMutableArrayRef v10;
  id v11;

  if ((objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00AE0) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00BF8);
  v8 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (!v8)
    return 0;
  v9 = v8;
  CFRetain(v8);
  v10 = _CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL(v9, a3, a4, (const __CFURL *)v7);
  CFRelease(v9);
  if (!v10)
    return 0;
  v11 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v10);
  CFRelease(v10);
  return v11;
}

- (void)setCookies:(NSArray *)cookies forURL:(NSURL *)URL mainDocumentURL:(NSURL *)mainDocumentURL
{
  __CFArray *v8;
  const __CFArray *v9;
  OpaqueCFHTTPCookieStorage *v10;

  v8 = +[NSHTTPCookie _ns2cfCookies:](NSHTTPCookie, "_ns2cfCookies:", cookies);
  if (v8)
  {
    v9 = v8;
    v10 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v10)
      CFHTTPCookieStorageSetCookies(v10, v9, URL, mainDocumentURL);
    CFRelease(v9);
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSHTTPCookieStorage cookies count:%ld>"), -[NSArray count](-[NSHTTPCookieStorage cookies](self, "cookies"), "count"));
}

- (NSArray)sortedCookiesUsingDescriptors:(NSArray *)sortOrder
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  OpaqueCFHTTPCookieStorage *v14;
  OpaqueCFHTTPCookieStorage *v15;
  __CFArray *v16;
  __CFArray *v17;
  NSArray *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v3 = sortOrder;
  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](sortOrder, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  obj = v3;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v35;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "comparator") || (char *)objc_msgSend(v11, "selector") != sel_compare_)
          {
            v7 = 1;
            goto LABEL_12;
          }
          v12 = objc_msgSend(v11, "key");
          if ((objc_msgSend(v11, "ascending") & 1) != 0)
            v11 = (void *)v12;
          else
            v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v12, MEMORY[0x1E0C9AAA0], 0);
          v3 = obj;
        }
        else
        {
          v8 = 1;
        }
        objc_msgSend(v4, "addObject:", v11);
LABEL_12:
        ++v10;
      }
      while (v6 != v10);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      v6 = v13;
      if (!v13)
        goto LABEL_21;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_21:
  v14 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (!v14)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v15 = v14;
  if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
    dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
  v16 = HTTPCookieStorage::copyCookiesMatching((HTTPCookieStorage *)((char *)v15 + 16), 0, 32, (const __CFArray *)v4);
  if (!v16)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v17 = v16;
  v18 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", CFArrayGetCount(v16));
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __53__NSHTTPCookieStorage_sortedCookiesUsingDescriptors___block_invoke;
  v33[3] = &unk_1E14FCC90;
  v33[4] = v18;
  -[__CFArray enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v33);
  CFRelease(v17);
  if ((v7 & 1) != 0)
  {
    if ((v8 & 1) != 0)
    {
      v19 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v3, "count"));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v24 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v24, 1);
            -[NSArray addObject:](v19, "addObject:", v24);
          }
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v21);
      }
      v3 = v19;
    }
    return -[NSArray sortedArrayUsingDescriptors:](v18, "sortedArrayUsingDescriptors:", v3);
  }
  return v18;
}

- (void)storeCookies:(NSArray *)cookies forTask:(NSURLSessionTask *)task
{
  __CFArray *v6;
  __CFArray *v7;
  OpaqueCFHTTPCookieStorage *v8;
  const __CFDictionary *v9;
  NSURL *v10;
  NSURL *v11;
  NSString *v12;
  PrivateHTTPCookieStorage *v13;
  int CookieAcceptPolicy;
  HTTPCookieStorage *v15;
  _BYTE v16[104];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = +[NSHTTPCookie _ns2cfCookies:](NSHTTPCookie, "_ns2cfCookies:", cookies);
  if (v6)
  {
    v7 = v6;
    v8 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (-[NSURLSessionTask _siteForCookies](task, "_siteForCookies"))
    {
      v17[0] = CFSTR("_kCFHTTPCookiePolicyPropertySiteForCookies");
      v18[0] = -[NSURLSessionTask _siteForCookies](task, "_siteForCookies");
      v17[1] = CFSTR("_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation");
      v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLSessionTask _isTopLevelNavigation](task, "_isTopLevelNavigation"));
      v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      v9 = 0;
      if (!v8)
      {
LABEL_14:
        CFRelease(v7);
        return;
      }
    }
    v10 = -[NSURLRequest URL](-[NSURLSessionTask currentRequest](task, "currentRequest"), "URL");
    v11 = -[NSURLRequest mainDocumentURL](-[NSURLSessionTask originalRequest](task, "originalRequest"), "mainDocumentURL");
    v12 = -[NSURLSessionTask _storagePartitionIdentifier](task, "_storagePartitionIdentifier");
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v13 = (PrivateHTTPCookieStorage *)*((_QWORD *)v8 + 4);
    if (v13)
      CookieAcceptPolicy = PrivateHTTPCookieStorage::getCookieAcceptPolicy(v13);
    else
      CookieAcceptPolicy = 2;
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v16, v10, v11, (uint64_t)v12, CookieAcceptPolicy, 2, v9);
    v15 = (HTTPCookieStorage *)((char *)v8 + 16);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    HTTPCookieStorage::setCookiesWithPolicy(v15, v7, (const HTTPCookieStoragePolicy *)v16);
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v16);
    goto LABEL_14;
  }
}

- (void)getCookiesForTask:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  NSURL *v7;
  NSURL *v8;
  OpaqueCFHTTPCookieStorage *v9;
  char *v10;
  uint64_t v11;
  char v12;
  NSURL *v13;
  NSArray *v14;
  const __CFDictionary *v15;
  int CookieAcceptPolicy;
  NSHTTPCookieStorage *v17;
  CFMutableArrayRef v18;
  NSArray *v19;
  _BYTE v20[104];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = -[NSURLSessionTask currentRequest_URL](task, "currentRequest_URL");
  v8 = -[NSURLRequest mainDocumentURL](-[NSURLSessionTask originalRequest](task, "originalRequest"), "mainDocumentURL");
  v9 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v9)
  {
    v10 = (char *)v9;
    v11 = -[NSString isEqualToString:](-[NSURL scheme](v7, "scheme"), "isEqualToString:", 0x1EDD00AE0)
       || -[NSString isEqualToString:](-[NSURL scheme](v7, "scheme"), "isEqualToString:", 0x1EDD00BF8);
    if (-[NSURLSessionTask _siteForCookies](task, "_siteForCookies"))
    {
      v21[0] = CFSTR("_kCFHTTPCookiePolicyPropertySiteForCookies");
      v22[0] = -[NSURLSessionTask _siteForCookies](task, "_siteForCookies");
      v21[1] = CFSTR("_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation");
      v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLSessionTask _isTopLevelNavigation](task, "_isTopLevelNavigation"));
      v21[2] = CFSTR("_kCFHTTPCookiePolicyPropertyIsSafeRequest");
      v22[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLRequest _isIdempotent](-[NSURLSessionTask currentRequest](task, "currentRequest"), "_isIdempotent"));
      v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    }
    else
    {
      v15 = 0;
    }
    CookieAcceptPolicy = -[NSURLSessionTask _cookieAcceptPolicy](task, "_cookieAcceptPolicy");
    v17 = -[NSURLSessionConfiguration HTTPCookieStorage](-[NSURLSessionTask _effectiveConfiguration](task, "_effectiveConfiguration"), "HTTPCookieStorage");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[NSHTTPCookieStorage _overrideSessionCookieAcceptPolicy](v17, "_overrideSessionCookieAcceptPolicy"))
    {
      CookieAcceptPolicy = CFHTTPCookieStorageGetCookieAcceptPolicy(v10);
    }
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v20, v7, v8, (uint64_t)-[NSURLSessionTask _storagePartitionIdentifier](task, "_storagePartitionIdentifier"), CookieAcceptPolicy, 0, v15);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v18 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)(v10 + 16), (const HTTPCookieStoragePolicy *)v20, (const __CFURL *)v11);
    v19 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v18);
    if (v18)
      CFRelease(v18);
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v20);
  }
  else
  {
    v12 = objc_opt_respondsToSelector();
    v13 = -[NSURLRequest URL](-[NSURLSessionTask currentRequest](task, "currentRequest"), "URL");
    if ((v12 & 1) != 0)
      v14 = -[NSHTTPCookieStorage _cookiesForURL:mainDocumentURL:](self, "_cookiesForURL:mainDocumentURL:", v13, -[NSURLRequest mainDocumentURL](-[NSURLSessionTask originalRequest](task, "originalRequest"), "mainDocumentURL"));
    else
      v14 = -[NSHTTPCookieStorage cookiesForURL:](self, "cookiesForURL:", v13);
    v19 = v14;
  }
  (*((void (**)(void *, NSArray *))completionHandler + 2))(completionHandler, v19);
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6
{
  OpaqueCFHTTPCookieStorage *v10;
  OpaqueCFHTTPCookieStorage *v11;
  uint64_t v12;
  id v13;
  CFMutableArrayRef v14;
  _BYTE v15[104];

  v10 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v10)
  {
    v11 = v10;
    if ((objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00AE0) & 1) != 0)
      v12 = 1;
    else
      v12 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EDD00BF8);
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v15, a3, a4, (uint64_t)a5, 0, 0, 0);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v14 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)((char *)v11 + 16), (const HTTPCookieStoragePolicy *)v15, (const __CFURL *)v12);
    v13 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v14);
    if (v14)
      CFRelease(v14);
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v15);
  }
  else
  {
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  (*((void (**)(id, id))a6 + 2))(a6, v13);
}

- (void)_getCookieStoragePartitionsCompletionHandler:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[NSHTTPCookieStorage cookies](self, "cookies");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "_storagePartition");
        if (v10)
          objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(v5, "allObjects"));
}

- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4
{
  OpaqueCFHTTPCookieStorage *v6;
  OpaqueCFHTTPCookieStorage *v7;
  const __CFDictionary *v8;
  __CFArray *v9;
  id v10;
  void *values;

  values = a3;
  v6 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  if (v6)
  {
    v7 = v6;
    if (!a3)
      values = &stru_1E1500C68;
    v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kCFHTTPCookieStoragePartition, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    v9 = HTTPCookieStorage::copyCookiesMatching((HTTPCookieStorage *)((char *)v7 + 16), v8, 11, 0);
    if (v8)
      CFRelease(v8);
    v10 = +[NSHTTPCookie _cf2nsCookies:](NSHTTPCookie, "_cf2nsCookies:", v9);
    if (v9)
      CFRelease(v9);
  }
  else
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  (*((void (**)(id, id))a4 + 2))(a4, v10);
}

- (void)_testingOfStoringOfCookie:(id)a3
{
  const void *v5;
  OpaqueCFHTTPCookieStorage *v6;
  HTTPCookieStorage *v7;
  _BYTE v8[104];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (const void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@%@"), objc_msgSend(a3, "domain"), objc_msgSend(a3, "path")));
  v6 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
  HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v8, v5, v5, 0, 0, 1, 0);
  if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
    dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
  if (v6)
    v7 = (HTTPCookieStorage *)((char *)v6 + 16);
  else
    v7 = 0;
  v9[0] = objc_msgSend(a3, "_CFHTTPCookie");
  HTTPCookieStorage::setCookiesWithPolicy(v7, (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), (const HTTPCookieStoragePolicy *)v8);
  HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v8);
}

uint64_t __53__NSHTTPCookieStorage_sortedCookiesUsingDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (void)_setSharedHTTPCookieStorage:(id)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  const void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];
  uint8_t v11[16];

  if (newCookieStorageEnabled(void)::onceToken != -1)
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
  v4 = newCookieStorageEnabled(void)::enabled;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedCookieStorageLock);
  if (v4)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, "Explicitly setting cookie storage singleton", buf, 2u);
    }
    sSharedInstance = (uint64_t)a3;
    goto LABEL_26;
  }
  if (sSharedInstance)
    goto LABEL_30;
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, "Explicitly setting cookie storage singleton", v9, 2u);
  }
  sSharedInstance = (uint64_t)a3;
  objc_msgSend(*(id *)(sSharedInstance + 8), "registerForPostingNotificationsWithContext:", a3);
  if (sSharedInstance)
    v7 = (const void *)objc_msgSend((id)sSharedInstance, "_cookieStorage");
  else
    v7 = 0;
  if (newCookieStorageEnabled(void)::onceToken != -1)
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
  if (!newCookieStorageEnabled(void)::enabled)
  {
    pthread_mutex_lock(&gSharedCookieStorageLock);
    if (!gSharedCookieStorageInstance)
    {
      if (!v7)
        __assert_rtn("CFHTTPCookieStorageSetSharedHTTPCookieStorage", "CFHTTPCookieStorage.c", 111, "storage");
      CFRetain(v7);
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEFAULT, "Explicitly setting CF cookie storage singleton", v11, 2u);
      }
      gSharedCookieStorageInstance = (uint64_t)v7;
      pthread_mutex_unlock(&gSharedCookieStorageLock);
      goto LABEL_26;
    }
LABEL_30:
    CFLog();
    abort();
  }
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedCookieStorageLock);
}

+ (NSHTTPCookieStorage)sharedCookieStorageForGroupContainerIdentifier:(NSString *)identifier
{
  NSHTTPCookieStorage *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  __CFDictionary *MutableDictionary;
  char *v8;

  os_unfair_lock_lock((os_unfair_lock_t)&_groupContainerStoragesLock);
  v4 = (NSHTTPCookieStorage *)objc_msgSend((id)+[NSHTTPCookieStorage _groupContainerCookieStorages](), "objectForKey:", identifier);
  if (!v4)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", identifier);
    if (v5)
    {
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      MutableDictionary = cfTypeCreateMutableDictionary((const __CFAllocator *)*MEMORY[0x1E0C9AE00], CFSTR("ident"), identifier, CFSTR("persistent"), *MEMORY[0x1E0C9AE50], CFSTR("kCFHTTPCookieStorageGroupContainerURL"), v5, 0, 0);
      v8 = _CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v6, MutableDictionary, 1);
      CFRelease(MutableDictionary);
      v4 = (NSHTTPCookieStorage *)-[NSHTTPCookieStorage _initWithCFHTTPCookieStorage:]([NSHTTPCookieStorage alloc], "_initWithCFHTTPCookieStorage:", v8);
      -[NSHTTPCookieStorageInternal registerForPostingNotificationsWithContext:](v4->_internal, "registerForPostingNotificationsWithContext:", v4);
      CFRelease(v8);
      objc_msgSend((id)+[NSHTTPCookieStorage _groupContainerCookieStorages](), "setObject:forKey:", v4, identifier);
    }
    else
    {
      v4 = (NSHTTPCookieStorage *)(id)objc_opt_new();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_groupContainerStoragesLock);
  return v4;
}

+ (id)_csff:(id)a3
{
  int v4;
  NSHTTPCookieStorageToCookie2Storage *v5;
  _QWORD *v6;
  uint64_t v7;
  const __CFAllocator *v8;
  __CFDictionary *MutableDictionary;
  char *v10;

  if (newCookieStorageEnabled(void)::onceToken != -1)
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
  v4 = newCookieStorageEnabled(void)::enabled;
  os_unfair_lock_lock((os_unfair_lock_t)&_groupContainerStoragesLock);
  if (v4)
  {
    v5 = [NSHTTPCookieStorageToCookie2Storage alloc];
    v6 = -[NSHTTPCookieStorageToCookie2Storage initWithPath:](v5, (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3));
  }
  else
  {
    v6 = (_QWORD *)objc_msgSend((id)+[NSHTTPCookieStorage _groupContainerCookieStorages](), "objectForKey:", a3);
    if (!v6)
    {
      v7 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
      if (v7)
      {
        v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        MutableDictionary = cfTypeCreateMutableDictionary((const __CFAllocator *)*MEMORY[0x1E0C9AE00], CFSTR("ident"), a3, CFSTR("persistent"), *MEMORY[0x1E0C9AE50], CFSTR("url"), v7, 0, 0);
        v10 = _CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v8, MutableDictionary, 1);
        CFRelease(MutableDictionary);
        v6 = -[NSHTTPCookieStorage _initWithCFHTTPCookieStorage:]([NSHTTPCookieStorage alloc], "_initWithCFHTTPCookieStorage:", v10);
        objc_msgSend((id)v6[1], "registerForPostingNotificationsWithContext:", v6);
        CFRelease(v10);
        objc_msgSend((id)+[NSHTTPCookieStorage _groupContainerCookieStorages](), "setObject:forKey:", v6, a3);
      }
      else
      {
        v6 = 0;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_groupContainerStoragesLock);
  return v6;
}

+ (uint64_t)_groupContainerCookieStorages
{
  objc_opt_self();
  if (+[NSHTTPCookieStorage _groupContainerCookieStorages]::onceToken != -1)
    dispatch_once(&+[NSHTTPCookieStorage _groupContainerCookieStorages]::onceToken, &__block_literal_global_15044);
  return +[NSHTTPCookieStorage _groupContainerCookieStorages]::sGroupContainerCookieStorages;
}

uint64_t __52__NSHTTPCookieStorage__groupContainerCookieStorages__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  +[NSHTTPCookieStorage _groupContainerCookieStorages]::sGroupContainerCookieStorages = result;
  return result;
}

@end

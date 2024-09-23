@implementation WKWebsiteDataStore(WKPrivate)

+ (uint64_t)_fetchAllIdentifiers:()WKPrivate
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  CFTypeRef v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 12));
  v5 = *(unsigned int *)(a2 + 12);
  if ((_DWORD)v5)
  {
    v6 = *(_QWORD **)a2;
    v7 = 16 * v5;
    do
    {
      objc_msgSend(v4, "addObject:", WTF::UUID::operator NSUUID *(), *v6, v6[1]);
      v6 += 2;
      v7 -= 16;
    }
    while (v7);
  }
  v8 = (id)CFMakeCollectable(v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

+ (uint64_t)_removeDataStoreWithIdentifier:()WKPrivate completionHandler:
{
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)a2 || !*(_DWORD *)(*(_QWORD *)a2 + 4))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), 0);
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = WTF::StringImpl::operator NSString *();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("WKWebSiteDataStore"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_fetchDataRecordsOfTypes:()WKPrivate withOptions:completionHandler:
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  WTF::StringImpl *v13;
  uint64_t *v14;
  int v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t v18;

  v2 = result;
  v14 = *(uint64_t **)a2;
  v3 = *(_DWORD *)(a2 + 8);
  v4 = *(unsigned int *)(a2 + 12);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v15 = v3;
  v16 = v4;
  v17 = 0;
  v18 = 0;
  if ((_DWORD)v4)
  {
    if (v4 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    v5 = (uint64_t *)WTF::fastMalloc((WTF *)(8 * v4));
    v17 = v5;
    v6 = v16;
    if (v16)
    {
      v7 = v14;
      v8 = 80 * v16;
      do
      {
        v9 = API::Object::newObject(0x60uLL, 120);
        *v5++ = API::WebsiteDataRecord::WebsiteDataRecord(v9, v7);
        v7 += 10;
        v8 -= 80;
      }
      while (v8);
      v5 = v17;
    }
    else
    {
      v6 = HIDWORD(v18);
    }
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v10 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v10 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v10);
  *(_QWORD *)v10 = &off_1E34CC2F8;
  v17 = 0;
  v18 = 0;
  *(_QWORD *)(v10 + 16) = v5;
  *(_DWORD *)(v10 + 24) = v4;
  *(_DWORD *)(v10 + 28) = v6;
  v11 = *(const void **)(v10 + 8);
  if (v11)
    CFRetain(*(CFTypeRef *)(v10 + 8));
  (*(void (**)(void))(*(_QWORD *)(v2 + 8) + 16))();
  if (v11)
    CFRelease(v11);
  CFRelease(*(CFTypeRef *)(v10 + 8));
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v12);
  return WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v13);
}

- (uint64_t)_setResourceLoadStatisticsTestingCallback:()WKPrivate
{
  if (*a2)
    WTF::StringImpl::operator NSString *();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_loadedSubresourceDomainsFor:()WKPrivate completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WebKit *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  WebKit *v22;

  v2 = result;
  v19 = 0;
  v20 = 0;
  v3 = *((unsigned int *)a2 + 3);
  if ((_DWORD)v3)
  {
    if (v3 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    v5 = WTF::fastMalloc((WTF *)(8 * v3));
    LODWORD(v20) = v3;
    v19 = v5;
    v6 = *((unsigned int *)a2 + 3);
    if ((_DWORD)v6)
    {
      v7 = 0;
      v8 = *a2;
      v9 = 8 * v6;
      do
      {
        v10 = *(WTF::StringImpl **)(v8 + 8 * v7);
        if (v10)
          *(_DWORD *)v10 += 2;
        v21 = v10;
        API::String::create(&v21, &v22);
        v12 = v21;
        v13 = v22;
        v21 = 0;
        v22 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2)
            WTF::StringImpl::destroy(v12, v11);
          else
            *(_DWORD *)v12 -= 2;
        }
        *(_QWORD *)(v5 + 8 * v7++) = v13;
        v9 -= 8;
      }
      while (v9);
      HIDWORD(v20) = v6;
    }
  }
  v14 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v14 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v14);
  *(_QWORD *)v14 = &off_1E34CC2F8;
  *(_QWORD *)(v14 + 16) = v19;
  v16 = v20;
  v19 = 0;
  v20 = 0;
  *(_QWORD *)(v14 + 24) = v16;
  v17 = *(const void **)(v14 + 8);
  if (v17)
    CFRetain(*(CFTypeRef *)(v14 + 8));
  (*(void (**)(_QWORD, const void *, uint64_t))(*(_QWORD *)(v2 + 8) + 16))(*(_QWORD *)(v2 + 8), v17, v15);
  if (v17)
    CFRelease(v17);
  CFRelease(*(CFTypeRef *)(v14 + 8));
  return WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v19, v18);
}

- (uint64_t)_scheduleCookieBlockingUpdate:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_logUserInteraction:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getIsPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_clearPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_clearResourceLoadStatistics:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_closeDatabases:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getResourceLoadStatisticsDataSummary:()WKPrivate
{
  void *v2;

  *a1 = off_1E34BF630;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getResourceLoadStatisticsDataSummary:()WKPrivate
{
  WTF::RunLoop *v4;
  WTF::RunLoop *v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  WTF::RunLoop *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const void *v14;

  v4 = (WTF::RunLoop *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a2 + 3));
  v5 = v4;
  v6 = *((_DWORD *)a2 + 3);
  if (v6)
  {
    v7 = *a2;
    v8 = (uint64_t)&(*a2)[3 * v6];
    while (1)
    {
      v9 = (WTF::RunLoop *)WTF::RunLoop::main(v4);
      if ((WTF::RunLoop::isCurrent(v9) & 1) == 0)
        break;
      v10 = API::Object::newObject(0x28uLL, 96);
      *(_QWORD *)v10 = off_1E34CC2A8;
      WebKit::InitializeWebKit2((WebKit *)v10);
      *(_QWORD *)v10 = &off_1E34BF658;
      v11 = *v7;
      *v7 = 0;
      *(_QWORD *)(v10 + 24) = 0;
      *(_QWORD *)(v10 + 32) = 0;
      *(_QWORD *)(v10 + 16) = v11;
      v12 = v7[1];
      v7[1] = 0;
      *(_QWORD *)(v10 + 24) = v12;
      LODWORD(v12) = *((_DWORD *)v7 + 4);
      *((_DWORD *)v7 + 4) = 0;
      *(_DWORD *)(v10 + 32) = v12;
      LODWORD(v12) = *((_DWORD *)v7 + 5);
      *((_DWORD *)v7 + 5) = 0;
      *(_DWORD *)(v10 + 36) = v12;
      v13 = *(const void **)(v10 + 8);
      if (v13)
      {
        CFRetain(*(CFTypeRef *)(v10 + 8));
        CFRelease(*(CFTypeRef *)(v10 + 8));
        -[WTF::RunLoop addObject:](v5, "addObject:", v13);
        v14 = v13;
      }
      else
      {
        v14 = 0;
      }
      CFRelease(v14);
      v7 += 3;
      if (v7 == (uint64_t *)v8)
        goto LABEL_8;
    }
    __break(0xC471u);
  }
  else
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    if (v5)
      CFRelease(v5);
  }
}

- (uint64_t)_isRelationshipOnlyInDatabaseOnce:()WKPrivate thirdParty:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_isRegisteredAsSubresourceUnderFirstParty:()WKPrivate thirdParty:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_statisticsDatabaseHasAllTables:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_processStatisticsAndDataRecords:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setThirdPartyCookieBlockingMode:()WKPrivate onlyOnSitesWithoutUserInteraction:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_renameOrigin:()WKPrivate to:forDataOfTypes:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setUserAgentStringQuirkForTesting:()WKPrivate withUserAgent:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_appBoundDomains:()WKPrivate
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  const WTF::StringImpl *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  WebKit *v20;

  v4 = result;
  v17 = 0;
  v18 = 0;
  if (*a2 && (v5 = *(unsigned int *)(*a2 - 12), (_DWORD)v5))
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    v6 = WTF::fastMalloc((WTF *)(8 * v5));
    LODWORD(v18) = v5;
    v17 = v6;
  }
  else
  {
    v6 = 0;
  }
  v7 = WTF::HashTable<WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>::begin(a2, (uint64_t)a2, a3);
  v19[0] = v7;
  v19[1] = v8;
  if (*a2)
    v9 = *a2 + 8 * *(unsigned int *)(*a2 - 4);
  else
    v9 = 0;
  if (v9 != v7)
  {
    v10 = 0;
    do
    {
      API::String::create(&v20);
      *(_QWORD *)(v6 + 8 * v10) = v20;
      v19[0] += 8;
      WTF::HashTableConstIterator<WTF::HashTable<WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>,WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>::skipEmptyBuckets((uint64_t)v19, v11, v12);
      ++v10;
    }
    while (v19[0] != v9);
    HIDWORD(v18) = v10;
  }
  v13 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v13 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v13);
  *(_QWORD *)v13 = &off_1E34CC2F8;
  *(_QWORD *)(v13 + 16) = v17;
  v14 = v18;
  v17 = 0;
  v18 = 0;
  *(_QWORD *)(v13 + 24) = v14;
  v15 = *(const void **)(v13 + 8);
  if (v15)
    CFRetain(*(CFTypeRef *)(v13 + 8));
  (*(void (**)(void))(*(_QWORD *)(v4 + 8) + 16))();
  if (v15)
    CFRelease(v15);
  CFRelease(*(CFTypeRef *)(v13 + 8));
  return WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v16);
}

- (uint64_t)_appBoundSchemes:()WKPrivate
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  WebKit *v18;

  v3 = result;
  v16 = 0;
  v17 = 0;
  if (*a2)
  {
    v4 = *((unsigned int *)*a2 - 3);
    if ((_DWORD)v4)
    {
      if (v4 >> 29)
      {
        __break(0xC471u);
        return result;
      }
      LODWORD(v17) = *((_DWORD *)*a2 - 3);
      v16 = WTF::fastMalloc((WTF *)(8 * v4));
    }
  }
  v5 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(a2);
  v6 = v5;
  v8 = v7;
  if (*a2)
    v9 = (uint64_t)&(*a2)[*((unsigned int *)*a2 - 1)];
  else
    v9 = 0;
  if ((_QWORD *)v9 != v5)
  {
    v10 = 0;
    v11 = v16;
    do
    {
      API::String::create(&v18);
      *(_QWORD *)(v11 + 8 * v10) = v18;
      while (++v6 != v8)
      {
        if ((unint64_t)(*v6 + 1) > 1)
          goto LABEL_14;
      }
      v6 = v8;
LABEL_14:
      ++v10;
    }
    while (v6 != (_QWORD *)v9);
    HIDWORD(v17) = v10;
  }
  v12 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v12 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v12);
  *(_QWORD *)v12 = &off_1E34CC2F8;
  *(_QWORD *)(v12 + 16) = v16;
  v13 = v17;
  v16 = 0;
  v17 = 0;
  *(_QWORD *)(v12 + 24) = v13;
  v14 = *(const void **)(v12 + 8);
  if (v14)
    CFRetain(*(CFTypeRef *)(v12 + 8));
  (*(void (**)(void))(*(_QWORD *)(v3 + 8) + 16))();
  if (v14)
    CFRelease(v14);
  CFRelease(*(CFTypeRef *)(v12 + 8));
  return WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v15);
}

- (uint64_t)_sendNetworkProcessPrepareToSuspend:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_countNonDefaultSessionSets:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getPendingPushMessages:()WKPrivate
{
  void *v2;

  *a1 = off_1E34BF998;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getPendingPushMessages:()WKPrivate
{
  void *v4;
  unsigned int v5;
  WebKit::WebPushMessage *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 12));
  v5 = *(_DWORD *)(a2 + 12);
  if (v5)
  {
    v6 = *(WebKit::WebPushMessage **)a2;
    v7 = 216 * v5;
    do
    {
      objc_msgSend(v4, "addObject:", WebKit::WebPushMessage::toDictionary(v6));
      v6 = (WebKit::WebPushMessage *)((char *)v6 + 216);
      v7 -= 216;
    }
    while (v7);
  }
  v8 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(unsigned int *)(a2 + 12);
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEFAULT, "Giving application %zu pending push messages", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v4)
    CFRelease(v4);
}

- (uint64_t)_processPushMessage:()WKPrivate completionHandler:
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Push message processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_processPersistentNotificationClick:()WKPrivate completionHandler:
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Notification click event processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_processPersistentNotificationClose:()WKPrivate completionHandler:
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Notification close event processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getAllBackgroundFetchIdentifiers:()WKPrivate
{
  WTF::StringImpl **v3;
  void *v4;
  WTF::StringImpl **v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  const __CFString *v8;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  void *v11;
  WTF::StringImpl **v13;
  WTF::StringImpl **v14;

  v13 = *a2;
  v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v14 = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", HIDWORD(v3));
  if (HIDWORD(v14))
  {
    v5 = v13;
    v6 = 8 * HIDWORD(v14);
    do
    {
      v7 = *v5;
      if (*v5)
      {
        *(_DWORD *)v7 += 2;
        v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        v8 = &stru_1E351F1B8;
      }
      objc_msgSend(v4, "addObject:", v8, v13, v14);
      if (v7)
      {
        if (*(_DWORD *)v7 == 2)
          WTF::StringImpl::destroy(v7, v9);
        else
          *(_DWORD *)v7 -= 2;
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  v10 = (id)CFMakeCollectable(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v11);
}

- (uint64_t)_getBackgroundFetchState:()WKPrivate completionHandler:
{
  WTF::StringImpl *v3;
  _BYTE v5[152];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v6 = 0;
  if (*(_BYTE *)(a2 + 152))
  {
    std::construct_at[abi:sn180100]<WebKit::BackgroundFetchState,WebKit::BackgroundFetchState,WebKit::BackgroundFetchState*>((uint64_t)v5, a2);
    v6 = 1;
    WebKit::BackgroundFetchState::toDictionary((WebKit::BackgroundFetchState *)v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  return std::__optional_destruct_base<WebKit::BackgroundFetchState,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v5, v3);
}

- (uint64_t)_abortBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_pauseBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_resumeBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_clickBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_storeServiceWorkerRegistrations:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_scopeURL:()WKPrivate hasPushSubscriptionForTesting:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_originDirectoryForTesting:()WKPrivate topOrigin:type:completionHandler:
{
  WTF::StringImpl *v3;
  uint64_t result;
  WTF::StringImpl *v5;

  v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      return WTF::StringImpl::destroy(v3, v5);
    else
      *(_DWORD *)v3 -= 2;
  }
  return result;
}

- (uint64_t)_setBackupExclusionPeriodForTesting:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setCompletionHandlerForRemovalFromNetworkProcess:()WKPrivate
{
  WTF::StringImpl *v3;
  void *v4;
  uint64_t result;
  WTF::StringImpl *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  *a2 = 0;
  if (v3 && *((_DWORD *)v3 + 1))
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = WTF::StringImpl::operator NSString *();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WKWebSiteDataStore"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  else
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    if (!v3)
      return result;
  }
  if (*(_DWORD *)v3 == 2)
    return WTF::StringImpl::destroy(v3, v6);
  *(_DWORD *)v3 -= 2;
  return result;
}

@end

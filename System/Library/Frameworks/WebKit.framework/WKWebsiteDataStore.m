@implementation WKWebsiteDataStore

- (WKHTTPCookieStore)httpCookieStore
{
  return (WKHTTPCookieStore *)*((_QWORD *)WebKit::WebsiteDataStore::cookieStore((WebKit::WebsiteDataStore *)&self->_websiteDataStore)
                              + 1);
}

+ (WKWebsiteDataStore)defaultDataStore
{
  WebKit::WebsiteDataStore *v2;
  CFTypeRef v3;
  WKWebsiteDataStore *v4;
  CFTypeRef *v6;

  WebKit::WebsiteDataStore::defaultDataStore((WebKit::WebsiteDataStore *)a1, (WebKit::WebsiteDataStore **)&v6);
  v2 = (WebKit::WebsiteDataStore *)v6;
  v3 = v6[1];
  if (v3)
    CFRetain(v6[1]);
  v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return v4;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 32) = 0u;
  return self;
}

+ (void)_fetchAllIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v3 = _Block_copy(a3);
  v4 = _Block_copy(v3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF450;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::fetchAllDataStoreIdentifiers((WebKit::WebsiteDataStore *)&v7);
  v6 = v7;
  v7 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
  _Block_release(v3);
}

- (void)_setResourceLoadStatisticsEnabled:(BOOL)a3
{
  WebKit::WebsiteDataStore::setTrackingPreventionEnabled((uint64_t)&self->_websiteDataStore, a3);
}

- (id)_initWithConfiguration:(id)a3
{
  WKWebsiteDataStore *v4;
  PAL::SessionID *v5;
  uint64_t PersistentSessionID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKWebsiteDataStore;
  v4 = -[WKWebsiteDataStore init](&v11, sel_init);
  if (v4)
  {
    v5 = (PAL::SessionID *)objc_msgSend(a3, "isPersistent");
    if ((_DWORD)v5)
      PersistentSessionID = PAL::SessionID::generatePersistentSessionID(v5);
    else
      PersistentSessionID = PAL::SessionID::generateEphemeralSessionID(v5);
    v7 = PersistentSessionID;
    WebKit::WebsiteDataStoreConfiguration::copy((WebKit::WebsiteDataStoreConfiguration *)((char *)a3 + 16), (uint64_t)&v10);
    *(_QWORD *)(WebKit::WebsiteDataStore::WebsiteDataStore((uint64_t)-[WKWebsiteDataStore _apiObject](v4, "_apiObject"), &v10, v7)+ 8) = v4;
    v8 = v10;
    v10 = 0;
    if (v8)
      CFRelease(*(CFTypeRef *)(v8 + 8));
    WebKit::WebsiteDataStore::resolveDirectoriesAsynchronously((WebKit::WebsiteDataStore *)&v4->_websiteDataStore);
  }
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_websiteDataStore;
}

- (NSUUID)_identifier
{
  if (*(_OWORD *)(*(_QWORD *)&self->_anon_38[160] + 32) == 0)
    return 0;
  else
    return (NSUUID *)WTF::UUID::operator NSUUID *();
}

- (void)_getResourceLoadStatisticsDataSummary:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF630;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebsiteDataStore::getResourceLoadStatisticsDataSummary((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)set_delegate:(id)a3
{
  uint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  uint64_t v34;

  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  v5 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v5 = off_1E34BF798;
  *(_QWORD *)(v5 + 8) = 0;
  objc_initWeak((id *)(v5 + 8), self);
  *(_QWORD *)(v5 + 16) = 0;
  objc_initWeak((id *)(v5 + 16), a3);
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
  v7 = objc_opt_respondsToSelector();
  if (WeakRetained)
    CFRelease(WeakRetained);
  *(_BYTE *)(v5 + 24) = v7 & 1;
  v8 = objc_loadWeakRetained((id *)(v5 + 16));
  v9 = objc_opt_respondsToSelector();
  if (v8)
    CFRelease(v8);
  *(_BYTE *)(v5 + 25) = v9 & 1;
  v10 = objc_loadWeakRetained((id *)(v5 + 16));
  v11 = objc_opt_respondsToSelector();
  if (v10)
    CFRelease(v10);
  *(_BYTE *)(v5 + 26) = v11 & 1;
  v12 = objc_loadWeakRetained((id *)(v5 + 16));
  v13 = objc_opt_respondsToSelector();
  if (v12)
    CFRelease(v12);
  *(_BYTE *)(v5 + 27) = v13 & 1;
  v14 = objc_loadWeakRetained((id *)(v5 + 16));
  v15 = objc_opt_respondsToSelector();
  if (v14)
    CFRelease(v14);
  *(_BYTE *)(v5 + 28) = v15 & 1;
  v16 = objc_loadWeakRetained((id *)(v5 + 16));
  v17 = objc_opt_respondsToSelector();
  if (v16)
    CFRelease(v16);
  *(_BYTE *)(v5 + 29) = v17 & 1;
  v18 = objc_loadWeakRetained((id *)(v5 + 16));
  v19 = objc_opt_respondsToSelector();
  if (v18)
    CFRelease(v18);
  *(_BYTE *)(v5 + 30) = v19 & 1;
  v20 = objc_loadWeakRetained((id *)(v5 + 16));
  v21 = objc_opt_respondsToSelector();
  if (v20)
    CFRelease(v20);
  *(_BYTE *)(v5 + 31) = v21 & 1;
  v22 = objc_loadWeakRetained((id *)(v5 + 16));
  v23 = objc_opt_respondsToSelector();
  if (v22)
    CFRelease(v22);
  *(_BYTE *)(v5 + 32) = v23 & 1;
  v24 = objc_loadWeakRetained((id *)(v5 + 16));
  v25 = objc_opt_respondsToSelector();
  if (v24)
    CFRelease(v24);
  *(_BYTE *)(v5 + 33) = v25 & 1;
  v26 = objc_loadWeakRetained((id *)(v5 + 16));
  v27 = objc_opt_respondsToSelector();
  if (v26)
    CFRelease(v26);
  *(_BYTE *)(v5 + 34) = v27 & 1;
  v28 = objc_loadWeakRetained((id *)(v5 + 16));
  v29 = objc_opt_respondsToSelector();
  if (v28)
    CFRelease(v28);
  *(_BYTE *)(v5 + 35) = v29 & 1;
  v30 = objc_loadWeakRetained((id *)(v5 + 16));
  v31 = objc_opt_respondsToSelector();
  if (v30)
    CFRelease(v30);
  *(_BYTE *)(v5 + 36) = v31 & 1;
  v32 = objc_loadWeakRetained((id *)(v5 + 16));
  v33 = objc_opt_respondsToSelector();
  if (v32)
    CFRelease(v32);
  *(_BYTE *)(v5 + 37) = v33 & 1;
  v34 = *(_QWORD *)&self->_anon_38[344];
  *(_QWORD *)&self->_anon_38[344] = v5;
  if (v34)
    (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebsiteDataStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebsiteDataStore accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

+ (WKWebsiteDataStore)nonPersistentDataStore
{
  WebKit::WebsiteDataStore *v2;
  CFTypeRef v3;
  WKWebsiteDataStore *v4;
  CFTypeRef *v6;

  WebKit::WebsiteDataStore::createNonPersistent((WebKit::WebsiteDataStore **)&v6);
  v2 = (WebKit::WebsiteDataStore *)v6;
  v3 = v6[1];
  if (v3)
    CFRetain(v6[1]);
  v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return v4;
}

- (WKWebsiteDataStore)init
{
  WKWebsiteDataStore *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t EphemeralSessionID;
  PAL::SessionID *v8[2];
  objc_super v9;

  if (WTF::linkedOnOrAfterSDKWithBehavior())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Calling [WKWebsiteDataStore init] is not supported."));
  v9.receiver = self;
  v9.super_class = (Class)WKWebsiteDataStore;
  v3 = -[WKWebsiteDataStore init](&v9, sel_init);
  if (v3)
  {
    v4 = qword_1ECE718E8;
    if (os_log_type_enabled((os_log_t)qword_1ECE718E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8[0]) = 0;
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Application is calling [WKWebsiteDataStore init], which is not supported", (uint8_t *)v8, 2u);
    }
    v5 = API::Object::newObject(0x220uLL, 122);
    v8[0] = (PAL::SessionID *)WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration(v5, 0, 1);
    EphemeralSessionID = PAL::SessionID::generateEphemeralSessionID(v8[0]);
    *(_QWORD *)(WebKit::WebsiteDataStore::WebsiteDataStore((uint64_t)-[WKWebsiteDataStore _apiObject](v3, "_apiObject"), (uint64_t *)v8, EphemeralSessionID)+ 8) = v3;
    if (v8[0])
      CFRelease(*((CFTypeRef *)v8[0] + 1));
  }
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebsiteDataStore::~WebsiteDataStore((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
    v4.receiver = self;
    v4.super_class = (Class)WKWebsiteDataStore;
    -[WKWebsiteDataStore dealloc](&v4, sel_dealloc);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WKWebsiteDataStore)initWithCoder:(id)a3
{
  if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isDefaultDataStore")))
    return +[WKWebsiteDataStore defaultDataStore](WKWebsiteDataStore, "defaultDataStore");
  else
    return +[WKWebsiteDataStore nonPersistentDataStore](WKWebsiteDataStore, "nonPersistentDataStore");
}

- (void)encodeWithCoder:(id)a3
{
  if (+[WKWebsiteDataStore defaultDataStore](WKWebsiteDataStore, "defaultDataStore") == self)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("isDefaultDataStore"));
}

- (BOOL)isPersistent
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  return v2 >= 0 || v2 == -1;
}

+ (NSSet)allWebsiteDataTypes
{
  if ((_MergedGlobals_66 & 1) == 0)
  {
    qword_1ECE72940 = 0;
    _MergedGlobals_66 = 1;
  }
  if (qword_1ECE72938 != -1)
    dispatch_once(&qword_1ECE72938, &__block_literal_global_20);
  return (NSSet *)qword_1ECE72940;
}

void __41__WKWebsiteDataStore_allWebsiteDataTypes__block_invoke()
{
  id v0;
  uint64_t v1;
  const void *v2;
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3[0] = CFSTR("WKWebsiteDataTypeDiskCache");
  v3[1] = CFSTR("WKWebsiteDataTypeFetchCache");
  v3[2] = CFSTR("WKWebsiteDataTypeMemoryCache");
  v3[3] = CFSTR("WKWebsiteDataTypeOfflineWebApplicationCache");
  v3[4] = CFSTR("WKWebsiteDataTypeCookies");
  v3[5] = CFSTR("WKWebsiteDataTypeSessionStorage");
  v3[6] = CFSTR("WKWebsiteDataTypeLocalStorage");
  v3[7] = CFSTR("WKWebsiteDataTypeIndexedDBDatabases");
  v3[8] = CFSTR("WKWebsiteDataTypeServiceWorkerRegistrations");
  v3[9] = CFSTR("WKWebsiteDataTypeWebSQLDatabases");
  v3[10] = CFSTR("WKWebsiteDataTypeFileSystem");
  v3[11] = CFSTR("WKWebsiteDataTypeSearchFieldRecentSearches");
  v3[12] = CFSTR("WKWebsiteDataTypeMediaKeys");
  v3[13] = CFSTR("WKWebsiteDataTypeHashSalt");
  v1 = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 14));
  v2 = (const void *)qword_1ECE72940;
  qword_1ECE72940 = v1;
  if (v2)
    CFRelease(v2);
}

- (void)fetchDataRecordsOfTypes:(NSSet *)dataTypes completionHandler:(void *)completionHandler
{
  -[WKWebsiteDataStore _fetchDataRecordsOfTypes:withOptions:completionHandler:](self, "_fetchDataRecordsOfTypes:withOptions:completionHandler:", dataTypes, 0, completionHandler);
}

- (void)removeDataOfTypes:(NSSet *)dataTypes modifiedSince:(NSDate *)date completionHandler:(void *)completionHandler
{
  void *v8;
  NSString *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25[17];

  v25[16] = *MEMORY[0x1E0C80C00];
  v8 = _Block_copy(completionHandler);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](dataTypes, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
  {
    v11 = 0;
    if (date)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(dataTypes);
      v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((_QWORD *)&v21 + 1) + 8 * i), v9);
      if (v14 <= 0x100000000)
        v15 = 0;
      else
        v15 = v14;
      v11 |= v15;
    }
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](dataTypes, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v10);
  if (!date)
LABEL_14:
    date = (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
LABEL_15:
  -[NSDate timeIntervalSince1970](date, "timeIntervalSince1970");
  v17 = v16;
  v18 = _Block_copy(v8);
  v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v19 = off_1E34BF400;
  v19[1] = v18;
  v25[0] = (uint64_t)v19;
  WebKit::WebsiteDataStore::removeData((uint64_t)&self->_websiteDataStore, v11, v25, v17);
  v20 = v25[0];
  v25[0] = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  _Block_release(0);
  _Block_release(v8);
}

- (void)removeDataOfTypes:(NSSet *)dataTypes forDataRecords:(NSArray *)dataRecords completionHandler:(void *)completionHandler
{
  void *v8;
  NSString *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const WebKit::WebsiteDataRecord *v19;
  unsigned int v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31[17];

  v31[16] = *MEMORY[0x1E0C80C00];
  v8 = _Block_copy(completionHandler);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](dataTypes, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(dataTypes);
        v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((_QWORD *)&v27 + 1) + 8 * i), v9);
        if (v14 <= 0x100000000)
          v15 = 0;
        else
          v15 = v14;
        v11 |= v15;
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](dataTypes, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v26 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](dataRecords, "countByEnumeratingWithState:objects:count:", &v27, v31, 16, 0);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(dataRecords);
        v19 = (const WebKit::WebsiteDataRecord *)(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j) + 24);
        v20 = HIDWORD(v26);
        if (HIDWORD(v26) == (_DWORD)v26)
        {
          v19 = (const WebKit::WebsiteDataRecord *)WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v25, HIDWORD(v26) + 1, (unint64_t)v19);
          v20 = HIDWORD(v26);
        }
        WebKit::WebsiteDataRecord::WebsiteDataRecord((WebKit::WebsiteDataRecord *)(v25 + 80 * v20), v19);
        ++HIDWORD(v26);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](dataRecords, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }
  v21 = _Block_copy(v8);
  v22 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v22 = off_1E34BF428;
  v22[1] = v21;
  v31[0] = (uint64_t)v22;
  WebKit::WebsiteDataStore::removeData((uint64_t)&self->_websiteDataStore, v11, &v25, v31);
  v23 = v31[0];
  v31[0] = 0;
  if (v23)
    (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  _Block_release(0);
  WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v24);
  _Block_release(v8);
}

+ (WKWebsiteDataStore)dataStoreForIdentifier:(NSUUID *)identifier
{
  void *v4;
  char *v5;
  void *v6;
  WTF *v7;
  WTF::StringImpl *v8;
  WTF *v9;
  const void *v10;
  WKWebsiteDataStore *v11;
  WTF::StringImpl *v13;
  WTF *v14;
  unsigned __int128 v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!identifier)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier is nil"));
  WTF::UUID::fromNSUUID((WTF::UUID *)identifier, (NSUUID *)a2);
  if (!v16 || v15 < 2)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    MEMORY[0x19AEABCC8](&v13, -[NSUUID UUIDString](identifier, "UUIDString"));
    WTF::String::utf8();
    if (v14)
      v5 = (char *)v14 + 16;
    else
      v5 = 0;
    objc_msgSend(v4, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier (%s) is invalid for data store"), v5);
    v7 = v14;
    v14 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 1)
        WTF::fastFree(v7, v6);
      else
        --*(_DWORD *)v7;
    }
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, (WTF::StringImpl *)v6);
      else
        *(_DWORD *)v8 -= 2;
    }
    if (!v16)
      __break(1u);
  }
  WebKit::WebsiteDataStore::dataStoreForIdentifier((WebKit::WebsiteDataStore *)&v15, &v14);
  v9 = v14;
  v10 = (const void *)*((_QWORD *)v14 + 1);
  if (v10)
    CFRetain(*((CFTypeRef *)v14 + 1));
  v11 = (id)CFMakeCollectable(v10);
  CFRelease(*((CFTypeRef *)v9 + 1));
  return v11;
}

- (void)setProxyConfigurations:(NSArray *)proxyConfigurations
{
  void *v5;
  void *m_ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  WTF *v15;
  uint64_t v16;
  uint64_t v17;
  WTF *v18;
  WTF *v19;
  uint64_t v20;
  void *v21;
  WTF *v22;
  int v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSArray copy](proxyConfigurations, "copy");
  m_ptr = self->_proxyConfigurations.m_ptr;
  self->_proxyConfigurations.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v5 = self->_proxyConfigurations.m_ptr;
    if (!v5)
      goto LABEL_28;
  }
  else if (!v5)
  {
    goto LABEL_28;
  }
  if (objc_msgSend(v5, "count"))
  {
    v30 = 0;
    v31 = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](proxyConfigurations, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (!v7)
      goto LABEL_26;
    v8 = *(_QWORD *)v27;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(proxyConfigurations);
        v10 = (void *)nw_proxy_config_copy_agent_data();
        v32 = 0uLL;
        nw_proxy_config_get_identifier();
        if (!v10)
        {
          LODWORD(v14) = 0;
LABEL_24:
          v15 = 0;
          goto LABEL_14;
        }
        v12 = objc_msgSend(v10, "bytes");
        v13 = objc_msgSend(v10, "length");
        v14 = v13;
        if (!v13)
          goto LABEL_24;
        if (HIDWORD(v13))
        {
          __break(0xC471u);
          return;
        }
        v15 = (WTF *)WTF::fastMalloc((WTF *)v13);
        v16 = 0;
        do
        {
          *((_BYTE *)v15 + v16) = *(_BYTE *)(v12 + v16);
          ++v16;
        }
        while (v14 != v16);
LABEL_14:
        v22 = v15;
        v23 = v14;
        v24 = v14;
        v25 = v32;
        if (HIDWORD(v31) == (_DWORD)v31)
        {
          WTF::Vector<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>>((uint64_t)&v30, (unint64_t)&v22);
        }
        else
        {
          v17 = v30 + 32 * HIDWORD(v31);
          *(_QWORD *)v17 = 0;
          *(_QWORD *)(v17 + 8) = 0;
          v18 = v22;
          v22 = 0;
          *(_QWORD *)v17 = v18;
          *(_DWORD *)(v17 + 8) = v23;
          LODWORD(v18) = v24;
          v24 = 0;
          *(_DWORD *)(v17 + 12) = (_DWORD)v18;
          *(_OWORD *)(v17 + 16) = v25;
          ++HIDWORD(v31);
        }
        v19 = v22;
        if (v22)
        {
          v22 = 0;
          v23 = 0;
          WTF::fastFree(v19, v11);
        }
        if (v10)
          CFRelease(v10);
        ++v9;
      }
      while (v9 != v7);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](proxyConfigurations, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      v7 = v20;
      if (!v20)
      {
LABEL_26:
        WebKit::WebsiteDataStore::setProxyConfigData((WebKit::WebsiteDataStore *)&self->_websiteDataStore, &v30);
        WTF::Vector<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v30, v21);
        return;
      }
    }
  }
LABEL_28:
  WebKit::WebsiteDataStore::clearProxyConfigData((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (NSArray)proxyConfigurations
{
  return (NSArray *)self->_proxyConfigurations.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_proxyConfigurations.m_ptr;
  self->_proxyConfigurations.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak(&self->_delegate.m_weakReference);
}

+ (id)_allWebsiteDataTypesIncludingPrivate
{
  _QWORD block[5];

  if ((byte_1ECE72931 & 1) == 0)
  {
    qword_1ECE72950 = 0;
    byte_1ECE72931 = 1;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WKWebsiteDataStore_WKPrivate___allWebsiteDataTypesIncludingPrivate__block_invoke;
  block[3] = &unk_1E34BAF80;
  block[4] = a1;
  if (qword_1ECE72948 != -1)
    dispatch_once(&qword_1ECE72948, block);
  return (id)qword_1ECE72950;
}

void __69__WKWebsiteDataStore_WKPrivate___allWebsiteDataTypesIncludingPrivate__block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("_WKWebsiteDataTypeHSTSCache");
  v4[1] = CFSTR("_WKWebsiteDataTypeResourceLoadStatistics");
  v4[2] = CFSTR("_WKWebsiteDataTypeCredentials");
  v4[3] = CFSTR("_WKWebsiteDataTypeAdClickAttributions");
  v4[4] = CFSTR("_WKWebsiteDataTypePrivateClickMeasurements");
  v4[5] = CFSTR("_WKWebsiteDataTypeAlternativeServices");
  v1 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "allWebsiteDataTypes"), "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6));
  v2 = (uint64_t)v1;
  if (v1)
    CFRetain(v1);
  v3 = (const void *)qword_1ECE72950;
  qword_1ECE72950 = v2;
  if (v3)
    CFRelease(v3);
}

+ (BOOL)_defaultDataStoreExists
{
  BOOL result;

  {
    return WebKit::globalDefaultDataStore(void)::globalDefaultDataStore
        && *(_QWORD *)(WebKit::globalDefaultDataStore(void)::globalDefaultDataStore + 8) != 0;
  }
  else
  {
    result = 0;
    WebKit::globalDefaultDataStore(void)::globalDefaultDataStore = 0;
  }
  return result;
}

+ (void)_removeDataStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v6;
  NSUUID *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  const __CFString *v13;
  _BYTE v14[40];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = _Block_copy(a4);
    WTF::UUID::fromNSUUID((WTF::UUID *)a3, v7);
    if (v14[16])
    {
      v8 = _Block_copy(v6);
      v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v9 = off_1E34BF478;
      v9[1] = v8;
      v11 = v9;
      WebKit::WebsiteDataStore::removeDataStoreWithIdentifier((WebKit::WebsiteDataStore *)v14, (WTF::RefCountedBase *)&v11);
      v10 = v11;
      v11 = 0;
      if (v10)
        (*(void (**)(_QWORD *))(*v10 + 8))(v10);
      _Block_release(0);
    }
    else
    {
      v12 = *MEMORY[0x1E0CB2D50];
      v13 = CFSTR("Identifier is invalid");
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKWebSiteDataStore"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
    }
    _Block_release(v6);
  }
  else
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Identifier is nil");
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKWebSiteDataStore"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1)));
  }
}

- (void)_fetchDataRecordsOfTypes:(id)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5
{
  char v5;
  void *v8;
  NSString *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  int v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21[17];

  v5 = a4;
  v21[16] = *MEMORY[0x1E0C80C00];
  v8 = _Block_copy(a5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(a3);
        v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((_QWORD *)&v17 + 1) + 8 * i), v9);
        if (v14 <= 0x100000000)
          v15 = 0;
        else
          v15 = v14;
        v11 |= v15;
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v16 = off_1E34BF4A0;
  v16[1] = v8;
  v21[0] = (uint64_t)v16;
  WebKit::WebsiteDataStore::fetchData((WTF::WorkQueue *)&self->_websiteDataStore, v11, v5 & 1, v21);
  if (v21[0])
    (*(void (**)(uint64_t))(*(_QWORD *)v21[0] + 8))(v21[0]);
  _Block_release(0);
  _Block_release(0);
}

- (BOOL)_resourceLoadStatisticsEnabled
{
  if (self->_anon_38[217])
    return self->_anon_38[217] == 2;
  if (*(unsigned __int16 *)(*(_QWORD *)&self->_anon_38[160] + 536) >= 0x100u)
    return *(_WORD *)(*(_QWORD *)&self->_anon_38[160] + 536) != 0;
  return WebKit::doesAppHaveTrackingPreventionEnabled((WebKit *)self);
}

- (BOOL)_resourceLoadStatisticsDebugMode
{
  return self->_anon_38[216];
}

- (void)_setResourceLoadStatisticsDebugMode:(BOOL)a3
{
  WebKit::WebsiteDataStore::setResourceLoadStatisticsDebugMode((WebKit::WebsiteDataStore *)&self->_websiteDataStore, a3);
}

- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3
{
  WebKit::WebsiteDataStore::setPrivateClickMeasurementDebugMode((WebKit::WebsiteDataStore *)&self->_websiteDataStore, a3);
}

- (BOOL)_storageSiteValidationEnabled
{
  return self->_anon_38[448];
}

- (void)_setStorageSiteValidationEnabled:(BOOL)a3
{
  WebKit::WebsiteDataStore::setStorageSiteValidationEnabled((unsigned int *)self->_websiteDataStore.data.__lx, a3);
}

- (unint64_t)_perOriginStorageQuota
{
  return 0;
}

- (NSString)_boundInterfaceIdentifier
{
  return 0;
}

- (BOOL)_allowsCellularAccess
{
  return 1;
}

- (BOOL)_allowsTLSFallback
{
  return 0;
}

- (NSDictionary)_proxyConfiguration
{
  return 0;
}

- (void)_setResourceLoadStatisticsTestingCallback:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  if ((v4 & 0x8000000000000000) == 0 || v4 == -1)
  {
    if (a3)
    {
      v5 = _Block_copy(a3);
      v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v6 = off_1E34BF4C8;
      v6[1] = v5;
      v6[2] = self;
      v7 = v6;
      WebKit::WebsiteDataStore::setStatisticsTestingCallback((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
      if (v7)
        (*(void (**)(_QWORD *))(*v7 + 8))(v7);
      _Block_release(0);
    }
    else
    {
      v7 = 0;
      WebKit::WebsiteDataStore::setStatisticsTestingCallback((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
      if (v7)
        (*(void (**)(_QWORD *))(*v7 + 8))(v7);
    }
  }
}

- (void)_setStorageAccessPromptQuirkForTesting:(id)a3 withSubFrameDomains:(id)a4 withTriggerPages:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  _QWORD *v18;
  _BYTE v19[16];
  _BYTE v20[16];
  WTF::StringImpl *v21;

  v10 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  if ((v10 & 0x8000000000000000) == 0 || v10 == -1)
  {
    MEMORY[0x19AEABCC8](&v21, a3);
    WTF::makeVector<WTF::String>(a4, (uint64_t)v20);
    WTF::makeVector<WTF::String>(a5, (uint64_t)v19);
    v11 = _Block_copy(a6);
    v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v12 = off_1E34BDAC8;
    v12[1] = v11;
    v18 = v12;
    WebKit::WebsiteDataStore::setStorageAccessPromptQuirkForTesting((uint64_t)&self->_websiteDataStore, &v21, (uint64_t)v20, (uint64_t)v19, (uint64_t *)&v18);
    v13 = (uint64_t)v18;
    v18 = 0;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    _Block_release(0);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v14);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v15);
    v17 = v21;
    v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v16);
      else
        *(_DWORD *)v17 -= 2;
    }
  }
}

- (void)_grantStorageAccessForTesting:(id)a3 withSubFrameDomains:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  _QWORD *v15;
  _BYTE v16[16];
  WTF::StringImpl *v17;

  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  if ((v8 & 0x8000000000000000) == 0 || v8 == -1)
  {
    MEMORY[0x19AEABCC8](&v17, a3);
    WTF::makeVector<WTF::String>(a4, (uint64_t)v16);
    v9 = _Block_copy(a5);
    v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v10 = off_1E34BDAC8;
    v10[1] = v9;
    v15 = v10;
    WebKit::WebsiteDataStore::grantStorageAccessForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (WebCore::RegistrableDomain *)&v17, (uint64_t)v16, (uint64_t *)&v15);
    v11 = (uint64_t)v15;
    v15 = 0;
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    _Block_release(0);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v16, v12);
    v14 = v17;
    v17 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v13);
      else
        *(_DWORD *)v14 -= 2;
    }
  }
  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)_setResourceLoadStatisticsTimeAdvanceForTesting:(double)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BDAC8;
  v7[1] = v6;
  v9 = v7;
  WebKit::WebsiteDataStore::setResourceLoadStatisticsTimeAdvanceForTesting((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v9, a3);
  v8 = (uint64_t)v9;
  v9 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

+ (void)_allowWebsiteDataRecordsForAllOrigins
{
  WebKit::allowsWebsiteDataRecordsForAllOrigins = 1;
}

- (void)_loadedSubresourceDomainsFor:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;

  if (a3)
  {
    objc_msgSend(a3, "_page");
    v5 = v10;
    if (v10)
    {
      v6 = _Block_copy(a4);
      v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v7 = off_1E34BF4F0;
      v7[1] = v6;
      v9 = v7;
      v11 = 0;
      WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetLoadedSubresourceDomains,WTF::CompletionHandler<void ()(WTF::Vector<WebCore::RegistrableDomain,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &&)>>(*(_QWORD *)(v5 + 208), (uint64_t)&v11, (uint64_t *)&v9, *(_QWORD *)(*(_QWORD *)(v5 + 32) + 1896), 0, 1);
      v8 = (uint64_t)v9;
      v9 = 0;
      if (v8)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      _Block_release(0);
    }
    else
    {
      (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)_clearLoadedSubresourceDomainsFor:(id)a3
{
  uint64_t v3;
  char v4;

  if (a3)
  {
    objc_msgSend(a3, "_page");
    if (v3)
    {
      v4 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ClearLoadedSubresourceDomains>(*(_QWORD *)(v3 + 208), (uint64_t)&v4, *(_QWORD *)(*(_QWORD *)(v3 + 32) + 1896), 0);
    }
  }
}

- (void)_scheduleCookieBlockingUpdate:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF518;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::scheduleCookieBlockingUpdate((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_logUserInteraction:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  MEMORY[0x19AEABB18](v12, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BF540;
  v7[1] = v6;
  v11 = v7;
  WebKit::WebsiteDataStore::logUserInteraction((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  v8 = (uint64_t)v11;
  v11 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v9);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)_setPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  MEMORY[0x19AEABB18](v12, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BF568;
  v7[1] = v6;
  v11 = v7;
  WebKit::WebsiteDataStore::setPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  v8 = (uint64_t)v11;
  v11 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v9);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)_getIsPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  MEMORY[0x19AEABB18](v12, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BF590;
  v7[1] = v6;
  v11 = v7;
  WebKit::WebsiteDataStore::isPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  v8 = (uint64_t)v11;
  v11 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v9);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)_clearPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  MEMORY[0x19AEABB18](v12, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BF5B8;
  v7[1] = v6;
  v11 = v7;
  WebKit::WebsiteDataStore::clearPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  v8 = (uint64_t)v11;
  v11 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v9);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)_clearResourceLoadStatistics:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF5E0;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::scheduleClearInMemoryAndPersistent((uint64_t *)&self->_websiteDataStore, 0, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_closeDatabases:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF608;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::closeDatabases((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_isRelationshipOnlyInDatabaseOnce:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15[5];
  WTF::StringImpl *v16[5];

  MEMORY[0x19AEABB18](v16, a4);
  MEMORY[0x19AEABB18](v15, a3);
  v8 = _Block_copy(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BF680;
  v9[1] = v8;
  v14 = v9;
  WebKit::WebsiteDataStore::isRelationshipOnlyInDatabaseOnce((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v16, (const WTF::URL *)v15, (uint64_t *)&v14);
  v10 = (uint64_t)v14;
  v14 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Block_release(0);
  v12 = v15[0];
  v15[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v11);
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v16[0];
  v16[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v11);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_isRegisteredAsSubresourceUnderFirstParty:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15[5];
  WTF::StringImpl *v16[5];

  MEMORY[0x19AEABB18](v16, a4);
  MEMORY[0x19AEABB18](v15, a3);
  v8 = _Block_copy(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BF6A8;
  v9[1] = v8;
  v14 = v9;
  WebKit::WebsiteDataStore::isRegisteredAsSubresourceUnder((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v16, (const WTF::URL *)v15, (uint64_t *)&v14);
  v10 = (uint64_t)v14;
  v14 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Block_release(0);
  v12 = v15[0];
  v15[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v11);
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v16[0];
  v16[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v11);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_statisticsDatabaseHasAllTables:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF6D0;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::statisticsDatabaseHasAllTables((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_processStatisticsAndDataRecords:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF6F8;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::scheduleStatisticsAndDataRecordsProcessing((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_setThirdPartyCookieBlockingMode:(BOOL)a3 onlyOnSitesWithoutUserInteraction:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  _QWORD *v9;
  int v10;
  int v11;
  _QWORD *v12;

  v5 = a4;
  v6 = a3;
  v8 = _Block_copy(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BF720;
  v9[1] = v8;
  v12 = v9;
  if (v5)
    v10 = 3;
  else
    v10 = 0;
  if (v6)
    v11 = v10;
  else
    v11 = 4;
  WebKit::WebsiteDataStore::setThirdPartyCookieBlockingMode((uint64_t)&self->_websiteDataStore, v11, (uint64_t *)&v12);
  if (v12)
    (*(void (**)(_QWORD *))(*v12 + 8))(v12);
  _Block_release(0);
}

- (void)_renameOrigin:(id)a3 to:(id)a4 forDataOfTypes:(id)a5 completionHandler:(id)a6
{
  const WTF::URL *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  const WTF::URL *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  NSString *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  int v23;
  void *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31[3];
  int v32;
  uint64_t v33[3];
  int v34;
  WTF::StringImpl *v35[17];

  v35[16] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "count"))
  {
    if ((objc_msgSend(a5, "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("WKWebsiteDataTypeLocalStorage"), CFSTR("WKWebsiteDataTypeIndexedDBDatabases"), 0)) & 1) == 0)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("_renameOrigin can only be called with WKWebsiteDataTypeLocalStorage and WKWebsiteDataTypeIndexedDBDatabases right now."));
    MEMORY[0x19AEABB18](v35, a3);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness((WebCore::SecurityOriginData *)v35, v11);
    v13 = v35[0];
    v35[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v12);
      else
        *(_DWORD *)v13 -= 2;
    }
    MEMORY[0x19AEABB18](v35, a4);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness((WebCore::SecurityOriginData *)v35, v14);
    v16 = v35[0];
    v35[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v15);
      else
        *(_DWORD *)v16 -= 2;
    }
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = 0;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(a5);
          v22 = WebKit::toWebsiteDataType(*(WebKit **)(*((_QWORD *)&v27 + 1) + 8 * i), v17);
          if (v22 <= 0x100000000)
            v23 = 0;
          else
            v23 = v22;
          v19 |= v23;
        }
        v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }
    v24 = _Block_copy(a6);
    v25 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v25 = off_1E34BF748;
    *((_QWORD *)v25 + 1) = v24;
    v35[0] = v25;
    WebKit::WebsiteDataStore::renameOriginInWebsiteData((WebKit::WebsiteDataStore *)&self->_websiteDataStore, v33, v31, v19, (uint64_t *)v35);
    v26 = v35[0];
    v35[0] = 0;
    if (v26)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v26 + 8))(v26);
    _Block_release(0);
    if (v32 != -1)
      ((void (*)(WTF::StringImpl **, uint64_t *))off_1E34BF138[v32])(v35, v31);
    if (v34 != -1)
      ((void (*)(WTF::StringImpl **, uint64_t *))off_1E34BF138[v34])(v35, v33);
  }
  else
  {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (BOOL)_networkProcessHasEntitlementForTesting:(id)a3
{
  ObjectStorage<WebKit::WebsiteDataStore> *p_websiteDataStore;
  WTF::StringImpl *v4;
  char HasEntitlementForTesting;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  p_websiteDataStore = &self->_websiteDataStore;
  MEMORY[0x19AEABCC8](&v8, a3);
  HasEntitlementForTesting = WebKit::WebsiteDataStore::networkProcessHasEntitlementForTesting((WebKit::WebsiteDataStore *)p_websiteDataStore, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  return HasEntitlementForTesting;
}

- (void)_setUserAgentStringQuirkForTesting:(id)a3 withUserAgent:(id)a4 completionHandler:(id)a5
{
  int v7;
  void *v8;
  _QWORD *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _QWORD *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;

  v7 = (int)self;
  MEMORY[0x19AEABCC8](&v15, a3);
  MEMORY[0x19AEABCC8](&v14, a4);
  v8 = _Block_copy(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BF770;
  v9[1] = v8;
  v13 = v9;
  WebKit::WebsiteDataStore::setUserAgentStringQuirkForTesting(v7 + 8, (WebCore::RegistrableDomain *)&v15, &v14, (uint64_t *)&v13);
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  _Block_release(0);
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v10);
    else
      *(_DWORD *)v12 -= 2;
  }
}

- (void)_setPrivateTokenIPCForTesting:(BOOL)a3
{
  WebKit::WebsiteDataStore::setPrivateTokenIPCForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, a3);
}

- (_WKWebsiteDataStoreDelegate)_delegate
{
  _WKWebsiteDataStoreDelegate *WeakRetained;
  _WKWebsiteDataStoreDelegate *v3;

  WeakRetained = (_WKWebsiteDataStoreDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (_WKWebsiteDataStoreConfiguration)_configuration
{
  const void *v2;
  _WKWebsiteDataStoreConfiguration *v3;
  uint64_t v4;
  uint64_t v6;

  WebKit::WebsiteDataStoreConfiguration::copy(*(WebKit::WebsiteDataStoreConfiguration **)&self->_anon_38[160], (uint64_t)&v6);
  v2 = *(const void **)(v6 + 8);
  if (v2)
    CFRetain(*(CFTypeRef *)(v6 + 8));
  v3 = (id)CFMakeCollectable(v2);
  v4 = v6;
  v6 = 0;
  if (v4)
    CFRelease(*(CFTypeRef *)(v4 + 8));
  return v3;
}

+ (OpaqueWKNotificationManager)_sharedServiceWorkerNotificationManager
{
  return (OpaqueWKNotificationManager *)*((_QWORD *)WebKit::WebNotificationManagerProxy::sharedServiceWorkerManager((WebKit::WebNotificationManagerProxy *)a1)
                                        + 1);
}

- (void)_trustServerForLocalPCMTesting:(__SecTrust *)a3
{
  ObjectStorage<WebKit::WebsiteDataStore> *p_websiteDataStore;
  __SecTrust *v4;
  __SecTrust *v5;
  ObjectStorage<WebKit::WebsiteDataStore> *v6;
  __SecTrust *v7;

  p_websiteDataStore = &self->_websiteDataStore;
  if (a3)
  {
    v5 = a3;
    v6 = p_websiteDataStore;
    CFRetain(a3);
    a3 = v5;
    p_websiteDataStore = v6;
  }
  v7 = a3;
  WebKit::WebsiteDataStore::allowTLSCertificateChainForLocalPCMTesting((WebKit::WebsiteDataStore *)p_websiteDataStore, (const WebCore::CertificateInfo *)&v7);
  v4 = v7;
  v7 = 0;
  if (v4)
    CFRelease(v4);
}

- (void)_setPrivateClickMeasurementDebugModeEnabledForTesting:(BOOL)a3
{
  WebKit::WebsiteDataStore::setPrivateClickMeasurementDebugMode((WebKit::WebsiteDataStore *)&self->_websiteDataStore, a3);
}

- (void)_appBoundDomains:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF8F8;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebsiteDataStore::getAppBoundDomains((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)_appBoundSchemes:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF920;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebsiteDataStore::getAppBoundSchemes((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)_terminateNetworkProcess
{
  WebKit::WebsiteDataStore::terminateNetworkProcess((unsigned int *)self->_websiteDataStore.data.__lx);
}

- (void)_sendNetworkProcessPrepareToSuspend:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF948;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::sendNetworkProcessPrepareToSuspendForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_sendNetworkProcessWillSuspendImminently
{
  WebKit::WebsiteDataStore::sendNetworkProcessWillSuspendImminentlyForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (void)_sendNetworkProcessDidResume
{
  WebKit::WebsiteDataStore::sendNetworkProcessDidResume((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (void)_synthesizeAppIsBackground:(BOOL)a3
{
  _BOOL4 v3;
  WebKit::NetworkProcessProxy *v4;

  v3 = a3;
  v4 = (WebKit::NetworkProcessProxy *)WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  WebKit::NetworkProcessProxy::synthesizeAppIsBackground(v4, v3);
}

- (int)_networkProcessIdentifier
{
  uint64_t v2;

  v2 = *(_QWORD *)(WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore) + 136);
  if (v2)
    return *(_DWORD *)(v2 + 108);
  else
    return 0;
}

+ (void)_makeNextNetworkProcessLaunchFailForTesting
{
  WebKit::nextNetworkProcessLaunchShouldFailForTesting = 1;
}

+ (void)_setNetworkProcessSuspensionAllowedForTesting:(BOOL)a3
{
  WebKit::s_suspensionAllowedForTesting = a3;
}

- (BOOL)_networkProcessExists
{
  return *(_QWORD *)&self->_anon_38[360] != 0;
}

+ (BOOL)_defaultNetworkProcessExists
{
  BOOL result;

  {
    return WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess
        && *(_QWORD *)(WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess + 8) != 0;
  }
  else
  {
    result = 0;
    WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess = 0;
  }
  return result;
}

- (void)_countNonDefaultSessionSets:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF970;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::countNonDefaultSessionSets((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (BOOL)_hasServiceWorkerBackgroundActivityForTesting
{
  return WebKit::WebsiteDataStore::hasServiceWorkerBackgroundActivityForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (void)_getPendingPushMessages:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint8_t *v12;
  uint8_t buf[16];

  v5 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "Getting pending push messages", buf, 2u);
  }
  v6 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v7 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  v8 = _Block_copy(a3);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BF998;
  v9[1] = v8;
  *(_QWORD *)buf = v7;
  v11 = v9;
  v12 = buf;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::GetPendingPushMessages,WTF::CompletionHandler<void ()(WTF::Vector<WebKit::WebPushMessage,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)>>(v6, (uint64_t **)&v12, (uint64_t *)&v11, 0, 0, 1);
  v10 = (uint64_t)v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Block_release(0);
}

- (void)_processPushMessage:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  NSObject *v10;
  uint64_t v11[2];
  _BYTE v12[224];

  WebKit::WebPushMessage::fromDictionary((WebKit::WebPushMessage *)a3, v12);
  if (v12[216])
  {
    v6 = _Block_copy(a4);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BF9C0;
    v7[1] = v6;
    v11[0] = (uint64_t)v7;
    WebKit::WebsiteDataStore::processPushMessage((uint64_t)&self->_websiteDataStore, (uint64_t)v12, v11);
    v8 = v11[0];
    v11[0] = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
  }
  else
  {
    v10 = qword_1ECE716B8;
    if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_196BCC000, v10, OS_LOG_TYPE_ERROR, "Asked to handle an invalid push message", (uint8_t *)v11, 2u);
    }
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  std::__optional_destruct_base<WebKit::WebPushMessage,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v12, v9);
}

- (void)_processPersistentNotificationClick:(id)a3 completionHandler:(id)a4
{
  int v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  WTF *v18;
  _BYTE buf[12];
  _QWORD v20[30];
  unsigned __int8 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WebCore::NotificationData::fromDictionary((WebCore::NotificationData *)a3, (NSDictionary *)a2);
  v6 = v21;
  if (!v21)
  {
    v11 = qword_1ECE716B8;
    if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_196BCC000, v11, OS_LOG_TYPE_ERROR, "Asked to handle a persistent notification click with an invalid notification dictionary representation", buf, 2u);
    }
    goto LABEL_17;
  }
  if (v20[0] && *(_DWORD *)(v20[0] + 4) && *(_BYTE *)(*(_QWORD *)&self->_anon_38[160] + 483))
  {
    v7 = qword_1ECE716B8;
    if (!os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT)
      || (*(_WORD *)buf = 0,
          _os_log_impl(&dword_196BCC000, v7, OS_LOG_TYPE_DEFAULT, "Sending persistent notification clicked with default action URL. Requesting navigation to it now.", buf, 2u), v21))
    {
      (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)&self->_anon_38[344] + 88))(*(_QWORD *)&self->_anon_38[344], v20);
LABEL_17:
      (*((void (**)(id, BOOL))a4 + 2))(a4, v6 != 0);
      goto LABEL_24;
    }
LABEL_27:
    __break(1u);
  }
  v8 = qword_1ECE716B8;
  if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
  {
    WTF::String::utf8();
    if (v18)
      v9 = (char *)v18 + 16;
    else
      v9 = 0;
    *(_DWORD *)buf = 136642819;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEFAULT, "Sending persistent notification click from origin %{sensitive}s to network process to handle", buf, 0xCu);
    if (v18)
    {
      if (*(_DWORD *)v18 == 1)
        WTF::fastFree(v18, v10);
      else
        --*(_DWORD *)v18;
    }
    if (!v21)
      goto LABEL_27;
  }
  v20[24] = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  v13 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  if (!v21)
    goto LABEL_27;
  v14 = v13;
  v15 = _Block_copy(a4);
  v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v16 = off_1E34BF9E8;
  v16[1] = v15;
  *(_QWORD *)buf = v16;
  WebKit::NetworkProcessProxy::processNotificationEvent(v14, (uint64_t)v20, 0, (uint64_t *)buf);
  v17 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Block_release(0);
LABEL_24:
  if (v21)
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v20, v12);
}

- (void)_processPersistentNotificationClose:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  WTF *v15;
  _BYTE buf[12];
  _BYTE v17[240];
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WebCore::NotificationData::fromDictionary((WebCore::NotificationData *)a3, (NSDictionary *)a2);
  v6 = qword_1ECE716B8;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_DEFAULT))
    {
      WTF::String::utf8();
      v7 = v15 ? (uint64_t)v15 + 16 : 0;
      *(_DWORD *)buf = 136642819;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "Sending persistent notification close from origin %{sensitive}s to network process to handle", buf, 0xCu);
      if (v15)
      {
        if (*(_DWORD *)v15 == 1)
          WTF::fastFree(v15, v8);
        else
          --*(_DWORD *)v15;
      }
    }
    v10 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
    if (!v18)
      __break(1u);
    v11 = v10;
    v12 = _Block_copy(a4);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v13 = off_1E34BFA10;
    v13[1] = v12;
    *(_QWORD *)buf = v13;
    WebKit::NetworkProcessProxy::processNotificationEvent(v11, (uint64_t)v17, 1, (uint64_t *)buf);
    v14 = *(_QWORD *)buf;
    *(_QWORD *)buf = 0;
    if (v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
    _Block_release(0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1ECE716B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_196BCC000, v6, OS_LOG_TYPE_ERROR, "Asked to handle a persistent notification click with an invalid notification dictionary representation", buf, 2u);
    }
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  if (v18)
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v17, v9);
}

- (void)_getAllBackgroundFetchIdentifiers:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;

  v5 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v6 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  v7 = _Block_copy(a3);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = off_1E34BFA38;
  v8[1] = v7;
  v10 = v8;
  WebKit::NetworkProcessProxy::getAllBackgroundFetchIdentifiers(v5, v6, (uint64_t *)&v10);
  v9 = (uint64_t)v10;
  v10 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  _Block_release(0);
}

- (void)_getBackgroundFetchState:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15;

  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABCC8](&v15, a3);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFA60;
  v10[1] = v9;
  v14 = v10;
  WebKit::NetworkProcessProxy::getBackgroundFetchState(v7, v8, (uint64_t *)&v15, (uint64_t *)&v14);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_abortBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15;
  _QWORD v16[5];
  uint64_t *v17[2];
  uint64_t v18;

  v4 = a4;
  if (!a4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___abortBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___abortBackgroundFetch_completionHandler__E4__54_e5_v8__0l;
    v4 = v16;
  }
  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABCC8](&v15, a3);
  v9 = _Block_copy(v4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFA88;
  v10[1] = v9;
  v14 = v10;
  v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::AbortBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_pauseBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15;
  _QWORD v16[5];
  uint64_t *v17[2];
  uint64_t v18;

  v4 = a4;
  if (!a4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___pauseBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___pauseBackgroundFetch_completionHandler__E4__56_e5_v8__0l;
    v4 = v16;
  }
  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABCC8](&v15, a3);
  v9 = _Block_copy(v4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFAB0;
  v10[1] = v9;
  v14 = v10;
  v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::PauseBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_resumeBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15;
  _QWORD v16[5];
  uint64_t *v17[2];
  uint64_t v18;

  v4 = a4;
  if (!a4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __74__WKWebsiteDataStore_WKPrivate___resumeBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c88_ZTSKZ74__WKWebsiteDataStore_WKPrivate___resumeBackgroundFetch_completionHandler__E4__58_e5_v8__0l;
    v4 = v16;
  }
  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABCC8](&v15, a3);
  v9 = _Block_copy(v4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFAD8;
  v10[1] = v9;
  v14 = v10;
  v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::ResumeBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_clickBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15;
  _QWORD v16[5];
  uint64_t *v17[2];
  uint64_t v18;

  v4 = a4;
  if (!a4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___clickBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___clickBackgroundFetch_completionHandler__E4__60_e5_v8__0l;
    v4 = v16;
  }
  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABCC8](&v15, a3);
  v9 = _Block_copy(v4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFB00;
  v10[1] = v9;
  v14 = v10;
  v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::ClickBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)_storeServiceWorkerRegistrations:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BFB28;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::storeServiceWorkerRegistrations((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_setServiceWorkerOverridePreferences:(id)a3
{
  char *v4;
  uint64_t v5;

  if (a3)
    v4 = (char *)a3 + 8;
  else
    v4 = 0;
  if (a3)
    CFRetain(*((CFTypeRef *)a3 + 2));
  v5 = *(_QWORD *)&self->_anon_38[392];
  *(_QWORD *)&self->_anon_38[392] = v4;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_scopeURL:(id)a3 hasPushSubscriptionForTesting:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15[5];
  uint64_t *v16[2];
  uint64_t v17;

  v6 = _Block_copy(a4);
  v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  v8 = *(_QWORD *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19AEABB18](v15, a3);
  v9 = _Block_copy(v6);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BFB50;
  v10[1] = v9;
  v14 = v10;
  v17 = v8;
  v16[0] = &v17;
  v16[1] = (uint64_t *)v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::HasPushSubscriptionForTesting,WTF::CompletionHandler<void ()(BOOL)>>(v7, v16, (uint64_t *)&v14, 0, 0, 1);
  v11 = (uint64_t)v14;
  v14 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v15[0];
  v15[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  _Block_release(v6);
}

- (void)_originDirectoryForTesting:(id)a3 topOrigin:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  unint64_t v10;
  int v11;
  void *v12;
  const WTF::URL *v13;
  const WTF::URL *v14;
  _QWORD *v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  _QWORD *v20;
  WTF::StringImpl *v21[5];
  WTF::StringImpl *v22[5];
  uint64_t v23[3];
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = WebKit::toWebsiteDataType((WebKit *)a5, (NSString *)a2);
  if (HIDWORD(v10))
  {
    v11 = v10;
    v12 = _Block_copy(a6);
    MEMORY[0x19AEABB18](v22, a4);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness((WebCore::SecurityOriginData *)v22, v13);
    MEMORY[0x19AEABB18](v21, a3);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness((WebCore::SecurityOriginData *)v21, v14);
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v15 = off_1E34BFB78;
    v15[1] = v12;
    v20 = v15;
    WebKit::WebsiteDataStore::originDirectoryForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, v23, v11, (uint64_t *)&v20);
    v16 = (uint64_t)v20;
    v20 = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    _Block_release(0);
    if (v26 != -1)
      ((void (*)(_QWORD **, uint64_t *))off_1E34BF138[v26])(&v20, &v25);
    v26 = -1;
    if (v24 != -1)
      ((void (*)(_QWORD **, uint64_t *))off_1E34BF138[v24])(&v20, v23);
    v24 = -1;
    v18 = v21[0];
    v21[0] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v17);
      else
        *(_DWORD *)v18 -= 2;
    }
    v19 = v22[0];
    v22[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v17);
      else
        *(_DWORD *)v19 -= 2;
    }
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

- (void)_setBackupExclusionPeriodForTesting:(double)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BFBA0;
  v7[1] = v6;
  v9 = v7;
  WebKit::WebsiteDataStore::setBackupExclusionPeriodForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v9, a3);
  v8 = (uint64_t)v9;
  v9 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (NSString)_webPushPartition
{
  if (*(_QWORD *)(*(_QWORD *)&self->_anon_38[160] + 504))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_setCompletionHandlerForRemovalFromNetworkProcess:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BFBC8;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebsiteDataStore::setCompletionHandlerForRemovalFromNetworkProcess((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)_setRestrictedOpenerTypeForTesting:(unsigned __int8)a3 forDomain:(id)a4
{
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11[2];

  MEMORY[0x19AEABCC8](&v10, a4);
  v6 = v10;
  if (v10 && *((_DWORD *)v10 + 1))
  {
    v10 = 0;
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v6 = v11[1];
  }
  v11[0] = v6;
  WebKit::WebsiteDataStore::setRestrictedOpenerTypeForDomainForTesting((uint64_t)&self->_websiteDataStore, v11, a3);
  v8 = v11[0];
  v11[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v7);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 modifiedSince:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(const void *)a1 modifiedSince:completionHandler:
{
  void *v2;

  *a1 = off_1E34BF400;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 forDataRecords:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(const void *)a1 forDataRecords:completionHandler:
{
  void *v2;

  *a1 = off_1E34BF428;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

@end

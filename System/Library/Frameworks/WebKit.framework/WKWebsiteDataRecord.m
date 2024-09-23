@implementation WKWebsiteDataRecord

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebsiteDataRecord accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebsiteDataRecord accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebsiteDataRecord::~WebsiteDataRecord((WebKit::WebsiteDataRecord *)&self->_websiteDataRecord.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebsiteDataRecord;
    -[WKWebsiteDataRecord dealloc](&v5, sel_dealloc);
  }
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSSet *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _WKWebsiteDataSize *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[WKWebsiteDataRecord displayName](self, "displayName");
  v7 = -[WKWebsiteDataRecord dataTypes](self, "dataTypes");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeDiskCache")))
    objc_msgSend(v8, "addObject:", CFSTR("Disk Cache"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeFetchCache")))
    objc_msgSend(v8, "addObject:", CFSTR("Fetch Cache"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeMemoryCache")))
    objc_msgSend(v8, "addObject:", CFSTR("Memory Cache"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeOfflineWebApplicationCache")))
    objc_msgSend(v8, "addObject:", CFSTR("Offline Web Application Cache"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeCookies")))
    objc_msgSend(v8, "addObject:", CFSTR("Cookies"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeSessionStorage")))
    objc_msgSend(v8, "addObject:", CFSTR("Session Storage"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeLocalStorage")))
    objc_msgSend(v8, "addObject:", CFSTR("Local Storage"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeWebSQLDatabases")))
    objc_msgSend(v8, "addObject:", CFSTR("Web SQL"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeIndexedDBDatabases")))
    objc_msgSend(v8, "addObject:", CFSTR("IndexedDB"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeServiceWorkerRegistrations")))
    objc_msgSend(v8, "addObject:", CFSTR("Service Worker Registrations"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypeHSTSCache")))
    objc_msgSend(v8, "addObject:", CFSTR("HSTS Cache"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeMediaKeys")))
    objc_msgSend(v8, "addObject:", CFSTR("Media Keys"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeHashSalt")))
    objc_msgSend(v8, "addObject:", CFSTR("Hash Salt"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeSearchFieldRecentSearches")))
    objc_msgSend(v8, "addObject:", CFSTR("Search Field Recent Searches"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("WKWebsiteDataTypeFileSystem")))
    objc_msgSend(v8, "addObject:", CFSTR("File System"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypeResourceLoadStatistics")))
    objc_msgSend(v8, "addObject:", CFSTR("Resource Load Statistics"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypeCredentials")))
    objc_msgSend(v8, "addObject:", CFSTR("Credentials"));
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypeAdClickAttributions"))
    || -[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypePrivateClickMeasurements")))
  {
    objc_msgSend(v8, "addObject:", CFSTR("Private Click Measurements"));
  }
  if (-[NSSet containsObject:](v7, "containsObject:", CFSTR("_WKWebsiteDataTypeAlternativeServices")))
    objc_msgSend(v8, "addObject:", CFSTR("Alternative Services"));
  v9 = objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  if (v8)
    CFRelease(v8);
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; displayName = %@; dataTypes = { %@ }"),
                  v5,
                  self,
                  v6,
                  v9);
  v11 = -[WKWebsiteDataRecord _dataSize](self, "_dataSize");
  if (v11)
    objc_msgSend(v10, "appendFormat:", CFSTR("; _dataSize = { %llu bytes }"),
      -[_WKWebsiteDataSize totalSize](v11, "totalSize"));
  objc_msgSend(v10, "appendString:", CFSTR(">"));
  return (NSString *)(id)CFMakeCollectable(v10);
}

- (NSString)displayName
{
  if (*(_QWORD *)&self->_websiteDataRecord.data.__lx[16])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSSet)dataTypes
{
  int v2;
  id v3;
  void *v4;

  v2 = *(_DWORD *)&self->_websiteDataRecord.data.__lx[24];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  if ((v2 & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("WKWebsiteDataTypeCookies"));
  if ((v2 & 2) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeDiskCache"));
  if ((v2 & 0x8000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeFetchCache"));
  if ((v2 & 4) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeMemoryCache"));
  if ((v2 & 8) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeOfflineWebApplicationCache"));
  if ((v2 & 0x10) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeSessionStorage"));
  if ((v2 & 0x20) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeLocalStorage"));
  if ((v2 & 0x40) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeWebSQLDatabases"));
  if ((v2 & 0x80) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeIndexedDBDatabases"));
  if ((v2 & 0x4000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeServiceWorkerRegistrations"));
  if ((v2 & 0x80000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeFileSystem"));
  if ((v2 & 0x200) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("_WKWebsiteDataTypeHSTSCache"));
  if ((v2 & 0x100) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeMediaKeys"));
  if ((v2 & 0x400) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeSearchFieldRecentSearches"));
  if ((v2 & 0x10000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("WKWebsiteDataTypeHashSalt"));
  if ((v2 & 0x1000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("_WKWebsiteDataTypeResourceLoadStatistics"));
  if ((v2 & 0x2000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("_WKWebsiteDataTypeCredentials"));
  if ((v2 & 0x20000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("_WKWebsiteDataTypePrivateClickMeasurements"));
  if ((v2 & 0x40000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("_WKWebsiteDataTypeAlternativeServices"));
  return (NSSet *)(id)CFMakeCollectable(v4);
}

- (Object)_apiObject
{
  return (Object *)&self->_websiteDataRecord;
}

- (_WKWebsiteDataSize)_dataSize
{
  _WKWebsiteDataSize *result;

  if (!LOBYTE(self[1].super.isa))
    return 0;
  result = [_WKWebsiteDataSize alloc];
  if (LOBYTE(self[1].super.isa))
    return (_WKWebsiteDataSize *)(id)CFMakeCollectable(-[_WKWebsiteDataSize initWithSize:](result, "initWithSize:", &self->_websiteDataRecord.data.__lx[32]));
  __break(1u);
  return result;
}

- (id)_originsStrings
{
  id v3;
  uint64_t v4;
  uint64_t *p_websiteDataRecord;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  WebCore::SecurityOriginData *v9;
  WebCore::SecurityOriginData *v10;
  WTF::StringImpl *v11;
  const __CFString *v12;
  WTF::StringImpl *v13;
  WebCore::SecurityOriginData *v15[2];
  WTF::StringImpl *v16;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = *(_QWORD *)self[1]._websiteDataRecord.data.__lx;
  p_websiteDataRecord = (uint64_t *)&self[1]._websiteDataRecord;
  v4 = v6;
  if (v6)
    v7 = *(unsigned int *)(v4 - 12);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(v3, "initWithCapacity:", v7);
  v15[0] = WTF::HashTable<WebCore::SecurityOriginData,WebCore::SecurityOriginData,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>>::begin(p_websiteDataRecord);
  v15[1] = v9;
  if (*p_websiteDataRecord)
    v10 = (WebCore::SecurityOriginData *)(*p_websiteDataRecord + 32 * *(unsigned int *)(*p_websiteDataRecord - 4));
  else
    v10 = 0;
  while (v15[0] != v10)
  {
    WebCore::SecurityOriginData::toString(v15[0]);
    if (!v16)
    {
      v12 = &stru_1E351F1B8;
LABEL_14:
      objc_msgSend(v8, "addObject:", v12);
      goto LABEL_15;
    }
    v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v13 = v16;
    v16 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v11);
        if (!v12)
          goto LABEL_15;
        goto LABEL_14;
      }
      *(_DWORD *)v13 -= 2;
    }
    if (v12)
      goto LABEL_14;
LABEL_15:
    v15[0] = (WebCore::SecurityOriginData *)((char *)v15[0] + 32);
    WTF::HashTableConstIterator<WTF::HashTable<WebCore::SecurityOriginData,WebCore::SecurityOriginData,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>>,WebCore::SecurityOriginData,WebCore::SecurityOriginData,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>>::skipEmptyBuckets(v15);
  }
  return (id)(id)CFMakeCollectable(v8);
}

@end

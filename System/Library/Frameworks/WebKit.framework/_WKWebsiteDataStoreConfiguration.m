@implementation _WKWebsiteDataStoreConfiguration

- (Object)_apiObject
{
  return (Object *)&self->_configuration;
}

- (void)setNetworkCacheSpeculativeValidationEnabled:(BOOL)a3
{
  self[4]._configuration.data.__lx[32] = a3;
}

- (void)setFastServerTrustEvaluationEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[29] = a3;
}

- (BOOL)isPersistent
{
  return self->_configuration.data.__lx[16];
}

- (_WKWebsiteDataStoreConfiguration)init
{
  _WKWebsiteDataStoreConfiguration *v2;
  _WKWebsiteDataStoreConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  v2 = -[_WKWebsiteDataStoreConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *(_QWORD *)(WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((uint64_t)-[_WKWebsiteDataStoreConfiguration _apiObject](v2, "_apiObject"), 1, 1)+ 8) = v2;
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebsiteDataStoreConfiguration> *))self->_configuration.data.__lx)(&self->_configuration);
    v4.receiver = self;
    v4.super_class = (Class)_WKWebsiteDataStoreConfiguration;
    -[_WKWebsiteDataStoreConfiguration dealloc](&v4, sel_dealloc);
  }
}

- (id)initNonPersistentConfiguration
{
  _WKWebsiteDataStoreConfiguration *v2;
  _WKWebsiteDataStoreConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  v2 = -[_WKWebsiteDataStoreConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *(_QWORD *)(WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((uint64_t)-[_WKWebsiteDataStoreConfiguration _apiObject](v2, "_apiObject"), 0, 1)+ 8) = v2;
  return v3;
}

- (_WKWebsiteDataStoreConfiguration)initWithIdentifier:(id)a3
{
  NSUUID *v4;
  _WKWebsiteDataStoreConfiguration *v5;
  void *v6;
  char *v7;
  void *v8;
  WTF *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  WTF *v13;
  objc_super v14;
  unint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  v5 = -[_WKWebsiteDataStoreConfiguration init](&v14, sel_init);
  if (v5)
  {
    if (!a3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier is nil"));
    WTF::UUID::fromNSUUID((WTF::UUID *)a3, v4);
    if (!v16 || v15 <= 1)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      MEMORY[0x19AEABCC8](&v12, objc_msgSend(a3, "UUIDString"));
      WTF::String::utf8();
      if (v13)
        v7 = (char *)v13 + 16;
      else
        v7 = 0;
      objc_msgSend(v6, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier (%s) is invalid for data store"), v7);
      v9 = v13;
      v13 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 1)
          WTF::fastFree(v9, v8);
        else
          --*(_DWORD *)v9;
      }
      v10 = v12;
      v12 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, (WTF::StringImpl *)v8);
        else
          *(_DWORD *)v10 -= 2;
      }
      if (!v16)
        __break(1u);
    }
    *((_QWORD *)WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((WebKit::WebsiteDataStoreConfiguration *)-[_WKWebsiteDataStoreConfiguration _apiObject](v5, "_apiObject"), (const WTF::UUID *)&v15)+ 1) = v5;
  }
  return v5;
}

- (NSURL)_webStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[2]._configuration.data.__lx[16])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setWebStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _webStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _webStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[16];
  *(_QWORD *)&self[2]._configuration.data.__lx[16] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_indexedDBDatabaseDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)self[2]._configuration.data.__lx)
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setIndexedDBDatabaseDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _indexedDBDatabaseDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _indexedDBDatabaseDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[2]._configuration.data.__lx;
  *(_QWORD *)self[2]._configuration.data.__lx = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)networkCacheDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[2]._configuration.data.__lx[40])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setNetworkCacheDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set networkCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set networkCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[40];
  *(_QWORD *)&self[2]._configuration.data.__lx[40] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)deviceIdHashSaltsStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[1]._configuration.data.__lx[40])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setDeviceIdHashSaltsStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set deviceIdHashSaltsStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set deviceIdHashSaltsStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[40];
  *(_QWORD *)&self[1]._configuration.data.__lx[40] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_webSQLDatabaseDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[3]._configuration.data.__lx[8])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setWebSQLDatabaseDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _webSQLDatabaseDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _webSQLDatabaseDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[3]._configuration.data.__lx[8];
  *(_QWORD *)&self[3]._configuration.data.__lx[8] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)httpProxy
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setHTTPProxy:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6[5];

  MEMORY[0x19AEABB18](v6, a3);
  WTF::URL::operator=((uint64_t)&self[5]._configuration.data.__lx[8], (WTF::StringImpl *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSURL)httpsProxy
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setHTTPSProxy:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6[5];

  MEMORY[0x19AEABB18](v6, a3);
  WTF::URL::operator=((uint64_t)&self[6], (WTF::StringImpl *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSURL)_cookieStorageFile
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[1]._configuration.data.__lx[32])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 0);
}

- (void)_setCookieStorageFile:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _cookieStorageFile on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _cookieStorageFile on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  if (objc_msgSend(a3, "hasDirectoryPath"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The cookie storage path must point to a file, not a directory."));
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[32];
  *(_QWORD *)&self[1]._configuration.data.__lx[32] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_resourceLoadStatisticsDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (self[3].super.isa)
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setResourceLoadStatisticsDirectory:(id)a3
{
  WTF::StringImpl *v5;
  objc_class *v6;
  Class isa;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _resourceLoadStatisticsDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _resourceLoadStatisticsDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  isa = self[3].super.isa;
  self[3].super.isa = v6;
  if (isa)
  {
    v8 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v5);
      isa = v10;
      v10 = 0;
      if (!isa)
        return;
      v8 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v9);
        return;
      }
    }
    *(_DWORD *)isa = v8;
  }
}

- (NSURL)_cacheStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[1]._configuration.data.__lx[24])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setCacheStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _cacheStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _cacheStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[24];
  *(_QWORD *)&self[1]._configuration.data.__lx[24] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_serviceWorkerRegistrationDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)self[3]._configuration.data.__lx)
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setServiceWorkerRegistrationDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set _serviceWorkerRegistrationDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set _serviceWorkerRegistrationDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[3]._configuration.data.__lx;
  *(_QWORD *)self[3]._configuration.data.__lx = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (BOOL)serviceWorkerProcessTerminationDelayEnabled
{
  return self[6]._configuration.data.__lx[30];
}

- (void)setServiceWorkerProcessTerminationDelayEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[30] = a3;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[4]._configuration.data.__lx[40];
  *(_QWORD *)&self[4]._configuration.data.__lx[40] = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (NSString)sourceApplicationBundleIdentifier
{
  if (*(_QWORD *)&self[4]._configuration.data.__lx[40])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  if (self[5].super.isa)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  objc_class *v5;
  Class isa;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  isa = self[5].super.isa;
  self[5].super.isa = v5;
  if (isa)
  {
    v7 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v4);
      isa = v9;
      v9 = 0;
      if (!isa)
        return;
      v7 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v8);
        return;
      }
    }
    *(_DWORD *)isa = v7;
  }
}

- (NSURL)applicationCacheDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[1]._configuration.data.__lx[8])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setApplicationCacheDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set applicationCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set applicationCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[8];
  *(_QWORD *)&self[1]._configuration.data.__lx[8] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSString)applicationCacheFlatFileSubdirectoryName
{
  if (*(_QWORD *)self[1]._configuration.data.__lx)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setApplicationCacheFlatFileSubdirectoryName:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set applicationCacheFlatFileSubdirectoryName on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set applicationCacheFlatFileSubdirectoryName on a _WKWebsiteDataStoreConfiguration created with identifier"));
  MEMORY[0x19AEABCC8](&v10, a3);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[1]._configuration.data.__lx;
  *(_QWORD *)self[1]._configuration.data.__lx = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)mediaCacheDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[2]._configuration.data.__lx[24])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setMediaCacheDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set mediaCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set mediaCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[24];
  *(_QWORD *)&self[2]._configuration.data.__lx[24] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)mediaKeysStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[2]._configuration.data.__lx[32])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setMediaKeysStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set mediaKeysStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set mediaKeysStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[32];
  *(_QWORD *)&self[2]._configuration.data.__lx[32] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)hstsStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)self[2]._anon_8)
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setHSTSStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set hstsStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set hstsStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[2]._anon_8;
  *(_QWORD *)self[2]._anon_8 = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)alternativeServicesStorageDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self[1]._configuration.data.__lx[16])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)setAlternativeServicesStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set alternativeServicesDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set alternativeServicesStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[16];
  *(_QWORD *)&self[1]._configuration.data.__lx[16] = v6;
  if (v7)
  {
    v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7)
        return;
      v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)generalStorageDirectory
{
  NSURL *result;

  result = (NSURL *)self[2].super.isa;
  if (result)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", WTF::StringImpl::operator NSString *(), 1);
  return result;
}

- (void)setGeneralStorageDirectory:(id)a3
{
  WTF::StringImpl *v5;
  objc_class *v6;
  Class isa;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (!self->_configuration.data.__lx[16])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot set generalStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."));
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Cannot set generalStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"));
  if (a3)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  }
  MEMORY[0x19AEABCC8](&v10, objc_msgSend(a3, "path"));
  v6 = v10;
  v10 = 0;
  isa = self[2].super.isa;
  self[2].super.isa = v6;
  if (isa)
  {
    v8 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v5);
      isa = v10;
      v10 = 0;
      if (!isa)
        return;
      v8 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v9);
        return;
      }
    }
    *(_DWORD *)isa = v8;
  }
}

- (int64_t)unifiedOriginStorageLevel
{
  int v2;

  v2 = self->_configuration.data.__lx[17];
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (void)setUnifiedOriginStorageLevel:(int64_t)a3
{
  unsigned __int8 v3;

  v3 = a3 == 1;
  if (a3 == 2)
    v3 = 2;
  self->_configuration.data.__lx[17] = v3;
}

- (NSString)webPushPartitionString
{
  if (*(_QWORD *)self[8]._anon_8)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setWebPushPartitionString:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)self[8]._anon_8;
  *(_QWORD *)self[8]._anon_8 = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)deviceManagementRestrictionsEnabled
{
  return self[6]._configuration.data.__lx[24];
}

- (void)setDeviceManagementRestrictionsEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[24] = a3;
}

- (BOOL)networkCacheSpeculativeValidationEnabled
{
  return self[4]._configuration.data.__lx[32];
}

- (BOOL)fastServerTrustEvaluationEnabled
{
  return self[6]._configuration.data.__lx[29];
}

- (unint64_t)perOriginStorageQuota
{
  return *(_QWORD *)&self[3]._configuration.data.__lx[24];
}

- (void)setPerOriginStorageQuota:(unint64_t)a3
{
  *(_QWORD *)&self[3]._configuration.data.__lx[24] = a3;
}

- (NSNumber)originQuotaRatio
{
  if (self[3]._configuration.data.__lx[40])
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[3]._configuration.data.__lx[32]);
  else
    return 0;
}

- (void)setOriginQuotaRatio:(id)a3
{
  double v4;
  double v5;
  unsigned __int8 v7;

  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    v5 = v4;
    if (v4 < 0.0 || v4 > 1.0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("OriginQuotaRatio must be in the range [0.0, 1]"));
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v5 = 0.0;
  }
  *(double *)&self[3]._configuration.data.__lx[32] = v5;
  self[3]._configuration.data.__lx[40] = v7;
}

- (NSNumber)totalQuotaRatio
{
  if (self[4]._anon_8[0])
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[4].super.isa);
  else
    return 0;
}

- (void)setTotalQuotaRatio:(id)a3
{
  double v4;
  objc_class *v5;
  unsigned __int8 v7;

  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    v5 = *(objc_class **)&v4;
    if (v4 < 0.0 || v4 > 1.0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("TotalQuotaRatio must be in the range [0.0, 1]"));
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  self[4].super.isa = v5;
  self[4]._anon_8[0] = v7;
}

- (NSNumber)standardVolumeCapacity
{
  if (self[4]._configuration.data.__lx[8])
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)self[4]._configuration.data.__lx);
  else
    return 0;
}

- (void)setStandardVolumeCapacity:(id)a3
{
  uint64_t v4;
  unsigned __int8 v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "unsignedLongLongValue");
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)self[4]._configuration.data.__lx = v4;
  self[4]._configuration.data.__lx[8] = v5;
}

- (NSNumber)volumeCapacityOverride
{
  if (self[4]._configuration.data.__lx[24])
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&self[4]._configuration.data.__lx[16]);
  else
    return 0;
}

- (void)setVolumeCapacityOverride:(id)a3
{
  uint64_t v4;
  unsigned __int8 v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "unsignedLongLongValue");
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)&self[4]._configuration.data.__lx[16] = v4;
  self[4]._configuration.data.__lx[24] = v5;
}

- (BOOL)isDeclarativeWebPushEnabled
{
  return self[7]._configuration.data.__lx[35];
}

- (void)setIsDeclarativeWebPushEnabled:(BOOL)a3
{
  self[7]._configuration.data.__lx[35] = a3;
}

- (unint64_t)testSpeedMultiplier
{
  return LODWORD(self[7].super.isa);
}

- (void)setTestSpeedMultiplier:(unint64_t)a3
{
  LODWORD(self[7].super.isa) = a3;
}

- (BOOL)suppressesConnectionTerminationOnSystemChange
{
  return self[6]._configuration.data.__lx[32];
}

- (void)setSuppressesConnectionTerminationOnSystemChange:(BOOL)a3
{
  self[6]._configuration.data.__lx[32] = a3;
}

- (BOOL)allowsServerPreconnect
{
  return self[6]._configuration.data.__lx[33];
}

- (void)setAllowsServerPreconnect:(BOOL)a3
{
  self[6]._configuration.data.__lx[33] = a3;
}

- (NSString)boundInterfaceIdentifier
{
  if (*(_QWORD *)self[5]._anon_8)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)self[5]._anon_8;
  *(_QWORD *)self[5]._anon_8 = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)allowsCellularAccess
{
  return self[6]._configuration.data.__lx[27];
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self[6]._configuration.data.__lx[27] = a3;
}

- (BOOL)legacyTLSEnabled
{
  return self[6]._configuration.data.__lx[28];
}

- (void)setLegacyTLSEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[28] = a3;
}

- (NSDictionary)proxyConfiguration
{
  return *(NSDictionary **)self[8]._configuration.data.__lx;
}

- (NSString)dataConnectionServiceType
{
  if (*(_QWORD *)self[5]._configuration.data.__lx)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setDataConnectionServiceType:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)self[5]._configuration.data.__lx;
  *(_QWORD *)self[5]._configuration.data.__lx = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)preventsSystemHTTPProxyAuthentication
{
  return self[6]._configuration.data.__lx[34];
}

- (void)setPreventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self[6]._configuration.data.__lx[34] = a3;
}

- (BOOL)requiresSecureHTTPSProxyConnection
{
  return self[6]._configuration.data.__lx[35];
}

- (void)setRequiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self[6]._configuration.data.__lx[35] = a3;
}

- (BOOL)shouldRunServiceWorkersOnMainThreadForTesting
{
  return self[6]._configuration.data.__lx[36];
}

- (void)setShouldRunServiceWorkersOnMainThreadForTesting:(BOOL)a3
{
  self[6]._configuration.data.__lx[36] = a3;
}

- (unint64_t)overrideServiceWorkerRegistrationCountTestingValue
{
  if ((*(_QWORD *)&self[6]._configuration.data.__lx[40] & 0xFF00000000) != 0)
    return *(_QWORD *)&self[6]._configuration.data.__lx[40];
  else
    return 0;
}

- (void)setOverrideServiceWorkerRegistrationCountTestingValue:(unint64_t)a3
{
  *(_DWORD *)&self[6]._configuration.data.__lx[40] = a3;
  self[6]._configuration.data.__lx[44] = 1;
}

- (BOOL)_shouldAcceptInsecureCertificatesForWebSockets
{
  return 0;
}

- (void)setProxyConfiguration:(id)a3
{
  const void *v4;
  const void *v5;
  const void *v6;

  v4 = (const void *)objc_msgSend(a3, "copy");
  v5 = v4;
  if (v4)
    CFRetain(v4);
  v6 = *(const void **)self[8]._configuration.data.__lx;
  *(_QWORD *)self[8]._configuration.data.__lx = v5;
  if (v6)
    CFRelease(v6);
}

- (NSURL)standaloneApplicationURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setStandaloneApplicationURL:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6[5];

  MEMORY[0x19AEABB18](v6, a3);
  WTF::URL::operator=((uint64_t)self[7]._anon_8, (WTF::StringImpl *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (BOOL)enableInAppBrowserPrivacyForTesting
{
  return self[7]._configuration.data.__lx[32];
}

- (void)setEnableInAppBrowserPrivacyForTesting:(BOOL)a3
{
  self[7]._configuration.data.__lx[32] = a3;
}

- (BOOL)allowsHSTSWithUntrustedRootCertificate
{
  return self[7]._configuration.data.__lx[33];
}

- (void)setAllowsHSTSWithUntrustedRootCertificate:(BOOL)a3
{
  self[7]._configuration.data.__lx[33] = a3;
}

- (NSString)pcmMachServiceName
{
  if (*(_QWORD *)&self[7]._configuration.data.__lx[40])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setPCMMachServiceName:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[7]._configuration.data.__lx[40];
  *(_QWORD *)&self[7]._configuration.data.__lx[40] = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (NSString)webPushMachServiceName
{
  if (self[8].super.isa)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setWebPushMachServiceName:(id)a3
{
  WTF::StringImpl *v4;
  objc_class *v5;
  Class isa;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  isa = self[8].super.isa;
  self[8].super.isa = v5;
  if (isa)
  {
    v7 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v4);
      isa = v9;
      v9 = 0;
      if (!isa)
        return;
      v7 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v8);
        return;
      }
    }
    *(_DWORD *)isa = v7;
  }
}

- (BOOL)allLoadsBlockedByDeviceManagementRestrictionsForTesting
{
  return self[6]._configuration.data.__lx[25];
}

- (void)setAllLoadsBlockedByDeviceManagementRestrictionsForTesting:(BOOL)a3
{
  self[6]._configuration.data.__lx[25] = a3;
}

- (BOOL)webPushDaemonUsesMockBundlesForTesting
{
  return self[6]._configuration.data.__lx[26];
}

- (void)setWebPushDaemonUsesMockBundlesForTesting:(BOOL)a3
{
  self[6]._configuration.data.__lx[26] = a3;
}

- (BOOL)resourceLoadStatisticsDebugModeEnabled
{
  return self[7]._configuration.data.__lx[34];
}

- (void)setResourceLoadStatisticsDebugModeEnabled:(BOOL)a3
{
  self[7]._configuration.data.__lx[34] = a3;
}

- (NSNumber)defaultTrackingPreventionEnabledOverride
{
  if (*(unsigned __int16 *)&self[8]._configuration.data.__lx[24] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[8]._configuration.data.__lx[24] != 0);
  else
    return 0;
}

- (void)setDefaultTrackingPreventionEnabledOverride:(id)a3
{
  __int16 v4;
  __int16 v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "BOOLValue");
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_WORD *)&self[8]._configuration.data.__lx[24] = v4 | (v5 << 8);
}

- (NSUUID)identifier
{
  if (*(_OWORD *)&self->_configuration.data.__lx[32] == 0)
    return 0;
  else
    return (NSUUID *)WTF::UUID::operator NSUUID *();
}

@end

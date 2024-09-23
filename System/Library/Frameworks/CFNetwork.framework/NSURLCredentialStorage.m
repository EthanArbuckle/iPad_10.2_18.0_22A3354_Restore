@implementation NSURLCredentialStorage

+ (NSURLCredentialStorage)sharedCredentialStorage
{
  if (+[NSURLCredentialStorage sharedCredentialStorage]::sOnce != -1)
    dispatch_once(&+[NSURLCredentialStorage sharedCredentialStorage]::sOnce, &__block_literal_global_14499);
  return (NSURLCredentialStorage *)+[NSURLCredentialStorage sharedCredentialStorage]::sStorage;
}

- (id)_initWithCFURLCredentialStorage:(_CFURLCredentialStorage *)a3
{
  NSURLCredentialStorage *v4;
  NSURLCredentialStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSURLCredentialStorage;
  v4 = -[NSURLCredentialStorage init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_internal = (NSURLCredentialStorageInternal *)CFMakeCollectable(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLCredentialStorage;
  -[NSURLCredentialStorage dealloc](&v3, sel_dealloc);
}

void __49__NSURLCredentialStorage_sharedCredentialStorage__block_invoke()
{
  CFTypeRef v0;

  v0 = CFURLCredentialStorageCreate(0);
  +[NSURLCredentialStorage sharedCredentialStorage]::sStorage = -[NSURLCredentialStorage _initWithCFURLCredentialStorage:]([NSURLCredentialStorage alloc], "_initWithCFURLCredentialStorage:", v0);
  if (v0)
    CFRelease(v0);
}

- (NSURLCredentialStorage)init
{
  return (NSURLCredentialStorage *)-[NSURLCredentialStorage _initWithCFURLCredentialStorage:](self, "_initWithCFURLCredentialStorage:", 0);
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  const __CFAllocator *v6;
  _QWORD *v7;
  __CFDictionary *MutableDictionary;
  _QWORD *v9;
  id v10;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  if (a4)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  MutableDictionary = cfTypeCreateMutableDictionary(v6, a2, CFSTR("kCFURLStorageSessionIsPrivate"), *v7, 0, 0);
  v9 = _CFURLCredentialStorageCreateWithProperties(v6, (const __CFString *)a3, MutableDictionary);
  v10 = -[NSURLCredentialStorage _initWithCFURLCredentialStorage:](self, "_initWithCFURLCredentialStorage:", v9);
  CFRelease(v9);
  CFRelease(MutableDictionary);
  return v10;
}

- (_CFURLCredentialStorage)_CFURLCredentialStorage
{
  return (_CFURLCredentialStorage *)self->_internal;
}

- (BOOL)_useSystemKeychain
{
  NSURLCredentialStorageInternal *internal;

  internal = self->_internal;
  if (!internal)
    return 0;
  if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
    dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
  return (*(uint64_t (**)(uint64_t))(*((_QWORD *)internal + 3) + 80))((uint64_t)internal + 24);
}

- (void)set_useSystemKeychain:(BOOL)a3
{
  NSURLCredentialStorageInternal *internal;
  _BOOL8 v4;

  internal = self->_internal;
  if (internal)
  {
    v4 = a3;
    if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
      dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
    (*(void (**)(uint64_t, _BOOL8))(*((_QWORD *)internal + 3) + 72))((uint64_t)internal + 24, v4);
  }
}

- (NSDictionary)credentialsForProtectionSpace:(NSURLProtectionSpace *)space
{
  NSURLCredentialStorageInternal *internal;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  void *v6;

  internal = self->_internal;
  if (internal)
  {
    v4 = (const __CFDictionary *)CFURLCredentialStorageCopyCredentialsForProtectionSpace((uint64_t)internal, (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace"));
    if (v4)
    {
      v5 = v4;
      if (CFDictionaryGetCount(v4))
      {
        v6 = copyNSCredentialDictForCFCredentialDict(v5);
        CFRelease(v5);
        return (NSDictionary *)v6;
      }
      CFRelease(v5);
    }
  }
  return 0;
}

- (NSDictionary)allCredentials
{
  return (NSDictionary *)-[NSURLCredentialStorage __allCredentialsWithAccessControlGroup:includeLegacyKeychain:](self, 0, 1);
}

- (id)_allCredentialsWithAccessControlGroup:(id)a3 includeLegacyKeychain:(BOOL)a4
{
  return -[NSURLCredentialStorage __allCredentialsWithAccessControlGroup:includeLegacyKeychain:](self, (uint64_t)a3, a4);
}

- (void)setCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  NSURLCredentialStorageInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCredentialStorageSetCredentialForProtectionSpace((uint64_t)internal, (uint64_t)-[NSURLCredential _cfurlcredential](credential, "_cfurlcredential"), (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace"));
}

- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  NSURLCredentialStorageInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCredentialStorageRemoveCredentialForProtectionSpace((uint64_t)internal, (uint64_t)-[NSURLCredential _cfurlcredential](credential, "_cfurlcredential"), (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace"));
}

- (void)removeCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space options:(NSDictionary *)options
{
  NSURLCredentialStorageInternal *internal;
  CFAllocatorRef *v8;
  CFDictionaryRef v10;
  _CFURLCredential *v11;
  _CFURLProtectionSpace *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFAllocator *v15;
  CFStringRef v16;
  char *v17;
  const __CFString *v18;
  CFStringRef v19;
  CFStringRef v20;
  char *v21;
  const __CFString *v22;
  CFStringRef v23;
  CFStringRef v24;
  char *v25;
  const __CFString *v26;
  CFStringRef v27;
  CFStringRef v28;
  CFStringRef v29;
  const void *Value;
  BOOL v31;
  char *v32;
  char *v34;
  const void *v35;
  void *keys;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal)
  {
    v8 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    if (options)
    {
      if (-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("NSURLCredentialStorageRemoveSynchronizableCredentials")))
      {
        keys = CFSTR("kCFCredentialStorageRemoveSynchronizableCredentials");
        v35 = (const void *)*MEMORY[0x1E0C9AE50];
        v10 = CFDictionaryCreate(*v8, (const void **)&keys, &v35, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      }
      else
      {
        v10 = 0;
      }
      internal = self->_internal;
    }
    else
    {
      v10 = 0;
    }
    v11 = -[NSURLCredential _cfurlcredential](credential, "_cfurlcredential");
    v12 = -[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace");
    v13 = DiagnosticLogging::newMsg((uint64_t)&__block_literal_global_17, 1);
    v14 = v13;
    if (v13
      && (*(unsigned int (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v13 + 16))(v13, "RemoveCredential", 0))
    {
      v15 = *v8;
      if (internal)
      {
        if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
          dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
        keys = &off_1E14E4818;
        v16 = CFStringCreateWithCString(v15, "Store", 0x8000100u);
        v17 = (char *)internal + 16;
        v38 = 0;
        v39 = 0;
        v37 = v16;
        v18 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)internal + 2) + 32))((uint64_t)internal + 16);
        v19 = v37;
      }
      else
      {
        keys = &off_1E14E4818;
        v19 = CFStringCreateWithCString(v15, "Store", 0x8000100u);
        v17 = 0;
        v38 = 0;
        v39 = 0;
        v18 = CFSTR("null");
        v37 = v19;
      }
      (*(void (**)(uint64_t, CFStringRef, const __CFString *))(*(_QWORD *)v14 + 64))(v14, v19, v18);
      if (v17 && v18)
        CFRelease(v18);
      AutoString::~AutoString((AutoString *)&keys);
      if (v12)
      {
        if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
          dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
        keys = &off_1E14E4818;
        v20 = CFStringCreateWithCString(v15, "Space", 0x8000100u);
        v21 = (char *)v12 + 16;
        v38 = 0;
        v39 = 0;
        v37 = v20;
        v22 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)v12 + 2) + 32))((uint64_t)v12 + 16);
        v23 = v37;
      }
      else
      {
        keys = &off_1E14E4818;
        v23 = CFStringCreateWithCString(v15, "Space", 0x8000100u);
        v21 = 0;
        v38 = 0;
        v39 = 0;
        v22 = CFSTR("null");
        v37 = v23;
      }
      (*(void (**)(uint64_t, CFStringRef, const __CFString *))(*(_QWORD *)v14 + 64))(v14, v23, v22);
      if (v21 && v22)
        CFRelease(v22);
      AutoString::~AutoString((AutoString *)&keys);
      if (v11)
      {
        if (URLCredential::Class(void)::sOnce_URLCredential != -1)
          dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
        keys = &off_1E14E4818;
        v24 = CFStringCreateWithCString(v15, "Credential", 0x8000100u);
        v25 = (char *)v11 + 16;
        v38 = 0;
        v39 = 0;
        v37 = v24;
        v26 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)v11 + 2) + 32))((uint64_t)v11 + 16);
        v27 = v37;
      }
      else
      {
        keys = &off_1E14E4818;
        v27 = CFStringCreateWithCString(v15, "Credential", 0x8000100u);
        v25 = 0;
        v38 = 0;
        v39 = 0;
        v26 = CFSTR("null");
        v37 = v27;
      }
      (*(void (**)(uint64_t, CFStringRef, const __CFString *))(*(_QWORD *)v14 + 64))(v14, v27, v26);
      if (v25 && v26)
        CFRelease(v26);
      AutoString::~AutoString((AutoString *)&keys);
      keys = &off_1E14E4818;
      v28 = CFStringCreateWithCString(v15, "Options", 0x8000100u);
      v38 = 0;
      v39 = 0;
      v37 = v28;
      if (v10)
      {
        v29 = CFCopyDescription(v10);
        v28 = v37;
      }
      else
      {
        v29 = CFSTR("null");
      }
      (*(void (**)(uint64_t, CFStringRef, CFStringRef))(*(_QWORD *)v14 + 64))(v14, v28, v29);
      if (v10 && v29)
        CFRelease(v29);
      AutoString::~AutoString((AutoString *)&keys);
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
    }
    v31 = !v10
       || (Value = CFDictionaryGetValue(v10, CFSTR("kCFCredentialStorageRemoveSynchronizableCredentials"))) == 0
       || CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]) == 0;
    if (URLCredential::Class(void)::sOnce_URLCredential != -1)
      dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
    v32 = (char *)v11 + 16;
    if (!v11)
      v32 = 0;
    if (*((_DWORD *)v32 + 9) != 4 || !v31)
    {
      if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
        dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
      if (internal)
        v34 = (char *)internal + 16;
      else
        v34 = 0;
      (*(void (**)(char *, _CFURLCredential *, _CFURLProtectionSpace *))(*((_QWORD *)v34 + 1) + 48))(v34 + 8, v11, v12);
    }
  }
}

- (NSURLCredential)defaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space
{
  NSURLCredentialStorageInternal *internal;
  uint64_t v4;
  const void *v5;
  id v6;

  internal = self->_internal;
  if (!internal)
    return 0;
  v4 = CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace((uint64_t)internal, (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace"));
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v6 = -[NSURLCredential _initWithCFURLCredential:]([NSURLCredential alloc], "_initWithCFURLCredential:", v4);
  CFRelease(v5);
  return (NSURLCredential *)v6;
}

- (void)setDefaultCredential:(NSURLCredential *)credential forProtectionSpace:(NSURLProtectionSpace *)space
{
  NSURLCredentialStorageInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCredentialStorageSetDefaultCredentialForProtectionSpace((uint64_t)internal, (uint64_t)-[NSURLCredential _cfurlcredential](credential, "_cfurlcredential"), (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace"));
}

- (void)getCredentialsForProtectionSpace:(NSURLProtectionSpace *)protectionSpace task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  (*((void (**)(void *, NSDictionary *))completionHandler + 2))(completionHandler, -[NSURLCredentialStorage credentialsForProtectionSpace:](self, "credentialsForProtectionSpace:", protectionSpace, task));
}

- (void)getDefaultCredentialForProtectionSpace:(NSURLProtectionSpace *)space task:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  (*((void (**)(void *, NSURLCredential *))completionHandler + 2))(completionHandler, -[NSURLCredentialStorage defaultCredentialForProtectionSpace:](self, "defaultCredentialForProtectionSpace:", space, task));
}

- (_QWORD)__allCredentialsWithAccessControlGroup:(uint64_t)a3 includeLegacyKeychain:
{
  _QWORD *v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFAllocator *v13;
  const __CFString *v14;
  CFStringRef v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const void *v20;
  id v21;
  const __CFDictionary *Value;
  void *v23;
  const __CFAllocator *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  void (**v30)(AutoString *__hidden);
  CFStringRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (result[1])
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = v3[1];
      if (a2)
      {
        if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
          dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
        v8 = v7 + 16;
        if (v7)
          v9 = v7 + 16;
        else
          v9 = 0;
        v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + 32))(v9 + 8, a2, a3);
        v11 = DiagnosticLogging::newMsg((uint64_t)&__block_literal_global_10, 1);
        if (v11)
        {
          v12 = v11;
          if ((*(unsigned int (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v11 + 16))(v11, "CopyAllCredentialsWithAccessControlGroupIncludeLegacyKeychain", 0))
          {
            v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            if (v7)
            {
              if (URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage != -1)
              {
                v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
                dispatch_once(&URLCredentialStorage::Class(void)::sOnce_URLCredentialStorage, &__block_literal_global_2_1169);
                v13 = v24;
              }
              v30 = &off_1E14E4818;
              v32 = 0;
              v33 = 0;
              v31 = CFStringCreateWithCString(v13, "Store", 0x8000100u);
              v14 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 32))(v8);
              v15 = v31;
            }
            else
            {
              v30 = &off_1E14E4818;
              v15 = CFStringCreateWithCString(v13, "Store", 0x8000100u);
              v8 = 0;
              v32 = 0;
              v33 = 0;
              v31 = v15;
              v14 = CFSTR("null");
            }
            (*(void (**)(uint64_t, CFStringRef, const __CFString *))(*(_QWORD *)v12 + 64))(v12, v15, v14);
            if (v8 && v14)
              CFRelease(v14);
            AutoString::~AutoString((AutoString *)&v30);
            (*(void (**)(uint64_t, const char *, void *))(*(_QWORD *)v12 + 96))(v12, "Result", v10);
            (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
          }
        }
      }
      else
      {
        v10 = (void *)CFURLCredentialStorageCopyAllCredentials(v3[1]);
      }
      v16 = (void *)objc_msgSend(v10, "allKeys");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v16);
            v20 = *(const void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v21 = -[NSURLProtectionSpace _initWithCFURLProtectionSpace:]([NSURLProtectionSpace alloc], "_initWithCFURLProtectionSpace:", v20);
            Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v10, v20);
            v23 = copyNSCredentialDictForCFCredentialDict(Value);
            objc_msgSend(v6, "setObject:forKey:", v23, v21);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }
      if (v10)
        CFRelease(v10);
      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end

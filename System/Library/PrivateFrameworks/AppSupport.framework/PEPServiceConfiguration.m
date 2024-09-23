@implementation PEPServiceConfiguration

+ (id)sharedInstance
{
  id result;

  result = (id)_sharedInstance;
  if (!_sharedInstance)
  {
    result = objc_alloc_init(PEPServiceConfiguration);
    _sharedInstance = (uint64_t)result;
  }
  return result;
}

- (PEPServiceConfiguration)init
{
  PEPServiceConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PEPServiceConfiguration;
  v2 = -[PEPServiceConfiguration init](&v4, sel_init);
  if (v2)
    v2->_cacheFilePath = (NSString *)(id)objc_msgSend(CFSTR("~/Library/Caches/com.apple.pep.configuration.plist"), "stringByExpandingTildeInPath");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PEPServiceConfiguration;
  -[PEPServiceConfiguration dealloc](&v3, sel_dealloc);
}

- (void)_postNotification
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("PEPServiceConfigurationRegistrationComplete"), self));
}

- (void)_updateDefaults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  PEPServiceConfiguration *v19;
  id v21;
  uint64_t v22;
  void *value;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(MEMORY[0x1E0CB3978], "setThreadPriority:", 0.0);
  if (self->_shouldDownloadNetworkConfigFile)
  {
    v5 = (void *)downloadDictionary();
    if (!v5)
      goto LABEL_24;
    v6 = v5;
    objc_msgSend(v5, "writeToFile:atomically:", self->_cacheFilePath, 1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
    self->_cachedFileLastModifyDate = v7;
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", self->_cacheFilePath);
    if (!v6)
      goto LABEL_24;
  }
  v18 = v4;
  v19 = self;
  value = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_cachedFileLastModifyDate);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v31;
    v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v21 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(a3);
        v25 = v10;
        v11 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        CFPreferencesSetValue(CFSTR("AppTimeInterval"), value, v11, v8, v9);
        v12 = (void *)objc_msgSend(v6, "objectForKey:", -[__CFString lastPathComponent](v11, "lastPathComponent"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = (void *)objc_msgSend(v12, "allKeys");
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend((id)(id)CFPreferencesCopyValue(*(CFStringRef *)(*((_QWORD *)&v26 + 1) + 8 * i), v11, v8, v9), "isEqual:", objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i))) & 1) == 0)
                {
                  CFPreferencesSetMultiple((CFDictionaryRef)v12, 0, v11, v8, v9);
                  CFPreferencesSynchronize(v11, v8, v9);
                  v6 = v21;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              v6 = v21;
              if (v15)
                continue;
              break;
            }
          }
        }
LABEL_21:
        v10 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  v4 = v18;
  self = v19;
LABEL_24:
  -[PEPServiceConfiguration performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__postNotification, objc_msgSend(MEMORY[0x1E0CB3978], "mainThread", v18), 0, 0);

}

- (BOOL)registerNetworkDefaultsForAppID:(id)a3
{
  return -[PEPServiceConfiguration registerNetworkDefaultsForAppIDs:forceUpdate:](self, "registerNetworkDefaultsForAppIDs:forceUpdate:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3), 0);
}

- (BOOL)registerNetworkDefaultsForAppIDs:(id)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double cachedFileLastModifyDate;
  BOOL result;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", self->_cacheFilePath, 0);
  objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2A88]), "timeIntervalSinceReferenceDate");
  self->_cachedFileLastModifyDate = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9 - self->_cachedFileLastModifyDate;
  if (v4)
    v11 = 86400.0;
  else
    v11 = 432000.0;
  self->_shouldDownloadNetworkConfigFile = v10 > v11;
  if (v10 > v11)
  {
    v12 = 0;
LABEL_19:
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__updateDefaults_, a3);
    objc_msgSend(v25, "start");

    return self->_shouldDownloadNetworkConfigFile || v12;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    v16 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v17 = (const __CFString *)*MEMORY[0x1E0C9B230];
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(a3);
        v19 = (void *)CFPreferencesCopyValue(CFSTR("AppTimeInterval"), *(CFStringRef *)(*((_QWORD *)&v26 + 1) + 8 * i), v16, v17);
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        if (v22 - v21 > 432000.0)
        {

LABEL_18:
          v12 = 1;
          goto LABEL_19;
        }
        cachedFileLastModifyDate = self->_cachedFileLastModifyDate;

        if (v21 < cachedFileLastModifyDate)
          goto LABEL_18;
      }
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }
  v12 = 0;
  result = 0;
  if (self->_shouldDownloadNetworkConfigFile)
    goto LABEL_19;
  return result;
}

@end

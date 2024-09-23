@implementation _LSDefaults

- (BOOL)markLocalizationsStoredInDatabase
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  if (markLocalizationsStoredInDatabase_once != -1)
    dispatch_once(&markLocalizationsStoredInDatabase_once, block);
  return markLocalizationsStoredInDatabase_result;
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (unsigned)proxyUIDForCurrentEffectiveUID
{
  uint64_t v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  if (proxyUIDForCurrentEffectiveUID_once != -1)
    dispatch_once(&proxyUIDForCurrentEffectiveUID_once, block);
  if (proxyUIDForCurrentEffectiveUID_hasEUID == 1)
    v3 = proxyUIDForCurrentEffectiveUID_euid;
  else
    v3 = _CFGetEUID();
  return -[_LSDefaults proxyUIDForUID:](self, "proxyUIDForUID:", v3);
}

- (unsigned)proxyUIDForUID:(unsigned int)a3
{
  if (a3 - 401 >= 0xFFFFFE6D)
    return 0;
  else
    return a3;
}

- (BOOL)hasServer
{
  return self->_hasServer && !self->_isServer;
}

- (BOOL)isAppleInternal
{
  return self->_appleInternal;
}

- (NSArray)preferredLocalizations
{
  id v3;

  if (preferredLocalizations_once != -1)
    dispatch_once(&preferredLocalizations_once, &__block_literal_global_159_0);
  if (!-[_LSDefaults isInXCTestRigInsecure](self, "isInXCTestRigInsecure")
    || (+[_LSStringLocalizer preferredLocalizationsForXCTests](_LSStringLocalizer, "preferredLocalizationsForXCTests"), (v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (preferredLocalizations_useUserLangList)
    {
      if (-[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = (id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
      }
    }
    else
    {
      if (preferredLocalizations_once_171 != -1)
        dispatch_once(&preferredLocalizations_once_171, &__block_literal_global_172);
      v3 = (id)preferredLocalizations_bundleLocalizations;
    }
  }
  return (NSArray *)v3;
}

- (BOOL)isInXCTestRigInsecure
{
  return self->_inXCTestRigInsecure;
}

- (BOOL)allowsAlternateIcons
{
  return !self->_inEducationMode;
}

- (BOOL)isInEducationMode
{
  return self->_inEducationMode;
}

- (id)databaseStoreFileURLWithUID:(unsigned int)a3
{
  void *v5;
  char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[_LSDefaults databaseContainerURLWithUID:](self, "databaseContainerURLWithUID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = getenv("LS_NAME_PREFIX");
    if (v6)
      v7 = v6;
    else
      v7 = "com.apple.LaunchServices";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%03llu-v2.csstore"), v7, -[_LSDefaults currentSchemaVersion](self, "currentSchemaVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a3)
    {
      if (v8)
      {
LABEL_7:
        objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(CFSTR("System-"), "stringByAppendingString:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
      if (v11)
        goto LABEL_7;
    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unsigned)currentSchemaVersion
{
  return 6012;
}

- (id)databaseContainerURL
{
  void *v3;

  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode")
    || -[_LSDefaults isLightweightSystemServer](self, "isLightweightSystemServer"))
  {
    -[_LSDefaults systemContainerURL](self, "systemContainerURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_LSDefaults userContainerURL](self, "userContainerURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSURL)userContainerURL
{
  OS_dispatch_queue *ivarQueue;
  _QWORD v4[5];

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31___LSDefaults_userContainerURL__block_invoke;
  v4[3] = &unk_1E1042F38;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_userContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSData)HMACSecret
{
  _LSAssertRunningInServer((uint64_t)"-[_LSDefaults HMACSecret]");
  return (NSData *)_LSLazyLoadObjectOnQueue((uint64_t)&self->_hmacSecret, self->_ivarQueue, &__block_literal_global_186_0);
}

- (NSURL)settingsStoreFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults userContainerURL](self, "userContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServices.SettingsStore.sql"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3
{
  return -[_LSDefaults serviceNameForConnectionType:lightweightSystemService:](self, "serviceNameForConnectionType:lightweightSystemService:", a3, 0);
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3 lightweightSystemService:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;

  v4 = a4;
  v5 = a3;
  v6 = getenv("LSD_SERVICE_BASE");
  switch(v5)
  {
    case 0:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.mapdb");
        v13 = CFSTR("com.apple.lsd.system.mapdb");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".mapdb";
      goto LABEL_78;
    case 1:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.modifydb");
        v13 = CFSTR("com.apple.lsd.system.modifydb");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".modifydb";
      goto LABEL_78;
    case 2:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.openurl");
        v13 = CFSTR("com.apple.lsd.system.openurl");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".openurl";
      goto LABEL_78;
    case 3:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.open");
        v13 = CFSTR("com.apple.lsd.system.open");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".open";
      goto LABEL_78;
    case 4:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.plugin");
        v13 = CFSTR("com.apple.lsd.system.plugin");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".plugin";
      goto LABEL_78;
    case 5:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.xpc");
        v13 = CFSTR("com.apple.lsd.system.xpc");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".xpc";
      goto LABEL_78;
    case 6:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.installation");
        v13 = CFSTR("com.apple.lsd.system.installation");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".installation";
      goto LABEL_78;
    case 7:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.advertisingidentifiers");
        v13 = CFSTR("com.apple.lsd.system.advertisingidentifiers");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".advertisingidentifiers";
      goto LABEL_78;
    case 8:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.trustedsignatures");
        v13 = CFSTR("com.apple.lsd.system.trustedsignatures");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".trustedsignatures";
      goto LABEL_78;
    case 9:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.diagnostics");
        v13 = CFSTR("com.apple.lsd.system.diagnostics");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".diagnostics";
      goto LABEL_78;
    case 10:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.icons");
        v13 = CFSTR("com.apple.lsd.system.icons");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".icons";
      goto LABEL_78;
    case 11:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.dissemination");
        v13 = CFSTR("com.apple.lsd.system.dissemination");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".dissemination";
      goto LABEL_78;
    case 12:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.encryption");
        v13 = CFSTR("com.apple.lsd.system.encryption");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".encryption";
      goto LABEL_78;
    case 13:
      if (!v6 || !*v6)
      {
        v12 = CFSTR("com.apple.lsd.rebuild");
        v13 = CFSTR("com.apple.lsd.system.rebuild");
        goto LABEL_94;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = "";
      if (v4)
        v8 = ".system";
      v9 = ".rebuild";
      goto LABEL_78;
    case 14:
      if (v6 && *v6)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = "";
        if (v4)
          v8 = ".system";
        v9 = ".appprotection";
LABEL_78:
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s%s.%s"), v6, v8, v9);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("com.apple.lsd.appprotection");
        v13 = CFSTR("com.apple.lsd.system.appprotection");
LABEL_94:
        if (v4)
          v12 = (__CFString *)v13;
        v11 = v12;
      }
      return v11;
    default:
      return 0;
  }
}

- (id)databaseUpdateNotificationNameForSessionKey:(LSSessionKey)a3
{
  LSSessionKey v4;

  v4 = a3;
  -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:](self, "darwinNotificationNameForBaseName:optionalSessionKey:", CFSTR("com.apple.LaunchServices.database"), &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)darwinNotificationNameForBaseName:(id)a3 optionalSessionKey:(LSSessionKey *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (a4)
  {
    v7 = v5;
    if (a4->systemSession)
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".system"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (_LSDefaults)init
{
  _LSDefaults *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *ivarQueue;
  NSURL *systemContainerURL;
  NSURL *userContainerURL;
  NSURL *systemGroupContainerURL;
  NSMutableDictionary *v9;
  NSMutableDictionary *darwinNotificationNames;
  char *v11;
  BOOL v12;
  void *v13;
  int v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_LSDefaults;
  v2 = -[_LSDefaults init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.launchservices.defaults", v3);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v4;

    systemContainerURL = v2->_systemContainerURL;
    v2->_systemContainerURL = 0;

    userContainerURL = v2->_userContainerURL;
    v2->_userContainerURL = 0;

    systemGroupContainerURL = v2->_systemGroupContainerURL;
    v2->_systemGroupContainerURL = 0;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    darwinNotificationNames = v2->_darwinNotificationNames;
    v2->_darwinNotificationNames = v9;

    v2->_darwinNotificationNamesUID = _CFGetEUID();
    v2->_darwinNotificationNamesLock._os_unfair_lock_opaque = 0;
    v11 = getenv("RUNNING_IN_SYNC_BUBBLE");
    if (v11 && atoi(v11) == 1)
      _LSDefaultsInSyncBubble_inSyncBubble = 1;
    v2->_inSyncBubble = _LSDefaultsInSyncBubble_inSyncBubble;
    if (_LSDefaultsInXCTestRigInsecure_once != -1)
      dispatch_once(&_LSDefaultsInXCTestRigInsecure_once, &__block_literal_global_374_0);
    v2->_inXCTestRigInsecure = _LSDefaultsInXCTestRigInsecure_inXCTestRigInsecure;
    if (_LSDefaultsIsAppleInternal_once != -1)
      dispatch_once(&_LSDefaultsIsAppleInternal_once, &__block_literal_global_376);
    v2->_appleInternal = _LSDefaultsIsAppleInternal_appleInternal;
    if (_LSDefaultsHasServer_onceToken != -1)
      dispatch_once(&_LSDefaultsHasServer_onceToken, &__block_literal_global_377);
    v2->_hasServer = (_LSDefaultsHasServer_hasServer & 1) == 0;
    v12 = _CFGetEUID() - 100 <= 0xFFFFFF99 && getenv("LS_NO_PERSISTENT_PREFS") == 0;
    v2->_hasPersistentPreferences = v12;
    v2->_inEducationMode = 0;
    -[objc_class sharedManager](getUMUserManagerClass_0(), "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSharedIPad");

    if (v14)
      v2->_inEducationMode = 1;
    v2->_usingEphemeralStorage = os_variant_uses_ephemeral_storage();
  }
  return v2;
}

- (BOOL)isLightweightSystemServer
{
  return self->_isLightweightSystemServer;
}

- (NSURL)systemContentDatabaseStoreFileURL
{
  return (NSURL *)-[_LSDefaults systemContentDatabaseStoreFileURLWithUID:](self, "systemContentDatabaseStoreFileURLWithUID:", -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (id)systemContentDatabaseStoreFileURLWithUID:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_LSDefaults databaseStoreFileURLWithUID:](self, "databaseStoreFileURLWithUID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SystemDataOnly-"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)classesWithNameForXCTests:(const char *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  const char *v9;

  if (__LSDefaultsGetSharedInstance_onceToken != -1)
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_26);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance_sharedInstance, "isInXCTestRigInsecure"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41___LSDefaults_classesWithNameForXCTests___block_invoke;
    v7[3] = &unk_1E1042F80;
    v8 = v4;
    v9 = a3;
    v5 = v4;
    objc_enumerateClasses(0, a3, 0, 0, v7);

  }
  return 0;
}

+ (id)sharedInstance
{
  __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_PRIVATE_SYMBOLS__();
  if (dyld_get_program_sdk_version() >= 0xD0000)
    objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  if (__LSDefaultsGetSharedInstance_onceToken != -1)
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_26);
  return (id)__LSDefaultsGetSharedInstance_sharedInstance;
}

- (id)systemContainerBaseURL
{
  return _LSLazyLoadObjectOnQueue((uint64_t)&self->_baseSystemContainerURL, self->_ivarQueue, &__block_literal_global_28);
}

- (NSURL)systemContainerURL
{
  OS_dispatch_queue *ivarQueue;
  _QWORD v4[5];

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33___LSDefaults_systemContainerURL__block_invoke;
  v4[3] = &unk_1E1042F38;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)systemGroupContainerURL
{
  OS_dispatch_queue *ivarQueue;
  _QWORD v4[5];

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38___LSDefaults_systemGroupContainerURL__block_invoke;
  v4[3] = &unk_1E1042F38;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemGroupContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)databaseStoreFileMode
{
  return 432;
}

- (NSURL)databaseContainerDirectoryURL
{
  return (NSURL *)-[_LSDefaults databaseContainerURLWithUID:](self, "databaseContainerURLWithUID:", -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (NSURL)databaseStoreFileURL
{
  return (NSURL *)-[_LSDefaults databaseStoreFileURLWithUID:](self, "databaseStoreFileURLWithUID:", -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (NSURL)unremappableDatabaseStoreFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseStoreFileURL](self, "databaseStoreFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("unremappable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)preferencesFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults userContainerURL](self, "userContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServices.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)preSydroFSecurePreferencesFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults userContainerURL](self, "userContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.launchservices.securepreferences.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)securePreferencesFileURL
{
  void *v3;
  void *v4;

  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode"))
    -[_LSDefaults userContainerURL](self, "userContainerURL");
  else
    -[_LSDefaults systemContainerBaseURL](self, "systemContainerBaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.launchservices.securepreferences.plist"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)appProtectionStoreFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseContainerURL](self, "databaseContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServicesAppProtectionStore.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)queriedSchemesMapFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults userContainerURL](self, "userContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.lsdschemes.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)identifiersFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults systemGroupContainerURL](self, "systemGroupContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.lsdidentifiers.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbSentinelFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseContainerURL](self, "databaseContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServices.dirty"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)installJournalDirectoryURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseContainerURL](self, "databaseContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServices.InstallJournal"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbRecoveryFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseContainerURL](self, "databaseContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.LaunchServices.error"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbSyncInterruptedFileURL
{
  void *v2;
  void *v3;

  -[_LSDefaults databaseContainerURL](self, "databaseContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com.apple.LaunchServices.syncInterrupted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)progressProportionsStateURL
{
  void *v2;
  void *v3;

  -[_LSDefaults userContainerURL](self, "userContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ProgressProporitions.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)simulatorRootURL
{
  if (simulatorRootURL_once != -1)
    dispatch_once(&simulatorRootURL_once, &__block_literal_global_54);
  return (id)simulatorRootURL_result;
}

- (id)simulatorRuntimeVersion
{
  if (simulatorRuntimeVersion_once != -1)
    dispatch_once(&simulatorRuntimeVersion_once, &__block_literal_global_56_0);
  return (id)simulatorRuntimeVersion_result;
}

- (id)simulatorRuntimeBuildVersion
{
  if (simulatorRuntimeBuildVersion_once != -1)
    dispatch_once(&simulatorRuntimeBuildVersion_once, &__block_literal_global_58);
  return (id)simulatorRuntimeBuildVersion_result;
}

- (void)setHasServer:(BOOL)a3
{
  self->_hasServer = a3;
}

- (BOOL)isSystemServer
{
  _BOOL4 v3;

  v3 = -[_LSDefaults isServer](self, "isServer");
  if (v3)
    LOBYTE(v3) = -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID") == 0;
  return v3;
}

- (BOOL)isUserServer
{
  _BOOL4 v3;

  v3 = -[_LSDefaults isServer](self, "isServer");
  if (v3)
    LOBYTE(v3) = -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID") != 0;
  return v3;
}

- (BOOL)abortIfMayNotMapDatabase
{
  _BOOL4 v2;

  v2 = -[_LSDefaults isAppleInternal](self, "isAppleInternal");
  if (v2)
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(CFSTR("LSAbortIfMayNotMapDatabase"), (CFStringRef)*MEMORY[0x1E0C9B248], 0) != 0;
  return v2;
}

- (BOOL)issueSandboxExceptionsIfMayNotMapDatabase
{
  return !-[_LSDefaults isAppleInternal](self, "isAppleInternal")
      || CFPreferencesGetAppBooleanValue(CFSTR("LSDisableDatabaseSandboxExceptions"), (CFStringRef)*MEMORY[0x1E0C9B248], 0) == 0;
}

- (id)settingsUpdateNotificationNameForUserID:(unsigned int)a3
{
  uint64_t v4;

  v4 = a3;
  -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:](self, "darwinNotificationNameForBaseName:optionalSessionKey:", CFSTR("com.apple.LaunchServices.settings"), &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)preferencesUpdateNotificationName
{
  return -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:](self, "darwinNotificationNameForBaseName:optionalSessionKey:", CFSTR("com.apple.LaunchServices.prefs"), 0);
}

- (id)preferencesFileChangeNotificationName
{
  return -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:](self, "darwinNotificationNameForBaseName:optionalSessionKey:", CFSTR("com.apple.LaunchServices.prefsFile"), 0);
}

- (BOOL)allowsUnentitledExtensionPointDeclaration
{
  return _os_feature_enabled_impl();
}

- (BOOL)nsExtensionUsesLSSettingsStore
{
  return _os_feature_enabled_impl();
}

- (double)databaseSaveInterval
{
  return 1.0;
}

- (double)databaseSaveLatency
{
  return 0.5;
}

- (int64_t)concurrentInstallOperations
{
  return 3;
}

- (BOOL)alwaysUseDebugOpenWithMenus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  if (alwaysUseDebugOpenWithMenus_once != -1)
    dispatch_once(&alwaysUseDebugOpenWithMenus_once, block);
  return alwaysUseDebugOpenWithMenus_result;
}

- (BOOL)isRegionChina
{
  if (isRegionChina_once != -1)
    dispatch_once(&isRegionChina_once, &__block_literal_global_178);
  return isRegionChina_result;
}

- (id)debugDescription
{
  void *v3;
  int i;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 15; ++i)
  {
    -[_LSDefaults serviceNameForConnectionType:](self, "serviceNameForConnectionType:", (unsigned __int16)i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v29 = (void *)MEMORY[0x1E0CB3940];
  v30.receiver = self;
  v30.super_class = (Class)_LSDefaults;
  -[_LSDefaults debugDescription](&v30, sel_debugDescription);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDefaults databaseStoreFileURL](self, "databaseStoreFileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDefaults queriedSchemesMapFileURL](self, "queriedSchemesMapFileURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDefaults identifiersFileURL](self, "identifiersFileURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDefaults preferencesFileURL](self, "preferencesFileURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDefaults securePreferencesFileURL](self, "securePreferencesFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("NO");
  if (-[_LSDefaults isServer](self, "isServer"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v23 = v8;
  if (-[_LSDefaults hasServer](self, "hasServer"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v22 = v9;
  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v21 = v10;
  if (-[_LSDefaults hasPersistentPreferences](self, "hasPersistentPreferences"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[_LSDefaults allowsAlternateIcons](self, "allowsAlternateIcons"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[_LSDefaults abortIfMayNotMapDatabase](self, "abortIfMayNotMapDatabase"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[_LSDefaults isInSyncBubble](self, "isInSyncBubble"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[_LSDefaults isInXCTestRigInsecure](self, "isInXCTestRigInsecure"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[_LSDefaults isAppleInternal](self, "isAppleInternal"))
    v7 = CFSTR("YES");
  -[_LSDefaults databaseSaveInterval](self, "databaseSaveInterval");
  v17 = v16;
  -[_LSDefaults databaseSaveLatency](self, "databaseSaveLatency");
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@Paths:\n\tdatabaseStoreFileURL: %@\n\tqueriedSchemesMapFileURL: %@\n\tidentifiersFileURL: %@\n\tpreferencesFileURL: %@\n\tsecurePreferencesFileURL: %@\nEnvironment:\n\tisServer: %@\n\thasServer: %@\n\tinEducationMode: %@\n\thasPersistentPreferences: %@\n\tallowsAlternateIcons: %@\n\tabortIfMayNotMapDatabase: %@\n\tinSyncBubble: %@\n\tinXCTestRigInsecure: %@\n\tappleInternal: %@\nTimeing:\n\tdatabaseSaveInterval: %lf\n\tdatabaseSaveLatency: %lf\nService names: %@"), v28, v27, v26, v25, v24, v6, v23, v22, v21, v11, v12, v13, v14, v15, v7, v17,
    v18,
    v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (void)setServer:(BOOL)a3
{
  self->_isServer = a3;
}

- (void)setLightweightSystemServer:(BOOL)a3
{
  self->_isLightweightSystemServer = a3;
}

- (BOOL)isUsingEphemeralStorage
{
  return self->_usingEphemeralStorage;
}

- (BOOL)hasPersistentPreferences
{
  return self->_hasPersistentPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationNames, 0);
  objc_storeStrong((id *)&self->_hmacSecret, 0);
  objc_storeStrong((id *)&self->_userContainerURL, 0);
  objc_storeStrong((id *)&self->_systemGroupContainerURL, 0);
  objc_storeStrong((id *)&self->_systemContainerURL, 0);
  objc_storeStrong((id *)&self->_baseSystemContainerURL, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

@end

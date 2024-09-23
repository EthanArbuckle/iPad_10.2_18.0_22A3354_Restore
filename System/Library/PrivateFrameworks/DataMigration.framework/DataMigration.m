uint64_t DMGetUserDataDisposition()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "userDataDisposition");
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v3 = 0;
  }

  return v3;
}

void *DMGetPreviousBuildVersion()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "previousBuildVersion");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      CFAutorelease(v3);

    }
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v4 = 0;
  }

  return v4;
}

void _DMLogFunc(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;

  v3 = a3;
  _DMCoreLog();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_shim_with_CFString();

}

id _DMCoreLog()
{
  if (_DMCoreLog_onceToken != -1)
    dispatch_once(&_DMCoreLog_onceToken, &__block_literal_global_0);
  return (id)_DMCoreLog_log;
}

uint64_t DMIsMigrationNeeded()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "isMigrationNeeded");
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v3 = 0;
  }

  return v3;
}

void DMReportMigrationFailure()
{
  uint64_t v0;
  const char *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (os_variant_has_internal_content())
  {
    v1 = getprogname();
    v3 = getpid();
    _DMLogFunc(v0, 5, CFSTR("DMReportMigrationFailure called by process: %s[%d]"));
    v2 = +[DMConnection connection](DMConnection, "connection", v1, v3);
    v4 = v2;
    if (v2)
      objc_msgSend(v2, "reportMigrationFailure");
    else
      _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));

  }
}

void DMForceMigrationOnNextReboot()
{
  uint64_t v0;
  const char *v1;
  id v2;
  uint64_t v3;
  id v4;

  v1 = getprogname();
  v3 = getpid();
  _DMLogFunc(v0, 5, CFSTR("DMForceMigrationOnNextReboot called by process: %s[%d]"));
  v2 = +[DMConnection connection](DMConnection, "connection", v1, v3);
  v4 = v2;
  if (v2)
    objc_msgSend(v2, "forceMigrationOnNextRebootWithUserDataDisposition:", 0);
  else
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));

}

void DMForceMigrationOnNextRebootWithUserDataDisposition(uint64_t a1)
{
  uint64_t v1;
  const char *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = getprogname();
  v5 = getpid();
  _DMLogFunc(v1, 5, CFSTR("DMForceMigrationOnNextRebootWithUserDataDisposition called by process: %s[%d]"));
  v4 = +[DMConnection connection](DMConnection, "connection", v3, v5);
  v6 = v4;
  if (v4)
    objc_msgSend(v4, "forceMigrationOnNextRebootWithUserDataDisposition:", a1);
  else
    _DMLogFunc(v1, 3, CFSTR("Can't connect to migrator service!"));

}

uint64_t DMCopyUserDataDispositionAuxiliaryData()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "userDataDispositionAuxiliaryData");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v3 = 0;
  }

  return v3;
}

uint64_t DMCopyOrderedPluginIndentifiers()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "orderedPluginIdentifiers");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v3 = 0;
  }

  return v3;
}

uint64_t DMPerformMigrationReturningAfterPlugin(uint64_t a1)
{
  uint64_t v1;

  getprogname();
  getpid();
  _DMLogFunc(v1, 5, CFSTR("DMPerformMigrationReturningAfterPlugin called by process: %s[%d], plugin %@"));
  return _DMPerformMigration(1, a1, 0);
}

uint64_t _DMPerformMigration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  DMClientAPIController *v13;
  uint64_t v14;

  if ((_DWORD)a1)
  {
    +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "deviceModeIsSharediPad"))
    {
      +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userSessionIsLoginWindow");

      if ((v9 & 1) != 0)
        goto LABEL_8;
      +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "buildVersion");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastBuildVersionPref");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[DMEnvironment isBuildVersion:equalToBuildVersion:](DMEnvironment, "isBuildVersion:equalToBuildVersion:", v7, v12))
      {
        _DMLogFunc(v3, 5, CFSTR("We are in EDU mode and current build version(%@) is equal to last build version(%@). Skip migration."));

LABEL_13:
        v14 = 1;
        goto LABEL_14;
      }

    }
  }
LABEL_8:
  v7 = +[DMConnection connection](DMConnection, "connection");
  if (!v7)
  {
    _DMLogFunc(v3, 3, CFSTR("Can't connect to migrator service!"));
    goto LABEL_13;
  }
  v13 = objc_alloc_init(DMClientAPIController);
  v14 = -[DMClientAPIController _migrateWithConnection:checkNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:](v13, "_migrateWithConnection:checkNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:", v7, a1, a2, a3);
  if ((v14 & 1) == 0)
    DMReportMigrationFailure();

LABEL_14:
  return v14;
}

uint64_t DMPerformMigrationIfNeeded()
{
  uint64_t v0;

  getprogname();
  getpid();
  _DMLogFunc(v0, 5, CFSTR("DMPerformMigrationIfNeeded called by process: %s[%d]"));
  return _DMPerformMigration(1, 0, 0);
}

uint64_t DMPerformMigration()
{
  uint64_t v0;

  getprogname();
  getpid();
  _DMLogFunc(v0, 5, CFSTR("DMPerformMigration called by process: %s[%d], reason: %@"));
  return _DMPerformMigration(0, 0, 0);
}

uint64_t DMTestPerformMigrationInfrastructure()
{
  uint64_t v0;

  getprogname();
  getpid();
  _DMLogFunc(v0, 5, CFSTR("DMTestPerformMigrationInfrastructure called by process: %s[%d]"));
  return _DMPerformMigration(0, 0, 1);
}

void DMProgressHostIsReady()
{
  uint64_t v0;
  DMClientAPIController *v1;
  const char *v2;
  uint64_t v3;
  DMClientAPIController *v4;

  v2 = getprogname();
  v3 = getpid();
  _DMLogFunc(v0, 5, CFSTR("DMProgressHostIsReady called by process: %s[%d]"));
  v1 = objc_alloc_init(DMClientAPIController);
  v4 = v1;
  if (v1)
    -[DMClientAPIController progressHostIsReady](v1, "progressHostIsReady", v2, v3);
  else
    _DMLogFunc(v0, 3, CFSTR("Failed to create client API controller!"));

}

void DMChangeGraphicalProgressVisibility(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v4 = a2;
  v5 = +[DMConnection connection](DMConnection, "connection");
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __DMChangeGraphicalProgressVisibility_block_invoke;
    v6[3] = &unk_1E951EDE0;
    v8 = a1;
    v7 = v4;
    objc_msgSend(v5, "changeVisibility:completion:", a1, v6);

  }
  else
  {
    _DMLogFunc(v2, 3, CFSTR("Can't connect to migrator service!"));
  }

}

uint64_t DMCopyMigrationPhaseDescription()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection](DMConnection, "connection");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "migrationPhaseDescription");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("Can't connect to migrator service!"));
    v3 = 0;
  }

  return v3;
}

void DMGetMigrationPluginResults(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = a1;
  v3 = +[DMConnection connection](DMConnection, "connection");
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __DMGetMigrationPluginResults_block_invoke;
    v4[3] = &unk_1E951EE08;
    v5 = v2;
    objc_msgSend(v3, "migrationPluginResults:", v4);

  }
  else
  {
    _DMLogFunc(v1, 3, CFSTR("Can't connect to migrator service!"));
    if (v2)
      (*((void (**)(id, _QWORD, uint64_t))v2 + 2))(v2, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.datamigrator"), 1, 0));
  }

}

void DMDeferExit(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void (**v4)(void);

  v4 = a1;
  v2 = +[DMConnection connection](DMConnection, "connection");
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "deferExit");
  else
    _DMLogFunc(v1, 3, CFSTR("Can't connect to migrator service!"));
  if (v4)
    v4[2]();

}

void DMCancelDeferredExit(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void (**v4)(void);

  v4 = a1;
  v2 = +[DMConnection connection](DMConnection, "connection");
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "cancelDeferredExit");
  else
    _DMLogFunc(v1, 3, CFSTR("Can't connect to migrator service!"));
  if (v4)
    v4[2]();

}

void DMTestMigrationUI(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  id v6;

  v5 = +[DMConnection connection](DMConnection, "connection");
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "testMigrationUIWithProgress:forceInvert:", a1, a2);
  else
    _DMLogFunc(v2, 3, CFSTR("Can't connect to migrator service!"));

}

void sub_1D33A7D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D33A7EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _DMLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v6;
  void *v7;

  v6 = a6;
  _DMCoreLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_shim_with_CFString();

}

id _DMPluginSignpostLog()
{
  if (_DMPluginSignpostLog_onceToken != -1)
    dispatch_once(&_DMPluginSignpostLog_onceToken, &__block_literal_global_3_0);
  return (id)_DMPluginSignpostLog_log;
}

void DMSetContext(uint64_t a1)
{
  id v2;

  +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContext:", a1);

}

uint64_t DMCopyCurrentBuildVersion()
{
  void *v0;
  uint64_t v1;

  +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "buildVersion");
  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1D33AA7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D33AABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1E0C99608](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t MKBUserSessionIsLoginWindow()
{
  return MEMORY[0x1E0D4E578]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFPreferencesFlushCachesForIdentifier()
{
  return MEMORY[0x1E0C9A328]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1E0C84770]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}


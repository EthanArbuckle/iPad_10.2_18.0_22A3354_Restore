@implementation DMEnvironment

- (id)userDataDispositionPref
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("DMUserDataDisposition"), CFSTR("com.apple.migration"), v2, v3);
}

- (id)lastBuildVersionPref
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.migration"), v2, v3);
}

- (id)buildVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *v4;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9AB90]), "copy");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance__sharedInstance;
}

+ (BOOL)isBuildVersion:(id)a3 equalToBuildVersion:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a3, "compare:options:", a4, 1) == 0;
  }
  return result;
}

void __31__DMEnvironment_sharedInstance__block_invoke()
{
  DMEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(DMEnvironment);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (void)setLastBuildVersionPref:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("LastSystemVersion"), a3, CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), v3, v4);
}

- (id)lastMigrationResultsPref
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("DMLastMigrationResults"), CFSTR("com.apple.migration"), v2, v3);
}

- (void)setLastMigrationResultsPref:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("DMLastMigrationResults"), a3, CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), v3, v4);
}

- (void)setUserDataDispositionPref:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("DMUserDataDisposition"), a3, CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), v3, v4);
}

- (id)continuousIntegrationMarkerPref
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("com.apple.datamigrator.continuous-integration"), CFSTR("com.apple.migration"));
}

- (BOOL)waitForExecutePluginsSignalMarkerPref
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DMWaitForExecutePluginsSignal"), CFSTR("com.apple.migration"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)suppressMigrationPluginWrapperExitMarkerPref
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DMSuppressMigrationPluginWrapperExit"), CFSTR("com.apple.migration"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)implementMigrationPluginResults
{
  return 0;
}

- (id)migrationPluginResultsPref
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("DMMigrationPluginResults"), CFSTR("com.apple.migration"), v2, v3);
}

- (void)setMigrationPluginResultsPref:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("DMMigrationPluginResults"), a3, CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), v3, v4);
}

- (BOOL)isDeviceUsingEphemeralStorage
{
  return os_variant_uses_ephemeral_storage();
}

- (void)blockUntilPreferencesFlush
{
  _CFPreferencesFlushCachesForIdentifier();
}

- (BOOL)deviceModeIsSharediPad
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;

  v3 = (void *)MKBUserTypeDeviceMode();
  _DMLogFunc(v2, 7, CFSTR("MKBUserTypeDeviceMode returned error %@ result %@"));
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0], 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4E5B0]);

  return v5;
}

- (BOOL)userSessionIsLoginWindow
{
  uint64_t v2;
  uint64_t IsLoginWindow;
  void *v5;

  IsLoginWindow = MKBUserSessionIsLoginWindow();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsLoginWindow);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc(v2, 7, CFSTR("MKBUserSessionIsLoginWindow returned error %@ result %@"));

  return IsLoginWindow;
}

- (BOOL)shouldWatchdogPluginsAfterTimeout
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DMWatchdogPluginsAfterTimeout"), CFSTR("com.apple.migration"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (unint64_t)migrationRebootCount
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t v7;

  -[DMEnvironment migrationRebootCountPref](self, "migrationRebootCountPref");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DMEnvironment buildVersion](self, "buildVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dm_migrationRebootCountPref_buildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[DMEnvironment isBuildVersion:equalToBuildVersion:](DMEnvironment, "isBuildVersion:equalToBuildVersion:", v4, v5);

    if (v6)
      v7 = objc_msgSend(v3, "dm_migrationRebootCountPref_rebootCount");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setMigrationRebootCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99D80];
  -[DMEnvironment buildVersion](self, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dm_migrationRebootCountPrefWithRebootCount:buildVersion:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMEnvironment setMigrationRebootCountPref:](self, "setMigrationRebootCountPref:", v7);

  -[DMEnvironment blockUntilPreferencesFlush](self, "blockUntilPreferencesFlush");
}

- (id)migrationRebootCountPref
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return (id)(id)CFPreferencesCopyValue(CFSTR("DMMigrationRebootCount"), CFSTR("com.apple.migration"), v2, v3);
}

- (void)setMigrationRebootCountPref:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("DMMigrationRebootCount"), a3, CFSTR("com.apple.migration"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.migration"), v3, v4);
}

- (BOOL)shouldImposePluginArtificialHang
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.migration"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DMImposePluginArtificialHang"), CFSTR("com.apple.migration"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)testMigrationInfrastructureOnly
{
  return self->_testMigrationInfrastructureOnly;
}

- (void)setTestMigrationInfrastructureOnly:(BOOL)a3
{
  self->_testMigrationInfrastructureOnly = a3;
}

- (id)contextPath
{
  return CFSTR("/var/mobile/Library/Preferences/com.apple.DataMigration.plist");
}

- (id)context
{
  const __CFURL *v2;
  const __CFURL *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  void *v7;
  CFTypeID v8;

  if (DMContextPath_onceToken != -1)
    dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
  v2 = CFURLCreateWithFileSystemPath(0, (CFStringRef)DMContextPath_retval, kCFURLPOSIXPathStyle, 0);
  if (v2)
  {
    v3 = v2;
    v4 = CFReadStreamCreateWithFile(0, v2);
    if (v4)
    {
      v5 = v4;
      if (CFReadStreamOpen(v4))
      {
        v6 = CFPropertyListCreateWithStream(0, v5, 0, 0, 0, 0);
        v7 = (void *)v6;
        if (v6)
        {
          v8 = CFGetTypeID(v6);
          if (v8 != CFDictionaryGetTypeID())
          {
            CFRelease(v7);
            v7 = 0;
          }
        }
        CFReadStreamClose(v5);
      }
      else
      {
        v7 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setContext:(id)a3
{
  uint64_t v3;
  passwd *v4;
  passwd *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  __CFWriteStream *v8;
  __CFWriteStream *v9;
  int *v10;
  __CFString *v11;
  CFErrorRef v12;
  id propertyList;

  propertyList = a3;
  _DMLogFunc(v3, 7, CFSTR("Setting context to %@"));
  v4 = getpwnam("mobile");
  if (v4)
  {
    v5 = v4;
    if (DMContextPath_onceToken != -1)
      dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
    v6 = CFURLCreateWithFileSystemPath(0, (CFStringRef)DMContextPath_retval, kCFURLPOSIXPathStyle, 0);
    if (v6)
    {
      v7 = v6;
      v8 = CFWriteStreamCreateWithFile(0, v6);
      if (v8)
      {
        v9 = v8;
        if (CFWriteStreamOpen(v8))
        {
          if (!CFPropertyListWrite(propertyList, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0))
            _DMLogFunc(v3, 3, CFSTR("Error writing context property list to stream."));
          if (chown("/var/mobile/Library/Preferences/com.apple.DataMigration.plist", v5->pw_uid, v5->pw_gid))
          {
            v10 = __error();
            strerror(*v10);
            _DMLogFunc(v3, 3, CFSTR("Couldn't chown the preferences file to the mobile user: %s"));
          }
          CFWriteStreamClose(v9);
        }
        else
        {
          v12 = CFWriteStreamCopyError(v9);
          _DMLogFunc(v3, 3, CFSTR("Couldn't open the stream at %@: %@"));
          if (v12)
            CFRelease(v12);
        }
      }
      else
      {
        v9 = CFWriteStreamCopyError(0);
        _DMLogFunc(v3, 3, CFSTR("Couldn't create a stream for the file at %@: %@"));
        if (!v9)
          goto LABEL_22;
      }
      CFRelease(v9);
LABEL_22:
      CFRelease(v7);
      goto LABEL_23;
    }
    if (DMContextPath_onceToken != -1)
      dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
    v11 = CFSTR("Couldn't create a URL for the path %@");
  }
  else
  {
    v11 = CFSTR("Couldn't get user info for the mobile user");
  }
  _DMLogFunc(v3, 3, v11);
LABEL_23:

}

- (void)clearContext
{
  uint64_t v2;
  id v3;

  if (DMContextPathCStr_onceToken != -1)
    dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_28);
  if (unlink((const char *)DMContextPathCStr_retval))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (DMContextPathCStr_onceToken != -1)
      dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_28);
    _DMLogFunc(v2, 3, CFSTR("clearContext failed with errno %@ for path '%s'"));

  }
  else
  {
    if (DMContextPathCStr_onceToken != -1)
      dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_28);
    _DMLogFunc(v2, 7, CFSTR("clearContext succeeded for path '%s'"));
  }
}

@end

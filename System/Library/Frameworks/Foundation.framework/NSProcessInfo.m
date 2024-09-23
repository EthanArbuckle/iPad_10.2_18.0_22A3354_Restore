@implementation NSProcessInfo

- (NSDictionary)environment
{
  NSDictionary *result;
  char **v3;
  void **v4;
  const char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  uint64_t v15;
  NSString *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSDictionary *v23;

  result = self->environment;
  if (result)
    return result;
  environ_lock_np();
  v3 = *_NSGetEnviron();
  if (!v3)
  {
    environ_unlock_np();
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  }
  v4 = (void **)malloc_type_malloc(0x100uLL, 0x10040436913F5uLL);
  v5 = *v3;
  if (*v3)
  {
    v6 = 0;
    v7 = 32;
    while (1)
    {
      if (v6 >= v7)
      {
        if ((v7 & 0x8000000000000000) != 0)
        {
          environ_unlock_np();
          freeenv(v4, 2 * v7);
          return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        }
        v4 = (void **)malloc_type_realloc(v4, 16 * v7, 0x10040436913F5uLL);
        v5 = v3[v6];
        v7 *= 2;
      }
      v4[v6] = strdup(v5);
      v8 = v6 + 1;
      v5 = v3[++v6];
      if (!v5)
      {
        environ_unlock_np();
        goto LABEL_13;
      }
    }
  }
  environ_unlock_np();
  if (!v4)
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v8 = 0;
LABEL_13:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = 0;
      v12 = v4[i];
      while (1)
      {
        v13 = v12[v11];
        if (v13 == 61 || v13 == 0)
          break;
        ++v11;
      }
      v15 = 0;
      while (v12[v11 + v15++])
        ;
      if (v15 != 1)
      {
        v17 = +[NSString stringWithBytes:length:encoding:](NSString, "stringWithBytes:length:encoding:", v4[i], v11, 4);
        if (!v17)
        {
          v18 = v4[i];
          if (__NSDefaultStringEncodingFullyInited)
            v19 = _NSDefaultStringEncoding;
          else
            v19 = _NSDefaultCStringEncoding();
          v17 = +[NSString stringWithBytes:length:encoding:](NSString, "stringWithBytes:length:encoding:", v18, v12 - v18 + v11, v19);
        }
        v20 = (uint64_t)&v12[v11 + 1];
        v21 = +[NSString stringWithBytes:length:encoding:](NSString, "stringWithBytes:length:encoding:", v20, v15 - 2, 4);
        if (!v21)
        {
          if (__NSDefaultStringEncodingFullyInited)
            v22 = _NSDefaultStringEncoding;
          else
            v22 = _NSDefaultCStringEncoding();
          v21 = +[NSString stringWithBytes:length:encoding:](NSString, "stringWithBytes:length:encoding:", v20, v15 - 2, v22);
        }
        if (v17 && v21 && !objc_msgSend(v9, "objectForKey:", v17))
          objc_msgSend(v9, "setObject:forKey:", v21, v17);
      }
    }
  }
  v23 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);

  freeenv(v4, v8);
  return v23;
}

+ (NSProcessInfo)processInfo
{
  if (NSProcessInfo == a1)
    return +[_NSSwiftProcessInfo processInfo](_NSSwiftProcessInfo, "processInfo");
  if (qword_1ECD0A018 != -1)
    dispatch_once(&qword_1ECD0A018, &__block_literal_global_39);
  return (NSProcessInfo *)qword_1ECD0A020;
}

- (id)beginActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason
{
  if (!reason || !_NSIsNSString() || !-[NSString length](reason, "length"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot begin activity without reason string or empty reason string"), 0));
  return -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]([_NSActivityAssertion alloc], "_initWithActivityOptions:reason:expirationHandler:", options, reason, 0);
}

- (void)endActivity:(id)activity
{
  if (activity)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid class type"), 0));
    objc_msgSend(activity, "_endFromDealloc:", 0);
  }
}

- (void)_reactivateActivity:(id)a3
{
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid class type"), 0));
    objc_msgSend(a3, "_reactivate");
  }
}

- (NSArray)arguments
{
  NSArray *arguments;
  const char *v4;
  __CFString *v5;
  id v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char **v11;
  uint64_t v12;
  NSString *v13;

  os_unfair_lock_lock_with_options();
  arguments = self->arguments;
  if (!arguments)
  {
    v4 = (const char *)_CFProcessPath();
    v5 = (id)CFStringCreateWithFileSystemRepresentation(0, v4);
    if (!v5)
    {
      v6 = objc_allocWithZone((Class)NSString);
      v7 = strlen(v4);
      if (__NSDefaultStringEncodingFullyInited)
        v8 = _NSDefaultStringEncoding;
      else
        v8 = _NSDefaultCStringEncoding();
      v5 = (__CFString *)(id)objc_msgSend(v6, "initWithBytes:length:encoding:", v4, v7, v8);
    }
    if (!v5)
      v5 = &stru_1E0F56070;
    v9 = -[__CFString stringByStandardizingPath](v5, "stringByStandardizingPath");
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = *_NSGetArgv();
    v12 = *_NSGetArgc();
    if ((int)v12 >= 1)
    {
      do
      {
        if (*v11)
        {
          v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *v11, 4);
          if (v13
            || (v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *v11, 5)) != 0)
          {
            objc_msgSend(v10, "addObject:", v13);
          }
        }
        ++v11;
        --v12;
      }
      while (v12);
    }
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", 0, v9);
    else
      objc_msgSend(v10, "addObject:", v9);
    arguments = (NSArray *)objc_msgSend(v10, "copy");
    self->arguments = arguments;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
  return arguments;
}

- (NSString)globallyUniqueString
{
  const __CFUUID *v2;
  const __CFString *v3;
  size_t v4;
  char *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  char buffer[256];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = CFUUIDCreate(0);
  v3 = CFUUIDCreateString(0, v2);
  buffer[0] = 0;
  CFStringGetCString(v3, buffer, 256, 0x600u);
  buffer[255] = 0;
  v4 = strlen(buffer);
  v5 = &buffer[v4];
  v6 = 256 - v4;
  v7 = getpid();
  v8 = mach_absolute_time();
  snprintf(v5, v6, "-%ld-%016qX", v7, v8);
  CFRelease(v3);
  CFRelease(v2);
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer);
}

- (NSString)processName
{
  NSString *name;
  const char **v4;
  void *v5;

  os_unfair_lock_lock_with_options();
  name = self->name;
  if (!name)
  {
    v4 = (const char **)_CFGetProgname();
    name = (NSString *)CFStringCreateWithFileSystemRepresentation(0, *v4);
    self->name = name;
  }
  v5 = (void *)-[NSString copy](name, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
  return (NSString *)v5;
}

- (unint64_t)physicalMemory
{
  int v2;
  unint64_t result;
  size_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if ((_MergedGlobals_115 & 1) != 0)
    return qword_1ECD0A028;
  v4[0] = 8;
  v2 = sysctlbyname("hw.memsize", &qword_1ECD0A028, v4, 0, 0);
  result = 0;
  _MergedGlobals_115 = v2 == 0;
  if (!v2)
    return qword_1ECD0A028;
  return result;
}

- (BOOL)isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion *)version
{
  return _CFOperatingSystemVersionIsAtLeastVersion() != 0;
}

uint64_t __28__NSProcessInfo_processInfo__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_allocWithZone((Class)NSProcessInfo), "init");
  qword_1ECD0A020 = result;
  return result;
}

- (BOOL)isLowPowerModeEnabled
{
  return -[NSProcessInfo isLowPowerModeEnabled](+[_NSSwiftProcessInfo processInfo](_NSSwiftProcessInfo, "processInfo"), "isLowPowerModeEnabled");
}

- (NSOperatingSystemVersion)operatingSystemVersion
{
  NSOperatingSystemVersion *result;

  result = (NSOperatingSystemVersion *)_CFOperatingSystemVersionGetCurrent();
  *(_OWORD *)&retstr->majorVersion = 0uLL;
  retstr->patchVersion = 0;
  return result;
}

- (NSString)operatingSystemVersionString
{
  return (NSString *)(id)CFCopySystemVersionString();
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  -[NSProcessInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)isMacCatalystApp
{
  return _CFMZEnabled() != 0;
}

- (BOOL)isiOSAppOnMac
{
  return 0;
}

- (void)performExpiringActivityWithReason:(NSString *)reason usingBlock:(void *)block
{
  +[_NSActivityAssertion _performExpiringActivityWithReason:usingBlock:](_NSActivityAssertion, "_performExpiringActivityWithReason:usingBlock:", reason, block);
}

- (NSProcessInfoThermalState)thermalState
{
  return -[NSProcessInfo thermalState](+[_NSSwiftProcessInfo processInfo](_NSSwiftProcessInfo, "processInfo"), "thermalState");
}

- (NSUInteger)processorCount
{
  int v2;
  size_t v4;
  int v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = processorCount__pcnt;
  if (processorCount__pcnt == -1)
  {
    *(_QWORD *)v5 = 0x300000006;
    v4 = 4;
    if (sysctl(v5, 2u, &processorCount__pcnt, &v4, 0, 0))
    {
      v2 = 0;
      processorCount__pcnt = 0;
    }
    else
    {
      return processorCount__pcnt;
    }
  }
  return v2;
}

- (NSUInteger)activeProcessorCount
{
  int v2;
  size_t v4;
  int v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = activeProcessorCount__pcnt;
  if (activeProcessorCount__pcnt == -1)
  {
    *(_QWORD *)v5 = 0x1900000006;
    v4 = 4;
    if (sysctl(v5, 2u, &activeProcessorCount__pcnt, &v4, 0, 0))
    {
      v2 = 0;
      activeProcessorCount__pcnt = 0;
    }
    else
    {
      return activeProcessorCount__pcnt;
    }
  }
  return v2;
}

+ (NSProcessInfo)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A030 != -1)
    dispatch_once(&qword_1ECD0A030, &__block_literal_global_139);
  if (byte_1ECD0A011 && NSProcessInfo == a1)
    return (NSProcessInfo *)+[NSProcessInfo allocWithZone:](_NSSwiftProcessInfo, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
  return (NSProcessInfo *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (NSProcessInfo)alloc
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A030 != -1)
    dispatch_once(&qword_1ECD0A030, &__block_literal_global_139);
  if (byte_1ECD0A011 && NSProcessInfo == a1)
    return (NSProcessInfo *)[_NSSwiftProcessInfo alloc];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
  return (NSProcessInfo *)objc_msgSendSuper2(&v4, sel_alloc);
}

- (NSString)operatingSystemName
{
  NSUInteger v2;

  v2 = -[NSProcessInfo operatingSystem](self, "operatingSystem");
  if (v2 - 1 > 4)
    return (NSString *)CFSTR("NSUnknownOperatingSystem");
  else
    return (NSString *)off_1E0F50078[v2 - 1];
}

- (NSUInteger)operatingSystem
{
  return 5;
}

- (id)userHomeDirectory
{
  return NSHomeDirectoryForUser(0);
}

- (BOOL)isTranslated
{
  return 0;
}

- (void)setArguments:(id)a3
{
  NSArray *arguments;

  os_unfair_lock_lock_with_options();
  arguments = self->arguments;
  if (arguments != a3)
  {

    self->arguments = (NSArray *)objc_msgSend(a3, "copy");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)hostName
{
  NSString *result;

  result = self->hostName;
  if (!result)
  {
    os_unfair_lock_lock(&hostName_hostNameLock);
    if (!self->hostName)
      self->hostName = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C92C20], "currentHost"), "name"), "copy");
    os_unfair_lock_unlock(&hostName_hostNameLock);
    return self->hostName;
  }
  return result;
}

- (void)setProcessName:(NSString *)processName
{
  NSString *name;

  os_unfair_lock_lock_with_options();
  name = self->name;
  if (name != processName)
  {

    self->name = (NSString *)-[NSString copy](processName, "copy");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)userName
{
  return (NSString *)(id)CFCopyUserName();
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion
{
  if (self)
    return ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)-[$9FE6E10C8CE45DBC9A88DFDEA39A390D operatingSystemVersion](self, "operatingSystemVersion");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3
{
  int64_t var1;

  if (self)
    -[NSProcessInfo macCatalystVersion](self, "macCatalystVersion");
  if (a3->var0 > 0)
    return 0;
  if (a3->var0 < 0)
    return 1;
  var1 = a3->var1;
  if (var1 > 0)
    return 0;
  return var1 < 0 || a3->var2 <= 0;
}

- (void)_exitIfSuddenTerminationEnabledWithStatus:(int)a3
{
  _CFSuddenTerminationExitIfTerminationEnabled();
}

- (void)_exitWhenSuddenTerminationEnabledWithStatus:(int)a3
{
  _CFSuddenTerminationExitWhenTerminationEnabled();
}

- (void)disableAutomaticTermination:(NSString *)reason
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)enableAutomaticTermination:(NSString *)reason
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setAutomaticTerminationSupportEnabled:(BOOL)automaticTerminationSupportEnabled
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (BOOL)automaticTerminationSupportEnabled
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)beginSuspensionOfSystemBehaviors:(unint64_t)a3 reason:(id)a4
{
  return -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]([_NSActivityAssertion alloc], "_initWithActivityOptions:reason:expirationHandler:", 0xFF00EFFFFFLL, a4, 0);
}

- (void)endSystemBehaviorSuspension:(id)a3
{
  if (a3)
    objc_msgSend(a3, "_endFromDealloc:", 0);
}

- (void)performActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason usingBlock:(void *)block
{
  +[_NSActivityAssertion _performActivityWithOptions:reason:usingBlock:](_NSActivityAssertion, "_performActivityWithOptions:reason:usingBlock:", options, reason, block);
}

@end

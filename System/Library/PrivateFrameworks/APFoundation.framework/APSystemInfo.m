@implementation APSystemInfo

+ (NSString)deviceModel
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_deviceModel(SystemInfoInternal, a2, v2, v3);
}

+ (NSString)osVersion
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_osVersion);
}

+ (NSString)osName
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_osName);
}

+ (NSString)longBuildVersion
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_longBuildVersion);
}

+ (NSString)systemDescription
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_systemDescription);
}

+ (NSString)osIdentifier
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_osIdentifier);
}

+ (NSString)shortBuildVersion
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_shortBuildVersion);
}

+ (NSString)bundleIdentifier
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_bundleIdentifier(SystemInfoInternal, a2, v2, v3);
}

+ (NSString)locale
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_locale);
}

+ (NSString)modelType
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_modelType);
}

+ (BOOL)firstRunSinceReboot
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(SystemInfoInternal, sel_firstRunSinceReboot);
}

@end

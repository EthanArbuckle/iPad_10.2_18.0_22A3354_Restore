@implementation ICArchive

+ (UTType)universalTypeIdentifier
{
  return (UTType *)objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.notes.archive"));
}

+ (NSString)userDefaultsKey
{
  return (NSString *)CFSTR("alexandria");
}

+ (NSString)demoModeUserDefaultsKey
{
  return (NSString *)CFSTR("alexandria-demo-mode");
}

@end

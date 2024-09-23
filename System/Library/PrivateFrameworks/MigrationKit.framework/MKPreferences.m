@implementation MKPreferences

+ (char)BOOLForKey:(id)a3
{
  char v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.MigrationKit"), &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat)
    return v3;
  else
    return -1;
}

+ (id)stringForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.MigrationKit"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  CFPropertyListRef *v4;

  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetValue((CFStringRef)a4, *v4, CFSTR("com.apple.MigrationKit"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (void)setString:(id)a3 forKey:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.MigrationKit"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (void)removeForKey:(id)a3
{
  CFPreferencesSetValue((CFStringRef)a3, 0, CFSTR("com.apple.MigrationKit"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

@end

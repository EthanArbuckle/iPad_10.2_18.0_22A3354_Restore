@implementation CBInternalSettings

+ (void)setPreferencesValue:(id)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
  CFPreferencesSetValue(a4, a3, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4
{
  CFPreferencesAppSynchronize(a4);
  return (id)(id)CFPreferencesCopyAppValue(a3, a4);
}

@end

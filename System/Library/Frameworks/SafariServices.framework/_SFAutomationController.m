@implementation _SFAutomationController

+ (BOOL)isSystemRemoteAutomationEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.webinspectord"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RemoteAutomationEnabled"));

  return v3;
}

- (BOOL)allowsRemoteAutomation
{
  return +[_SFAutomationController isSystemRemoteAutomationEnabled](_SFAutomationController, "isSystemRemoteAutomationEnabled");
}

- (void)setAllowsRemoteAutomation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.webinspectord"));
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("RemoteAutomationEnabled"));
  objc_msgSend(v5, "synchronize");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("_SFDeveloperPreferencesDidChangeNotification"), 0);

}

@end

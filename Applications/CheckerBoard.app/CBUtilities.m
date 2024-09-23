@implementation CBUtilities

+ (BOOL)isRunningOnPhysicalHardware
{
  if (qword_10008BD28 != -1)
    dispatch_once(&qword_10008BD28, &stru_100075C08);
  return byte_10008AE30;
}

+ (BOOL)wasRemoteSetupPerformed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("remoteSetupCompleted"));

  return v3;
}

+ (BOOL)isInternalInstall
{
  if (qword_10008BD38 != -1)
    dispatch_once(&qword_10008BD38, &stru_100075C28);
  return byte_10008BD30;
}

@end

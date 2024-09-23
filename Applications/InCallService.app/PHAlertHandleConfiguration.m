@implementation PHAlertHandleConfiguration

+ (id)carPlayAlertConfiguration
{
  id v2;
  id v3;

  v2 = objc_alloc((Class)SBSRemoteAlertConfiguration);
  v3 = objc_msgSend(v2, "initWithServiceName:viewControllerClassName:", TUBundleIdentifierInCallServiceApplication, CFSTR("PHCarPlayInCallViewController"));
  objc_msgSend(v3, "setForCarPlay:", 1);
  objc_msgSend(v3, "setImpersonatedCarPlayAppIdentifier:", TUBundleIdentifierMobilePhoneApplication);
  return v3;
}

+ (id)carPlayAlertActivationOptionsWithReason:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)SBSRemoteAlertActivationOptions);
  objc_msgSend(v4, "setReason:", v3);

  return v4;
}

@end

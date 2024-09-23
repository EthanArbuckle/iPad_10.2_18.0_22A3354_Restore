@implementation iFBAConstants

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___iFBAConstants;
  objc_msgSendSuper2(&v5, "initialize");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("UseTouchIDLogin"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("TouchIDEnableRequestShown"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("TouchIDLastRequested"));

  objc_msgSend(v2, "setObject:forKey:", &off_1000EE9A0, CFSTR("TouchIDTimeoutDuration"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("IndentNavigationTitle"));
  objc_msgSend(v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SupportsBiometricsLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "registerDefaults:", v2);

}

+ (BOOL)supportsBiometricsLock
{
  if (qword_100118140 != -1)
    dispatch_once(&qword_100118140, &stru_1000E79E8);
  return byte_100118148;
}

+ (id)tintColor
{
  return +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
}

+ (id)currentiOSLegalDoc
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSLocaleLanguageCode));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForResource:withExtension:subdirectory:localization:", CFSTR("License"), CFSTR("rtf"), 0, v3));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("License"), CFSTR("rtf")));

  }
  return v5;
}

+ (BOOL)usesNavigationTitleIndentation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("IndentNavigationTitle"));

  return v3;
}

@end

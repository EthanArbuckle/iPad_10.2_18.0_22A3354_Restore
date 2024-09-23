@implementation URLOpener

+ (id)sharedInstance
{
  if (qword_1000921D0 != -1)
    dispatch_once(&qword_1000921D0, &stru_10007A220);
  return (id)qword_1000921C8;
}

- (id)openURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v9[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v9[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v8 = 0;
  objc_msgSend(v4, "openURL:withOptions:error:", v3, v5, &v8);

  v6 = v8;
  return v6;
}

@end

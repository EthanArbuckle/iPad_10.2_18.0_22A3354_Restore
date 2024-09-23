@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("Default Configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));

  v12 = objc_msgSend(v6, "initWithName:sessionRole:", v10, v11);
  return v12;
}

@end

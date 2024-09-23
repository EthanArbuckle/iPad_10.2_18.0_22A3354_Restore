@implementation ENSDKResourceLoader

+ (id)pathToResourceNamed:(id)a3 extension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", CFSTR("ENSDKResources"), CFSTR("bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load resource from ENSDKResources.bundle. Is it included in your app?"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "evernoteLogErrorString:", v15);

    __assert_rtn("+[ENSDKResourceLoader pathToResourceNamed:extension:]", "ENSDKResourceLoader.m", 39, "path");
  }

  return v11;
}

@end

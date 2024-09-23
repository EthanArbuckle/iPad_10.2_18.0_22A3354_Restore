@implementation NSXPCConnection(CRKAdditions)

+ (id)crk_studentDaemonConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.studentd"), objc_msgSend((id)objc_opt_class(), "crk_studentDaemonConnectionOptions"));
}

+ (id)crk_studentDaemonNonCatalystConnection
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "crk_studentDaemonConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CRKStudentDaemonXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRemoteObjectInterface:", v2);

  return v1;
}

+ (id)crk_screenshotServiceConnection
{
  void *v2;
  void *v3;

  CRKScreenshotServiceXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)crk_applicationInfoServiceConnection
{
  void *v2;
  void *v3;

  CRKApplicationInfoServiceXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)crk_internetDateServiceConnection
{
  void *v2;
  void *v3;

  CRKInternetDateFetchingXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)crk_booksServiceConnection
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.ClassroomKit.BooksService"));
  CRKBooksServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  return v0;
}

+ (uint64_t)crk_studentDaemonConnectionOptions
{
  return 4096;
}

+ (id)crk_screenshotServiceConnectionWithInterface:()CRKAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithServiceName:", CFSTR("com.apple.ClassroomKit.ScreenshotService"));
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  return v5;
}

@end

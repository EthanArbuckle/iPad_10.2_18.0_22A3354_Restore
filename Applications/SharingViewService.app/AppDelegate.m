@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (dword_1001A8110 <= 30)
  {
    if (dword_1001A8110 != -1 || (v6 = (id)_LogCategory_Initialize(&dword_1001A8110, 30), (_DWORD)v6))
      v6 = (id)LogPrintF(&dword_1001A8110, "-[AppDelegate application:didFinishLaunchingWithOptions:]", 30, "DidFinishLaunching\n");
  }
  SFAWDEnsureInitialized(v6);

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1001A8110 <= 30
    && ((v6 = v3, dword_1001A8110 != -1) || (v5 = _LogCategory_Initialize(&dword_1001A8110, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1001A8110, "-[AppDelegate applicationWillTerminate:]", 30, "WillTerminate\n");

  }
  else
  {

  }
}

@end

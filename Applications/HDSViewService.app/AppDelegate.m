@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
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
  if (dword_1000D4E90 <= 30
    && ((v6 = v3, dword_1000D4E90 != -1) || (v5 = _LogCategory_Initialize(&dword_1000D4E90, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1000D4E90, "-[AppDelegate applicationWillTerminate:]", 30, "applicationWillTerminate");

  }
  else
  {

  }
}

@end

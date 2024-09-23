@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "configuration", a3));
  v6 = objc_opt_self(_TtC10HearingApp27HearingSessionSceneDelegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "setDelegateClass:", v7);

  return v5;
}

@end

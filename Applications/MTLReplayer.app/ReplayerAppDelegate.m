@implementation ReplayerAppDelegate

- (void)_applicationDidFinishLaunching
{
  NSObject *v3;
  ReplayerViewController *v4;
  ReplayerViewController *replayerViewController;
  id v6;
  void *v7;
  UIWindow *v8;
  UIWindow *window;
  char *v10;
  uint64_t NewTransport;
  GTMTLReplayService *v12;
  GTMTLReplayService *replayFacility;
  void *v14;
  uint8_t v15[16];

  v3 = off_100012238;
  if (os_signpost_enabled((os_log_t)off_100012238))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "MTLReplayer application finished launching!", v15, 2u);
  }
  v4 = objc_alloc_init(ReplayerViewController);
  replayerViewController = self->_replayerViewController;
  self->_replayerViewController = v4;

  v6 = objc_alloc((Class)UIWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v8 = (UIWindow *)objc_msgSend(v6, "initWithFrame:");
  window = self->_window;
  self->_window = v8;

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_replayerViewController);
  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v10 = getenv("GT_HOST_URL_MTL");
  if (v10)
  {
    GTMTLReplayClient_createOldTransport(&self->_context, v10);
  }
  else
  {
    NewTransport = GTMTLReplayClient_createNewTransport(&self->_context);
    v12 = (GTMTLReplayService *)objc_claimAutoreleasedReturnValue(NewTransport);
    replayFacility = self->_replayFacility;
    self->_replayFacility = v12;

  }
  GTMTLReplayClient_setDisplayDelegate(&self->_context, self->_replayerViewController);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v14, "setIdleTimerDisabled:", 1);

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  -[ReplayerAppDelegate _applicationDidFinishLaunching](self, "_applicationDidFinishLaunching", a3, a4);
  return 1;
}

- (void).cxx_destruct
{
  id *p_isa;

  p_isa = (id *)&self->super.super.isa;
  objc_storeStrong((id *)&self->_replayFacility, 0);
  objc_storeStrong(p_isa + 39, 0);
  objc_storeStrong(p_isa + 38, 0);
  ++p_isa;

}

@end

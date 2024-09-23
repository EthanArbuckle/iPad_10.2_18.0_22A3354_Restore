@implementation CAMOverlayAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  v4 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CameraOverlayAngel launched.", v6, 2u);
  }

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));

  v8 = objc_msgSend(v6, "initWithName:sessionRole:", CFSTR("SBSUICameraOverlay Configuration"), v7);
  return v8;
}

@end

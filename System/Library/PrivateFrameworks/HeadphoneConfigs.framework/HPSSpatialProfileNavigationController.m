@implementation HPSSpatialProfileNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  void (**dismissalHandler)(void);
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HPSSpatialProfileNavigationController;
  -[HPSSpatialProfileNavigationController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Navigation Controller viewDidDisappear", v11, 2u);
  }

  v5 = (id)-[HPSSpatialProfileNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
  -[HPSSpatialProfileNavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Top View Controller is HPSSpatialProfileEnrollmentController", v11, 2u);
    }

    -[HPSSpatialProfileNavigationController topViewController](self, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewDidDisappear:", 1);

  }
  dismissalHandler = (void (**)(void))self->dismissalHandler;
  if (dismissalHandler)
    dismissalHandler[2]();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)dismissalHandler
{
  return self->dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->dismissalHandler, 0);
}

@end

@implementation BTDevicePicker

- (BTDevicePicker)initWithTitle:(id)a3 service:(unsigned int)a4 discoveryNameFilter:(id)a5
{
  id v9;
  id v10;
  BTDevicePicker *v11;
  void *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BTDevicePicker;
  v11 = -[BTDevicePicker init](&v14, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    objc_storeStrong((id *)&v11->_title, a3);
    v11->_service = a4;
    objc_storeStrong((id *)&v11->_predicate, a5);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSExtension *extension;
  NSString *title;
  NSPredicate *predicate;
  UIWindow_Custom *alertWindow;
  BTDevicePickerRemoteViewController *devicePickerRemoteViewController;
  objc_super v11;
  uint8_t buf[16];

  if (CBUILogInitOnce != -1)
    dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
  v3 = CBUILogComponent;
  if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227940000, v3, OS_LOG_TYPE_DEFAULT, "BTDevicePikcer dealloc", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  if (self->_extensionRequestIdentifier)
  {
    if (CBUILogInitOnce != -1)
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    v5 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227940000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling the extension", buf, 2u);
    }
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_extensionRequestIdentifier);
  }
  extension = self->_extension;
  self->_extension = 0;

  -[BTDevicePicker setDelegate:](self, "setDelegate:", 0);
  title = self->_title;
  self->_title = 0;

  predicate = self->_predicate;
  self->_predicate = 0;

  alertWindow = self->_alertWindow;
  self->_alertWindow = 0;

  devicePickerRemoteViewController = self->_devicePickerRemoteViewController;
  self->_devicePickerRemoteViewController = 0;

  v11.receiver = self;
  v11.super_class = (Class)BTDevicePicker;
  -[BTDevicePicker dealloc](&v11, sel_dealloc);
}

- (void)applicationWillResignActive:(id)a3
{
  -[BTDevicePicker dismissAnimated:](self, "dismissAnimated:", 0);
}

- (void)show
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.CoreBluetoothUI.BTDevicePickerUI"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTDevicePicker setExtension:](self, "setExtension:", v3);

  location = 0;
  objc_initWeak(&location, self);
  -[BTDevicePicker extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__BTDevicePicker_show__block_invoke;
  v5[3] = &unk_24F00C788;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __22__BTDevicePicker_show__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unsigned int *WeakRetained;
  unsigned int *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (v9 || !WeakRetained)
  {
    if (CBUILogInitOnce != -1)
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    v15 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_227940000, v15, OS_LOG_TYPE_DEFAULT, "Failed to launch extension 'com.apple.CoreBluetoothUI.BTDevicePickerUI' due to error: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (CBUILogInitOnce != -1)
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    v12 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_227940000, v12, OS_LOG_TYPE_DEFAULT, "Extension 'com.apple.CoreBluetoothUI.BTDevicePickerUI' launched successfully!", (uint8_t *)&v16, 2u);
    }
    objc_msgSend(v8, "set_delegate:", v11);
    objc_msgSend(v11, "setDevicePickerRemoteViewController:", v8);
    objc_msgSend(v11, "setExtensionRequestIdentifier:", v7);
    objc_msgSend(v11, "devicePickerRemoteViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createAlertWindowForRootViewController:", v13);

    objc_msgSend(v8, "serviceViewControllerProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "showBTDevicePickerWithTitle:Service:", *((_QWORD *)v11 + 2), v11[6]);

  }
}

- (void)createAlertWindowForRootViewController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIWindow_Custom *alertWindow;
  UIWindow_Custom *v12;
  void *v13;
  UIWindow_Custom *v14;
  UIWindow_Custom *v15;
  void *v16;
  UIWindow_Custom *v17;
  UIWindow_Custom *v18;
  id v19;

  v19 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v8, "window");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  if (v9)
  {
    alertWindow = self->_alertWindow;
    self->_alertWindow = 0;

    v12 = [UIWindow_Custom alloc];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v14 = -[UIWindow_Custom initWithFrame:](v12, "initWithFrame:");
    v15 = self->_alertWindow;
    self->_alertWindow = v14;

    -[UIWindow_Custom setRootViewController:](self->_alertWindow, "setRootViewController:", v19);
    -[UIWindow_Custom setWindowLevel:](self->_alertWindow, "setWindowLevel:", *MEMORY[0x24BDF8000] + 1.0);
    -[UIWindow_Custom makeKeyAndVisible](self->_alertWindow, "makeKeyAndVisible");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (UIWindow_Custom *)objc_claimAutoreleasedReturnValue();
    v18 = self->_alertWindow;
    self->_alertWindow = v17;

  }
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self->_devicePickerRemoteViewController, "serviceViewControllerProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAnimated:", v3);
  -[UIWindow_Custom rootViewController](self->_alertWindow, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, 0);

}

- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (CBUILogInitOnce != -1)
      dispatch_once_f(&CBUILogInitOnce, 0, (dispatch_function_t)CBUILogInit);
    v7 = CBUILogComponent;
    if (os_log_type_enabled((os_log_t)CBUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_227940000, v7, OS_LOG_TYPE_DEFAULT, "Calling didDismissWithResult delegate", v8, 2u);
    }
    -[BTDevicePickerDelegate devicePicker:didDismissWithResult:deviceAddress:](self->_delegate, "devicePicker:didDismissWithResult:deviceAddress:", self, a3, v6);
  }

}

- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4
{
  id v6;
  NSPredicate *predicate;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  predicate = self->_predicate;
  if (!predicate || -[NSPredicate evaluateWithObject:](predicate, "evaluateWithObject:", v9))
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self->_devicePickerRemoteViewController, "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayDevice:deviceAddress:", v9, v6);

  }
}

- (BTDevicePickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BTDevicePickerDelegate *)a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BTDevicePickerRemoteViewController)devicePickerRemoteViewController
{
  return self->_devicePickerRemoteViewController;
}

- (void)setDevicePickerRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_devicePickerRemoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePickerRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertWindow, 0);
}

@end

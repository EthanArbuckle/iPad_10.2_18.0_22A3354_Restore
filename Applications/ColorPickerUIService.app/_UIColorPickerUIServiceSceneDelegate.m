@implementation _UIColorPickerUIServiceSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  _UIColorPickerUIServiceSecureWindow *v7;
  void *v8;
  void *v9;
  _UIColorPickerUIServiceViewController *v10;

  v6 = a3;
  v7 = -[_UIColorPickerUIServiceSecureWindow initWithWindowScene:]([_UIColorPickerUIServiceSecureWindow alloc], "initWithWindowScene:", v6);

  -[_UIColorPickerUIServiceSceneDelegate setWindow:](self, "setWindow:", v7);
  v10 = objc_alloc_init(_UIColorPickerUIServiceViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerUIServiceSceneDelegate window](self, "window"));
  objc_msgSend(v8, "setRootViewController:", v10);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerUIServiceSceneDelegate window](self, "window"));
  objc_msgSend(v9, "makeKeyAndVisible");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end

@implementation MCAlertController

- (void)show
{
  id v3;

  v3 = objc_alloc(MEMORY[0x24BDF6FF8]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  -[MCAlertController setAlertWindow:](self, "setAlertWindow:", (id)objc_msgSend(v3, "initWithFrame:"));
  -[UIWindow setRootViewController:](-[MCAlertController alertWindow](self, "alertWindow"), "setRootViewController:", objc_alloc_init(MEMORY[0x24BDF6F98]));
  -[UIWindow setWindowLevel:](-[MCAlertController alertWindow](self, "alertWindow"), "setWindowLevel:", *MEMORY[0x24BDF8000] + 1.0);
  -[UIWindow makeKeyAndVisible](-[MCAlertController alertWindow](self, "alertWindow"), "makeKeyAndVisible");
  -[UIViewController presentViewController:animated:completion:](-[UIWindow rootViewController](-[MCAlertController alertWindow](self, "alertWindow"), "rootViewController"), "presentViewController:animated:completion:", self, 1, 0);
}

- (void)dismiss
{
  -[UIViewController dismissViewControllerAnimated:completion:](-[UIWindow rootViewController](-[MCAlertController alertWindow](self, "alertWindow"), "rootViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCAlertController;
  -[MCAlertController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[MCAlertController viewWillAppearHandler](self, "viewWillAppearHandler"))
    (*(void (**)(void))(-[MCAlertController viewWillAppearHandler](self, "viewWillAppearHandler") + 16))();
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCAlertController;
  -[MCAlertController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIWindow setHidden:](-[MCAlertController alertWindow](self, "alertWindow"), "setHidden:", 1);
  -[MCAlertController setAlertWindow:](self, "setAlertWindow:", 0);
  if (-[MCAlertController viewDidDisappearHandler](self, "viewDidDisappearHandler"))
    (*(void (**)(void))(-[MCAlertController viewDidDisappearHandler](self, "viewDidDisappearHandler") + 16))();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCAlertController;
  -[MCAlertController dealloc](&v3, sel_dealloc);
}

- (id)viewWillAppearHandler
{
  return self->_viewWillAppearHandler;
}

- (void)setViewWillAppearHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (id)viewDidDisappearHandler
{
  return self->_viewDidDisappearHandler;
}

- (void)setViewDidDisappearHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (UIWindow)alertWindow
{
  return self->_alertWindow;
}

- (void)setAlertWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1320);
}

@end

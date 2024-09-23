@implementation AlertController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlertController;
  -[AlertController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[AlertController _holdPresentingViewController](self, "_holdPresentingViewController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlertController;
  -[AlertController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[AlertController _releasePresentingViewController](self, "_releasePresentingViewController");
}

- (void)_holdPresentingViewController
{
  UIViewController *v3;
  UIViewController *presentingViewController;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  UIViewController *v9;
  int v10;
  UIViewController *v11;

  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[AlertController presentingViewController](self, "presentingViewController"));
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v3;

  v7 = LACLogAlertUI(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_presentingViewController;
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Holding %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)_releasePresentingViewController
{
  uint64_t v3;
  NSObject *v4;
  UIViewController *presentingViewController;
  UIViewController *v6;
  int v7;
  UIViewController *v8;

  v3 = LACLogAlertUI(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    presentingViewController = self->_presentingViewController;
    v7 = 138543362;
    v8 = presentingViewController;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Released %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = self->_presentingViewController;
  self->_presentingViewController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end

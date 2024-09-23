@implementation WebAuthenticationViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebAuthenticationViewController;
  -[WebAuthenticationViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_viewControllerDismissed:", UIPresentationControllerDismissalTransitionDidEndNotification, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebAuthenticationViewController;
  -[WebAuthenticationViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebAuthenticationViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);

  sub_100003404((id *)self);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)cancel
{
  -[ASWebAuthenticationSession cancel](self->_authenticationSession, "cancel");
}

- (void)_viewControllerDismissed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void (**viewControllerDismissedHandler)(void);
  id v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_100003894();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "View controller dismissed: %@", (uint8_t *)&v9, 0xCu);
  }

  viewControllerDismissedHandler = (void (**)(void))self->_viewControllerDismissedHandler;
  if (viewControllerDismissedHandler)
  {
    viewControllerDismissedHandler[2]();
    v8 = self->_viewControllerDismissedHandler;
    self->_viewControllerDismissedHandler = 0;

  }
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebAuthenticationViewController view](self, "view", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewControllerDismissedHandler, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
}

@end

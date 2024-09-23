@implementation AKRemoteBaseViewController

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)UIView);
  -[AKRemoteBaseViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKRemoteBaseViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[AKRemoteBaseViewController view](self, "view"));
  objc_msgSend(v6, "setClipsToBounds:", 0);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AKRemoteBaseViewController;
  -[AKRemoteBaseViewController viewDidLoad](&v2, "viewDidLoad");
}

@end

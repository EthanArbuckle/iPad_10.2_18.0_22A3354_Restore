@implementation LUIRecentUserGridViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LUIRecentUserGridViewController;
  -[LUIUserGridViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIRecentUserGridViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("LUIRecentUserGridView"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIRecentUserGridViewController;
  -[LUIMajorViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  objc_msgSend(v4, "updateRecentUsersViewController:", self);

}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 0;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  v6 = objc_msgSend(v5, "presentUserLimitIsReachedAlertIfNeeded");

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)LUIRecentUserGridViewController;
    -[LUIUserGridViewController bottomLeftVibrantButtonTapped:](&v7, "bottomLeftVibrantButtonTapped:", v4);
  }

}

- (void)update
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recentUsers"));
  -[LUIUserGridViewController setUsers:](self, "setUsers:", v3);

}

@end

@implementation CSUserPictureViewController

- (CSUserPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSUserPictureViewController *v4;
  void *v5;
  uint64_t v6;
  UMUser *user;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSUserPictureViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = objc_claimAutoreleasedReturnValue();
    user = v4->_user;
    v4->_user = (UMUser *)v6;

  }
  return v4;
}

+ (BOOL)isUserPictureSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSUserPictureViewController;
  -[CSUserPictureViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CSUserPictureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "contactForUser:", self->_user);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContact:", v4);

  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v3, 2);
  v5.receiver = self;
  v5.super_class = (Class)CSUserPictureViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  CSUserPictureView *userPictureView;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  userPictureView = self->_userPictureView;
  v8 = a4;
  -[CSUserPictureView setFrame:](userPictureView, "setFrame:", 0.0, 0.0, width, height);
  v9.receiver = self;
  v9.super_class = (Class)CSUserPictureViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSUserPictureViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v7, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 60, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style:", &unk_1E8E8A390);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v6);

}

- (int64_t)presentationPriority
{
  return 1;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 2;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  CSUserPictureView *userPictureView;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUserPictureViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v10, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    if (objc_msgSend(v4, "type") == 1)
    {
      userPictureView = self->_userPictureView;
      -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "legibilitySettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSUserPictureView setLegibilitySettings:](userPictureView, "setLegibilitySettings:", v8);

    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPictureView, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end

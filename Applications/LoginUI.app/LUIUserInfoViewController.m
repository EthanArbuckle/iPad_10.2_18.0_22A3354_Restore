@implementation LUIUserInfoViewController

- (LUIUserInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LUIUserInfoViewController *v4;
  LUIUserInfoView *v5;
  LUIUserInfoView *userInfoView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LUIUserInfoViewController;
  v4 = -[LUIUserInfoViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[LUIUserInfoView initWithFrame:]([LUIUserInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    userInfoView = v4->_userInfoView;
    v4->_userInfoView = v5;

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LUIUserInfoViewController;
  -[LUIUserInfoViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController userInfoView](self, "userInfoView"));
  objc_msgSend(v3, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v5 = v4;
  v7 = v6;

  -[LUIUserInfoViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController userInfoView](self, "userInfoView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController userInfoView](self, "userInfoView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController userInfoView](self, "userInfoView"));
  -[LUIUserInfoViewController setView:](self, "setView:", v11);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LUIUserInfoViewController;
  -[LUIUserInfoViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)okButtonPressed:(id)a3
{
  -[LUIUserInfoViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setUser:(id)a3
{
  LKUser *v5;
  void *v6;
  void *v7;
  LKUser *v8;

  v5 = (LKUser *)a3;
  if (self->_user != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_user, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController user](self, "user"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoViewController userInfoView](self, "userInfoView"));
    objc_msgSend(v7, "setUser:", v6);

    v5 = v8;
  }

}

- (LKUser)user
{
  return self->_user;
}

- (LUIUserInfoView)userInfoView
{
  return self->_userInfoView;
}

- (void)setUserInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoView, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end

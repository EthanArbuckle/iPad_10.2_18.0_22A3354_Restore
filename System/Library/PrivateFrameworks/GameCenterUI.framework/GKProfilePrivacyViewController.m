@implementation GKProfilePrivacyViewController

- (void)viewDidLoad
{
  GKProfilePrivacyViewController *v2;

  v2 = self;
  ProfilePrivacyViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  GKProfilePrivacyViewController *v4;

  v4 = self;
  ProfilePrivacyViewController.viewWillAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  GKProfilePrivacyViewController *v4;

  v4 = self;
  ProfilePrivacyViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  GKProfilePrivacyViewController *v4;

  v4 = self;
  ProfilePrivacyViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  GKProfilePrivacyViewController *v4;

  v4 = self;
  ProfilePrivacyViewController.viewWillDisappear(_:)(a3);

}

- (GKProfilePrivacyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (GKProfilePrivacyViewController *)ProfilePrivacyViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKProfilePrivacyViewController)initWithCoder:(id)a3
{
  return (GKProfilePrivacyViewController *)ProfilePrivacyViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKProfilePrivacyViewController____lazy_storage___profilePrivacyView));
}

@end

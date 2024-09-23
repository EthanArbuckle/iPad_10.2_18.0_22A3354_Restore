@implementation GKProfileCreatedViewController

- (void)viewIsAppearing:(BOOL)a3
{
  GKProfileCreatedViewController *v4;

  v4 = self;
  ProfileCreatedViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidLoad
{
  GKProfileCreatedViewController *v2;

  v2 = self;
  ProfileCreatedViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  GKProfileCreatedViewController *v4;

  v4 = self;
  ProfileCreatedViewController.viewDidAppear(_:)(a3);

}

- (GKProfileCreatedViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (GKProfileCreatedViewController *)ProfileCreatedViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKProfileCreatedViewController)initWithCoder:(id)a3
{
  return (GKProfileCreatedViewController *)ProfileCreatedViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKProfileCreatedViewController____lazy_storage___profileCreatedView));
}

@end

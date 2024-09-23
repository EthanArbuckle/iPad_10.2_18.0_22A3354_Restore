@implementation LoadingViewController

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9DAF028();
}

- (UINavigationItem)navigationItem
{
  _TtC27AppleMediaServicesUIDynamic21LoadingViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B9DAF12C((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  _TtC27AppleMediaServicesUIDynamic21LoadingViewController *v2;

  v2 = self;
  sub_1B9DAF1D8();

}

- (void)viewDidLoad
{
  _TtC27AppleMediaServicesUIDynamic21LoadingViewController *v2;

  v2 = self;
  sub_1B9DAF2C8();

}

- (void)viewWillLayoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic21LoadingViewController *v2;

  v2 = self;
  sub_1B9DAF32C();

}

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)init
{
  sub_1B9DAF894();
}

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B9DE2160();
  v5 = a4;
  sub_1B9DAF8CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic21LoadingViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic21LoadingViewController_loadingView));
}

@end

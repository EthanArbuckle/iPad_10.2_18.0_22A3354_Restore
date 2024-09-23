@implementation BaseViewController

- (_TtC12GameCenterUI18BaseViewController)init
{
  return (_TtC12GameCenterUI18BaseViewController *)BaseViewController.init()();
}

- (_TtC12GameCenterUI18BaseViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5F673C();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI18BaseViewController *v2;

  v2 = self;
  sub_1AB5F711C((SEL *)&selRef_viewDidLoad);

}

- (void)loadView
{
  _TtC12GameCenterUI18BaseViewController *v2;

  v2 = self;
  sub_1AB5F6AC4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI18BaseViewController *v4;

  v4 = self;
  sub_1AB5F6E08(a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI18BaseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5F65E8();

}

- (_TtC12GameCenterUI18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  BaseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18BaseViewController_scrollObserver));
  swift_release();
}

@end

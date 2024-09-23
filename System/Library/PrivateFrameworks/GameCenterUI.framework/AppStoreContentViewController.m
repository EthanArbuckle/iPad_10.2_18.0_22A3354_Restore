@implementation AppStoreContentViewController

- (_TtC12GameCenterUI29AppStoreContentViewController)initWithGameRecord:(id)a3
{
  id v3;
  _TtC12GameCenterUI29AppStoreContentViewController *result;

  v3 = a3;
  AppStoreContentViewController.init(gameRecord:)();
  return result;
}

- (_TtC12GameCenterUI29AppStoreContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5B6188();
}

- (void)dealloc
{
  _TtC12GameCenterUI29AppStoreContentViewController *v2;

  v2 = self;
  AppStoreContentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29AppStoreContentViewController_bootstrapPresenter));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29AppStoreContentViewController_appStoreContentView));
  swift_bridgeObjectRelease();
}

- (int64_t)preferredLargeTitleDisplayMode
{
  return sub_1AB5B63E8();
}

- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3
{
  sub_1AB5B641C(a3);
}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  id v2;

  sub_1AB5B644C();
  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5;
  _TtC12GameCenterUI29AppStoreContentViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5B64BC((uint64_t)a3);

}

- (UIScrollView)scrollView
{
  id v2;

  sub_1AB5B64F0();
  return (UIScrollView *)v2;
}

- (BOOL)isDeeplinked
{
  return sub_1AB5B66AC() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  sub_1AB5B66E0(a3);
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI29AppStoreContentViewController *v2;

  v2 = self;
  sub_1AB5B6708();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI29AppStoreContentViewController *v4;

  v4 = self;
  sub_1AB5B69F0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI29AppStoreContentViewController *v4;

  v4 = self;
  sub_1AB5B6AC0(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI29AppStoreContentViewController *v2;

  v2 = self;
  sub_1AB5B6C08();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI29AppStoreContentViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5B6CEC((uint64_t)a3);

}

- (_TtC12GameCenterUI29AppStoreContentViewController)init
{
  AppStoreContentViewController.init()();
}

@end

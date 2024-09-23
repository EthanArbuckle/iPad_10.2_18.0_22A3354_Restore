@implementation JetDashboardViewController

- (_TtC12GameCenterUI26JetDashboardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  JetDashboardViewController.init(coder:)();
}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  return (_TtC12GameCenterUI18BaseSplitPresenter *)sub_1AB51C068();
}

- (void)setDataPresenter:(id)a3
{
  id v4;
  _TtC12GameCenterUI26JetDashboardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB51C0C0();

}

- (void)viewDidLoad
{
  _TtC12GameCenterUI26JetDashboardViewController *v2;

  v2 = self;
  JetDashboardViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;

  v4 = self;
  JetDashboardViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;

  v4 = self;
  JetDashboardViewController.viewWillDisappear(_:)(a3);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC12GameCenterUI26JetDashboardViewController *v6;

  v5 = a3;
  v6 = self;
  JetDashboardViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;

  v4 = self;
  JetDashboardViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI26JetDashboardViewController *v2;

  v2 = self;
  JetDashboardViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI26JetDashboardViewController *v6;
  _TtC12GameCenterUI26JetDashboardViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  JetDashboardViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;

  v4 = self;
  JetDashboardViewController.viewDidDisappear(_:)(a3);

}

- (PSRootController)_rootController
{
  id v2;

  sub_1AB51FD18();
  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5;
  _TtC12GameCenterUI26JetDashboardViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB51FD88((uint64_t)a3);

}

- (PSSpecifier)_specifier
{
  id v2;

  sub_1AB51FDB4();
  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5;
  _TtC12GameCenterUI26JetDashboardViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB51FE24((uint64_t)a3);

}

- (void)didSelectPlayerAvatarView:(id)a3
{
  id v4;
  _TtC12GameCenterUI26JetDashboardViewController *v5;

  v4 = a3;
  v5 = self;
  JetDashboardViewController.didSelectPlayerAvatarView(_:)((GKDashboardPlayerPhotoView_optional *)v5);

}

- (void)donePressed:(id)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;
  _TtC12GameCenterUI26JetDashboardViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB5200A8();

  sub_1AB47A074((uint64_t)v6, (uint64_t *)&unk_1EEBFBCA0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_dashboardPresenter));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_request);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_clippingLayer);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_badgeablePhotoView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_navigationBarBadgeablePhotoView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController__rootController);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController__specifier));
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI26JetDashboardViewController *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB520284();

  swift_bridgeObjectRelease();
}

@end

@implementation BannerViewController

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8SOSBuddy20BannerViewController_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_presentableContext, a3);
}

- (_TtC8SOSBuddy20BannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001ED794();
}

- (void)loadView
{
  _TtC8SOSBuddy20BannerViewController *v2;

  v2 = self;
  sub_1001EC2E8();

}

- (void)viewDidLoad
{
  _TtC8SOSBuddy20BannerViewController *v2;

  v2 = self;
  sub_1001EC688();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8SOSBuddy20BannerViewController *v4;

  v4 = self;
  sub_1001EC9B8(a3, "[%{public}s] viewWillAppear", (SEL *)&selRef_viewWillAppear_);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8SOSBuddy20BannerViewController *v4;

  v4 = self;
  sub_1001EC9B8(a3, "[%{public}s] viewDidAppear", (SEL *)&selRef_viewDidAppear_);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8SOSBuddy20BannerViewController *v4;

  v4 = self;
  sub_1001EC9B8(a3, "[%{public}s] viewDidDisappear", (SEL *)&selRef_viewDidDisappear_);

}

+ (BOOL)_isSecureForRemoteViewService
{
  swift_getObjCClassMetadata(a1);
  sub_1001ECC08();
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  _TtC8SOSBuddy20BannerViewController *v2;

  v2 = self;
  sub_1001ECDA8();

  return 1;
}

- (void)didTap
{
  _TtC8SOSBuddy20BannerViewController *v2;

  v2 = self;
  sub_1001ECF68();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8SOSBuddy20BannerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001ED194(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (_TtC8SOSBuddy20BannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy20BannerViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy20BannerViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.BannerViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterId[OBJC_IVAR____TtC8SOSBuddy20BannerViewController_requesterId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterId[OBJC_IVAR____TtC8SOSBuddy20BannerViewController_requestId]);
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_contentProducer);
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_delegate);

  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_presentableContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_dismissalPreventionAssertion));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_subscriptions));
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_1001ED508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8SOSBuddy20BannerViewController_requesterId);
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_1001ED508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8SOSBuddy20BannerViewController_requestId);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  _TtC8SOSBuddy20BannerViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1001ED8AC();
  swift_unknownObjectRelease(a3);

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  _TtC8SOSBuddy20BannerViewController *v7;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_delegate);
  if (Strong)
  {
    v6 = Strong;
    swift_unknownObjectRetain(a3);
    v7 = self;
    sub_1001B4FE8(v7);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v6);
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v7;
  _TtC8SOSBuddy20BannerViewController *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_1001ED97C(a4);
  swift_unknownObjectRelease(a3);

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC8SOSBuddy20BannerViewController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_delegate);
  if (Strong)
  {
    if (a4)
    {
      v8 = Strong;
      swift_unknownObjectRetain(a3);
      v9 = a4;
      v10 = self;
      sub_1001B48B4(v10, v9);
      swift_unknownObjectRelease(a3);

      swift_unknownObjectRelease(v8);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC8SOSBuddy20BannerViewController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_delegate);
  if (Strong)
  {
    v8 = Strong;
    swift_unknownObjectRetain(a3);
    v9 = a4;
    v10 = self;
    sub_1001B5F6C(v10, v9);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v8);
  }
}

@end

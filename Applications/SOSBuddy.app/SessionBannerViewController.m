@implementation SessionBannerViewController

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_presentableContext, a3);
}

- (_TtC8SOSBuddy27SessionBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002096F4();
}

- (void)loadView
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;

  v2 = self;
  sub_100205908();

}

- (void)viewDidLoad
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;

  v2 = self;
  sub_100205D70();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8SOSBuddy27SessionBannerViewController *v4;

  v4 = self;
  sub_1002060A0(a3, "[%{public}s] viewWillAppear", (SEL *)&selRef_viewWillAppear_);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8SOSBuddy27SessionBannerViewController *v4;

  v4 = self;
  sub_1002060A0(a3, "[%{public}s] viewDidAppear", (SEL *)&selRef_viewDidAppear_);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8SOSBuddy27SessionBannerViewController *v4;

  v4 = self;
  sub_1002060A0(a3, "[%{public}s] viewDidDisappear", (SEL *)&selRef_viewDidDisappear_);

}

+ (BOOL)_isSecureForRemoteViewService
{
  swift_getObjCClassMetadata(a1);
  sub_1001ECC08();
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;

  v2 = self;
  sub_1001ECDA8();

  return 1;
}

- (void)didTap
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;

  v2 = self;
  sub_100206344();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8SOSBuddy27SessionBannerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100206850(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (_TtC8SOSBuddy27SessionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy27SessionBannerViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy27SessionBannerViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.SessionBannerViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__requesterId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__requestId]);
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__contentProducer);
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__delegate);
  sub_100209D88(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content), *(void **)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content], *(void **)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content + 8], *(void **)&self->_requestId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_tapGesture));
  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_presentableContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_dismissalPreventionAssertion));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__subscriptions));
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  double v4;
  _TtC8SOSBuddy27SessionBannerViewController *v5;

  v5 = self;
  sub_1002076A0(a3, v4);

}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  _TtC8SOSBuddy27SessionBannerViewController *v4;

  v4 = self;
  sub_100207F9C(a3);

}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)contentRole
{
  return 2;
}

- (double)preferredHeightForBottomSafeArea
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1002081F8();
  v4 = v3;

  return v4;
}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierStewie;
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;
  void *v3;

  v2 = self;
  v3 = sub_10020833C();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;
  void *v3;

  v2 = self;
  v3 = sub_1002083D8();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  _TtC8SOSBuddy27SessionBannerViewController *v2;
  void *v3;

  v2 = self;
  v3 = sub_10020847C();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (unint64_t)presentationBehaviors
{
  return 33;
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  return 0x20000000;
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_1001ED508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__requesterId);
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_1001ED508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__requestId);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  sub_10020875C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_100209968);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  sub_10020875C(self, (uint64_t)a2, (uint64_t)a3, sub_100209A58);
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  sub_1002087CC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void *))sub_100209BA0);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  sub_1002087CC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void *))sub_100209C48);
}

@end

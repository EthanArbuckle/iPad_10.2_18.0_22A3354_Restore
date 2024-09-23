@implementation GamePolicyBannerViewController

- (void)loadView
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v2;
  id v3;
  id v4;
  id v5;

  v2 = self;
  -[GamePolicyBannerViewController setOverrideUserInterfaceStyle:](v2, "setOverrideUserInterfaceStyle:", 2);
  v3 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  -[GamePolicyBannerViewController setView:](v2, "setView:", v3);

  v4 = -[GamePolicyBannerViewController view](v2, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v2;

  v2 = self;
  sub_10005DE00();

}

- (void)open:(id)a3
{
  sub_10005EF34(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10005EB4C);
}

- (void)toggleGameMode:(id)a3
{
  sub_10005EF34(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10005EE60);
}

- (void)showControlCenter:(id)a3
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v5;
  uint64_t v6;
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_10005EFA8((uint64_t)v8);

  sub_1000607F8((uint64_t)v8);
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (NSString)requesterIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)requestIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->bundleIdentifier[OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_bannerRequestIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v2 = self;
  -[GamePolicyBannerViewController loadViewIfNeeded](v2, "loadViewIfNeeded");
  v7 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView);
  if (v7)
  {
    objc_msgSend(v7, "shadowOutsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v3 = v9;
    v4 = v11;
    v5 = v13;
    v6 = v15;
  }
  else
  {
    __break(1u);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = self;
  -[GamePolicyBannerViewController loadViewIfNeeded](v4, "loadViewIfNeeded");
  v7 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView);
  if (v7)
  {
    objc_msgSend(v7, "intrinsicContentSize");
    v9 = v8;
    v11 = v10;

    v5 = v9;
    v6 = v11;
  }
  else
  {
    __break(1u);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v5;
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  v6 = os_transaction_create("com.apple.GameOverlayUI");
  v7 = *(uint64_t *)((char *)&v5->super.super.super.isa
                  + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_transaction);
  *(Class *)((char *)&v5->super.super.super.isa
           + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_transaction) = (Class)v6;
  swift_unknownObjectRelease(a3);

  swift_unknownObjectRelease(v7);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v5;
  _BOOL4 IsVoiceOverRunning;
  double v7;

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v7 = 3.0;
  if (IsVoiceOverRunning)
    v7 = 9.0;
  sub_10005D8A0(v7);

  swift_unknownObjectRelease(a3);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v7;
  _TtC13GameOverlayUI30GamePolicyBannerViewController *v8;

  swift_unknownObjectRetain(a3, a2);
  v7 = a4;
  v8 = self;
  sub_100060780();
  swift_unknownObjectRelease(a3);

}

- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  _TtC13GameOverlayUI20GameOverlayUIService *v6;
  _TtC13GameOverlayUI20GameOverlayUIService *v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13GameOverlayUI30GamePolicyBannerViewController *)sub_10005FFA4(v5, v7, a4);
}

- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithCoder:(id)a3
{
  return (_TtC13GameOverlayUI30GamePolicyBannerViewController *)sub_1000601D4(a3);
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  swift_bridgeObjectRelease(*(_TtC13GameOverlayUI20GameOverlayUIService **)&self->bundleIdentifier[OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_bundleIdentifier], a2, v2, v3, v4, v5, v6, v7);
  sub_100050580(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_tapHandler), *(_QWORD *)&self->bundleIdentifier[OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_tapHandler]);
  sub_100050580(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_dismissHandler), *(_QWORD *)&self->bundleIdentifier[OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_dismissHandler]);
  swift_bridgeObjectRelease(*(_TtC13GameOverlayUI20GameOverlayUIService **)&self->bundleIdentifier[OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_bannerRequestIdentifier], v9, v10, v11, v12, v13, v14, v15);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_bannerSource));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_transaction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_stateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_timer));
}

@end

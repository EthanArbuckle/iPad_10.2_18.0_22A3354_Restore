@implementation TapToRadarBannerViewController

- (_TtC15ConversationKit30TapToRadarBannerViewController)init
{
  return (_TtC15ConversationKit30TapToRadarBannerViewController *)TapToRadarBannerViewController.init()();
}

- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  TapToRadarBannerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit30TapToRadarBannerViewController *v2;

  v2 = self;
  TapToRadarBannerViewController.viewDidLoad()();

}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC15ConversationKit30TapToRadarBannerViewController *v5;

  v4 = a3;
  v5 = self;
  TapToRadarBannerViewController.handleTap(_:)((UITapGestureRecognizer_optional *)v5);

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  _TtC15ConversationKit30TapToRadarBannerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  TapToRadarBannerViewController.presentableWillAppear(asBanner:)();
  swift_unknownObjectRelease();

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  _TtC15ConversationKit30TapToRadarBannerViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  TapToRadarBannerViewController.presentableWillDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  TapToRadarBannerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillLeadingImageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillTrailingImageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillViewSubtitle);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillViewTitle);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController____lazy_storage___bannerSource));
}

- (NSString)requestIdentifier
{
  uint64_t v2;
  void *v3;

  TapToRadarBannerViewController.requestIdentifier.getter();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1C3B72E00]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (UIViewController)viewController
{
  return (UIViewController *)TapToRadarBannerViewController.viewController.getter();
}

- (NSString)requesterIdentifier
{
  _TtC15ConversationKit30TapToRadarBannerViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = TapToRadarBannerViewController.requesterIdentifier.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit30TapToRadarBannerViewController *v6;
  unint64_t v7;
  unint64_t v8;
  CGSize v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v9 = TapToRadarBannerViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  v10 = v9.width;
  v11 = v9.height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC15ConversationKit30TapToRadarBannerViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  TapToRadarBannerViewController.bannerContentOutsets.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end

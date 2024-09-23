@implementation MutedTalkerBannerViewController

- (CNKMutedTalkerBannerViewControllerDelegate)delegate
{
  return (CNKMutedTalkerBannerViewControllerDelegate *)(id)MutedTalkerBannerViewController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  MutedTalkerBannerViewController.delegate.setter();

}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)init
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *result;

  MutedTalkerBannerViewController.init()();
  return result;
}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  MutedTalkerBannerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v2;

  v2 = self;
  MutedTalkerBannerViewController.viewDidLoad()();

}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC15ConversationKit31MutedTalkerBannerViewController *v5;

  v4 = a3;
  v5 = self;
  MutedTalkerBannerViewController.handleTap(_:)((UITapGestureRecognizer_optional *)v5);

}

- (void)updatePillViewWithIsMuted:(BOOL)a3
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v4;

  v4 = self;
  MutedTalkerBannerViewController.updatePillView(isMuted:)(a3);

}

- (void)playBannerSound
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v2;

  v2 = self;
  MutedTalkerBannerViewController.playBannerSound()();

}

- (void)showBanner
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v2;

  v2 = self;
  MutedTalkerBannerViewController.showBanner()();

}

- (void)dismissBanner
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v2;

  v2 = self;
  MutedTalkerBannerViewController.dismissBanner()();

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  MutedTalkerBannerViewController.presentableWillAppear(asBanner:)();
  swift_unknownObjectRelease();

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  _TtC15ConversationKit31MutedTalkerBannerViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  MutedTalkerBannerViewController.presentableWillDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  MutedTalkerBannerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillImageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillViewSubtitle);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillViewTitle);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_bannerSource);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_delegate);
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (NSString)requestIdentifier
{
  uint64_t v2;
  void *v3;

  MutedTalkerBannerViewController.requestIdentifier.getter();
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
  return (UIViewController *)MutedTalkerBannerViewController.viewController.getter();
}

- (NSString)requesterIdentifier
{
  void *v2;

  MutedTalkerBannerViewController.requesterIdentifier.getter();
  v2 = (void *)MEMORY[0x1C3B72E00](0xD000000000000037);
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit31MutedTalkerBannerViewController *v6;
  unint64_t v7;
  unint64_t v8;
  CGSize v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v9 = MutedTalkerBannerViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  v10 = v9.width;
  v11 = v9.height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC15ConversationKit31MutedTalkerBannerViewController *v2;
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
  MutedTalkerBannerViewController.bannerContentOutsets.getter();
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

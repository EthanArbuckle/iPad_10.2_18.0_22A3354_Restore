@implementation SystemBannerHostViewController

- (NSString)requesterIdentifier
{
  uint64_t v2;
  void *v3;

  SystemBannerHostViewController.requesterIdentifier.getter();
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

- (void)setRequesterIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15ConversationKit30SystemBannerHostViewController *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  SystemBannerHostViewController.requesterIdentifier.setter(v4, v6);

}

- (BNPresentableContext)presentableContext
{
  SystemBannerHostViewController.presentableContext.getter();
}

- (void)setPresentableContext:(id)a3
{
  _TtC15ConversationKit30SystemBannerHostViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  SystemBannerHostViewController.presentableContext.setter();

}

- (_TtC15ConversationKit30SystemBannerHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemBannerHostViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;

  v2 = self;
  SystemBannerHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_delegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_controlsManager);
  OUTLINED_FUNCTION_102();
  outlined destroy of ConversationControlsType((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_controlsType);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_notice, (uint64_t *)&demangling cache variable for type metadata for Notice?);
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController____lazy_storage___captureOnlyBackdropView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_shadowView);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_overriddenSystemApertureContent, &demangling cache variable for type metadata for SystemBannerHostViewController.OverriddenSystemApertureContent?);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_conversationControlsViewController);
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_layoutDescription);
  OUTLINED_FUNCTION_195_1();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_presentableContext);
  OUTLINED_FUNCTION_195_1();
  OUTLINED_FUNCTION_195_1();
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_activityUUID;
  v4 = OUTLINED_FUNCTION_33_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_195_1();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_features);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_notificationCenter);
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_leadingViewContainer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_trailingViewContainer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_minimalViewContainer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_detachedMinimalViewContainer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_elementIdentifier);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_keyColor));
}

- (void)contextMenuWillPresent:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SystemBannerHostViewController.contextMenuWillPresent(_:));
}

- (void)contextMenuDidDismiss:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SystemBannerHostViewController.contextMenuDidDismiss(_:));
}

- (void)handleSceneStateChangeNotification:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SystemBannerHostViewController.handleSceneStateChangeNotification(_:));
}

- (void)callStatusChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit30SystemBannerHostViewController *v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  SystemBannerHostViewController.callStatusChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)callDisplayContextChanged:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SystemBannerHostViewController.callDisplayContextChanged(_:));
}

- (void)viewDidLoad
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;

  v2 = self;
  SystemBannerHostViewController.viewDidLoad()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC15ConversationKit30SystemBannerHostViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  SystemBannerHostViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;

  v2 = self;
  SystemBannerHostViewController.viewWillLayoutSubviews()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didMoveToParentViewController:(id)a3
{
  _TtC15ConversationKit30SystemBannerHostViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  SystemBannerHostViewController.didMove(toParent:)((UIViewController_optional *)a3);

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  @objc SystemBannerHostViewController.userInteractionWillBeginForBanner(for:)(self, (uint64_t)a2, (uint64_t)a3, SystemBannerHostViewController.userInteractionWillBeginForBanner(for:));
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  @objc SystemBannerHostViewController.userInteractionWillBeginForBanner(for:)(self, (uint64_t)a2, (uint64_t)a3, SystemBannerHostViewController.userInteractionDidEndForBanner(for:));
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  @objc SystemBannerHostViewController.userInteractionWillBeginForBanner(for:)(self, (uint64_t)a2, (uint64_t)a3, SystemBannerHostViewController.presentableWillAppear(asBanner:));
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  @objc SystemBannerHostViewController.userInteractionWillBeginForBanner(for:)(self, (uint64_t)a2, (uint64_t)a3, SystemBannerHostViewController.presentableDidAppear(asBanner:));
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  _TtC15ConversationKit30SystemBannerHostViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  SystemBannerHostViewController.presentableDidDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();

}

- (UIViewController)viewController
{
  SystemBannerHostViewController.viewController.getter();
  return (UIViewController *)self;
}

- (NSString)requestIdentifier
{
  void *v2;

  SystemBannerHostViewController.requestIdentifier.getter();
  v2 = (void *)MEMORY[0x1C3B72E00]();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
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
  UIEdgeInsets result;

  v2 = self;
  v3 = SystemBannerHostViewController.bannerContentOutsets.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  char v3;
  char v4;

  v2 = self;
  SystemBannerHostViewController.isTouchOutsideDismissalEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isDraggingDismissalEnabled
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  BOOL v3;

  v2 = self;
  v3 = SystemBannerHostViewController.eligibleForDismissal.getter();

  return v3;
}

- (BOOL)isDraggingInteractionEnabled
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  char v3;

  v2 = self;
  v3 = SystemBannerHostViewController.isDraggingInteractionEnabled.getter();

  return v3 & 1;
}

- (BSAnimationSettings)bannerSizeTransitionAnimationSettings
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  id v3;

  v2 = self;
  v3 = SystemBannerHostViewController.bannerSizeTransitionAnimationSettings.getter();

  return (BSAnimationSettings *)v3;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit30SystemBannerHostViewController *v6;
  unint64_t v7;
  unint64_t v8;
  CGSize v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v9 = SystemBannerHostViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  v10 = v9.width;
  v11 = v9.height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (SBUISystemApertureElement)systemApertureElementViewController
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;

  v2 = self;
  SystemBannerHostViewController.systemApertureElementViewController.getter();

  return (SBUISystemApertureElement *)v2;
}

- (int64_t)activeLayoutMode
{
  int64_t result;

  SystemBannerHostViewController.activeLayoutMode.getter();
  return result;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  SystemBannerHostViewController.activeLayoutMode.setter(a3);
}

- (BOOL)canRequestAlertingAssertion
{
  char v2;

  SystemBannerHostViewController.canRequestAlertingAssertion.getter();
  return v2 & 1;
}

- (void)setCanRequestAlertingAssertion:(BOOL)a3
{
  _TtC15ConversationKit30SystemBannerHostViewController *v4;

  v4 = self;
  SystemBannerHostViewController.canRequestAlertingAssertion.setter(a3);

}

- (int64_t)contentRole
{
  return SystemBannerHostViewController.contentRole.getter();
}

- (int64_t)preferredLayoutMode
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = SystemBannerHostViewController.preferredLayoutMode.getter();

  return v3;
}

- (int64_t)maximumLayoutMode
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = SystemBannerHostViewController.maximumLayoutMode.getter();

  return v3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  id v2;

  SystemBannerHostViewController.leadingView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  id v2;

  SystemBannerHostViewController.trailingView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  id v2;

  SystemBannerHostViewController.minimalView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  id v2;

  SystemBannerHostViewController.detachedMinimalView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (NSString)elementIdentifier
{
  id v2;

  SystemBannerHostViewController.elementIdentifier.getter();
  return (NSString *)v2;
}

- (NSString)associatedAppBundleIdentifier
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SystemBannerHostViewController.associatedAppBundleIdentifier.getter();
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

- (NSSet)backgroundActivitiesToSuppress
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  Class isa;

  v2 = self;
  SystemBannerHostViewController.backgroundActivitiesToSuppress.getter();

  type metadata accessor for STBackgroundActivityIdentifier(0);
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type STBackgroundActivityIdentifier and conformance STBackgroundActivityIdentifier, type metadata accessor for STBackgroundActivityIdentifier);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (unint64_t)presentationBehaviors
{
  _TtC15ConversationKit30SystemBannerHostViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = SystemBannerHostViewController.presentationBehaviors.getter();

  return v3;
}

- (UIColor)keyColor
{
  id v2;

  SystemBannerHostViewController.keyColor.getter();
  return (UIColor *)v2;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _TtC15ConversationKit30SystemBannerHostViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  SystemBannerHostViewController.viewWillLayoutSubviews(with:)();

  swift_unknownObjectRelease();
}

- (_TtC15ConversationKit30SystemBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  SystemBannerHostViewController.init(nibName:bundle:)();
}

@end

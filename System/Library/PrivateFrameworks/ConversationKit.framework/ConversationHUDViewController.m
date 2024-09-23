@implementation ConversationHUDViewController

- (_TtC15ConversationKit29ConversationHUDViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit29ConversationHUDViewController *v2;

  v2 = self;
  ConversationHUDViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit29ConversationHUDViewController *v6;
  _TtC15ConversationKit29ConversationHUDViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ConversationHUDViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC15ConversationKit29ConversationHUDViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  ConversationHUDViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)statusViewTapped
{
  _TtC15ConversationKit29ConversationHUDViewController *v2;

  v2 = self;
  ConversationHUDViewController.statusViewTapped()();

}

- (void)showCallDetailsButtonTapped
{
  _TtC15ConversationKit29ConversationHUDViewController *v2;

  v2 = self;
  ConversationHUDViewController.showCallDetailsButtonTapped()();

}

- (void)appLaunchButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit29ConversationHUDViewController *v5;

  v4 = a3;
  v5 = self;
  ConversationHUDViewController.appLaunchButtonTapped(_:)((UITapGestureRecognizer *)v5);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29ConversationHUDViewController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = ConversationHUDViewController.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer *)v8, (UITouch)v7);

  return v9;
}

- (_TtC15ConversationKit29ConversationHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ConversationHUDViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_controlsManager));
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_shadowProperties);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController____lazy_storage___backgroundMaterialView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_controlsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_menuContainerView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_appLaunchPillView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_detailsHeightLayoutConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_detailsWidthLayoutConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_topConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_bottomConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_shareCardViewController);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_delegate);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_recipe, (uint64_t *)&demangling cache variable for type metadata for ConversationControlsRecipe?);
  OUTLINED_FUNCTION_0();
}

@end

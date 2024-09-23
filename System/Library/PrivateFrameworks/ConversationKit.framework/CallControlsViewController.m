@implementation CallControlsViewController

- (_TtC15ConversationKit26CallControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CallControlsViewController.init(coder:)();
}

- (void)loadView
{
  _TtC15ConversationKit26CallControlsViewController *v2;

  v2 = self;
  CallControlsViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC15ConversationKit26CallControlsViewController *v2;

  v2 = self;
  CallControlsViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15ConversationKit26CallControlsViewController *v4;

  v4 = self;
  CallControlsViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit26CallControlsViewController *v2;

  v2 = self;
  CallControlsViewController.viewDidLayoutSubviews()();

}

- (_TtC15ConversationKit26CallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  CallControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_captionsStateController);
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_rosterViewProvider);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_controlsManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_service);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___statusView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___menuViewController);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarTrailingVisible);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarTrailingHidden);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarViewController));
}

@end

@implementation CallControlsSidebarViewController

- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CallControlsSidebarViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit33CallControlsSidebarViewController *v2;

  v2 = self;
  CallControlsSidebarViewController.viewDidLoad()();

}

- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  CallControlsSidebarViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___contentView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___detailsViewController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___topConverView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___bottomBlurView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController_controlsManager);
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController_captionsStateController);
}

- (BOOL)isCaptioningEnabled
{
  _TtC15ConversationKit33CallControlsSidebarViewController *v2;
  char v3;

  v2 = self;
  v3 = CallControlsSidebarViewController.isCaptioningEnabled.getter();

  return v3 & 1;
}

- (void)wantsDismissal
{
  _TtC15ConversationKit33CallControlsSidebarViewController *v2;

  v2 = self;
  CallControlsSidebarViewController.wantsDismissal()();

}

@end

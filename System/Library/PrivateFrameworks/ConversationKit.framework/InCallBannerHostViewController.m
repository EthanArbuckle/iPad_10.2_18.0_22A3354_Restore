@implementation InCallBannerHostViewController

- (_TtC15ConversationKit30InCallBannerHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallBannerHostViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC15ConversationKit30InCallBannerHostViewController *v2;

  v2 = self;
  InCallBannerHostViewController.viewDidLoad()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKit30InCallBannerHostViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  InCallBannerHostViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (BOOL)menuPresented
{
  _TtC15ConversationKit30InCallBannerHostViewController *v2;
  char v3;
  char v4;

  v2 = self;
  InCallBannerHostViewController.menuPresented.getter();
  v4 = v3;

  return v4 & 1;
}

- (_TtC15ConversationKit30InCallBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  InCallBannerHostViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_inCallBannerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_controlsManager));
  outlined destroy of ConversationControlsType((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_controlsType);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_notice, (uint64_t *)&demangling cache variable for type metadata for Notice?);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_features));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_conversationControlsViewController));
}

@end

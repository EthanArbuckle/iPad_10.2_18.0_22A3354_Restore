@implementation ScreenSharingSpectatorViewController

- (unint64_t)supportedInterfaceOrientations
{
  _TtC15ConversationKit36ScreenSharingSpectatorViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = ScreenSharingSpectatorViewController.supportedInterfaceOrientations.getter();

  return v3;
}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)init
{
  return (_TtC15ConversationKit36ScreenSharingSpectatorViewController *)ScreenSharingSpectatorViewController.init()();
}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ScreenSharingSpectatorViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  _TtC15ConversationKit36ScreenSharingSpectatorViewController *v2;

  v2 = self;
  ScreenSharingSpectatorViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC15ConversationKit36ScreenSharingSpectatorViewController *v2;

  v2 = self;
  ScreenSharingSpectatorViewController.viewDidLoad()();

}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ScreenSharingSpectatorViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit36ScreenSharingSpectatorViewController_contentViewController));
  swift_release();
}

@end

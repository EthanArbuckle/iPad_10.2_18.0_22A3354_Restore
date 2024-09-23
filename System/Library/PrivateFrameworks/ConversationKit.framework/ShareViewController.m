@implementation ShareViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15ConversationKit19ShareViewController *v4;

  v4 = self;
  ShareViewController.viewDidAppear(_:)(a3);

}

- (_TtC15ConversationKit19ShareViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC15ConversationKit19ShareViewController *)ShareViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC15ConversationKit19ShareViewController)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit19ShareViewController *)ShareViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ShareViewController_backgroundSendUtility));
  swift_release();
}

@end

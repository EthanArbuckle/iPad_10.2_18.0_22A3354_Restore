@implementation VideoMessagePlayerViewController

- (_TtC15ConversationKit32VideoMessagePlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  VideoMessagePlayerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit32VideoMessagePlayerViewController *v2;

  v2 = self;
  VideoMessagePlayerViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit32VideoMessagePlayerViewController *v2;

  v2 = self;
  VideoMessagePlayerViewController.viewDidLayoutSubviews()();

}

- (void)save
{
  _TtC15ConversationKit32VideoMessagePlayerViewController *v2;

  v2 = self;
  VideoMessagePlayerViewController.save()((uint64_t)v2);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15ConversationKit32VideoMessagePlayerViewController *v4;

  v4 = self;
  VideoMessagePlayerViewController.viewDidDisappear(_:)(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit32VideoMessagePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  VideoMessagePlayerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32VideoMessagePlayerViewController_avPlayerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32VideoMessagePlayerViewController_videoMessageViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32VideoMessagePlayerViewController____lazy_storage___controls));
  swift_release();
}

@end

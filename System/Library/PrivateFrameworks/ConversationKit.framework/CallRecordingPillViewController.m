@implementation CallRecordingPillViewController

- (_TtC15ConversationKit31CallRecordingPillViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CallRecordingPillViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit31CallRecordingPillViewController *v2;

  v2 = self;
  CallRecordingPillViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit31CallRecordingPillViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  CallRecordingPillViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController____lazy_storage___countdownView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController____lazy_storage___recordingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController____lazy_storage___backgroundView));
}

@end

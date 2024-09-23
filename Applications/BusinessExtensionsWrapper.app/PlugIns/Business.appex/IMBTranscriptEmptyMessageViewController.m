@implementation IMBTranscriptEmptyMessageViewController

- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC8Business39IMBTranscriptEmptyMessageViewController *result;

  *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_messagesAppProxy] = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_bubbleView);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC8Business39IMBTranscriptEmptyMessageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBTranscriptEmptyMessageViewController.swift", 54, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8Business39IMBTranscriptEmptyMessageViewController *v2;

  v2 = self;
  sub_10003139C();

}

- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business39IMBTranscriptEmptyMessageViewController *result;

  v4 = a4;
  result = (_TtC8Business39IMBTranscriptEmptyMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBTranscriptEmptyMessageViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_conversation));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_messagesAppProxy);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_bubbleView));
}

@end

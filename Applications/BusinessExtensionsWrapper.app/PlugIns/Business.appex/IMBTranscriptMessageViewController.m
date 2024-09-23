@implementation IMBTranscriptMessageViewController

- (_TtC8Business34IMBTranscriptMessageViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC8Business34IMBTranscriptMessageViewController *result;

  *(_QWORD *)&self->pluginBubbleContext[OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_messagesAppProxy] = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_bubbleView);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_authvc) = 0;
  v6 = a3;

  result = (_TtC8Business34IMBTranscriptMessageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBTranscriptMessageViewController.swift", 49, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8Business34IMBTranscriptMessageViewController *v2;

  v2 = self;
  sub_10003D28C();

}

- (_TtC8Business34IMBTranscriptMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business34IMBTranscriptMessageViewController *result;

  v4 = a4;
  result = (_TtC8Business34IMBTranscriptMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBTranscriptMessageViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_pluginBubbleContext));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_messagesAppProxy);
  sub_100010C40((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_featureFlagArbiter));
  sub_100010C40((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_urlHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_bubbleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_authvc));
}

- (void)paymentRequestDidUpdate:(id)a3
{
  _TtC8Business34IMBTranscriptMessageViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10003DA44((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

@end

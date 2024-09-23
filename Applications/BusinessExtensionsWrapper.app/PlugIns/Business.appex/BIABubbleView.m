@implementation BIABubbleView

- (void)dealloc
{
  _TtC8Business13BIABubbleView *v2;

  v2 = self;
  sub_10005B154();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Business13BIABubbleView_delegate));
  sub_100010A98((uint64_t)self + OBJC_IVAR____TtC8Business13BIABubbleView_viewModel, &qword_1000ED6C0);
  sub_100010C40((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_context));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13BIABubbleView_titleAndSubtitleView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13BIABubbleView_optionsViewController));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business13BIABubbleView_subcriptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business13BIABubbleView_bubbleConstraints));
}

- (_TtC8Business13BIABubbleView)initWithCoder:(id)a3
{
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC8Business13BIABubbleView *result;

  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_delegate);
  *v5 = 0;
  v5[1] = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8Business13BIABubbleView_viewModel;
  v7 = type metadata accessor for BIABubbleViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_bubbleConstraints) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13BIABubbleView_wasSizeRequested) = 0;
  v8 = a3;

  result = (_TtC8Business13BIABubbleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/BIABubbleView.swift", 28, 2);
  __break(1u);
  return result;
}

- (_TtC8Business13BIABubbleView)initWithFrame:(CGRect)a3
{
  _TtC8Business13BIABubbleView *result;

  result = (_TtC8Business13BIABubbleView *)_swift_stdlib_reportUnimplementedInitializer("Business.BIABubbleView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end

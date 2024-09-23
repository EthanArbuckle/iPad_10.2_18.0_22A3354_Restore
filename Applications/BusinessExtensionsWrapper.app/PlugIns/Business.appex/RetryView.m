@implementation RetryView

- (_TtC8Business9RetryView)init
{
  return (_TtC8Business9RetryView *)sub_100092D88();
}

- (_TtC8Business9RetryView)initWithCoder:(id)a3
{
  id v5;
  _TtC8Business9RetryView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton) = 0;
  *(_QWORD *)&self->$__lazy_storage_$_messageLabel[OBJC_IVAR____TtC8Business9RetryView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC8Business9RetryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/RetryView.swift", 24, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)retryLoadingBundle
{
  _TtC8Business9RetryView *v2;

  v2 = self;
  sub_1000933B8();

}

- (_TtC8Business9RetryView)initWithFrame:(CGRect)a3
{
  _TtC8Business9RetryView *result;

  result = (_TtC8Business9RetryView *)_swift_stdlib_reportUnimplementedInitializer("Business.RetryView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business9RetryView_delegate);
}

@end

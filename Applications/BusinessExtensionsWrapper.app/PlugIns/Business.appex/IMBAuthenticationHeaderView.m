@implementation IMBAuthenticationHeaderView

- (_TtC8Business27IMBAuthenticationHeaderView)init
{
  uint64_t v3;
  id v4;
  _TtC8Business27IMBAuthenticationHeaderView *v5;
  _TtC8Business27IMBAuthenticationHeaderView *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMBAuthenticationHeaderView();
  v6 = -[IMBAuthenticationHeaderView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1000422B0();
  sub_100042408();

  return v6;
}

- (_TtC8Business27IMBAuthenticationHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8Business27IMBAuthenticationHeaderView *result;

  v5 = OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8Business27IMBAuthenticationHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBAuthenticationHeaderView.swift", 42, 2, 22, 0);
  __break(1u);
  return result;
}

- (_TtC8Business27IMBAuthenticationHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8Business27IMBAuthenticationHeaderView *result;

  result = (_TtC8Business27IMBAuthenticationHeaderView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBAuthenticationHeaderView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel));
}

@end

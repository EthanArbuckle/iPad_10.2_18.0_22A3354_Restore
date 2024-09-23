@implementation IMBWebTitleView

- (_TtC8Business15IMBWebTitleView)init
{
  uint64_t v3;
  id v4;
  _TtC8Business15IMBWebTitleView *v5;
  _TtC8Business15IMBWebTitleView *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC8Business15IMBWebTitleView_titleLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMBWebTitleView();
  v6 = -[IMBWebTitleView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_100081AD0();
  sub_100081D98();

  return v6;
}

- (_TtC8Business15IMBWebTitleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8Business15IMBWebTitleView *result;

  v5 = OBJC_IVAR____TtC8Business15IMBWebTitleView_titleLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8Business15IMBWebTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBWebTitleView.swift", 30, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC8Business15IMBWebTitleView)initWithFrame:(CGRect)a3
{
  _TtC8Business15IMBWebTitleView *result;

  result = (_TtC8Business15IMBWebTitleView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBWebTitleView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

@implementation MacTableHeaderView

- (_TtC8Business18MacTableHeaderView)init
{
  return (_TtC8Business18MacTableHeaderView *)sub_1000153A4();
}

- (_TtC8Business18MacTableHeaderView)initWithCoder:(id)a3
{
  id v4;
  _TtC8Business18MacTableHeaderView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___separatorView) = 0;
  v4 = a3;

  result = (_TtC8Business18MacTableHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/MacTableHeaderView.swift", 33, 2, 38, 0);
  __break(1u);
  return result;
}

- (_TtC8Business18MacTableHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8Business18MacTableHeaderView *result;

  result = (_TtC8Business18MacTableHeaderView *)_swift_stdlib_reportUnimplementedInitializer("Business.MacTableHeaderView", 27, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___separatorView));
}

@end

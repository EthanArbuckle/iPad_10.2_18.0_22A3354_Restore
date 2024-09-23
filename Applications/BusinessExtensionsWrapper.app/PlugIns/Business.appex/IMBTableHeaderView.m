@implementation IMBTableHeaderView

- (_TtC8Business18IMBTableHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC8Business18IMBTableHeaderView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView) = 0;
  v5 = OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "blackColor");

  result = (_TtC8Business18IMBTableHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBTableHeaderView.swift", 33, 2, 44, 0);
  __break(1u);
  return result;
}

- (_TtC8Business18IMBTableHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8Business18IMBTableHeaderView *result;

  result = (_TtC8Business18IMBTableHeaderView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBTableHeaderView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor));
}

@end

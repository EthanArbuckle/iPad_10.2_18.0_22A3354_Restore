@implementation DebugGroupLayoutView

- (_TtC8NewsFeed20DebugGroupLayoutView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed20DebugGroupLayoutView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed20DebugGroupLayoutView_contentView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3C28]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed20DebugGroupLayoutView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed20DebugGroupLayoutView *v2;

  v2 = self;
  sub_1BB0D9D5C();

}

- (_TtC8NewsFeed20DebugGroupLayoutView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed20DebugGroupLayoutView *result;

  result = (_TtC8NewsFeed20DebugGroupLayoutView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20DebugGroupLayoutView_columnDebugView));
}

@end

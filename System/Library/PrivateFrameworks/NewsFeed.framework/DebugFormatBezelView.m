@implementation DebugFormatBezelView

- (_TtC8NewsFeed20DebugFormatBezelView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20DebugFormatBezelView *)sub_1BB016EE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed20DebugFormatBezelView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed20DebugFormatBezelView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed20DebugFormatBezelView_bezelLayer;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2840]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC8NewsFeed20DebugFormatBezelView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed20DebugFormatBezelView *v2;

  v2 = self;
  sub_1BB017148();

}

- (void).cxx_destruct
{

}

@end

@implementation DebugFormatGridView

- (_TtC8NewsFeed19DebugFormatGridView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed19DebugFormatGridView *)sub_1BB21B934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed19DebugFormatGridView)initWithCoder:(id)a3
{
  _QWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC8NewsFeed19DebugFormatGridView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_scale) = (Class)0x3FF0000000000000;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_contentSize);
  *v5 = 0;
  v5[1] = 0;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_contentBounds);
  *v6 = 0u;
  v6[1] = 0u;
  v7 = OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_gridLayer;
  v8 = objc_allocWithZone(MEMORY[0x1E0CD2840]);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(v8, sel_init);

  result = (_TtC8NewsFeed19DebugFormatGridView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed19DebugFormatGridView *v2;

  v2 = self;
  sub_1BB21BC94();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v9.receiver;
  -[DebugFormatGridView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_gridLayer];
  v7 = objc_msgSend((id)objc_opt_self(), sel_systemGrayColor, v9.receiver, v9.super_class);
  v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void).cxx_destruct
{

}

@end

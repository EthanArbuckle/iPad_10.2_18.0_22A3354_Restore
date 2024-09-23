@implementation FormatLayeredMediaView

- (_TtC8NewsFeed22FormatLayeredMediaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  char *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_identifier);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView) = 0;
  v10 = (char *)self + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_lastRenderedBounds;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[32] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatLayeredMediaView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[FormatLayeredMediaView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    sub_1BB8736F0();

    v2 = v4;
  }

}

- (_TtC8NewsFeed22FormatLayeredMediaView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  char *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_identifier);
  *v6 = 0;
  v6[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_lastRenderedBounds;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[FormatLayeredMediaView initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView));
}

@end

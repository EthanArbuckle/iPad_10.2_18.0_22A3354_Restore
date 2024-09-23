@implementation DebugFormatContentView

- (double)contentScaleFactor
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[DebugFormatContentView contentScaleFactor](&v3, sel_contentScaleFactor);
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  _TtC8NewsFeed22DebugFormatContentView *v4;

  v4 = self;
  sub_1BB4309B8(a3);

}

- (_TtC8NewsFeed22DebugFormatContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _OWORD *v9;
  uint64_t v10;
  id v11;
  _TtC8NewsFeed22DebugFormatContentView *v12;
  _TtC8NewsFeed22DebugFormatContentView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_contentFrame);
  *v9 = 0u;
  v9[1] = 0u;
  v10 = OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView;
  v11 = objc_allocWithZone((Class)type metadata accessor for DebugFormatBezelView());
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v15.receiver = v12;
  v15.super_class = ObjectType;
  v13 = -[DebugFormatContentView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  -[DebugFormatContentView addSubview:](v13, sel_addSubview_, *(Class *)((char *)&v13->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView));
  return v13;
}

- (_TtC8NewsFeed22DebugFormatContentView)initWithCoder:(id)a3
{
  _OWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC8NewsFeed22DebugFormatContentView *result;

  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_contentFrame);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView;
  v7 = objc_allocWithZone((Class)type metadata accessor for DebugFormatBezelView());
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed22DebugFormatContentView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

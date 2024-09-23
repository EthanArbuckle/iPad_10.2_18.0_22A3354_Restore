@implementation FormatStateView

- (_TtC8NewsFeed15FormatStateView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_identifier);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_stateViewFormatLayoutViews) = (Class)MEMORY[0x1E0DEE9E0];
  v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_state);
  *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatStateView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed15FormatStateView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_identifier);
  *v6 = 0;
  v6[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_stateViewFormatLayoutViews) = (Class)MEMORY[0x1E0DEE9E0];
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_state);
  *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[FormatStateView initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

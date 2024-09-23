@implementation ChannelEngagementView

- (_TtC7NewsUI221ChannelEngagementView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC7NewsUI221ChannelEngagementView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC7NewsUI221ChannelEngagementView_token;
  v10 = objc_allocWithZone(MEMORY[0x1E0DE7910]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[ChannelEngagementView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI221ChannelEngagementView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI221ChannelEngagementView *result;

  v5 = OBJC_IVAR____TtC7NewsUI221ChannelEngagementView_token;
  v6 = objc_allocWithZone(MEMORY[0x1E0DE7910]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI221ChannelEngagementView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

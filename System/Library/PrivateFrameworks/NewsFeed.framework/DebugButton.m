@implementation DebugButton

- (_TtC8NewsFeed11DebugButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  Class v10;
  id v11;
  _TtC8NewsFeed11DebugButton *v12;
  _TtC8NewsFeed11DebugButton *v13;
  void *v14;
  _TtC8NewsFeed11DebugButton *v15;
  id v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap;
  sub_1BA563554();
  v11 = objc_allocWithZone(v10);
  v12 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);

  v18.receiver = v12;
  v18.super_class = ObjectType;
  v13 = -[DebugButton initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v14 = *(Class *)((char *)&v13->super.super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap);
  v15 = v13;
  v16 = v14;
  sub_1BB871368();

  return v15;
}

- (_TtC8NewsFeed11DebugButton)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _TtC8NewsFeed11DebugButton *result;

  v5 = OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap;
  sub_1BA563554();
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed11DebugButton *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

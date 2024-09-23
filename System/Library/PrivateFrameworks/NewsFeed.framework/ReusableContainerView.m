@implementation ReusableContainerView

- (_TtC8NewsFeed21ReusableContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  Class v10;
  id v11;
  _TtC8NewsFeed21ReusableContainerView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC8NewsFeed21ReusableContainerView_onReuse;
  sub_1BA563554();
  v11 = objc_allocWithZone(v10);
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);

  v14.receiver = v12;
  v14.super_class = ObjectType;
  return -[ReusableContainerView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed21ReusableContainerView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  Class v7;
  id v8;
  id v9;
  _TtC8NewsFeed21ReusableContainerView *v10;
  _TtC8NewsFeed21ReusableContainerView *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = OBJC_IVAR____TtC8NewsFeed21ReusableContainerView_onReuse;
  sub_1BA563554();
  v8 = objc_allocWithZone(v7);
  v9 = a3;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v8, sel_init);

  v13.receiver = v10;
  v13.super_class = ObjectType;
  v11 = -[ReusableContainerView initWithCoder:](&v13, sel_initWithCoder_, v9);

  return v11;
}

- (void).cxx_destruct
{

}

@end

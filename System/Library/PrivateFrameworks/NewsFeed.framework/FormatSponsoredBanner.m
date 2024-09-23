@implementation FormatSponsoredBanner

- (_TtC8NewsFeed21FormatSponsoredBanner)initWithFrame:(CGRect)a3
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
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_identifier);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_adIdentifier);
  *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatSponsoredBanner initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed21FormatSponsoredBanner)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_identifier);
  *v6 = 0;
  v6[1] = 0xE000000000000000;
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_adIdentifier);
  *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[FormatSponsoredBanner initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

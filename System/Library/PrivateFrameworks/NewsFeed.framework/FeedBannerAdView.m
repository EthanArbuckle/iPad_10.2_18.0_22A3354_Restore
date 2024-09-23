@implementation FeedBannerAdView

- (_TtC8NewsFeed16FeedBannerAdView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView_bannerView);
  *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FeedBannerAdView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed16FeedBannerAdView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView_bannerView);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[FeedBannerAdView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView));
}

@end

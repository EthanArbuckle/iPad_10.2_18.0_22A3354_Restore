@implementation VideoPlaceholderView

- (_TtC8NewsFeed20VideoPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20VideoPlaceholderView *)VideoPlaceholderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed20VideoPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB619E90();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed20VideoPlaceholderView *v2;

  v2 = self;
  VideoPlaceholderView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20VideoPlaceholderView____lazy_storage___imageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20VideoPlaceholderView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20VideoPlaceholderView____lazy_storage___vibrancyView));
}

@end

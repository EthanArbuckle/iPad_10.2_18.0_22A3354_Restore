@implementation HiddenContentPlacardView

- (_TtC8NewsFeed24HiddenContentPlacardView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed24HiddenContentPlacardView *)sub_1BB4F0F94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed24HiddenContentPlacardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB4F137C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8NewsFeed24HiddenContentPlacardView *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1BB4F1154((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24HiddenContentPlacardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24HiddenContentPlacardView_dismissalButton));
}

@end

@implementation RoundedCornerView

- (_TtC12GameCenterUI17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17RoundedCornerView *)sub_1AB562934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI17RoundedCornerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB562A5C();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI17RoundedCornerView *v2;

  v2 = self;
  sub_1AB562B44();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI17RoundedCornerView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB562BEC((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17RoundedCornerView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17RoundedCornerView_borderColor));
}

@end

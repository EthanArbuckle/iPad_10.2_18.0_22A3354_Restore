@implementation SeparatorView

- (_TtC12GameCenterUI13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI13SeparatorView *)sub_1AB67BAE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI13SeparatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB67BCD8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI13SeparatorView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB67B8F4(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI13SeparatorView *v2;

  v2 = self;
  sub_1AB67BDB0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI13SeparatorView_separatorView));
}

@end

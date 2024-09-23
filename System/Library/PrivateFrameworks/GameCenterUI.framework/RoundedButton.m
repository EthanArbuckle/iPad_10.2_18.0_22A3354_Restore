@implementation RoundedButton

- (_TtC12GameCenterUI13RoundedButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB75EC28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI13RoundedButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1AB75ECA8(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI13RoundedButton *v2;

  v2 = self;
  sub_1AB75ED64();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI13RoundedButton *v6;

  v5 = a3;
  v6 = self;
  sub_1AB75EE4C((uint64_t)a3);

}

- (_TtC12GameCenterUI13RoundedButton)initWithFrame:(CGRect)a3
{
  sub_1AB75F000();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI13RoundedButton_backing));
  sub_1AB75F158((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI13RoundedButton_fontUseCase);
}

@end

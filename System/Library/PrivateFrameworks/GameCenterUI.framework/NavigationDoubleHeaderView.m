@implementation NavigationDoubleHeaderView

- (NSString)titleText
{
  return (NSString *)sub_1AB472580(self, (uint64_t)a2, (void (*)(void))NavigationDoubleHeaderView.titleText.getter);
}

- (void)setTitleText:(id)a3
{
  sub_1AB472668(self, (uint64_t)a2, (uint64_t)a3, NavigationDoubleHeaderView.titleText.setter);
}

- (NSString)subtitleText
{
  return (NSString *)sub_1AB472580(self, (uint64_t)a2, (void (*)(void))NavigationDoubleHeaderView.subtitleText.getter);
}

- (void)setSubtitleText:(id)a3
{
  sub_1AB472668(self, (uint64_t)a2, (uint64_t)a3, NavigationDoubleHeaderView.subtitleText.setter);
}

- (double)titleAlpha
{
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v2;
  double v3;
  double v4;

  v2 = self;
  NavigationDoubleHeaderView.titleAlpha.getter();
  v4 = v3;

  return v4;
}

- (void)setTitleAlpha:(double)a3
{
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v4;

  v4 = self;
  NavigationDoubleHeaderView.titleAlpha.setter(a3);

}

- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26NavigationDoubleHeaderView *)NavigationDoubleHeaderView.init(frame:)();
}

- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB472B80();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = NavigationDoubleHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v2;

  v2 = self;
  NavigationDoubleHeaderView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView_subtitleLabel));
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView____lazy_storage___layout, &qword_1EEBFC348);
  OUTLINED_FUNCTION_0_10();
}

@end

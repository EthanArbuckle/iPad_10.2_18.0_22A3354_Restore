@implementation SectionHeaderView

- (_TtC12GameCenterUI17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17SectionHeaderView *)SectionHeaderView.init(frame:)();
}

- (_TtC12GameCenterUI17SectionHeaderView)initWithCoder:(id)a3
{
  sub_1AB580C98(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI17SectionHeaderView *v3;
  unint64_t v4;
  unint64_t v5;
  CGSize v6;
  double width;
  double height;
  CGSize result;

  v3 = self;
  v6 = SectionHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  width = v6.width;
  height = v6.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI17SectionHeaderView *v2;

  v2 = self;
  SectionHeaderView.layoutSubviews()();

}

- (UILabel)accessibilitySectionHeaderLabel
{
  return (UILabel *)sub_1AB581000();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionHeaderView_sectionHeaderLabel));
}

@end

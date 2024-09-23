@implementation AchievementHighlightCollectionViewCell

- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell *)AchievementHighlightCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB61C5F8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI38AchievementHighlightCollectionViewCell *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = AchievementHighlightCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI38AchievementHighlightCollectionViewCell *v2;

  v2 = self;
  AchievementHighlightCollectionViewCell.layoutSubviews()();

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)sub_1AB61D2F0();
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)sub_1AB61D31C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_decorationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_subtitle));
}

@end

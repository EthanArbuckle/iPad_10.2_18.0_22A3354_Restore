@implementation TitleWithHighlightsCollectionViewCell

- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell *)TitleWithHighlightsCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB62697C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = TitleWithHighlightsCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell *v2;

  v2 = self;
  TitleWithHighlightsCollectionViewCell.layoutSubviews()();

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell_separator));
}

@end

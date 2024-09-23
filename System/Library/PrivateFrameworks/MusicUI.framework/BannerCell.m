@implementation BannerCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC7MusicUI10BannerCell *v5;

  v4 = a3;
  v5 = self;
  sub_21D159A14(v4);

  return v4;
}

- (void)layoutSubviews
{
  _TtC7MusicUI10BannerCell *v2;

  v2 = self;
  sub_21D159BAC();

}

- (_TtC7MusicUI10BannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUI10BannerCell *)BannerCell.init(frame:)();
}

- (_TtC7MusicUI10BannerCell)initWithCoder:(id)a3
{
  return (_TtC7MusicUI10BannerCell *)BannerCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_5_11((uint64_t)self, OBJC_IVAR____TtC7MusicUI10BannerCell_bannerCellView);
}

@end

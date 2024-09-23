@implementation SectionBackgroundView

- (_TtC12GameCenterUI21SectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI21SectionBackgroundView *)sub_1AB5CD848(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI21SectionBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5CD9E0();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI21SectionBackgroundView *v2;

  v2 = self;
  sub_1AB5CDB8C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI21SectionBackgroundView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5CDE54((uint64_t)a3);

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI21SectionBackgroundView *v2;

  v2 = self;
  sub_1AB5CDF2C();

}

- (void).cxx_destruct
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9[18];

  v2 = OUTLINED_FUNCTION_3_82(v9, (char *)self + OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_configuration);
  OUTLINED_FUNCTION_8_52((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AB4C73EC, v3, v4, v5, v6, v7, v8, v9[0]);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_backgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_topSeparator);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_bottomSeparator);
  OUTLINED_FUNCTION_7_65();
}

@end

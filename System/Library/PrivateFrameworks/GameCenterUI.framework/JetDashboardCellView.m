@implementation JetDashboardCellView

- (_TtC12GameCenterUI20JetDashboardCellView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20JetDashboardCellView *)sub_1AB4EF350(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI20JetDashboardCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4EF87C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI20JetDashboardCellView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB4EFAC4(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI20JetDashboardCellView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB4F0930((uint64_t)a4, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI20JetDashboardCellView *v2;

  v2 = self;
  sub_1AB4EFCE8();

}

- (NSString)accessibilityLabel
{
  _TtC12GameCenterUI20JetDashboardCellView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB4F03EC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12GameCenterUI20JetDashboardCellView *v7;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AB4F0660(v4, v6);

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB4F06F8();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB4F0728();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_titleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_chevronGlyph);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_contentViewBackground));
}

@end

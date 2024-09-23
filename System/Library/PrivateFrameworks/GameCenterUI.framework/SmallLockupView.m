@implementation SmallLockupView

- (_TtC12GameCenterUI15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI15SmallLockupView *)sub_1AB501E2C();
}

- (_TtC12GameCenterUI15SmallLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5022AC();
}

- (UIEdgeInsets)layoutMargins
{
  _TtC12GameCenterUI15SmallLockupView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_1AB5025C8();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  _TtC12GameCenterUI15SmallLockupView *v3;

  v3 = self;
  sub_1AB50267C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI15SmallLockupView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB4941F0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI15SmallLockupView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1AB502714((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease();

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI15SmallLockupView *v2;

  v2 = self;
  sub_1AB5028A4();

}

- (_TtC12GameCenterUI11ArtworkView)accessibilityArtworkView
{
  return (_TtC12GameCenterUI11ArtworkView *)sub_1AB50355C();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB503588();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB5035B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_headingLabel));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_titleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_artworkView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_selectedBackgroundColor);

}

@end

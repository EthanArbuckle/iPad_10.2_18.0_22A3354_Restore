@implementation SmallPlayerCardView

- (_TtC12GameCenterUI19SmallPlayerCardView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI19SmallPlayerCardView *)SmallPlayerCardView.init(frame:)();
}

- (_TtC12GameCenterUI19SmallPlayerCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4B3F70();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI19SmallPlayerCardView *v3;
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

- (CGSize)intrinsicContentSize
{
  _TtC12GameCenterUI19SmallPlayerCardView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AB4B4844((uint64_t)v2);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI19SmallPlayerCardView *v6;
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

  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB4B4878(a4);
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
  _TtC12GameCenterUI19SmallPlayerCardView *v2;

  v2 = self;
  sub_1AB4B4BF8();

}

- (void)didTapCloseButton
{
  _TtC12GameCenterUI19SmallPlayerCardView *v2;

  v2 = self;
  sub_1AB4B4E68();

}

- (void)didTapButton
{
  _TtC12GameCenterUI19SmallPlayerCardView *v2;

  v2 = self;
  sub_1AB4B5084();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI19SmallPlayerCardView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4B50F4((uint64_t)a3);

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB4B577C();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB4B57A8();
}

- (UIButton)accessibilityCloseButton
{
  return (UIButton *)SmallPlayerCardView.closeButton.getter();
}

- (UIButton)accessibilityInviteButton
{
  return (UIButton *)sub_1AB4B57F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_contentView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_contentViewBackground);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_closeButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_avatarView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_messagesBadge);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_titleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_button);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_closeButtonActionBlock);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_buttonActionBlock);
  sub_1AB4B5EA0((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_currentImageFetch);

}

@end

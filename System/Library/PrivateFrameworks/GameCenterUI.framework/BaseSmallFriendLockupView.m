@implementation BaseSmallFriendLockupView

- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI25BaseSmallFriendLockupView *)BaseSmallFriendLockupView.init(frame:)();
}

- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB675D4C();
}

- (CGSize)intrinsicContentSize
{
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AB676998();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB6769B4();
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
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v6;
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
  double v18;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v6 = self;
  sub_1AB676A14(a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v2;

  v2 = self;
  sub_1AB676B2C();

}

- (BOOL)accessibilityActivate
{
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v2;

  v2 = self;
  sub_1AB676E50();

  return 1;
}

- (void)didTapAccessoryButton
{
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v2;

  v2 = self;
  sub_1AB6747C0();

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB674888();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB674894();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI25BaseSmallFriendLockupView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB676F08((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_avatarView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_titleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_subtitleLabel);
  sub_1AB677450(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_style));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_chevronView);
  sub_1AB4C4F64(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._animationInfo+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *((_BYTE *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_accessoryButton);
  swift_release();
}

@end

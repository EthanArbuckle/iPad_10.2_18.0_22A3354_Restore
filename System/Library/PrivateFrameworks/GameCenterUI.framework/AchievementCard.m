@implementation AchievementCard

- (_TtC12GameCenterUI15AchievementCard)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI15AchievementCard *result;

  AchievementCard.init(frame:)();
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC12GameCenterUI15AchievementCard *v2;

  v2 = self;
  AchievementCard._dynamicUserInterfaceTraitDidChange()();

}

- (_TtC12GameCenterUI15AchievementCard)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB71FA18();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI15AchievementCard *v2;

  v2 = self;
  AchievementCard.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI15AchievementCard *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = AchievementCard.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI15AchievementCard *v5;
  double v6;
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
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AB722260();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)canBecomeFocused
{
  return AchievementCard.canBecomeFocused.getter() & 1;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB720568();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB720594();
}

- (NSDate)accessibilityAchievementCompletedDate
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEBFF0C0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB720654((uint64_t)v4);
  v5 = sub_1AB7D7C54();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AB7D7BF4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)v6;
}

- (_TtC12GameCenterUI16AchievementBadge)accessibilityBadge
{
  return (_TtC12GameCenterUI16AchievementBadge *)sub_1AB7206F8();
}

- (void)didTap
{
  _TtC12GameCenterUI15AchievementCard *v2;

  v2 = self;
  sub_1AB720AA8();

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v4 = *(CALayer **)((char *)&self->super._layerRetained + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v5 = *(NSArray **)((char *)&self->super._subviewCache + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v6 = *(UIWindow **)((char *)&self->super._window + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v7 = *(NSArray **)((char *)&self->super._gestureRecognizers + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v8 = *(UIViewController **)((char *)&self->super._viewDelegate + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v9 = *(void **)((char *)&self->super._viewFlags + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style + 8);
  sub_1AB4C73EC(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._animationInfo + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *((_BYTE *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style));

  sub_1AB46F350((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_metrics);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard____lazy_storage___highlightView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard____lazy_storage___focusBackgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_backgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_gradient);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_border);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_badge);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_titleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_friendsWhoAchievedThis);
  sub_1AB71E42C((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_model);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15AchievementCard_tapGestureRecognizer);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_tapHandler));
}

@end

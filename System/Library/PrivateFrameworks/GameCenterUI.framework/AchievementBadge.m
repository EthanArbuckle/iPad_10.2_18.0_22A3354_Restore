@implementation AchievementBadge

- (_TtC12GameCenterUI16AchievementBadge)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB75D82C();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI16AchievementBadge *v2;

  v2 = self;
  AchievementBadge.layoutSubviews()();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC12GameCenterUI16AchievementBadge *v2;

  v2 = self;
  AchievementBadge._dynamicUserInterfaceTraitDidChange()();

}

- (BOOL)accessibilityIsAchievementLocked
{
  char v2;

  sub_1AB75E504();
  return v2 & 1;
}

- (BOOL)accessibilityIsAchievementCompleted
{
  char v2;

  sub_1AB75E568();
  return v2 & 1;
}

- (BOOL)accessibilityIsAchievementInProgress
{
  char v2;

  sub_1AB75E5C0();
  return v2 & 1;
}

- (double)accessibilityProgress
{
  return sub_1AB75E614();
}

- (_TtC12GameCenterUI16AchievementBadge)initWithFrame:(CGRect)a3
{
  AchievementBadge.init(frame:)();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v6 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v7 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v8 = *(UIViewAnimationInfo **)((char *)&self->super._animationInfo
                               + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);

  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___progressNumberFont);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___progressPercentageFont);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___numberFormatter);
  sub_1AB4D289C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status), *(unint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_image);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_innerShadow);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_outerFoilLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_outerFoilRing);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_innerFoil);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_progressBarLayer);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_iconImageView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_progressLabel));
}

@end

@implementation AchievementGroupView

- (_TtC19AppStoreKitInternal20AchievementGroupView)initWithCoder:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal20AchievementGroupView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19AppStoreKitInternal20AchievementGroupView_achievement) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19AppStoreKitInternal20AchievementGroupView_secondAchievement) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC19AppStoreKitInternal20AchievementGroupView_angle) = (Class)0x3FB1DF46A2529D39;
  v4 = a3;

  result = (_TtC19AppStoreKitInternal20AchievementGroupView *)sub_1D892BBB8();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal20AchievementGroupView)initWithFrame:(CGRect)a3
{
  _TtC19AppStoreKitInternal20AchievementGroupView *result;

  result = (_TtC19AppStoreKitInternal20AchievementGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal20AchievementGroupView_achievement));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal20AchievementGroupView_secondAchievement));
}

@end

@implementation AchievementCardCollectionViewCell

- (_TtC12GameCenterUI33AchievementCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI33AchievementCardCollectionViewCell *)sub_1AB53FEBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI33AchievementCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB540024();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI33AchievementCardCollectionViewCell *v2;

  v2 = self;
  sub_1AB540150();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI33AchievementCardCollectionViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1AB540CE4(v6, v7);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33AchievementCardCollectionViewCell_achievementCard));
}

@end

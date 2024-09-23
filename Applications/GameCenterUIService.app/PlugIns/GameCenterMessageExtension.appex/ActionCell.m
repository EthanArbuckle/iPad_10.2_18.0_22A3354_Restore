@implementation ActionCell

- (UILabel)actionLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_actionLabel, a2);
}

- (void)setActionLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_actionLabel, a3);
}

- (UIVisualEffectView)effectsView
{
  return (UIVisualEffectView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_effectsView, a2);
}

- (void)setEffectsView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_effectsView, a3);
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return (GKDashboardPlayerPhotoView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_playerAvatarView, a2);
}

- (void)setPlayerAvatarView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_playerAvatarView, a3);
}

- (_TtC26GameCenterMessageExtension10ActionCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_actionLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_effectsView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_playerAvatarView, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ActionCell();
  return -[ActionCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension10ActionCell)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_actionLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_effectsView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_playerAvatarView, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionCell();
  return -[ActionCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_actionLabel, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_effectsView, v3);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10ActionCell_playerAvatarView, v4);
}

@end

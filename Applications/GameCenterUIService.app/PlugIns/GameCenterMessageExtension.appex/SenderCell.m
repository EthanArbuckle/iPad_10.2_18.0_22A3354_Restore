@implementation SenderCell

- (UILabel)titleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel, a2);
}

- (void)setTitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_subtitleLabel, a2);
}

- (void)setSubtitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_subtitleLabel, a3);
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return (GKDashboardPlayerPhotoView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView, a2);
}

- (void)setPlayerAvatarView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView, a3);
}

- (UILabel)gameCenterLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterLabel, a2);
}

- (void)setGameCenterLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterLabel, a3);
}

- (UIImageView)gameCenterPhoto
{
  return (UIImageView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto, a2);
}

- (void)setGameCenterPhoto:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto, a3);
}

- (_TtC26GameCenterMessageExtension10SenderCell)initWithFrame:(CGRect)a3
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
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_subtitleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SenderCell();
  return -[SenderCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension10SenderCell)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension10SenderCell *)sub_100011FC8(a3);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_subtitleLabel, v3);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterLabel, v5);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto, v6);
}

@end

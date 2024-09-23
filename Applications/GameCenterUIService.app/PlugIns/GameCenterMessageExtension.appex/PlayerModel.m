@implementation PlayerModel

- (NSString)description
{
  _TtC26GameCenterMessageExtension11PlayerModel *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100014C1C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC26GameCenterMessageExtension11PlayerModel)init
{
  _TtC26GameCenterMessageExtension11PlayerModel *result;

  result = (_TtC26GameCenterMessageExtension11PlayerModel *)_swift_stdlib_reportUnimplementedInitializer("GameCenterMessageExtension.PlayerModel", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.loadingState[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.loadingState[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.loadingState[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.loadingState[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.loadingState[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup));
}

@end

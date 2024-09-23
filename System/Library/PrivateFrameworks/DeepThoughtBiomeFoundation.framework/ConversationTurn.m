@implementation ConversationTurn

- (_TtC26DeepThoughtBiomeFoundation16ConversationTurn)init
{
  return (_TtC26DeepThoughtBiomeFoundation16ConversationTurn *)ConversationTurn.init()();
}

- (id)debugString
{
  return sub_23A2FE7A8(self, (uint64_t)a2, (void (*)(void))sub_23A2FA5F4);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation16ConversationTurn_turnID;
  v4 = sub_23A316B8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A2EC4F8((uint64_t)self + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation16ConversationTurn_clockID, &qword_256964E70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

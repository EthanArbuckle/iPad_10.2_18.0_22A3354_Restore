@implementation ConversationUtils

+ (id)conversationTurnTypeToStringWithTurnType:(int64_t)a3
{
  void *v3;

  v3 = (void *)sub_23A316F7C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (int64_t)stringToConversationTurnTypeWithTypeString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = sub_23A316FA0();
  v5 = v3;
  if (v4 == 0xD000000000000015 && v3 == 0x800000023A322540 || (sub_23A3175A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v4 == 0xD000000000000018 && v5 == 0x800000023A322520)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A3175A0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

- (_TtC26DeepThoughtBiomeFoundation17ConversationUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConversationUtils();
  return -[ConversationUtils init](&v3, sel_init);
}

@end

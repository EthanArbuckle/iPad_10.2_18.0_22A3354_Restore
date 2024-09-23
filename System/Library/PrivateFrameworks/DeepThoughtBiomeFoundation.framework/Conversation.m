@implementation Conversation

- (NSArray)turns
{
  void *v2;

  type metadata accessor for ConversationTurn(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A317138();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC26DeepThoughtBiomeFoundation12Conversation)initWithTurns:(id)a3
{
  objc_super v5;

  type metadata accessor for ConversationTurn(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation12Conversation_turns) = (Class)sub_23A317144();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Conversation();
  return -[Conversation init](&v5, sel_init);
}

- (id)debugString
{
  return sub_23A2FE7A8(self, (uint64_t)a2, (void (*)(void))sub_23A2FE5BC);
}

- (_TtC26DeepThoughtBiomeFoundation12Conversation)init
{
  _TtC26DeepThoughtBiomeFoundation12Conversation *result;

  result = (_TtC26DeepThoughtBiomeFoundation12Conversation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

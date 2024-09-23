@implementation ISSiriConversation

- (NSArray)turns
{
  void *v2;

  type metadata accessor for SiriTurn();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (double)timestamp
{
  unint64_t v3;
  uint64_t v4;
  ISSiriConversation *v5;
  double result;
  char *v7;
  char *v8;
  double v9;
  ISSiriConversation *v10;

  v3 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___ISSiriConversation_turns);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v5 = self;
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_9;
  }
  v10 = self;
  swift_bridgeObjectRetain();
  if (!sub_21DC71FCC())
    goto LABEL_8;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_9:
    v7 = (char *)MEMORY[0x22079D208](0, v3);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = (char *)*(id *)(v3 + 32);
LABEL_6:
    v8 = v7;
    swift_bridgeObjectRelease();
    v9 = *(double *)&v8[OBJC_IVAR___ISEventGraph_timestamp];

    return v9;
  }
  __break(1u);
  return result;
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  ISSiriConversation *v10;
  NSDate *result;
  id v12;
  void *v13;
  void *v14;
  ISSiriConversation *v15;
  uint64_t v16;

  v3 = sub_21DC71588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___ISSiriConversation_turns);
  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    v10 = self;
    result = (NSDate *)swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_9;
  }
  v15 = self;
  swift_bridgeObjectRetain();
  result = (NSDate *)sub_21DC71FCC();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_9:
    v12 = (id)MEMORY[0x22079D208](0, v8);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(id *)(v8 + 32);
LABEL_6:
    v13 = v12;
    swift_bridgeObjectRelease();

    sub_21DC7151C();
    v14 = (void *)sub_21DC71540();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return (NSDate *)v14;
  }
  __break(1u);
  return result;
}

- (NSUUID)firstTurnId
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ISSiriConversation *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_21DC715F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_21DC08EF4();

  v9 = (void *)sub_21DC715B8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSUUID *)v9;
}

- (ISSiriConversation)initWithTurns:(id)a3
{
  uint64_t v3;

  type metadata accessor for SiriTurn();
  v3 = sub_21DC71B70();
  return (ISSiriConversation *)SiriConversation.init(turns:)(v3);
}

- (ISSiriConversation)init
{
  ISSiriConversation *result;

  result = (ISSiriConversation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

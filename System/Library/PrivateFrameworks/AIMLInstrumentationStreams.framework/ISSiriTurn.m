@implementation ISSiriTurn

+ (id)constructWithEventGraph:(id)a3
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for SiriTurn());
  return (id)SiriTurn.init(eventGraph:)(a3);
}

- (NSUUID)turnId
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ISSiriTurn *v8;
  NSUUID *result;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = sub_21DC715F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  result = (NSUUID *)EventGraph.uei.getter();
  if (result)
  {
    v10 = (void *)sub_21DC09288();
    swift_release();
    sub_21DC717F8();

    v11 = (void *)sub_21DC715B8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return (NSUUID *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)timeIntervalSince1970Nonnull
{
  ISSiriTurn *v2;
  void *v3;
  char v4;
  char v5;
  double result;

  v2 = self;
  v3 = sub_21DC1436C();
  v5 = v4;

  result = *(double *)&v3;
  if ((v5 & 1) != 0)
    return 0.0;
  return result;
}

- (NSUUID)previousTurnId
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  ISSiriTurn *v7;
  NSUUID *result;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A98F0);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  result = (NSUUID *)EventGraph.uei.getter();
  if (result)
  {
    ComponentGroup<>.previousTurnId.getter((uint64_t)v6);

    swift_release();
    v9 = sub_21DC715F4();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
    {
      v11 = (void *)sub_21DC715B8();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    return (NSUUID *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end

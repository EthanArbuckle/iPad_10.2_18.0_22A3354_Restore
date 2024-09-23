@implementation HomeIntelligenceActivityLogger

- (HomeIntelligenceActivityLogger)initWithHome:(id)a3
{
  id v4;

  v4 = a3;
  return (HomeIntelligenceActivityLogger *)HomeIntelligence.ActivityLogger.init(home:)(a3);
}

- (void)configure
{
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  HomeIntelligenceActivityLogger *v9;
  uint64_t v10;

  ObjectType = swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v8[5] = ObjectType;
  v9 = self;
  sub_22191760C((uint64_t)v6, (uint64_t)&unk_25573C370, (uint64_t)v8);
  swift_release();

}

- (HomeIntelligenceActivityLogger)init
{
  HomeIntelligenceActivityLogger *result;

  result = (HomeIntelligenceActivityLogger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_221917338((uint64_t)self + OBJC_IVAR___HomeIntelligenceActivityLogger_eventStream, &qword_25573BEF0);
  swift_bridgeObjectRelease();
  swift_release();
}

@end

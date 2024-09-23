@implementation PregnancyStateInputSignal

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _TtC14HealthPlatform25PregnancyStateInputSignal *v11;
  uint64_t v12;
  void (*v13)(_BYTE *, uint64_t, uint64_t);
  id v14;
  void *v15;
  _BYTE v17[32];

  v3 = sub_1BC8173EC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v17[-v8];
  v10 = qword_1ED6B9460;
  v11 = self;
  if (v10 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED6B9440);
  v13 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v13(v9, v12, v3);
  v13(v7, (uint64_t)v9, v3);
  sub_1BC8186D0();
  v14 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_1BC818178();
  swift_unknownObjectRelease();
  sub_1BC817AF4();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);

  v15 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  return (NSString *)v15;
}

- (_TtC14HealthPlatform25PregnancyStateInputSignal)init
{
  _TtC14HealthPlatform25PregnancyStateInputSignal *result;

  result = (_TtC14HealthPlatform25PregnancyStateInputSignal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end

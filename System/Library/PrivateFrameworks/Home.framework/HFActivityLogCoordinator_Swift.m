@implementation HFActivityLogCoordinator_Swift

- (HFActivityLogCoordinator_Swift)initWithHome:(id)a3
{
  id v3;
  HFActivityLogCoordinator_Swift *v4;

  v3 = a3;
  v4 = (HFActivityLogCoordinator_Swift *)sub_1DD41918C(v3);

  return v4;
}

- (void)eventsExistWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378350);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD63E2FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03E52F0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03E52F8;
  v12[5] = v11;
  swift_retain();
  sub_1DD447CC8((uint64_t)v7, (uint64_t)&unk_1F03E5300, (uint64_t)v12);
  swift_release();
}

- (HFActivityLogCoordinator_Swift)init
{
  HFActivityLogCoordinator_Swift *result;

  swift_defaultActor_initialize();
  result = (HFActivityLogCoordinator_Swift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation FAOSUpdatedActivity

- (FAOSUpdatedActivity)initWithHeartbeatActivityHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  FAOSUpdatedActivity *v5;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = (FAOSUpdatedActivity *)sub_1CAEDC448((uint64_t)sub_1CAEDCC7C, v4);
  swift_release();
  return v5;
}

- (void)checkinWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  FAOSUpdatedActivity *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EF991060;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF991068;
  v11[5] = v10;
  v12 = self;
  sub_1CAEF47AC((uint64_t)v6, (uint64_t)&unk_1EF991070, (uint64_t)v11);
  swift_release();
}

- (void)unregister
{
  FAOSUpdatedActivity *v2;

  v2 = self;
  FAOSUpdatedActivity.unregister()();

}

- (FAOSUpdatedActivity)init
{
  FAOSUpdatedActivity *result;

  result = (FAOSUpdatedActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___FAOSUpdatedActivity_scheduler);
}

@end

@implementation CIDVUIInternalProofingFlowManager

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)initWithDelegate:(id)a3 externalProofingFlowManager:(id)a4
{
  id v6;
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *)sub_213F7EB54((uint64_t)a3);

  swift_unknownObjectRelease();
  return v7;
}

- (void)startProofingWithConfiguration:(CIDVUIProofingConfiguration *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CIDVUIProofingConfiguration *v15;
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254D5DC80;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_254D5DC88;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_213FD7484((uint64_t)v9, (uint64_t)&unk_254D5DC90, (uint64_t)v14);
  swift_release();
}

- (id)proofingFlowViewController
{
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v2;
  id v3;

  v2 = self;
  v3 = sub_213F7CAEC();

  return v3;
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254D5DC58;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254D5DC60;
  v12[5] = v11;
  v13 = self;
  sub_213FD7484((uint64_t)v7, (uint64_t)&unk_254D5DC68, (uint64_t)v12);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_254D5DC38;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_254D5DC40;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_213FD7484((uint64_t)v11, (uint64_t)&unk_254D5DC48, (uint64_t)v16);
  swift_release();
}

- (void)dealloc
{
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v2;

  v2 = self;
  CIDVUIInternalProofingFlowManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_configuration));
  swift_unknownObjectWeakDestroy();
  sub_213F7FB0C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_delegate);
}

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)init
{
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *result;

  result = (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)proofingEligibilityStatus
{
  int v1;

  sub_213FF785C();
  swift_allocObject();
  sub_213FF7850();
  if ((sub_213FF782C() & 1) != 0)
  {
    swift_release();
    return 0;
  }
  else if (UIAccessibilityIsSwitchControlRunning() || _AXSAssistiveTouchEnabled())
  {
    swift_release();
    return 1;
  }
  else
  {
    v1 = _AXSCommandAndControlEnabled();
    swift_release();
    if (v1)
      return 1;
    else
      return 2;
  }
}

@end

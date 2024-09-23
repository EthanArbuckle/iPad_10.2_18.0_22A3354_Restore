@implementation LACPreboardController

- (BOOL)isRequired
{
  _TtC23LocalAuthenticationCore21LACPreboardController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = LACPreboardController.isRequired.getter();

  return v3 & 1;
}

- (int64_t)useCase
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC23LocalAuthenticationCore21LACPreboardController *v7;
  int64_t v8;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_useCaseProvider);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (id)uppTeamName
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC23LocalAuthenticationCore21LACPreboardController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uppManager);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v8 = v6(v4, v5);
  v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x2426863FC](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)launchPreboardWithError:(id *)a3
{
  _TtC23LocalAuthenticationCore21LACPreboardController *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  LACPreboardController.launchPreboard()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)_convertErrorToNSError(_:)();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (void)launchPreboardWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23LocalAuthenticationCore21LACPreboardController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.launchPreboard();
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTA_52Tu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_57Tu, (uint64_t)v12);
  swift_release();
}

- (void)enableCurrentUseCaseWithPasscode:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC23LocalAuthenticationCore21LACPreboardController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.enableCurrentUseCase(withPasscode:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_37Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_42Tu, (uint64_t)v14);
  swift_release();
}

- (void)terminateWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23LocalAuthenticationCore21LACPreboardController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.terminate();
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v12);
  swift_release();
}

- (_TtC23LocalAuthenticationCore21LACPreboardController)init
{
  _TtC23LocalAuthenticationCore21LACPreboardController *result;

  result = (_TtC23LocalAuthenticationCore21LACPreboardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launcher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_passcodeVerifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uppManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_useCaseProvider);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uuid;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController____lazy_storage___contextProvider, (uint64_t *)&demangling cache variable for type metadata for LACACMContextProviding??);
  outlined consume of Result<(), Error>?(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launchResult), self->contextProviderFactory[OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launchResult]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController____lazy_storage___launchDispatchQueue));
}

- (id)acmContextForUUID:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC23LocalAuthenticationCore21LACPreboardController *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Class isa;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  v12 = LACPreboardController.acmContext(for:)((uint64_t)v8);
  v14 = v13;
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for UUID?);

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v12, v14);
  return isa;
}

- (id)bundleIDForRequest:(id)a3
{
  return 0;
}

@end

@implementation LACDTOPendingPolicyEvaluationStore

+ (NSString)storeKey
{
  return (NSString *)(id)MEMORY[0x2426863FC](0xD000000000000012, 0x8000000240A83060);
}

- (NSArray)pendingEvaluations
{
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v3, (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, uint64_t))specialized Sequence._copySequenceContents(initializing:));

  swift_bridgeObjectRelease();
  type metadata accessor for LACDTOMutablePendingPolicyEvaluation();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  return (NSArray *)isa;
}

- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)initWithPersistentStore:(id)a3 workQueue:(id)a4
{
  id v6;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *)specialized LACDTOPendingPolicyEvaluationStore.init(persistentStore:workQueue:)((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (void)loadPersistedEvaluationsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v12[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ();
  v12[6] = v9;
  v13 = self;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in LACDTOPendingPolicyEvaluationStore.loadPersistedEvaluations(completion:)partial apply, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v13;
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
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACDTOPendingPolicyEvaluationStore.load();
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

- (void)persistEvaluations
{
  uint64_t ObjectType;
  uint64_t (*v4)(void);
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(void *, _QWORD *);
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v10;

  ObjectType = swift_getObjectType();
  v4 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x88);
  v5 = self;
  v6 = v4();
  v7 = *(uint64_t *)((char *)&v5->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_taskGroup);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = ObjectType;
  v9 = *(void (**)(void *, _QWORD *))(*(_QWORD *)v7 + 120);
  v10 = v5;
  v9(&closure #1 in LACDTOPendingPolicyEvaluationStore.persist()partial apply, v8);

  swift_release();
}

- (void)addPendingEvaluation:(id)a3
{
  char *v4;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v5;

  v4 = (char *)a3;
  v5 = self;
  LACDTOPendingPolicyEvaluationStore.addPendingEvaluation(_:)(v4);

}

- (id)pendingEvaluationWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8 = LACDTOPendingPolicyEvaluationStore.pendingEvaluation(withIdentifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)removePendingEvaluationWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v7;
  uint64_t v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_pendingEvaluationsDict);
  v7 = self;
  swift_bridgeObjectRetain();

  LACDTOPendingPolicyEvaluationStore.pendingEvaluationsDict.setter(v8);
  swift_bridgeObjectRelease();
}

- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)init
{
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *result;

  result = (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_workQueue));
  swift_release();
  swift_bridgeObjectRelease();
}

@end

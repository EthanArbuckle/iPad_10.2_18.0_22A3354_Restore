@implementation DURequest

- (_TtC21DocumentUnderstanding8DUClient)client
{
  return (_TtC21DocumentUnderstanding8DUClient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_client));
}

- (_TtC21DocumentUnderstanding20DURequestContentType)contentType
{
  return (_TtC21DocumentUnderstanding20DURequestContentType *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_contentType);
}

- (NSArray)strategies
{
  NSArray v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_strategies))
  {
    type metadata accessor for DURequestStrategy();
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSArray *)v2.super.isa;
}

- (_TtC21DocumentUnderstanding9DURequest)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  objc_super v12;

  if (a5)
  {
    type metadata accessor for DURequestStrategy();
    v8 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v8 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_client) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_contentType) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding9DURequest_strategies) = v8;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DURequest();
  v9 = a3;
  v10 = a4;
  return -[DURequest init](&v12, sel_init);
}

- (void)executeWithResultWithDocument:(_TtC21DocumentUnderstanding10DUDocument *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC21DocumentUnderstanding10DUDocument *v15;
  _TtC21DocumentUnderstanding9DURequest *v16;
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
  v13[4] = &async function pointer to partial apply for @objc closure #1 in DURequest.executeWithResult(document:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTATu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v14);
  swift_release();
}

- (void)executeWithDocument:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC21DocumentUnderstanding9DURequest *v15;
  id v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned DUResponse, @unowned NSError?) -> ();
  v13[7] = v11;
  v14 = a3;
  v15 = self;
  v16 = v14;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in DURequest.execute(document:completion:)partial apply, (uint64_t)v13);

  swift_release();
  swift_release();
}

- (_TtC21DocumentUnderstanding9DURequest)init
{
  _TtC21DocumentUnderstanding9DURequest *result;

  result = (_TtC21DocumentUnderstanding9DURequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end

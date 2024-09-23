@implementation String:

- (uint64_t)AnimationResource
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

- (uint64_t)String
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

- (unint64_t)String
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]?);
    v2 = lazy protocol witness table accessor for type [String : String] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B], MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    result = MEMORY[0x220772E3C](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?);
  }
  return result;
}

- (Class)NSObject
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (unint64_t)Any
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Any].Keys);
    result = MEMORY[0x220772E3C](MEMORY[0x24BEE0310], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys);
  }
  return result;
}

- (uint64_t)Any
{
  return postLoad #1 (data:) in closure #1 in static Entity.loadAnchorAsync(named:in:)(*a1, (void (*)(_QWORD))type metadata accessor for AnchorEntity);
}

{
  return postLoad #1 (data:) in closure #1 in static Entity.loadAnchorAsync(named:in:)(*a1, (void (*)(_QWORD))type metadata accessor for BodyTrackedEntity);
}

{
  return specialized thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]) -> (@error @owned Error)(a1);
}

{
  return specialized thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]) -> (@error @owned Error)(a1);
}

- (id)String
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t (*v21)(uint64_t, id, id, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = a2;
  v23 = a5;
  v8 = type metadata accessor for UUID();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(uint64_t (**)(uint64_t, id, id, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  swift_retain();
  v16 = a3;
  v17 = a4;
  v18 = (void *)v21(v22, v16, v17, v23, v10, v11, v12, v13, v15);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  if (!v18)
    return 0;
  v19 = (void *)_convertErrorToNSError(_:)();

  return v19;
}

- (unint64_t)AudioResource
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : AudioResource].Keys);
    result = MEMORY[0x220772E3C](MEMORY[0x24BEE0310], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys);
  }
  return result;
}

@end

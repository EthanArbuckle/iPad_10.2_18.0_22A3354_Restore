@implementation String:

- (void)Any
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [String : Any])
  {
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : Any]);
  }
}

- (uint64_t)Any
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (void)Encodable
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [String : Encodable])
  {
    type metadata accessor for CVarArg(255, &lazy cache variable for type metadata for Encodable);
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : Encodable]);
  }
}

- (unint64_t)Any
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys)
  {
    type metadata accessor for [String : Any](255, &lazy cache variable for type metadata for [String : Any].Keys, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DE9EC0]);
    result = MEMORY[0x18D75FFDC](MEMORY[0x1E0DE9ED0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys);
  }
  return result;
}

- (void)String
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [String : String])
  {
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : String]);
  }
}

- (uint64_t)String
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    type metadata accessor for [String : String]();
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x18D75FFDC](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

@end

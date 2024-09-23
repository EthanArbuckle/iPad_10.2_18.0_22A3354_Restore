@implementation String:

- (uint64_t)Application
{
  return swift_release();
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
    _sSo8NSObjectCMaTm_0(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (unint64_t)NSObject
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : NSObject]);
    result = MEMORY[0x1C3B750C8](MEMORY[0x1E0CB1828], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B]);
  }
  return result;
}

@end

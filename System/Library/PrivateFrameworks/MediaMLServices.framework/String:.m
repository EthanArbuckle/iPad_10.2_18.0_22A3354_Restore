@implementation String:

- (uint64_t)Any
{
  id v2;
  void (*v4)(void);

  v4 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v2 = a2;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v4();
  swift_bridgeObjectRelease();

  return swift_release();
}

- (unint64_t)Any
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String : Any] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : Any] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Any]);
    v1 = MEMORY[0x242696FFC](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any] and conformance [A : B]);
    return v1;
  }
  return v3;
}

@end

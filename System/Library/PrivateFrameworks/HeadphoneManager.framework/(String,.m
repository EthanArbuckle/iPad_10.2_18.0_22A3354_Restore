@implementation (String,

- (unint64_t)ReplayData)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(String, ReplayData)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(String, ReplayData)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(String, ReplayData)]);
    v1 = MEMORY[0x24263B698](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(String, ReplayData)] and conformance [A]);
    return v1;
  }
  return v3;
}

- (void)ReplayData)
{
  swift_bridgeObjectRelease();
}

@end

@implementation (Double,

- (unint64_t)Double)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(Double, Double)]);
    v1 = MEMORY[0x242696A30](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A]);
    return v1;
  }
  return v3;
}

@end

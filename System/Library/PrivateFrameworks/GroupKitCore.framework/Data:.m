@implementation Data:

- (unint64_t)CryptoUserRole
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Data : CryptoUserRole] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [Data : CryptoUserRole] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Data : CryptoUserRole]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04E8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Data : CryptoUserRole] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (void)CryptoUserRole
{
  swift_bridgeObjectRelease();
}

@end

@implementation (GPKUserID,

- (unint64_t)String)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(GPKUserID, String)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(GPKUserID, String)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(GPKUserID, String)]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(GPKUserID, String)] and conformance [A]);
    return v1;
  }
  return v3;
}

- (unint64_t)GPKMemberRole)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(GPKUserID, GPKMemberRole)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(GPKUserID, GPKMemberRole)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(GPKUserID, GPKMemberRole)]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(GPKUserID, GPKMemberRole)] and conformance [A]);
    return v1;
  }
  return v3;
}

@end

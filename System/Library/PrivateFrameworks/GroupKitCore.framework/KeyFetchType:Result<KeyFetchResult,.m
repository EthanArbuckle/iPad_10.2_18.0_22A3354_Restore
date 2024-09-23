@implementation KeyFetchType:Result<KeyFetchResult,

- (void)Error>
{
  outlined consume of [KeyFetchType : Result<KeyFetchResult, Error>].Iterator._Variant();
}

- (uint64_t)Error>
{
  return swift_release();
}

- (unint64_t)Error>
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [KeyFetchType : Result<KeyFetchResult, Error>] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [KeyFetchType : Result<KeyFetchResult, Error>] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [KeyFetchType : Result<KeyFetchResult, Error>]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [KeyFetchType : Result<KeyFetchResult, Error>] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (_QWORD)Error>
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

@end

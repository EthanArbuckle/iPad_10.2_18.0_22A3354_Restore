@implementation (version:UInt32,data:

- (unint64_t)Data)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type EnumeratedSequence<[(version: UInt32, data: Data)]> and conformance EnumeratedSequence<A>;
  if (!lazy protocol witness table cache variable for type EnumeratedSequence<[(version: UInt32, data: Data)]> and conformance EnumeratedSequence<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EnumeratedSequence<[(version: UInt32, data: Data)]>);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE2FC0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type EnumeratedSequence<[(version: UInt32, data: Data)]> and conformance EnumeratedSequence<A>);
    return v1;
  }
  return v3;
}

- (void)Data)
{
  swift_bridgeObjectRelease();
}

@end

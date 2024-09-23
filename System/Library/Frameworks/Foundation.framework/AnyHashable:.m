@implementation AnyHashable:

- (unint64_t)AnyHashable
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AnyHashable : AnyHashable]);
    v2 = MEMORY[0x1E0DEC1A0];
    result = MEMORY[0x186DA9D64](MEMORY[0x1E0DEA0C0], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B]);
  }
  return result;
}

@end

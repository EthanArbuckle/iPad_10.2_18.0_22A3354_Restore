@implementation String:

- (uint64_t)AttributedString._AttributeValue
{
  swift_bridgeObjectRelease();
  return a1;
}

- (uint64_t)Morphology._CustomPronoun
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Morphology._CustomPronoun]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x186DA9D64](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

@end

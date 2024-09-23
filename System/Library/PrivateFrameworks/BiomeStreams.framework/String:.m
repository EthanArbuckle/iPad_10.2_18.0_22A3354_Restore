@implementation String:

- (uint64_t)StorableValue
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

- (uint64_t)SQLDataType
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : SQLDataType]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x193FED7A0](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)Schema
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Schema]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x193FED7A0](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

@end

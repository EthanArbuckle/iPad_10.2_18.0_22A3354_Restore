@implementation String:

- (uint64_t)String
{
  return swift_release();
}

- (Class)NSObject
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (uint64_t)UseCase
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCase]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x23B822CDC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

- (unint64_t)UseCaseGroup
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCaseGroup]);
    v2 = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError(&lazy protocol witness table cache variable for type UseCaseGroup and conformance UseCaseGroup, (uint64_t (*)(uint64_t))type metadata accessor for UseCaseGroup, (uint64_t)&protocol conformance descriptor for UseCaseGroup);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCaseGroup]);
    v2 = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError(&lazy protocol witness table cache variable for type UseCaseGroup and conformance UseCaseGroup, (uint64_t (*)(uint64_t))type metadata accessor for UseCaseGroup, (uint64_t)&protocol conformance descriptor for UseCaseGroup);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)Date
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Date]);
    v2 = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError(&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Date]);
    v2 = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError((unint64_t *)&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Data
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x23B822CDC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

@end

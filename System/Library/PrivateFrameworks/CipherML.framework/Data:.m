@implementation Data:

- (unint64_t)SecretKey
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Data : SecretKey]);
    v2[0] = lazy protocol witness table accessor for type Data and conformance Data();
    v2[1] = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError(&lazy protocol witness table cache variable for type SecretKey and conformance SecretKey, (uint64_t (*)(uint64_t))type metadata accessor for SecretKey, (uint64_t)&protocol conformance descriptor for SecretKey);
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Data : SecretKey]);
    v2[0] = lazy protocol witness table accessor for type Data and conformance Data();
    v2[1] = lazy protocol witness table accessor for type CipherMLError and conformance CipherMLError(&lazy protocol witness table cache variable for type SecretKey and conformance SecretKey, (uint64_t (*)(uint64_t))type metadata accessor for SecretKey, (uint64_t)&protocol conformance descriptor for SecretKey);
    result = MEMORY[0x23B822CDC](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Data : SecretKey] and conformance <> [A : B]);
  }
  return result;
}

@end

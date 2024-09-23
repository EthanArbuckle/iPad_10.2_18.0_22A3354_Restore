@implementation MLProgress.Metric:

- (unint64_t)URL
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : URL]);
    v2[0] = lazy protocol witness table accessor for type MLProgress.Metric and conformance MLProgress.Metric();
    v2[1] = lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    result = MEMORY[0x22075B938](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : URL]);
    v2[0] = lazy protocol witness table accessor for type MLProgress.Metric and conformance MLProgress.Metric();
    v2[1] = lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    result = MEMORY[0x22075B938](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Double
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : Double]);
    v10[0] = a2();
    v10[1] = a3;
    result = MEMORY[0x22075B938](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

@end

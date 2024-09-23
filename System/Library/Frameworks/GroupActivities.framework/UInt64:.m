@implementation UInt64:

- (uint64_t)PluginAttachmentLedgerTopic.Participant
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1A1B05BEC](MEMORY[0x1E0C95FB8], v4);
    atomic_store(result, a1);
  }
  return result;
}

- (void)PubSubTopic.Participant
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt64 : PubSubTopic.Participant]);
    v0 = type metadata accessor for Published();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
  }
}

- (unint64_t)PubSubTopic.Participant
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt64 : PubSubTopic.Participant]);
    v2 = lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type PubSubTopic.Participant and conformance PubSubTopic.Participant, (uint64_t (*)(uint64_t))MEMORY[0x1E0D149C8], MEMORY[0x1E0D149D8]);
    result = MEMORY[0x1A1B05BEC](MEMORY[0x1E0DEA0C8], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B]);
  }
  return result;
}

@end

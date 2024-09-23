@implementation UInt64:

- (void)AttachmentLedger_AttachmentEncryption
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Published<[UInt64 : AttachmentLedger_AttachmentEncryption]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt64 : AttachmentLedger_AttachmentEncryption]);
    v0 = type metadata accessor for Published();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[UInt64 : AttachmentLedger_AttachmentEncryption]>);
  }
}

- (uint64_t)AttachmentLedger_AttachmentEncryption
{
  swift_bridgeObjectRetain();
  return a1;
}

- (void)PubSubTopic.Participant
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = type metadata accessor for Published();
    if (!v5)
      atomic_store(v4, a2);
  }
}

@end

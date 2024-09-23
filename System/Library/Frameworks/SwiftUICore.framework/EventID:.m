@implementation EventID:

- (void)EventType
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for External<[EventID : EventType]>)
  {
    type metadata accessor for [EventID : EventType]();
    v0 = type metadata accessor for External();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for External<[EventID : EventType]>);
  }
}

- (unint64_t)EventType
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>;
  if (!lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>)
  {
    type metadata accessor for External<[EventID : EventType]>();
    result = MEMORY[0x23B7C9C04](MEMORY[0x24BE09678], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>);
  }
  return result;
}

@end

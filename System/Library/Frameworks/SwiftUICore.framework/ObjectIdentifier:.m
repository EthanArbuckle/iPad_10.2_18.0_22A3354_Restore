@implementation ObjectIdentifier:

- (void)ScrollStateRequest
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [ObjectIdentifier : ScrollStateRequest])
  {
    type metadata accessor for ScrollStateRequest(255, (unint64_t *)&lazy cache variable for type metadata for ScrollStateRequest);
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ObjectIdentifier : ScrollStateRequest]);
  }
}

- (void)DynamicPropertyCache.Fields
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!lazy cache variable for type metadata for MutableBox<[ObjectIdentifier : DynamicPropertyCache.Fields]>)
  {
    type metadata accessor for [String : Any](255, &lazy cache variable for type metadata for [ObjectIdentifier : DynamicPropertyCache.Fields]);
    v5 = type metadata accessor for MutableBox(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&lazy cache variable for type metadata for MutableBox<[ObjectIdentifier : DynamicPropertyCache.Fields]>);
  }
}

@end

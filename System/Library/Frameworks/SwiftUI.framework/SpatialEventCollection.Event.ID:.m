@implementation SpatialEventCollection.Event.ID:

- (uint64_t)SpatialEventCollection.Event
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

- (void)SpatialEventCollection.Event
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [SpatialEventCollection.Event.ID : SpatialEventCollection.Event].Index._Variant)
  {
    lazy protocol witness table accessor for type SpatialEventCollection.Event.ID and conformance SpatialEventCollection.Event.ID();
    v0 = type metadata accessor for Dictionary.Index._Variant();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [SpatialEventCollection.Event.ID : SpatialEventCollection.Event].Index._Variant);
  }
}

@end

@implementation EventID:

- (void)EventType
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Attribute<[EventID : EventType]>)
  {
    type metadata accessor for [EventID : EventType]();
    v0 = type metadata accessor for Attribute();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Attribute<[EventID : EventType]>);
  }
}

- (uint64_t)PanEvent
{
  uint64_t result;

  if (a2 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

- (void)PanEvent
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [EventID : PanEvent])
  {
    lazy protocol witness table accessor for type EventID and conformance EventID();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [EventID : PanEvent]);
  }
}

- (void)TouchEvent
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for MapGesture<[EventID : TouchEvent], SpatialEventCollection>)
  {
    type metadata accessor for [EventID : TouchEvent]();
    v0 = type metadata accessor for MapGesture();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for MapGesture<[EventID : TouchEvent], SpatialEventCollection>);
  }
}

- (uint64_t)TouchEvent
{
  uint64_t v4;

  type metadata accessor for CoordinateSpaceGesture<[EventID : TouchEvent]>();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

@end

@implementation GDVUObservationUpdate

- (int64_t)updateType
{
  return GDVUObservationUpdate.updateType.getter();
}

- (int64_t)observationIdentifier
{
  GDVUObservationUpdate *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUObservationUpdate.observationIdentifier.getter();
  v4 = v3;

  return v4;
}

- (GDEntityIdentifier)entityIdentifier
{
  GDVUObservationUpdate *v2;
  void *v3;
  void *v4;

  v2 = self;
  GDVUObservationUpdate.entityIdentifier.getter();
  v4 = v3;

  return (GDEntityIdentifier *)v4;
}

- (GDVUObservationUpdate)init
{
  GDVUObservationUpdate.init()();
}

@end

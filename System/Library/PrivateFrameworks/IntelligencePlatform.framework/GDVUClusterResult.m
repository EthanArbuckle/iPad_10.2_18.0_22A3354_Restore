@implementation GDVUClusterResult

- (int64_t)observationIdentifier
{
  return GDVUClusterResult.observationIdentifier.getter();
}

- (GDEntityIdentifier)entityIdentifier
{
  return (GDEntityIdentifier *)GDVUClusterResult.entityIdentifier.getter();
}

- (BOOL)isKeyFace
{
  return GDVUClusterResult.isKeyFace.getter() & 1;
}

- (GDVUClusterResult)init
{
  GDVUClusterResult.init()();
}

- (void).cxx_destruct
{

}

@end

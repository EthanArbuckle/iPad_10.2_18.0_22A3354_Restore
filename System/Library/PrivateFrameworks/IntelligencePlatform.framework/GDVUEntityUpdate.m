@implementation GDVUEntityUpdate

- (int64_t)updateType
{
  int64_t result;

  GDVUEntityUpdate.updateType.getter();
  return result;
}

- (GDEntityIdentifier)entityIdentifier
{
  GDVUEntityUpdate *v2;
  void *v3;
  void *v4;

  v2 = self;
  GDVUEntityUpdate.entityIdentifier.getter();
  v4 = v3;

  return (GDEntityIdentifier *)v4;
}

- (NSUUID)tag
{
  return (NSUUID *)sub_1AE8DB4A8(self, (uint64_t)a2, GDVUEntityUpdate.tag.getter);
}

- (GDVUEntityUpdate)init
{
  GDVUEntityUpdate.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end

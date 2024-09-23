@implementation GDVUEntityClass

- (NSString)id
{
  return (NSString *)sub_1AE8D92EC(self, (uint64_t)a2, GDVUEntityClass.id.getter);
}

- (NSString)name
{
  return (NSString *)sub_1AE8D92EC(self, (uint64_t)a2, GDVUEntityClass.name.getter);
}

- (unsigned)intValue
{
  return GDVUEntityClass.intValue.getter();
}

- (BOOL)isEqual:(id)a3
{
  return sub_1AE8DAC84(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))GDVUEntityClass.isEqual(_:));
}

- (int64_t)hash
{
  GDVUEntityClass *v2;
  id v3;

  v2 = self;
  v3 = GDVUEntityClass.hash.getter();

  return (int64_t)v3;
}

+ (id)person
{
  return static GDVUEntityClass.person()();
}

+ (id)animal
{
  return static GDVUEntityClass.animal()();
}

+ (id)entity
{
  return static GDVUEntityClass.entity()();
}

- (GDVUEntityClass)init
{
  GDVUEntityClass.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

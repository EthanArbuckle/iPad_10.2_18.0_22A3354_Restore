@implementation GDVUContext

- (GDVUContext)init
{
  return (GDVUContext *)sub_1AE8D8A7C();
}

- (NSUUID)moment
{
  return (NSUUID *)sub_1AE8DB4A8(self, (uint64_t)a2, GDVUContext.moment.getter);
}

- (void)setMoment:(id)a3
{
  sub_1AE8D8E28(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))GDVUContext.moment.setter);
}

- (NSUUID)asset
{
  return (NSUUID *)sub_1AE8DB4A8(self, (uint64_t)a2, GDVUContext.asset.getter);
}

- (void)setAsset:(id)a3
{
  sub_1AE8D8E28(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))GDVUContext.asset.setter);
}

- (int64_t)source
{
  return GDVUContext.source.getter();
}

- (void)setSource:(int64_t)a3
{
  GDVUContext *v3;

  v3 = self;
  GDVUContext.source.setter();

}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end

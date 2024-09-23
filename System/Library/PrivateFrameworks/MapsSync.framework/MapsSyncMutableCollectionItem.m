@implementation MapsSyncMutableCollectionItem

- (_TtC8MapsSync29MapsSyncMutableCollectionItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSSet)collections
{
  _TtC8MapsSync29MapsSyncMutableCollectionItem *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_1A41891FC();

  if (v3)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A418DF64(&qword_1EE70F9D8, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    v4 = (void *)sub_1A423C2B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSSet *)v4;
}

- (void)setCollections:(id)a3
{
  unint64_t v3;
  _TtC8MapsSync29MapsSyncMutableCollectionItem *v5;

  v3 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A418DF64(&qword_1EE70F9D8, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    v3 = sub_1A423C2D8();
  }
  v5 = self;
  sub_1A41892DC(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem));
}

@end

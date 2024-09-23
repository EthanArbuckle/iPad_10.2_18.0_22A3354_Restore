@implementation MapsSyncMutableCollectionTransitItem

- (_TtC8MapsSync36MapsSyncMutableCollectionTransitItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCollectionTransitItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSData)transitLineStorageData
{
  void *v2;
  _TtC8MapsSync36MapsSyncMutableCollectionTransitItem *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem);
  v3 = self;
  v4 = objc_msgSend(v2, sel_transitLineStorage);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

    v9 = (void *)sub_1A423BF48();
    sub_1A40D778C(v6, v8);
  }
  else
  {

    v9 = 0;
  }
  return (NSData *)v9;
}

- (void)setTransitLineStorageData:(id)a3
{
  void *v3;
  _TtC8MapsSync36MapsSyncMutableCollectionTransitItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  _TtC8MapsSync36MapsSyncMutableCollectionTransitItem *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_1A423BF54();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_1A4106378((uint64_t)v3, v7);

}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem), sel_setMuid_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem));
}

@end

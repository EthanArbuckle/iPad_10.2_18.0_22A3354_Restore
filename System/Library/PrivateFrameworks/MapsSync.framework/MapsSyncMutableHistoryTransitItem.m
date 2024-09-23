@implementation MapsSyncMutableHistoryTransitItem

- (_TtC8MapsSync33MapsSyncMutableHistoryTransitItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistoryTransitItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync33MapsSyncMutableHistoryTransitItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSData)transitLineItemStorageData
{
  void *v2;
  _TtC8MapsSync33MapsSyncMutableHistoryTransitItem *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync33MapsSyncMutableHistoryTransitItem__proxyHistory);
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

- (void)setTransitLineItemStorageData:(id)a3
{
  void *v3;
  _TtC8MapsSync33MapsSyncMutableHistoryTransitItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  _TtC8MapsSync33MapsSyncMutableHistoryTransitItem *v8;

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
  sub_1A417D188((uint64_t)v3, v7);

}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync33MapsSyncMutableHistoryTransitItem__proxyHistory), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync33MapsSyncMutableHistoryTransitItem__proxyHistory), sel_setMuid_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync33MapsSyncMutableHistoryTransitItem__proxyHistory));
}

@end

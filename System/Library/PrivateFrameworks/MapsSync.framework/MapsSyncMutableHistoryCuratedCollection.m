@implementation MapsSyncMutableHistoryCuratedCollection

- (_TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (unint64_t)curatedCollectionIdentifier
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy), sel_curatedCollectionIdentifier);
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy), sel_setCuratedCollectionIdentifier_, a3);
}

- (int)resultProviderIdentifier
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy), sel_resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy), sel_setResultProviderIdentifier_, *(_QWORD *)&a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync39MapsSyncMutableHistoryCuratedCollection__proxy));
}

@end

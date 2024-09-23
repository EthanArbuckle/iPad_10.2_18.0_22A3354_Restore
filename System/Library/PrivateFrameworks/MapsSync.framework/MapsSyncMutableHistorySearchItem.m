@implementation MapsSyncMutableHistorySearchItem

- (_TtC8MapsSync32MapsSyncMutableHistorySearchItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistorySearchItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableHistorySearchItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (GEOMapRegion)geoMapRegion
{
  _TtC8MapsSync32MapsSyncMutableHistorySearchItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1A4199F60();

  return (GEOMapRegion *)v3;
}

- (void)setGeoMapRegion:(id)a3
{
  id v5;
  _TtC8MapsSync32MapsSyncMutableHistorySearchItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A419A090(a3);

}

- (NSString)language
{
  return (NSString *)sub_1A419A550((char *)self, (uint64_t)a2, (SEL *)&selRef_language);
}

- (void)setLanguage:(id)a3
{
  sub_1A419A664((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setLanguage_);
}

- (NSString)locationDisplay
{
  return (NSString *)sub_1A419A550((char *)self, (uint64_t)a2, (SEL *)&selRef_locationDisplay);
}

- (void)setLocationDisplay:(id)a3
{
  sub_1A419A664((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setLocationDisplay_);
}

- (NSString)query
{
  return (NSString *)sub_1A419A550((char *)self, (uint64_t)a2, (SEL *)&selRef_query);
}

- (void)setQuery:(id)a3
{
  sub_1A419A664((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setQuery_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableHistorySearchItem__proxyHistory));
}

@end

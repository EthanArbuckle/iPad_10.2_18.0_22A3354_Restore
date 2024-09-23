@implementation DaemonCoreDataSpotlightIndexer

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1CF417558((uint64_t)v8, (uint64_t)sub_1CF418694, v7);

  swift_release();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer *v11;

  v7 = _Block_copy(a5);
  v8 = sub_1CF524FEC();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a3;
  v11 = self;
  sub_1CF417760((uint64_t)v10, v8, (uint64_t)sub_1CF4185B0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)attributeSetForObject:(id)a3
{
  id v4;
  _TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CF4179B4(v4);

  return v6;
}

- (id)bundleIdentifier
{
  return (id)sub_1CF524E78();
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  objc_class *ObjectType;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_coreAnalytics;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_context) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[NSCoreDataCoreSpotlightDelegate initForStoreWithDescription:coordinator:](&v10, sel_initForStoreWithDescription_coordinator_, a3, a4);
}

- (void).cxx_destruct
{
  sub_1CF418618((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_coreAnalytics);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_context));
}

@end

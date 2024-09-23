@implementation ProximityReaderDiscoveryAnalyticsManager

- (_TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager)init
{
  _OWORD *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_discoveryService) = 0;
  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_sessionData);
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_lastQuantile) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ProximityReaderDiscoveryAnalyticsManager();
  return -[ProximityReaderDiscoveryAnalyticsManager init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_21C30E154(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_sessionData), *(_QWORD *)&self->discoveryService[OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_sessionData]);
}

- (void)discoveryItemWithIdentifier:(id)a3 position:(double)a4
{
  _TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager *v6;

  if (a3)
    sub_21C3A7ED8();
  v6 = self;
  sub_21C30CDB8(a4);

  swift_bridgeObjectRelease();
}

@end

@implementation MapsSyncMutableHistoryMultiPointRoute

- (_TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (BOOL)navigationInterrupted
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_navigationInterrupted);
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_setNavigationInterrupted_, a3);
}

- (signed)routeProgressWaypointIndex
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_routeProgressWaypointIndex);
}

- (void)setRouteProgressWaypointIndex:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_setRouteProgressWaypointIndex_, a3);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v2;
  id v3;

  v2 = self;
  v3 = sub_1A412A314();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  id v5;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v6;

  v5 = a3;
  v6 = self;
  sub_1A412A444(a3);

}

- (NSData)sharedETAData
{
  void *v2;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  v3 = self;
  v4 = objc_msgSend(v2, sel_sharedETAData);
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

- (void)setSharedETAData:(id)a3
{
  void *v3;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v12;
  id v13;

  v3 = a3;
  if (!a3)
  {
    v9 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
    v12 = self;
    v8 = 0xF000000000000000;
    goto LABEL_5;
  }
  v5 = self;
  v6 = v3;
  v3 = (void *)sub_1A423BF54();
  v8 = v7;

  v9 = *(Class *)((char *)&v5->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  if (v8 >> 60 == 15)
  {
LABEL_5:
    v10 = v9;
    v11 = 0;
    goto LABEL_6;
  }
  v10 = v9;
  v11 = sub_1A423BF48();
LABEL_6:
  v13 = (id)v11;
  objc_msgSend(v10, sel_setSharedETAData_);
  sub_1A40D7778((uint64_t)v3, v8);

}

- (NSNumber)requiredCharge
{
  return (NSNumber *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_requiredCharge);
}

- (void)setRequiredCharge:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_setRequiredCharge_, a3);
}

- (signed)type
{
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v2;
  signed __int16 v3;

  v2 = self;
  v3 = sub_1A412AE74();

  return v3;
}

- (void)setType:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_setType_, a3);
}

- (NSString)vehicleIdentifier
{
  void *v2;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  v3 = self;
  v4 = objc_msgSend(v2, sel_vehicleIdentifier);
  if (v4)
  {
    v5 = v4;
    sub_1A423C14C();

    v6 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setVehicleIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v6;
  id v7;
  id v8;
  _TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute *v9;
  id v10;
  id v11;

  if (!a3)
  {
    v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
    goto LABEL_5;
  }
  sub_1A423C14C();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  if (!v5)
  {
LABEL_5:
    v9 = self;
    v7 = v4;
    v8 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = v4;
  v10 = (id)sub_1A423C140();
  swift_bridgeObjectRelease();
  v8 = v10;
LABEL_6:
  v11 = v8;
  objc_msgSend(v7, sel_setVehicleIdentifier_);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory));
}

@end

@implementation MSHistoryMultiPointRoute

- (MSHistoryMultiPointRoute)initWithNavigationInterrupted:(BOOL)a3 requiredCharge:(id)a4 routeProgressWaypointIndex:(signed __int16)a5 routeRequestStorage:(id)a6 sharedETAData:(id)a7 type:(signed __int16)a8 vehicleIdentifier:(id)a9
{
  void *v9;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;

  v9 = a7;
  if (!a7)
  {
    v23 = a4;
    v24 = a6;
    v25 = a9;
    v19 = 0xF000000000000000;
    if (a9)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    v22 = 0;
    return (MSHistoryMultiPointRoute *)HistoryMultiPointRoute.init(navigationInterrupted:requiredCharge:routeProgressWaypointIndex:routeRequestStorage:sharedETAData:type:vehicleIdentifier:)(a3, a4, a5, a6, (uint64_t)v9, v19, a8, v20, v22);
  }
  v14 = a4;
  v15 = a6;
  v16 = a9;
  v17 = v9;
  v9 = (void *)sub_1A423BF54();
  v19 = v18;

  if (!a9)
    goto LABEL_5;
LABEL_3:
  v20 = sub_1A423C14C();
  v22 = v21;

  return (MSHistoryMultiPointRoute *)HistoryMultiPointRoute.init(navigationInterrupted:requiredCharge:routeProgressWaypointIndex:routeRequestStorage:sharedETAData:type:vehicleIdentifier:)(a3, a4, a5, a6, (uint64_t)v9, v19, a8, v20, v22);
}

- (MSHistoryMultiPointRoute)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 requiredCharge:(id)a5 routeProgressWaypointIndex:(signed __int16)a6 routeRequestStorage:(id)a7 sharedETAData:(id)a8 type:(signed __int16)a9 vehicleIdentifier:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MSHistoryMultiPointRoute *v31;
  void *v32;
  MSHistoryMultiPointRoute *v33;

  if (!a8)
  {
    v27 = a3;
    v28 = a5;
    v29 = a7;
    v30 = a10;
    v21 = 0;
    v23 = 0xF000000000000000;
    if (a10)
      goto LABEL_3;
LABEL_5:
    v24 = 0;
    v26 = 0;
    goto LABEL_6;
  }
  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a10;
  v20 = a8;
  v21 = sub_1A423BF54();
  v23 = v22;

  if (!a10)
    goto LABEL_5;
LABEL_3:
  v24 = sub_1A423C14C();
  v26 = v25;

LABEL_6:
  v31 = -[MapsSyncObject initWithStore:](self, sel_initWithStore_, a3);
  v32 = *(Class *)((char *)&v31->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v33 = v31;
  objc_msgSend(v32, sel_lock);
  sub_1A414BC60((uint64_t)v32, a4, a5, a6, a7, v21, v23, a9, v24, v26, (uint64_t)v33);
  objc_msgSend(v32, sel_unlock);

  sub_1A40D7778(v21, v23);
  swift_bridgeObjectRelease();
  return v33;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryMultiPointRoute *v7;

  v6 = a3;
  v7 = self;
  sub_1A414C2DC(v6, a4);

}

- (BOOL)navigationInterrupted
{
  void *v2;
  MSHistoryMultiPointRoute *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__navigationInterrupted);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  MSHistoryMultiPointRoute *v4;

  v4 = self;
  sub_1A414C6C8(a3);

}

- (NSNumber)requiredCharge
{
  MSHistoryMultiPointRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A414C978();

  return (NSNumber *)v3;
}

- (void)setRequiredCharge:(id)a3
{
  MSHistoryMultiPointRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A414EEA0(a3);

}

- (signed)routeProgressWaypointIndex
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSHistoryMultiPointRoute__routeProgressWaypointIndex);
}

- (void)setRouteProgressWaypointIndex:(signed __int16)a3
{
  MSHistoryMultiPointRoute *v4;

  v4 = self;
  sub_1A414CF08(a3);

}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  MSHistoryMultiPointRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A414D168();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  void *v5;
  MSHistoryMultiPointRoute *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A414D6D4((uint64_t)v5, a3, (uint64_t)v6);
  objc_msgSend(v5, sel_unlock);

}

- (NSData)sharedETAData
{
  MSHistoryMultiPointRoute *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A414DC88();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A423BF48();
    sub_1A40D7778(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setSharedETAData:(id)a3
{
  void *v3;
  MSHistoryMultiPointRoute *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSHistoryMultiPointRoute *v8;

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
  sub_1A414F138((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (signed)type
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSHistoryMultiPointRoute__type);
}

- (void)setType:(signed __int16)a3
{
  MSHistoryMultiPointRoute *v4;

  v4 = self;
  sub_1A414E358(a3);

}

- (NSString)vehicleIdentifier
{
  MSHistoryMultiPointRoute *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A414E648();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setVehicleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSHistoryMultiPointRoute *v7;

  if (a3)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1A414F354(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSHistoryMultiPointRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSHistoryMultiPointRoute *)sub_1A414ECAC(a3, a4, a5);
}

- (void).cxx_destruct
{

  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__routeRequestStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryMultiPointRoute__routeRequestStorage]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__sharedETAData), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryMultiPointRoute__sharedETAData]);
  swift_bridgeObjectRelease();
}

@end

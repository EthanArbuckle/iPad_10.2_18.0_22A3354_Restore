@implementation MSHistoryEvDirectionsItem

- (MSHistoryEvDirectionsItem)initWithRequiredCharge:(double)a3 vehicleIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MSHistoryEvDirectionsItem *v10;

  if (a4)
  {
    sub_1A423C14C();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v8 = qword_1ED1AB9F0;
  if (v7)
  {
    v9 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = -[MSHistoryEvDirectionsItem initWithStore:requiredCharge:vehicleIdentifier:](self, sel_initWithStore_requiredCharge_vehicleIdentifier_, v8, v9, a3);

  return v10;
}

- (MSHistoryEvDirectionsItem)initWithStore:(id)a3 requiredCharge:(double)a4 vehicleIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  if (a5)
  {
    v7 = sub_1A423C14C();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = sub_1A41AD188(a3, v7, v9, a4);
  swift_bridgeObjectRelease();
  return (MSHistoryEvDirectionsItem *)v10;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryEvDirectionsItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A41AC47C(v6, a4);

}

- (double)requiredCharge
{
  void *v2;
  MSHistoryEvDirectionsItem *v3;
  double v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(double *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__requiredCharge);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setRequiredCharge:(double)a3
{
  MSHistoryEvDirectionsItem *v4;

  v4 = self;
  sub_1A41AC6C4(a3);

}

- (NSString)vehicleIdentifier
{
  MSHistoryEvDirectionsItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A41AC9B4();
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
  MSHistoryEvDirectionsItem *v7;

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
  sub_1A41AD3FC(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSHistoryEvDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  id v9;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__requiredCharge) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__vehicleIdentifier);
  *v8 = 0;
  v8[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v9 = a3;
  return (MSHistoryEvDirectionsItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

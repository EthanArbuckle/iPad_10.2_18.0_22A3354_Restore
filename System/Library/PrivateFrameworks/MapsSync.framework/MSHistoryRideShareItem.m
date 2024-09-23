@implementation MSHistoryRideShareItem

- (MSHistoryRideShareItem)initWithEndWaypoint:(id)a3 startWaypoint:(id)a4
{
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;

  v5 = a3;
  if (!a3)
  {
    v13 = a4;
    v9 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v12 = 0xF000000000000000;
    return (MSHistoryRideShareItem *)HistoryRideShareItem.init(endWaypoint:startWaypoint:)((uint64_t)v5, v9, v10, v12);
  }
  v6 = a4;
  v7 = v5;
  v5 = (void *)sub_1A423BF54();
  v9 = v8;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1A423BF54();
  v12 = v11;

  return (MSHistoryRideShareItem *)HistoryRideShareItem.init(endWaypoint:startWaypoint:)((uint64_t)v5, v9, v10, v12);
}

- (MSHistoryRideShareItem)initWithStore:(id)a3 endWaypoint:(id)a4 startWaypoint:(id)a5
{
  void *v6;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;

  v6 = a4;
  if (!a4)
  {
    v16 = a3;
    v17 = a5;
    v12 = 0xF000000000000000;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v15 = 0xF000000000000000;
    return (MSHistoryRideShareItem *)HistoryRideShareItem.init(store:endWaypoint:startWaypoint:)(a3, (uint64_t)v6, v12, v13, v15);
  }
  v8 = a3;
  v9 = a5;
  v10 = v6;
  v6 = (void *)sub_1A423BF54();
  v12 = v11;

  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = sub_1A423BF54();
  v15 = v14;

  return (MSHistoryRideShareItem *)HistoryRideShareItem.init(store:endWaypoint:startWaypoint:)(a3, (uint64_t)v6, v12, v13, v15);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryRideShareItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A41B14F8(v6, a4);

}

- (NSData)endWaypoint
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41B1714);
}

- (void)setEndWaypoint:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A41B2210);
}

- (NSData)startWaypoint
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41B1AB8);
}

- (void)setStartWaypoint:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A41B2430);
}

- (MSHistoryRideShareItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__endWaypoint) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__startWaypoint) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v8 = a3;
  return (MSHistoryRideShareItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__endWaypoint), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryRideShareItem__endWaypoint]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__startWaypoint), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryRideShareItem__startWaypoint]);
}

@end

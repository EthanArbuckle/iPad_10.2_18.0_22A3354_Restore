@implementation MapsSyncVehicle

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  void *v13;
  _OWORD v14[2];

  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A4109BDC(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A40CD40C((uint64_t)v14);
}

+ (void)fetchForIdentifier:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_1A423C14C();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  _s8MapsSync0aB7VehicleC18fetchForIdentifier_10completionySS_yACSgctFZ_0(v5, v7, (uint64_t)sub_1A40E7534, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)colorHex
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__colorHex);
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState);
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A4119578((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__dateOfVehicleIngestion);
}

- (NSString)displayName
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__displayName);
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__headUnitBluetoothIdentifier);
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__headUnitMacAddress);
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__iapIdentifier);
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A4119578((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lastStateUpdateDate);
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__licensePlate);
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lprPowerType);
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lprVehicleType);
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__manufacturer);
}

- (NSString)model
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__model);
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__pairedAppIdentifier);
}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector);
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__siriIntentsIdentifier);
}

- (NSNumber)supportedConnectors
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__supportedConnectors));
}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__vehicleIdentifier);
}

- (NSNumber)vehicleType
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__vehicleType));
}

- (NSNumber)year
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__year));
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A41152D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks);
}

- (NSString)description
{
  _TtC8MapsSync15MapsSyncVehicle *v2;
  void *v3;

  v2 = self;
  sub_1A41F30B4();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync15MapsSyncVehicle *v4;
  _TtC8MapsSync15MapsSyncVehicle *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A41F3494((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync15MapsSyncVehicle *v5;

  v4 = a3;
  v5 = self;
  sub_1A41F43E0(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedVehicle();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync15MapsSyncVehicle *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41F7178, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync15MapsSyncVehicle)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync15MapsSyncVehicle *)sub_1A41F4D64(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__currentVehicleState]);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__dateOfVehicleIngestion, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__lastStateUpdateDate, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__powerByConnector]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__supportedConnectors));
  swift_bridgeObjectRelease();

  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync15MapsSyncVehicle__preferredChargingNetworks]);
}

@end

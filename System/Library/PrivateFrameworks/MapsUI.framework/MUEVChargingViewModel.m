@implementation MUEVChargingViewModel

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC6MapsUI21MUEVChargingViewModel *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availabilityProvider);
  v5 = self;
  v6 = v4;
  MUEVChargerAvailabilityProvider.unregisterObserver(_:)((uint64_t)v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[MUEVChargingViewModel dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_observer);

}

- (_TtC6MapsUI21MUEVChargingViewModel)init
{
  _TtC6MapsUI21MUEVChargingViewModel *result;

  result = (_TtC6MapsUI21MUEVChargingViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4
{
  void *v6;
  id v7;
  id v8;
  _TtC6MapsUI21MUEVChargingViewModel *v9;

  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availability);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availability) = (Class)a4;
  v7 = a4;
  v8 = a3;
  v9 = self;

  sub_191DBD754();
}

@end

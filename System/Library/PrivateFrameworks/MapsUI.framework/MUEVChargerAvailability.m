@implementation MUEVChargerAvailability

- (MURealTimeEVCharger)aggregatedInfo
{
  return (MURealTimeEVCharger *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_aggregatedInfo));
}

- (NSArray)plugs
{
  return (NSArray *)sub_191DD75C8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_plugs, &qword_1EE235470);
}

- (NSArray)vehicles
{
  return (NSArray *)sub_191DD75C8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_vehicles, (unint64_t *)&unk_1EE235540);
}

- (_TtC6MapsUI23MUEVChargerAvailability)initWithAggregatedCounts:(id)a3 plugs:(id)a4 vehicles:(id)a5
{
  objc_class *ObjectType;
  objc_class *v8;
  objc_class *v9;
  id v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_191DC65A4(0, &qword_1EE235470);
  v8 = (objc_class *)sub_191EEB044();
  sub_191DC65A4(0, (unint64_t *)&unk_1EE235540);
  v9 = (objc_class *)sub_191EEB044();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_aggregatedInfo) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_plugs) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_vehicles) = v9;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = a3;
  return -[MUEVChargerAvailability init](&v12, sel_init);
}

- (_TtC6MapsUI23MUEVChargerAvailability)init
{
  _TtC6MapsUI23MUEVChargerAvailability *result;

  result = (_TtC6MapsUI23MUEVChargerAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

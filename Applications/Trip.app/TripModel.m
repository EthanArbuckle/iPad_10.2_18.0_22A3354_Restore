@implementation TripModel

- (void)dealloc
{
  void *v3;
  _TtC4Trip9TripModel *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  objc_super v9;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  if (qword_1000329E8 != -1)
    swift_once(&qword_1000329E8, sub_100020480);
  static String._unconditionallyBridgeFromObjectiveC(_:)(static NSNotificationName.ClusterEvent);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "removeObserver:", v8);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for TripModel(0);
  -[TripModel dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Trip9TripModel__cardmodels;
  v4 = sub_1000064D4(&qword_100033158);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  os_log_type_t v5;
  _TtC4Trip9TripModel *v6;

  v4 = a3;
  v6 = self;
  v5 = static os_log_type_t.debug.getter(v6);
  sub_1000191DC(v5, 0xD000000000000027, 0x8000000100023DC0, 0xD00000000000001BLL, 0x8000000100023DA0, 204);
  sub_10000A900();

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  os_log_type_t v6;
  _TtC4Trip9TripModel *v7;

  v5 = a3;
  v7 = self;
  v6 = static os_log_type_t.debug.getter(v7);
  sub_1000191DC(v6, 0xD00000000000002ELL, 0x8000000100023D70, 0xD000000000000022, 0x8000000100023D40, 209);
  sub_10000A900();

}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC4Trip9TripModel *v13;
  os_log_type_t v14;
  uint64_t v15;

  v7 = sub_1000064D4(&qword_100033098);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E6C(0, &qword_100033150, NSUnitLength_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  v14 = static os_log_type_t.info.getter(v13);
  sub_1000191DC(v14, 0xD000000000000035, 0x8000000100023D00, 0xD00000000000002ELL, 0x8000000100023CD0, 222);
  sub_10000ACD8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC4Trip9TripModel *v13;
  os_log_type_t v14;
  uint64_t v15;

  v7 = sub_1000064D4(&qword_100033098);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E6C(0, &qword_100033150, NSUnitLength_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  v14 = static os_log_type_t.info.getter(v13);
  sub_1000191DC(v14, 0xD000000000000038, 0x8000000100023C90, 0xD000000000000031, 0x8000000100023C50, 227);
  sub_10000ACD8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fuelConsumptionService:(id)a3 didUpdateFuelEfficiency:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC4Trip9TripModel *v13;
  os_log_type_t v14;
  uint64_t v15;

  v7 = sub_1000064D4(&qword_1000330B0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E6C(0, &qword_1000330B8, NSUnitFuelEfficiency_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  v14 = static os_log_type_t.info.getter(v13);
  sub_1000191DC(v14, 0xD000000000000039, 0x8000000100023C10, 0xD000000000000032, 0x8000000100023BD0, 234);
  sub_10000ACD8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC4Trip9TripModel)init
{
  _TtC4Trip9TripModel *result;

  result = (_TtC4Trip9TripModel *)_swift_stdlib_reportUnimplementedInitializer("Trip.TripModel", 14, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

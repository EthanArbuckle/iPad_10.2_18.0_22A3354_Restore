@implementation ChargeModel

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  os_log_type_t v5;
  _TtC6Charge11ChargeModel *v6;

  v4 = a3;
  v6 = self;
  v5 = static os_log_type_t.debug.getter(v6);
  sub_100009618(v5, 0xD000000000000020, 0x80000001000183C0, 0xD00000000000001BLL, 0x80000001000183F0, 50);
  sub_100014F7C();

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC6Charge11ChargeModel *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_100016334(v4);

}

- (void)chargingStatusService:(id)a3 didUpdateCableState:(unsigned __int8)a4
{
  id v5;
  _TtC6Charge11ChargeModel *v6;

  v5 = a3;
  v6 = self;
  sub_1000155AC();

}

- (void)chargingTimeService:(id)a3 didUpdateRemainingTime:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = sub_100007984(&qword_100026AD8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100007D84(0, &qword_100027B00, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)chargingRateService:(id)a3 didUpdatePower:(id)a4
{
  sub_100015388(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_100027AC8, &qword_100027AD8, NSUnitPower_ptr);
}

- (void)chargingRateService:(id)a3 didUpdateChargingSpeed:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = sub_100007984(&qword_100027AE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v8 = sub_100007D84(0, (unint64_t *)&unk_100027AF0, NSUnitSpeed_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
    v9 = sub_100007984(&qword_100027AE8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    v10 = sub_100007984(&qword_100027AE8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  sub_1000162F4((uint64_t)v7);
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4
{
  sub_100015388(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_100027AC0, &qword_100027AD0, NSUnitLength_ptr);
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4
{
  sub_100015388(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_100027AC0, &qword_100027AD0, NSUnitLength_ptr);
}

- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4
{
  id v5;
  _TtC6Charge11ChargeModel *v6;

  v5 = a3;
  v6 = self;
  sub_100015734();

}

- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4
{
  id v6;
  id v7;
  _TtC6Charge11ChargeModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100015734();

}

- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for Locale(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC6Charge11ChargeModel)init
{
  _TtC6Charge11ChargeModel *result;

  result = (_TtC6Charge11ChargeModel *)_swift_stdlib_reportUnimplementedInitializer("Charge.ChargeModel", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC6Charge11ChargeModel__isCharging;
  v4 = sub_100007984(&qword_100027B08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6Charge11ChargeModel__supplementaryStatusText;
  v6 = sub_100007984(&qword_100027B10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end

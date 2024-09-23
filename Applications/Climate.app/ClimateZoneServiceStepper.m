@implementation ClimateZoneServiceStepper

- (CAFTemperature)temperature
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate25ClimateZoneServiceStepper_temperature);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC7Climate25ClimateZoneServiceStepper_temperature, v4, 0, 0);
  return (CAFTemperature *)*v2;
}

- (void)setTemperature:(id)a3
{
  _TtC7Climate25ClimateZoneServiceStepper *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100012290(v5);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateZoneServiceStepper_temperature));
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = sub_100006058(&qword_1000B78D0);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = sub_100006058((uint64_t *)&unk_1000B75B0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_100006058((uint64_t *)&unk_1000B75B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_10000D068((uint64_t)v7);
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = sub_100006058((uint64_t *)&unk_1000B75B0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

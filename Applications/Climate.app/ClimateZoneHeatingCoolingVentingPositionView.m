@implementation ClimateZoneHeatingCoolingVentingPositionView

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  id v6;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_seatView));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images);
  v5 = *(void **)&self->super.activeZoneTracker[OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images];
  v6 = (id)*((_QWORD *)v3 + 2);

}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView *v12;
  uint64_t v13;

  v7 = sub_100006058((uint64_t *)&unk_1000B75B0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100056714();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView *v13;
  uint64_t v14;

  v7 = sub_100006058(&qword_1000B78D0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = sub_100006058((uint64_t *)&unk_1000B75B0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_100006058((uint64_t *)&unk_1000B75B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  sub_100056714();

  sub_10000D068((uint64_t)v9);
}

- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView *v6;

  v5 = a3;
  v6 = self;
  sub_100056714();

}

- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5;
  _TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView *v6;

  v5 = a3;
  v6 = self;
  sub_100056714();

}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5;
  _TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView *v6;

  v5 = a3;
  v6 = self;
  sub_100056714();

}

@end

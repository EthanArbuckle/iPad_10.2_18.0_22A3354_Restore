@implementation ClimateZoneTargetTemperatureStepper

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Climate35ClimateZoneTargetTemperatureStepper *v12;
  uint64_t v13;

  v7 = sub_100006058((uint64_t *)&unk_1000B75B0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10001D0EC((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  char *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ClimateZoneTargetTemperatureStepper(0);
  v7 = (char *)v12.receiver;
  v8 = a4;
  v9 = -[ClimateZoneTargetTemperatureStepper hitTest:withEvent:](&v12, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {
    v10 = *(void **)&v7[OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_temperatureButton];
    objc_msgSend(v10, "frame", v12.receiver, v12.super_class);
    v13.x = x;
    v13.y = y;
    if (CGRectContainsPoint(v14, v13))
      v9 = v10;
    else
      v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_currentValue;
  v4 = sub_100006058((uint64_t *)&unk_1000B75B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_temperatureButton));
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6;
  id v7;
  _TtC7Climate35ClimateZoneTargetTemperatureStepper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10001DF40((uint64_t)v7);

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

@end

@implementation ClimateTemperatureIndicator

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateTemperatureIndicator(0);
  return -[ClimateTemperatureIndicator isEnabled](&v3, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  if (*((_BYTE *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_style))
  {
    v3 = a3;
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for ClimateTemperatureIndicator(0);
    -[ClimateTemperatureIndicator setEnabled:](&v4, "setEnabled:", v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC7Climate27ClimateTemperatureIndicator *v5;

  v4 = a3;
  v5 = self;
  sub_10006F9D4();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_temperature));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_upArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_downArrow));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_cancellables));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_currentValue;
  v4 = sub_100006058((uint64_t *)&unk_1000B75B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC7Climate27ClimateTemperatureIndicator *v15;
  uint64_t v16;

  v7 = sub_100006058(&qword_1000B78D0);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006058((uint64_t *)&unk_1000B75B0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  sub_10006D9B4();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  sub_10006D7A8((uint64_t)v9);
  sub_100008B88((uint64_t)v9, &qword_1000B78D0);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC7Climate27ClimateTemperatureIndicator *v13;
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
  sub_10006D9B4();

  sub_100008B88((uint64_t)v9, &qword_1000B78D0);
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6;
  id v7;
  _TtC7Climate27ClimateTemperatureIndicator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10006D9B4();

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
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

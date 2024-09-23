@implementation ClimateTargetTemperatureZoneSelectionButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton();
  return -[ClimateButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton();
  v4 = v6.receiver;
  -[ClimateButton setHighlighted:](&v6, "setHighlighted:", v3);
  v5 = 0.2;
  if (!v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted])
    v5 = 1.0;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_labelsView], "setAlpha:", v5, v6.receiver, v6.super_class);

}

- (_TtC7Climate43ClimateTargetTemperatureZoneSelectionButton)init
{
  uint64_t v3;
  _TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *result;

  v3 = OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_unselectedBackgroundView;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)objc_msgSend((id)objc_opt_self(MTMaterialView), "materialViewWithRecipe:", 21);
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_isOn) = 0;

  result = (_TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateTargetTemperatureZoneSelectionButton.swift", 57, 2, 91, 0);
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_unselectedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_temperature));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_labelsView));
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *v12;
  uint64_t v13;

  v7 = sub_100006058((uint64_t *)&unk_1000B75B0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B04(0, &qword_1000B7CE0, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10000BE7C();

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
  _TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *v13;
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
  sub_10000BE7C();

  sub_10000D068((uint64_t)v9);
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *v6;

  v5 = a3;
  v6 = self;
  sub_10000BE7C();

}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6;
  id v7;
  _TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000BE7C();

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

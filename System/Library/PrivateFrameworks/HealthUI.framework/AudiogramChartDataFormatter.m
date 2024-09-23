@implementation AudiogramChartDataFormatter

- (_TtC8HealthUI27AudiogramChartDataFormatter)init
{
  _TtC8HealthUI27AudiogramChartDataFormatter *result;

  sub_1D7B4A7DC();
  swift_bridgeObjectRelease();
  result = (_TtC8HealthUI27AudiogramChartDataFormatter *)sub_1D7B4A890();
  __break(1u);
  return result;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6;
  id v7;
  _TtC8HealthUI27AudiogramChartDataFormatter *v8;
  HKUnitPreferenceController *v9;
  HKUnitPreferenceController *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[HKInteractiveChartDataFormatter unitController](v8, sel_unitController);
  if (v9)
  {
    v10 = v9;
    v11 = -[HKUnitPreferenceController localizedDisplayNameForUnit:value:](v9, sel_localizedDisplayNameForUnit_value_, v6, v7);

    sub_1D7B4A3BC();
  }
  else
  {

  }
  v12 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4;
  _TtC8HealthUI27AudiogramChartDataFormatter *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_doubleValue);
  v7 = HKRoundWithPositiveZeroForDoubleValue(v6);
  sub_1D7ADC2F0();
  v8 = swift_allocObject();
  v9 = MEMORY[0x1E0DEB070];
  *(_OWORD *)(v8 + 16) = xmmword_1D7B84630;
  v10 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = v10;
  *(double *)(v8 + 32) = v7;
  sub_1D7B4A3C8();

  v11 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  return v11;
}

@end

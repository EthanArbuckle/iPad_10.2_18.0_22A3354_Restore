@implementation HeightPickerItem

- (_TtC16HealthMobilityUI16HeightPickerItem)init
{
  _TtC16HealthMobilityUI16HeightPickerItem *result;

  result = (_TtC16HealthMobilityUI16HeightPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D77C564C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter);
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  id v4;
  _TtC16HealthMobilityUI16HeightPickerItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1D77D54AC();

  if ((self & 1) != 0)
    return 2;
  else
    return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6;
  _TtC16HealthMobilityUI16HeightPickerItem *v7;
  char v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = self;
  v8 = sub_1D77D54AC();

  v9 = 246;
  if (a4)
    v9 = 0;
  v10 = 12;
  if (a4 != 1)
    v10 = 0;
  if (!a4)
    v10 = 9;
  if ((v8 & 1) != 0)
    return v10;
  else
    return v9;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  _TtC16HealthMobilityUI16HeightPickerItem *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = self;
  sub_1D77D60C4(a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC16HealthMobilityUI16HeightPickerItem *v8;

  v7 = a3;
  v8 = self;
  _s16HealthMobilityUI16HeightPickerItemC10pickerView_12didSelectRow11inComponentySo08UIPickerH0C_S2itF_0(v7, a4);

}

@end

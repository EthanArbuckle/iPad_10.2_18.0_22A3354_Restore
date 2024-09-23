@implementation HeightPickerItem

- (_TtC18HealthExperienceUI16HeightPickerItem)init
{
  _TtC18HealthExperienceUI16HeightPickerItem *result;

  result = (_TtC18HealthExperienceUI16HeightPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16HeightPickerItem_delegate);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16HeightPickerItem_valueFormatter);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI16HeightPickerItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A998D8E0();

  if ((self & 1) != 0)
    return 2;
  else
    return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6;
  _TtC18HealthExperienceUI16HeightPickerItem *v7;
  char v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = self;
  v8 = sub_1A998D8E0();

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
  _TtC18HealthExperienceUI16HeightPickerItem *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = self;
  sub_1A998E10C(a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1A9A9580C();
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
  _TtC18HealthExperienceUI16HeightPickerItem *v8;

  v7 = a3;
  v8 = self;
  _s18HealthExperienceUI16HeightPickerItemC10pickerView_12didSelectRow11inComponentySo08UIPickerH0C_S2itF_0(v7, a4);

}

@end

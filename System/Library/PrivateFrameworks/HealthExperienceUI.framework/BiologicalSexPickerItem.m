@implementation BiologicalSexPickerItem

- (_TtC18HealthExperienceUI23BiologicalSexPickerItem)init
{
  _TtC18HealthExperienceUI23BiologicalSexPickerItem *result;

  result = (_TtC18HealthExperienceUI23BiologicalSexPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23BiologicalSexPickerItem_delegate);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return 3;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  uint64_t v5;
  void *v6;

  sub_1A992B3D4(a4, a5);
  if (v5)
  {
    v6 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8;
  _TtC18HealthExperienceUI23BiologicalSexPickerItem *v9;

  v8 = a3;
  v9 = self;
  sub_1A992B4C4(a4, a5);

}

@end

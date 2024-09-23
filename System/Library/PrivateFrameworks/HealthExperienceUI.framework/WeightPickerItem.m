@implementation WeightPickerItem

- (_TtC18HealthExperienceUI16WeightPickerItem)init
{
  _TtC18HealthExperienceUI16WeightPickerItem *result;

  result = (_TtC18HealthExperienceUI16WeightPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem____lazy_storage___localeUnit));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem_delegate);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem_valueFormatter);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t result;
  id v6;
  _TtC18HealthExperienceUI16WeightPickerItem *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
    return 0;
  v6 = a3;
  v7 = self;
  sub_1A99DF480();
  v9 = v8;
  sub_1A99DF4A4();
  v11 = v10;

  v12 = v9 - v11;
  if (__OFSUB__(v9, v11))
  {
    __break(1u);
    goto LABEL_7;
  }
  result = v12 + 1;
  if (__OFADD__(v12, 1))
LABEL_7:
    __break(1u);
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  _TtC18HealthExperienceUI16WeightPickerItem *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = self;
  sub_1A99DFCD0(a4, a5);
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
  _TtC18HealthExperienceUI16WeightPickerItem *v8;

  v7 = a3;
  v8 = self;
  sub_1A99DFDB8(a4);

}

@end

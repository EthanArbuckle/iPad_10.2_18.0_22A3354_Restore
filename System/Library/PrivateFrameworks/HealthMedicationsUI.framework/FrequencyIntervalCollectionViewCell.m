@implementation FrequencyIntervalCollectionViewCell

- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell *)sub_1BC1F44B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s19HealthMedicationsUI35FrequencyIntervalCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___pickerView));
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5;
  _TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = *(_QWORD *)(sub_1BC243F64() + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  _TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell *v8;
  id result;
  void *v10;

  v7 = a3;
  v8 = self;
  result = (id)sub_1BC243F64();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*((_QWORD *)result + 2) > (unint64_t)a4)
  {
    swift_bridgeObjectRelease();
    sub_1BC243C38(0);

    v10 = (void *)sub_1BC2B4430();
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell *v8;

  v7 = a3;
  v8 = self;
  sub_1BC1F5700(a4);

}

@end

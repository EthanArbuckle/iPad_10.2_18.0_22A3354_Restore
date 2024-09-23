@implementation YearRangePickerCell

- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15HealthRecordsUI19YearRangePickerCell *)sub_1BC50637C(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC15HealthRecordsUI19YearRangePickerCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_baseAccessibilityIdentifier);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_pickerView;
  type metadata accessor for YearRangePickerView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC15HealthRecordsUI19YearRangePickerCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource);
  if (v4)
    return *(_QWORD *)(*(_QWORD *)(v4 + OBJC_IVAR____TtC15HealthRecordsUI25YearRangePickerDataSource_pickerRange) + 16);
  else
    return 0;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(char **)((char *)self + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource);
  if (!v5)
    return v5;
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC15HealthRecordsUI25YearRangePickerDataSource_pickerRange];
    if (*(_QWORD *)(v6 + 16) > (unint64_t)a4)
    {
      v7 = self;
      v8 = *(_QWORD *)(v6 + 8 * a4 + 32);
      v9 = a3;
      v10 = v7;
      swift_retain();
      sub_1BC4B264C(v8);

      swift_release();
      v5 = (char *)sub_1BC62C650();
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return self;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 30.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC15HealthRecordsUI19YearRangePickerCell *v8;

  v7 = a3;
  v8 = self;
  sub_1BC506A90((uint64_t)v7, a4);

}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_pickerView));
}

@end

@implementation YearRangePickerViewController

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC15HealthRecordsUI29YearRangePickerViewController *result;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_defaultCellIdentifier);
  *v5 = 1819043139;
  v5[1] = 0xE400000000000000;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = a3;

  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI29YearRangePickerViewController *v2;

  v2 = self;
  sub_1BC510514();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (*((_BYTE *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_selectedRow))
    return 3;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI29YearRangePickerViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC510784(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI29YearRangePickerViewController *v11;
  uint64_t v12;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  sub_1BC510D38(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI29YearRangePickerViewController *v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  uint64_t v16;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC62A94C();
  if (v12 > 1)
  {
    v14 = v12;

    if (v14 == 2)
      v13 = 150.0;
    else
      v13 = 0.0;
  }
  else
  {
    v13 = *MEMORY[0x1E0DC53D8];

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC15HealthRecordsUI29YearRangePickerViewController *result;

  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI29YearRangePickerViewController *result;

  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI29YearRangePickerViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_delegate);
}

@end

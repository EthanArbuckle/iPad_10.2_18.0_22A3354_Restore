@implementation AccountSelectionViewController

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC37FC8C();
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI30AccountSelectionViewController *v2;

  v2 = self;
  sub_1BC37DE40();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4;
  id v7;
  _TtC15HealthRecordsUI30AccountSelectionViewController *v8;
  int64_t v9;

  v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI30AccountSelectionViewController_allAccounts);
  if (!(v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  v9 = sub_1BC62D3B8();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI30AccountSelectionViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC37EBD0(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC15HealthRecordsUI30AccountSelectionViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1BC37FD70(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI30AccountSelectionViewController *v11;
  uint64_t v12;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  sub_1BC37F4EC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI30AccountSelectionViewController *result;

  result = (_TtC15HealthRecordsUI30AccountSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI30AccountSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI30AccountSelectionViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI30AccountSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI30AccountSelectionViewController_delegate);
}

@end

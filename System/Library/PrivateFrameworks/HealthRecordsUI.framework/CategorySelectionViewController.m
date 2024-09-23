@implementation CategorySelectionViewController

- (_TtC15HealthRecordsUI31CategorySelectionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI31CategorySelectionViewController *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC15HealthRecordsUI31CategorySelectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC15HealthRecordsUI31CategorySelectionViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI31CategorySelectionViewController *v2;

  v2 = self;
  sub_1BC358BDC();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31CategorySelectionViewController_allCategories))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI31CategorySelectionViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC358DB8(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC15HealthRecordsUI31CategorySelectionViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1BC359BC8(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI31CategorySelectionViewController *v11;
  uint64_t v12;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  sub_1BC359580(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC15HealthRecordsUI31CategorySelectionViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI31CategorySelectionViewController *result;

  result = (_TtC15HealthRecordsUI31CategorySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI31CategorySelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI31CategorySelectionViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI31CategorySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI31CategorySelectionViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

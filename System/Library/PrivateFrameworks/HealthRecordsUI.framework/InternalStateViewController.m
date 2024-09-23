@implementation InternalStateViewController

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI27InternalStateViewController *)sub_1BC3A499C(a3);
}

- (void)dealloc
{
  void *v2;
  _TtC15HealthRecordsUI27InternalStateViewController *v3;
  id v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_dataProvider);
  v3 = self;
  v4 = v2;
  sub_1BC4A22BC(0, 0);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for InternalStateViewController();
  -[InternalStateViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_dataProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_profile));
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI27InternalStateViewController *v2;

  v2 = self;
  sub_1BC3A4CE0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15HealthRecordsUI27InternalStateViewController *v4;

  v4 = self;
  sub_1BC3A4E14(a3);

}

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI27InternalStateViewController *result;

  result = (_TtC15HealthRecordsUI27InternalStateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI27InternalStateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI27InternalStateViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI27InternalStateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3;
  id v6;
  _TtC15HealthRecordsUI27InternalStateViewController *v7;
  int64_t v8;

  v3 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  v8 = sub_1BC62D3B8();

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC15HealthRecordsUI27InternalStateViewController *v10;
  unint64_t v11;
  int64_t v12;
  id v14;
  _TtC15HealthRecordsUI27InternalStateViewController *v15;

  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if ((v7 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      v8 = *(_QWORD *)(v7 + 8 * a4 + 32);
      v9 = a3;
      v10 = self;
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  v14 = a3;
  v15 = self;
  swift_bridgeObjectRetain();
  v8 = MEMORY[0x1BCCF24CC](a4, v7);
  swift_bridgeObjectRelease();
LABEL_5:
  v11 = *(_QWORD *)(v8 + 32);
  if (v11 >> 62)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    v12 = sub_1BC62D3B8();

    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_release();
LABEL_7:

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI27InternalStateViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  sub_1BC3A589C(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1BC62A970();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v6 = self;
  v7 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC15HealthRecordsUI27InternalStateViewController_sections);
  if ((v7 & 0xC000000000000001) != 0)
  {
    v11 = a3;
    v12 = v6;
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCF24CC](a4, v7);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v8 = a3;
    v9 = v6;
    swift_retain();
LABEL_5:
    swift_bridgeObjectRetain();

    swift_release();
    v10 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return self;
}

@end

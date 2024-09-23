@implementation OntologyInfoInternalViewController

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithCoder:(id)a3
{
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *result;

  result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[HKTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1BC19F744();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4;
  uint64_t v5;
  int64_t result;
  id v8;
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *v9;
  uint64_t v10;

  v4 = (*(_QWORD **)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC19HealthMedicationsUI34OntologyInfoInternalViewController_conceptsDataSource))[11];
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = v5 + 2;
    if (!__OFADD__(v5, 2))
      return result;
LABEL_6:
    __break(1u);
    return result;
  }
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain();
  v10 = sub_1BC2B52D0();

  swift_bridgeObjectRelease();
  result = v10 + 2;
  if (__OFADD__(v10, 2))
    goto LABEL_6;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BC2B2600();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B25D0();
  v10 = a3;
  v11 = self;
  v12 = (void *)OntologyInfoInternalViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *result;

  result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithStyle:(int64_t)a3
{
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *result;

  result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC19HealthMedicationsUI34OntologyInfoInternalViewController *result;

  v4 = a4;
  result = (_TtC19HealthMedicationsUI34OntologyInfoInternalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

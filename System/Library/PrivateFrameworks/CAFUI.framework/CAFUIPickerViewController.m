@implementation CAFUIPickerViewController

- (void)viewDidLoad
{
  _TtC5CAFUI25CAFUIPickerViewController *v2;

  v2 = self;
  CAFUIPickerViewController.viewDidLoad()();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC5CAFUI25CAFUIPickerViewController *v10;
  int64_t v11;

  v6 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC5CAFUI25CAFUIPickerViewController_representable);
  ObjectType = swift_getObjectType();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  v9 = a3;
  v10 = self;
  v11 = *(_QWORD *)(v8(ObjectType, v6) + 16);

  swift_bridgeObjectRelease();
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI25CAFUIPickerViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)CAFUIPickerViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5;
  _TtC5CAFUI25CAFUIPickerViewController *v6;
  double v7;

  v5 = a3;
  v6 = self;
  v7 = specialized CAFUIPickerViewController.tableView(_:heightForFooterInSection:)();

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5;
  _TtC5CAFUI25CAFUIPickerViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)specialized CAFUIPickerViewController.tableView(_:viewForFooterInSection:)(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI25CAFUIPickerViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFUIPickerViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end

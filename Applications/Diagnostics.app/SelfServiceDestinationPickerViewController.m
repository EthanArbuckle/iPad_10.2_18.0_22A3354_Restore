@implementation SelfServiceDestinationPickerViewController

- (void)viewDidLoad
{
  char *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  v2 = (char *)v5.receiver;
  -[SelfServiceDestinationPickerViewController viewDidLoad](&v5, "viewDidLoad");
  sub_1000CF828();
  v3 = objc_msgSend(v2, "contentView", v5.receiver, v5.super_class);
  objc_msgSend(v3, "addSubview:", *(_QWORD *)&v2[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView]);

  v4 = objc_msgSend(v2, "buttonTray");
  objc_msgSend(v4, "addButton:", *(_QWORD *)&v2[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_cancelButton]);

  sub_1000CFD80();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *v4;

  v4 = self;
  sub_1000CF554(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  v4 = (char *)v6.receiver;
  -[SelfServiceDestinationPickerViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager]
     + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate;
  *(_QWORD *)(v5 + 8) = 0;
  swift_unknownObjectWeakAssign(v5, 0);

}

- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *result;

  result = (_TtC11Diagnostics42SelfServiceDestinationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceDestinationPickerViewController", 54, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics42SelfServiceDestinationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceDestinationPickerViewController", 54, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  swift_bridgeObjectRelease(*(DARootViewController **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinations], v3, v4, v5, v6, v7, v8, v9);
  sub_100035D74(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler], *(_QWORD *)&self->suiteManager[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler]);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *v12;
  _BYTE *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000D0170(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000D1440();

  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(void *)a3 viewForHeaderInSection:
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = objc_allocWithZone((Class)UIView);
  v6 = a3;
  v7 = a1;
  v8 = objc_msgSend(v5, "init");
  v9 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 12.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics42SelfServiceDestinationPickerViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000D15E4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end

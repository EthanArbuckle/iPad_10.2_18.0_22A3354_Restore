@implementation BaseTableViewController

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseTableViewController();
  v2 = v4.receiver;
  v3 = -[BaseTableViewController viewDidLoad](&v4, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x50))(v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000035, 0x8000000100115E70, "Diagnostics/BaseTableViewController.swift", 41, 2, 28, 0);
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000042, 0x8000000100115E20, "Diagnostics/BaseTableViewController.swift", 41, 2, 32, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics23BaseTableViewController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseTableViewController();
  return -[BaseTableViewController initWithStyle:](&v5, "initWithStyle:", a3);
}

- (_TtC11Diagnostics23BaseTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DARootViewController *v6;
  DARootViewController *v7;
  id v8;
  NSString v9;
  SEL v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC11Diagnostics23BaseTableViewController *v18;
  objc_super v20;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = a4;
    v9 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for BaseTableViewController();
  v18 = -[BaseTableViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", v9, a4);

  return v18;
}

- (_TtC11Diagnostics23BaseTableViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseTableViewController();
  return -[BaseTableViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end

@implementation SelfServiceBaseNavigationController

- (void)viewDidLoad
{
  id v2;
  id v3;
  Class v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  v2 = v5.receiver;
  -[SelfServiceBaseNavigationController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationItem", v5.receiver, v5.super_class);
  v4 = sub_1000D3268();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  DARootViewController *v10;
  DARootViewController *v11;
  DARootViewController *v12;
  DARootViewController *v13;
  uint64_t v14;
  DARootViewController *v15;
  DARootViewController *v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC11Diagnostics35SelfServiceBaseNavigationController *)sub_1000D3B44(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC11Diagnostics35SelfServiceBaseNavigationController *)sub_1000D3B44(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  DARootViewController *v10;
  DARootViewController *v11;
  void *v12;
  id v13;
  NSString v14;
  SEL v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSString v22;
  SEL v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _TtC11Diagnostics35SelfServiceBaseNavigationController *v30;
  objc_super v32;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  v13 = a5;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11, v15, v16, v17, v18, v19, v20, v21);
  if (a4)
  {
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease((DARootViewController *)a4, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    v22 = 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  v30 = -[SelfServiceBaseNavigationController initWithTitle:detailText:icon:contentLayout:](&v32, "initWithTitle:detailText:icon:contentLayout:", v14, v22, v13, a6);

  return v30;
}

@end

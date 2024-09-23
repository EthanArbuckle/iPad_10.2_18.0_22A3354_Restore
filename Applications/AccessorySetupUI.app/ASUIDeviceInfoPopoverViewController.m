@implementation ASUIDeviceInfoPopoverViewController

- (void)viewDidLoad
{
  _TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *v2;

  v2 = self;
  sub_100027288();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
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
  _TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000279D4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *v11;
  _TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *v12;
  Class isa;
  _TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)-[ASUIDeviceInfoPopoverViewController cellForRowAtIndexPath:](v11, "cellForRowAtIndexPath:", isa);

  if (v14)
  {
    -[ASUIDeviceInfoPopoverViewController setSelected:animated:](v14, "setSelected:animated:", 0, 1);

    v11 = v12;
    v12 = v14;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)sub_1000276B8(v5, v7, a4);
}

- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithCoder:(id)a3
{
  return (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)sub_100027818(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->device[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_idKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->device[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_otaKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->device[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_typeKey]);
}

@end

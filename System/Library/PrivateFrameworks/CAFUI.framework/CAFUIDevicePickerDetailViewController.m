@implementation CAFUIDevicePickerDetailViewController

- (void)dealloc
{
  void *v3;
  _TtC5CAFUI37CAFUIDevicePickerDetailViewController *v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (void *)MEMORY[0x23B812F68](v6);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_removeObserver_, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailViewController();
  -[CAFUIDevicePickerDetailViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_device));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_pairedDevices));
  swift_bridgeObjectRelease();
  outlined destroy of weak CAFUIAutomakerSettingObserverDelegate?((uint64_t)self + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_limitedUIView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_carSession));
}

- (void)viewDidLoad
{
  _TtC5CAFUI37CAFUIDevicePickerDetailViewController *v2;

  v2 = self;
  CAFUIDevicePickerDetailViewController.viewDidLoad()();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_actions))[2];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI37CAFUIDevicePickerDetailViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)CAFUIDevicePickerDetailViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  @objc CAFUIDevicePickerDetailViewController.tableView(_:didUnhighlightRowAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))CAFUIDevicePickerDetailViewController.tableView(_:didUnhighlightRowAt:));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  @objc CAFUIDevicePickerDetailViewController.tableView(_:didUnhighlightRowAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))CAFUIDevicePickerDetailViewController.tableView(_:didSelectRowAt:));
}

@end

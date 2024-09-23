@implementation DeviceSelector

- (void)viewDidLoad
{
  _TtC11Diagnostics14DeviceSelector *v2;

  v2 = self;
  sub_1000BDA98();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC11Diagnostics14DeviceSelector *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics14DeviceSelector *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000BF5CC(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)cancelConsent
{
  _TtC11Diagnostics14DeviceSelector *v2;

  v2 = self;
  sub_1000BF860();

}

- (_TtC11Diagnostics14DeviceSelector)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
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
  return (_TtC11Diagnostics14DeviceSelector *)sub_1000C00CC(v5, v7, a4);
}

- (_TtC11Diagnostics14DeviceSelector)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics14DeviceSelector *)sub_1000C02B8(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_platformsFromQueue));
}

@end

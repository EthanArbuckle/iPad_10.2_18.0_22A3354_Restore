@implementation SuiteManager

- (DADeviceState)deviceState
{
  return (DADeviceState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState));
}

- (void)setDeviceState:(id)a3
{
  _TtC11Diagnostics12SuiteManager *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100073334(a3);

}

- (_TtC11Diagnostics12SuiteManager)init
{
  return (_TtC11Diagnostics12SuiteManager *)sub_10006E6A8();
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

  sub_10004F028((uint64_t)self + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceManager));

  swift_bridgeObjectRelease(*(DARootViewController **)&self->delegate[OBJC_IVAR____TtC11Diagnostics12SuiteManager_diagnosticEventID], v3, v4, v5, v6, v7, v8, v9);
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
  _TtC11Diagnostics12SuiteManager *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100070A58(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC11Diagnostics12SuiteManager *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100073410();

  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  id v7;
  _TtC11Diagnostics12SuiteManager *v8;
  id v9;
  id v10;

  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "init");
  v10 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v9, "setBackgroundColor:", v10);

  return v9;
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
  _TtC11Diagnostics12SuiteManager *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100073570();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end

@implementation ASUIServerManager

- (_TtC16AccessorySetupUI17ASUIServerManager)init
{
  _TtC16AccessorySetupUI17ASUIServerManager *result;

  sub_100031EFC((uint64_t)self, (uint64_t)a2);
  return result;
}

- (void)dealloc
{
  _TtC16AccessorySetupUI17ASUIServerManager *v2;
  uint64_t v3;

  v2 = self;
  sub_100032378((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_router));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC16AccessorySetupUI17ASUIServerManager *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_1000365D0(v9);

  swift_unknownObjectRelease(a5);
}

- (void)failAccessory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16AccessorySetupUI17ASUIServerManager *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_1000332A0(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)updateMigrationDisplayCount:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI17ASUIServerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000343A8(v4);

}

- (void)showPickerWithOverrideBundleID:(id)a3 shouldRetrieveDisplayItems:(id)a4 needsBluetooth:(id)a5 needsWiFi:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC16AccessorySetupUI17ASUIServerManager *v16;

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  sub_100034550(v10, v12, v13, v14, v15);

  swift_bridgeObjectRelease(v12);
}

- (void)showMigrationPickerWithOverrideBundleID:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC16AccessorySetupUI17ASUIServerManager *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_100035020(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)renameAccessory:(id)a3 currentName:(id)a4 updateSSID:(id)a5 overrideBundleID:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _TtC16AccessorySetupUI17ASUIServerManager *v19;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  if (a6)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v17;
  }
  else
  {
    v16 = 0;
  }
  v18 = a5;
  v19 = self;
  sub_100035B40(v10, v12, v13, v15, v18, v16, (unint64_t)a6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(a6);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI17ASUIServerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000361E8(v4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI17ASUIServerManager *v5;

  v4 = a3;
  v5 = self;
  sub_100036958();

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC16AccessorySetupUI17ASUIServerManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100036A70((uint64_t)a4);

}

@end

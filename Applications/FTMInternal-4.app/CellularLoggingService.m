@implementation CellularLoggingService

- (_TtC13FTMInternal_422CellularLoggingService)init
{
  return (_TtC13FTMInternal_422CellularLoggingService *)sub_1001E1668();
}

- (void)dealloc
{
  void *v3;
  _TtC13FTMInternal_422CellularLoggingService *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  objc_super v9;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(UIApplicationWillTerminateNotification);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "removeObserver:", v8);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for CellularLoggingService();
  -[CellularLoggingService dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{

  sub_10014C77C((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
}

- (void)didCollectLogs:(id)a3 errorCode:(id)a4
{
  _QWORD *v6;
  id v7;
  _TtC13FTMInternal_422CellularLoggingService *v8;

  if (a3)
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  else
    v6 = 0;
  v7 = a4;
  v8 = self;
  sub_1001E1B04(v6, (uint64_t)a4);

  swift_bridgeObjectRelease(v6);
}

- (void)didStateChanged:(int64_t)a3 errorCode:(id)a4 config:(id)a5
{
  id v9;
  _TtC13FTMInternal_422CellularLoggingService *v10;
  uint64_t v11;
  id v12;

  v9 = a5;
  v10 = self;
  v12 = a4;
  sub_1001E20A0(a3, (uint64_t)a4, a5, v11);

}

- (void)configurationListAvailable:(id)a3
{
  _QWORD *v4;
  _TtC13FTMInternal_422CellularLoggingService *v5;

  if (a3)
    v4 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  else
    v4 = 0;
  v5 = self;
  sub_1001E2534(v4);

  swift_bridgeObjectRelease(v4);
}

@end

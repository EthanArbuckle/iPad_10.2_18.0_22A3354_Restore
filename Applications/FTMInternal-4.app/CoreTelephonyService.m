@implementation CoreTelephonyService

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC13FTMInternal_420CoreTelephonyService *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(UIApplicationDidBecomeActiveNotification);
  v8 = v7;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v6, "removeObserver:", v9);

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[CoreTelephonyService dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_420CoreTelephonyService_hManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_420CoreTelephonyService_carrierInfoArray));
}

- (_TtC13FTMInternal_420CoreTelephonyService)init
{
  _TtC13FTMInternal_420CoreTelephonyService *result;

  result = (_TtC13FTMInternal_420CoreTelephonyService *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.CoreTelephonyService", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _TtC13FTMInternal_420CoreTelephonyService *v10;

  v7 = a3;
  v8 = a4;
  v10 = self;
  sub_10017B064((uint64_t)a3, a4, (uint64_t)v10, v9);

}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  uint64_t v11;
  _TtC13FTMInternal_420CoreTelephonyService *v12;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v12 = self;
  sub_10017F41C((uint64_t)a3, v6, a5, v11);

}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC13FTMInternal_420CoreTelephonyService *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a4)
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_10017F5C0((uint64_t)v8, v9, v10, v11);

  swift_bridgeObjectRelease(v6);
}

@end

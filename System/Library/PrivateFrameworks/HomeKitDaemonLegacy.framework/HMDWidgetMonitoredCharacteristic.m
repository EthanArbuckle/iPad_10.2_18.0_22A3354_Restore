@implementation HMDWidgetMonitoredCharacteristic

- (HMDCharacteristic)characteristic
{
  return (HMDCharacteristic *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic));
}

- (BOOL)reachabilityMonitored
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_reachabilityMonitored);
}

- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)initWithCharacteristic:(id)a3 reachabilityMonitored:(BOOL)a4
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic) = (Class)a3;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_reachabilityMonitored) = a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HMDWidgetMonitoredCharacteristic();
  v5 = a3;
  return -[HMDWidgetMonitoredCharacteristic init](&v7, sel_init);
}

- (int64_t)hash
{
  _TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1CDAB864C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *v4;
  _TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CDAB8688();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = HMDWidgetMonitoredCharacteristic.isEqual(_:)((uint64_t)v8);

  sub_1CD0CAA7C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)init
{
  _TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *result;

  result = (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic));
}

@end

@implementation ASUIPickingSession

- (_TtC16AccessorySetupUI18ASUIPickingSession)init
{
  return (_TtC16AccessorySetupUI18ASUIPickingSession *)sub_10000A4D4((uint64_t)self, (uint64_t)a2);
}

- (void)dealloc
{
  _TtC16AccessorySetupUI18ASUIPickingSession *v2;
  uint64_t v3;

  v2 = self;
  sub_10000B8A0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery));

  swift_bridgeObjectRelease(*(_QWORD *)&self->discovery[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap));
  swift_bridgeObjectRelease(*(_QWORD *)&self->discovery[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID]);
  sub_10000A0F8((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_delegate, v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_cancellable));
}

@end

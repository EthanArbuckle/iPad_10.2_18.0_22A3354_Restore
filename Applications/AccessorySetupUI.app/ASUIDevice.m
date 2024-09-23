@implementation ASUIDevice

- (NSString)description
{
  _TtC16AccessorySetupUI10ASUIDevice *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100028934();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC16AccessorySetupUI10ASUIDevice)init
{
  _TtC16AccessorySetupUI10ASUIDevice *result;

  result = (_TtC16AccessorySetupUI10ASUIDevice *)_swift_stdlib_reportUnimplementedInitializer("AccessorySetupUI.ASUIDevice", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->allowsRename[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->allowsRename[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_appBundleID]);
}

@end

@implementation ASUIClientModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->appBundleID[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appBundleID[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItemsPublisher));

}

- (_TtC16AccessorySetupUI15ASUIClientModel)init
{
  _TtC16AccessorySetupUI15ASUIClientModel *result;

  result = (_TtC16AccessorySetupUI15ASUIClientModel *)_swift_stdlib_reportUnimplementedInitializer("AccessorySetupUI.ASUIClientModel", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

@implementation FMLostDeviceCardViewController

- (_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC21FindMyRemoteUIService30FMLostDeviceCardViewController *result;

  v3 = a3;
  result = (_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMyRemoteUIService.FMLostDeviceCardViewController", 52, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo
                                    + 16];
  swift_bridgeObjectRelease(*(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo]);
  swift_bridgeObjectRelease(v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end

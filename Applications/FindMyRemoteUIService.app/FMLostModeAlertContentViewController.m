@implementation FMLostModeAlertContentViewController

- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  _TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo;
  *(_OWORD *)v4 = xmmword_10000D710;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 2;
  v6 = a3;

  result = (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010000CD50, "FindMyRemoteUIService/FMLostModeAlertContentViewController.swift", 64, 2, 50, 0);
  __break(1u);
  return result;
}

- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *result;

  v4 = a4;
  result = (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMyRemoteUIService.FMLostModeAlertContentViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  sub_100008058(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo), *(_QWORD *)&self->super.context[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo], *(_QWORD *)&self->super.proxCardNavigationController[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo], *(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo]);
  v3 = *(_QWORD *)&self->super.context[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies];
  v4 = *(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies];
  swift_release(*(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                                             + 16]);
  swift_release(v4);
  swift_release(v3);
  sub_100007A20(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state), *(_QWORD *)&self->super.context[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state], *(_QWORD *)&self->super.proxCardNavigationController[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state], *(_QWORD *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state], self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 8]);
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

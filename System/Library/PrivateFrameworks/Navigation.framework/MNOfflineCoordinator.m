@implementation MNOfflineCoordinator

- (_TtC10Navigation20MNOfflineCoordinator)initWithNavigationSessionState:(id)a3
{
  return (_TtC10Navigation20MNOfflineCoordinator *)MNOfflineCoordinator.init(navigationSessionState:)(a3);
}

- (_TtP10Navigation28MNOfflineCoordinatorDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  return (_TtP10Navigation28MNOfflineCoordinatorDelegate_ *)(id)MEMORY[0x1B5E0E820](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)start
{
  _TtC10Navigation20MNOfflineCoordinator *v2;

  v2 = self;
  sub_1B0ADB10C();

}

- (_TtC10Navigation20MNOfflineCoordinator)init
{
  _TtC10Navigation20MNOfflineCoordinator *result;

  result = (_TtC10Navigation20MNOfflineCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B0ADE754((uint64_t)self + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState));
}

- (MNNavigationSessionState)navigationSessionState
{
  MNNavigationSessionState *result;

  result = *(MNNavigationSessionState **)((char *)&self->super.isa
                                        + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (void)setNavigationSessionState:(id)a3
{
  NSObject *v4;
  _TtC10Navigation20MNOfflineCoordinator *v5;

  v4 = a3;
  v5 = self;
  MNOfflineCoordinator.navigationSessionState.setter(v4);

}

- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4
{
  __CFString *v4;
  id v6;
  _TtC10Navigation20MNOfflineCoordinator *v7;

  v4 = *(__CFString **)&a4.var0;
  v6 = a3;
  v7 = self;
  sub_1B0ADE3B8(v4);

}

- (void)stop
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;

  if (qword_1EEEC8910 != -1)
    swift_once();
  v0 = sub_1B0BCAA08();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEECB338);
  v1 = sub_1B0BCA9F0();
  v2 = sub_1B0BCAA80();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v1, v2, "Releasing control of offline service state.", v3, 2u);
    MEMORY[0x1B5E0E7D8](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_shared);
  objc_msgSend(v4, sel_setDelegate_, 0);
  objc_msgSend(v4, sel_shutdownService);

}

@end

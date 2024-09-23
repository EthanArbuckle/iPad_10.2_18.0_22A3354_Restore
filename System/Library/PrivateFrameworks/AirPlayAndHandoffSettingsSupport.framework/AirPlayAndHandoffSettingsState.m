@implementation AirPlayAndHandoffSettingsState

- (_TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState)init
{
  return (_TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState *)AirPlayAndHandoffSettingsState.init()();
}

- (void)transferToHomePodEnabledDidChange
{
  _TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState *v2;

  v2 = self;
  sub_235FD41D8();

}

- (void)profileNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState *v11;
  uint64_t v12;

  v4 = sub_235FD85C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FD85A8();
  v11 = self;
  sub_235FD4440((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture));
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v4 = sub_235FD87C4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

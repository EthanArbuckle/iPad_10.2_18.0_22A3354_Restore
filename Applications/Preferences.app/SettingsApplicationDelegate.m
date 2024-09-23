@implementation SettingsApplicationDelegate

- (void)dealloc
{
  _TtC11SettingsApp27SettingsApplicationDelegate *v2;

  v2 = self;
  sub_10008188C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11SettingsApp27SettingsApplicationDelegate_observationTokens));
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp27SettingsApplicationDelegate___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11SettingsApp27SettingsApplicationDelegate *v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v12);

  v14 = type metadata accessor for SettingsAppSceneDelegate(0);
  objc_msgSend(v13, "setDelegateClass:", swift_getObjCClassFromMetadata(v14));

  return v13;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC11SettingsApp27SettingsApplicationDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100082660();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_100082174();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (_TtC11SettingsApp27SettingsApplicationDelegate)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp27SettingsApplicationDelegate_observationTokens) = (Class)_swiftEmptyArrayStorage;
  ObservationRegistrar.init()(self);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SettingsApplicationDelegate(0);
  return -[SettingsApplicationDelegate init](&v4, "init");
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000820A0(self, (uint64_t)a2, a3, (uint64_t)a4);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000820A0(self, (uint64_t)a2, a3, (uint64_t)a4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000820A0(self, (uint64_t)a2, a3, (uint64_t)a4);
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000820A0(self, (uint64_t)a2, a3, (uint64_t)a4);
}

@end

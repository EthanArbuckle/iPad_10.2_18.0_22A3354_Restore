@implementation SettingsWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12AutoSettings27SettingsWindowSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000A1E8(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC12AutoSettings27SettingsWindowSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000A7B8(v4);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC12AutoSettings27SettingsWindowSceneDelegate *v11;

  v7 = sub_100005904(0, &qword_1000281D8, UIOpenURLContext_ptr);
  v8 = sub_10000B0AC();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10000A9CC(v9);

  swift_bridgeObjectRelease(v9);
}

- (_TtC12AutoSettings27SettingsWindowSceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsWindowSceneDelegate();
  return -[SettingsWindowSceneDelegate init](&v3, "init");
}

- (void)sceneWillEnterForeground:(uint64_t)a1
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (qword_100027CD0 != -1)
    a1 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v1 = qword_100029050;
  v2 = static os_log_type_t.default.getter(a1);
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "AutoSettings scene will enter foreground", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }
  v4 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v5 = objc_msgSend(v4, "delegate");

  if (v5)
  {
    v6 = type metadata accessor for AppDelegate(0);
    v7 = *(void **)(swift_dynamicCastClassUnconditional(v5, v6, 0, 0, 0)
                  + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
    if (v7)
    {
      v8 = v7;
      sub_10000F8B0();
      swift_unknownObjectRelease(v5);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)sceneDidEnterBackground:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char *v12;
  char *v13;
  _BYTE v15[24];

  v0 = type metadata accessor for Date(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_100027CD0 != -1)
    v2 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v5 = qword_100029050;
  v6 = static os_log_type_t.default.getter(v2);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "AutoSettings scene did enter background", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }
  v8 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v9 = objc_msgSend(v8, "delegate");

  if (v9)
  {
    v10 = type metadata accessor for AppDelegate(0);
    v11 = *(void **)(swift_dynamicCastClassUnconditional(v9, v10, 0, 0, 0)
                   + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
    if (v11)
    {
      v12 = v11;
      Date.init()();
      v13 = &v12[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime];
      swift_beginAccess(&v12[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime], v15, 33, 0);
      (*(void (**)(char *, _BYTE *, uint64_t))(v1 + 40))(v13, v4, v0);
      swift_endAccess(v15);
      swift_unknownObjectRelease(v9);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end

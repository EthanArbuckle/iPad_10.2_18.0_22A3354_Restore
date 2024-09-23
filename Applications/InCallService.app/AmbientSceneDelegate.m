@implementation AmbientSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)sub_100166C48();
}

- (void)setWindow:(id)a3
{
  id v5;
  _TtC13InCallService20AmbientSceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_100166CBC((uint64_t)a3);

}

- (id)sceneDidDisconnectBlock
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;

  v2 = sub_100166D4C();
  if (!v2)
    return 0;
  v6[4] = v2;
  v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100112054;
  v6[3] = &unk_10028B630;
  v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setSceneDidDisconnectBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13InCallService20AmbientSceneDelegate *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_10028B618, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_100108BB8;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_100166E10((uint64_t)v4, v5);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13InCallService20AmbientSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100166E30(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13InCallService20AmbientSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100167458();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC13InCallService20AmbientSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1001675DC((uint64_t)v5, 1);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC13InCallService20AmbientSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1001675DC((uint64_t)v5, 0);

}

- (_TtC13InCallService20AmbientSceneDelegate)init
{
  return (_TtC13InCallService20AmbientSceneDelegate *)sub_1001676C8();
}

- (void).cxx_destruct
{

  sub_100158160(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13InCallService20AmbientSceneDelegate_sceneDidDisconnectBlock), *(_QWORD *)&self->window[OBJC_IVAR____TtC13InCallService20AmbientSceneDelegate_sceneDidDisconnectBlock]);
}

@end

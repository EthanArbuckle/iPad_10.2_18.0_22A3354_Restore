@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15AirPlayReceiver13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000EB8C(v8, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC15AirPlayReceiver13SceneDelegate *v11;

  v7 = sub_10000771C(0, &qword_10001E850, UIOpenURLContext_ptr);
  v8 = sub_10000FECC();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10000E95C(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC15AirPlayReceiver13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000F268();

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC15AirPlayReceiver13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000F6B4();

}

- (_TtC15AirPlayReceiver13SceneDelegate)init
{
  return (_TtC15AirPlayReceiver13SceneDelegate *)sub_10000CA08();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_windowScene[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier]);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeExpirationTimer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->_windowScene[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName]);
  sub_1000095E4((uint64_t)self + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken, (uint64_t *)&unk_10001E860);
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  _TtC15AirPlayReceiver13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000F91C();

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _TtC15AirPlayReceiver13SceneDelegate *v14;

  v6 = qword_10001DFE0;
  v7 = a3;
  v14 = self;
  v8 = a4;
  if (v6 != -1)
    swift_once(&qword_10001DFE0, sub_10001016C);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100007A78(v9, (uint64_t)qword_10001F7F0);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Runtime assertion did invalidate!", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

}

- (void)didStartStreamingWithRenderer:(id)a3
{
  id v4;
  _TtC15AirPlayReceiver13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000CEF0(v4);

}

- (void)didStopStreamingWithRenderer:(id)a3
{
  id v4;
  _TtC15AirPlayReceiver13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000FB18("didStopStreaming", (uint64_t)&unk_100019390, (uint64_t)sub_10000FC74, (uint64_t)&unk_1000193A8);

}

- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC15AirPlayReceiver13SceneDelegate *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  sub_10000D34C(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (void)shouldHideGlobalPasscode
{
  _TtC15AirPlayReceiver13SceneDelegate *v2;

  v2 = self;
  sub_10000FB18("shouldHideGlobalPasscode", (uint64_t)&unk_1000192A0, (uint64_t)sub_10000E8CC, (uint64_t)&unk_1000192B8);

}

- (void)shouldAskPermissionWithRequestID:(id)a3 forClientWithName:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _TtC15AirPlayReceiver13SceneDelegate *v18;
  __n128 v19;
  uint64_t v20;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = swift_allocObject(&unk_100019200, 24, 7);
  *(_QWORD *)(v17 + 16) = v13;
  v18 = self;
  sub_10000D9FC((uint64_t)v12, v14, v16, (uint64_t)sub_10000E750, v17);

  swift_bridgeObjectRelease(v16);
  v19 = swift_release(v17);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
}

- (void)shouldCancelPermissionRequestWithRequestID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC15AirPlayReceiver13SceneDelegate *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10000DF2C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

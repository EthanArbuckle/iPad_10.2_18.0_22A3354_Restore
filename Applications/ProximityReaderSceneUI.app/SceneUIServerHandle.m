@implementation SceneUIServerHandle

- (void)dealloc
{
  _TtC22ProximityReaderSceneUI19SceneUIServerHandle *v2;

  v2 = self;
  sub_1000066DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface));
}

- (void)activateRemoteUI:(id)a3 internalEndpoint:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC22ProximityReaderSceneUI19SceneUIServerHandle *v12;

  v8 = _Block_copy(a5);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = swift_allocObject(&unk_100014AE8, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a4;
  v12 = self;
  sub_1000068F4(v9, v11, (uint64_t)sub_100008B10, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)invalidateRemoteUI:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC22ProximityReaderSceneUI19SceneUIServerHandle *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100014AC0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10000748C((uint64_t)sub_100008A6C, v5);

  swift_release(v5);
}

- (void)deactivateRemoteUI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  _TtC22ProximityReaderSceneUI19SceneUIServerHandle *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = qword_100019DD0;
  v10 = self;
  if (v9 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v11 = sub_100004748(v5, (uint64_t)qword_10001ABA0);
  sub_100004760(v11, (uint64_t)v7);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_10000893C((uint64_t)v7, &qword_100019DE0);
  }
  else
  {
    sub_100008DC0((uint64_t)v10, 0xD000000000000016, 0x8000000100012BC0, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  _Block_release(v8);

}

- (_TtC22ProximityReaderSceneUI19SceneUIServerHandle)init
{
  _TtC22ProximityReaderSceneUI19SceneUIServerHandle *result;

  result = (_TtC22ProximityReaderSceneUI19SceneUIServerHandle *)_swift_stdlib_reportUnimplementedInitializer("ProximityReaderSceneUI.SceneUIServerHandle", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

@implementation SidecarDisplaySession

- (void)sidecarRequest:(id)a3 receivedItems:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC17ContinuityDisplay21SidecarDisplaySession *v10;

  sub_100018AA4(0, (unint64_t *)&unk_100077E40, SidecarItem_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  SidecarDisplaySession.sidecarRequest(_:receivedItems:)((uint64_t)v10, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)dealloc
{
  _TtC17ContinuityDisplay21SidecarDisplaySession *v2;

  v2 = self;
  SidecarDisplaySession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  sub_1000189E4((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_delegate, (uint64_t)a2);
  v3 = type metadata accessor for Logger(0);
  sub_100018DCC(v3);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_request);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_config);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_queue);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_negotiator);
  v4 = sub_100018F50();
  sub_100018DCC(v4);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoConfig);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_clock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_settings));
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_hidSidecarStream);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoSidecarStream);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoStream);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoClient);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoClientDelegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_configurationTimer));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC17ContinuityDisplay21SidecarDisplaySession *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC17ContinuityDisplay21SidecarDisplaySession *v19;
  _OWORD v20[2];

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v9;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v20, 0, sizeof(v20));
    v18 = a5;
    v19 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v11 = a5;
  v12 = self;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v14 = v13;
  sub_1000057B8(&qword_100077C70, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100058200);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15, v16);

LABEL_8:
  SidecarDisplaySession.observeValue(forKeyPath:of:change:context:)();

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v10);
  sub_10001893C((uint64_t)v20, (uint64_t *)&unk_100077B70);
}

- (_TtC17ContinuityDisplay21SidecarDisplaySession)init
{
  SidecarDisplaySession.init()();
}

@end

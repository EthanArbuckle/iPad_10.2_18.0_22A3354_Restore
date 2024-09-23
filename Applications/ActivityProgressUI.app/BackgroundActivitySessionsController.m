@implementation BackgroundActivitySessionsController

- (_TtC18ActivityProgressUI36BackgroundActivitySessionsController)init
{
  return (_TtC18ActivityProgressUI36BackgroundActivitySessionsController *)sub_100018DC4();
}

- (void)dealloc
{
  void *v2;
  objc_class *ObjectType;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v5;
  objc_super v6;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener);
  if (v2)
  {
    ObjectType = (objc_class *)swift_getObjectType(self);
    v5 = self;
    objc_msgSend(v2, "invalidate");
    v6.receiver = v5;
    v6.super_class = ObjectType;
    -[BackgroundActivitySessionsController dealloc](&v6, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient));
  v3 = (char *)self
     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__backgroundActivitySessionsByTaskID;
  v4 = sub_1000088F0((uint64_t *)&unk_10004FEB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__jindoSessionsByBundleID;
  v6 = sub_1000088F0(&qword_10004FEA8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_lockStateMonitor));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_pillController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_appIconProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue));
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 activityName:(id)a5 activityDescription:(id)a6 progress:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v25;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v26;
  uint64_t v27;

  v26 = self;
  v27 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v23 = v22;
  v24 = a7;
  v25 = v26;
  sub_10001A85C((uint64_t)v14, v15, v17, 0, 0, v18, v20, v21, v23, v24);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v23);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v27);
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v28;
  uint64_t v29;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v30;
  uint64_t v31;
  uint64_t v32;

  v30 = self;
  v14 = type metadata accessor for UUID(0);
  v31 = *(_QWORD *)(v14 - 8);
  v32 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  if (a5)
  {
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v20;
  }
  else
  {
    v19 = 0;
  }
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v23 = v22;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v26 = v25;
  v27 = a8;
  v28 = v30;
  sub_10001A85C((uint64_t)v16, v29, v18, v19, (uint64_t)a5, v21, v23, v24, v26, v27);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(a5);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v32);
}

- (void)updateProgress:(id)a3 forIdentifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10001B050(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateActivityName:(id)a3 activityDescription:(id)a4 forIdentifier:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v19;
  uint64_t v20;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = self;
  sub_10001C260(v13, v15, v16, v18, (uint64_t)v12);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC18ActivityProgressUI36BackgroundActivitySessionsController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100022844(v9);

  swift_unknownObjectRelease(a5);
}

@end

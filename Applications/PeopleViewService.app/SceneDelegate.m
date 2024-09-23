@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void (*v8)(char *, uint64_t);
  id v9;
  id v10;
  _TtC17PeopleViewService13SceneDelegate *v11;

  v8 = (void (*)(char *, uint64_t))a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000E84C(v8, v10);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC17PeopleViewService13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000EFAC();

}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v3;
  id v5;
  _TtC17PeopleViewService13SceneDelegate *v6;
  char v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v8 = v3;
    v7 = sub_100010524();
    sub_10000D6DC(v7);

  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC17PeopleViewService13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000F318(v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC17PeopleViewService13SceneDelegate *v11;

  v7 = sub_10000C374(0, &qword_100022820, UIOpenURLContext_ptr);
  v8 = sub_10000DA90();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10000DAE8(v9);

  swift_bridgeObjectRelease(v9);
}

- (_TtC17PeopleViewService13SceneDelegate)init
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _TtC17PeopleViewService13SceneDelegate *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window) = 0;
  v3 = OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController;
  v4 = type metadata accessor for RootContainerViewController();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v5, "init");
  *(Class *)((char *)&v6->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView) = 0;

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v8, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController));

}

- (uint64_t)sceneDidBecomeActive:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static PeopleLogger.viewService.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    v12 = sub_100014E0C(0xD000000000000018, 0x8000000100019D00, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s -- app reloading all widget timeline", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  type metadata accessor for WidgetCenter(0);
  v10 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  return swift_release(v10);
}

- (uint64_t)sceneWillResignActive:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static PeopleLogger.viewService.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_100014E0C(0xD000000000000019, 0x8000000100019CC0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

@end

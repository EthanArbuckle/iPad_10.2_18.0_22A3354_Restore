@implementation SetupCoordinator

- (_TtC22HomeCaptiveViewService16SetupCoordinator)init
{
  _TtC22HomeCaptiveViewService16SetupCoordinator *result;

  result = (_TtC22HomeCaptiveViewService16SetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer("HomeCaptiveViewService.SetupCoordinator", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController, a2);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController, v3);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_device));
  sub_10000622C((uint64_t)self + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient));
}

- (void)proxCardFlowDidDismiss
{
  _TtC22HomeCaptiveViewService16SetupCoordinator *v2;

  v2 = self;
  sub_100009460();

}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  void *v4;
  _TtC22HomeCaptiveViewService16SetupCoordinator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000A5D4((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)handleDismissal
{
  _TtC22HomeCaptiveViewService16SetupCoordinator *v2;

  v2 = self;
  sub_10000966C();

}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
  sub_10000A818(a4);
}

- (void)proxCardFlowWillPresent
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *oslog;
  uint64_t v7;
  uint64_t v8;

  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100015ED0);
  oslog = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.info.getter(oslog, v2);
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v7 = sub_10000B218(0xD000000000000019, 0x800000010000C8F0, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "%s", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);

  }
  else
  {

  }
}

@end

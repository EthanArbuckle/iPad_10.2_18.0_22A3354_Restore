@implementation AudioPlaybackCommandHandler

- (_TtC7NewsUI227AudioPlaybackCommandHandler)init
{
  _TtC7NewsUI227AudioPlaybackCommandHandler *result;

  result = (_TtC7NewsUI227AudioPlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_audioPlaybackTracker);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_offlineAlertControllerFactory);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_commandCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_sceneProvider);
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result;
  id v6;
  char *v7;

  result = MEMORY[0x1D82919D4](&a1[OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_commandCenter]);
  if (result)
  {
    swift_getObjectType();
    v6 = a3;
    v7 = a1;
    sub_1D6E20624();
    sub_1D5E76DF0(0, (unint64_t *)&qword_1ED603D60, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0D5E400]);
    sub_1D6E1D924();

    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

@end

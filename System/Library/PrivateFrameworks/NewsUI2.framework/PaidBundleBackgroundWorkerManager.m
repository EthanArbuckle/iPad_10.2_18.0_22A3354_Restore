@implementation PaidBundleBackgroundWorkerManager

- (_TtC7NewsUI233PaidBundleBackgroundWorkerManager)init
{
  _TtC7NewsUI233PaidBundleBackgroundWorkerManager *result;

  result = (_TtC7NewsUI233PaidBundleBackgroundWorkerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI233PaidBundleBackgroundWorkerManager_backgroundFetchManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233PaidBundleBackgroundWorkerManager_workerFactory);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC7NewsUI233PaidBundleBackgroundWorkerManager *v6;

  v4 = qword_1ED5F9970;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  sub_1D6E27374();
  sub_1D6E1C61C();
  sub_1D60C3CB4();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC7NewsUI233PaidBundleBackgroundWorkerManager *v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = qword_1ED5F9970;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  sub_1D6E27374();
  v7 = MEMORY[0x1E0DEE9D8];
  sub_1D6E1C61C();
  v8 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC7NewsUI233PaidBundleBackgroundWorkerManager_registeredWorkers);
  swift_beginAccess();
  *v8 = v7;

  swift_bridgeObjectRelease();
}

@end

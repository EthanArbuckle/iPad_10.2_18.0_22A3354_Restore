@implementation NotificationService

- (_TtC7NewsUI219NotificationService)init
{
  _TtC7NewsUI219NotificationService *result;

  result = (_TtC7NewsUI219NotificationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D6B07570((uint64_t)self + OBJC_IVAR____TtC7NewsUI219NotificationService_warmingSheetPresenter);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219NotificationService_metricsProvider);
}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7NewsUI219NotificationService *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D6B06774(v8, (uint64_t)sub_1D6B07528, v7);

  swift_release();
}

@end

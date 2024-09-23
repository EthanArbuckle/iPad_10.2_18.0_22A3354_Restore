@implementation FMR1ProximityManagerSubscription

- (void)dealloc
{
  _TtC11FMFindingUI32FMR1ProximityManagerSubscription *v2;

  v2 = self;
  sub_23A99868C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_identifier;
  v4 = sub_23AA32E1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_subscriber);
  sub_23A963B3C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_findable);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_poseProvider));
}

- (_TtC11FMFindingUI32FMR1ProximityManagerSubscription)init
{
  _TtC11FMFindingUI32FMR1ProximityManagerSubscription *result;

  result = (_TtC11FMFindingUI32FMR1ProximityManagerSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

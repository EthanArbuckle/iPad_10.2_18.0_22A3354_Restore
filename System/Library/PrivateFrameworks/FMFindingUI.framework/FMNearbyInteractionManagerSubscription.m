@implementation FMNearbyInteractionManagerSubscription

- (void)dealloc
{
  _TtC11FMFindingUI38FMNearbyInteractionManagerSubscription *v2;

  v2 = self;
  sub_23A9886E4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_identifier;
  v4 = sub_23AA32E1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_subscriber);
  sub_23A963B3C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_findable);
  swift_unknownObjectWeakDestroy();
}

- (_TtC11FMFindingUI38FMNearbyInteractionManagerSubscription)init
{
  _TtC11FMFindingUI38FMNearbyInteractionManagerSubscription *result;

  result = (_TtC11FMFindingUI38FMNearbyInteractionManagerSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

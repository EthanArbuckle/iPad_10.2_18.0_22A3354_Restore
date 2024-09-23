@implementation FMFindingLocalizer

- (void)dealloc
{
  _TtC11FMFindingUI18FMFindingLocalizer *v2;

  v2 = self;
  sub_23A974700();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_nearbyInteractionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_proximityManagerSubscription));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_nearbyInteractionManagerSubscription));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A963AE0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement), *(_QWORD *)&self->findingTechnology[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement], *(void **)&self->localizer[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void **)&self->poseProvider[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->proximityManager[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->nearbyInteractionManager[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->proximityManagerSubscription[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->nearbyInteractionManagerSubscription[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement+ 6], *(_QWORD *)&self->preciseDistancesByUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->findableStatesByUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->productUUIDsByFindableUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_QWORD *)&self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_WORD *)&self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 14], self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 16]);

}

- (NSString)description
{
  _TtC11FMFindingUI18FMFindingLocalizer *v2;
  void *v3;

  v2 = self;
  sub_23A974A48();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI18FMFindingLocalizer)init
{
  _TtC11FMFindingUI18FMFindingLocalizer *result;

  result = (_TtC11FMFindingUI18FMFindingLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation FMProximityConnectionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMProximityConnectionManager_nearbyInteractionManager));
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI28FMProximityConnectionManager_delegate);
}

@end

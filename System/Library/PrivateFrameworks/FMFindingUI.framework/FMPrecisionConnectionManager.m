@implementation FMPrecisionConnectionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_nearbyInteractionManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_arSession));
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI28FMPrecisionConnectionManager_delegate);
}

@end

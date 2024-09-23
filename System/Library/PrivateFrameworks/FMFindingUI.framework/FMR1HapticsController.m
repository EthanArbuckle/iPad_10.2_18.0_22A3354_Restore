@implementation FMR1HapticsController

- (_TtC11FMFindingUI21FMR1HapticsController)init
{
  return (_TtC11FMFindingUI21FMR1HapticsController *)sub_23A9A1054();
}

- (void)dealloc
{
  _TtC11FMFindingUI21FMR1HapticsController *v2;

  v2 = self;
  sub_23A9A1508();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_23A9683BC((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_tapHapticContext, &qword_2569D6680);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTapSelectedHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap1HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap2HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap3HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap4HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap5HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_connectedHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_scatterHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_aheadOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_armsReachHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_armsReachOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_preNearbyHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_nearbyHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_levelIncreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_levelDecreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_farNearHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_continuousHapticPattern));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_continuousHapticRampingFactorSpring));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23A98C874(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_playedHapticPatternHandler));
}

- (NSString)description
{
  _TtC11FMFindingUI21FMR1HapticsController *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)hapticDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4;
  _TtC11FMFindingUI21FMR1HapticsController *v5;

  v4 = a3;
  v5 = self;
  sub_23A9A5AE0(v4);

}

@end

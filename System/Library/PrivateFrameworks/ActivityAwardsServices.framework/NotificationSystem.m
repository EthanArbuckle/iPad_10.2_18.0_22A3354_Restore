@implementation NotificationSystem

- (uint64_t)achievementStore:(char *)a1 didUpdateAchievements:
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  char *v5;

  sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
  sub_1D2A9D770();
  v2 = sub_1D2AB6820();
  v3 = *(_QWORD *)&a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_lock];
  v4 = *(os_unfair_lock_s **)(v3 + 16);
  swift_unknownObjectRetain();
  v5 = a1;
  os_unfair_lock_lock(v4);
  sub_1D2A99B3C(v5, v2);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

- (void)dealloc
{
  void *v3;
  _TtC22ActivityAwardsServices18NotificationSystem *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NotificationSystem();
  -[NotificationSystem dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_earnedKeyValueStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_fitnessAppsStateObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_healthStore));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationPostingProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationSuppresionProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pauseRingsCoordinator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_unearnedKeyValueStore));
  swift_release();
}

- (void)notificationSuppressionChanged
{
  _TtC22ActivityAwardsServices18NotificationSystem *v2;

  v2 = self;
  sub_1D2AA66A0();

}

- (_TtC22ActivityAwardsServices18NotificationSystem)init
{
  _TtC22ActivityAwardsServices18NotificationSystem *result;

  result = (_TtC22ActivityAwardsServices18NotificationSystem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation SportsOnboardingManager

- (void)appleAccountChanged
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC7NewsUI223SportsOnboardingManager *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void *, void (*)(), uint64_t, uint64_t, uint64_t);

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_sportsSyncManager);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F43C0);
  v6 = self;
  v7 = (void *)sub_1D6E27674();
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = *(void (**)(void *, void (*)(), uint64_t, uint64_t, uint64_t))(v5 + 8);
  swift_retain();
  v9(v7, sub_1D5FBDCF0, v8, v4, v5);

  swift_release_n();
}

- (void)dealloc
{
  _TtC7NewsUI223SportsOnboardingManager *v2;

  v2 = self;
  sub_1D634F9D4();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_sportsSyncManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_pushNotificationDataManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI223SportsOnboardingManager)init
{
  _TtC7NewsUI223SportsOnboardingManager *result;

  result = (_TtC7NewsUI223SportsOnboardingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)userInfoDidChangeSportsOnboardingState:(id)a3
{
  sub_1D63504EC((char *)self, (uint64_t)a2, a3, (uint64_t)sub_1D6350CAC);
}

- (void)userInfoDidChangeSportsSyncState:(id)a3
{
  sub_1D63504EC((char *)self, (uint64_t)a2, a3, (uint64_t)sub_1D6350C90);
}

@end

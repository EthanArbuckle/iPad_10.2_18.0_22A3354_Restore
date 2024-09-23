@implementation FollowingDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  void (*v5)(void);
  _TtC7NewsUI220FollowingDataManager *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_QWORD *)&self->subscriptionService[OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager), *(_QWORD *)&self->notificationPrompter[OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager]);
  v5 = *(void (**)(void))(v4 + 64);
  v6 = self;
  v5();

  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[FollowingDataManager dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_shortcutService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_editorialService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_tagReorderService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_followingBadgingCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_magazinesBadgingCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_puzzleBadgingCoordinator);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_shortcutsOnboardingManager);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_contentAvailabilityValidator);
}

- (_TtC7NewsUI220FollowingDataManager)init
{
  _TtC7NewsUI220FollowingDataManager *result;

  result = (_TtC7NewsUI220FollowingDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  char *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  id v11;
  _TtC7NewsUI220FollowingDataManager *v12;

  v7 = (char *)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 88);
    v10 = a3;
    v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

@end

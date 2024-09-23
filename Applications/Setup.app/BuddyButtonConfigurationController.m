@implementation BuddyButtonConfigurationController

- (_TtC5Setup34BuddyButtonConfigurationController)init
{
  uint64_t v3;
  id v4;
  _TtC5Setup34BuddyButtonConfigurationController *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_wrapper;
  v4 = objc_allocWithZone((Class)BuddyButtonConfigurationWrapper);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, "init");
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences) = 0;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager) = 0;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_delegate) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for BuddyButtonConfigurationController();
  return -[BuddyButtonConfigurationController init](&v7, "init");
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences));
}

- (void)setBuddyPreferences:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences) = (Class)a3;
  v3 = a3;

}

- (BFFSettingsManager)settingsManager
{
  return (BFFSettingsManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager));
}

- (void)setSettingsManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager) = (Class)a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)hasBlackBackground
{
  return 1;
}

- (id)viewController
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_wrapper), "viewController");
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_delegate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_delegate) = (Class)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5Setup34BuddyButtonConfigurationController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10027FED0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100023CC4((uint64_t)sub_1000241B8, v5);

  swift_release(v5);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_delegate));
}

@end

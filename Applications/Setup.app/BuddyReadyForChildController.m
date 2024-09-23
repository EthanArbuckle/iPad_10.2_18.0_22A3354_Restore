@implementation BuddyReadyForChildController

- (_TtC5Setup28BuddyReadyForChildController)init
{
  _TtC5Setup28BuddyReadyForChildController *result;

  sub_10001A88C();
  return result;
}

- (void)viewDidLoad
{
  _TtC5Setup28BuddyReadyForChildController *v2;

  v2 = self;
  sub_10001AAE4();

}

- (void)continueTapped
{
  _TtC5Setup28BuddyReadyForChildController *v2;

  v2 = self;
  sub_10001BDF4();

}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup];
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup] = a3;
  v3 = a3;

}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider] = a3;
  v3 = a3;

}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return (_TtP5Setup20LockdownModeProvider_ *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_lockdownModeProvider], a2);
}

- (void)setLockdownModeProvider:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_lockdownModeProvider];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_lockdownModeProvider] = a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod] = a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5Setup28BuddyReadyForChildController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10027FB58, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10001CBA0((uint64_t)sub_10001D334, v5);

  swift_release(v5);
}

- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup28BuddyReadyForChildController *result;

  result = (_TtC5Setup28BuddyReadyForChildController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyReadyForChildController", 34, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup28BuddyReadyForChildController *result;

  v6 = a5;
  result = (_TtC5Setup28BuddyReadyForChildController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyReadyForChildController", 34, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_name
                                                                             + 8]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_lockdownModeProvider]);
}

@end

@implementation BuddyPostActivationAppStateController

- (_TtC5Setup37BuddyPostActivationAppStateController)init
{
  _TtC5Setup37BuddyPostActivationAppStateController *result;

  sub_100030A78();
  return result;
}

- (void)viewDidLoad
{
  _TtC5Setup37BuddyPostActivationAppStateController *v2;

  v2 = self;
  sub_100030D08();

}

- (void)continueSetupTapped
{
  _TtC5Setup37BuddyPostActivationAppStateController *v2;
  BFFFlowItemDelegate *v3;
  BFFFlowItemDelegate *v4;

  v2 = self;
  v3 = -[BuddyWelcomeController delegate](v2, "delegate");
  if (v3)
  {
    v4 = v3;
    -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v2);

    swift_unknownObjectRelease(v4);
  }
  else
  {
    __break(1u);
  }
}

- (void)eraseTapped
{
  _TtC5Setup37BuddyPostActivationAppStateController *v2;

  v2 = self;
  sub_100030F24();

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_10003119C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_runState);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup];
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup] = a3;
  v3 = a3;

}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController];
}

- (void)setProximitySetupController:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController] = a3;
  v3 = a3;

}

- (BYAnalyticsManager)analyticsManager
{
  return (BYAnalyticsManager *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager];
}

- (void)setAnalyticsManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager] = a3;
  v3 = a3;

}

- (BYCapabilities)capabilities
{
  return (BYCapabilities *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_capabilities], a2);
}

- (void)setCapabilities:(id)a3
{
  sub_10003119C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_capabilities);
}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  if (os_variant_has_internal_ui("com.apple.purplebuddy", a2))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipWiFi);
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup37BuddyPostActivationAppStateController *v2;
  char v3;

  v2 = self;
  v3 = sub_100031234();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC5Setup37BuddyPostActivationAppStateController *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100280620, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = self;
  v12 = swift_retain(v9);
  v13 = static MainActor.shared.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_100280648, 56, 7);
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v11;
  v14[5] = sub_100032300;
  v14[6] = v9;
  v15 = sub_100030934((uint64_t)v7, (uint64_t)&unk_1002EB1E0, (uint64_t)v14);

  swift_release(v9);
  swift_release(v15);
}

- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup37BuddyPostActivationAppStateController *result;

  result = (_TtC5Setup37BuddyPostActivationAppStateController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyPostActivationAppStateController", 43, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup37BuddyPostActivationAppStateController *result;

  v6 = a5;
  result = (_TtC5Setup37BuddyPostActivationAppStateController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyPostActivationAppStateController", 43, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_runState]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_capabilities]);
}

@end

@implementation BuddyStolenDeviceProtectionController

- (_TtC5Setup37BuddyStolenDeviceProtectionController)init
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *result;

  sub_10001F6F0();
  return result;
}

- (void)viewDidLoad
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *v2;

  v2 = self;
  sub_10001FA84();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *v4;

  v4 = self;
  sub_10001FF24(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BuddyStolenDeviceProtectionController();
  v4 = (char *)v5.receiver;
  -[BuddyStolenDeviceProtectionController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_notificationCenter], "removeObserver:name:object:", v4, UIApplicationDidBecomeActiveNotification, 0, v5.receiver, v5.super_class);

}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration] = a3;
  v3 = a3;

}

- (BYCapabilities)capabilities
{
  return (BYCapabilities *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_capabilities], a2);
}

- (void)setCapabilities:(id)a3
{
  sub_100020248((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_capabilities);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return (BYPaneFeatureAnalyticsManager *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager];
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager] = a3;
  v3 = a3;

}

- (BuddyFeatureFlags)featureFlags
{
  return (BuddyFeatureFlags *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_featureFlags], a2);
}

- (void)setFeatureFlags:(id)a3
{
  sub_100020248((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_featureFlags);
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferences];
}

- (void)setBuddyPreferences:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferences];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferences] = a3;
  v3 = a3;

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_100020248((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_runState);
}

- (BuddyMiscState)miscState
{
  return (BuddyMiscState *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState];
}

- (void)setMiscState:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState] = a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupDeviceProtection);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100020314();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  _TtC5Setup37BuddyStolenDeviceProtectionController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100023434((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)turnOnTapped
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *v2;

  v2 = self;
  sub_10002075C();

}

- (void)notNowTapped
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *v2;

  v2 = self;
  sub_100020E20();

}

- (void)applicationDidBecomeActive
{
  uint64_t v2;
  _TtC5Setup37BuddyStolenDeviceProtectionController *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_postAuthenticationWorkItem];
  if (v2)
  {
    v3 = self;
    v4 = swift_retain(v2);
    dispatch thunk of DispatchWorkItem.perform()(v4);

    swift_release(v2);
  }
}

- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup37BuddyStolenDeviceProtectionController *result;

  result = (_TtC5Setup37BuddyStolenDeviceProtectionController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyStolenDeviceProtectionController", 43, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup37BuddyStolenDeviceProtectionController *result;

  v6 = a5;
  result = (_TtC5Setup37BuddyStolenDeviceProtectionController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyStolenDeviceProtectionController", 43, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_forceExecutePostAuthenticationWorkItem]);
  swift_release(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_postAuthenticationWorkItem]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_localAuthenticationReason
                                                                             + 8]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_capabilities]);
  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_featureFlags]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_runState]);
}

@end

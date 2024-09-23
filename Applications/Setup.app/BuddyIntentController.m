@implementation BuddyIntentController

- (_TtC5Setup21BuddyIntentController)init
{
  _TtC5Setup21BuddyIntentController *result;

  sub_10000FF1C();
  return result;
}

- (void)viewDidLoad
{
  _TtC5Setup21BuddyIntentController *v2;

  v2 = self;
  sub_100010108();

}

- (void)setUpForMyselfTapped
{
  _TtC5Setup21BuddyIntentController *v2;

  v2 = self;
  sub_100010448();

}

- (void)setUpForChildTapped
{
  _TtC5Setup21BuddyIntentController *v2;

  v2 = self;
  sub_100010644();

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_1000110A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup21BuddyIntentController_runState);
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod] = a3;
  v3 = a3;

}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider] = a3;
  v3 = a3;

}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController];
}

- (void)setProximitySetupController:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController] = a3;
  v3 = a3;

}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration] = a3;
  v3 = a3;

}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  return (BYAnalyticsEventAppearance *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance];
}

- (void)setAnalyticsEventAppearance:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance] = a3;
  v3 = a3;

}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  return (BuddyChildSetupPresenter *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter];
}

- (void)setChildSetupPresenter:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter] = a3;
  v3 = a3;

}

- (BuddyNetworkProvider)networkProvider
{
  return (BuddyNetworkProvider *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_networkProvider], a2);
}

- (void)setNetworkProvider:(id)a3
{
  sub_1000110A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup21BuddyIntentController_networkProvider);
}

- (id)showModalWiFiSettingsBlock
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock])
    return 0;
  v2 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock
                                                        + 8];
  v6[4] = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100024350;
  v6[3] = &unk_10027F5A0;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10027F588, 24, 7);
    v4[2] = v5;
    v6 = sub_1000123E4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
  v9 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
  v8 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock
                                                        + 8];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100011B64(v9, v8);
}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupIntendedUser);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 2;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup21BuddyIntentController *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_100011228((uint64_t)v2, v3);

  return v4 & 1;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id v4;
  id v5;

  swift_unknownObjectRetain(a3, a2);
  v4 = objc_msgSend(a3, "setupMethod");
  if (v4)
  {
    v5 = v4;
    if (!objc_msgSend(v4, "intent"))
      objc_msgSend(v5, "setIntent:", 1);
    swift_unknownObjectRelease(a3);

  }
  else
  {
    swift_unknownObjectRelease(a3);
  }
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  _QWORD *v4;
  _TtC5Setup21BuddyIntentController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100011B74((char *)v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)controllerWasPopped
{
  void *v2;

  v2 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
  if (v2)
    objc_msgSend(v2, "setIntent:", 0);
}

- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup21BuddyIntentController *result;

  result = (_TtC5Setup21BuddyIntentController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyIntentController", 27, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup21BuddyIntentController *result;

  v6 = a5;
  result = (_TtC5Setup21BuddyIntentController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyIntentController", 27, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_runState]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_networkProvider]);
  sub_100011B64(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock], *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock+ 8]);
}

@end

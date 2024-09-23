@implementation BuddyButtonConfigurationFlow

- (_TtC5Setup28BuddyButtonConfigurationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v9 = _Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject(&unk_10027F5D8, 24, 7);
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_10001303C;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  swift_unknownObjectRetain(a4, v12);
  v13 = a5;
  return (_TtC5Setup28BuddyButtonConfigurationFlow *)sub_100012B68(a3, (uint64_t)a4, a5, (uint64_t)v9, v10);
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)*(id *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences];
}

- (void)setBuddyPreferences:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences];
  *(_QWORD *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences] = a3;
  v3 = a3;

}

+ (id)allowedFlowItems
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  v2 = sub_10000A9E4(&qword_1002EA6B0);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10024C800;
  *(_QWORD *)(v3 + 32) = type metadata accessor for BuddyButtonConfigurationController();
  *(_QWORD *)(v3 + 40) = type metadata accessor for BuddySilentModeController();
  sub_10000A9E4((uint64_t *)&unk_1002EB170);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupActionButton);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup28BuddyButtonConfigurationFlow *v2;
  char v3;

  v2 = self;
  v3 = sub_100012EC8();

  return v3 & 1;
}

- (void).cxx_destruct
{

}

@end

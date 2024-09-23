@implementation CPActivitySessionManager

- (NSUUID)identifier
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSSet)activitySessions
{
  CPActivitySessionManager *v2;
  Class isa;

  v2 = self;
  ActivitySessionManager.activitySessions.getter();

  type metadata accessor for ActivitySession(0);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type ActivitySession and conformance NSObject, type metadata accessor for ActivitySession, MEMORY[0x1E0DEFCF8]);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (CPActivitySessionManagerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CPActivitySessionManager_delegate;
  swift_beginAccess();
  return (CPActivitySessionManagerDelegate *)(id)MEMORY[0x1AF449918](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CPApplicationLauncher)applicationLauncher
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySessionManager_applicationLauncher);
  swift_beginAccess();
  return (CPApplicationLauncher *)*v2;
}

- (void)setApplicationLauncher:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CPActivitySessionManager_applicationLauncher);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)handedOff
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CPActivitySessionManager_handedOff;
  swift_beginAccess();
  return *v2;
}

- (void)setHandedOff:(BOOL)a3
{
  BOOL *v5;
  CPActivitySessionManager *v6;

  v5 = (BOOL *)self + OBJC_IVAR___CPActivitySessionManager_handedOff;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  ActivitySessionManager.handedOff.didset();

}

+ (BOOL)supportsMultipleActivitySessions
{
  return 0;
}

- (NSSet)tuActivitySessions
{
  return (NSSet *)@objc ActivitySessionManager.tuSystemActivitySessions.getter(self, (uint64_t)a2, (void (*)(void))ActivitySessionManager.tuActivitySessions.getter);
}

- (NSSet)tuSystemActivitySessions
{
  return (NSSet *)@objc ActivitySessionManager.tuSystemActivitySessions.getter(self, (uint64_t)a2, (void (*)(void))ActivitySessionManager.tuSystemActivitySessions.getter);
}

- (CPActivitySessionManager)initWithIdentifier:(id)a3 groupUUID:(id)a4 activities:(id)a5 applicationController:(id)a6 delegate:(id)a7 queue:(id)a8 systemStateObserver:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v22[2];

  v22[1] = self;
  v12 = type metadata accessor for UUID();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v22 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
  _sSo29TUConversationActivitySessionCSo8NSObjectCSH10ObjectiveCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type TUConversationActivity and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity, 0x1E0DBD248, MEMORY[0x1E0DEFCF8]);
  v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = a6;
  swift_unknownObjectRetain();
  v20 = a8;
  swift_unknownObjectRetain();
  return (CPActivitySessionManager *)ActivitySessionManager.init(id:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:)((uint64_t)v17, (uint64_t)v15, v18, (uint64_t)v19, (uint64_t)a7, (uint64_t)v20, (uint64_t)a9);
}

- (id)createActivitySessionWithTuActivitySession:(id)a3
{
  uint8_t *v4;
  CPActivitySessionManager *v5;
  void *v6;

  v4 = (uint8_t *)a3;
  v5 = self;
  v6 = (void *)ActivitySessionManager.createActivitySession(tuActivitySession:)(v4);

  return v6;
}

- (void)leaveActivitySessionWithUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CPActivitySessionManager *v8;
  uint64_t v9;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  ActivitySessionManager.leaveActivitySession(activitySessionUUID:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)presentSessionDismissalAlertForActivitySessionUUID:(id)a3 allowingCancellation:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CPActivitySessionManager *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  v12 = self;
  specialized ActivitySessionManager.presentSessionDismissalAlert(activitySessionUUID:allowingCancellation:completion:)((uint64_t)v10, (char *)v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)removeActivitySessionWithUUID:(id)a3 usingHandle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CPActivitySessionManager *v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a4;
  v11 = self;
  ActivitySessionManager.removeActivitySession(activitySessionUUID:using:)((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateActivitySessionWithUUID:(id)a3 activity:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CPActivitySessionManager *v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a4;
  v11 = self;
  ActivitySessionManager.updateActivitySession(activitySessionUUID:activity:)((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)setUsingAirplay:(BOOL)a3 forActivitySessionWithUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  CPActivitySessionManager *v10;
  uint64_t v11;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ActivitySessionManager.setUsingAirplay(_:_:)(a3, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)refreshDataCryptors
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.refreshDataCryptors()();

}

- (void)refreshActivitySessionActiveParticipants
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.refreshActivitySessionActiveParticipants()();

}

- (void)resetSessions
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.resetSessions()();

}

- (void)resetNonScreenSharingSessions
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.resetNonScreenSharingSessions()();

}

- (void)removeScreenSharingSessions
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.removeScreenSharingSessions()();

}

- (void)removeLocalScreenSharingSessions
{
  CPActivitySessionManager *v2;

  v2 = self;
  ActivitySessionManager.removeLocalScreenSharingSessions()();

}

- (void)resetSceneAssociationsForBundleID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CPActivitySessionManager *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ActivitySessionManager.resetSceneAssociations(for:)(v8);

  swift_bridgeObjectRelease();
}

- (void)updateVirtualParticipantIdentifier:(unint64_t)a3
{
  CPActivitySessionManager *v4;

  v4 = self;
  ActivitySessionManager.updateVirtualParticipantId(_:)(a3);

}

- (CPActivitySessionManager)init
{
  CPActivitySessionManager *result;

  result = (CPActivitySessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR___CPActivitySessionManager_id;
  v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CPActivitySessionManager_groupUUID, v4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v6 = (char *)self + OBJC_IVAR___CPActivitySessionManager___activitySessions;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Set<ActivitySession>>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR___CPActivitySessionManager_delegate);

  swift_release();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySessionManager____lazy_storage___protectedStorage, (uint64_t *)&demangling cache variable for type metadata for ProtectedStorage?);
  swift_release();
  swift_release();
  swift_release();
}

- (void)applicationController:(id)a3 bundleIdentifierChanged:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  CPActivitySessionManager *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = a3;
  v10 = self;
  ActivitySessionManager.applicationController(_:bundleIdentifierChanged:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  @objc ActivitySessionManager.systemStateObserver(_:sharePlayAllowedStateChanged:)(self, (uint64_t)a2, (uint64_t)a3, a4, "CPSystemStateObserver sent sharePlayAllowedStateChanged to %s");
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  @objc ActivitySessionManager.systemStateObserver(_:sharePlayAllowedStateChanged:)(self, (uint64_t)a2, (uint64_t)a3, a4, "CPAudioRoutePolicyManager sent sharePlayAllowedStateChanged to %s");
}

@end

@implementation ConversationManagerHostConnection

- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3
{
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v6;

  type metadata accessor for UUID();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, v4, MEMORY[0x1E0CB09C8]);
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  ConversationManagerHostConnection.updateConversationContainers(conversationContainersByGroupUUID:)((Swift::OpaquePointer)v5);

  swift_bridgeObjectRelease();
}

- (void)requestEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v18;
  uint64_t v19;

  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v13);
  v17 = a5;
  v18 = self;
  specialized ConversationManagerHostConnection.requestEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, (uint64_t)v17, v18, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)prepareForGroupActivityWithOverrides:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  ConversationManagerHostConnection.prepareForGroupActivity(overrides:completionHandler:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> (), v7);

  swift_release();
}

- (void)createActivitySessionWith:(id)a3 onConversationWithUUID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v14;
  uint64_t v15;

  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  v13 = a3;
  v14 = self;
  specialized ConversationManagerHostConnection.createActivitySession(with:onConversationWithUUID:completion:)(v13, v11, v14, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)requestConversationContainersByGroupUUIDWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  ConversationManagerHostConnection.requestConversationContainersByGroupUUID(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> (), v5);

  swift_release();
}

- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v10;
  uint64_t v11;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  lazy protocol witness table accessor for type TUConversationMember and conformance NSObject();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ConversationManagerHostConnection.addRemoteMembers(_:toConversationWithUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ConversationManagerHostConnection.setActivityAuthorization(_:forBundleIdentifier:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
  @objc ConversationManagerHostConnection.buzzMember(_:conversationUUID:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))ConversationManagerHostConnection.buzzMember(_:conversationUUID:));
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v10;
  uint64_t v11;

  v4 = a3;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ConversationManagerHostConnection.setDownlinkMuted(_:forRemoteParticipantsInConversationWithUUID:)(v4, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
  @objc ConversationManagerHostConnection.buzzMember(_:conversationUUID:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))ConversationManagerHostConnection.kickMember(_:conversationUUID:));
}

- (void)updateConversationWith:(id)a3 participantPresentationContexts:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v10;
  uint64_t v11;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationParticipantPresentationContext);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ConversationManagerHostConnection.updateConversation(with:participantPresentationContexts:)((uint64_t)v8, v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v10;
  uint64_t v11;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ConversationManagerHostConnection.includeMetricsReport(_:onConversationWithUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)registerIdentifierForCustomEndpoint:(id)a3
{
  @objc ConversationManagerHostConnection.registerIdentifierForCustomEndpoint(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConversationManagerHostConnection.registerIdentifierForCustomEndpoint(_:));
}

- (void)unregisterIdentifierForCustomEndpoint:(id)a3
{
  @objc ConversationManagerHostConnection.registerIdentifierForCustomEndpoint(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConversationManagerHostConnection.unregisterIdentifierForCustomEndpoint(_:));
}

- (void)fetchEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  _TtC14CopresenceCore33ConversationManagerHostConnection *v19;
  uint64_t v20;

  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v13;
  v18 = a5;
  v19 = self;
  ConversationManagerHostConnection.fetchEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, v18, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned TUConversationActivity?) -> (), v17);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end

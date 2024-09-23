@implementation ConversationManagerClient

- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3
{
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  _TtC14CopresenceCore25ConversationManagerClient *v6;

  type metadata accessor for UUID();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, v4, MEMORY[0x1E0CB09C8]);
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  ConversationManagerClient.updateConversationContainers(conversationContainersByGroupUUID:)((Swift::OpaquePointer)v5);

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
  unint64_t v15;
  unint64_t v16;
  id v17;
  _TtC14CopresenceCore25ConversationManagerClient *v18;
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
  specialized ConversationManagerClient.requestEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, (uint64_t)v17, v18, (uint64_t)v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end

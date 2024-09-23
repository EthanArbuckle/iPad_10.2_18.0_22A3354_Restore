@implementation BackgroundSessionManagerClient

- (void)beginWithRequest:(id)a3 completion:(id)a4
{
  @objc BackgroundSessionManagerClient.begin(request:completion:)(self, (int)a2, a3, a4, (uint64_t)&unk_1E5C83F10, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))BackgroundSessionManagerClient.begin(request:completion:));
}

- (void)leaveWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v12;
  uint64_t v13;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  BackgroundSessionManagerClient.leave(identifier:completion:)((uint64_t)v9, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateMembersWithIdentifier:(id)a3 members:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v14;
  uint64_t v15;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  lazy protocol witness table accessor for type TUHandle and conformance NSObject();
  v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = self;
  BackgroundSessionManagerClient.updateMembers(identifier:members:completion:)((uint64_t)v10, v12, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v13);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v15;
  uint64_t v16;

  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = self;
  BackgroundSessionManagerClient.updateShare(_:activityID:completion:)(v14, (uint64_t)v11, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)createPresenceSessionWith:(id)a3 completion:(id)a4
{
  @objc BackgroundSessionManagerClient.begin(request:completion:)(self, (int)a2, a3, a4, (uint64_t)&unk_1E5C83E70, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned PresenceSessionConnectionInfo?, @unowned NSError?) -> (), (void (*)(id, uint64_t, uint64_t))BackgroundSessionManagerClient.createPresenceSession(with:completion:));
}

- (void)updateWithActivitySessions:(id)a3
{
  char *v4;
  uint64_t v5;
  void (*v6)(void);
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v7;

  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v4))
  {
    v5 = *((_QWORD *)v4 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 16);
    v7 = self;
    v6();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)sessionDidRejectKeyRecoveryRequestWithSessionID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(char *, uint64_t, uint64_t);
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v12;
  uint64_t v13;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v8))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 24);
    v12 = self;
    v11(v7, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sessionDidReceiveUpdatedUnknownParticipantListWithSessionID:(id)a3 unknownParticipants:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjectType;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  _TtC14CopresenceCore30BackgroundSessionManagerClient *v14;
  uint64_t v15;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  lazy protocol witness table accessor for type TUHandle and conformance NSObject();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v10))
  {
    v11 = *((_QWORD *)v10 + 1);
    ObjectType = swift_getObjectType();
    v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 32);
    v14 = self;
    v13(v8, v9, ObjectType, v11);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

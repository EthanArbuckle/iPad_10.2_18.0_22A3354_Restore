@implementation BackgroundSessionManagerHostConnection

- (void)beginWithRequest:(id)a3 completion:(id)a4
{
  @objc BackgroundSessionManagerClient.begin(request:completion:)(self, (int)a2, a3, a4, (uint64_t)&unk_1E5C889D8, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))BackgroundSessionManagerHostConnection.begin(request:completion:));
}

- (void)leaveWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC14CopresenceCore38BackgroundSessionManagerHostConnection *v12;
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
  BackgroundSessionManagerHostConnection.leave(identifier:completion:)((uint64_t)v9, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v11);

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
  _TtC14CopresenceCore38BackgroundSessionManagerHostConnection *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUHandle();
  lazy protocol witness table accessor for type AddressableMember and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for TUHandle);
  v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  v13 = self;
  specialized BackgroundSessionManagerHostConnection.updateMembers(identifier:members:completion:)((uint64_t)v10, v12, v13, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  _TtC14CopresenceCore38BackgroundSessionManagerHostConnection *v23;
  void (**v24)(uint64_t);
  id v25;
  _TtC14CopresenceCore38BackgroundSessionManagerHostConnection *v26;
  id v27;
  char *v28;
  _TtC14CopresenceCore38BackgroundSessionManagerHostConnection *v29;

  v29 = self;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v9;
  v10 = type metadata accessor for UUID();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v28 - v15;
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v21 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = 0;
  *((_QWORD *)v22 + 3) = 0;
  v23 = v29;
  *((_QWORD *)v22 + 4) = v29;
  *((_QWORD *)v22 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v22[v20], v14, v10);
  v24 = (void (**)(uint64_t))&v22[v21];
  *v24 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  v24[1] = (void (*)(uint64_t))v18;
  v25 = a3;
  v26 = v23;
  v27 = v25;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v28, (uint64_t)&closure #1 in BackgroundSessionManagerHostConnection.updateShare(_:activityID:completion:)partial apply, (uint64_t)v22);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)createPresenceSessionWith:(id)a3 completion:(id)a4
{
  @objc BackgroundSessionManagerClient.begin(request:completion:)(self, (int)a2, a3, a4, (uint64_t)&unk_1E5C888C0, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned PresenceSessionConnectionInfo?, @unowned NSError?) -> (), (void (*)(id, uint64_t, uint64_t))BackgroundSessionManagerHostConnection.createPresenceSession(with:completion:));
}

@end

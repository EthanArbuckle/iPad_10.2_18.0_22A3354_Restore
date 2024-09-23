@implementation PresenceSessionHostConnection

- (void)joinWithCompletion:(id)a3
{
  @objc PresenceSessionHostConnection.join(completion:)(self, (int)a2, a3, (uint64_t)&unk_1E5C89598, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(uint64_t, uint64_t))PresenceSessionHostConnection.join(completion:));
}

- (void)leaveWithCompletion:(id)a3
{
  @objc PresenceSessionHostConnection.join(completion:)(self, (int)a2, a3, (uint64_t)&unk_1E5C89570, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(uint64_t, uint64_t))PresenceSessionHostConnection.leave(completion:));
}

- (void)updateMembers:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC14CopresenceCore29PresenceSessionHostConnection *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for TUHandle();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for TUHandle, MEMORY[0x1E0DEFCF8]);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  PresenceSessionHostConnection.updateMembers(_:completion:)(v6, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v7);

  swift_bridgeObjectRelease();
  swift_release();
}

@end

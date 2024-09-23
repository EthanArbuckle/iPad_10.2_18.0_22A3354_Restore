@implementation ActivitySessionHostConnection

- (void)joinWithAudioSessionID:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  ActivitySessionHostConnection.join(audioSessionID:completion:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned PresenceSessionConnectionInfo?, @unowned NSError?) -> (), v7);

  swift_release();
}

- (void)leaveWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  ActivitySessionHostConnection.leave(completion:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v5);

  swift_release();
}

- (void)end
{
  _TtC14CopresenceCore29ActivitySessionHostConnection *v2;

  v2 = self;
  ActivitySessionHostConnection.end()();

}

- (void)postEventWithEvent:(id)a3
{
  id v4;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v5;

  v4 = a3;
  v5 = self;
  ActivitySessionHostConnection.postEvent(event:)(v4);

}

- (void)logAttachmentEventWithReport:(id)a3 reportEvent:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = a3;
  v10 = self;
  ActivitySessionHostConnection.logAttachmentEvent(report:reportEvent:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)requestEncryptionKeysFor:(id)a3
{
  void *v4;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v5;
  Swift::OpaquePointer_optional v6;

  if (a3)
    v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v4 = 0;
  v5 = self;
  v6.value._rawValue = v4;
  ActivitySessionHostConnection.requestEncryptionKeys(for:)(v6);

  swift_bridgeObjectRelease();
}

- (void)requestParticipantsFor:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v8;

  v5 = _Block_copy(a4);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  ActivitySessionHostConnection.requestParticipants(for:completion:)(v6, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSSet) -> (), v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateActivityWithActivity:(id)a3
{
  id v4;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v5;

  v4 = a3;
  v5 = self;
  ActivitySessionHostConnection.updateActivity(activity:)(v4);

}

- (void)presentSessionDismissalAlertWithAllowingCancellation:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  ActivitySessionHostConnection.presentSessionDismissalAlert(allowingCancellation:completion:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v7);

  swift_release();
}

- (void)requestForegroundPresentation
{
  _TtC14CopresenceCore29ActivitySessionHostConnection *v2;

  v2 = self;
  ActivitySessionHostConnection.requestForegroundPresentation()();

}

- (void)associateSceneWithSceneID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ActivitySessionHostConnection.associateScene(sceneID:)(v8);

  swift_bridgeObjectRelease();
}

- (void)disassociateScene
{
  _TtC14CopresenceCore29ActivitySessionHostConnection *v2;

  v2 = self;
  ActivitySessionHostConnection.disassociateScene()();

}

- (void)sendResourceAtURL:(id)a3 to:(id)a4 metadata:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v9 = _Block_copy(a6);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v9;
  ActivitySessionHostConnection.sendResource(atURL:to:metadata:completion:)(v11, v10, v14, v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v17);
  swift_release();
  outlined consume of Data._Representation(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)requestEndpointWith:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC14CopresenceCore29ActivitySessionHostConnection *v10;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  ActivitySessionHostConnection.requestEndpoint(with:completion:)(v6, v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSXPCListenerEndpoint?) -> (), v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateCapabilitiesWithCapabilities:(int64_t)a3
{
  _TtC14CopresenceCore29ActivitySessionHostConnection *v4;

  v4 = self;
  ActivitySessionHostConnection.updateCapabilities(capabilities:)(a3);

}

@end

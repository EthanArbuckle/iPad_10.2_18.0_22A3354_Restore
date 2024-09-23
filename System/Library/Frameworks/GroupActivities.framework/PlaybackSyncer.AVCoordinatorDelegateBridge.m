@implementation PlaybackSyncer.AVCoordinatorDelegateBridge

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *v10;
  Class isa;
  uint64_t v13;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  PlaybackSyncer.AVCoordinatorDelegateBridge.localParticipantUUID(for:)((uint64_t)v8);

  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return isa;
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
  uint64_t (*v6)(void);
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  Class isa;
  id v12;

  type metadata accessor for AVPlaybackCoordinationParticipantStateKey(0);
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type AVPlaybackCoordinationParticipantStateKey and conformance AVPlaybackCoordinationParticipantStateKey, (uint64_t (*)(uint64_t))type metadata accessor for AVPlaybackCoordinationParticipantStateKey, (uint64_t)&protocol conformance descriptor for AVPlaybackCoordinationParticipantStateKey);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x60);
  v12 = a3;
  v7 = self;
  if (v6())
  {
    v9 = v8;
    ObjectType = swift_getObjectType();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(Class, uint64_t, uint64_t))(v9 + 8))(isa, ObjectType, v9);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }

}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  Class isa;
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *v15;
  id v16;

  type metadata accessor for AVPlaybackCoordinationTransportControlStateKey(0);
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type AVPlaybackCoordinationTransportControlStateKey and conformance AVPlaybackCoordinationTransportControlStateKey, (uint64_t (*)(uint64_t))type metadata accessor for AVPlaybackCoordinationTransportControlStateKey, (uint64_t)&protocol conformance descriptor for AVPlaybackCoordinationTransportControlStateKey);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x60);
  v16 = a3;
  v15 = self;
  if (v10())
  {
    v12 = v11;
    ObjectType = swift_getObjectType();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t, Class, uint64_t, uint64_t))(v12 + 16))(v7, v9, isa, ObjectType, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *v17;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x60);
  v13 = a3;
  v17 = self;
  if (v12())
  {
    v15 = v14;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v15 + 24))(v8, v10, partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v11, ObjectType, v15);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
  }

}

- (_TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge)init
{
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *result;

  result = (_TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge_localParticipantID;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of weak SystemCoordinatorHostDelegate?((uint64_t)self + OBJC_IVAR____TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge_delegate);
}

- (void)playbackCoordinator:(id)a3 promptForLeaveOrEndSessionAllowingCancellation:(BOOL)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  specialized PlaybackSyncer.AVCoordinatorDelegateBridge.playbackCoordinator(_:promptForLeaveOrEndSessionAllowingCancellation:completionHandler:)(a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v9);

  swift_release();
}

@end

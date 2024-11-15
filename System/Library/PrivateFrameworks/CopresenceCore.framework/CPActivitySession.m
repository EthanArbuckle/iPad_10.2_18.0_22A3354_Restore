@implementation CPActivitySession

- (NSUUID)identifier
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSString)persistentSceneIdentifier
{
  uint64_t (*v2)(void);
  CPActivitySession *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1A8);
  v3 = self;
  v4 = v2();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = v4 + 16 * v5;
    v7 = *(_QWORD *)(v6 + 16);
    v8 = *(_QWORD *)(v6 + 24);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    v9 = (void *)MEMORY[0x1AF4480F4](v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    v9 = 0;
  }
  return (NSString *)v9;
}

- (TUConversationActivity)activity
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySession_activity);
  swift_beginAccess();
  return (TUConversationActivity *)*v2;
}

- (void)setActivity:(id)a3
{
  id **v5;
  id *v6;
  id v7;
  CPActivitySession *v8;

  v5 = (id **)((char *)self + OBJC_IVAR___CPActivitySession_activity);
  swift_beginAccess();
  v6 = *v5;
  *v5 = (id *)a3;
  v7 = a3;
  v8 = self;
  ActivitySession.activity.didset(v6);

}

- (TUConversationActivitySession)tuConversationActivitySession
{
  CPActivitySession *v2;
  id v3;

  v2 = self;
  v3 = ActivitySession.tuConversationActivitySession.getter();

  return (TUConversationActivitySession *)v3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CPActivitySession_endpoint));
}

- (void)permitJoin
{
  CPActivitySession *v2;

  v2 = self;
  ActivitySession.permitJoin()();

}

- (void)dealloc
{
  CPActivitySession *v2;

  v2 = self;
  ActivitySession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___CPActivitySession_id;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CPActivitySession_activityInterval;
  v6 = type metadata accessor for DateInterval();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySession_domainAssertion, &demangling cache variable for type metadata for ActivitySession.DomainAssertionWrapper?);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v7 = (char *)self + OBJC_IVAR___CPActivitySession__state;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ActivitySession.State>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  v9 = (char *)self + OBJC_IVAR___CPActivitySession_timestamp;
  v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___CPActivitySession_localCreationTimestamp, v10);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySession_permittedJoinTimestamp, (uint64_t *)&demangling cache variable for type metadata for Date?);
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR___CPActivitySession_sessionManager);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPActivitySession_notificationCenter);
}

- (void)updateApplicationState:(unint64_t)a3
{
  CPActivitySession *v4;

  v4 = self;
  ActivitySession.updateApplicationState(_:)(a3);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  CPActivitySession *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized ActivitySession.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (void)associateSceneWithSceneID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  CPActivitySession *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v8 = self;
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  ActivitySession.associateScene(sceneID:)(v7);
  swift_bridgeObjectRelease();

}

- (CPActivitySession)init
{
  CPActivitySession *result;

  result = (CPActivitySession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateActivityImage:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CPActivitySession *v8;

  v4 = a3;
  v8 = self;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  ActivitySession.updateActivityImage(_:)();
  outlined consume of Data._Representation(v5, v7);

}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  CPActivitySession *v5;

  v4 = a3;
  v5 = self;
  specialized ActivitySession.assertionWillInvalidate(_:)();

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  CPActivitySession *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  specialized ActivitySession.assertion(_:didInvalidateWithError:)(a4);

}

- (void)resetSession
{
  CPActivitySession *v2;

  v2 = self;
  ActivitySession.resetSession()();

}

- (void)receivedResourceAtURL:(id)a3 withMetadata:(id)a4 fromParticipantIdentifier:(unint64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  CPActivitySession *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a4;
  v13 = self;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  ActivitySession.receivedResource(atURL:withMetadata:fromParticipantIdentifier:)((uint64_t)v11, v14, v16, a5);
  outlined consume of Data._Representation(v14, v16);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (NSString)description
{
  CPActivitySession *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ActivitySession.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end

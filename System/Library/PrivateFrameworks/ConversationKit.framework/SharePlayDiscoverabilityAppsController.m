@implementation SharePlayDiscoverabilityAppsController

- (_TtC15ConversationKit38SharePlayDiscoverabilityAppsController)init
{
  return (_TtC15ConversationKit38SharePlayDiscoverabilityAppsController *)SharePlayDiscoverabilityAppsController.init()();
}

- (void)dealloc
{
  _TtC15ConversationKit38SharePlayDiscoverabilityAppsController *v2;

  v2 = self;
  SharePlayDiscoverabilityAppsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_foregroundApp));
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController____lazy_storage___suggester));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_entitlementsChecker);
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_protectedAppsObserver, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
  OUTLINED_FUNCTION_0();
}

- (void)handleCallConnected:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit38SharePlayDiscoverabilityAppsController *v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  SharePlayDiscoverabilityAppsController.handleCallConnected(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end

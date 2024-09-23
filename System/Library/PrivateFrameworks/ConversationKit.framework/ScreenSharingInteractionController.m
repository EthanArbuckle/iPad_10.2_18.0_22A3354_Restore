@implementation ScreenSharingInteractionController

- (int64_t)remoteControlStatus
{
  _TtC15ConversationKit34ScreenSharingInteractionController *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  ScreenSharingInteractionController.remoteControlStatus.getter();
  v4 = v3;

  return v4;
}

- (NSDate)latestRemoteControlDate
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  Class isa;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScreenSharingInteractionController.latestRemoteControlDate.getter();
  v5 = type metadata accessor for Date();
  isa = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)isa;
}

- (void)setLatestRemoteControlDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC15ConversationKit34ScreenSharingInteractionController *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for Date();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for Date();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  ScreenSharingInteractionController.latestRemoteControlDate.setter((uint64_t)v7);

}

- (void)addDelegate:(id)a3
{
  @objc ScreenSharingInteractionController.addDelegate(_:)(self, (uint64_t)a2, (uint64_t)a3, ScreenSharingInteractionController.addDelegate(_:));
}

- (void)removeDelegate:(id)a3
{
  @objc ScreenSharingInteractionController.addDelegate(_:)(self, (uint64_t)a2, (uint64_t)a3, ScreenSharingInteractionController.removeDelegate(_:));
}

- (void)dealloc
{
  _TtC15ConversationKit34ScreenSharingInteractionController *v2;

  v2 = self;
  ScreenSharingInteractionController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  outlined destroy of AsyncStream<Bool>?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_groupSessionStateCancellable, (uint64_t *)&demangling cache variable for type metadata for Cancellable?);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_observers));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ScreenSharingInteractionSession?>);
  OUTLINED_FUNCTION_16_0(v3);
  outlined destroy of AsyncStream<Bool>?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_latestRemoteControlDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  v4 = type metadata accessor for DeviceRestrictionController();
  OUTLINED_FUNCTION_16_0(v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_eligibilityChecker);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<RemoteControlState>);
  OUTLINED_FUNCTION_16_0(v5);
  OUTLINED_FUNCTION_155_2();
}

- (_TtC15ConversationKit34ScreenSharingInteractionController)init
{
  ScreenSharingInteractionController.init()();
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  _TtC15ConversationKit34ScreenSharingInteractionController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  ScreenSharingInteractionController.screenSharingStateMonitor(_:didUpdateScreenSharingBroadcastingState:)((uint64_t)v6, a4);
  swift_unknownObjectRelease();

}

@end

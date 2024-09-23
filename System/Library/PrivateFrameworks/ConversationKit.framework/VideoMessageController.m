@implementation VideoMessageController

- (_TtC15ConversationKit22VideoMessageController)init
{
  VideoMessageController.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  OUTLINED_FUNCTION_16_0(v3);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_mostRecentActiveConversation, &demangling cache variable for type metadata for Conversation?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22VideoMessageController_mostRecentLocalHandle);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22VideoMessageController_videoMessageSendSoundPlayer);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_currentRecordingUUID, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<URL?>);
  OUTLINED_FUNCTION_16_0(v4);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22VideoMessageController_latestVideoMessageSandboxURL);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22VideoMessageController__momentsController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_callCenter);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)momentsController:(id)a3 didFinishProcessingRawVideoMessage:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit22VideoMessageController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  VideoMessageController.momentsController(_:didFinishProcessingRawVideoMessage:)();

}

@end

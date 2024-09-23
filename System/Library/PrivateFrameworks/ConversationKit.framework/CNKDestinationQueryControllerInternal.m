@implementation CNKDestinationQueryControllerInternal

- (CNKDestinationQueryControllerDelegate)delegate
{
  return (CNKDestinationQueryControllerDelegate *)(id)DestinationQueryController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  CNKDestinationQueryControllerInternal *v4;

  swift_unknownObjectRetain();
  v4 = self;
  DestinationQueryController.delegate.setter();

}

- (CNKDestinationQueryControllerInternal)init
{
  CNKDestinationQueryControllerInternal *result;

  DestinationQueryController.init()();
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___CNKDestinationQueryControllerInternal_delegate);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)handleIDSStatusChanged
{
  CNKDestinationQueryControllerInternal *v2;

  v2 = self;
  DestinationQueryController.handleIDSStatusChanged()();

}

- (void)addRecipient:(id)a3
{
  @objc DestinationQueryController.addRecipient(_:)();
}

- (void)removeRecipient:(id)a3
{
  @objc DestinationQueryController.addRecipient(_:)();
}

- (void)reset
{
  CNKDestinationQueryControllerInternal *v2;

  v2 = self;
  DestinationQueryController.reset()();

}

- (void)queryAddresses:(id)a3
{
  uint64_t v4;
  CNKDestinationQueryControllerInternal *v5;

  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  DestinationQueryController.queryAddresses(_:)(v4);

  swift_bridgeObjectRelease();
}

- (int64_t)isFaceTimeAllowedFor:(id)a3
{
  CNKDestinationQueryControllerInternal *v5;
  int64_t v6;
  int64_t v7;

  swift_unknownObjectRetain();
  v5 = self;
  DestinationQueryController.isFaceTimeAllowed(for:)(a3);
  v7 = v6;
  swift_unknownObjectRelease();

  return v7;
}

- (int64_t)isMultiwayAllowedFor:(id)a3
{
  int64_t result;

  @objc DestinationQueryController.isMultiwayAllowed(for:)();
  return result;
}

- (int64_t)isAudioAllowedFor:(id)a3
{
  int64_t result;

  @objc DestinationQueryController.isMultiwayAllowed(for:)();
  return result;
}

- (int64_t)isVideoAllowedFor:(id)a3
{
  int64_t result;

  @objc DestinationQueryController.isMultiwayAllowed(for:)();
  return result;
}

- (int64_t)isWebCapableFor:(id)a3
{
  int64_t result;

  @objc DestinationQueryController.isMultiwayAllowed(for:)();
  return result;
}

- (int64_t)presentationStyleFor:(id)a3
{
  CNKDestinationQueryControllerInternal *v5;
  int64_t v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = DestinationQueryController.presentationStyle(for:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

@end

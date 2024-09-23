@implementation CallParticipantLabelDescriptor

- (NSArray)strings
{
  Class isa;

  CallParticipantLabelDescriptor.strings.getter();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setStrings:(id)a3
{
  uint64_t v4;
  _TtC15ConversationKit30CallParticipantLabelDescriptor *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  CallParticipantLabelDescriptor.strings.setter(v4);

}

- (NSString)secondaryString
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CallParticipantLabelDescriptor.secondaryString.getter);
}

- (void)setSecondaryString:(id)a3
{
  @objc CallParticipantLabelDescriptor.secondaryString.setter(self, (uint64_t)a2, (uint64_t)a3, CallParticipantLabelDescriptor.secondaryString.setter);
}

- (NSString)durationString
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CallParticipantLabelDescriptor.durationString.getter);
}

- (void)setDurationString:(id)a3
{
  @objc CallParticipantLabelDescriptor.secondaryString.setter(self, (uint64_t)a2, (uint64_t)a3, CallParticipantLabelDescriptor.durationString.setter);
}

- (int64_t)layoutState
{
  int64_t result;

  CallParticipantLabelDescriptor.layoutState.getter();
  return result;
}

- (void)setLayoutState:(int64_t)a3
{
  CallParticipantLabelDescriptor.layoutState.setter(a3);
}

- (BOOL)isDynamic
{
  return CallParticipantLabelDescriptor.isDynamic.getter() & 1;
}

- (void)setIsDynamic:(BOOL)a3
{
  CallParticipantLabelDescriptor.isDynamic.setter(a3);
}

- (NSString)localizedSenderIdentity
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CallParticipantLabelDescriptor.localizedSenderIdentity.getter);
}

- (void)setLocalizedSenderIdentity:(id)a3
{
  @objc CallParticipantLabelDescriptor.secondaryString.setter(self, (uint64_t)a2, (uint64_t)a3, CallParticipantLabelDescriptor.localizedSenderIdentity.setter);
}

- (_TtC15ConversationKit30CallParticipantLabelDescriptor)init
{
  CallParticipantLabelDescriptor.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_102();
  swift_bridgeObjectRelease();
}

@end

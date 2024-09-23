@implementation BlastDoorAudioMessage

- (NSString)description
{
  return (NSString *)sub_1AD4CB404((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSAttributedString)content
{
  return (NSAttributedString *)sub_1AD4CB4A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4CB554((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSArray)inlineAudioMessages
{
  return (NSArray *)sub_1AD4CB660();
}

- (BlastDoorAudioMessage)init
{
  BlastDoorAudioMessage *result;

  result = (BlastDoorAudioMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4CB72C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

@end

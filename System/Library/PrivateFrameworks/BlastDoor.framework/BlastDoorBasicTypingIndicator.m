@implementation BlastDoorBasicTypingIndicator

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator);
}

- (NSArray)participantDestinationIdentifiers
{
  void *v2;

  if (*(_QWORD *)&self->basicTypingIndicator[OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BlastDoorBasicTypingIndicator)init
{
  BlastDoorBasicTypingIndicator *result;

  result = (BlastDoorBasicTypingIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

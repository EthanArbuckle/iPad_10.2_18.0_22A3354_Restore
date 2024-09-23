@implementation BlastDoorTypingIndicator

- (NSString)description
{
  void *v2;
  _BYTE v4[520];

  sub_1AD4DA5EC((uint64_t)self + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator, (uint64_t)v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator);
}

- (BlastDoorTypingIndicator_Icon)icon
{
  BlastDoorTypingIndicator *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4CA2F0();

  return (BlastDoorTypingIndicator_Icon *)v3;
}

- (NSString)balloonPluginBundleID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString *result;
  _QWORD v6[63];
  uint64_t v7;

  sub_1AD4DA5EC((uint64_t)self + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator, (uint64_t)v6);
  v2 = v7;
  if (v7 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v3 = v6[62];
    swift_bridgeObjectRetain();
    sub_1AD290554(v6);
    if (v2)
    {
      v4 = (void *)sub_1AD63B744();
      sub_1AD003F24(v3, v2);
    }
    else
    {
      v4 = 0;
    }
    return (NSString *)v4;
  }
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  void *v2;

  if (*(_QWORD *)&self->typingIndicator[OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator + 504])
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

- (BlastDoorTypingIndicator)init
{
  BlastDoorTypingIndicator *result;

  result = (BlastDoorTypingIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD290554((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator));
}

@end

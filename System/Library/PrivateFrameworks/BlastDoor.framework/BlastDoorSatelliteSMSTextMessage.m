@implementation BlastDoorSatelliteSMSTextMessage

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)plainTextBodies
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSatelliteSMSTextMessage_satelliteSMSTextMessage))
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

- (BlastDoorSatelliteSMSTextMessage)init
{
  BlastDoorSatelliteSMSTextMessage *result;

  result = (BlastDoorSatelliteSMSTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

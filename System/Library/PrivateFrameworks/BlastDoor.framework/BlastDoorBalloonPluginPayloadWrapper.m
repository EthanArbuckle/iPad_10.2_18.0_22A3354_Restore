@implementation BlastDoorBalloonPluginPayloadWrapper

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for BalloonPlugin.Payload, &OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload);
}

- (unint64_t)type
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t EnumCaseMultiPayload;
  uint64_t v8;

  v3 = type metadata accessor for BalloonPlugin.Payload(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, (uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  return EnumCaseMultiPayload;
}

- (NSData)messagesAppBalloon
{
  BlastDoorBalloonPluginPayloadWrapper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D628C();

  return (NSData *)v3;
}

- (NSData)handwriting
{
  BlastDoorBalloonPluginPayloadWrapper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D63E4();

  return (NSData *)v3;
}

- (NSData)linkPresentation
{
  BlastDoorBalloonPluginPayloadWrapper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D66A4();

  return (NSData *)v3;
}

- (BlastDoorCombinedPluginAttachmentInfo)combinedPluginAttachmentInfo
{
  BlastDoorBalloonPluginPayloadWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D6800();

  return (BlastDoorCombinedPluginAttachmentInfo *)v3;
}

- (NSData)digitalTouchBalloon
{
  BlastDoorBalloonPluginPayloadWrapper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D69B8();

  return (NSData *)v3;
}

- (BlastDoorBalloonPluginPayloadWrapper)init
{
  BlastDoorBalloonPluginPayloadWrapper *result;

  result = (BlastDoorBalloonPluginPayloadWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, type metadata accessor for BalloonPlugin.Payload);
}

@end

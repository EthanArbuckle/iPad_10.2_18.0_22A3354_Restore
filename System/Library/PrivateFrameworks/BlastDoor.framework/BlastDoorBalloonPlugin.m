@implementation BlastDoorBalloonPlugin

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for BalloonPlugin, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin);
}

- (BlastDoorBalloonPluginPayloadWrapper)payload
{
  return (BlastDoorBalloonPluginPayloadWrapper *)sub_1AD4ADC44(self, (uint64_t)a2, type metadata accessor for BalloonPlugin.Payload, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for _ObjCEnumBalloonPluginPayloadWrapper, &OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload);
}

- (NSString)bundleID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  void *v7;
  NSString *result;
  uint64_t v9;

  v3 = type metadata accessor for BalloonPlugin(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, v6);
  if (*(_QWORD *)&v5[*(int *)(v3 + 20) + 24])
  {
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin);
    v7 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (BOOL)isExpirable
{
  return sub_1AD4BAB70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

- (NSArray)attributionInfo
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4AB5A8, (void (*)(void))type metadata accessor for _ObjCAttributionInfoWrapper);
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1AD4C2594((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

- (NSAttributedString)content
{
  char *v2;
  id v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 36)])
    v3 = sub_1AD5AB450();
  else
    v3 = 0;
  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  void *v7;
  NSArray *result;
  uint64_t v9;

  v3 = type metadata accessor for BalloonPlugin(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, v6);
  if (*(_QWORD *)&v5[*(int *)(v3 + 40) + 16])
  {
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin);
    v7 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
    return (NSArray *)v7;
  }
  else
  {
    result = (NSArray *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (NSString)associatedMessageGUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *result;
  uint64_t v12;

  v3 = type metadata accessor for BalloonPlugin(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 44)];
  v8 = *((_QWORD *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v9 = *((_QWORD *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin);
    if (v8)
    {
      v10 = (void *)sub_1AD63B744();
      sub_1AD003F24(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BOOL)has_associatedMessageRange
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  return (v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 48) + 16] & 1) == 0;
}

- (_NSRange)associatedMessageRange
{
  BlastDoorBalloonPlugin *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1AD4ABCDC();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)has_associatedMessageType
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  BOOL v8;
  BlastDoorBalloonPlugin *v9;
  BOOL result;
  uint64_t v11;

  v3 = type metadata accessor for BalloonPlugin(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 52)];
  if ((v7[25] & 1) != 0)
  {
    result = sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v8 = (v7[24] & 1) == 0;
    v9 = self;
    sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin);

    return v8;
  }
  return result;
}

- (int64_t)associatedMessageType
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  char v8;
  int64_t v9;
  int64_t result;
  uint64_t v11;

  v3 = type metadata accessor for BalloonPlugin(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 52)];
  if ((v7[25] & 1) != 0)
  {
    result = sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v8 = v7[24];
    v9 = *((_QWORD *)v7 + 2);
    sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin);
    if ((v8 & 1) != 0)
      return 0;
    else
      return v9;
  }
  return result;
}

- (BlastDoorEncodedAttachments)attachments
{
  char *v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  v3 = *(_QWORD *)&v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 56)];
  v4 = (objc_class *)type metadata accessor for _ObjCEncodedAttachmentsWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR___BlastDoorEncodedAttachments_encodedAttachments] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_bridgeObjectRetain();
  return (BlastDoorEncodedAttachments *)-[BlastDoorBalloonPlugin init](&v7, sel_init);
}

- (BlastDoorBalloonPlugin)init
{
  BlastDoorBalloonPlugin *result;

  result = (BlastDoorBalloonPlugin *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

@end

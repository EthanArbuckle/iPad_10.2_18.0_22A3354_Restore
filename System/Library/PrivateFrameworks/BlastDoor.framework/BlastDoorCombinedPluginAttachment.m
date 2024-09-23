@implementation BlastDoorCombinedPluginAttachment

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachment, &OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment);
}

- (BlastDoorEncodedAttachments)attachments
{
  uint64_t v2;
  objc_class *v3;
  char *v4;
  objc_super v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment);
  v3 = (objc_class *)type metadata accessor for _ObjCEncodedAttachmentsWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR___BlastDoorEncodedAttachments_encodedAttachments] = v2;
  v6.receiver = v4;
  v6.super_class = v3;
  swift_bridgeObjectRetain();
  return (BlastDoorEncodedAttachments *)-[BlastDoorCombinedPluginAttachment init](&v6, sel_init);
}

- (BlastDoorBalloonPluginPayloadWrapper)payload
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  BlastDoorCombinedPluginAttachment *v10;
  BlastDoorCombinedPluginAttachment *v11;
  objc_super v13;

  v3 = type metadata accessor for BalloonPlugin.Payload(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment;
  v7 = type metadata accessor for CombinedPluginAttachment();
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  v8 = (objc_class *)type metadata accessor for _ObjCEnumBalloonPluginPayloadWrapper(0);
  v9 = objc_allocWithZone(v8);
  sub_1AD0D3D2C((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, type metadata accessor for BalloonPlugin.Payload);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = -[BlastDoorCombinedPluginAttachment init](&v13, sel_init);
  sub_1AD066230((uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);

  return (BlastDoorBalloonPluginPayloadWrapper *)v11;
}

- (BlastDoorCombinedPluginAttachment)init
{
  BlastDoorCombinedPluginAttachment *result;

  result = (BlastDoorCombinedPluginAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment, (uint64_t (*)(_QWORD))type metadata accessor for CombinedPluginAttachment);
}

@end

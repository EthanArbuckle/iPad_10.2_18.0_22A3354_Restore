@implementation BlastDoorFileTransferAttribute

- (NSArray)attachments
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for _ObjCFileTransferAttribute_AttachmentInfoWrapper(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B990();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAttachments:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for _ObjCFileTransferAttribute_AttachmentInfoWrapper(0);
  v4 = sub_1AD63B9B4();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_attachments);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BlastDoorFileTransferAttribute_ImageInfo)imageInfo
{
  return (BlastDoorFileTransferAttribute_ImageInfo *)sub_1AD5ACC0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_imageInfo);
}

- (void)setImageInfo:(id)a3
{
  sub_1AD5ACCA8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BlastDoorFileTransferAttribute_imageInfo);
}

- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)attachmentSubtype
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorFileTransferAttribute_attachmentSubtype);
  swift_beginAccess();
  return (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)*v2;
}

- (void)setAttachmentSubtype:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BlastDoorFileTransferAttribute_attachmentSubtype);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)name
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1AD63B768();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_name);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (unint64_t)datasize
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_datasize);
  swift_beginAccess();
  return *v2;
}

- (void)setDatasize:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_datasize);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)utiType
{
  return (NSString *)sub_1AD5AC9A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_utiType);
}

- (void)setUtiType:(id)a3
{
  sub_1AD5ACA7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BlastDoorFileTransferAttribute_utiType);
}

- (NSString)mimeType
{
  return (NSString *)sub_1AD5AC9A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_mimeType);
}

- (void)setMimeType:(id)a3
{
  sub_1AD5ACA7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BlastDoorFileTransferAttribute_mimeType);
}

- (NSNumber)legacyAnimoji
{
  return (NSNumber *)sub_1AD5ACC0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_legacyAnimoji);
}

- (void)setLegacyAnimoji:(id)a3
{
  sub_1AD5ACCA8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BlastDoorFileTransferAttribute_legacyAnimoji);
}

- (NSString)description
{
  BlastDoorFileTransferAttribute *v2;
  void *v3;

  v2 = self;
  sub_1AD5AD2B4();

  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BlastDoorFileTransferAttribute)init
{
  BlastDoorFileTransferAttribute *result;

  result = (BlastDoorFileTransferAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end

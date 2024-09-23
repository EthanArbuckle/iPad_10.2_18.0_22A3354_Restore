@implementation IMPurgedAttachmentHandler

- (IMPurgedAttachmentHandlerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___IMPurgedAttachmentHandler_delegate;
  swift_beginAccess();
  return (IMPurgedAttachmentHandlerDelegate *)(id)MEMORY[0x1D17EB154](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (IMPurgedAttachmentHandler)initWithBatchSize:(int64_t)a3
{
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_currentBatch) = 0;
  v5 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_attachmentPaths) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_successfullyDeletedLivePhotoComponents) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_livePhotoComponentDeletionFailures) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_livePhotoBundleOrComponentPaths) = v5;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_batchSize) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)IMPurgedAttachmentHandler;
  return -[IMPurgedAttachmentHandler init](&v7, sel_init);
}

- (void)registerPurgedAttachmentAtPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  IMPurgedAttachmentHandler *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = sub_1D166DACC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  IMPurgedAttachmentHandler.registerPurgedAttachment(at:)(v8);

  swift_bridgeObjectRelease();
}

- (void)complete
{
  IMPurgedAttachmentHandler *v2;

  v2 = self;
  sub_1D160B554();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_currentBatch) = 0;

}

- (IMPurgedAttachmentHandler)init
{
  IMPurgedAttachmentHandler *result;

  result = (IMPurgedAttachmentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D160F040((uint64_t)self + OBJC_IVAR___IMPurgedAttachmentHandler_delegate);
}

@end

@implementation VisionPrescriptionViewAttachmentItem

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  unint64_t v3;
  id v5;
  int64_t v6;

  v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21VisionHealthAppPlugin36VisionPrescriptionViewAttachmentItem_attachments);
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  v6 = sub_2322B9368();

  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  swift_retain();
  v6 = sub_232261528(a4);

  swift_release();
  return v6;
}

@end

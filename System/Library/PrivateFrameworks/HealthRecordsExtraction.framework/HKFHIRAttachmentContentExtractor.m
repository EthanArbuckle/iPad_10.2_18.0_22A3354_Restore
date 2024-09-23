@implementation HKFHIRAttachmentContentExtractor

- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4
{
  id v5;
  HKFHIRAttachmentContentExtractor *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_224F23FA4(v5);

  return v7;
}

- (HKFHIRAttachmentContentExtractor)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKFHIRAttachmentContentExtractor____lazy_storage___decoder) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FHIRAttachmentContentExtractor();
  return -[HKFHIRAttachmentContentExtractor init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

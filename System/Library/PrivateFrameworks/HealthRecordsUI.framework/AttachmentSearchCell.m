@implementation AttachmentSearchCell

- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI20AttachmentSearchCell *)AttachmentSearchCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC5D9664();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___previewLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___titleLabelBottomConstraint));
  swift_bridgeObjectRelease();
  sub_1BC3801D0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell_item, (uint64_t)&qword_1EF43AE70, (uint64_t)&qword_1EF42ADC0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1BC3A9C44);
}

@end

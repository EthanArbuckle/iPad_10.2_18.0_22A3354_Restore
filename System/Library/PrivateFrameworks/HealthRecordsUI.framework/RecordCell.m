@implementation RecordCell

- (_TtC15HealthRecordsUI10RecordCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI10RecordCell *)sub_1BC435820(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI10RecordCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI10RecordCell *)sub_1BC4359D0(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RecordCell();
  v2 = v3.receiver;
  -[RecordCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC435BAC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_rangeValueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_multiValueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_subtitleToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_rangeValueViewToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_multiValueViewToBottomConstraint));
  sub_1BC3DF8C4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_item, (unint64_t *)&qword_1EF43AE70, (unint64_t *)&qword_1EF42ADC0);
}

@end

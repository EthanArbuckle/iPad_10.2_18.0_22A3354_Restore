@implementation RecordReferenceRangeCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HKInspectableValueInRange)valueInRange
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange);
  swift_beginAccess();
  return (HKInspectableValueInRange *)*v2;
}

- (void)setValueInRange:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC15HealthRecordsUI24RecordReferenceRangeCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1BC615B5C();
}

- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI24RecordReferenceRangeCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordReferenceRangeCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI24RecordReferenceRangeCell)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI24RecordReferenceRangeCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange) = 0;
  v4 = a3;

  result = (_TtC15HealthRecordsUI24RecordReferenceRangeCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_expandedRangeValueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24RecordReferenceRangeCell_valueInRange));
}

@end

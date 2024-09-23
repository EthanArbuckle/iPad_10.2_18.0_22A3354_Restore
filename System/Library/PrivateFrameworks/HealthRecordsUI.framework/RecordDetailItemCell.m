@implementation RecordDetailItemCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_titleLabel));
}

- (UILabel)bodyLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_bodyLabel));
}

- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI20RecordDetailItemCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordDetailItemCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC617E54();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_bodyLabel));
}

@end

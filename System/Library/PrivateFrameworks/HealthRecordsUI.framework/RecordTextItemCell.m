@implementation RecordTextItemCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI18RecordTextItemCell_titleLabel));
}

- (_TtC15HealthRecordsUI18RecordTextItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI18RecordTextItemCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordTextItemCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI18RecordTextItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC61816C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI18RecordTextItemCell_titleLabel));
}

@end

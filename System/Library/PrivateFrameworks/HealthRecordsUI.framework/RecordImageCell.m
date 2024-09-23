@implementation RecordImageCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (UIImageView)recordImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView));
}

- (_TtC15HealthRecordsUI15RecordImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI15RecordImageCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordImageCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI15RecordImageCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC15HealthRecordsUI15RecordImageCell *result;

  v5 = OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC15HealthRecordsUI15RecordImageCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView));
}

@end

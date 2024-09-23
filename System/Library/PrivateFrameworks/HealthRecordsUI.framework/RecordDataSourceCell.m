@implementation RecordDataSourceCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI20RecordDataSourceCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordDataSourceCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithCoder:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  _TtC15HealthRecordsUI20RecordDataSourceCell *result;

  v5 = OBJC_IVAR____TtC15HealthRecordsUI20RecordDataSourceCell_brandView;
  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v10 = objc_allocWithZone((Class)WDMedicalRecordBrandView);
  v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v10, sel_initWithFrame_, v6, v7, v8, v9);

  result = (_TtC15HealthRecordsUI20RecordDataSourceCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)configCellWith:(id)a3 owner:(id)a4 dataProvider:(id)a5
{
  sub_1BC6163B8(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, void *, void *))sub_1BC6162B8);
}

- (void)configCellWith:(id)a3 subject:(id)a4 dataProvider:(id)a5
{
  sub_1BC6163B8(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, void *, void *))sub_1BC6162D0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20RecordDataSourceCell_brandView));
}

@end

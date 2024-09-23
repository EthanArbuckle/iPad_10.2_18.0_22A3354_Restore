@implementation UDCRecordsTableViewController

- (_TtC15HealthRecordsUI29UDCRecordsTableViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI29UDCRecordsTableViewController *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_preferredSegment) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_additionalPredicate) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController____lazy_storage___modePicker) = 0;
  v4 = a3;

  result = (_TtC15HealthRecordsUI29UDCRecordsTableViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)modePickerDidChange:(id)a3
{
  _TtC15HealthRecordsUI29UDCRecordsTableViewController *v4;
  _TtC15HealthRecordsUI29UDCRecordsTableViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1BC3EB34C();

  sub_1BC39BD2C((uint64_t)v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_additionalPredicate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController____lazy_storage___modePicker));
}

@end

@implementation QLItemSingleDataProvider

- (id)provideDataForItem:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data);
  v4 = *(_QWORD *)&self->data[OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data];
  sub_1BC35D4EC(v3, v4);
  v5 = (void *)sub_1BC62A628();
  sub_1BC35D530(v3, v4);
  return v5;
}

- (_TtC15HealthRecordsUI24QLItemSingleDataProvider)init
{
  _TtC15HealthRecordsUI24QLItemSingleDataProvider *result;

  result = (_TtC15HealthRecordsUI24QLItemSingleDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC35D530(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC15HealthRecordsUI24QLItemSingleDataProvider_data]);
}

@end

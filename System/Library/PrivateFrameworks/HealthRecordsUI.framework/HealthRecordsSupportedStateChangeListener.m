@implementation HealthRecordsSupportedStateChangeListener

- (void)healthRecordsStore:(id)a3 healthRecordsSupportedDidChangeTo:(BOOL)a4
{
  _BOOL4 v4;
  _TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = self;
  sub_1BC584904(v7, v4);

}

- (_TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener)init
{
  _TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener *result;

  result = (_TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41HealthRecordsSupportedStateChangeListener__latestChange;
  sub_1BC584554(0, (unint64_t *)&unk_1ED6A5398, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

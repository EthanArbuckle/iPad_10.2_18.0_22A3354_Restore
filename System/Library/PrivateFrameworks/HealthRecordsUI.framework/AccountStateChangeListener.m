@implementation AccountStateChangeListener

- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5
{
  id v8;
  _TtC15HealthRecordsUI26AccountStateChangeListener *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = self;
  sub_1BC4FA6D0(v10, v8, a5);

}

- (_TtC15HealthRecordsUI26AccountStateChangeListener)init
{
  _TtC15HealthRecordsUI26AccountStateChangeListener *result;

  result = (_TtC15HealthRecordsUI26AccountStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI26AccountStateChangeListener__latestChange;
  sub_1BC4FA418(0, &qword_1ED6A53A8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
}

@end

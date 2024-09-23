@implementation DownloadableAttachmentStateChangeListener

- (void)downloadableAttachmentDidChangeState:(id)a3
{
  _TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1BC4D06B4(v5);

}

- (_TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener)init
{
  _TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener *result;

  result = (_TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener__latestChange;
  sub_1BC357158(0, (unint64_t *)&unk_1EF43B680, (uint64_t (*)(uint64_t))sub_1BC4D00DC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end

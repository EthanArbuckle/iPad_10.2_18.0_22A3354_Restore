@implementation ShareFileActivityItemSource

- (void)dealloc
{
  _TtC18HealthExperienceUI27ShareFileActivityItemSource *v2;

  v2 = self;
  ShareFileActivityItemSource.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL;
  v3 = sub_1A9A91F18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = sub_1A9A91F18();
  MEMORY[0x1E0C80A78](v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL, v4);
  return (id)sub_1A9A96BF8();
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = sub_1A9A91F18();
  MEMORY[0x1E0C80A78](v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL, v5);
  return (id)sub_1A9A96BF8();
}

- (_TtC18HealthExperienceUI27ShareFileActivityItemSource)init
{
  _TtC18HealthExperienceUI27ShareFileActivityItemSource *result;

  result = (_TtC18HealthExperienceUI27ShareFileActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

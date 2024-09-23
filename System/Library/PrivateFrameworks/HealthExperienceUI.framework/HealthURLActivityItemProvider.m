@implementation HealthURLActivityItemProvider

- (id)item
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = sub_1A9A91F18();
  MEMORY[0x1E0C80A78](v3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_url, v3);
  return (id)sub_1A9A96BF8();
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI29HealthURLActivityItemProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A96A8544();

  return v6;
}

- (_TtC18HealthExperienceUI29HealthURLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC18HealthExperienceUI29HealthURLActivityItemProvider *result;

  swift_unknownObjectRetain();
  sub_1A9A96670();
  swift_unknownObjectRelease();
  result = (_TtC18HealthExperienceUI29HealthURLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_url;
  v4 = sub_1A9A91F18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_thumbnailImage));
  swift_bridgeObjectRelease();
}

@end

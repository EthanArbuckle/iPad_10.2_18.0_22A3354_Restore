@implementation RecommendationAnalytics

- (_TtC21CloudRecommendationUI23RecommendationAnalytics)initWithAccount:(id)a3
{
  id v3;
  _TtC21CloudRecommendationUI23RecommendationAnalytics *v4;

  v3 = a3;
  v4 = (_TtC21CloudRecommendationUI23RecommendationAnalytics *)sub_238152F98(v3);

  return v4;
}

- (void)sendRecommendedForYouTapEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC21CloudRecommendationUI23RecommendationAnalytics *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DD030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = sub_23811C1DC(MEMORY[0x24BEE4AF8]);
  sub_23818A29C();
  v8 = sub_23818A2C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = v9;
  *(_QWORD *)(v10 + 40) = v7;
  *(_BYTE *)(v10 + 48) = 4;
  swift_bridgeObjectRetain();
  sub_238151E54((uint64_t)v5, (uint64_t)&unk_2568DF1C8, v10);
  swift_release();
  sub_238153160((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)sendiCloudSettingsDisplayedEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC21CloudRecommendationUI23RecommendationAnalytics *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DD030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = sub_23811C1DC(MEMORY[0x24BEE4AF8]);
  sub_23818A29C();
  v8 = sub_23818A2C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = v9;
  *(_QWORD *)(v10 + 40) = v7;
  *(_BYTE *)(v10 + 48) = 10;
  swift_bridgeObjectRetain();
  sub_238151E54((uint64_t)v5, (uint64_t)&unk_2568DF1C0, v10);
  swift_release();
  sub_238153160((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)sendManageStorageDisplayedEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC21CloudRecommendationUI23RecommendationAnalytics *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DD030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = sub_23811C1DC(MEMORY[0x24BEE4AF8]);
  sub_23818A29C();
  v8 = sub_23818A2C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = v9;
  *(_QWORD *)(v10 + 40) = v7;
  *(_BYTE *)(v10 + 48) = 11;
  swift_bridgeObjectRetain();
  sub_238151E54((uint64_t)v5, (uint64_t)&unk_2568DF1B8, v10);
  swift_release();
  sub_238153160((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC21CloudRecommendationUI23RecommendationAnalytics)init
{
  _TtC21CloudRecommendationUI23RecommendationAnalytics *result;

  result = (_TtC21CloudRecommendationUI23RecommendationAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23RecommendationAnalytics_account));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23RecommendationAnalytics_storageDataController));
  swift_release();
}

@end

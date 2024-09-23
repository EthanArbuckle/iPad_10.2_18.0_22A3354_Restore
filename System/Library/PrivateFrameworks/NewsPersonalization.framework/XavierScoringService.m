@implementation XavierScoringService

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unsigned int *v16;
  _TtC19NewsPersonalization20XavierScoringService *v17;
  uint64_t v18;
  id v19;
  _BYTE v21[16];
  int64_t v22;

  v8 = sub_1D5D1EC44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D5B54DF0(0, (unint64_t *)&qword_1ED9C0BB0);
  v12 = sub_1D5D1EF80();
  sub_1D5B4E178();
  v14 = &v11[*(int *)(v13 + 48)];
  sub_1D5B67B10(a5, (uint64_t)v11);
  v15 = sub_1D5D1EC50();
  v16 = (unsigned int *)MEMORY[0x1E0D5BD68];
  if (a5 != 3)
    v16 = (unsigned int *)MEMORY[0x1E0D5BD78];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v14, *v16, v15);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0D5AF90], v8);
  v17 = self;
  XavierScoringService.score(items:context:)(v12, (uint64_t)v11);
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  v22 = a4;
  sub_1D5D1EBA8();
  v18 = sub_1D5D1EFA4();
  swift_bridgeObjectRelease();
  v19 = sub_1D5B57B88(v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

- (id)rankTagIDsDescending:(id)a3
{
  unint64_t v4;
  _TtC19NewsPersonalization20XavierScoringService *v5;
  void *v6;
  id result;
  uint64_t v8;

  if (a3)
  {
    v4 = sub_1D5D1EF80();
    v5 = self;
    v8 = XavierScoringService.score(tags:)(v4);
    swift_bridgeObjectRetain();
    sub_1D5B4EBF4(&v8, (uint64_t (*)(_QWORD))MEMORY[0x1E0D5D388], (uint64_t (*)(uint64_t))sub_1D5B664D8, sub_1D5B4ECE0);
    swift_bridgeObjectRelease();
    sub_1D5CD47A0(v8);

    swift_bridgeObjectRelease();
    swift_release();
    v6 = (void *)sub_1D5D1EF68();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
    result = (id)swift_release();
    __break(1u);
  }
  return result;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC19NewsPersonalization20XavierScoringService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  XavierScoringService.prepareForUse(completionHandler:)((uint64_t)sub_1D5B54D64, v5);

  swift_release();
}

- (_TtC19NewsPersonalization20XavierScoringService)init
{
  _TtC19NewsPersonalization20XavierScoringService *result;

  result = (_TtC19NewsPersonalization20XavierScoringService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_aggregateStore));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_userContextProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_userEmbeddingProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_tabiUserEventHistoryScoringService));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_configurationManager);
  swift_release();
}

- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC19NewsPersonalization20XavierScoringService *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  sub_1D5CDECF8((uint64_t)a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  unint64_t v4;
  _TtC19NewsPersonalization20XavierScoringService *v5;
  void *v6;

  sub_1D5B54DF0(0, (unint64_t *)&qword_1ED9C0BB0);
  v4 = sub_1D5D1EF80();
  v5 = self;
  XavierScoringService.limitItems(byMinimumItemQuality:)(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1D5D1EF68();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  void *v5;

  sub_1D5B54DF0(0, (unint64_t *)&qword_1ED9C0BB0);
  sub_1D5D1EF80();
  v5 = (void *)sub_1D5D1EF68();
  swift_bridgeObjectRelease();
  return v5;
}

- (double)decayedPublisherDiversificationPenalty
{
  _TtC19NewsPersonalization20XavierScoringService *v2;
  double v3;

  v2 = self;
  v3 = XavierScoringService.decayedPublisherDiversificationPenalty()();

  return v3;
}

- (id)scoresForTagIDs:(id)a3
{
  void *v4;
  _TtC19NewsPersonalization20XavierScoringService *v5;
  unint64_t v6;
  void *v7;
  Swift::OpaquePointer_optional v9;

  if (a3)
    v4 = (void *)sub_1D5D1EF80();
  else
    v4 = 0;
  v5 = self;
  v9.value._rawValue = v4;
  v6 = (unint64_t)XavierScoringService.scores(forTagIDs:)(v9);

  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_1D5B4F74C(0, (unint64_t *)&qword_1ED9C0CE0);
    v7 = (void *)sub_1D5D1EDE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end

@implementation SummariesElectrocardiogramListDataProvider

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  _TtC5Heart42SummariesElectrocardiogramListDataProvider *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider____lazy_storage___dataFetcher) = 0;
  v6 = a3;
  v7 = a4;

  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)sub_231414EE4();
  __break(1u);
  return result;
}

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC5Heart42SummariesElectrocardiogramListDataProvider *v15;
  char *v16;
  void (**v17)(void *, uint64_t);
  uint64_t v18;
  id v19;

  v11 = _Block_copy(a7);
  if (a6)
  {
    sub_2312D3C68(0, (unint64_t *)&qword_255ECE920);
    sub_2314147A0();
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = (char *)sub_23139E874();
  v17 = (void (**)(void *, uint64_t))&v16[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_resultsHandler];
  v18 = *(_QWORD *)&v16[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_resultsHandler];
  *v17 = sub_23136459C;
  v17[1] = (void (*)(void *, uint64_t))v12;
  swift_retain();
  sub_23130E320(v18);

  v19 = sub_23139E874();
  swift_bridgeObjectRelease();
  swift_release();
  return v19;
}

- (id)activeECGAlgorithmVersion
{
  _TtC5Heart42SummariesElectrocardiogramListDataProvider *v2;
  _BYTE *v3;
  char v4;
  void *v5;

  v2 = self;
  v3 = sub_23139E874();
  v4 = v3[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_activeAlgorithmVersion + 8];

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    sub_2312D3C68(0, (unint64_t *)&qword_255ECFBD0);
    v5 = (void *)sub_231414BF0();
  }

  return v5;
}

- (BOOL)hasCompleteDataSet
{
  return 1;
}

- (BOOL)calendarDateSelectorVisible
{
  return 0;
}

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6;
  id v7;
  _TtC5Heart42SummariesElectrocardiogramListDataProvider *result;

  v6 = a3;
  v7 = a4;
  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)init
{
  _TtC5Heart42SummariesElectrocardiogramListDataProvider *result;

  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider_store));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider____lazy_storage___dataFetcher));
}

@end

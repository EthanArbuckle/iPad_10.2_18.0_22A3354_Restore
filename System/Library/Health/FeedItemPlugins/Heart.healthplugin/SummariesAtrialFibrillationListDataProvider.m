@implementation SummariesAtrialFibrillationListDataProvider

- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  char *v7;
  objc_class *v8;
  objc_super v10;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_store) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_healthExperienceStore;
  v8 = (objc_class *)type metadata accessor for SummariesAtrialFibrillationListDataProvider();
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[WDSampleListDataProvider initWithDisplayType:profile:](&v10, sel_initWithDisplayType_profile_, a3, a4);
}

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC5Heart43SummariesAtrialFibrillationListDataProvider *v15;
  id v16;

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
  v16 = sub_2313645A4((uint64_t)sub_23136459C, v12);

  swift_bridgeObjectRelease();
  swift_release();
  return v16;
}

- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)init
{
  _TtC5Heart43SummariesAtrialFibrillationListDataProvider *result;

  result = (_TtC5Heart43SummariesAtrialFibrillationListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_store));
  sub_2312D6B98((uint64_t)self + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_healthExperienceStore, &qword_255ECC210, (uint64_t (*)(uint64_t))sub_23130ABBC);
}

@end

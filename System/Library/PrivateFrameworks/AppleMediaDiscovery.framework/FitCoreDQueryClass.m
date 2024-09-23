@implementation FitCoreDQueryClass

- (NSDictionary)tableUpdateSummary
{
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v2;
  id v5;

  v2 = self;
  sub_1DC74E548();

  v5 = (id)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v5;
}

- (void)setTableUpdateSummary:(id)a3
{
  id v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1DC76F3F8();
  sub_1DC74E620(v6);

}

- (NSArray)allFitnessTables
{
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v2;
  id v5;

  v2 = self;
  sub_1DC74E794();

  v5 = (id)sub_1DC76F4F4();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (void)setAllFitnessTables:(id)a3
{
  id v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1DC76F500();
  sub_1DC74E858(v6);

}

- (void)filterFitcoreDCatalogWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  NSDictionary *v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_1DC74D468((uint64_t)&unk_1F039AA70, (uint64_t)v6);
}

- (void)queryWorkoutReferencesWithWorkoutQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  NSDictionary *v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_1DC74D468((uint64_t)&unk_1F039AAA0, (uint64_t)v6);
}

- (void)filterFitcoreDCatalogDebugWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  NSDictionary *v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_1DC74D468((uint64_t)&unk_1F039AAB8, (uint64_t)v6);
}

- (void)fetchCatalogMetadataWithCompletionHandler:(id)a3
{
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v3;
  uint64_t v4;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = self;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = self;
  sub_1DC74D468((uint64_t)&unk_1F039AAE0, v4);
}

- (void)runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  NSDictionary *v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_1DC74D468((uint64_t)&unk_1F039AAF8, (uint64_t)v6);
}

- (BOOL)persistFitnessDataWithFitnessTablesData:(id)a3 error:(id *)a4
{
  id v5;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v6;
  uint64_t v10;

  v5 = a3;
  v6 = self;
  v10 = sub_1DC76F3F8();
  sub_1DC75AC60(v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC19AppleMediaDiscovery18FitCoreDQueryClass)init
{
  return (_TtC19AppleMediaDiscovery18FitCoreDQueryClass *)FitCoreDQueryClass.init()();
}

- (void).cxx_destruct
{
  sub_1DC75A0B4();
  sub_1DC752198();
}

@end

@implementation InternalXPC.Server

- (void)behaviorUnderstandingStatusWithCompletion:(id)a3
{
  sub_1C0B89AF4(self, (int)a2, a3, (void (*)(void))sub_1C0B7A6DC);
}

- (void)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 completion:(id)a5
{
  sub_1C0B7D110(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, id, void *))sub_1C0B7B3E0);
}

- (void)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 completion:(id)a5
{
  sub_1C0B7D110(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, id, void *))sub_1C0B7C198);
}

- (void)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 completion:(id)a4
{
  sub_1C0B885C8(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C0B7D188);
}

- (void)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 completion:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v19;
  uint64_t v20;

  v8 = sub_1C106ADE0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  v13 = sub_1C106FB14();
  v15 = v14;
  v16 = sub_1C106FB14();
  v18 = v17;
  sub_1C106AD98();
  _Block_copy(v12);
  v19 = self;
  sub_1C0B7E484(v13, v15, v16, v18, (uint64_t)v11, (uint64_t)v19, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  _Block_release(v12);
}

- (void)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v17;

  v8 = _Block_copy(a6);
  v9 = sub_1C106FB14();
  v11 = v10;
  v12 = sub_1C106FB14();
  v14 = v13;
  if (a5)
  {
    v15 = sub_1C106FB14();
    a5 = v16;
  }
  else
  {
    v15 = 0;
  }
  _Block_copy(v8);
  v17 = self;
  sub_1C0B80238(v9, v11, v12, v14, v15, (uint64_t)a5, (uint64_t)v17, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v13;

  v6 = _Block_copy(a5);
  v7 = sub_1C106FB14();
  v9 = v8;
  v10 = sub_1C106FB14();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1C0B819B0(v7, v9, v10, v12, (uint64_t)v13, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(uint64_t *);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v19;
  void (*v20)(void (**)(uint64_t *), uint64_t);
  uint64_t v21;

  v8 = a6;
  v11 = sub_1C106ADE0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (void (**)(uint64_t *))((char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v21 - v16;
  v18 = _Block_copy(a7);
  sub_1C106AD98();
  sub_1C106AD98();
  _Block_copy(v18);
  v19 = self;
  sub_1C0B831EC((uint64_t)v17, v14, a5, v8, (uint64_t)v19, v18);

  v20 = *(void (**)(void (**)(uint64_t *), uint64_t))(v12 + 8);
  v20(v14, v11);
  v20((void (**)(uint64_t *))v17, v11);
  _Block_release(v18);
}

- (void)behaviorUnderstandingEvaluateForBehaviorType:(NSString *)a3 queryName:(NSString *)a4 inferenceServiceInstanceId:(NSString *)a5 completion:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640958, (uint64_t)v11);
}

- (void)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v9;

  v5 = _Block_copy(a4);
  v6 = sub_1C106FB14();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1C0B85CE8(v6, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithCompletion:(id)a3
{
  sub_1C0B89AF4(self, (int)a2, a3, (void (*)(void))sub_1C0B869AC);
}

- (void)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 completion:(id)a4
{
  sub_1C0B885C8(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1C0B87400);
}

- (void)behaviorUnderstandingMockEntityRelevanceContextWithDate:(NSDate *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSDate *v8;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640948, (uint64_t)v7);
}

- (void)behaviorUnderstandingShowEntityTaggingInjectedTagsWithCompletion:(id)a3
{
  sub_1C0B89AF4(self, (int)a2, a3, (void (*)(void))sub_1C0B88C14);
}

- (void)behaviorUnderstandingClearEntityTaggingInjectedTagsWithCompletion:(id)a3
{
  sub_1C0B89AF4(self, (int)a2, a3, (void (*)(void))sub_1C0B893D8);
}

- (void)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v15;

  v8 = _Block_copy(a6);
  v9 = sub_1C106FB14();
  v11 = v10;
  v12 = sub_1C106FB14();
  v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_1C0B89B50(v9, v11, v12, v14, a5, (uint64_t)v15, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)contextDataForSource:(NSString *)a3 startDate:(NSDate *)a4 endDate:(NSDate *)a5 completion:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSString *v12;
  NSDate *v13;
  NSDate *v14;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640A88, (uint64_t)v11);
}

- (void)vectorSearchBenchmarkWithConfigFilePath:(NSString *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640F40, (uint64_t)v7);
}

- (void)resolveEntityWithRequest:(GDEntityResolutionRequest *)a3 enableSessionLogging:(BOOL)a4 configName:(NSString *)a5 encodedConfig:(NSString *)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  GDEntityResolutionRequest *v14;
  NSString *v15;
  NSString *v16;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v17;

  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = a5;
  *(_QWORD *)(v13 + 40) = a6;
  *(_QWORD *)(v13 + 48) = v12;
  *(_QWORD *)(v13 + 56) = self;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF640FC8, v13);
}

- (void)generateActivityCentricLifeEventsFromStartDate:(NSDate *)a3 toEndDate:(NSDate *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSDate *v10;
  NSDate *v11;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF641198, (uint64_t)v9);
}

- (void)viewInfoWithViewQuery:(GDViewQuery *)a3 rows:(NSNumber *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  GDViewQuery *v10;
  NSNumber *v11;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF641268, (uint64_t)v9);
}

- (void)viewSqlWithName:(NSString *)a3 statement:(NSString *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSString *v11;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF641258, (uint64_t)v9);
}

- (void)featureKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF641240, v5);
}

- (void)statusWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BA4CEC);
}

- (void)clearStatusWithCompletion:(id)a3
{
  sub_1C0BACD80(self, (int)a2, a3, (uint64_t)&unk_1E7A21990, (uint64_t)&unk_1EF6413D0);
}

- (void)statsWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BA5D9C);
}

- (void)triplesQueryWithQuery:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v7;

  v5 = _Block_copy(a4);
  v6 = sub_1C106F940();
  _Block_copy(v5);
  v7 = self;
  sub_1C0BA6720(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)benchmarkWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BAB2E4);
}

- (void)validateGraphWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BAB6C4);
}

- (_TtCC24IntelligencePlatformCore11InternalXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore11InternalXPC6Server *)InternalXPC.Server.init()();
}

- (void)runDeltaUpdatePipelineWithSource:(NSString *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  _TtCC24IntelligencePlatformCore11InternalXPC6Server *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF6413B8, (uint64_t)v7);
}

- (void)runToMatchingPipelineWithCompletion:(id)a3
{
  sub_1C0BACD80(self, (int)a2, a3, (uint64_t)&unk_1E7A218F0, (uint64_t)&unk_1EF6413A8);
}

- (void)stopPipelineWithCompletion:(id)a3
{
  sub_1C0BACD80(self, (int)a2, a3, (uint64_t)&unk_1E7A218C8, (uint64_t)&unk_1EF641398);
}

@end

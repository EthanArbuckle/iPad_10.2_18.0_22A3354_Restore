@implementation SNKShotFeaturizer

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17[4];

  v8 = sub_1D4519BC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  sub_1D451A92C();
  sub_1D4519B7C();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a5;
  static SNKShotFeaturizer.featurizeFiles(_:hallucinatorModelURL:queue:completionHandler:)((uint64_t)v14, (uint64_t)sub_1D42CA4E4, v13, v17);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_1D42B5528(v17, v17[3]);
  v15 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v17);
  return v15;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v21[4];

  v10 = sub_1D4519BC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = _Block_copy(a7);
  sub_1D451A92C();
  sub_1D4519B7C();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = a5;
  static SNKShotFeaturizer.featurizeFiles(_:hallucinatorModelURL:queue:resultHandler:completionHandler:)((uint64_t)v18, (uint64_t)sub_1D42CA4D4, v16, (uint64_t)sub_1D42CAF1C, v17, v21);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_1D42B5528(v21, v21[3]);
  v19 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v21);
  return v19;
}

+ (id)performSegmentationRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)static SNKShotFeaturizer.performSegmentationRequest(_:)((uint64_t)v4);

  return v5;
}

- (SNKShotFeaturizer)init
{
  SNKShotFeaturizer *result;

  SNKShotFeaturizer.init()();
  return result;
}

@end

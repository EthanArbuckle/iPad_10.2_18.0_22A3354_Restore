@implementation GDVUVisualUnderstandingService

- (GDVUGallery)gallery
{
  GDVUVisualUnderstandingService *v2;
  void *v3;
  void *v4;

  v2 = self;
  GDVUVisualUnderstandingService.gallery.getter((uint64_t)v2);
  v4 = v3;

  return (GDVUGallery *)v4;
}

- (GDVUVisualUnderstandingService)initWithClient:(id)a3 version:(int64_t)a4 url:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  GDVUVisualUnderstandingService *result;
  uint64_t v15;

  v8 = sub_1AE501548((uint64_t *)&unk_1ED31C9C0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1AE924744();
    v11 = sub_1AE924780();
    v12 = 0;
  }
  else
  {
    v11 = sub_1AE924780();
    v12 = 1;
  }
  _s20IntelligencePlatform17UnstructuredImageV5AssetOwst_0((uint64_t)v10, v12, 1, v11);
  v13 = a3;
  GDVUVisualUnderstandingService.init(client:version:url:)();
  return result;
}

- (id)recognizeIn:(id)a3 contextMoment:(int64_t)a4 error:(id *)a5
{
  id v6;
  GDVUVisualUnderstandingService *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = self;
  GDVUVisualUnderstandingService.recognize(in:contextMoment:)();

  type metadata accessor for GDVURecognitionResult(v8);
  v9 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)recognizeIn:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  GDVUVisualUnderstandingService *v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  GDVUVisualUnderstandingService.recognize(in:context:)();

  type metadata accessor for GDVURecognitionResult(v10);
  v11 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)entitiesFor:(id)a3 error:(id *)a4 body:(id)a5
{
  void *v7;
  GDVUVisualUnderstandingService *v8;
  void *v9;
  void *v10;

  v7 = _Block_copy(a5);
  if (a3)
  {
    sub_1AE524254(0, &qword_1EED94D28);
    a3 = (id)sub_1AE9261CC();
  }
  _Block_copy(v7);
  v8 = self;
  sub_1AE8D571C((unint64_t)a3, (uint64_t)v8, v7);
  v10 = v9;

  _Block_release(v7);
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)keyObservationFor:(id)a3 output:(int64_t *)a4 error:(id *)a5
{
  id v7;
  GDVUVisualUnderstandingService *v8;

  v7 = a3;
  v8 = self;
  GDVUVisualUnderstandingService.keyObservation(for:output:)(v7, a4);

  return 1;
}

- (BOOL)similarityWithBetween:(id)a3 and:(id)a4 output:(double *)a5 error:(id *)a6
{
  id v9;
  id v10;
  GDVUVisualUnderstandingService *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  GDVUVisualUnderstandingService.similarity(withBetween:and:output:)(v9, v10, a5);

  return 1;
}

- (BOOL)similarEntitiesTo:(id)a3 error:(id *)a4 body:(id)a5
{
  void *v7;
  id v8;
  GDVUVisualUnderstandingService *v9;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  v8 = a3;
  v9 = self;
  sub_1AE8D64E4(v8, (uint64_t)v9, (uint64_t (**)(_QWORD, _QWORD))v7);

  _Block_release(v7);
  return 1;
}

- (id)changesSince:(id)a3 error:(id *)a4 body:(id)a5
{
  void *v7;
  id v8;
  GDVUVisualUnderstandingService *v9;
  void *v10;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  v8 = a3;
  v9 = self;
  v10 = (void *)sub_1AE8D6794((uint64_t)v8, (uint64_t)v9, (uint64_t (**)(_QWORD, _QWORD))v7);

  _Block_release(v7);
  return v10;
}

- (id)inferredDeviceOwner
{
  GDVUVisualUnderstandingService *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AE8D6E9C();
  v4 = v3;

  return v4;
}

- (id)inferredDeviceOwnerWithIgnoreMeGroundTruth:(BOOL)a3
{
  GDVUVisualUnderstandingService *v3;
  void *v4;
  void *v5;

  v3 = self;
  sub_1AE8D6FB4();
  v5 = v4;

  return v5;
}

- (GDVUVisualUnderstandingService)init
{
  GDVUVisualUnderstandingService.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end

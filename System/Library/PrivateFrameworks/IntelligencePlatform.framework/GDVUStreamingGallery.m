@implementation GDVUStreamingGallery

- (GDVUStreamingGallery)initWithClient:(id)a3 error:(id *)a4
{
  GDVUStreamingGallery *result;

  sub_1AE8D9F00(a3);
  return result;
}

- (BOOL)resetAndReturnError:(id *)a3
{
  return sub_1AE8DA060(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))GDVUStreamingGallery.reset());
}

- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 error:(id *)a4
{
  GDVUStreamingGallery *v5;
  uint64_t v6;
  void *v7;

  v5 = self;
  GDVUStreamingGallery.update(withMaxKeyFacesPerCluster:)(a3);

  type metadata accessor for GDVUClusterResult(v6);
  v7 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 sortBy:(id)a4 error:(id *)a5
{
  GDVUStreamingGallery *v6;
  uint64_t v7;
  void *v8;

  sub_1AE9261CC();
  v6 = self;
  GDVUStreamingGallery.update(withMaxKeyFacesPerCluster:sortBy:)();
  swift_bridgeObjectRelease();

  type metadata accessor for GDVUClusterResult(v7);
  v8 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)addWithObservations:(id)a3 observationIdentifiers:(id)a4 trackIdentifiers:(id)a5 context:(id)a6 error:(id *)a7
{
  uint64_t v11;
  id v12;
  GDVUStreamingGallery *v13;
  void *v14;

  sub_1AE524254(0, &qword_1EEDA5ED0);
  v11 = sub_1AE9261CC();
  if (a4)
    a4 = (id)sub_1AE9261CC();
  if (a5)
    a5 = (id)sub_1AE9261CC();
  v12 = a6;
  v13 = self;
  GDVUStreamingGallery.add(with:observationIdentifiers:trackIdentifiers:context:)(v11, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v14;
}

- (GDVUStreamingGallery)init
{
  GDVUStreamingGallery.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end

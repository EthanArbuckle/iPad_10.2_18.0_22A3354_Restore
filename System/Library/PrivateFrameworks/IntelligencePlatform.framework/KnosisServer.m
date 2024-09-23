@implementation KnosisServer

+ (id)initWithEntitySubgraphView
{
  id v2;

  static KnosisServer.withEntitySubgraphView()();
  return v2;
}

- (_TtC20IntelligencePlatform12KnosisServer)init
{
  KnosisServer.init()();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1AE4F665C();
  sub_1AE4F9038();
  swift_bridgeObjectRelease();
  sub_1AE4F76D8();
  sub_1AE4F81B8();
  sub_1AE4F665C();
  sub_1AE4F9038();
  swift_bridgeObjectRelease();
  sub_1AE4F6728();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AE4F76D8();
  sub_1AE4F6700();
  sub_1AE4F665C();
  sub_1AE4F9038();
  swift_bridgeObjectRelease();
}

- (id)executeKGQWithRequest:(id)a3
{
  GDKnosisRequest *v4;
  _TtC20IntelligencePlatform12KnosisServer *v5;
  GDKnosisResult *v6;
  void *v7;
  void *v8;

  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeKGQ(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeKGQWithGraphObjectContextWithRequest:(id)a3
{
  GDKnosisRequest *v4;
  _TtC20IntelligencePlatform12KnosisServer *v5;
  GDKnosisResultContext *v6;
  void *v7;
  void *v8;

  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeKGQWithGraphObjectContext(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeIntentsWithRequest:(id)a3
{
  GDKnosisRequest *v4;
  _TtC20IntelligencePlatform12KnosisServer *v5;
  GDKnosisResult *v6;
  void *v7;
  void *v8;

  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeIntents(request:)(v6, v4);
  v8 = v7;

  return v8;
}

- (id)executeIntentsWithGraphObjectContextWithRequest:(id)a3
{
  GDKnosisRequest *v4;
  _TtC20IntelligencePlatform12KnosisServer *v5;
  GDKnosisResultContext *v6;
  void *v7;
  void *v8;

  v4 = (GDKnosisRequest *)a3;
  v5 = self;
  KnosisServer.executeIntentsWithGraphObjectContext(request:)(v6, v4);
  v8 = v7;

  return v8;
}

@end

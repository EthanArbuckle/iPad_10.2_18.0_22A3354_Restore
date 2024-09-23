@implementation PersonRankingService

- (_TtC20IntelligencePlatform20PersonRankingService)initWithConfig:(id)a3
{
  return (_TtC20IntelligencePlatform20PersonRankingService *)PersonRankingService.init(config:)((uint64_t)a3);
}

- (id)rankedPersonsForObjCWithMaxCount:(int64_t)a3 error:(id *)a4
{
  _TtC20IntelligencePlatform20PersonRankingService *v5;
  void *v6;

  v5 = self;
  sub_1AE845F28(a3);

  sub_1AE847AFC();
  v6 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC20IntelligencePlatform20PersonRankingService)init
{
  PersonRankingService.init()();
}

- (void).cxx_destruct
{

}

@end

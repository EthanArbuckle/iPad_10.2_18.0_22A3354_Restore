@implementation GEORouteMatcherScoreInfo

void __36___GEORouteMatcherScoreInfo_ignored__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_GEORouteMatcherScoreInfo infoWithScore:weight:](0.0, 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_302;
  _MergedGlobals_302 = v0;

}

void __52___GEORouteMatcherScoreInfo_doNotMatchToThisSegment__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_GEORouteMatcherScoreInfo infoWithScore:weight:](-10000.0, 10000.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBC770;
  qword_1ECDBC770 = v0;

}

@end

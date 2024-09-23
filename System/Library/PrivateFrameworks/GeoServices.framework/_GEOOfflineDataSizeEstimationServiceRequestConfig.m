@implementation _GEOOfflineDataSizeEstimationServiceRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_258 != -1)
    dispatch_once(&_MergedGlobals_258, &__block_literal_global_117);
  return (id)qword_1ECDBC248;
}

- (unint64_t)urlType
{
  return 61;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2859;
}

- (id)serviceTypeNumber
{
  return 0;
}

@end

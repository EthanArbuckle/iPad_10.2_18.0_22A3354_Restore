@implementation GEORPFeedbackLookupConfig

+ (id)standardConfig
{
  if (qword_1ECDBB8A0 != -1)
    dispatch_once(&qword_1ECDBB8A0, &__block_literal_global_15);
  return (id)qword_1ECDBB8A8;
}

void __43__GEORPFeedbackLookupConfig_standardConfig__block_invoke()
{
  GEORPFeedbackLookupConfig *v0;
  void *v1;

  v0 = objc_alloc_init(GEORPFeedbackLookupConfig);
  v1 = (void *)qword_1ECDBB8A8;
  qword_1ECDBB8A8 = (uint64_t)v0;

}

- (unint64_t)urlType
{
  return 43;
}

- (double)timeout
{
  return GEOConfigGetDouble(GeoServicesConfig_FeedbackLookupRequestTimeout, (uint64_t)off_1EDF4DC68);
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end

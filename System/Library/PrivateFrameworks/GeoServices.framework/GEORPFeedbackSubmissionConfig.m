@implementation GEORPFeedbackSubmissionConfig

+ (id)standardConfig
{
  if (qword_1ECDBB890 != -1)
    dispatch_once(&qword_1ECDBB890, &__block_literal_global_10);
  return (id)qword_1ECDBB898;
}

void __47__GEORPFeedbackSubmissionConfig_standardConfig__block_invoke()
{
  GEORPFeedbackSubmissionConfig *v0;
  void *v1;

  v0 = objc_alloc_init(GEORPFeedbackSubmissionConfig);
  v1 = (void *)qword_1ECDBB898;
  qword_1ECDBB898 = (uint64_t)v0;

}

- (unint64_t)urlType
{
  return 42;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end

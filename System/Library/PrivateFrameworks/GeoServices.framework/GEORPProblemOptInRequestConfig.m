@implementation GEORPProblemOptInRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_174 != -1)
    dispatch_once(&_MergedGlobals_174, &__block_literal_global_1);
  return (id)qword_1ECDBB7D0;
}

void __48__GEORPProblemOptInRequestConfig_standardConfig__block_invoke()
{
  GEORPProblemOptInRequestConfig *v0;
  void *v1;

  v0 = objc_alloc_init(GEORPProblemOptInRequestConfig);
  v1 = (void *)qword_1ECDBB7D0;
  qword_1ECDBB7D0 = (uint64_t)v0;

}

- (unint64_t)urlType
{
  return 25;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

@end

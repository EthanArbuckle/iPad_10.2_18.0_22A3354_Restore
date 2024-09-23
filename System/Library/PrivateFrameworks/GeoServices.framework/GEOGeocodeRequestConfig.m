@implementation GEOGeocodeRequestConfig

+ (id)standardConfig
{
  if (_MergedGlobals_213 != -1)
    dispatch_once(&_MergedGlobals_213, &__block_literal_global_57);
  return (id)qword_1ECDBBC88;
}

void __41__GEOGeocodeRequestConfig_standardConfig__block_invoke()
{
  GEOGeocodeRequestConfig *v0;
  void *v1;

  v0 = objc_alloc_init(GEOGeocodeRequestConfig);
  v1 = (void *)qword_1ECDBBC88;
  qword_1ECDBBC88 = (uint64_t)v0;

}

- (unint64_t)urlType
{
  return 16;
}

- (id)serviceTypeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2855;
}

@end

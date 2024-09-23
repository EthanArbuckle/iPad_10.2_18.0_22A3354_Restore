@implementation GEONavdAnalyticsManager

+ (id)sharedManager
{
  if (qword_1ECDBB9B8 != -1)
    dispatch_once(&qword_1ECDBB9B8, &__block_literal_global_14);
  return (id)_MergedGlobals_184;
}

void __40__GEONavdAnalyticsManager_sharedManager__block_invoke()
{
  GEONavdAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEONavdAnalyticsManager);
  v1 = (void *)_MergedGlobals_184;
  _MergedGlobals_184 = (uint64_t)v0;

}

- (GEONavdAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
}

@end

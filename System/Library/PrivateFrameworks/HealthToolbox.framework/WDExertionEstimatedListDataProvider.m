@implementation WDExertionEstimatedListDataProvider

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  WDExertionDataFetcher *v14;
  WDExertionDataFetcher *v15;
  void *v16;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (-[WDExertionEstimatedListDataProvider shouldDisplayAllSamples](self, "shouldDisplayAllSamples"))
  {
    v14 = 0;
  }
  else
  {
    v15 = [WDExertionDataFetcher alloc];
    -[WDSampleListDataProvider healthStore](self, "healthStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WDExertionDataFetcher initWithHealthStore:predicate:exertionTypeCode:limit:sortDescriptors:resultsHandler:](v15, "initWithHealthStore:predicate:exertionTypeCode:limit:sortDescriptors:resultsHandler:", v16, v11, 298, a5, v12, v13);

  }
  return v14;
}

- (BOOL)shouldDisplayAllSamples
{
  return self->_shouldDisplayAllSamples;
}

- (void)setShouldDisplayAllSamples:(BOOL)a3
{
  self->_shouldDisplayAllSamples = a3;
}

@end

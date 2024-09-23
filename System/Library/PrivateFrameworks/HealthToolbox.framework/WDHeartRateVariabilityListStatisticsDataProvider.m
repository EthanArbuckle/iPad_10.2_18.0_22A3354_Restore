@implementation WDHeartRateVariabilityListStatisticsDataProvider

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a5 & 2;
  v10 = a6;
  v11 = a4;
  -[WDSampleListStatisticsDataProvider _statisticsAtIndexPath:](self, "_statisticsAtIndexPath:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD3C68];
  objc_msgSend(v16, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListStatisticsDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteHRVSamplesFromStartDate:endDate:predicate:options:healthStore:completion:", v13, v14, v15, v9, v11, v10);

}

@end

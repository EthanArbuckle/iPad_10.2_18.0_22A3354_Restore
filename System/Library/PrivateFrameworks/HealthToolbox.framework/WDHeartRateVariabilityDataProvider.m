@implementation WDHeartRateVariabilityDataProvider

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a5 & 2;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "row");
  v14 = objc_msgSend(v12, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v13, v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD3C68];
  -[WDSampleListDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deleteHRVSample:healthStore:predicate:options:completion:", v17, v11, v16, v9, v10);

}

@end

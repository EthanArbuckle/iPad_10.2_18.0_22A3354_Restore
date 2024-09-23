@implementation WDMedicalRecordPagingContext

- (WDMedicalRecordPagingContext)init
{
  WDMedicalRecordPagingContext *v2;
  WDMedicalRecordPagingContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDMedicalRecordPagingContext;
  v2 = -[WDMedicalRecordPagingContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WDMedicalRecordPagingContext resetPagingContext](v2, "resetPagingContext");
  return v3;
}

- (BOOL)shouldQueryForNextBatch
{
  return -[WDMedicalRecordPagingContext hasMoreData](self, "hasMoreData")
      && !-[WDMedicalRecordPagingContext fetchingCurrentPage](self, "fetchingCurrentPage")
      && -[WDMedicalRecordPagingContext pagingContextReady](self, "pagingContextReady");
}

- (void)resetPagingContext
{
  NSMutableSet *v3;
  NSMutableSet *computingDaySummaries;
  NSMutableArray *v5;
  NSMutableArray *unprocessedRecords;
  NSMutableArray *v7;
  NSMutableArray *contextDependentBlockQueue;
  NSMutableArray *v9;
  NSMutableArray *removedRecords;

  *(_DWORD *)&self->_shouldClearDisplayItemGroups = 257;
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  computingDaySummaries = self->_computingDaySummaries;
  self->_computingDaySummaries = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  unprocessedRecords = self->_unprocessedRecords;
  self->_unprocessedRecords = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  contextDependentBlockQueue = self->_contextDependentBlockQueue;
  self->_contextDependentBlockQueue = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  removedRecords = self->_removedRecords;
  self->_removedRecords = v9;

}

+ (id)sortDateComponentsOfDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDateComponentsOfDateComponents:(id)a3 withDayOffset:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a3;
  objc_msgSend(v5, "hk_gregorianCalendarWithLocalTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, a4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 30, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldClearDisplayItemGroups
{
  return self->_shouldClearDisplayItemGroups;
}

- (void)setShouldClearDisplayItemGroups:(BOOL)a3
{
  self->_shouldClearDisplayItemGroups = a3;
}

- (BOOL)hasMoreData
{
  return self->_hasMoreData;
}

- (void)setHasMoreData:(BOOL)a3
{
  self->_hasMoreData = a3;
}

- (BOOL)fetchingCurrentPage
{
  return self->_fetchingCurrentPage;
}

- (void)setFetchingCurrentPage:(BOOL)a3
{
  self->_fetchingCurrentPage = a3;
}

- (BOOL)pagingContextReady
{
  return self->_pagingContextReady;
}

- (void)setPagingContextReady:(BOOL)a3
{
  self->_pagingContextReady = a3;
}

- (NSMutableSet)computingDaySummaries
{
  return self->_computingDaySummaries;
}

- (void)setComputingDaySummaries:(id)a3
{
  objc_storeStrong((id *)&self->_computingDaySummaries, a3);
}

- (NSMutableArray)unprocessedRecords
{
  return self->_unprocessedRecords;
}

- (void)setUnprocessedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_unprocessedRecords, a3);
}

- (NSMutableArray)contextDependentBlockQueue
{
  return self->_contextDependentBlockQueue;
}

- (void)setContextDependentBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contextDependentBlockQueue, a3);
}

- (NSMutableArray)removedRecords
{
  return self->_removedRecords;
}

- (void)setRemovedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_removedRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedRecords, 0);
  objc_storeStrong((id *)&self->_contextDependentBlockQueue, 0);
  objc_storeStrong((id *)&self->_unprocessedRecords, 0);
  objc_storeStrong((id *)&self->_computingDaySummaries, 0);
}

@end

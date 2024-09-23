@implementation ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker

- (ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker)init
{
  ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker *v2;
  ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker *v3;
  uint64_t v4;
  NSMutableSet *seenDatesWithPositiveSamples;
  uint64_t v6;
  NSMutableSet *seenDatesWithSamples;
  NSDate *startDate;
  NSDate *endDate;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker;
  v2 = -[ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfPositiveSamples = 0;
    v4 = objc_opt_new();
    seenDatesWithPositiveSamples = v3->_seenDatesWithPositiveSamples;
    v3->_seenDatesWithPositiveSamples = (NSMutableSet *)v4;

    v6 = objc_opt_new();
    seenDatesWithSamples = v3->_seenDatesWithSamples;
    v3->_seenDatesWithSamples = (NSMutableSet *)v6;

    startDate = v3->_startDate;
    v3->_numberOfSamples = 0;
    v3->_startDate = 0;

    endDate = v3->_endDate;
    v3->_endDate = 0;

  }
  return v3;
}

- (void)observeDataPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *seenDatesWithPositiveSamples;
  NSDate *startDate;
  void *v10;
  id v11;
  NSDate *v12;
  NSDate **p_endDate;
  NSDate *endDate;
  id v15;
  id obj;

  v4 = a3;
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "yearMonthDayComponentsForDate:", obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v4, "engaged");

  if ((_DWORD)v6)
  {
    seenDatesWithPositiveSamples = self->_seenDatesWithPositiveSamples;
    ++self->_numberOfPositiveSamples;
    -[NSMutableSet addObject:](seenDatesWithPositiveSamples, "addObject:", v7);
  }
  -[NSMutableSet addObject:](self->_seenDatesWithSamples, "addObject:", v7);
  startDate = self->_startDate;
  ++self->_numberOfSamples;
  v10 = obj;
  if (!startDate
    || (-[NSDate earlierDate:](startDate, "earlierDate:", obj),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10 = obj,
        v11 == obj))
  {
    objc_storeStrong((id *)&self->_startDate, v10);
    v10 = obj;
  }
  endDate = self->_endDate;
  p_endDate = &self->_endDate;
  v12 = endDate;
  if (!endDate
    || (-[NSDate laterDate:](v12, "laterDate:", obj),
        v15 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v10 = obj,
        v15 == obj))
  {
    objc_storeStrong((id *)p_endDate, v10);
  }

}

+ (id)yearMonthDayComponentsForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentMetadata
{
  return -[ATXCandidateRelevanceModelDataStoreDatasetMetadata initWithNumberOfPositiveSamples:numberOfSamples:numberOfDaysWithPositiveSamples:numberOfDaysWithSamples:startDate:endDate:]([ATXCandidateRelevanceModelDataStoreDatasetMetadata alloc], "initWithNumberOfPositiveSamples:numberOfSamples:numberOfDaysWithPositiveSamples:numberOfDaysWithSamples:startDate:endDate:", self->_numberOfPositiveSamples, self->_numberOfSamples, -[NSMutableSet count](self->_seenDatesWithPositiveSamples, "count"), -[NSMutableSet count](self->_seenDatesWithSamples, "count"), self->_startDate, self->_endDate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_seenDatesWithSamples, 0);
  objc_storeStrong((id *)&self->_seenDatesWithPositiveSamples, 0);
}

@end

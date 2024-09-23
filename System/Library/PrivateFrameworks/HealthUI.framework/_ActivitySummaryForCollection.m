@implementation _ActivitySummaryForCollection

- (_ActivitySummaryForCollection)initWithActivitySummary:(id)a3 timeScope:(int64_t)a4 hasNoData:(BOOL)a5
{
  id v9;
  _ActivitySummaryForCollection *v10;
  _ActivitySummaryForCollection *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ActivitySummaryForCollection;
  v10 = -[_ActivitySummaryForCollection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_summaryResult, a3);
    v11->_timeScope = a4;
    v11->_hasNoData = a5;
  }

  return v11;
}

- (HKActivitySummary)summaryResult
{
  return self->_summaryResult;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (BOOL)hasNoData
{
  return self->_hasNoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryResult, 0);
}

@end

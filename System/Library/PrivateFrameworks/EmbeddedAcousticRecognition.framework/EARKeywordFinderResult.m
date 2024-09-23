@implementation EARKeywordFinderResult

- (id)_initWithCorrectedUtterances:(id)a3
{
  id v4;
  EARKeywordFinderResult *v5;
  uint64_t v6;
  NSArray *correctedUtterances;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EARKeywordFinderResult;
  v5 = -[EARKeywordFinderResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    correctedUtterances = v5->_correctedUtterances;
    v5->_correctedUtterances = (NSArray *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EARKeywordFinderResult;
  -[EARKeywordFinderResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" correctedUtterances=%@"), self->_correctedUtterances);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)correctedUtterances
{
  return self->_correctedUtterances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedUtterances, 0);
}

@end

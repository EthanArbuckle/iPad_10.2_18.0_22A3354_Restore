@implementation EMFQueryEvaluator

- (EMFQueryEvaluator)initWithIndex:(id)a3
{
  return -[EMFQueryEvaluator initWithIndex:andOverrideList:](self, "initWithIndex:andOverrideList:", a3, 0);
}

- (EMFQueryEvaluator)initWithIndex:(id)a3 andOverrideList:(id)a4
{
  id v7;
  id v8;
  EMFQueryEvaluator *v9;
  EMFQueryEvaluator *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[EMFQueryEvaluator init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_index, a3);
    objc_storeStrong((id *)&v10->_overrideList, a4);
  }

  return v10;
}

- (id)performQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EMFQueryResult *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "tokenCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFInvertedIndex calculateDocumentWeightsForQueryTokenCounts:](self->_index, "calculateDocumentWeightsForQueryTokenCounts:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFQueryEvaluator _overriddenResultsForQuery:](self, "_overriddenResultsForQuery:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EMFQueryResult alloc];
  if (v7)
    v9 = -[EMFQueryResult initWithQuery:matchingDocumentWeights:resultOverride:](v8, "initWithQuery:matchingDocumentWeights:resultOverride:", v4, v6, v7);
  else
    v9 = -[EMFQueryResult initWithQuery:andMatchingDocumentWeights:](v8, "initWithQuery:andMatchingDocumentWeights:", v4, v6);
  v10 = (void *)v9;

  return v10;
}

- (id)_overriddenResultsForQuery:(id)a3
{
  void *overrideList;

  overrideList = self->_overrideList;
  if (overrideList)
  {
    objc_msgSend(overrideList, "overriddenResultsForQuery:", a3);
    overrideList = (void *)objc_claimAutoreleasedReturnValue();
  }
  return overrideList;
}

- (EMFInvertedIndex)index
{
  return self->_index;
}

- (EMFQueryResultOverrideList)overrideList
{
  return self->_overrideList;
}

- (void)setOverrideList:(id)a3
{
  objc_storeStrong((id *)&self->_overrideList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideList, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end

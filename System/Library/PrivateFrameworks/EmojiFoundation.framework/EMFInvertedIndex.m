@implementation EMFInvertedIndex

- (EMFInvertedIndex)initWithTermIndex:(id)a3 andDocumentIndex:(id)a4
{
  id v7;
  id v8;
  EMFInvertedIndex *v9;
  EMFInvertedIndex *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMFInvertedIndex;
  v9 = -[EMFInvertedIndex init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_termIndex, a3);
    objc_storeStrong((id *)&v10->_documentIndex, a4);
  }

  return v10;
}

- (id)postingsForTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFInvertedIndex strategy](self, "strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postingsForTerm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)termsForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFInvertedIndex strategy](self, "strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "termsForDocument:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[EMFInvertedIndex strategy](self, "strategy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "termWeightForTerm:inDocument:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)commonDocumentsForTerms:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFInvertedIndex strategy](self, "strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonDocumentsForTerms:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFInvertedIndex strategy](self, "strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calculateDocumentWeightsForQueryTokenCounts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EMFIndexStrategy)strategy
{
  EMFIndexStrategy *strategy;
  void *v4;
  void *v5;
  EMFIndexStrategy *v6;
  EMFIndexStrategy *v7;

  strategy = self->_strategy;
  if (!strategy)
  {
    -[EMFInvertedIndex termIndex](self, "termIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFInvertedIndex documentIndex](self, "documentIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFIndexStrategyFactory defaultStrategyWithTermIndex:andDocumentIndex:](EMFIndexStrategyFactory, "defaultStrategyWithTermIndex:andDocumentIndex:", v4, v5);
    v6 = (EMFIndexStrategy *)objc_claimAutoreleasedReturnValue();
    v7 = self->_strategy;
    self->_strategy = v6;

    strategy = self->_strategy;
  }
  return strategy;
}

- (NSDictionary)termIndex
{
  return self->_termIndex;
}

- (void)setTermIndex:(id)a3
{
  objc_storeStrong((id *)&self->_termIndex, a3);
}

- (NSDictionary)documentIndex
{
  return self->_documentIndex;
}

- (void)setDocumentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_documentIndex, a3);
}

- (NSURL)termIndexURL
{
  return self->_termIndexURL;
}

- (void)setTermIndexURL:(id)a3
{
  objc_storeStrong((id *)&self->_termIndexURL, a3);
}

- (NSURL)documentIndexURL
{
  return self->_documentIndexURL;
}

- (void)setDocumentIndexURL:(id)a3
{
  objc_storeStrong((id *)&self->_documentIndexURL, a3);
}

- (NSBundle)assetBundle
{
  return self->_assetBundle;
}

- (void)setAssetBundle:(id)a3
{
  objc_storeStrong((id *)&self->_assetBundle, a3);
}

- (void)setStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_strategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_assetBundle, 0);
  objc_storeStrong((id *)&self->_documentIndexURL, 0);
  objc_storeStrong((id *)&self->_termIndexURL, 0);
  objc_storeStrong((id *)&self->_documentIndex, 0);
  objc_storeStrong((id *)&self->_termIndex, 0);
}

@end

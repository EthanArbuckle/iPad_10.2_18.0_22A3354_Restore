@implementation ATXFakeAnchorModelTrainer

- (ATXFakeAnchorModelTrainer)init
{
  ATXFakeAnchorModelTrainer *v2;
  ATXFakeAnchorModelTrainer *v3;
  uint64_t v4;
  NSMutableArray *trainedAnchors;
  uint64_t v6;
  NSMutableDictionary *trainingResultsForAnchor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXFakeAnchorModelTrainer;
  v2 = -[ATXFakeAnchorModelTrainer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trained = 0;
    v4 = objc_opt_new();
    trainedAnchors = v3->_trainedAnchors;
    v3->_trainedAnchors = (NSMutableArray *)v4;

    v6 = objc_opt_new();
    trainingResultsForAnchor = v3->_trainingResultsForAnchor;
    v3->_trainingResultsForAnchor = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)train
{
  self->_trained = 1;
}

- (id)trainAnchorModel:(id)a3
{
  NSMutableArray *trainedAnchors;
  id v5;
  void *v6;
  NSMutableDictionary *trainingResultsForAnchor;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_trained = 1;
  trainedAnchors = self->_trainedAnchors;
  v5 = a3;
  objc_msgSend(v5, "anchorTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](trainedAnchors, "addObject:", v6);

  trainingResultsForAnchor = self->_trainingResultsForAnchor;
  objc_msgSend(v5, "anchorTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](trainingResultsForAnchor, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  return v11;
}

- (void)setTrainingResultsForAnchor:(id)a3 results:(id)a4
{
  NSMutableDictionary *trainingResultsForAnchor;
  id v6;
  id v7;

  trainingResultsForAnchor = self->_trainingResultsForAnchor;
  v6 = a4;
  objc_msgSend(a3, "anchorTypeString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](trainingResultsForAnchor, "setObject:forKey:", v6, v7);

}

- (BOOL)trained
{
  return self->_trained;
}

- (NSMutableArray)trainedAnchors
{
  return self->_trainedAnchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainedAnchors, 0);
  objc_storeStrong((id *)&self->_trainingResultsForAnchor, 0);
}

@end

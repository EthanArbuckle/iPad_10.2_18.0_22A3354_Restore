@implementation ATXDisplayCacheIntermediateFormat

+ (id)fromActions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "atx_actionsFromActionResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:](ATXDisplayCacheLockscreenFilter, "indicesOfLockScreenActionsForActionPredictions:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:](ATXActionCacheBuilder, "serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v4;
  v9 = v4;

  v10 = (void *)v7[2];
  v7[2] = v6;
  v11 = v6;

  v12 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)predictionChunks
{
  return self->_predictionChunks;
}

- (NSIndexSet)lockscreenPredictionIndices
{
  return self->_lockscreenPredictionIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenPredictionIndices, 0);
  objc_storeStrong((id *)&self->_predictionChunks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end

@implementation _ATXInspectionServerPredictionScoreLogger

- (_ATXInspectionServerPredictionScoreLogger)init
{
  _ATXInspectionServerPredictionScoreLogger *v2;
  uint64_t v3;
  NSMutableDictionary *inputsAndSubscores;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableDictionary *stageScores;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_ATXInspectionServerPredictionScoreLogger;
  v2 = -[_ATXInspectionServerPredictionScoreLogger init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    inputsAndSubscores = v2->_inputsAndSubscores;
    v2->_inputsAndSubscores = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("_ATXInspectionServerPredictionScoreLogger", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    stageScores = v2->_stageScores;
    v2->_stageScores = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (id)inputsAndSubscores
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__84;
  v10 = __Block_byref_object_dispose__84;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63___ATXInspectionServerPredictionScoreLogger_inputsAndSubscores__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)stageScores
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__84;
  v10 = __Block_byref_object_dispose__84;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56___ATXInspectionServerPredictionScoreLogger_stageScores__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77___ATXInspectionServerPredictionScoreLogger_logInputs_subscores_forBundleId___block_invoke;
  v15[3] = &unk_1E82DBAB0;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "toDictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXInspectionServerPredictionScoreLogger logInputs:subscores:forBundleId:](self, "logInputs:subscores:forBundleId:", v11, v10, v8);
}

- (void)logStageScores:(id)a3 forStageType:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___ATXInspectionServerPredictionScoreLogger_logStageScores_forStageType___block_invoke;
  block[3] = &unk_1E82DEAD0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageScores, 0);
  objc_storeStrong((id *)&self->_inputsAndSubscores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

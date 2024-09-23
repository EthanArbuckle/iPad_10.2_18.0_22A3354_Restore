@implementation _ATXInspectionServerActionPredictionScoreLogger

- (_ATXInspectionServerActionPredictionScoreLogger)init
{
  _ATXInspectionServerActionPredictionScoreLogger *v2;
  uint64_t v3;
  NSMutableDictionary *actionMetaDataItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXInspectionServerActionPredictionScoreLogger;
  v2 = -[_ATXInspectionServerPredictionScoreLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    actionMetaDataItems = v2->_actionMetaDataItems;
    v2->_actionMetaDataItems = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)actionMetaDataItems
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
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70___ATXInspectionServerActionPredictionScoreLogger_actionMetaDataItems__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)storeMetaDataFromActionContainerForKey:(id)a3 actionContainer:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  double v15;
  _BOOL8 v16;
  _ATXActionMetaData *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _ATXActionMetaData *v25;
  NSObject *queue;
  _ATXActionMetaData *v27;
  _BOOL4 v28;
  id v30;
  id v31;
  _QWORD block[5];
  id v33;
  _ATXActionMetaData *v34;

  v30 = a3;
  v5 = a4;
  objc_msgSend(v5, "scoredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  v8 = v7;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionExperienceMediumConfidenceThreshold");
  v28 = v10 < v8;

  objc_msgSend(v5, "scoredAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "score");
  v13 = v12;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionExperienceHighConfidenceThreshold");
  v16 = v15 < v13;

  v17 = [_ATXActionMetaData alloc];
  objc_msgSend(v5, "scoredAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predictedItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoredAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predictedItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionSubtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_ATXActionMetaData initWithTitle:subtitle:shouldPredict:shouldPredictLockScreen:actionKey:](v17, "initWithTitle:subtitle:shouldPredict:shouldPredictLockScreen:actionKey:", v20, v23, v28, v16, v24);
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106___ATXInspectionServerActionPredictionScoreLogger_storeMetaDataFromActionContainerForKey_actionContainer___block_invoke;
  block[3] = &unk_1E82DB9D8;
  block[4] = self;
  v33 = v30;
  v34 = v25;
  v27 = v25;
  v31 = v30;
  dispatch_sync(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetaDataItems, 0);
}

@end

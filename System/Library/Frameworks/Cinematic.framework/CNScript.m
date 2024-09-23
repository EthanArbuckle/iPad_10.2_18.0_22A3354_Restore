@implementation CNScript

- (id)_initWithInternalScript:(id)a3
{
  id v5;
  CNScript *v6;
  CNScript *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNScript;
  v6 = -[CNScript init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalScript, a3);
    v8 = dispatch_queue_create("com.apple.cinematic.script", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

+ (void)loadFromAsset:(AVAsset *)asset changes:(CNScriptChanges *)changes progress:(NSProgress *)progress completionHandler:(void *)completionHandler
{
  AVAsset *v9;
  CNScriptChanges *v10;
  NSProgress *v11;
  void *v12;
  id v13;
  NSProgress *v14;
  NSProgress *v15;
  void *v16;
  NSProgress *v17;
  AVAsset *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, int, void *);
  void *v25;
  NSProgress *v26;
  id v27;
  AVAsset *v28;
  id v29;

  v9 = asset;
  v10 = changes;
  v11 = progress;
  v12 = completionHandler;
  v13 = objc_alloc_init(MEMORY[0x24BE74B68]);
  if (v11)
  {
    v14 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 0);
    v14 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  -[CNScriptChanges internalChanges](v10, "internalChanges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke;
  v25 = &unk_25044F7E8;
  v17 = v15;
  v26 = v17;
  v27 = v13;
  v28 = v9;
  v29 = v12;
  v18 = v9;
  v19 = v12;
  v20 = v13;
  objc_msgSend(v20, "loadWithAsset:changesDictionary:completion:", v18, v16, &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (!-[NSProgress totalUnitCount](v17, "totalUnitCount", v22, v23, v24, v25, v26, v27, v28, v29))
      -[NSProgress setTotalUnitCount:](v17, "setTotalUnitCount:", objc_msgSend(v21, "totalUnitCount"));
    -[NSProgress addChild:withPendingUnitCount:](v17, "addChild:withPendingUnitCount:", v21, -[NSProgress totalUnitCount](v17, "totalUnitCount"));
  }

}

void __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void (*v8)(void);
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = -[CNScript _initWithInternalScript:]([CNScript alloc], "_initWithInternalScript:", *(_QWORD *)(a1 + 40));
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x24BE74BC0]);

    if (v10 && (v11 = objc_msgSend(v6, "code") - 2, v11 <= 3))
      v12 = qword_23308FDB8[v11];
    else
      v12 = 1;
    _CNCinematicError(v12, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    _CNLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v8();

}

- (void)reloadWithChanges:(CNScriptChanges *)changes
{
  CNScriptChanges *v4;
  NSObject *v5;
  CNScriptChanges *v6;
  _QWORD block[5];
  CNScriptChanges *v8;

  v4 = changes;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CNScript_reloadWithChanges___block_invoke;
  block[3] = &unk_25044F810;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __30__CNScript_reloadWithChanges___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadWithChangesDictionary:", v2);

}

- (CNScriptChanges)changes
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CNScript queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __19__CNScript_changes__block_invoke;
  v6[3] = &unk_25044F860;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNScriptChanges *)v4;
}

void __19__CNScript_changes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __19__CNScript_changes__block_invoke_2;
  v5[3] = &unk_25044F838;
  v5[4] = *(_QWORD *)(a1 + 32);
  __19__CNScript_changes__block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __19__CNScript_changes__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "changesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNScriptChanges _changesFromInternal:](CNScriptChanges, "_changesFromInternal:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNScriptChanges)changesTrimmedByTimeRange:(CMTimeRange *)timeRange
{
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__CNScript_changesTrimmedByTimeRange___block_invoke;
  v9[3] = &unk_25044F8B0;
  v9[4] = self;
  v9[5] = &v13;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v10 = *(_OWORD *)&timeRange->start.value;
  v11 = v6;
  v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNScriptChanges *)v7;
}

void __38__CNScript_changesTrimmedByTimeRange___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __38__CNScript_changesTrimmedByTimeRange___block_invoke_2;
  v7[3] = &unk_25044F888;
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 80);
  v9 = v2;
  v10 = v3;
  __38__CNScript_changesTrimmedByTimeRange___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __38__CNScript_changesTrimmedByTimeRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "changesDictionaryTrimmedByTimeRange:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNScriptChanges _changesFromInternal:](CNScriptChanges, "_changesFromInternal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CMTimeRange)timeRange
{
  NSObject *v5;
  uint64_t *v6;
  __int128 v7;
  CMTimeRange *result;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v10 = 0;
  v11 = &v10;
  v12 = 0x5010000000;
  v13 = "";
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __21__CNScript_timeRange__block_invoke;
  v9[3] = &unk_25044F860;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  v6 = v11;
  v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->start.epoch = v7;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __21__CNScript_timeRange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;
  _QWORD v5[5];
  _OWORD v6[3];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__CNScript_timeRange__block_invoke_2;
  v5[3] = &unk_25044F8D8;
  v5[4] = *(_QWORD *)(a1 + 32);
  __21__CNScript_timeRange__block_invoke_2((uint64_t)v5, v6);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = v6[1];
  result = (__n128)v6[2];
  *(_OWORD *)(v2 + 32) = v6[0];
  *(_OWORD *)(v2 + 48) = v4;
  *(__n128 *)(v2 + 64) = result;
  return result;
}

void __21__CNScript_timeRange__block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "timeRange");
    v3 = v4;
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }

}

- (CNScriptFrame)frameAtTime:(CMTime *)time tolerance:(CMTime *)tolerance
{
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  CMTime v11;
  CMTime v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__CNScript_frameAtTime_tolerance___block_invoke;
  v10[3] = &unk_25044F8B0;
  v10[4] = self;
  v10[5] = &v13;
  v11 = *time;
  v12 = *tolerance;
  dispatch_sync(v7, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNScriptFrame *)v8;
}

void __34__CNScript_frameAtTime_tolerance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__CNScript_frameAtTime_tolerance___block_invoke_2;
  v5[3] = &unk_25044F900;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  __34__CNScript_frameAtTime_tolerance___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __34__CNScript_frameAtTime_tolerance___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v2, "frameAtTime:tolerance:", &v8, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[CNScriptFrame _copyFrameFromInternal:](CNScriptFrame, "_copyFrameFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSArray)framesInTimeRange:(CMTimeRange *)timeRange
{
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__CNScript_framesInTimeRange___block_invoke;
  v9[3] = &unk_25044F8B0;
  v9[4] = self;
  v9[5] = &v13;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v10 = *(_OWORD *)&timeRange->start.value;
  v11 = v6;
  v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __30__CNScript_framesInTimeRange___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __30__CNScript_framesInTimeRange___block_invoke_2;
  v7[3] = &unk_25044F928;
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 80);
  v9 = v2;
  v10 = v3;
  __30__CNScript_framesInTimeRange___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __30__CNScript_framesInTimeRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  id v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "framesInTimeRange:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[CNScriptFrame _copyFramesFromInternal:](CNScriptFrame, "_copyFramesFromInternal:", v4);
  return v5;
}

- (CNDecision)decisionAtTime:(CMTime *)time tolerance:(CMTime *)tolerance
{
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  CMTime v11;
  CMTime v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__CNScript_decisionAtTime_tolerance___block_invoke;
  v10[3] = &unk_25044F8B0;
  v10[4] = self;
  v10[5] = &v13;
  v11 = *time;
  v12 = *tolerance;
  dispatch_sync(v7, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNDecision *)v8;
}

void __37__CNScript_decisionAtTime_tolerance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__CNScript_decisionAtTime_tolerance___block_invoke_2;
  v5[3] = &unk_25044F950;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  __37__CNScript_decisionAtTime_tolerance___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __37__CNScript_decisionAtTime_tolerance___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  CMTime v6;
  CMTime lhs;
  CMTime rhs;
  CMTime time;
  CMTime v10;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(CMTime *)(a1 + 40);
  objc_msgSend(v2, "decisionNearestTime:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  if (v3)
    objc_msgSend(v3, "time");
  else
    memset(&rhs, 0, sizeof(rhs));
  lhs = *(CMTime *)(a1 + 40);
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v10, &time);
  lhs = v10;
  v6 = *(CMTime *)(a1 + 64);
  if (CMTimeCompare(&lhs, &v6) <= 0)
    v4 = +[CNDecision _copyDecisionFromInternal:](CNDecision, "_copyDecisionFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSArray)decisionsInTimeRange:(CMTimeRange *)timeRange
{
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__CNScript_decisionsInTimeRange___block_invoke;
  v9[3] = &unk_25044F8B0;
  v9[4] = self;
  v9[5] = &v13;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v10 = *(_OWORD *)&timeRange->start.value;
  v11 = v6;
  v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __33__CNScript_decisionsInTimeRange___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __33__CNScript_decisionsInTimeRange___block_invoke_2;
  v7[3] = &unk_25044F928;
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 80);
  v9 = v2;
  v10 = v3;
  __33__CNScript_decisionsInTimeRange___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __33__CNScript_decisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  id v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "decisionsInTimeRange:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[CNDecision _copyDecisionsFromInternal:](CNDecision, "_copyDecisionsFromInternal:", v4);
  return v5;
}

- (CNDecision)decisionAfterTime:(CMTime *)time
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  CMTime v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CNScript_decisionAfterTime___block_invoke;
  block[3] = &unk_25044F9A0;
  block[4] = self;
  block[5] = &v10;
  v9 = *time;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __30__CNScript_decisionAfterTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__CNScript_decisionAfterTime___block_invoke_2;
  v5[3] = &unk_25044F978;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  __30__CNScript_decisionAfterTime___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __30__CNScript_decisionAfterTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "decisionAfterTime:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[CNDecision _copyDecisionFromInternal:](CNDecision, "_copyDecisionFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (CNDecision)decisionBeforeTime:(CMTime *)time
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  CMTime v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__CNScript_decisionBeforeTime___block_invoke;
  block[3] = &unk_25044F9A0;
  block[4] = self;
  block[5] = &v10;
  v9 = *time;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __31__CNScript_decisionBeforeTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__CNScript_decisionBeforeTime___block_invoke_2;
  v5[3] = &unk_25044F978;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  __31__CNScript_decisionBeforeTime___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __31__CNScript_decisionBeforeTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "decisionBeforeTime:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[CNDecision _copyDecisionFromInternal:](CNDecision, "_copyDecisionFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSArray)userDecisionsInTimeRange:(CMTimeRange *)timeRange
{
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__CNScript_userDecisionsInTimeRange___block_invoke;
  v9[3] = &unk_25044F8B0;
  v9[4] = self;
  v9[5] = &v13;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v10 = *(_OWORD *)&timeRange->start.value;
  v11 = v6;
  v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __37__CNScript_userDecisionsInTimeRange___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __37__CNScript_userDecisionsInTimeRange___block_invoke_2;
  v7[3] = &unk_25044F928;
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 80);
  v9 = v2;
  v10 = v3;
  __37__CNScript_userDecisionsInTimeRange___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __37__CNScript_userDecisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  id v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "userDecisionsInTimeRange:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[CNDecision _copyDecisionsFromInternal:](CNDecision, "_copyDecisionsFromInternal:", v4);
  return v5;
}

- (NSArray)baseDecisionsInTimeRange:(CMTimeRange *)timeRange
{
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__CNScript_baseDecisionsInTimeRange___block_invoke;
  v9[3] = &unk_25044F8B0;
  v9[4] = self;
  v9[5] = &v13;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v10 = *(_OWORD *)&timeRange->start.value;
  v11 = v6;
  v12 = *(_OWORD *)&timeRange->duration.timescale;
  dispatch_sync(v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v7;
}

void __37__CNScript_baseDecisionsInTimeRange___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __37__CNScript_baseDecisionsInTimeRange___block_invoke_2;
  v7[3] = &unk_25044F928;
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 80);
  v9 = v2;
  v10 = v3;
  __37__CNScript_baseDecisionsInTimeRange___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __37__CNScript_baseDecisionsInTimeRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  id v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "baseDecisionsInTimeRange:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[CNDecision _copyDecisionsFromInternal:](CNDecision, "_copyDecisionsFromInternal:", v4);
  return v5;
}

- (CNDecision)primaryDecisionAtTime:(CMTime *)time
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  CMTime v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CNScript_primaryDecisionAtTime___block_invoke;
  block[3] = &unk_25044F9A0;
  block[4] = self;
  block[5] = &v10;
  v9 = *time;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __34__CNScript_primaryDecisionAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__CNScript_primaryDecisionAtTime___block_invoke_2;
  v5[3] = &unk_25044F978;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  __34__CNScript_primaryDecisionAtTime___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __34__CNScript_primaryDecisionAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "primaryDecisionAtTime:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[CNDecision _copyDecisionFromInternal:](CNDecision, "_copyDecisionFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (CNDecision)secondaryDecisionAtTime:(CMTime *)time
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  CMTime v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CNScript_secondaryDecisionAtTime___block_invoke;
  block[3] = &unk_25044F9A0;
  block[4] = self;
  block[5] = &v10;
  v9 = *time;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNDecision *)v6;
}

void __36__CNScript_secondaryDecisionAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__CNScript_secondaryDecisionAtTime___block_invoke_2;
  v5[3] = &unk_25044F978;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  __36__CNScript_secondaryDecisionAtTime___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __36__CNScript_secondaryDecisionAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "secondaryDecisionAtTime:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = +[CNDecision _copyDecisionFromInternal:](CNDecision, "_copyDecisionFromInternal:", v3);
  else
    v4 = 0;

  return v4;
}

- (CMTimeRange)timeRangeOfTransitionAfterDecision:(SEL)a3
{
  CNDecision *v6;
  NSObject *v7;
  CNDecision *v8;
  uint64_t *v9;
  __int128 v10;
  CMTimeRange *result;
  _QWORD block[5];
  CNDecision *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = decision;
  v15 = 0;
  v16 = &v15;
  v17 = 0x5010000000;
  v18 = "";
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CNScript queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke;
  block[3] = &unk_25044F9F0;
  v13 = v6;
  v14 = &v15;
  block[4] = self;
  v8 = v6;
  dispatch_sync(v7, block);

  v9 = v16;
  v10 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v15, 8);
  return result;
}

__n128 __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  _QWORD v8[6];
  _OWORD v9[3];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2;
  v8[3] = &unk_25044F9C8;
  v2 = (void *)a1[5];
  v8[4] = a1[4];
  v8[5] = v2;
  v3 = v2;
  __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2((uint64_t)v8, v9);
  v4 = *(_OWORD **)(a1[6] + 8);
  v6 = v9[1];
  v5 = v9[2];
  v4[2] = v9[0];
  v4[3] = v6;
  v4[4] = v5;

  return result;
}

void __47__CNScript_timeRangeOfTransitionAfterDecision___block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalDecision");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "timeRangeOfTransitionAfterDecision:", v4);
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }

}

- (CMTimeRange)timeRangeOfTransitionBeforeDecision:(SEL)a3
{
  CNDecision *v6;
  NSObject *v7;
  CNDecision *v8;
  uint64_t *v9;
  __int128 v10;
  CMTimeRange *result;
  _QWORD block[5];
  CNDecision *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = decision;
  v15 = 0;
  v16 = &v15;
  v17 = 0x5010000000;
  v18 = "";
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CNScript queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke;
  block[3] = &unk_25044F9F0;
  v13 = v6;
  v14 = &v15;
  block[4] = self;
  v8 = v6;
  dispatch_sync(v7, block);

  v9 = v16;
  v10 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->start.value = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v15, 8);
  return result;
}

__n128 __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  _QWORD v8[6];
  _OWORD v9[3];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2;
  v8[3] = &unk_25044F9C8;
  v2 = (void *)a1[5];
  v8[4] = a1[4];
  v8[5] = v2;
  v3 = v2;
  __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2((uint64_t)v8, v9);
  v4 = *(_OWORD **)(a1[6] + 8);
  v6 = v9[1];
  v5 = v9[2];
  v4[2] = v9[0];
  v4[3] = v6;
  v4[4] = v5;

  return result;
}

void __48__CNScript_timeRangeOfTransitionBeforeDecision___block_invoke_2(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalDecision");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "timeRangeOfTransitionBeforeDecision:", v4);
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }

}

- (NSArray)addedDetectionTracks
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CNScript queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__CNScript_addedDetectionTracks__block_invoke;
  v6[3] = &unk_25044F860;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __32__CNScript_addedDetectionTracks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__CNScript_addedDetectionTracks__block_invoke_2;
  v5[3] = &unk_25044FA18;
  v5[4] = *(_QWORD *)(a1 + 32);
  __32__CNScript_addedDetectionTracks__block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __32__CNScript_addedDetectionTracks__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "internalScript", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUserCreated"))
        {
          +[CNDetectionTrack _trackFromInternal:](CNDetectionTrack, "_trackFromInternal:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return v11;
}

- (CNDetectionTrack)detectionTrackForID:(CNDetectionID)detectionID
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CNScript_detectionTrackForID___block_invoke;
  block[3] = &unk_25044FA68;
  block[4] = self;
  block[5] = &v9;
  block[6] = detectionID;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (CNDetectionTrack *)v6;
}

void __32__CNScript_detectionTrackForID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__CNScript_detectionTrackForID___block_invoke_2;
  v6[3] = &unk_25044FA40;
  v2 = a1[6];
  v6[4] = a1[4];
  v6[5] = v2;
  __32__CNScript_detectionTrackForID___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __32__CNScript_detectionTrackForID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNDetectionTrack _trackFromInternal:](CNDetectionTrack, "_trackFromInternal:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CNDetectionTrack)detectionTrackForDecision:(CNDecision *)decision
{
  CNDecision *v4;
  NSObject *v5;
  CNDecision *v6;
  id v7;
  _QWORD block[5];
  CNDecision *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = decision;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CNScript_detectionTrackForDecision___block_invoke;
  block[3] = &unk_25044F9F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (CNDetectionTrack *)v7;
}

void __38__CNScript_detectionTrackForDecision___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__CNScript_detectionTrackForDecision___block_invoke_2;
  v6[3] = &unk_25044FA90;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __38__CNScript_detectionTrackForDecision___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __38__CNScript_detectionTrackForDecision___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalDecision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackForDecision:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[CNDetectionTrack _trackFromInternal:](CNDetectionTrack, "_trackFromInternal:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (float)fNumber
{
  NSObject *v3;
  float v4;
  _QWORD v6[6];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CNScript queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __19__CNScript_fNumber__block_invoke;
  v6[3] = &unk_25044F860;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __19__CNScript_fNumber__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAperture");
  v4 = v3;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
}

- (void)setFNumber:(float)fNumber
{
  NSObject *v5;
  _QWORD v6[5];
  float v7;

  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __23__CNScript_setFNumber___block_invoke;
  v6[3] = &unk_25044FAB8;
  v6[4] = self;
  v7 = fNumber;
  dispatch_sync(v5, v6);

}

void __23__CNScript_setFNumber___block_invoke(uint64_t a1)
{
  int v1;
  double v2;
  id v3;

  v1 = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = v1;
  objc_msgSend(v3, "setUserAperture:", v2);

}

- (BOOL)addUserDecision:(CNDecision *)decision
{
  CNDecision *v4;
  NSObject *v5;
  CNDecision *v6;
  _QWORD block[5];
  CNDecision *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = decision;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__CNScript_addUserDecision___block_invoke;
  block[3] = &unk_25044F9F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __28__CNScript_addUserDecision___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__CNScript_addUserDecision___block_invoke_2;
  v4[3] = &unk_25044FAE0;
  v2 = (void *)a1[5];
  v4[4] = a1[4];
  v4[5] = v2;
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = __28__CNScript_addUserDecision___block_invoke_2((uint64_t)v4);

}

uint64_t __28__CNScript_addUserDecision___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalDecision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "addUserDecision:", v3);

  return v4;
}

- (BOOL)removeUserDecision:(CNDecision *)decision
{
  CNDecision *v4;
  NSObject *v5;
  CNDecision *v6;
  _QWORD block[5];
  CNDecision *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = decision;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__CNScript_removeUserDecision___block_invoke;
  block[3] = &unk_25044F9F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __31__CNScript_removeUserDecision___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__CNScript_removeUserDecision___block_invoke_2;
  v4[3] = &unk_25044FAE0;
  v2 = (void *)a1[5];
  v4[4] = a1[4];
  v4[5] = v2;
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = __31__CNScript_removeUserDecision___block_invoke_2((uint64_t)v4);

}

uint64_t __31__CNScript_removeUserDecision___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalDecision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "removeUserDecision:", v3);

  return v4;
}

- (void)removeAllUserDecisions
{
  NSObject *v3;
  _QWORD block[5];

  -[CNScript queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CNScript_removeAllUserDecisions__block_invoke;
  block[3] = &unk_25044FB08;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __34__CNScript_removeAllUserDecisions__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllUserDecisions");

}

- (CNDetectionID)addDetectionTrack:(CNDetectionTrack *)detectionTrack
{
  CNDetectionTrack *v4;
  NSObject *v5;
  CNDetectionTrack *v6;
  CNDetectionID v7;
  _QWORD block[5];
  CNDetectionTrack *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = detectionTrack;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CNScript_addDetectionTrack___block_invoke;
  block[3] = &unk_25044F9F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __30__CNScript_addDetectionTrack___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__CNScript_addDetectionTrack___block_invoke_2;
  v4[3] = &unk_25044FB30;
  v2 = (void *)a1[5];
  v4[4] = a1[4];
  v4[5] = v2;
  v3 = v2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = __30__CNScript_addDetectionTrack___block_invoke_2((uint64_t)v4);

}

int64_t __30__CNScript_addDetectionTrack___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "addTrack:", v3);

  if ((v4 & 1) == 0)
    return +[CNDetection invalidDetectionID](CNDetection, "invalidDetectionID");
  objc_msgSend(*(id *)(a1 + 40), "internalTrack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trackIdentifier");

  return v6;
}

- (BOOL)removeDetectionTrack:(CNDetectionTrack *)detectionTrack
{
  CNDetectionTrack *v4;
  NSObject *v5;
  CNDetectionTrack *v6;
  _QWORD block[5];
  CNDetectionTrack *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = detectionTrack;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CNScript queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CNScript_removeDetectionTrack___block_invoke;
  block[3] = &unk_25044F9F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __33__CNScript_removeDetectionTrack___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__CNScript_removeDetectionTrack___block_invoke_2;
  v4[3] = &unk_25044FAE0;
  v2 = (void *)a1[5];
  v4[4] = a1[4];
  v4[5] = v2;
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = __33__CNScript_removeDetectionTrack___block_invoke_2((uint64_t)v4);

}

uint64_t __33__CNScript_removeDetectionTrack___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "internalScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "removeTrack:", v3);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PTCinematographyScript)internalScript
{
  return (PTCinematographyScript *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalScript:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalScript, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CNScript_loadFromAsset_changes_progress_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_0(&dword_23307F000, v1, (uint64_t)v1, "Error %@: Failed to read script from asset %@", v2);
  OUTLINED_FUNCTION_2();
}

@end

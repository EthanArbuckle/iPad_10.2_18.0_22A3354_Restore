@implementation MLPredictionEvent

- (MLPredictionEvent)init
{
  MLPredictionEvent *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *predictionEventQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLPredictionEvent;
  v2 = -[MLPredictionEvent init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.CoreML.MLPredictionEvent", v3);
    predictionEventQueue = v2->_predictionEventQueue;
    v2->_predictionEventQueue = (OS_dispatch_queue *)v4;

    v2->_featuresPredictionCountSoFar = 0;
    v2->_epochIndex = 0;
    mach_timebase_info(&v2->_timebaseInfo);

  }
  return v2;
}

void __45__MLPredictionEvent_maybeLogPredictionEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  MLPredictionEventMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MLPredictionEventMetric *obj;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 24);
  if (predictionEventEpochs[v2] == *(_QWORD *)(v1 + 16))
  {
    *(_QWORD *)(v1 + 24) = v2 + 1;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(unsigned int *)(v4 + 40);
    v6 = *(unsigned int *)(v4 + 44);
    v8 = [MLPredictionEventMetric alloc];
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstPartyExecutable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    obj = -[MLPredictionEventMetric initWithBundleIdentifier:modelName:firstPartyExecutable:modelType:featuresPredictionDuration:featuresPredictionCountSoFar:](v8, "initWithBundleIdentifier:modelName:firstPartyExecutable:modelType:featuresPredictionDuration:featuresPredictionCountSoFar:", v9, v10, v11, v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (double)(v5 * v7 / v6) / 1000000000.0);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), obj);
    +[MLReporter reporter](MLReporter, "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logMetric:", obj);

  }
}

- (void)setModelType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFirstPartyExecutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)maybeLogPredictionEvent:(unint64_t)a3
{
  NSObject *predictionEventQueue;
  _QWORD v4[6];

  predictionEventQueue = self->_predictionEventQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MLPredictionEvent_maybeLogPredictionEvent___block_invoke;
  v4[3] = &unk_1E3D66BA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(predictionEventQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastReportedMetric, 0);
  objc_storeStrong((id *)&self->_predictionEventQueue, 0);
}

- (id)lastReportedMetric
{
  NSObject *predictionEventQueue;
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
  v9 = __Block_byref_object_copy__21385;
  v10 = __Block_byref_object_dispose__21386;
  v11 = 0;
  predictionEventQueue = self->_predictionEventQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MLPredictionEvent_lastReportedMetric__block_invoke;
  v5[3] = &unk_1E3D66E20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(predictionEventQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MLPredictionEvent_lastReportedMetric__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

@end

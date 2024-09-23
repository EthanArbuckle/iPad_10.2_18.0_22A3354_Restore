@implementation ATXScoreInterpreterCoreMLModel

void __121___ATXScoreInterpreterCoreMLModel_getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures_outputSpecification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  _ATXScoreInterpreterCoreMLModelFeature *v7;
  _ATXScoreInterpreterCoreMLModelFeature *v8;
  id v9;

  v9 = a3;
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = [_ATXScoreInterpreterCoreMLModelFeature alloc];
  if ((isKindOfClass & 1) != 0)
  {
    v8 = -[_ATXScoreInterpreterCoreMLModelFeature initWithFeatureName:multiArraySize:](v7, "initWithFeatureName:multiArraySize:", v5, objc_msgSend(v9, "count"));

    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v9);
  }
  else
  {
    v8 = -[_ATXScoreInterpreterCoreMLModelFeature initWithFeatureName:](v7, "initWithFeatureName:", v5);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __93___ATXScoreInterpreterCoreMLModel_predictionForEvaluatedFeatures_withOutputIndexedSubscript___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = *(void **)(a2 + 8);
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "predictionFromFeatures:error:", v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end

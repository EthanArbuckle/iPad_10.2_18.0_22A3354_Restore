@implementation MPSGraphStochasticGradientDescentOptimizer

- (MPSGraphStochasticGradientDescentOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphStochasticGradientDescentOptimizer *v17;
  void *v18;
  NSArray *trainableVariables;
  MPSGraphStochasticGradientDescentOptimizer *v20;
  id v21;
  id v22;
  uint64_t v23;
  NSDictionary *variablesToUpdateOpMap;
  void *v25;
  MPSGraphStochasticGradientDescentOptimizer *v26;
  _QWORD v28[4];
  MPSGraphStochasticGradientDescentOptimizer *v29;
  id v30;
  id v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphStochasticGradientDescentOptimizer;
  v17 = -[MPSGraphOptimizer initWithGraph:learningRateTensor:trainableVariables:variablesToGradientTensorMap:name:](&v32, sel_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name_, v12, v13, v14, v15, v16);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  trainableVariables = v17->super._trainableVariables;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __132__MPSGraphStochasticGradientDescentOptimizer_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name___block_invoke;
  v28[3] = &unk_1E0E76E70;
  v20 = v17;
  v29 = v20;
  v21 = v15;
  v30 = v21;
  v22 = v18;
  v31 = v22;
  -[NSArray enumerateObjectsUsingBlock:](trainableVariables, "enumerateObjectsUsingBlock:", v28);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  variablesToUpdateOpMap = v20->super._variablesToUpdateOpMap;
  v20->super._variablesToUpdateOpMap = (NSDictionary *)v23;

  v25 = v31;
  v26 = v20;

  return v26;
}

void __132__MPSGraphStochasticGradientDescentOptimizer_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v6 = *(_QWORD *)(v4 + 16);
  v9 = v3;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyStochasticGradientDescentWithLearningRateTensor:variable:gradientTensor:name:", v6, v9, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v9);
}

@end

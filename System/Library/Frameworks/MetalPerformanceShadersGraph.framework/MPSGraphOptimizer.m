@implementation MPSGraphOptimizer

- (MPSGraphOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MPSGraphOptimizer *v18;
  NSDictionary *variablesToUpdateOpMap;
  uint64_t v20;
  NSArray *trainableVariables;
  objc_class *v23;
  void *v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MPSGraphOptimizer;
  v18 = -[MPSGraphOptimizer init](&v25, sel_init);
  objc_storeStrong((id *)&v18->_graph, a3);
  objc_storeStrong((id *)&v18->_learningRateTensor, a4);
  objc_storeStrong((id *)&v18->_variablesToGradientTensorMap, a6);
  variablesToUpdateOpMap = v18->_variablesToUpdateOpMap;
  v18->_variablesToUpdateOpMap = 0;

  v20 = objc_msgSend(v15, "copy");
  trainableVariables = v18->_trainableVariables;
  v18->_trainableVariables = (NSArray *)v20;

  if (v17)
  {
    objc_storeStrong((id *)&v18->_name, v17);
  }
  else
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v18->_name, v24);

  }
  return v18;
}

- (MPSGraphOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  MPSGraphOptimizer *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke;
  v28[3] = &unk_1E0E76DF8;
  v19 = v17;
  v29 = v19;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v28);
  objc_msgSend(v12, "gradientForPrimaryTensor:withTensors:name:", v13, v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke_2;
  v25[3] = &unk_1E0E76E20;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v21;
  v22 = v20;
  v27 = v22;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v25);
  v23 = -[MPSGraphOptimizer initWithGraph:learningRateTensor:trainableVariables:variablesToGradientTensorMap:name:](self, "initWithGraph:learningRateTensor:trainableVariables:variablesToGradientTensorMap:name:", v12, v14, v15, v21, v16);

  return v23;
}

void __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "outputTensors");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

- (NSArray)updateOperations
{
  void *v3;
  NSArray *trainableVariables;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  MPSGraphOptimizer *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  trainableVariables = self->_trainableVariables;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__MPSGraphOptimizer_updateOperations__block_invoke;
  v11 = &unk_1E0E76E48;
  v5 = v3;
  v12 = v5;
  v13 = self;
  -[NSArray enumerateObjectsUsingBlock:](trainableVariables, "enumerateObjectsUsingBlock:", &v8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

void __37__MPSGraphOptimizer_updateOperations__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (NSDictionary)variablesToGradientTensorMap
{
  return self->_variablesToGradientTensorMap;
}

- (NSDictionary)variablesToUpdateOpMap
{
  return self->_variablesToUpdateOpMap;
}

- (MPSGraphTensor)learningRateTensor
{
  return self->_learningRateTensor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_variablesToUpdateOpMap, 0);
  objc_storeStrong((id *)&self->_variablesToGradientTensorMap, 0);
  objc_storeStrong((id *)&self->_trainableVariables, 0);
  objc_storeStrong((id *)&self->_learningRateTensor, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end

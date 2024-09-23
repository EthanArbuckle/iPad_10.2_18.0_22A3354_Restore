@implementation MPSGraphAdamOptimizer

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 momentumTensors:(id)a5 velocityTensors:(id)a6 maximumVelocityTensors:(id)a7 beta1:(float)a8 beta2:(float)a9 epsilon:(float)a10 iterations:(unint64_t)a11 trainableVariables:(id)a12 variablesToGradientTensorMap:(id)a13 name:(id)a14
{
  id v23;
  id v24;
  MPSGraphAdamOptimizer *v25;
  uint64_t v26;
  MPSGraphTensor *beta1Tensor;
  uint64_t v28;
  MPSGraphTensor *beta2Tensor;
  uint64_t v30;
  MPSGraphTensor *epsilonTensor;
  MPSGraph *graph;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MPSGraphVariableOp *iterationsVariable;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  MPSGraph *v42;
  void *v43;
  uint64_t v44;
  MPSGraph *v45;
  void *v46;
  void *v47;
  MPSGraph *v48;
  MPSGraphTensor *v49;
  void *v50;
  MPSGraph *v51;
  MPSGraphTensor *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSArray *trainableVariables;
  id v57;
  MPSGraphAdamOptimizer *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  NSDictionary *variablesToUpdateOpMap;
  void *v67;
  MPSGraphAdamOptimizer *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  MPSGraphAdamOptimizer *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;

  v23 = a3;
  v24 = a4;
  v83 = a5;
  v82 = a6;
  v81 = a7;
  v95.receiver = self;
  v95.super_class = (Class)MPSGraphAdamOptimizer;
  v78 = a12;
  v79 = v23;
  v85 = v24;
  v80 = a13;
  v77 = a14;
  v25 = -[MPSGraphOptimizer initWithGraph:learningRateTensor:trainableVariables:variablesToGradientTensorMap:name:](&v95, sel_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name_, v23, v24, v78, v80);
  -[MPSGraph constantWithScalar:shape:dataType:](v25->super._graph, "constantWithScalar:shape:dataType:", &unk_1E0E9B890, 268435488, a8);
  v26 = objc_claimAutoreleasedReturnValue();
  beta1Tensor = v25->_beta1Tensor;
  v25->_beta1Tensor = (MPSGraphTensor *)v26;

  -[MPSGraph constantWithScalar:shape:dataType:](v25->super._graph, "constantWithScalar:shape:dataType:", &unk_1E0E9B8A8, 268435488, a9);
  v28 = objc_claimAutoreleasedReturnValue();
  beta2Tensor = v25->_beta2Tensor;
  v25->_beta2Tensor = (MPSGraphTensor *)v28;

  -[MPSGraph constantWithScalar:shape:dataType:](v25->super._graph, "constantWithScalar:shape:dataType:", &unk_1E0E9B8C0, 268435488, a10);
  v30 = objc_claimAutoreleasedReturnValue();
  epsilonTensor = v25->_epsilonTensor;
  v25->_epsilonTensor = (MPSGraphTensor *)v30;

  graph = v25->super._graph;
  +[MPSGraphVariableInitializer initializerWithConstant:](MPSGraphVariableInitializer, "initializerWithConstant:", (double)a11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "initializedDataWithNumberOfValues:dataType:", 1, 268435488);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingFormat:](v25->super._name, "stringByAppendingFormat:", CFSTR("/iterations"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph variableWithData:shape:dataType:name:](graph, "variableWithData:shape:dataType:name:", v34, &unk_1E0E9B8D8, 268435488, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "operation");
  v37 = objc_claimAutoreleasedReturnValue();
  iterationsVariable = v25->_iterationsVariable;
  v25->_iterationsVariable = (MPSGraphVariableOp *)v37;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation outputTensors](v25->_iterationsVariable, "outputTensors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
  v40 = objc_claimAutoreleasedReturnValue();

  v75 = (void *)v40;
  -[MPSGraph constantWithScalar:shape:dataType:](v25->super._graph, "constantWithScalar:shape:dataType:", &unk_1E0E9B8F0, 268435488, 1.0);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v25->super._graph;
  v74 = (void *)v41;
  -[NSString stringByAppendingString:](v25->super._name, "stringByAppendingString:", CFSTR("/iterations_add1"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](v42, "additionWithPrimaryTensor:secondaryTensor:name:", v40, v41, v43);
  v44 = objc_claimAutoreleasedReturnValue();

  v45 = v25->super._graph;
  v73 = (void *)v44;
  -[NSString stringByAppendingString:](v25->super._name, "stringByAppendingString:", CFSTR("/iterations_add1_assign"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph assignVariable:withValueOfTensor:name:](v45, "assignVariable:withValueOfTensor:name:", v40, v44, v46);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString stringByAppendingString:](v25->super._name, "stringByAppendingString:", CFSTR("/learningRateUpdate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v25->super._graph;
  v49 = v25->_beta1Tensor;
  v71 = v47;
  objc_msgSend(v47, "stringByAppendingString:", CFSTR("/beta1Power"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph powerWithPrimaryTensor:secondaryTensor:name:](v48, "powerWithPrimaryTensor:secondaryTensor:name:", v49, v40, v50);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v25->super._graph;
  v52 = v25->_beta2Tensor;
  objc_msgSend(v47, "stringByAppendingString:", CFSTR("/beta2Power"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph powerWithPrimaryTensor:secondaryTensor:name:](v51, "powerWithPrimaryTensor:secondaryTensor:name:", v52, v40, v53);
  v54 = objc_claimAutoreleasedReturnValue();

  v70 = (void *)v54;
  -[MPSGraph currentLearningRateWithLearningRateTensor:beta1Tensor:beta2Tensor:beta1PowerTensor:beta2PowerTensor:name:](v25->super._graph, "currentLearningRateWithLearningRateTensor:beta1Tensor:beta2Tensor:beta1PowerTensor:beta2PowerTensor:name:", v24, v25->_beta1Tensor, v25->_beta2Tensor, v84, v54, v47);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  trainableVariables = v25->super._trainableVariables;
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke;
  v86[3] = &unk_1E0E76EC0;
  v57 = v80;
  v87 = v57;
  v58 = v25;
  v88 = v58;
  v59 = v83;
  v89 = v59;
  v60 = v82;
  v90 = v60;
  v61 = v81;
  v91 = v61;
  v62 = v55;
  v92 = v62;
  v63 = v72;
  v93 = v63;
  v64 = v76;
  v94 = v64;
  -[NSArray enumerateObjectsUsingBlock:](trainableVariables, "enumerateObjectsUsingBlock:", v86);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v64);
  v65 = objc_claimAutoreleasedReturnValue();
  variablesToUpdateOpMap = v58->super._variablesToUpdateOpMap;
  v58->super._variablesToUpdateOpMap = (NSDictionary *)v65;

  v67 = v94;
  v68 = v58;

  return v68;
}

void __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v48 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v48);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke_2;
  v49[3] = &unk_1E0E76E98;
  v49[4] = &v50;
  v43 = v3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v49);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initializedDataWithNumberOfValues:dataType:", v51[3], 268435488);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(v48, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("/%@/momentum"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "variableWithData:shape:dataType:name:", v6, v7, 268435488, v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 48);
  if (v11)
    objc_msgSend(v11, "addObject:", v47);
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "initializedDataWithNumberOfValues:dataType:", v51[3], 268435488);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(v48, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("/%@/velocity"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "variableWithData:shape:dataType:name:", v14, v15, 268435488, v18);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(void **)(a1 + 56);
  if (v19)
    objc_msgSend(v19, "addObject:", v46);
  if (*(_QWORD *)(a1 + 64))
  {
    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "initializedDataWithNumberOfValues:dataType:", v51[3], 268435488);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(v48, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("/%@/maxVelocity"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "variableWithData:shape:dataType:name:", v22, v23, 268435488, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "addObject:", v27);
    v28 = (void *)v27;
  }
  else
  {
    v28 = 0;
  }
  v29 = *(_QWORD **)(a1 + 40);
  v30 = (void *)v29[1];
  v31 = v29[7];
  v32 = *(_QWORD *)(a1 + 72);
  v33 = v29[8];
  v34 = v29[9];
  v42 = v28;
  objc_msgSend(v47, "operation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "operation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(a1 + 64);
  if (v35)
  {
    objc_msgSend(v28, "operation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v37 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(v48, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("/%@/adamUpdate"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applyAdamWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:variable:momentumVariable:velocityVariable:maximumVelocityVariable:gradientTensor:name:", v32, v31, v33, v34, v48, v41, v44, v36, v45, v39);
  v40 = (id *)objc_claimAutoreleasedReturnValue();

  if (v35)
  objc_msgSend(v40[4], "addObject:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 88), "setObject:forKey:", v40, v48);

  _Block_object_dispose(&v50, 8);
}

void __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) *= objc_msgSend(v3, "integerValue");

}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 momentumTensors:(id)a6 velocityTensors:(id)a7 maximumVelocityTensors:(id)a8 beta1:(float)a9 beta2:(float)a10 epsilon:(float)a11 iterations:(unint64_t)a12 trainableVariables:(id)a13 name:(id)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MPSGraphAdamOptimizer *v31;
  double v32;
  double v33;
  double v34;
  MPSGraphAdamOptimizer *v35;
  objc_super v37;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a13;
  v30 = a14;
  v37.receiver = self;
  v37.super_class = (Class)MPSGraphAdamOptimizer;
  v31 = -[MPSGraphOptimizer initWithGraph:lossTensor:learningRateTensor:trainableVariables:name:](&v37, sel_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name_, v23, v24, v25, v29, v30);
  *(float *)&v32 = a9;
  *(float *)&v33 = a10;
  *(float *)&v34 = a11;
  v35 = -[MPSGraphAdamOptimizer initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:](v31, "initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:", v23, v25, v26, v27, v28, a12, v32, v33, v34, v31->super._trainableVariables, v31->super._variablesToGradientTensorMap, v30);

  return v35;
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 beta1:(float)a6 beta2:(float)a7 epsilon:(float)a8 iterations:(unint64_t)a9 trainableVariables:(id)a10 name:(id)a11
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MPSGraphAdamOptimizer *v25;
  double v26;
  double v27;
  double v28;
  MPSGraphAdamOptimizer *v29;
  objc_super v31;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a10;
  v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)MPSGraphAdamOptimizer;
  v25 = -[MPSGraphOptimizer initWithGraph:lossTensor:learningRateTensor:trainableVariables:name:](&v31, sel_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name_, v20, v21, v22, v23, v24);
  *(float *)&v26 = a6;
  *(float *)&v27 = a7;
  *(float *)&v28 = a8;
  v29 = -[MPSGraphAdamOptimizer initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:](v25, "initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:", v20, v22, 0, 0, 0, a9, v26, v27, v28, v25->super._trainableVariables, v25->super._variablesToGradientTensorMap, v24);

  return v29;
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  double v7;
  double v8;
  double v9;

  LODWORD(v7) = 1063675494;
  LODWORD(v8) = 1065336439;
  LODWORD(v9) = 869711765;
  return -[MPSGraphAdamOptimizer initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:](self, "initWithGraph:learningRateTensor:momentumTensors:velocityTensors:maximumVelocityTensors:beta1:beta2:epsilon:iterations:trainableVariables:variablesToGradientTensorMap:name:", a3, a4, 0, 0, 0, 0, v7, v8, v9, a5, a6, a7);
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPSGraphAdamOptimizer;
  return -[MPSGraphOptimizer initWithGraph:lossTensor:learningRateTensor:trainableVariables:name:](&v8, sel_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name_, a3, a4, a5, a6, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationsVariable, 0);
  objc_storeStrong((id *)&self->_epsilonTensor, 0);
  objc_storeStrong((id *)&self->_beta2Tensor, 0);
  objc_storeStrong((id *)&self->_beta1Tensor, 0);
}

@end

@implementation MLCTrainingGraph

+ (MLCTrainingGraph)graphWithGraphObjects:(NSArray *)graphObjects lossLayer:(MLCLayer *)lossLayer optimizer:(MLCOptimizer *)optimizer
{
  MLCOptimizer *v8;
  MLCLayer *v9;
  NSArray *v10;
  void *v11;

  v8 = optimizer;
  v9 = lossLayer;
  v10 = graphObjects;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphObjects:lossLayer:optimizer:", v10, v9, v8);

  return (MLCTrainingGraph *)v11;
}

- (MLCTrainingGraph)init
{
  void *v3;
  void *v4;
  MLCTrainingGraph *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MLCTrainingGraph initWithGraphObjects:lossLayer:optimizer:](self, "initWithGraphObjects:lossLayer:optimizer:", v4, 0, 0);

  return v5;
}

- (MLCTrainingGraph)initWithGraphObjects:(id)a3 lossLayer:(id)a4 optimizer:(id)a5
{
  id v9;
  id v10;
  MLCTrainingGraph *v11;
  MLCTrainingGraph *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *optimizerUpdateLayerList;
  uint64_t v16;
  NSMutableArray *optimizerParameterList;
  uint64_t v18;
  NSMutableArray *lossLayersInTrainingGraph;
  uint64_t v20;
  NSMutableArray *stopGradientTensorList;
  uint64_t v22;
  NSSet *optimizerUpdateDeviceList;
  MLCLayer *v24;
  MLCLayer *dummyLayer;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  objc_super v33;
  objc_super v34;
  objc_super v35;
  objc_super v36;

  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)MLCTrainingGraph;
  v11 = -[MLCGraph initWithGraphObjects:](&v36, sel_initWithGraphObjects_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lossLayer, a4);
    objc_storeStrong((id *)&v12->_optimizer, a5);
    v13 = (void *)MEMORY[0x1E0C9AA60];
    v14 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    optimizerUpdateLayerList = v12->_optimizerUpdateLayerList;
    v12->_optimizerUpdateLayerList = (NSMutableArray *)v14;

    v16 = objc_msgSend(v13, "mutableCopy");
    optimizerParameterList = v12->_optimizerParameterList;
    v12->_optimizerParameterList = (NSMutableArray *)v16;

    v18 = objc_msgSend(v13, "mutableCopy");
    lossLayersInTrainingGraph = v12->_lossLayersInTrainingGraph;
    v12->_lossLayersInTrainingGraph = (NSMutableArray *)v18;

    v20 = objc_msgSend(v13, "mutableCopy");
    stopGradientTensorList = v12->_stopGradientTensorList;
    v12->_stopGradientTensorList = (NSMutableArray *)v20;

    v22 = objc_msgSend(v13, "copy");
    optimizerUpdateDeviceList = v12->_optimizerUpdateDeviceList;
    v12->_optimizerUpdateDeviceList = (NSSet *)v22;

    v12->_firstTrainableLayerIndex = 0x7FFFFFFFLL;
    v12->_allocateResultGradientTensors = 1;
    v12->_allocateOptimizerData = 1;
    v12->_updateOptimizerTimeStep = 1;
    v24 = -[MLCLayer initWithLabel:]([MLCLayer alloc], "initWithLabel:", CFSTR("Dummy"));
    dummyLayer = v12->_dummyLayer;
    v12->_dummyLayer = v24;

    if (v9)
    {
      v35.receiver = v12;
      v35.super_class = (Class)MLCTrainingGraph;
      -[MLCGraph graphLayerList](&v35, sel_graphLayerList);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34.receiver = v12;
      v34.super_class = (Class)MLCTrainingGraph;
      -[MLCGraph graphLayerList](&v34, sel_graphLayerList);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v27, "count") - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resultTensors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33.receiver = v12;
      v33.super_class = (Class)MLCTrainingGraph;
      v31 = -[MLCGraph nodeWithLayer:source:](&v33, sel_nodeWithLayer_source_, v9, v30);

    }
  }

  return v12;
}

- (void)dealloc
{
  MLCOptimizer *optimizer;
  objc_super v4;

  -[NSMutableArray removeAllObjects](self->_optimizerUpdateLayerList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_optimizerParameterList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_rootSourceGradientTensor, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_lossLayersInTrainingGraph, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_stopGradientTensorList, "removeAllObjects");
  optimizer = self->_optimizer;
  self->_optimizer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MLCTrainingGraph;
  -[MLCGraph dealloc](&v4, sel_dealloc);
}

- (BOOL)isSourceTensorSharableWithResultGradientTensor:(id)a3 layer:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  unint64_t v17;

  v6 = a3;
  if ((objc_msgSend(a4, "isDebuggingEnabled") & 1) != 0
    || (objc_msgSend(v6, "childLayers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 != 1))
  {
    v15 = 0;
  }
  else
  {
    -[MLCGraph allOutputs](self, "allOutputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        -[MLCGraph allOutputs](self, "allOutputs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v14 != v6;
        if (v14 == v6)
          break;
        ++v11;
        -[MLCGraph allOutputs](self, "allOutputs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v11 < v17);
    }
    else
    {
      v15 = 1;
    }
  }

  return v15;
}

- (BOOL)allocateRootSourceGradientTensors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCTrainingGraph setRootSourceGradientTensor:](self, "setRootSourceGradientTensor:", v5);

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v49 = 0;
    v8 = 0;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v10, "skipLayer") & 1) == 0)
      {
        if (objc_msgSend(v10, "isTrainable"))
        {
          objc_msgSend(v10, "sourceTensors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            v13 = 0;
            v48 = v8;
            do
            {
              objc_msgSend(v10, "sourceTensors");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v15, "computeFlags") & 8) == 0)
              {
                objc_msgSend(v15, "parentLayers");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "count");

                if (!v17)
                {
                  objc_msgSend(v15, "childLayers");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "count");

                  if (v19)
                  {
                    v20 = 0;
                    v21 = 0;
                    do
                    {
                      objc_msgSend(v15, "childLayers");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 += objc_msgSend(v23, "isGradientNeededForTensor:", v15);

                      ++v20;
                      objc_msgSend(v15, "childLayers");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "count");

                    }
                    while (v20 < v25);
                  }
                  else
                  {
                    v21 = 0;
                  }
                  v26 = v21 - 1;
                  if (!v21)
                    v26 = 0;
                  v27 = v26 + v21;
                  v28 = objc_msgSend(v15, "rootSourceGradientTensorCount");
                  if (!objc_msgSend(v15, "rootSourceGradientTensorIndexStart")
                    || v27 > objc_msgSend(v15, "rootSourceGradientTensorCount"))
                  {
                    v29 = objc_msgSend(v15, "rootSourceGradientTensorIndex");
                    v30 = v29 - objc_msgSend(v15, "rootSourceGradientTensorIndexStart");
                    objc_msgSend(v15, "setRootSourceGradientTensorIndexStart:", v49 + 1);
                    objc_msgSend(v15, "setRootSourceGradientTensorCount:", v27);
                    objc_msgSend(v15, "setRootSourceGradientTensorIndex:", v30 + objc_msgSend(v15, "rootSourceGradientTensorIndexStart"));
                    for (; v28 < v27; ++v28)
                    {
                      objc_msgSend(v15, "descriptor");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v31);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v32, "setDevice:", v4);
                      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "setObject:atIndexedSubscript:", v32, objc_msgSend(v15, "rootSourceGradientTensorIndex") + v28 - 1);

                    }
                    v8 = v48;
                    if (v27 > 1)
                    {
                      objc_msgSend(v15, "intermediateSumLayer");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v34)
                      {
                        +[MLCArithmeticLayer layerWithOperation:](MLCArithmeticLayer, "layerWithOperation:", 0);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart") - 1);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        v50[0] = v45;
                        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v50[1] = v43;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v15, "rootSourceGradientTensorIndexStart") + 1);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v47, "compileForDevice:sourceTensors:resultTensor:", v4, v35, v37);

                        objc_msgSend(v15, "setIntermediateSumLayer:", v47);
                      }
                    }
                    v49 += v27;
                  }
                }
              }

              ++v13;
              objc_msgSend(v10, "sourceTensors");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "count");

            }
            while (v13 < v39);
          }
        }
      }

      ++v8;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

    }
    while (v8 < v41);
  }

  return 1;
}

- (void)sumRootSourceGradientTensor:(id)a3 device:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MLCTrainingGraph *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v31, "rootSourceGradientTensorCount") >= 2)
  {
    v7 = objc_msgSend(v31, "rootSourceGradientTensorIndex");
    v8 = objc_msgSend(v31, "rootSourceGradientTensorIndexStart");
    v9 = v8 - 1;
    v28 = v8 - 2;
    if (v8 - 1 < (unint64_t)(v8 - 2 + objc_msgSend(v31, "rootSourceGradientTensorCount")))
    {
      v10 = v7 - 1;
      v27 = v6;
      do
      {
        objc_msgSend(v6, "computeEngine");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "needToAllocateDeviceMemoryForTensor:", v13);

        if (v14)
        {
          objc_msgSend(v6, "computeEngine");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allocateDeviceMemoryForTensor:", v17);

        }
        objc_msgSend(v6, "computeEngine");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "intermediateSumLayer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "deviceOps");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v9 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
        v23 = self;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v26) = 0;
        objc_msgSend(v18, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v19, v20, v22, 0, v25, 0, v26);

        self = v23;
        v6 = v27;

        ++v10;
        v9 += 2;
      }
      while (v9 < v28 + objc_msgSend(v31, "rootSourceGradientTensorCount"));
    }
  }

}

- (void)sumAllRootSourceGradientTensors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[MLCGraph compilerOptions](self, "compilerOptions") & 1) != 0
    || (-[MLCGraph compilerOptions](self, "compilerOptions") & 8) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[MLCGraph allInputs](self, "allInputs", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
          -[MLCGraph allInputs](self, "allInputs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[MLCTrainingGraph sumRootSourceGradientTensor:device:](self, "sumRootSourceGradientTensor:device:", v20, v4);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
  else
  {
    -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      do
      {
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "tensor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCTrainingGraph sumRootSourceGradientTensor:device:](self, "sumRootSourceGradientTensor:device:", v10, v4);

        ++v7;
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

      }
      while (v7 < v12);
    }
  }

}

- (BOOL)allocateGradientTensorsForMultipleChildrenOfLayer:(id)a3 gradientTensorsAreTemporary:(BOOL)a4 device:(id)a5
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    objc_msgSend(v6, "resultTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v8 >= v13)
      break;
    objc_msgSend(v6, "resultTensors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "childLayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v9 += objc_msgSend(v17, "compileForInferenceOnly") ^ 1;
    ++v8;
  }
  if (v9 > 1)
  {
    objc_msgSend(v6, "sourceGradientTensors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 2 * v9 - 2;
    objc_msgSend(v6, "intermediateGradientTensors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    for (i = v22 - (v22 != 0); i < v20; ++i)
    {
      objc_msgSend(v19, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intermediateGradientTensors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, i);

      objc_msgSend(v6, "intermediateGradientTensors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", i);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDevice:", v7);

    }
    objc_msgSend(v6, "intermediateGradientTensors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:atIndexedSubscript:", v19, 2 * v9 - 2);

    objc_msgSend(v6, "setZeroIntermediateGradientTensors:", 1);
    objc_msgSend(v6, "intermediateSumLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      +[MLCArithmeticLayer layerWithOperation:](MLCArithmeticLayer, "layerWithOperation:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intermediateGradientTensors");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v33;
      objc_msgSend(v6, "intermediateGradientTensors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "compileForDevice:sourceTensors:resultTensor:", v7, v36, v19);

      objc_msgSend(v6, "setIntermediateSumLayer:", v31);
    }

  }
  return v9 > 1;
}

- (BOOL)allocateGradientTensorsForMultipleChildrenOfSplitLayer:(id)a3 tensor:(id)a4 gradientTensorsAreTemporary:(BOOL)a5 device:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v8, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_msgSend(v8, "resultTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 0;
    while (1)
    {
      objc_msgSend(v8, "resultTensors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17 == v9)
        break;
      ++v15;
      objc_msgSend(v8, "resultTensors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v15 >= v19)
        goto LABEL_7;
    }
    v12 = v15;
  }
LABEL_7:
  objc_msgSend(v8, "resultTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v12 < v21)
  {
    objc_msgSend(v8, "sourceGradientTensors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "intermediateGradientTensors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    objc_msgSend(v23, "descriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setDevice:", v10);
    objc_msgSend(v27, "setSplitOffset:", objc_msgSend(v23, "splitOffset"));
    objc_msgSend(v27, "setSplitDimension:", objc_msgSend(v23, "splitDimension"));
    objc_msgSend(v8, "intermediateGradientTensors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, v25);

    objc_msgSend(v8, "setZeroIntermediateGradientTensors:", 1);
    objc_msgSend(v8, "intermediateSumLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      +[MLCArithmeticLayer layerWithOperation:](MLCArithmeticLayer, "layerWithOperation:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v23;
      v33[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "compileForDevice:sourceTensors:resultTensor:", v10, v31, v27);

      objc_msgSend(v8, "setIntermediateSumLayer:", v30);
    }

  }
  return v12 < v21;
}

- (void)sumIntermediateGradientTensorsForLayer:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;

  v73 = a3;
  if (objc_msgSend(v73, "intermediateGradientTensorIndex"))
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      objc_msgSend(v73, "resultTensors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "childLayers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v3 >= v8)
        break;
      objc_msgSend(v73, "resultTensors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "childLayers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v4 += objc_msgSend(v12, "compileForInferenceOnly") ^ 1;
      ++v3;
    }
    v13 = objc_msgSend(v73, "zeroIntermediateGradientTensors");
    v14 = v73;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v73, "setZeroIntermediateGradientTensors:", 0);
      v14 = v73;
      if (v4)
      {
        v15 = 0;
        while (1)
        {
          objc_msgSend(v14, "device");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "computeEngine");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "intermediateGradientTensors");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "needToAllocateDeviceMemoryForTensor:", v19);

          if ((v20 & 1) != 0)
            break;
          ++v15;
          v14 = v73;
          if (v4 == v15)
            goto LABEL_16;
        }
        objc_msgSend(v73, "intermediateGradientTensors");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "descriptor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = malloc_type_calloc(objc_msgSend(v23, "tensorAllocationSizeInBytes"), 1uLL, 0x8014B21DuLL);

        v25 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v73, "intermediateGradientTensors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "descriptor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dataWithBytesNoCopy:length:freeWhenDone:", v24, objc_msgSend(v28, "tensorAllocationSizeInBytes"), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v73;
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(v30, "device");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "computeEngine");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "intermediateGradientTensors");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v33, "needToAllocateDeviceMemoryForTensor:", v35);

          if (v36)
          {
            objc_msgSend(v73, "device");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "computeEngine");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "intermediateGradientTensors");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "allocateDeviceMemoryForTensor:", v40);

            objc_msgSend(v73, "intermediateGradientTensors");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectAtIndexedSubscript:", i);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setData:", v29);

            objc_msgSend(v73, "device");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "computeEngine");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "intermediateGradientTensors");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndexedSubscript:", i);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "dispatchBroadcastTensor:", v46);

          }
          v30 = v73;
        }

        v14 = v73;
      }
    }
LABEL_16:
    objc_msgSend(v14, "intermediateGradientTensors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48 != 1)
    {
      v49 = 0;
      do
      {
        objc_msgSend(v73, "device");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "computeEngine");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "intermediateGradientTensors");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndexedSubscript:", v4);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v51, "needToAllocateDeviceMemoryForTensor:", v53);

        if (v54)
        {
          objc_msgSend(v73, "device");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "computeEngine");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "intermediateGradientTensors");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectAtIndexedSubscript:", v4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "allocateDeviceMemoryForTensor:", v58);

        }
        objc_msgSend(v73, "device");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "computeEngine");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "intermediateSumLayer");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "deviceOps");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "intermediateGradientTensors");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectAtIndexedSubscript:", v49);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "intermediateGradientTensors");
        v63 = v4;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndexedSubscript:", v49 + 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "intermediateGradientTensors");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndexedSubscript:", v63);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v70) = 0;
        objc_msgSend(v59, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v60, v62, v65, 0, v67, 0, v70);

        v4 = v63 + 1;
        objc_msgSend(v73, "intermediateGradientTensors");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "count") - 1;

        v49 += 2;
      }
      while (v49 < v69);
    }
  }

}

- (id)resultGradientTensorToUseByExecuteGradientForLayer:(id)a3 sourceIndex:(unint64_t)a4 incrementIntermediateIndex:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "sourceTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "rootSourceGradientTensorIndex"))
  {
    objc_msgSend(v8, "sourceTensors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentLayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "intermediateGradientTensors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v16, "intermediateGradientTensors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v16, "intermediateGradientTensorIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          objc_msgSend(v16, "setIntermediateGradientTensorIndex:", objc_msgSend(v16, "intermediateGradientTensorIndex") + 1);
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "resultTensors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v20, "count");

    if (v12)
    {
      v21 = 0;
      v12 = 0;
      do
      {
        objc_msgSend(v16, "resultTensors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v10)
        {
          objc_msgSend(v16, "sourceGradientTensors");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v21);
          v25 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v25;
        }
        ++v21;
        objc_msgSend(v16, "resultTensors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

      }
      while (v21 < v27);
    }
    goto LABEL_15;
  }
  -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "rootSourceGradientTensorIndex") - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (unint64_t)objc_msgSend(v10, "rootSourceGradientTensorCount") >= 2)
    objc_msgSend(v10, "setRootSourceGradientTensorIndex:", objc_msgSend(v10, "rootSourceGradientTensorIndex") + 1);
LABEL_16:

  return v12;
}

- (void)linkRelatedGradientTensorsForConcatLayer:(id)a3 device:(id)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "dimension");
  objc_msgSend(v18, "sourceTensors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v18, "resultGradientTensors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setConcatOffset:", v7);
      objc_msgSend(v10, "setConcatDimension:", v4);
      objc_msgSend(v18, "sourceTensors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "descriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 += objc_msgSend(v15, "unsignedIntegerValue");

      ++v8;
      objc_msgSend(v18, "sourceTensors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v8 < v17);
  }

}

- (BOOL)setTrainingTensorParameters:(NSArray *)parameters
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v19;

  v5 = parameters;
  -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph setTrainingTensorParameters:].cold.2(a2);
LABEL_4:

    v9 = 0;
    goto LABEL_14;
  }
  if (-[NSArray count](v5, "count"))
  {
    v10 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tensor");
      v8 = objc_claimAutoreleasedReturnValue();

      -[NSObject parentLayers](v8, "parentLayers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        break;
      -[NSObject childLayers](v8, "childLayers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "count");

      if (++v10 >= -[NSArray count](v5, "count"))
        goto LABEL_9;
    }

    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph setTrainingTensorParameters:].cold.1(a2);

    goto LABEL_4;
  }
LABEL_9:
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCTrainingGraph setOptimizerParameterList:](self, "setOptimizerParameterList:", v14);

  if (v5 && -[NSArray count](v5, "count"))
  {
    v15 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, v15);

      ++v15;
    }
    while (v15 < -[NSArray count](v5, "count"));
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (void)updateIsTrainableForLayerWithStopGradientTensor:(id)a3 checkChildLayers:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;

  v4 = a4;
  v20 = a3;
  objc_msgSend(v20, "parentLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v20;
  if (v7)
  {
    objc_msgSend(v20, "parentLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isTrainable"))
    {
      if (!v4
        || (objc_msgSend(v20, "childLayers"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            v12 <= 1))
      {
        objc_msgSend(v10, "setIsTrainable:", 0);
        objc_msgSend(v10, "sourceTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = 0;
          do
          {
            objc_msgSend(v10, "sourceTensors");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph updateIsTrainableForLayerWithStopGradientTensor:checkChildLayers:](self, "updateIsTrainableForLayerWithStopGradientTensor:checkChildLayers:", v17, 1);

            ++v15;
            objc_msgSend(v10, "sourceTensors");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

          }
          while (v15 < v19);
        }
      }
    }

    v8 = v20;
  }

}

- (void)markLayersAsTrainable
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "compileForInferenceOnly") & 1) == 0)
        objc_msgSend(v7, "setIsTrainable:", 1);

      ++v5;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v5 < v9);
  }
}

- (void)updateTrainableLayerList:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;

  -[MLCTrainingGraph markLayersAsTrainable](self, "markLayersAsTrainable");
  -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph updateIsTrainableForLayerWithStopGradientTensor:checkChildLayers:](self, "updateIsTrainableForLayerWithStopGradientTensor:checkChildLayers:", v9, 0);

      ++v7;
      -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v7 < v11);
  }
  if ((-[MLCGraph compilerOptions](self, "compilerOptions") & 1) != 0
    || (-[MLCGraph compilerOptions](self, "compilerOptions") & 8) != 0)
  {
    -[MLCTrainingGraph setFirstTrainableLayerIndex:](self, "setFirstTrainableLayerIndex:", 0);
  }
  else
  {
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      while (1)
      {
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v22, "skipLayer") & 1) == 0)
        {
          if (objc_msgSend(v22, "isTrainable"))
          {
            -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17)
              break;
            if ((objc_msgSend(v22, "isDebuggingEnabled") & 1) != 0)
              break;
            if (a3)
              break;
            if ((objc_msgSend(v22, "isUpdatable") & 1) != 0)
              break;
            -[MLCGraph graphLayerList](self, "graphLayerList");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count") - 1;

            if (v14 >= v19)
              break;
          }
        }

        ++v14;
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v14 >= v21)
          return;
      }
      -[MLCTrainingGraph setFirstTrainableLayerIndex:](self, "setFirstTrainableLayerIndex:", v14);

    }
  }
}

- (void)allocateGradientTensorsForLayersInGraph:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  char v39;

  if ((-[MLCGraph compilerOptions](self, "compilerOptions") & 1) != 0)
    LOBYTE(v5) = 1;
  else
    v5 = (-[MLCGraph compilerOptions](self, "compilerOptions") >> 3) & 1;
  v6 = -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex");
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    v39 = v5 | a3;
    while (1)
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "skipLayer") & 1) == 0)
      {
        if (objc_msgSend(v10, "isTrainable"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
        }
      }
LABEL_26:

      ++v6;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v6 >= v31)
        goto LABEL_27;
    }
    objc_msgSend(v10, "allocateGradientsForParameters");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[MLCTrainingGraph allocateGradientTensorsForMultipleChildrenOfLayer:gradientTensorsAreTemporary:device:](self, "allocateGradientTensorsForMultipleChildrenOfLayer:gradientTensorsAreTemporary:device:", v10, 0, v11);
    objc_msgSend(v10, "sourceTensors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      v15 = 1;
      do
      {
        objc_msgSend(v10, "sourceTensors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "computeFlags");

        if ((v18 & 8) == 0)
        {
          -[MLCTrainingGraph resultGradientTensorToUseByExecuteGradientForLayer:sourceIndex:incrementIntermediateIndex:](self, "resultGradientTensorToUseByExecuteGradientForLayer:sourceIndex:incrementIntermediateIndex:", v10, v14, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "resultGradientTensors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:atIndexedSubscript:", v19, v14);

          objc_msgSend(v10, "sourceTensors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "parentLayers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

          v15 &= v24 == 0;
        }
        ++v14;
        objc_msgSend(v10, "sourceTensors");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

      }
      while (v14 < v26);
    }
    else
    {
      v15 = 1;
    }
    if (!(v39 & 1 | ((v15 & 1) == 0)))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "device");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "computeEngine");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deviceOps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setConvolutionGradientComputeWeightsAndBiasOnly:", v29);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_24;
        objc_msgSend(v10, "device");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "computeEngine");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deviceOps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFullyConnectedGradientComputeWeightsAndBiasOnly:", v29);
      }

    }
LABEL_24:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MLCTrainingGraph linkRelatedGradientTensorsForConcatLayer:device:](self, "linkRelatedGradientTensorsForConcatLayer:device:", v10, v11);
    goto LABEL_26;
  }
LABEL_27:
  v32 = -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex");
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v32 < v34)
  {
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "isTrainable"))
      {
        if ((objc_msgSend(v36, "skipLayer") & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
        }
      }

      ++v32;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

    }
    while (v32 < v38);
  }
}

- (BOOL)compileOptimizer:(MLCOptimizer *)optimizer
{
  MLCOptimizer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  int v20;
  MLCOptimizer *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = optimizer;
  -[MLCOptimizer deviceOps](v4, "deviceOps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[MLCOptimizer device](v4, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph compileOptimizer:].cold.2();
LABEL_16:

      v18 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    -[MLCGraph device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph compileOptimizer:].cold.1();
      goto LABEL_16;
    }
    +[MLCLog execution](MLCLog, "execution");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    +[MLCLog execution](MLCLog, "execution");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v20 = 138543362;
      v21 = v4;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CompileOptimizer", "%{public,name=Optimizer}@ ", (uint8_t *)&v20, 0xCu);
    }

    -[MLCGraph device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCOptimizer compileForDevice:](v4, "compileForDevice:", v15);

    +[MLCLog execution](MLCLog, "execution");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v17, OS_SIGNPOST_INTERVAL_END, v12, "CompileOptimizer", (const char *)&unk_1D4ABD322, (uint8_t *)&v20, 2u);
    }

  }
  -[MLCTrainingGraph setOptimizer:](self, "setOptimizer:", v4);
  v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)compileAndAllocateGradientTensorsForGraph:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if (-[MLCTrainingGraph allocateResultGradientTensors](self, "allocateResultGradientTensors"))
  {
    +[MLCLog execution](MLCLog, "execution");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    +[MLCLog execution](MLCLog, "execution");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CompileAndAllocateGradientTensors", (const char *)&unk_1D4ABD322, buf, 2u);
    }

    -[MLCGraph device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTrainingGraph allocateRootSourceGradientTensors:](self, "allocateRootSourceGradientTensors:", v9);

    -[MLCTrainingGraph allocateGradientTensorsForLayersInGraph:](self, "allocateGradientTensorsForLayersInGraph:", v3);
    -[MLCTrainingGraph setAllocateResultGradientTensors:](self, "setAllocateResultGradientTensors:", 0);
    +[MLCLog execution](MLCLog, "execution");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v11, OS_SIGNPOST_INTERVAL_END, v6, "CompileAndAllocateGradientTensors", (const char *)&unk_1D4ABD322, v13, 2u);
    }

  }
  return 1;
}

- (BOOL)allocateOptimizerDataForGraph
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (-[MLCTrainingGraph allocateOptimizerData](self, "allocateOptimizerData"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    -[MLCTrainingGraph setOptimizerUpdateLayerList:](self, "setOptimizerUpdateLayerList:", v4);

    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex");
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 >= v8)
    {
      v9 = 0;
    }
    else
    {
      v9 = 0;
      do
      {
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isUpdatable"))
        {
          if (objc_msgSend(v11, "isTrainable"))
          {
            -[MLCTrainingGraph optimizer](self, "optimizer");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              -[MLCTrainingGraph optimizer](self, "optimizer");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "allocateDataForOptimizer:", v13);

              -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v11);

              v9 += objc_msgSend(v11, "parametersCount");
              objc_msgSend(v11, "device");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v15);

            }
          }
        }

        ++v6;
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v6 < v17);
    }
    -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = 0;
      do
      {
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLCTrainingGraph optimizer](self, "optimizer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph device](self, "device");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allocateDataForOptimizer:device:isVector:", v23, v24, 0);

        objc_msgSend(v22, "device");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v25);

        ++v20;
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

      }
      while (v20 < v27);
      v9 += v20;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTrainingGraph setOptimizerUpdateDeviceList:](self, "setOptimizerUpdateDeviceList:", v28);

    -[MLCTrainingGraph setAllocateOptimizerData:](self, "setAllocateOptimizerData:", 0);
    if (v9)
    {
      -[MLCTrainingGraph optimizer](self, "optimizer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "computeEngine");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph optimizer](self, "optimizer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allocateDeviceDataForGlobalNormClippingWithOptimizer:updatableParameterCount:", v32, v9);

    }
  }
  return 1;
}

- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData withTensor:(MLCTensor *)tensor
{
  MLCTensor *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  MLCTensor *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;

  v8 = tensor;
  v9 = -[MLCTensor bindOptimizerData:deviceData:](v8, "bindOptimizerData:deviceData:", data, deviceData);
  if (v9)
  {
    -[MLCTrainingGraph optimizer](self, "optimizer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[MLCTrainingGraph optimizer](self, "optimizer");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = -[MLCTrainingGraph allocateOptimizerData](self, "allocateOptimizerData");

        if (v14)
          goto LABEL_20;
      }
      else
      {

      }
      if (-[MLCTensor isLayerParameter](v8, "isLayerParameter"))
      {
        -[MLCTensor childLayers](v8, "childLayers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v17 = 0;
          do
          {
            -[MLCTensor childLayers](v8, "childLayers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "isUpdatable") && objc_msgSend(v19, "isTrainable"))
            {
              -[MLCTrainingGraph optimizer](self, "optimizer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "allocateDataForOptimizer:", v20);

            }
            ++v17;
            -[MLCTensor childLayers](v8, "childLayers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

          }
          while (v17 < v22);
        }
      }
      else
      {
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          v25 = 0;
          do
          {
            -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "tensor");
            v28 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

            if (v28 == v8)
            {
              -[MLCTrainingGraph optimizer](self, "optimizer");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph device](self, "device");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "allocateDataForOptimizer:device:isVector:", v29, v30, 0);

            }
            ++v25;
            -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "count");

          }
          while (v25 < v32);
        }
      }
    }
  }
LABEL_20:

  return v9;
}

- (BOOL)recompileWithOptions:(unint64_t)a3
{
  char v3;
  unint64_t v6;
  _BOOL8 v7;
  os_signpost_id_t v8;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_signpost_id_t spid;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  if (!-[MLCGraph recompileAfterLinking](self, "recompileAfterLinking")
    || (-[MLCGraph setRecompileAfterLinking:](self, "setRecompileAfterLinking:", 0),
        (-[MLCGraph compilerOptions](self, "compilerOptions") & 1) != 0)
    || (-[MLCGraph compilerOptions](self, "compilerOptions") & 2) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v6 = -[MLCGraph compilerOptions](self, "compilerOptions");
    v7 = (v6 >> 2) & 1;
    if ((v6 & 4) != 0)
    {
      if ((v3 & 4) != 0)
      {
        +[MLCLog execution](MLCLog, "execution");
        v11 = objc_claimAutoreleasedReturnValue();
        v8 = os_signpost_id_generate(v11);

      }
      else
      {
        v8 = 0;
      }
      +[MLCLog execution](MLCLog, "execution");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecompileTrainingGraph", (const char *)&unk_1D4ABD322, buf, 2u);
      }
      spid = v8;

      -[MLCGraph device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "computeEngine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fuseLayersForTrainingGraph:stopGradientTensorList:", v17, v18);

      -[MLCGraph graphLayerList](self, "graphLayerList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        v21 = 0;
        v22 = 0;
        do
        {
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "fusedLayers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            ++v22;
            objc_msgSend(v24, "device");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sourceTensors");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "resultTensors");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "compileForDevice:sourceTensors:resultTensor:", v27, v28, v30);

            objc_msgSend(v24, "allocateGradientsForParameters");
            if (!-[MLCTrainingGraph allocateOptimizerData](self, "allocateOptimizerData"))
            {
              if (objc_msgSend(v24, "isUpdatable"))
              {
                if (objc_msgSend(v24, "isTrainable"))
                {
                  -[MLCTrainingGraph optimizer](self, "optimizer");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v31)
                  {
                    -[MLCTrainingGraph optimizer](self, "optimizer");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "allocateDataForOptimizer:", v32);

                  }
                }
              }
              objc_msgSend(v24, "fusedLayers");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "count");

              if (v34)
              {
                v35 = 0;
                do
                {
                  objc_msgSend(v24, "fusedLayers");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v37, "isUpdatable"))
                  {
                    if (objc_msgSend(v37, "isTrainable"))
                    {
                      -[MLCTrainingGraph optimizer](self, "optimizer");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v38)
                      {
                        -[MLCTrainingGraph optimizer](self, "optimizer");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "allocateDataForOptimizer:", v39);

                      }
                    }
                  }

                  ++v35;
                  objc_msgSend(v24, "fusedLayers");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "count");

                }
                while (v35 < v41);
              }
            }
          }

          ++v21;
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "count");

        }
        while (v21 < v43);
      }
      else
      {
        v22 = 0;
      }
      -[MLCGraph device](self, "device");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "computeEngine");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "optimizeComputationForTrainingGraph:", v46);

      +[MLCLog execution](MLCLog, "execution");
      v47 = objc_claimAutoreleasedReturnValue();
      v10 = v47;
      if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47))
      {
        *(_DWORD *)buf = 134349056;
        v50 = v22;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v10, OS_SIGNPOST_INTERVAL_END, spid, "RecompileTrainingGraph", "%{public,name=LayersRecompiled}lu", buf, 0xCu);
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph recompileWithOptions:].cold.1(a2);
    }

  }
  return v7;
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device
{
  return -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:](self, "compileWithOptions:device:inputTensors:inputTensorsData:", options, device, 0, 0);
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData
{
  MLCDevice *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MLCGraphCompilationOptions v24;
  char v25;
  unint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  unint64_t v38;
  NSDictionary *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  char v99;
  unint64_t v100;
  char v101;
  void *v102;
  void *v103;
  void *v104;
  char v105;
  void *v106;
  char v107;
  void *v108;
  uint64_t v109;
  unint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  unint64_t v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  unint64_t v121;
  void *v122;
  void *v123;
  unint64_t v124;
  void *v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  void *v129;
  void *v130;
  char v131;
  void *v132;
  unint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  char v139;
  void *v140;
  void *v141;
  void *v142;
  BOOL v143;
  void *v144;
  char v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  NSObject *v151;
  NSObject *v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  NSObject *v158;
  NSObject *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  void *v163;
  const char *aSelector;
  os_signpost_id_t spid;
  unint64_t v166;
  NSDictionary *v167;
  char v168;
  char v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t v174[128];
  uint8_t buf[4];
  void *v176;
  __int16 v177;
  MLCGraphCompilationOptions v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v11 = device;
  v12 = inputTensors;
  v13 = inputTensorsData;
  if (-[MLCDevice type](v11, "type") == MLCDeviceTypeANE)
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.1(a2);
    goto LABEL_4;
  }
  if (-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.2(a2);
    v15 = 1;
    goto LABEL_109;
  }
  if (v12 && !v13)
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.3(a2);
    goto LABEL_4;
  }
  +[MLCLog execution](MLCLog, "execution", a2);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  +[MLCLog execution](MLCLog, "execution");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  spid = v17;
  v166 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v176 = v21;
    v177 = 2050;
    v178 = options;
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CompileWithOptions", "%{public,name=Device}@ %{public,name=Options}llu", buf, 0x16u);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  v167 = v13;
  if (!v23)
  {
    v168 = 0;
    goto LABEL_30;
  }
  v24 = options;
  v25 = 0;
  v168 = 0;
  v26 = 0;
  do
  {
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "compileForInferenceOnly");

    if (v29)
    {
      +[MLCLog framework](MLCLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "objectAtIndexedSubscript:", v26);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v176 = v161;
        v177 = 2112;
        v178 = (MLCGraphCompilationOptions)v163;
        _os_log_error_impl(&dword_1D4999000, v14, OS_LOG_TYPE_ERROR, "%@: Compiling a layer (%@) in graph that has already been compiled with for inference.  Please compile training graph before creating and compiling associated inference graph", buf, 0x16u);

      }
      goto LABEL_107;
    }
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "descriptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "scalesGradientByFrequency");

      if (-[MLCDevice type](v11, "type") == MLCDeviceTypeAny || -[MLCDevice type](v11, "type") == MLCDeviceTypeGPU)
        v168 = 1;
      v25 |= v36;

    }
    ++v26;
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

  }
  while (v26 < v38);
  v13 = v167;
  if ((v25 & 1) == 0)
  {
    options = v24;
    if (v12)
      goto LABEL_31;
    goto LABEL_40;
  }
  options = v24;
  if (-[MLCDevice type](v11, "type") != MLCDeviceTypeAny)
  {
LABEL_30:
    if (!v12)
      goto LABEL_40;
    goto LABEL_31;
  }
  -[MLCDevice switchToCPUDevice](v11, "switchToCPUDevice");
  if (!v12)
    goto LABEL_40;
LABEL_31:
  if (v13)
  {
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v39 = v13;
    v40 = -[NSDictionary countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v170, v174, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v171;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v171 != v42)
            objc_enumerationMutation(v39);
          -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * i));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setComputeFlags:", objc_msgSend(v44, "computeFlags") | 2);

        }
        v41 = -[NSDictionary countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v170, v174, 16);
      }
      while (v41);
    }

    -[MLCGraph bindAndWriteData:forInputs:toDevice:synchronous:](self, "bindAndWriteData:forInputs:toDevice:synchronous:", v39, v12, v11, 1);
  }
LABEL_40:
  v45 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCTrainingGraph setLossLayersInTrainingGraph:](self, "setLossLayersInTrainingGraph:", v45);

  -[MLCGraph setCompilerOptions:](self, "setCompilerOptions:", options);
  if (!((2 * (options & 1)) | options & 6))
  {
    -[MLCDevice computeEngine](v11, "computeEngine");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "fuseLayersForTrainingGraph:stopGradientTensorList:", v47, v48);

  }
  v49 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCGraph setLstmLayerIndexList:](self, "setLstmLayerIndexList:", v49);

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51)
  {
    v52 = 0;
    v169 = options;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectAtIndexedSubscript:", v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if ((options & 1) != 0)
        objc_msgSend(v54, "setIsDebuggingEnabled:", 1);
      if ((objc_msgSend(v54, "skipLayer") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph lstmLayerIndexList](self, "lstmLayerIndexList");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph lstmLayerIndexList](self, "lstmLayerIndexList");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:atIndexedSubscript:", v55, objc_msgSend(v57, "count"));

        }
        if (-[MLCDevice type](v11, "type"))
        {
          objc_msgSend(v54, "deviceOps");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "count");

          if (!v59)
          {
            objc_msgSend(v54, "resultTensors");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "count");

            if (v61)
            {
              v62 = 0;
              do
              {
                objc_msgSend(v54, "resultTensors");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "objectAtIndexedSubscript:", v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "deviceMemory");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "count");

                if (v66)
                {
                  objc_msgSend(v54, "resultTensors");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "objectAtIndexedSubscript:", v62);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "deviceMemory");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "removeAllObjects");

                }
                ++v62;
                objc_msgSend(v54, "resultTensors");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "count");

              }
              while (v62 < v71);
            }
            objc_msgSend(v54, "resultGradientTensors");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "count");

            if (v73)
            {
              v74 = 0;
              do
              {
                objc_msgSend(v54, "resultGradientTensors");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "objectAtIndexedSubscript:", v74);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "deviceMemory");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "count");

                if (v78)
                {
                  objc_msgSend(v54, "resultGradientTensors");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "objectAtIndexedSubscript:", v74);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "deviceMemory");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "removeAllObjects");

                }
                ++v74;
                objc_msgSend(v54, "resultGradientTensors");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = objc_msgSend(v82, "count");

              }
              while (v74 < v83);
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v54, "resultTensors");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v84, "count");

          if (v85)
          {
            objc_msgSend(v54, "resultTensors");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "deviceMemory");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "removeAllObjects");

          }
        }
        objc_opt_class();
        LOBYTE(options) = v169;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[MLCGraph linkRelatedTensorsForConcatLayer:device:](self, "linkRelatedTensorsForConcatLayer:device:", v54, v11);
      }

      ++v52;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "count");

    }
    while (v52 < v90);
  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "count");

  if (!v92)
  {
LABEL_89:
    -[MLCTrainingGraph lossLayersInTrainingGraph](self, "lossLayersInTrainingGraph");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "count");

    if (v126)
    {
      v127 = 0;
      v128 = 0;
      do
      {
        -[MLCTrainingGraph lossLayersInTrainingGraph](self, "lossLayersInTrainingGraph");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectAtIndexedSubscript:", v127);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v131 = objc_opt_isKindOfClass();

        v128 |= v131;
        ++v127;
        -[MLCTrainingGraph lossLayersInTrainingGraph](self, "lossLayersInTrainingGraph");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "count");

      }
      while (v127 < v133);
      if ((v128 & 1) != 0)
      {
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectAtIndexedSubscript:", objc_msgSend(v135, "count") - 1);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v137 = objc_opt_isKindOfClass();

        if ((v137 & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
            -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.4(aSelector);

          +[MLCLog execution](MLCLog, "execution");
          v158 = objc_claimAutoreleasedReturnValue();
          v14 = v158;
          v13 = v167;
          if (v166 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v158))
            goto LABEL_4;
          *(_WORD *)buf = 0;
LABEL_128:
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v14, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
          goto LABEL_4;
        }
      }
    }
    -[MLCGraph setDevice:](self, "setDevice:", v11);
    if ((-[MLCGraph compilerOptions](self, "compilerOptions") >> 2) & 1 | v168 & 1
      || !-[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph"))
    {
      -[MLCDevice computeEngine](v11, "computeEngine");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_opt_respondsToSelector();

      if ((v139 & 1) != 0)
      {
        -[MLCDevice computeEngine](v11, "computeEngine");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "selectDevicesWithBatchSize:", 1);

      }
    }
    -[MLCTrainingGraph optimizer](self, "optimizer");
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v141
      || (-[MLCTrainingGraph optimizer](self, "optimizer"),
          v142 = (void *)objc_claimAutoreleasedReturnValue(),
          v143 = -[MLCTrainingGraph compileOptimizer:](self, "compileOptimizer:", v142),
          v142,
          v143))
    {
      -[MLCDevice computeEngine](v11, "computeEngine");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_opt_respondsToSelector();

      if ((v145 & 1) != 0)
      {
        -[MLCDevice computeEngine](v11, "computeEngine");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "allocateDeviceHeapForGraph:forInference:", v147, 0);

      }
      -[MLCTrainingGraph markLayersAsTrainable](self, "markLayersAsTrainable");
      -[MLCGraph device](self, "device");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "computeEngine");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "optimizeComputationForTrainingGraph:", v150);

      v15 = 1;
      -[MLCTrainingGraph updateTrainableLayerList:](self, "updateTrainableLayerList:", 1);
      -[MLCGraph setReadyForExecution:](self, "setReadyForExecution:", 1);
      -[MLCGraph setAllocateDeviceMemoryForTensorsInGraph:](self, "setAllocateDeviceMemoryForTensorsInGraph:", -[MLCDevice type](v11, "type") != MLCDeviceTypeANE);
      +[MLCLog execution](MLCLog, "execution");
      v151 = objc_claimAutoreleasedReturnValue();
      v14 = v151;
      if (v166 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v167;
        if (os_signpost_enabled(v151))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v14, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
        }
        goto LABEL_109;
      }
LABEL_108:
      v13 = v167;
      goto LABEL_109;
    }
    +[MLCLog execution](MLCLog, "execution");
    v153 = objc_claimAutoreleasedReturnValue();
    v14 = v153;
    if (v166 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v167;
      if (!os_signpost_enabled(v153))
        goto LABEL_4;
      *(_WORD *)buf = 0;
      goto LABEL_128;
    }
LABEL_107:
    v15 = 0;
    goto LABEL_108;
  }
  v93 = 0;
  v94 = 0x1E981F000uLL;
  while (1)
  {
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectAtIndexedSubscript:", v93);
    v14 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject skipLayer](v14, "skipLayer"))
      break;
    -[NSObject setDevice:](v14, "setDevice:", v11);
LABEL_88:

    ++v93;
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "count");

    if (v93 >= v124)
      goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v154 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5(aSelector);
    v13 = v167;
    goto LABEL_135;
  }
  -[NSObject deviceOps](v14, "deviceOps");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "count");

  if (v97)
  {
    -[NSObject device](v14, "device");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "isEqual:", v11);

    if ((v99 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v159 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.7();

      +[MLCLog execution](MLCLog, "execution");
      v160 = objc_claimAutoreleasedReturnValue();
      v154 = v160;
      v13 = v167;
      if (v166 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v160))
      {
        *(_WORD *)buf = 0;
        goto LABEL_134;
      }
      goto LABEL_135;
    }
    -[NSObject setDevice:](v14, "setDevice:", v11);
    goto LABEL_80;
  }
  if (!-[NSObject isValidTrainingParameters](v14, "isValidTrainingParameters"))
    goto LABEL_118;
  v100 = v94;
  objc_opt_class();
  v101 = objc_opt_isKindOfClass();
  -[NSObject sourceTensors](v14, "sourceTensors");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject resultTensors](v14, "resultTensors");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v103;
  if ((v101 & 1) != 0)
  {
    v105 = -[NSObject compileForDevice:sourceTensors:resultTensors:](v14, "compileForDevice:sourceTensors:resultTensors:", v11, v102, v103);

    v94 = v100;
    if ((v105 & 1) == 0)
      goto LABEL_118;
    goto LABEL_80;
  }
  objc_msgSend(v103, "objectAtIndexedSubscript:", 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = -[NSObject compileForDevice:sourceTensors:resultTensor:](v14, "compileForDevice:sourceTensors:resultTensor:", v11, v102, v106);

  v94 = v100;
  if ((v107 & 1) != 0)
  {
LABEL_80:
    -[NSObject resultTensors](v14, "resultTensors");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "count");

    if (v109)
    {
      v110 = 0;
      do
      {
        -[NSObject resultTensors](v14, "resultTensors");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectAtIndexedSubscript:", v110);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setDevice:", v11);

        ++v110;
        -[NSObject resultTensors](v14, "resultTensors");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v113, "count");

      }
      while (v110 < v114);
    }
    -[NSObject sourceGradientTensors](v14, "sourceGradientTensors");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "count");

    if (v116)
    {
      v117 = 0;
      do
      {
        -[NSObject sourceGradientTensors](v14, "sourceGradientTensors");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "objectAtIndexedSubscript:", v117);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setDevice:", v11);

        ++v117;
        -[NSObject sourceGradientTensors](v14, "sourceGradientTensors");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend(v120, "count");

      }
      while (v117 < v121);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MLCTrainingGraph lossLayersInTrainingGraph](self, "lossLayersInTrainingGraph");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "addObject:", v14);

    }
    goto LABEL_88;
  }
LABEL_118:
  +[MLCLog framework](MLCLog, "framework");
  v155 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
    -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.6();

  +[MLCLog execution](MLCLog, "execution");
  v156 = objc_claimAutoreleasedReturnValue();
  v154 = v156;
  v13 = v167;
  if (v166 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
  {
    *(_WORD *)buf = 0;
LABEL_134:
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v154, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
  }
LABEL_135:

LABEL_4:
  v15 = 0;
LABEL_109:

  return v15;
}

- (BOOL)stopGradientForTensors:(NSArray *)tensors
{
  NSArray *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = tensors;
  if (-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph stopGradientForTensors:].cold.1(a2);
LABEL_11:

    v11 = 0;
    goto LABEL_12;
  }
  if (!-[MLCTrainingGraph allocateResultGradientTensors](self, "allocateResultGradientTensors"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph stopGradientForTensors:].cold.2(a2);
    goto LABEL_11;
  }
  -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  if (-[NSArray count](v5, "count"))
  {
    v8 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph stopGradientTensorList](self, "stopGradientTensorList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, v8);

      ++v8;
    }
    while (v8 < -[NSArray count](v5, "count"));
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (NSUInteger)deviceMemorySize
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0;
  if (v4)
  {
    v6 = 0;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLCTrainingGraph optimizer](self, "optimizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 += objc_msgSend(v8, "deviceMemorySizeWithOptimizer:device:", v9, v10);

      ++v6;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v6 < v12);
  }
  -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 0;
    do
    {
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "computeEngine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5 += objc_msgSend(v19, "deviceMemorySizeForTensor:", v21);

      ++v15;
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v15 < v23);
  }
  return v5;
}

- (unint64_t)deviceMemorySizeWithDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;

  v4 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph optimizer](self, "optimizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 += objc_msgSend(v10, "deviceMemorySizeWithOptimizer:device:", v11, v4);

      ++v7;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < v13);
  }
  else
  {
    v8 = 0;
  }
  -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      objc_msgSend(v4, "computeEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 += objc_msgSend(v17, "deviceMemorySizeForTensor:", v19);

      ++v16;
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v16 < v21);
  }

  return v8;
}

- (id)description
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
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  -[MLCGraph allInputs](self, "allInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph allLossLabels](self, "allLossLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph allOutputs](self, "allOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph optimizer](self, "optimizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)MLCTrainingGraph;
  -[MLCGraph description](&v20, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: { rootLayer=%@ : optimizer=%@ : inputs=%@ : losslabels=%@ : lossLabelWeights= %@ : outputs= %@ : %@ }"), v13, v15, v16, v4, v6, v8, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCTrainingGraph;
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](&v5, sel_addInputs_lossLabels_lossLabelWeights_, inputs, lossLabels, 0);
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLCTrainingGraph;
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](&v6, sel_addInputs_lossLabels_lossLabelWeights_, inputs, lossLabels, lossLabelWeights);
}

- (BOOL)addOutputs:(NSDictionary *)outputs
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLCTrainingGraph;
  return -[MLCGraph addOutputs:](&v4, sel_addOutputs_, outputs);
}

- (void)executeForwardToLayerIndex:(unint64_t)a3 resultTensor:(id)a4 resultStateIsTemporary:(BOOL)a5 batchSize:(unint64_t)a6 forTraining:(BOOL)a7 executionOptions:(unint64_t)a8
{
  unsigned int v8;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  os_signpost_id_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  MLCTrainingGraph *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  char isKindOfClass;
  void *v132;
  void *v133;
  void *v134;
  NSObject *v135;
  NSObject *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  os_signpost_id_t v146;
  unint64_t v147;
  void *context;
  unint64_t v149;
  _BOOL4 v150;
  _BOOL4 v151;
  void *v152;
  unint64_t v153;
  void *v154;
  id v155;
  unint64_t v156;
  os_signpost_id_t spid;
  unint64_t v158;
  void *v159;
  unint64_t v160;
  id v161;
  _QWORD v162[2];
  uint8_t buf[4];
  void *v164;
  __int16 v165;
  uint64_t v166;
  uint64_t v167;

  v8 = a8;
  v150 = a5;
  v151 = a7;
  v167 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  context = (void *)MEMORY[0x1D8263D2C]();
  if ((v8 & 4) != 0)
  {
    +[MLCLog execution](MLCLog, "execution");
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v14);

  }
  else
  {
    v13 = 0;
  }
  +[MLCLog execution](MLCLog, "execution");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v147 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ExecuteForward", (const char *)&unk_1D4ABD322, buf, 2u);
  }

  -[MLCGraph device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type") == 0;

  v146 = v13;
  if ((v18 & (v8 >> 4)) != 0)
    v19 = v13;
  else
    v19 = 0;
  spid = v19;
  if (a3)
  {
    v20 = 0;
    v160 = v19 - 1;
    v158 = a3 - 1;
    v155 = v12;
    v156 = a3;
    v149 = a6;
    while (1)
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCLog execution](MLCLog, "execution");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v160 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v22, "layerID");
        *(_DWORD *)buf = 138543618;
        v164 = v27;
        v165 = 2050;
        v166 = v28;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);

      }
      if (v12 && v20 == v158)
      {
        v161 = v12;
      }
      else
      {
        objc_msgSend(v22, "resultTensors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v161 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v22, "skipLayer"))
      {
        +[MLCLog execution](MLCLog, "execution");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v160 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
          goto LABEL_67;
        goto LABEL_66;
      }
      objc_msgSend(v22, "setBatchSize:", a6);
      if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](self, "allocateDeviceMemoryForTensorsInGraph"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MLCGraph allocateDeviceMemoryForTensor:device:](self, "allocateDeviceMemoryForTensor:device:", v161, v23);
          objc_msgSend(v22, "resultTensors");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count");

          if (v33 >= 2)
          {
            v34 = 1;
            do
            {
              objc_msgSend(v22, "resultTensors");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph allocateDeviceMemoryForTensor:device:](self, "allocateDeviceMemoryForTensor:device:", v36, v23);

              ++v34;
              objc_msgSend(v22, "resultTensors");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "count");

            }
            while (v34 < v38);
          }
          -[MLCGraph updateDeviceMemoryReadCountForTensor:](self, "updateDeviceMemoryReadCountForTensor:", v161);
          objc_msgSend(v22, "resultTensors");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v40 >= 2)
          {
            v41 = 1;
            do
            {
              objc_msgSend(v22, "resultTensors");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectAtIndexedSubscript:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph updateDeviceMemoryReadCountForTensor:](self, "updateDeviceMemoryReadCountForTensor:", v43);

              ++v41;
              objc_msgSend(v22, "resultTensors");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "count");

            }
            while (v41 < v45);
          }
          if ((objc_msgSend(v22, "isTrainable") & 1) != 0)
          {
            -[MLCGraph updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:](self, "updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:", v22, v161, 0, 1);
            objc_msgSend(v22, "resultTensors");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "count");

            if (v47 >= 2)
            {
              v48 = 1;
              do
              {
                objc_msgSend(v22, "resultTensors");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectAtIndexedSubscript:", v48);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCGraph updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:](self, "updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:", v22, v50, 0, 1);

                ++v48;
                objc_msgSend(v22, "resultTensors");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "count");

              }
              while (v48 < v52);
            }
            objc_msgSend(v22, "sourceTensors");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "count");

            if (v54)
            {
              v55 = 0;
              do
              {
                objc_msgSend(v22, "sourceTensors");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectAtIndexedSubscript:", v55);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCGraph updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:](self, "updateDeviceMemoryReadCountForGradientWithLayer:tensor:checkIfSourceNeeded:checkIfResultNeeded:", v22, v57, 1, 0);

                ++v55;
                objc_msgSend(v22, "sourceTensors");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v58, "count");

              }
              while (v55 < v59);
            }
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v60;
        objc_msgSend(v60, "dispatchForwardConcatLayer:sourceTensors:resultTensor:", v61, v62, v161);
        goto LABEL_57;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v63 = self;
        v64 = v20;
        v65 = v23;
        v66 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v67 = a6;
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "resultTensors");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)v66;
        v71 = (void *)v66;
        v23 = v65;
        v20 = v64;
        self = v63;
        objc_msgSend(v71, "dispatchForwardSplitLayer:sourceTensor:resultTensors:", v68, v69, v70);

        v61 = (void *)v68;
        a6 = v67;
        v12 = v155;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v22, "binaryOperation");
        v74 = 0;
        if (v73)
        {
          objc_msgSend(v22, "sourceTensors");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "objectAtIndexedSubscript:", 1);
          v74 = objc_claimAutoreleasedReturnValue();
          v144 = (void *)v74;
        }
        objc_msgSend(v22, "sourceTensors");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v75, "count") == 3)
        {
          objc_msgSend(v22, "sourceTensors");
          v141 = v73;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectAtIndexedSubscript:", 2);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v137) = v151;
          objc_msgSend(v159, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v152, v72, v74, v77, v161, v150, v137);

          v12 = v155;
          v73 = v141;
        }
        else
        {
          LOBYTE(v137) = v151;
          objc_msgSend(v159, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v152, v72, v74, 0, v161, v150, v137);
        }

        a6 = v149;
        if (v73)
        {

        }
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = v22;
        objc_msgSend(v78, "lossLabels");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "descriptor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "stride");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = (unint64_t)objc_msgSend(v82, "unsignedIntegerValue") >> 2;

        objc_msgSend(v23, "computeEngine");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "deviceOps");
        v83 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lossLabels");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "weights");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        BYTE1(v137) = v151;
        LOBYTE(v137) = v150;
        objc_msgSend(v159, "dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:", v83, v84, v85, v153, v86, v161, v137);

        v12 = v155;
        v61 = (void *)v83;
LABEL_50:

        goto LABEL_51;
      }
      objc_opt_class();
      a6 = v149;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "resultTensors");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v95;
        objc_msgSend(v95, "dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:", v61, v62, v69, v150, v151);
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v96;
        objc_msgSend(v96, "dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:", v61, v62, v161, v150, v151);
        goto LABEL_57;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v97;
        objc_msgSend(v97, "dispatchForwardMatMulLayer:sourceTensors:resultTensor:", v61, v62, v161);
        goto LABEL_57;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "computeEngine");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deviceOps");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v98;
        objc_msgSend(v98, "dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:", v61, v69, v161, v151);
LABEL_42:

LABEL_57:
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v23, "computeEngine");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectAtIndexedSubscript:", 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "dispatchForwardReshapeLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", v100, v102, v161, v150, v151);

      objc_msgSend(v161, "sharedMemoryTensor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v103)
      {
        v12 = v155;
        goto LABEL_59;
      }
      objc_msgSend(v161, "sharedMemoryTensor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "childLayers");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v104, "count");
      v12 = v155;
      if (v105)
      {
        objc_msgSend(v161, "childLayers");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend(v62, "count");
      }
      else
      {
        v106 = 1;
        v62 = v140;
      }
      objc_msgSend(v159, "setReadCount:", objc_msgSend(v159, "readCount") + v106);
      v140 = v62;
      v61 = v104;
      a6 = v149;
      if (v105)
        goto LABEL_57;
LABEL_58:

LABEL_59:
      a3 = v156;
      if ((objc_msgSend(v22, "isDebuggingEnabled") & 1) == 0)
      {
        if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](self, "allocateDeviceMemoryForTensorsInGraph"))
        {
          objc_msgSend(v22, "sourceTensors");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "count");

          if (v88)
          {
            v89 = 0;
            do
            {
              objc_msgSend(v22, "sourceTensors");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectAtIndexedSubscript:", v89);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph freeDeviceMemoryForTensorIfSafe:device:](self, "freeDeviceMemoryForTensorIfSafe:device:", v91, v23);

              ++v89;
              objc_msgSend(v22, "sourceTensors");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend(v92, "count");

            }
            while (v89 < v93);
          }
        }
      }
      +[MLCLog execution](MLCLog, "execution");
      v94 = objc_claimAutoreleasedReturnValue();
      v31 = v94;
      if (v160 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v94))
        goto LABEL_67;
LABEL_66:
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v31, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
LABEL_67:

      if (++v20 == a3)
        goto LABEL_115;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v107 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "weights");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectAtIndexedSubscript:", 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "dispatchForwardEmbeddingLayer:weight:sourceTensor:resultTensor:", v107, v62, v109, v161);

      v61 = (void *)v107;
      goto LABEL_83;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v110;
      if (v151)
      {
        objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", v61, v108, v161, v150, 1);
        goto LABEL_83;
      }
      objc_msgSend(v159, "dispatchForwardConcatLayer:sourceTensors:resultTensor:", v61, v110, v161);
LABEL_51:
      a6 = v149;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v111 = v22;
      objc_msgSend(v23, "computeEngine");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "deviceOps");
      v112 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "sourceTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v111, "reductionType");
      objc_msgSend(v111, "dimensions");
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      v115 = v113;
      v61 = (void *)v112;
      objc_msgSend(v159, "dispatchForwardReduceLayer:sourceTensor:resultTensor:reductionType:reduceDimensions:forTraining:", v112, v84, v161, v115, v114, 1);

      v12 = v155;
      goto LABEL_50;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v116 = v22;
      objc_msgSend(v23, "computeEngine");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "deviceOps");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "sourceTensors");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "objectAtIndexedSubscript:", 0);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v116;
      objc_msgSend(v116, "sourceTensors");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "count");
      v120 = 0;
      if (v119 == 2)
      {
        objc_msgSend(v159, "sourceTensors");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "objectAtIndexedSubscript:", 1);
        v120 = objc_claimAutoreleasedReturnValue();
        v138 = (void *)v120;
      }
      objc_msgSend(v152, "dispatchForwardCompareLayer:sourceTensor:secondaryTensor:resultTensor:compareOp:forTraining:", v62, v142, v120, v161, objc_msgSend(v159, "operation"), v151);
      if (v119 == 2)
      {

      }
      a6 = v149;
LABEL_56:
      v61 = v152;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v121;
      objc_msgSend(v121, "dispatchForwardFullyConnectedLayer:sourceTensor:resultTensor:forTraining:", v61, v108, v161, v151);
LABEL_83:

      goto LABEL_51;
    }
    objc_opt_class();
    a6 = v149;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "objectAtIndexedSubscript:", 1);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v162[0] = v143;
      objc_msgSend(v22, "sourceTensors");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "objectAtIndexedSubscript:", 2);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v162[1] = v124;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 2);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "dispatchForwardSelectLayer:conditionTensor:sourceTensors:resultTensor:forTraining:", v61, v122, v125, v161, v151);

      a6 = v149;
      v12 = v155;

      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v126;
      objc_msgSend(v126, "dispatchForwardScatterLayer:sourceTensors:resultTensor:forTraining:", v61, v62, v161, v151);
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "computeEngine");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v127;
      objc_msgSend(v127, "dispatchForwardGatherLayer:sourceTensors:resultTensor:forTraining:", v61, v62, v161, v151);
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "fusedLayers");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v128, "count"))
      {
        objc_msgSend(v22, "fusedLayers");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectAtIndexedSubscript:", 0);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        a6 = v149;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v23, "computeEngine");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "deviceOps");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sourceTensors");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v132;
          objc_msgSend(v132, "dispatchForwardFusedArithmeticLayerNormalizationLayer:sourceTensors:resultTensor:forTraining:", v61, v62, v161, v151);
LABEL_114:
          v12 = v155;
          goto LABEL_57;
        }
      }
      else
      {

        a6 = v149;
      }
    }
    objc_msgSend(v23, "computeEngine");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceOps");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sourceTensors");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v133;
    objc_msgSend(v133, "dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", v61, v134, v161, v150, v151);

    goto LABEL_114;
  }
LABEL_115:
  +[MLCLog execution](MLCLog, "execution");
  v135 = objc_claimAutoreleasedReturnValue();
  v136 = v135;
  if (v147 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v135))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v136, OS_SIGNPOST_INTERVAL_END, v146, "ExecuteForward", (const char *)&unk_1D4ABD322, buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)executeGradientFromLayerIndex:(unint64_t)a3 resultStateIsTemporary:(BOOL)a4 batchSize:(unint64_t)a5 executionOptions:(unint64_t)a6
{
  unsigned int v6;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  unint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  char isKindOfClass;
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v67;
  id v68;
  void *v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  unint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  unint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  unint64_t v137;
  void *v138;
  uint64_t v139;
  unint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  unint64_t v144;
  NSObject *v145;
  void *v146;
  unsigned int v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  char v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  NSObject *v165;
  NSObject *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  const char *v174;
  const char *v175;
  const char *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  unint64_t v183;
  void *v184;
  void *v185;
  _BOOL4 v186;
  unint64_t v187;
  uint64_t v188;
  os_signpost_id_t v189;
  unint64_t v190;
  os_signpost_id_t spid;
  unint64_t v192;
  void *v193;
  _QWORD v194[3];
  _QWORD v195[2];
  _QWORD v196[2];
  uint8_t buf[4];
  void *v198;
  __int16 v199;
  uint64_t v200;
  uint64_t v201;

  v6 = a6;
  v186 = a4;
  v201 = *MEMORY[0x1E0C80C00];
  v188 = MEMORY[0x1D8263D2C]();
  if ((v6 & 4) != 0)
  {
    +[MLCLog execution](MLCLog, "execution");
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v12);

  }
  else
  {
    v11 = 0;
  }
  +[MLCLog execution](MLCLog, "execution");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v187 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ExecuteGradient", (const char *)&unk_1D4ABD322, buf, 2u);
  }

  -[MLCGraph device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type") == 0;

  if ((v16 & (v6 >> 4)) != 0)
    v17 = v11;
  else
    v17 = 0;
  spid = v17;
  if ((int64_t)-[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex") > (uint64_t)a3)
  {
LABEL_11:
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTrainingGraph sumAllRootSourceGradientTensors:](self, "sumAllRootSourceGradientTensors:", v20);

    v21 = -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex");
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    v24 = (void *)v188;
    if (v21 < v23 && -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex"))
    {
      v25 = 0;
      do
      {
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v27, "skipLayer") & 1) == 0)
        {
          objc_msgSend(v27, "device");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "computeEngine");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "deviceOps");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "incrementReadCountForGradientState:increment:", v30, -1);

        }
        ++v25;
      }
      while (v25 < -[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex"));
    }
    +[MLCLog execution](MLCLog, "execution");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v187 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v32, OS_SIGNPOST_INTERVAL_END, v11, "ExecuteGradient", (const char *)&unk_1D4ABD322, buf, 2u);
    }

    -[MLCGraph setAllocateDeviceMemoryForTensorsInGraph:](self, "setAllocateDeviceMemoryForTensorsInGraph:", 0);
    -[MLCGraph freeResourceList](self, "freeResourceList");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllObjects");
    goto LABEL_21;
  }
  v34 = spid - 1;
  v189 = v11;
  v190 = a5;
  v192 = spid - 1;
  while (1)
  {
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "device");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCLog execution](MLCLog, "execution");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v36, "layerID");
      *(_DWORD *)buf = 138543618;
      v198 = v40;
      v199 = 2050;
      v200 = v41;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v38, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteGradient -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);

    }
    objc_msgSend(v36, "setBatchSize:", a5);
    objc_msgSend(v36, "intermediateGradientTensors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[MLCTrainingGraph sumIntermediateGradientTensorsForLayer:](self, "sumIntermediateGradientTensorsForLayer:", v36);
    }
    if (objc_msgSend(v36, "skipLayer"))
    {
      +[MLCLog execution](MLCLog, "execution");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v34 = spid - 1;
      if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v45, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
      }
      goto LABEL_49;
    }
    if (!objc_msgSend(v36, "isTrainable") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v36, "device");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "computeEngine");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deviceOps");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "incrementReadCountForGradientState:increment:", v48, -1);

      +[MLCLog execution](MLCLog, "execution");
      v49 = objc_claimAutoreleasedReturnValue();
      v45 = v49;
      v34 = spid - 1;
      if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v45, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
      }
      a5 = v190;
      goto LABEL_49;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v36, "resultGradientTensors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", isKindOfClass & 1);
    v45 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "sourceGradientTensors");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    if (v53)
      break;
LABEL_43:
    objc_msgSend(v36, "device");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "computeEngine");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "incrementReadCountForGradientState:increment:", v63, -1);

    +[MLCLog execution](MLCLog, "execution");
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v64;
    v34 = spid - 1;
    if (v192 > 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v189;
    }
    else
    {
      v11 = v189;
      if (os_signpost_enabled(v64))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v65, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
      }
    }
    a5 = v190;
LABEL_48:

LABEL_49:
    if ((uint64_t)a3-- <= (int64_t)-[MLCTrainingGraph firstTrainableLayerIndex](self, "firstTrainableLayerIndex"))
      goto LABEL_11;
  }
  v54 = 0;
  while (1)
  {
    objc_msgSend(v193, "computeEngine");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectAtIndexedSubscript:", v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v55, "needToAllocateDeviceMemoryForTensor:", v57);

    if ((v58 & 1) == 0)
      break;
    ++v54;
    objc_msgSend(v36, "sourceGradientTensors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    if (v54 >= v60)
      goto LABEL_43;
  }
  v67 = v193;
  if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](self, "allocateDeviceMemoryForTensorsInGraph"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_59;
      v68 = v36;
      if (!objc_msgSend(v68, "operation") || objc_msgSend(v68, "operation") == 1)
      {

        goto LABEL_62;
      }
      objc_msgSend(v68, "sourceTensors");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "count");

      if (v70 <= 2)
      {
LABEL_59:
        -[MLCGraph allocateDeviceMemoryForTensor:device:](self, "allocateDeviceMemoryForTensor:device:", v45, v193);
        objc_msgSend(v36, "resultGradientTensors");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "count");

        if (v72)
        {
          v73 = 0;
          do
          {
            objc_msgSend(v36, "resultGradientTensors");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectAtIndexedSubscript:", v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCGraph allocateDeviceMemoryForTensor:device:](self, "allocateDeviceMemoryForTensor:device:", v75, v193);

            ++v73;
            objc_msgSend(v36, "resultGradientTensors");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "count");

          }
          while (v73 < v77);
        }
      }
    }
  }
LABEL_62:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v36, "binaryOperation"))
    {
      objc_msgSend(v36, "resultGradientTensors");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
      v33 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v36, "sourceTensors");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count");

    if (v84 >= 3)
    {
      v171 = v45;
      v174 = a2;
      objc_msgSend(v36, "fusedLayers");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectAtIndexedSubscript:", 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v170 = v86;
      objc_msgSend(v86, "sourceTensors");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceTensors");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectAtIndexedSubscript:", 2);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v193, "computeEngine");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fusedLayers");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "objectAtIndexedSubscript:", 0);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "deviceOps");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceGradientTensors");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      if (v88 == v90)
      {
        objc_msgSend(v36, "resultGradientTensors");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "objectAtIndexedSubscript:", 2);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sourceGradientTensors");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v95;
        v97 = 0;
      }
      else
      {
        objc_msgSend(v36, "sourceGradientTensors");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "objectAtIndexedSubscript:", 0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "resultGradientTensors");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v95;
        v97 = 2;
      }
      objc_msgSend(v95, "objectAtIndexedSubscript:", v97);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:secondaryResultGradientTensor:", v181, v177, v94, v128);

      v67 = v193;
      v45 = v171;
      a2 = v174;
    }
    objc_msgSend(v67, "computeEngine");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:secondaryResultGradientTensor:", v80, v82, v45, v33);
    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resultGradientTensors");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientConcatLayer:sourceGradientTensor:resultGradientTensors:", v79, v81, v82);
LABEL_89:

LABEL_90:
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v172 = v45;
    v175 = a2;
    objc_msgSend(v36, "intermediateGradientTensors");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "count");

    if (v99)
    {
      v100 = 0;
      do
      {
        objc_msgSend(v36, "intermediateGradientTensors");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectAtIndexedSubscript:", v100);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "sourceGradientTensors");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "count");

        if (v104)
        {
          v105 = 0;
          while (1)
          {
            objc_msgSend(v36, "sourceGradientTensors");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v107, "splitOffset");
            v109 = objc_msgSend(v102, "splitOffset");

            if (v108 == v109)
              break;
            ++v105;
            objc_msgSend(v36, "sourceGradientTensors");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v110, "count");

            if (v105 >= v111)
              goto LABEL_80;
          }
          objc_msgSend(v193, "computeEngine");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "intermediateSumLayer");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "deviceOps");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "sourceGradientTensors");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "objectAtIndexedSubscript:", v105);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "sourceGradientTensors");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "objectAtIndexedSubscript:", v105);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v167) = 0;
          objc_msgSend(v112, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v113, v114, v102, 0, v116, 0, v167);

        }
LABEL_80:

        ++v100;
        objc_msgSend(v36, "intermediateGradientTensors");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "count");

      }
      while (v100 < v118);
    }
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v172;
    objc_msgSend(v33, "dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:", v79, v80, v172);
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119 = v36;
    objc_msgSend(v119, "lossLabels");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "descriptor");
    v175 = a2;
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "stride");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "objectAtIndexedSubscript:", 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = (unint64_t)objc_msgSend(v123, "unsignedIntegerValue") >> 2;

    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "deviceOps");
    v179 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "lossLabels");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "weights");
    v126 = v45;
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "dispatchGradientLossLayer:sourceGradientTensor:labelsTensor:labelsTensorStride:weightsTensor:resultGradientTensor:", v179, v124, v125, v183, v127, v126);
    v45 = v126;

    v79 = (void *)v179;
LABEL_84:

LABEL_85:
    a2 = v175;
LABEL_91:
    a5 = v190;
    goto LABEL_92;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resultGradientTensors");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:", v79, v80, v81);
    goto LABEL_90;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resultGradientTensors");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientMHALayer:sourceGradientTensor:resultGradientTensors:resultStateIsTemporary:", v79, v81, v82, v186);
    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resultGradientTensors");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientMatMulLayer:sourceGradientTensor:resultGradientTensors:", v79, v81, v82);
    goto LABEL_89;
  }
  objc_opt_class();
  a5 = v190;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientSliceLayer:sourceGradientTensor:resultGradientTensor:", v79, v146, v45);
LABEL_119:

LABEL_92:
    v11 = v189;
    if ((objc_msgSend(v36, "isDebuggingEnabled") & 1) == 0)
    {
      if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](self, "allocateDeviceMemoryForTensorsInGraph"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v176 = a2;
          objc_msgSend(v36, "deviceOps");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "objectAtIndexedSubscript:", 0);
          v130 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v130, "sourceOfForwardNeededForGradient"))
          {
            objc_msgSend(v36, "sourceTensors");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v131, "count");

            if (v132)
            {
              v133 = 0;
              do
              {
                objc_msgSend(v36, "sourceTensors");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "objectAtIndexedSubscript:", v133);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCGraph freeDeviceMemoryForTensorIfSafe:device:](self, "freeDeviceMemoryForTensorIfSafe:device:", v135, v193);

                ++v133;
                objc_msgSend(v36, "sourceTensors");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = objc_msgSend(v136, "count");

              }
              while (v133 < v137);
            }
          }
          if (objc_msgSend(v130, "resultOfForwardNeededForGradient"))
          {
            objc_msgSend(v36, "resultTensors");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v138, "count");

            if (v139)
            {
              v140 = 0;
              do
              {
                objc_msgSend(v36, "resultTensors");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "objectAtIndexedSubscript:", v140);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCGraph freeDeviceMemoryForTensorIfSafe:device:](self, "freeDeviceMemoryForTensorIfSafe:device:", v142, v193);

                ++v140;
                objc_msgSend(v36, "resultTensors");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = objc_msgSend(v143, "count");

              }
              while (v140 < v144);
            }
          }

          a2 = v176;
          a5 = v190;
        }
      }
    }
    +[MLCLog execution](MLCLog, "execution");
    v145 = objc_claimAutoreleasedReturnValue();
    v65 = v145;
    v34 = spid - 1;
    if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v145))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v65, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteGradient -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
    }
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientEmbeddingLayer:sourceGradientTensor:", v79, v146);
    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v193, "computeEngine");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceOps");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sourceGradientTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dispatchGradientReshapeLayer:sourceGradientTensor:resultGradientTensor:", v79, v146, v45);
    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v193, "computeEngine");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deviceOps");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceGradientTensors");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dispatchGradientFullyConnectedLayer:sourceGradientTensor:resultGradientTensor:resultStateIsTemporary:", v79, v146, v45, v186);
      goto LABEL_119;
    }
    v175 = a2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v193, "computeEngine");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deviceOps");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceTensors");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceGradientTensors");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "objectAtIndexedSubscript:", 0);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v196[0] = v45;
      objc_msgSend(v36, "resultGradientTensors");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "objectAtIndexedSubscript:", 2);
      v173 = v45;
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v196[1] = v152;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dispatchGradientSelectLayer:conditionTensor:sourceGradientTensor:resultGradientTensors:", v79, v124, v151, v153);

      v45 = v173;
      goto LABEL_84;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v193, "computeEngine");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deviceOps");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceGradientTensors");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v195[0] = v184;
      objc_msgSend(v36, "sourceTensors");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectAtIndexedSubscript:", 1);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v195[1] = v154;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dispatchForwardGatherLayer:sourceTensors:resultTensor:forTraining:", v79, v155, v45, 1);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v36, "fusedLayers");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v156, "count"))
          {
            objc_msgSend(v36, "fusedLayers");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "objectAtIndexedSubscript:", 0);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v159 = objc_opt_isKindOfClass();

            if ((v159 & 1) != 0)
            {
              objc_msgSend(v193, "computeEngine");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "deviceOps");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "sourceGradientTensors");
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v162, "objectAtIndexedSubscript:", 0);
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:", v161, v163, v45);

              objc_msgSend(v193, "computeEngine");
              v33 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "resultGradientTensors");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "objectAtIndexedSubscript:", 1);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "shareDeviceMemoryWithResultTensor:sourceTensor:", v80, v45);
              goto LABEL_85;
            }
          }
          else
          {

          }
        }
        objc_msgSend(v193, "computeEngine");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "deviceOps");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sourceGradientTensors");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:", v79, v164, v45);

        goto LABEL_85;
      }
      objc_msgSend(v193, "computeEngine");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deviceOps");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sourceGradientTensors");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v194[0] = v184;
      objc_msgSend(v36, "sourceTensors");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectAtIndexedSubscript:", 1);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v194[1] = v154;
      v194[2] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 3);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dispatchForwardScatterLayer:sourceTensors:resultTensor:forTraining:", v79, v155, v45, 1);
    }

LABEL_124:
    goto LABEL_85;
  }
  v175 = a2;
  v33 = v36;
  v147 = objc_msgSend(v33, "reductionType");
  if (v147 > 9 || ((1 << v147) & 0x360) == 0)
  {
    objc_msgSend(v193, "computeEngine");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deviceOps");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sourceGradientTensors");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v33, "reductionType");
    objc_msgSend(v33, "dimensions");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dispatchGradientReduceLayer:sourceGradientTensor:resultGradientTensor:reductionType:reduceDimensions:", v80, v148, v45, v149, v150);

    goto LABEL_124;
  }
  v165 = v45;
  v24 = (void *)v188;
  +[MLCLog framework](MLCLog, "framework");
  v166 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    -[MLCTrainingGraph executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:].cold.1(a2);

LABEL_21:
  objc_autoreleasePoolPop(v24);
}

- (unint64_t)layerIndexToStoreSummedGradientsForTensor:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  unint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(v3, "childLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v3, "childLayers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isTrainable");

      if ((v11 & 1) != 0)
        break;
      ++v8;
      objc_msgSend(v3, "childLayers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v8 >= v13)
        goto LABEL_7;
    }
    v5 = v8;
  }
LABEL_7:

  return v5;
}

- (BOOL)checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:(id)a3 layer:(id)a4 device:(id)a5 isBetaTensor:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  id v20;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
    goto LABEL_5;
  objc_msgSend(v10, "childLayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 < 2)
  {
    v18 = 0;
    goto LABEL_9;
  }
  v15 = -[MLCTrainingGraph layerIndexToStoreSummedGradientsForTensor:](self, "layerIndexToStoreSummedGradientsForTensor:", v10);
  objc_msgSend(v10, "childLayers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v18 = v15 == v17;
  if (v15 == v17)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v10, "childLayers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v11)
  {
    objc_msgSend(v12, "computeEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sumSharedGradientsForNormalizationLayerTensorParameter:layerIndexForSummedGradients:isBetaTensor:", v10, v15, v6);
    goto LABEL_8;
  }
LABEL_5:
  v18 = 1;
LABEL_9:

  return v18;
}

- (void)executeOptimizerUpdateWithExecutionOptions:(unint64_t)a3
{
  unsigned int v3;
  MLCTrainingGraph *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  os_signpost_id_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  MLCTrainingGraph *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  void *v71;
  BOOL v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  BOOL v77;
  void *v78;
  MLCTrainingGraph *v79;
  BOOL v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  MLCTrainingGraph *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  BOOL v100;
  uint64_t v101;
  void *v102;
  BOOL v103;
  void *v104;
  MLCTrainingGraph *v105;
  BOOL v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  BOOL v117;
  void *v118;
  MLCTrainingGraph *v119;
  BOOL v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  id v126;
  MLCTrainingGraph *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  void *v138;
  void *v139;
  NSObject *v140;
  NSObject *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  MLCTrainingGraph *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  NSObject *v164;
  NSObject *v165;
  void *v166;
  unint64_t v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t i;
  void *v179;
  void *v180;
  id v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  char v192;
  void *v193;
  unint64_t v194;
  uint64_t v195;
  void *v196;
  id v197;
  void *v198;
  NSObject *v199;
  NSObject *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  BOOL v211;
  os_signpost_id_t v212;
  int v213;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  os_signpost_id_t spidb;
  int isKindOfClass;
  unint64_t v218;
  char obj;
  id obja;
  void *v221;
  BOOL v222;
  void *v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  void *v238;
  MLCTrainingGraph *v239;
  unint64_t v240;
  void *v241;
  uint64_t v242;
  void *v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  uint8_t v248[128];
  uint8_t buf[4];
  uint64_t v250;
  __int16 v251;
  uint64_t v252;
  uint64_t v253;

  v3 = a3;
  v4 = self;
  v253 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D8263D2C](self, a2);
  -[MLCTrainingGraph optimizer](v4, "optimizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MLCTrainingGraph allocateOptimizerDataForGraph](v4, "allocateOptimizerDataForGraph");
    -[MLCTrainingGraph optimizer](v4, "optimizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[MLCTrainingGraph optimizer](v4, "optimizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v213 = objc_opt_isKindOfClass();

    v9 = 0x1E981F000uLL;
    if ((v3 & 4) != 0)
    {
      +[MLCLog execution](MLCLog, "execution");
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_generate(v11);

    }
    else
    {
      v10 = 0;
    }
    v207 = v5;
    +[MLCLog execution](MLCLog, "execution");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v218 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ExecuteOptimizerUpdate", (const char *)&unk_1D4ABD322, buf, 2u);
    }

    -[MLCGraph device](v4, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "type") == 0;

    v212 = v10;
    if ((v15 & (v3 >> 4)) != 0)
      v16 = v10;
    else
      v16 = 0;
    -[MLCTrainingGraph optimizerUpdateLayerList](v4, "optimizerUpdateLayerList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    v239 = v4;
    if (v18)
    {
      obj = 0;
      v19 = 0;
      spid = v16;
      v240 = v16 - 1;
      while (1)
      {
        v20 = v19;
        -[MLCTrainingGraph optimizerUpdateLayerList](v4, "optimizerUpdateLayerList");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18 - 1;
        objc_msgSend(v21, "objectAtIndexedSubscript:", v18 - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v9 + 2064), "execution");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v240 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v23, "layerID");
          *(_DWORD *)buf = 138543618;
          v250 = (uint64_t)v27;
          v251 = 2050;
          v252 = v28;
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteOptimizerUpdate -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);

        }
        -[MLCTrainingGraph optimizerUpdateLayerList](v4, "optimizerUpdateLayerList");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v18 == v30)
        {
          objc_msgSend(v19, "computeEngine");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "deviceOps");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "learningRate");
          objc_msgSend(v31, "setOptimizerLearningRate:learningRate:", v33);

          obj = 1;
        }
        if ((isKindOfClass & 1) != 0 || (v213 & 1) != 0)
        {
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "computeEngine");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "deviceOps");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setOptimizerTimeStep:timeStep:", v38, objc_msgSend(v35, "timeStep"));

        }
        objc_opt_class();
        v242 = v22;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = v23;
          -[NSObject weights](v39, "weights");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject biases](v39, "biases");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "childLayers");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "count");

          if (v43 < 2)
            goto LABEL_28;
          v44 = -[MLCTrainingGraph layerIndexToStoreSummedGradientsForTensor:](v4, "layerIndexToStoreSummedGradientsForTensor:", v40);
          objc_msgSend(v40, "childLayers");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44 == objc_msgSend(v45, "count"))
            goto LABEL_32;
          objc_msgSend(v40, "childLayers");
          v46 = v41;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectAtIndexedSubscript:", v44);
          v48 = objc_claimAutoreleasedReturnValue();

          v41 = v46;
          v49 = v48 == v39;
          v9 = 0x1E981F000;
          if (v49)
          {
            objc_msgSend(v19, "computeEngine");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "sumSharedGradientsForConvolutionLayerTensorParameter:layerIndexForSummedGradients:", v40, v44);

            if (v46)
            {
              objc_msgSend(v19, "computeEngine");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "sumSharedGradientsForConvolutionLayerTensorParameter:layerIndexForSummedGradients:", v46, v44);

            }
LABEL_28:
            objc_msgSend(v19, "computeEngine");
            v221 = v40;
            v228 = v19;
            v234 = v23;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject deviceOps](v39, "deviceOps");
            v53 = objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "deviceOps");
            v55 = v4;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject weightsParameter](v39, "weightsParameter");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject biasesParameter](v39, "biasesParameter");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v55, "optimizer");
            v59 = v41;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "oneStepOptimizerBuffers");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v238 = (void *)v53;
            objc_msgSend(v52, "updateConvolutionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:", v53, v56, v57, v58, v61);

            v62 = v59;
            v9 = 0x1E981F000;

            v63 = v54;
            v64 = v52;
            v19 = v228;
            v23 = v234;
            v65 = v221;
            goto LABEL_47;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v235 = v23;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v23;
              -[NSObject beta](v39, "beta");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v69, v39, v19, 1);

              -[NSObject gamma](v39, "gamma");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v71, v39, v19, 0);

              objc_msgSend(v19, "computeEngine");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject deviceOps](v39, "deviceOps");
              v73 = objc_claimAutoreleasedReturnValue();
              -[MLCTrainingGraph optimizer](v4, "optimizer");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "deviceOps");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              if (v70)
              {
                v210 = 0;
                v75 = v209;
              }
              else
              {
                -[NSObject betaParameter](v39, "betaParameter");
                v75 = objc_claimAutoreleasedReturnValue();
                v210 = v75;
              }
              v224 = (void *)v75;
              v231 = v74;
              v211 = v70;
              v100 = v72;
              if (v72)
              {
                v101 = 0;
              }
              else
              {
                -[NSObject gammaParameter](v39, "gammaParameter");
                v101 = objc_claimAutoreleasedReturnValue();
                v208 = (void *)v101;
              }
              -[NSObject mean](v39, "mean");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject variance](v39, "variance");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCTrainingGraph optimizer](v4, "optimizer");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "oneStepOptimizerBuffers");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:", v73, v238, v210, v101, v110, v111, v113);

              if (!v100)
              v63 = v224;
              v209 = (uint64_t)v224;
              v4 = v239;
              v9 = 0x1E981F000;
              v62 = (void *)v73;
              v64 = v231;
              v23 = v235;
              if (!v211)
                goto LABEL_48;
              goto LABEL_49;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v23;
              -[NSObject beta](v39, "beta");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v76, v39, v19, 1);

              -[NSObject gamma](v39, "gamma");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v4;
              v80 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v78, v39, v19, 0);

              objc_msgSend(v19, "computeEngine");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject deviceOps](v39, "deviceOps");
              v81 = objc_claimAutoreleasedReturnValue();
              -[MLCTrainingGraph optimizer](v79, "optimizer");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "deviceOps");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              v222 = v77;
              if (v77)
              {
                v82 = 0;
                v83 = v206;
                if (!v80)
                  goto LABEL_40;
LABEL_68:
                v84 = 0;
              }
              else
              {
                -[NSObject betaParameter](v39, "betaParameter");
                v82 = objc_claimAutoreleasedReturnValue();
                v83 = (void *)v82;
                if (v80)
                  goto LABEL_68;
LABEL_40:
                -[NSObject gammaParameter](v39, "gammaParameter");
                v84 = objc_claimAutoreleasedReturnValue();
                v205 = (void *)v84;
              }
              -[MLCTrainingGraph optimizer](v239, "optimizer");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "oneStepOptimizerBuffers");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "updateInstanceNormalizationLayer:optimizer:betaParameter:gammaParameter:arrayOfParams:", v81, v238, v82, v84, v115);

              if (!v80)
              v63 = v83;
              v206 = v83;
LABEL_88:
              v4 = v239;
              v9 = 0x1E981F000;
              v62 = (void *)v81;
              v64 = v229;
              v23 = v235;
              if (!v222)
                goto LABEL_48;
              goto LABEL_49;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v23;
              -[NSObject beta](v39, "beta");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v102, v39, v19, 1);

              -[NSObject gamma](v39, "gamma");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v4;
              v106 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v104, v39, v19, 0);

              objc_msgSend(v19, "computeEngine");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject deviceOps](v39, "deviceOps");
              v81 = objc_claimAutoreleasedReturnValue();
              -[MLCTrainingGraph optimizer](v105, "optimizer");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "deviceOps");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              v222 = v103;
              if (v103)
              {
                v107 = 0;
                v108 = v204;
                if (!v106)
                  goto LABEL_61;
LABEL_77:
                v109 = 0;
              }
              else
              {
                -[NSObject betaParameter](v39, "betaParameter");
                v107 = objc_claimAutoreleasedReturnValue();
                v108 = (void *)v107;
                if (v106)
                  goto LABEL_77;
LABEL_61:
                -[NSObject gammaParameter](v39, "gammaParameter");
                v109 = objc_claimAutoreleasedReturnValue();
                v203 = (void *)v109;
              }
              -[MLCTrainingGraph optimizer](v239, "optimizer");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "oneStepOptimizerBuffers");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "updateLayerNormalizationLayer:optimizer:betaParameter:gammaParameter:arrayOfParams:", v81, v238, v107, v109, v125);

              if (!v106)
              v63 = v108;
              v204 = v108;
              goto LABEL_88;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v126 = v23;
                objc_msgSend(v19, "computeEngine");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "deviceOps");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "deviceOps");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "inputWeightsParameters");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "hiddenWeightsParameters");
                v225 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "biasesParameters");
                v127 = v4;
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                -[MLCTrainingGraph optimizer](v127, "optimizer");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "oneStepOptimizerBuffers");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = (void *)v225;
                -[NSObject updateRNNLayer:optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:](v39, "updateRNNLayer:optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:", v65, v64, v238, v225, v56, v128);

                goto LABEL_47;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "computeEngine");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "deviceOps");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "deviceOps");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "weightsParameters");
                v131 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "biasesParameters");
                v226 = objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "oneStepOptimizerBuffers");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v238 = (void *)v131;
                v132 = v131;
                v63 = (void *)v226;
                -[NSObject updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:](v39, "updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:", v65, v64, v132, v226, v95);
                goto LABEL_46;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "computeEngine");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "deviceOps");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "weightsParameter");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "deviceOps");
                v133 = objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "oneStepOptimizerBuffers");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v238 = (void *)v133;
                -[NSObject updateEmbeddingLayer:weightsParameter:optimizer:arrayOfParams:](v39, "updateEmbeddingLayer:weightsParameter:optimizer:arrayOfParams:", v65, v62, v133, v56);
                goto LABEL_47;
              }
              goto LABEL_50;
            }
            v39 = v23;
            -[NSObject beta](v39, "beta");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v116, v39, v19, 1);

            -[NSObject gamma](v39, "gamma");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v4;
            v120 = -[MLCTrainingGraph checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:](v4, "checkAndSumIfSharedParameterUpdateForNormalizationLayerTensor:layer:device:isBetaTensor:", v118, v39, v19, 0);

            objc_msgSend(v19, "computeEngine");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject deviceOps](v39, "deviceOps");
            v81 = objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v119, "optimizer");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "deviceOps");
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            v222 = v117;
            if (v117)
            {
              v121 = 0;
              v122 = v202;
              if (!v120)
                goto LABEL_75;
LABEL_84:
              v123 = 0;
            }
            else
            {
              -[NSObject betaParameter](v39, "betaParameter");
              v121 = objc_claimAutoreleasedReturnValue();
              v122 = (void *)v121;
              if (v120)
                goto LABEL_84;
LABEL_75:
              -[NSObject gammaParameter](v39, "gammaParameter");
              v123 = objc_claimAutoreleasedReturnValue();
              v201 = (void *)v123;
            }
            -[MLCTrainingGraph optimizer](v239, "optimizer");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "oneStepOptimizerBuffers");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "updateGroupNormalizationLayer:optimizer:betaParameter:gammaParameter:arrayOfParams:", v81, v238, v121, v123, v130);

            if (!v120)
            v63 = v122;
            v202 = v122;
            goto LABEL_88;
          }
          v39 = v23;
          -[NSObject weights](v39, "weights");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject biases](v39, "biases");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "childLayers");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "count");

          if (v67 < 2)
            goto LABEL_45;
          v68 = -[MLCTrainingGraph layerIndexToStoreSummedGradientsForTensor:](v4, "layerIndexToStoreSummedGradientsForTensor:", v40);
          objc_msgSend(v40, "childLayers");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68 == objc_msgSend(v45, "count"))
          {
LABEL_32:

            goto LABEL_33;
          }
          objc_msgSend(v40, "childLayers");
          v85 = v41;
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectAtIndexedSubscript:", v68);
          v87 = objc_claimAutoreleasedReturnValue();

          v41 = v85;
          v49 = v87 == v39;
          v9 = 0x1E981F000;
          if (v49)
          {
            objc_msgSend(v19, "computeEngine");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "sumSharedGradientsForConvolutionLayerTensorParameter:layerIndexForSummedGradients:", v40, v68);

            if (v85)
            {
              objc_msgSend(v19, "computeEngine");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "sumSharedGradientsForConvolutionLayerTensorParameter:layerIndexForSummedGradients:", v85, v68);

            }
LABEL_45:
            objc_msgSend(v19, "computeEngine");
            v223 = v40;
            v230 = v19;
            v236 = v23;
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject deviceOps](v39, "deviceOps");
            v91 = objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "deviceOps");
            v93 = v41;
            v94 = v4;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject weightsParameter](v39, "weightsParameter");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject biasesParameter](v39, "biasesParameter");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v94, "optimizer");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "oneStepOptimizerBuffers");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v238 = (void *)v91;
            objc_msgSend(v90, "updateFullyConnectedLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:", v91, v56, v95, v96, v98);

            v9 = 0x1E981F000uLL;
            v62 = v93;

            v63 = v92;
            v64 = v90;
            v19 = v230;
            v23 = v236;
            v65 = v223;
LABEL_46:

LABEL_47:
            v4 = v239;
LABEL_48:

LABEL_49:
            v22 = v242;
LABEL_50:
            objc_msgSend(*(id *)(v9 + 2064), "execution");
            v99 = objc_claimAutoreleasedReturnValue();
            v39 = v99;
            if (v240 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v99))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D4999000, v39, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteOptimizerUpdate -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
            }
            goto LABEL_53;
          }
        }
LABEL_33:

        v22 = v242;
LABEL_53:

        v18 = v22;
        if (!v22)
          goto LABEL_95;
      }
    }
    v19 = 0;
    obj = 0;
LABEL_95:
    -[MLCTrainingGraph optimizerParameterList](v4, "optimizerParameterList");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "count");

    if (v135)
    {
      v136 = 0;
      v137 = obj;
      do
      {
        -[MLCTrainingGraph optimizerParameterList](v4, "optimizerParameterList");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "objectAtIndexedSubscript:", v136);
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v9 + 2064), "execution");
        v140 = objc_claimAutoreleasedReturnValue();
        v141 = v140;
        if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v140))
        {
          objc_msgSend(v139, "tensor");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = objc_msgSend(v142, "tensorID");
          objc_msgSend(v139, "tensor");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "label");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134349314;
          v250 = v143;
          v4 = v239;
          v251 = 2114;
          v252 = (uint64_t)v145;
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v141, OS_SIGNPOST_INTERVAL_BEGIN, v212, "TensorParameterOptimizerUpdate", "Tensor parameter (%{public,name=TensorID}lu, \"%{public,name=TensorLabel}@\")", buf, 0x16u);

          v9 = 0x1E981F000;
        }

        objc_msgSend(v139, "device");
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v139, "isUpdatable"))
        {
          if ((v137 & 1) == 0)
          {
            objc_msgSend(v146, "computeEngine");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "deviceOps");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "learningRate");
            objc_msgSend(v147, "setOptimizerLearningRate:learningRate:", v149);

          }
          spida = (os_signpost_id_t)v146;
          if ((isKindOfClass & 1) != 0 || (v213 & 1) != 0)
          {
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "computeEngine");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCTrainingGraph optimizer](v4, "optimizer");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "deviceOps");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "setOptimizerTimeStep:timeStep:", v154, objc_msgSend(v151, "timeStep"));

            v4 = v239;
            v146 = (void *)spida;
          }
          objc_msgSend(v146, "computeEngine");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "deviceOps");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph rootSourceGradientTensor](v4, "rootSourceGradientTensor");
          v158 = v4;
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "tensor");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "objectAtIndexedSubscript:", objc_msgSend(v160, "rootSourceGradientTensorIndex") - 1);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v158, "optimizer");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "oneStepOptimizerBuffers");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "updateTensorParameter:optimizer:gradient:arrayOfParams:", v139, v157, v161, v163);

          v9 = 0x1E981F000uLL;
          +[MLCLog execution](MLCLog, "execution");
          v164 = objc_claimAutoreleasedReturnValue();
          v165 = v164;
          if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v164))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D4999000, v165, OS_SIGNPOST_INTERVAL_END, v212, "TensorParameterOptimizerUpdate", (const char *)&unk_1D4ABD322, buf, 2u);
          }

          v137 = 1;
          v4 = v239;
          v146 = (void *)spida;
        }

        ++v136;
        -[MLCTrainingGraph optimizerParameterList](v4, "optimizerParameterList");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend(v166, "count");

        v19 = v146;
      }
      while (v136 < v167);
    }
    else
    {
      v146 = v19;
    }
    -[MLCTrainingGraph optimizer](v4, "optimizer");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "oneStepOptimizerBuffers");
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    if (v169)
    {
      spidb = (os_signpost_id_t)v146;
      v246 = 0u;
      v247 = 0u;
      v244 = 0u;
      v245 = 0u;
      -[MLCTrainingGraph optimizerUpdateDeviceList](v4, "optimizerUpdateDeviceList");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v244, v248, 16);
      if (!v233)
        goto LABEL_135;
      v227 = *(_QWORD *)v245;
      while (1)
      {
        v170 = 0;
        do
        {
          if (*(_QWORD *)v245 != v227)
            objc_enumerationMutation(obja);
          v237 = v170;
          v241 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * v170);
          objc_msgSend(v241, "computeEngine");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "deviceOps");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCTrainingGraph optimizer](v4, "optimizer");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "oneStepOptimizerBuffers");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "updateAllParametersWithOptimizer:arrayOfParameters:", v173, v175);

          -[MLCTrainingGraph optimizerUpdateLayerList](v4, "optimizerUpdateLayerList");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = objc_msgSend(v176, "count");

          if (v177)
          {
            for (i = v177 - 1; i != -1; --i)
            {
              -[MLCTrainingGraph optimizerUpdateLayerList](v4, "optimizerUpdateLayerList");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "objectAtIndexedSubscript:", i);
              v180 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v181 = v180;
                objc_msgSend(v241, "computeEngine");
                v182 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "deviceOps");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v184, "deviceOps");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "inputWeightsParameters");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "hiddenWeightsParameters");
                v243 = v180;
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "biasesParameters");
                v188 = (void *)objc_claimAutoreleasedReturnValue();

                -[MLCTrainingGraph optimizer](v4, "optimizer");
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v189, "oneStepOptimizerBuffers");
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v182, "restoreRNNParamsWithDeviceOps:optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:", v183, v185, v186, v187, v188, v190);

                v4 = v239;
                v180 = v243;

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_132;
                objc_msgSend(v241, "computeEngine");
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                v192 = objc_opt_respondsToSelector();

                if ((v192 & 1) == 0)
                  goto LABEL_132;
                v182 = v180;
                objc_msgSend(v182, "weights");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "childLayers");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                v194 = objc_msgSend(v193, "count");

                if (v194 >= 2)
                {
                  v195 = -[MLCTrainingGraph layerIndexToStoreSummedGradientsForTensor:](v4, "layerIndexToStoreSummedGradientsForTensor:", v183);
                  objc_msgSend(v183, "childLayers");
                  v184 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v195 == objc_msgSend(v184, "count"))
                    goto LABEL_124;
                  objc_msgSend(v183, "childLayers");
                  v196 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v196, "objectAtIndexedSubscript:", v195);
                  v197 = (id)objc_claimAutoreleasedReturnValue();

                  if (v197 != v182)
                    goto LABEL_125;
                }
                objc_msgSend(v241, "computeEngine");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v182, "deviceOps");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v184, "restoreConvolutionParamsWithDeviceOps:", v185);
              }

LABEL_124:
LABEL_125:

LABEL_132:
            }
          }
          v170 = v237 + 1;
        }
        while (v237 + 1 != v233);
        v233 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v244, v248, 16);
        if (!v233)
        {
LABEL_135:

          v9 = 0x1E981F000uLL;
          v146 = (void *)spidb;
          break;
        }
      }
    }
    if (-[MLCTrainingGraph updateOptimizerTimeStep](v4, "updateOptimizerTimeStep") && ((isKindOfClass | v213) & 1) != 0)
    {
      -[MLCTrainingGraph optimizer](v4, "optimizer");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "setTimeStep:", objc_msgSend(v198, "timeStep") + 1);

    }
    objc_msgSend(*(id *)(v9 + 2064), "execution");
    v199 = objc_claimAutoreleasedReturnValue();
    v200 = v199;
    v5 = v207;
    if (v218 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v199))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v200, OS_SIGNPOST_INTERVAL_END, v212, "ExecuteOptimizerUpdate", (const char *)&unk_1D4ABD322, buf, 2u);
    }

  }
  objc_autoreleasePoolPop(v5);
}

- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  NSDictionary *v11;
  void (**v12)(MLCGraphCompletionHandler, _QWORD, void *, double);
  CFAbsoluteTime Current;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MLCExecutionOptions v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v11 = outputsData;
  v12 = completionHandler;
  Current = 0.0;
  if ((options & 4) != 0)
    Current = CFAbsoluteTimeGetCurrent();
  -[MLCTrainingGraph recompileWithOptions:](self, "recompileWithOptions:", options);
  if ((options & 2) == 0 && !v12)
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.1(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("Empty graph");
    goto LABEL_21;
  }
  if (!-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("graph not ready for execution");
    goto LABEL_21;
  }
  v17 = -[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph");
  if (batchSize && !v17)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.3(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph");
LABEL_21:
    +[MLCErrors invalidStateErrorForMethod:description:](MLCErrors, "invalidStateErrorForMethod:description:", v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v12[2](v12, 0, v23, 0.0);
    v24 = 0;
    goto LABEL_24;
  }
  if (v11 && !-[MLCGraph checkPageAlignmentAndSizeForOutputs:](self, "checkPageAlignmentAndSizeForOutputs:", v11))
  {
    +[MLCLog framework](MLCLog, "framework");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.2(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("Outputs buffers must be page aligned and a multiple of page size");
    goto LABEL_21;
  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v27, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "computeEngine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    objc_msgSend(v23, "computeEngine");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "selectDevicesWithBatchSize:calledfromBindAndWrite:", batchSize, 0);

  }
  if ((options & 4) != 0)
  {
    *(CFAbsoluteTime *)v44 = Current;
    v44[1] = 0;
    v44[2] = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, 24);
    v43 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v31, "count") - 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "resultTensors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:](self, "executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:", objc_msgSend(v35, "count"), v34, 0, batchSize, (options & 8) == 0, options);

  if (v34)
  {
    objc_msgSend(v32, "device");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "computeEngine");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "synchronizeTensor:", v34);

  }
  -[MLCGraph dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:](self, "dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:", v11, 0, 0, batchSize);
  objc_msgSend(v23, "computeEngine");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v40 = (options >> 2) & 1;
  if ((options & 2) != 0)
  {
    v41 = (void *)v43;
    objc_msgSend(v38, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", v12, v40, v43, 0);
  }
  else
  {
    v41 = (void *)v43;
    objc_msgSend(v38, "commitWithCompletionHandler:enableProfiling:graphExecutionTime:graphResultTensor:", v12, v40, v43, 0);
  }

  v24 = 1;
LABEL_24:

  return v24;
}

- (BOOL)executeForwardWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:](self, "executeForwardWithBatchSize:options:outputsData:completionHandler:", batchSize, options, 0, completionHandler);
}

- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options outputsData:(NSDictionary *)outputsData completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  NSDictionary *v11;
  void (**v12)(MLCGraphCompletionHandler, _QWORD, void *, double);
  CFAbsoluteTime Current;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MLCExecutionOptions v32;
  NSObject *v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v11 = outputsData;
  v12 = completionHandler;
  Current = 0.0;
  if ((options & 4) != 0)
    Current = CFAbsoluteTimeGetCurrent();
  if ((options & 2) == 0 && !v12)
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.1(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("Empty graph");
    goto LABEL_21;
  }
  if (!-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("graph not ready for execution");
    goto LABEL_21;
  }
  v17 = -[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph");
  if (batchSize && !v17)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.3(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph");
LABEL_21:
    +[MLCErrors invalidStateErrorForMethod:description:](MLCErrors, "invalidStateErrorForMethod:description:", v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v12[2](v12, 0, v23, 0.0);
    v24 = 0;
    goto LABEL_24;
  }
  if (v11 && !-[MLCGraph checkPageAlignmentAndSizeForOutputs:](self, "checkPageAlignmentAndSizeForOutputs:", v11))
  {
    +[MLCLog framework](MLCLog, "framework");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.2(a2);

    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("Outputs buffers must be page aligned and a multiple of page size");
    goto LABEL_21;
  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  if ((options & 4) != 0)
  {
    *(CFAbsoluteTime *)v34 = Current;
    v34[1] = 0;
    v34[2] = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v34, 24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MLCTrainingGraph compileAndAllocateGradientTensorsForGraph:](self, "compileAndAllocateGradientTensorsForGraph:", 0);
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:](self, "executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:", objc_msgSend(v29, "count") - 1, 0, batchSize, options);

  -[MLCGraph dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:](self, "dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:", v11, 0, 0, batchSize);
  objc_msgSend(v23, "computeEngine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = (options >> 2) & 1;
  if ((options & 2) != 0)
    objc_msgSend(v30, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", v12, v32, v28, 0);
  else
    objc_msgSend(v30, "commitWithCompletionHandler:enableProfiling:graphExecutionTime:graphResultTensor:", v12, v32, v28, 0);

  v24 = 1;
LABEL_24:

  return v24;
}

- (BOOL)executeGradientWithBatchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCTrainingGraph executeGradientWithBatchSize:options:outputsData:completionHandler:](self, "executeGradientWithBatchSize:options:outputsData:completionHandler:", batchSize, options, 0, completionHandler);
}

- (BOOL)executeOptimizerUpdateWithOptions:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  void (**v7)(MLCGraphCompletionHandler, _QWORD, void *, double);
  CFAbsoluteTime Current;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MLCExecutionOptions v23;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v7 = completionHandler;
  Current = 0.0;
  if ((options & 4) != 0)
    Current = CFAbsoluteTimeGetCurrent();
  if ((options & 2) == 0 && !v7)
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if (-[MLCGraph readyForExecution](self, "readyForExecution"))
    {
      if ((options & 4) != 0)
      {
        *(CFAbsoluteTime *)v25 = Current;
        v25[1] = 0;
        v25[2] = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25, 24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      -[MLCTrainingGraph executeOptimizerUpdateWithExecutionOptions:](self, "executeOptimizerUpdateWithExecutionOptions:", options);
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "computeEngine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = (options >> 2) & 1;
      if ((options & 2) != 0)
        objc_msgSend(v21, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", v7, v23, v12, 0);
      else
        objc_msgSend(v21, "commitWithCompletionHandler:enableProfiling:graphExecutionTime:graphResultTensor:", v7, v23, v12, 0);

      v17 = 1;
      goto LABEL_26;
    }
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);

    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("graph not ready for execution");
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.1(a2);

    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("Empty graph");
  }
  +[MLCErrors invalidStateErrorForMethod:description:](MLCErrors, "invalidStateErrorForMethod:description:", v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v7[2](v7, 0, v12, 0.0);
  v17 = 0;
LABEL_26:

  return v17;
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](self, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:", inputsData, lossLabelsData, lossLabelWeightsData, 0, batchSize, options, completionHandler);
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  NSDictionary *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  void (**v18)(MLCGraphCompletionHandler, _QWORD, void *, double);
  CFAbsoluteTime Current;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSDictionary *v27;
  NSObject *v28;
  void *v29;
  const __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  size_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  os_signpost_id_t v71;
  NSObject *v72;
  NSObject *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  const char *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  NSDictionary *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  BOOL v97;
  NSDictionary *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  unint64_t v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  unint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  unint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  NSObject *v169;
  void *v170;
  unint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  MLCExecutionOptions v177;
  void *v178;
  void *v179;
  char v180;
  BOOL v181;
  void *v182;
  unint64_t v183;
  void *v184;
  NSDictionary *v185;
  os_signpost_id_t spid;
  void *spida;
  os_signpost_id_t spidb;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  NSDictionary *v193;
  NSDictionary *v194;
  void *v195;
  void *v196;
  void *v197;
  char isKindOfClass;
  NSDictionary *v199;
  void *v200;
  unint64_t size;
  void *sizea;
  void *v203;
  __int128 buf;
  uint64_t v207;
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v14 = inputsData;
  v15 = lossLabelsData;
  v16 = lossLabelWeightsData;
  v17 = outputsData;
  v18 = completionHandler;
  Current = 0.0;
  if ((options & 4) != 0)
    Current = CFAbsoluteTimeGetCurrent();
  if (!v18 && (options & 2) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.5(a2);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    v27 = v17;
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.1(a2);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("Empty graph");
    goto LABEL_37;
  }
  -[MLCGraph allInputs](self, "allInputs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v27 = v17;
    +[MLCLog framework](MLCLog, "framework");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.2(a2);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("No inputs compiled in graph");
    goto LABEL_37;
  }
  -[MLCGraph allLossLabels](self, "allLossLabels");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 && v15 && !-[NSDictionary isEqualToDictionary:](v15, "isEqualToDictionary:", MEMORY[0x1E0C9AA70]))
  {
    v27 = v17;
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.10(a2);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("No loss labels compiled in graph");
    goto LABEL_37;
  }
  -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25 && v16 && !-[NSDictionary isEqualToDictionary:](v16, "isEqualToDictionary:", MEMORY[0x1E0C9AA70]))
  {
    v27 = v17;
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.9(a2);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("No loss label weights compiled in graph");
    goto LABEL_37;
  }
  if (!-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    v27 = v17;
    +[MLCLog framework](MLCLog, "framework");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("graph not ready for execution");
    goto LABEL_37;
  }
  v26 = -[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph");
  if (!batchSize || v26)
  {
    if (v17 && !-[MLCGraph checkPageAlignmentAndSizeForOutputs:](self, "checkPageAlignmentAndSizeForOutputs:", v17))
    {
      v27 = v17;
      +[MLCLog framework](MLCLog, "framework");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.2(a2);

      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("Outputs buffers must be page aligned and a multiple of page size");
      goto LABEL_37;
    }
    v194 = v16;
    v199 = v14;
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "device");
    v189 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLCGraph graphLayerList](self, "graphLayerList");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    -[MLCGraph graphLayerList](self, "graphLayerList");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    while (v44-- >= 1)
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "skipLayer");

      if ((v48 & 1) == 0)
        goto LABEL_48;
    }
    v44 = v42;
LABEL_48:
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", v44);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v203 = v50;
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v50, "resultTensors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "tensorAllocationSizeInBytes");
    objc_msgSend(v52, "descriptor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    size = v54 / objc_msgSend(v55, "elementCount");

    v200 = v52;
    objc_msgSend(v52, "descriptor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "elementCount");

    v193 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v203, "resultTensors");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "descriptor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "shape");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = objc_msgSend(v61, "unsignedIntegerValue");

      if (v191 == 1)
      {
        objc_msgSend(v203, "sourceTensors");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "objectAtIndexedSubscript:", 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "descriptor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "shape");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v57 *= objc_msgSend(v65, "unsignedIntegerValue");

      }
    }
    +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v57, size, 0x3E4CE1ACuLL), v57 * size, 1);
    v66 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "descriptor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = (void *)v66;
    +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setMultiDeviceReductionType:", objc_msgSend(v200, "multiDeviceReductionType"));
    -[MLCGraph device](self, "device");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setDevice:", v68);

    if ((options & 4) != 0)
    {
      buf = *(unint64_t *)&Current;
      v207 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &buf, 24);
      v69 = objc_claimAutoreleasedReturnValue();
      +[MLCLog execution](MLCLog, "execution");
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = os_signpost_id_generate(v70);

    }
    else
    {
      v69 = 0;
      v71 = 0;
    }
    +[MLCLog execution](MLCLog, "execution");
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = v72;
    spid = v71;
    v74 = v71 - 1;
    sizea = v67;
    v197 = (void *)v69;
    if ((options & 1) != 0)
    {
      if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v73, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindDataLSTMLayers", (const char *)&unk_1D4ABD322, (uint8_t *)&buf, 2u);
      }

      -[MLCGraph updateLSTMLayersForVariableSequenceLengthInGraph:withInputData:](self, "updateLSTMLayersForVariableSequenceLengthInGraph:withInputData:", self, v199);
      +[MLCLog execution](MLCLog, "execution");
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = v80;
      if (v74 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v80))
        goto LABEL_86;
      LOWORD(buf) = 0;
      v82 = "BindDataLSTMLayers";
      goto LABEL_67;
    }
    v183 = v74;
    if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v73, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindData", (const char *)&unk_1D4ABD322, (uint8_t *)&buf, 2u);
    }

    -[MLCGraph allInputs](self, "allInputs");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "device");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = (options >> 1) & 1;
    v78 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v199, v179, v77, batchSize, v177, 0);

    if (v78)
    {
      objc_msgSend(v203, "device");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v194;
      if (objc_msgSend(v79, "type") == 1)
      {
        objc_opt_class();
        v180 = objc_opt_isKindOfClass();
      }
      else
      {
        v180 = 0;
      }
      v67 = sizea;

      if (!v193)
        goto LABEL_140;
      -[MLCGraph allLossLabels](self, "allLossLabels");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectAtIndexedSubscript:", 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "device");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v193, v93, v96, batchSize, v177, v180 & 1);

      v67 = sizea;
      v16 = v194;

      v74 = v183;
      if (!v97)
      {
        v108 = (void *)MEMORY[0x1E0CB3940];
        -[MLCGraph allLossLabels](self, "allLossLabels");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "stringWithFormat:", CFSTR("loss label name missing from loss labels specified at compile time allLossLabels=%@"), v109);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLCLog framework](MLCLog, "framework");
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();
        v88 = v17;

        NSStringFromSelector(a2);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v111, v86);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v199;
        v36 = v189;
        if (v18)
          v18[2](v18, 0, v90, 0.0);
        +[MLCLog execution](MLCLog, "execution");
        v112 = objc_claimAutoreleasedReturnValue();
        v92 = v112;
        v15 = v193;
        if (v183 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v112))
          goto LABEL_113;
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v86;
      }
      else
      {
LABEL_140:
        if (!v16)
          goto LABEL_83;
        v98 = v16;
        -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "objectAtIndexedSubscript:", 0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "device");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v98, v174, v101, batchSize, v177, v180 & 1);

        v67 = sizea;
        if (v181)
        {
LABEL_83:
          +[MLCLog execution](MLCLog, "execution");
          v102 = objc_claimAutoreleasedReturnValue();
          v81 = v102;
          if (v74 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v102))
            goto LABEL_86;
          LOWORD(buf) = 0;
          v82 = "BindData";
LABEL_67:
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v81, OS_SIGNPOST_INTERVAL_END, spid, v82, (const char *)&unk_1D4ABD322, (uint8_t *)&buf, 2u);
LABEL_86:

          if ((options & 8) != 0
            || (-[MLCTrainingGraph compileAndAllocateGradientTensorsForGraph:](self, "compileAndAllocateGradientTensorsForGraph:", 0), (isKindOfClass & 1) == 0))
          {
            -[MLCTrainingGraph executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:](self, "executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:", v44 + 1, v67, 1, batchSize, (options & 8) == 0, options);
          }
          else
          {
            -[MLCTrainingGraph executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:](self, "executeForwardToLayerIndex:resultTensor:resultStateIsTemporary:batchSize:forTraining:executionOptions:", v44, 0, 1, batchSize, 1, options);
            -[MLCGraph allLossLabels](self, "allLossLabels");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "allKeys");
            v104 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v104, "count"))
            {
              objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph allLossLabels](self, "allLossLabels");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "objectForKeyedSubscript:", v105);
              v107 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v107 = 0;
            }
            -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "allKeys");
            v114 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v114, "count"))
            {
              objc_msgSend(v114, "objectAtIndexedSubscript:", 0);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "objectForKeyedSubscript:", v115);
              spida = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              spida = 0;
            }
            if (v107)
            {
              -[MLCGraph graphLayerList](self, "graphLayerList");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "objectAtIndexedSubscript:", v44);
              v118 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v118, "resultGradientTensors");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
              v184 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v107, "descriptor");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "shape");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = objc_msgSend(v173, "count");
              objc_msgSend(v107, "descriptor");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v178 = v114;
              v182 = v104;
              v122 = v121;
              if (v120 == 1)
              {
                objc_msgSend(v121, "shape");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "objectAtIndexedSubscript:", 0);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v171 = objc_msgSend(v124, "unsignedIntegerValue");
              }
              else
              {
                objc_msgSend(v121, "stride");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "objectAtIndexedSubscript:", 0);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v171 = (unint64_t)objc_msgSend(v124, "unsignedIntegerValue") >> 2;
              }

              objc_msgSend(v118, "setBatchSize:", batchSize);
              objc_msgSend(v118, "device");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v176, "computeEngine");
              v172 = v118;
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "deviceOps");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "sourceTensors");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "objectAtIndexedSubscript:", 0);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "dispatchForwardAndGradientLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultGradientTensor:", v134, v136, v107, v171, spida, sizea, v184);

              v114 = v178;
              v104 = v182;
            }

          }
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "objectAtIndexedSubscript:", v44);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v138, "isDebuggingEnabled");

          if (v139)
          {
            objc_msgSend(sizea, "deviceMemory");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCGraph graphLayerList](self, "graphLayerList");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "objectAtIndexedSubscript:", v44);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "resultTensors");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "objectAtIndexedSubscript:", 0);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "setDeviceMemory:", v140);

          }
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "objectAtIndexedSubscript:", 0);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "device");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "computeEngine");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          spidb = (options >> 2) & 1;
          objc_msgSend(v148, "commitWithProfiling:graphExecutionTime:", spidb, v197);

          if ((options & 8) == 0)
          {
            v185 = v17;
            -[MLCTrainingGraph optimizer](self, "optimizer");
            v149 = (void *)objc_claimAutoreleasedReturnValue();

            if (v149)
            {
              -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v151 = objc_msgSend(v150, "count");

              if (v151)
              {
                v152 = 0;
                do
                {
                  -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "objectAtIndexedSubscript:", v152);
                  v154 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v154, "device");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v155, "computeEngine");
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v154, "deviceOps");
                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v156, "incrementReadCountForGradientState:increment:", v157, 1);

                  ++v152;
                  -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  v159 = objc_msgSend(v158, "count");

                }
                while (v152 < v159);
              }
            }
            v160 = v44 - (isKindOfClass & 1);
            if (v160 >= 0)
              -[MLCTrainingGraph executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:](self, "executeGradientFromLayerIndex:resultStateIsTemporary:batchSize:executionOptions:", v160, 1, batchSize, options);
            -[MLCTrainingGraph executeOptimizerUpdateWithExecutionOptions:](self, "executeOptimizerUpdateWithExecutionOptions:", options);
            v17 = v185;
          }
          v131 = sizea;
          if (sizea)
          {
            objc_msgSend(v203, "device");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "computeEngine");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "synchronizeTensor:", sizea);

            objc_msgSend(v203, "device");
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "computeEngine");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v203, "resultTensors");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "objectAtIndexedSubscript:", 0);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "shareDeviceMemoryWithResultTensor:sourceTensor:", v166, sizea);

            v131 = sizea;
          }
          objc_msgSend(v203, "resultTensors");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "objectAtIndexedSubscript:", 0);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:](self, "dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:", v17, v168, v131, batchSize);

          v14 = v199;
          if ((options & 2) != 0)
          {
            v15 = v193;
            v36 = v189;
            if ((executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready & 1) == 0)
            {
              +[MLCLog framework](MLCLog, "framework");
              v169 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(a2);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v170;
                _os_log_impl(&dword_1D4999000, v169, OS_LOG_TYPE_INFO, "%@: Synchronous Execution requested", (uint8_t *)&buf, 0xCu);

                v15 = v193;
              }

              executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready = 1;
              v131 = sizea;
            }
            objc_msgSend(v189, "computeEngine");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = v197;
            objc_msgSend(v86, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", v18, spidb, v197, v131);
            v37 = 1;
          }
          else
          {
            v36 = v189;
            objc_msgSend(v189, "computeEngine");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = v197;
            objc_msgSend(v86, "commitWithCompletionHandler:enableProfiling:graphExecutionTime:graphResultTensor:", v18, spidb, v197, v131);
            v37 = 1;
            v15 = v193;
          }
          v16 = v194;
          goto LABEL_137;
        }
        v125 = v74;
        v126 = (void *)MEMORY[0x1E0CB3940];
        -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "stringWithFormat:", CFSTR("loss label weight name missing from loss label weights specified at compile time allLossLabelWeights=%@"), v127);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLCLog framework](MLCLog, "framework");
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();
        v88 = v17;

        NSStringFromSelector(a2);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v129, v86);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v199;
        v16 = v194;
        v36 = v189;
        if (v18)
          v18[2](v18, 0, v90, 0.0);
        +[MLCLog execution](MLCLog, "execution");
        v130 = objc_claimAutoreleasedReturnValue();
        v92 = v130;
        v15 = v193;
        if (v125 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v130))
        {
LABEL_113:

          v37 = 0;
          v17 = v88;
          v131 = sizea;
          v132 = v197;
LABEL_137:

          goto LABEL_40;
        }
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v86;
      }
    }
    else
    {
      v84 = (void *)MEMORY[0x1E0CB3940];
      -[MLCGraph allInputs](self, "allInputs");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "stringWithFormat:", CFSTR("input name missing from inputs specified at compile time allInputs=%@"), v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      +[MLCLog framework](MLCLog, "framework");
      v87 = objc_claimAutoreleasedReturnValue();
      v16 = v194;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();
      v88 = v17;

      NSStringFromSelector(a2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v89, v86);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v199;
      v36 = v189;
      if (v18)
        v18[2](v18, 0, v90, 0.0);
      +[MLCLog execution](MLCLog, "execution");
      v91 = objc_claimAutoreleasedReturnValue();
      v92 = v91;
      v15 = v193;
      if (v183 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v91))
        goto LABEL_113;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v86;
    }
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v92, OS_SIGNPOST_INTERVAL_END, spid, "BindData", "%{public,name=Error}@", (uint8_t *)&buf, 0xCu);
    goto LABEL_113;
  }
  v27 = v17;
  +[MLCLog framework](MLCLog, "framework");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.3(a2);

  NSStringFromSelector(a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph");
LABEL_37:
  +[MLCErrors invalidStateErrorForMethod:description:](MLCErrors, "invalidStateErrorForMethod:description:", v29, v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v18[2](v18, 0, v36, 0.0);
  v37 = 0;
  v17 = v27;
LABEL_40:

  return v37;
}

- (id)resultGradientTensorsForLayer:(id)a3 summedGradientForInputTensors:(BOOL)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  _BOOL4 v69;

  v69 = a4;
  v5 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v5, v6);

  if (!v7)
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.3();
    goto LABEL_18;
  }
  if ((objc_msgSend(v5, "isTrainable") & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.2();
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "skipLayer"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "resultTensors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "parentLayers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "resultTensors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11 != v5)
      {
        objc_msgSend(v13, "parentLayers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "resultGradientTensors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
        {
          objc_msgSend(v5, "sourceTensors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sourceTensors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 == v22)
          {
            objc_msgSend(v16, "resultGradientTensors");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "resultGradientTensors");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:atIndexedSubscript:", v37, 0);

            objc_msgSend(v16, "sourceGradientTensors");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            v28 = 0;
          }
          else
          {
            objc_msgSend(v16, "sourceGradientTensors");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "resultGradientTensors");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, 0);

            objc_msgSend(v16, "resultGradientTensors");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            v28 = 2;
          }
          objc_msgSend(v26, "objectAtIndexedSubscript:", v28);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "resultGradientTensors");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:atIndexedSubscript:", v39, 1);

        }
        goto LABEL_23;
      }
      objc_msgSend(v13, "childLayers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v31, "fusedLayers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v33 = (id)objc_claimAutoreleasedReturnValue();

        if (v33 == v5)
        {
          v16 = v5;
          v5 = v31;
LABEL_23:

          goto LABEL_24;
        }
      }

    }
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.1();
LABEL_18:

    v34 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
LABEL_24:
  v41 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "sourceTensors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    v44 = 0;
    v45 = 0;
    do
    {
      objc_msgSend(v5, "sourceTensors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "computeFlags");

      if ((v48 & 8) == 0)
      {
        objc_msgSend(v5, "sourceTensors");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "parentLayers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");

        if (v52 || !v69)
        {
          objc_msgSend(v5, "resultGradientTensors");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "count");

          if (!v63)
            break;
          objc_msgSend(v5, "resultGradientTensors");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v59;
          v61 = v44;
        }
        else
        {
          objc_msgSend(v5, "sourceTensors");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectAtIndexedSubscript:", v44);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "rootSourceGradientTensorIndexStart");
          objc_msgSend(v5, "sourceTensors");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectAtIndexedSubscript:", v44);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v55 + objc_msgSend(v57, "rootSourceGradientTensorCount") - 2;

          -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v59;
          v61 = v58;
        }
        objc_msgSend(v59, "objectAtIndexedSubscript:", v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:atIndexedSubscript:", v64, v45);

        ++v45;
      }
      ++v44;
      objc_msgSend(v5, "sourceTensors");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");

    }
    while (v44 < v66);
  }
  if (objc_msgSend(v41, "count"))
  {
    v67 = 0;
    do
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isDebuggingEnabled"))
        objc_msgSend(v68, "synchronizeData");

      ++v67;
    }
    while (v67 < objc_msgSend(v41, "count"));
  }
  v34 = (void *)objc_msgSend(v41, "copy");

LABEL_19:
  return v34;
}

- (MLCTensor)gradientTensorForInput:(MLCTensor *)input
{
  MLCTensor *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = input;
  -[MLCTensor parentLayers](v4, "parentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    v8 = -[MLCTensor rootSourceGradientTensorIndexStart](v4, "rootSourceGradientTensorIndexStart");

    if (v8)
    {
      v9 = -[MLCTensor rootSourceGradientTensorIndexStart](v4, "rootSourceGradientTensorIndexStart");
      v10 = v9 + -[MLCTensor rootSourceGradientTensorCount](v4, "rootSourceGradientTensorCount") - 2;
      -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  +[MLCLog framework](MLCLog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCTrainingGraph gradientTensorForInput:].cold.1();

  v7 = 0;
LABEL_8:

  return (MLCTensor *)v7;
}

- (NSArray)resultGradientTensorsForLayer:(MLCLayer *)layer
{
  return (NSArray *)-[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:](self, "resultGradientTensorsForLayer:summedGradientForInputTensors:", layer, 0);
}

- (NSArray)sourceGradientTensorsForLayer:(MLCLayer *)layer
{
  MLCLayer *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;

  v4 = layer;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v4, v5);

  if ((self & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    -[MLCLayer sourceGradientTensors](v4, "sourceGradientTensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 1)
    {
      if (-[MLCLayer skipLayer](v4, "skipLayer"))
      {
        -[MLCLayer resultTensors](v4, "resultTensors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentLayers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sourceGradientTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v14, 0);

      }
      else
      {
        -[MLCLayer sourceGradientTensors](v4, "sourceGradientTensors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v10, 0);
      }

    }
    else
    {
      -[MLCLayer sourceGradientTensors](v4, "sourceGradientTensors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = 0;
        do
        {
          -[MLCLayer sourceGradientTensors](v4, "sourceGradientTensors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v21, v19);

          ++v19;
          -[MLCLayer sourceGradientTensors](v4, "sourceGradientTensors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

        }
        while (v19 < v23);
      }
    }
    if (objc_msgSend(v6, "count"))
    {
      v24 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[MLCLayer isDebuggingEnabled](v4, "isDebuggingEnabled"))
          objc_msgSend(v25, "synchronizeData");

        ++v24;
      }
      while (v24 < objc_msgSend(v6, "count"));
    }
    v16 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.3();

    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v16;
}

- (id)resultTensorsForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MLCTrainingGraph;
  -[MLCGraph resultTensorsForLayer:graphLayerList:](&v8, sel_resultTensorsForLayer_graphLayerList_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sourceTensorsForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MLCTrainingGraph;
  -[MLCGraph sourceTensorsForLayer:graphLayerList:](&v8, sel_sourceTensorsForLayer_graphLayerList_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MLCTensor)allocateUserGradientForTensor:(MLCTensor *)tensor
{
  MLCTensor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  MLCTensor *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  MLCTensor *v38;
  void *v39;
  unint64_t v40;

  v5 = tensor;
  if (!-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph allocateUserGradientForTensor:].cold.2(a2);
    goto LABEL_14;
  }
  if (!-[MLCTrainingGraph allocateResultGradientTensors](self, "allocateResultGradientTensors"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph allocateUserGradientForTensor:].cold.1(a2);
LABEL_14:

    v22 = 0;
    goto LABEL_15;
  }
  -[MLCTensor parentLayers](v5, "parentLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[MLCTensor parentLayers](v5, "parentLayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLCTensor childLayers](v5, "childLayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTrainingGraph dummyLayer](self, "dummyLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    -[MLCTensor childLayers](v5, "childLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 == 1)
    {
      objc_msgSend(v9, "resultTensors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = 0;
        while (1)
        {
          objc_msgSend(v9, "resultTensors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
          v18 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          if (v18 == v5)
            break;
          ++v16;
          objc_msgSend(v9, "resultTensors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v16 >= v20)
            goto LABEL_25;
        }
LABEL_26:
        objc_msgSend(v9, "sourceGradientTensors");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v34;
        v33 = v16;
        goto LABEL_27;
      }
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v9, "device");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        -[MLCTrainingGraph allocateGradientTensorsForMultipleChildrenOfSplitLayer:tensor:gradientTensorsAreTemporary:device:](self, "allocateGradientTensorsForMultipleChildrenOfSplitLayer:tensor:gradientTensorsAreTemporary:device:", v9, v5, 0, v29);

        objc_msgSend(v9, "intermediateGradientTensors");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "intermediateGradientTensors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v31, "count") - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
        goto LABEL_29;
      }
      v32 = -[MLCTrainingGraph allocateGradientTensorsForMultipleChildrenOfLayer:gradientTensorsAreTemporary:device:](self, "allocateGradientTensorsForMultipleChildrenOfLayer:gradientTensorsAreTemporary:device:", v9, 0, v29);

      if (v32)
      {
        objc_msgSend(v9, "setIntermediateGradientTensorIndex:", objc_msgSend(v9, "intermediateGradientTensorIndex") + 1);
        objc_msgSend(v9, "intermediateGradientTensors");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v9, "intermediateGradientTensorIndex") - 1;
        v34 = v30;
LABEL_27:
        objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      objc_msgSend(v9, "resultTensors");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36)
      {
        v16 = 0;
        do
        {
          objc_msgSend(v9, "resultTensors");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v16);
          v38 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          if (v38 == v5)
            goto LABEL_26;
          ++v16;
          objc_msgSend(v9, "resultTensors");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

        }
        while (v16 < v40);
      }
    }
LABEL_25:
    v22 = 0;
LABEL_29:

    goto LABEL_15;
  }
  -[MLCTensor childLayers](v5, "childLayers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph dummyLayer](self, "dummyLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

  -[MLCTensor device](v5, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph allocateRootSourceGradientTensors:](self, "allocateRootSourceGradientTensors:", v26);

  -[MLCTrainingGraph rootSourceGradientTensor](self, "rootSourceGradientTensor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", -[MLCTensor rootSourceGradientTensorIndex](v5, "rootSourceGradientTensorIndex") - 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCTensor setRootSourceGradientTensorIndex:](v5, "setRootSourceGradientTensorIndex:", -[MLCTensor rootSourceGradientTensorIndex](v5, "rootSourceGradientTensorIndex") + 1);
LABEL_15:

  return (MLCTensor *)v22;
}

- (BOOL)linkWithGraphs:(NSArray *)graphs
{
  NSArray *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  MLCTrainingGraph *v22;
  int v24;
  void *v25;
  __int16 v26;
  MLCTrainingGraph *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = graphs;
  if ((-[MLCGraph compilerOptions](self, "compilerOptions") & 4) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = self;
      _os_log_impl(&dword_1D4999000, v6, OS_LOG_TYPE_INFO, "%@: Graph(=%@) is not compiled with MLCGraphCompilationOptionsLinkGraphs", (uint8_t *)&v24, 0x16u);

    }
    goto LABEL_26;
  }
  if (!-[NSArray count](v5, "count"))
    goto LABEL_20;
  if (-[NSArray count](v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compilerOptions");

      if ((v10 & 4) == 0)
        break;
      if (++v8 >= -[NSArray count](v5, "count"))
        goto LABEL_9;
    }
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v8);
    v22 = (MLCTrainingGraph *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_1D4999000, v6, OS_LOG_TYPE_INFO, "%@: Graph(=%@) is not compiled with MLCGraphCompilationOptionsLinkGraphs", (uint8_t *)&v24, 0x16u);

LABEL_25:
LABEL_26:

    v18 = 0;
    goto LABEL_27;
  }
LABEL_9:
  if (-[NSArray count](v5, "count"))
  {
    v11 = 0;
    while (1)
    {
      -[MLCGraph device](self, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v14)
        break;
      if (++v11 >= -[NSArray count](v5, "count"))
        goto LABEL_13;
    }
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v21;
    _os_log_impl(&dword_1D4999000, v6, OS_LOG_TYPE_INFO, "%@: Graphs with different devices cannot be linked", (uint8_t *)&v24, 0xCu);
    goto LABEL_25;
  }
LABEL_13:
  -[MLCGraph setRecompileAfterLinking:](self, "setRecompileAfterLinking:", 1);
  if (-[NSArray count](v5, "count"))
  {
    v15 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRecompileAfterLinking:", 1);

      ++v15;
    }
    while (v15 < -[NSArray count](v5, "count"));
  }
  -[MLCTrainingGraph compileAndAllocateGradientTensorsForGraph:](self, "compileAndAllocateGradientTensorsForGraph:", 0);
  if (-[NSArray count](v5, "count"))
  {
    v17 = 0;
    v18 = 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "compileAndAllocateGradientTensorsForGraph:", 1);

      -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUpdateOptimizerTimeStep:", 0);

      ++v17;
    }
    while (v17 < -[NSArray count](v5, "count"));
  }
  else
  {
LABEL_20:
    v18 = 1;
  }
LABEL_27:

  return v18;
}

- (void)synchronizeUpdates
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[MLCGraph device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTrainingGraph optimizer](self, "optimizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isUpdatable"))
        {
          objc_msgSend(v4, "computeEngine");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "synchronizeUpdatesForLayer:", v10);

        }
        ++v8;
        -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

      }
      while (v8 < v13);
    }
    -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "isUpdatable"))
        {
          objc_msgSend(v4, "computeEngine");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tensor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "synchronizeOptimizerUpdatesForTensor:", v20);

        }
        ++v16;
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

      }
      while (v16 < v22);
    }
    objc_msgSend(v4, "computeEngine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "commitAndWaitForCompletion:", 0);

    -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = 0;
      do
      {
        -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v28, "isUpdatable"))
        {
          objc_msgSend(v4, "computeEngine");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "convertUpdatesToTensorDataForLayer:", v28);

        }
        ++v26;
        -[MLCTrainingGraph optimizerUpdateLayerList](self, "optimizerUpdateLayerList");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

      }
      while (v26 < v31);
    }
    -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = 0;
      do
      {
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v36, "isUpdatable"))
        {
          objc_msgSend(v4, "computeEngine");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "tensor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "convertUpdatesToTensorDataForTensorParameters:", v38);

        }
        ++v34;
        -[MLCTrainingGraph optimizerParameterList](self, "optimizerParameterList");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

      }
      while (v34 < v40);
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412290;
      v44 = v42;
      _os_log_impl(&dword_1D4999000, v41, OS_LOG_TYPE_INFO, "%@: No optimizer in graph to synchronize the update", (uint8_t *)&v43, 0xCu);

    }
  }

}

- (NSData)gradientDataForParameter:(MLCTensor *)parameter layer:(MLCLayer *)layer
{
  MLCTensor *v6;
  MLCLayer *v7;
  void *v8;
  MLCLayer *v9;
  MLCTensor *v10;
  uint64_t v11;
  void *v12;
  MLCTensor *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  MLCLayer *v20;
  MLCTensor *v21;
  MLCTensor *v22;
  MLCLayer *v24;
  MLCTensor *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MLCLayer *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  MLCTensor *v37;
  _BOOL4 v38;
  void *v39;
  unint64_t v40;
  MLCLayer *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  MLCTensor *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  MLCTensor *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  void *v61;
  MLCTensor *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  MLCTensor *v69;
  _BOOL4 v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  MLCTensor *v77;
  _BOOL4 v78;
  void *v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;

  v6 = parameter;
  v7 = layer;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v7, v8);

  if ((self & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = v7;
      -[MLCLayer weights](v9, "weights");
      v10 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

      if (v10 == v6)
      {
        -[MLCLayer device](v9, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v9, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "weightsGradients:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      -[MLCLayer biases](v9, "biases");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[MLCLayer biases](v9, "biases");
        v13 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          -[MLCLayer device](v9, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "computeEngine");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCLayer deviceOps](v9, "deviceOps");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "biasesGradients:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v19 = (void *)v17;

          goto LABEL_23;
        }
      }
LABEL_19:
      v19 = 0;
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = v7;
      -[MLCLayer beta](v20, "beta");
      v21 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

      if (v21 == v6)
      {
        -[MLCLayer device](v20, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v20, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "betaGradients:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      -[MLCLayer gamma](v20, "gamma");
      v22 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

      if (v22 == v6)
      {
        -[MLCLayer device](v20, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v20, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "gammaGradients:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v7;
      -[MLCLayer weights](v24, "weights");
      v25 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

      if (v25 == v6)
      {
        -[MLCLayer descriptor](v24, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "embeddingCount");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntegerValue");

        -[MLCLayer descriptor](v24, "descriptor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "embeddingDimension");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        -[MLCLayer device](v24, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v24, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "embeddingWeightsGradients:embeddingCount:embeddingDimension:", v16, v28, v31);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v7;
      -[MLCLayer weights](v32, "weights");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        v35 = 0;
        while (1)
        {
          -[MLCLayer weights](v32, "weights");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
          v37 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          v38 = v37 == v6;
          if (v37 == v6)
            break;
          ++v35;
          -[MLCLayer weights](v32, "weights");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v35 >= v40)
            goto LABEL_51;
        }
      }
      else
      {
        v38 = 0;
LABEL_51:
        v35 = 0;
      }
      -[MLCLayer biases](v32, "biases");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");

      if (v66)
      {
        v67 = 0;
        while (1)
        {
          -[MLCLayer biases](v32, "biases");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectAtIndexedSubscript:", v67);
          v69 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          v70 = v69 == v6;
          if (v69 == v6)
            break;
          ++v67;
          -[MLCLayer biases](v32, "biases");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "count");

          if (v67 >= v72)
            goto LABEL_59;
        }
        v35 = v67;
      }
      else
      {
        v70 = 0;
      }
LABEL_59:
      -[MLCLayer attentionBiases](v32, "attentionBiases");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "count");

      if (v74)
      {
        v75 = 0;
        while (1)
        {
          -[MLCLayer attentionBiases](v32, "attentionBiases");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectAtIndexedSubscript:", v75);
          v77 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          v78 = v77 == v6;
          if (v77 == v6)
            break;
          ++v75;
          -[MLCLayer attentionBiases](v32, "attentionBiases");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "count");

          if (v75 >= v80)
            goto LABEL_66;
        }
        v35 = v75;
      }
      else
      {
        v78 = 0;
      }
LABEL_66:
      -[MLCTensor descriptor](v6, "descriptor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "tensorAllocationSizeInBytes");

      if (v38)
      {
        -[MLCLayer device](v32, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v32, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mhaWeightGradient:withSize:index:", v16, v82, v35);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (v70)
      {
        -[MLCLayer device](v32, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v32, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mhaBiasGradient:withSize:index:", v16, v82, v35);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (v78)
      {
        -[MLCLayer device](v32, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v32, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mhaAttnBiasGradient:withSize:index:", v16, v82, v35);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v7;
      -[MLCLayer inputWeights](v41, "inputWeights");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
      {
        v44 = 0;
        while (1)
        {
          -[MLCLayer inputWeights](v41, "inputWeights");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v44);
          v46 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          if (v46 == v6)
            break;
          ++v44;
          -[MLCLayer inputWeights](v41, "inputWeights");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

          if (v44 >= v48)
            goto LABEL_39;
        }
        -[MLCLayer device](v41, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v41, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lstmInputWeightGradient:mlcWeightIndex:", v16, v44);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_39:
      -[MLCLayer hiddenWeights](v41, "hiddenWeights");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v50)
      {
        v51 = 0;
        while (1)
        {
          -[MLCLayer hiddenWeights](v41, "hiddenWeights");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectAtIndexedSubscript:", v51);
          v53 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          if (v53 == v6)
            break;
          ++v51;
          -[MLCLayer hiddenWeights](v41, "hiddenWeights");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "count");

          if (v51 >= v55)
            goto LABEL_43;
        }
        -[MLCLayer device](v41, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer deviceOps](v41, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lstmHiddenWeightGradient:mlcWeightIndex:", v16, v51);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_43:
      -[MLCLayer biases](v41, "biases");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "count");

      if (v57)
      {
        v58 = 0;
        v59 = 0;
        v60 = 0;
        do
        {
          -[MLCLayer biases](v41, "biases");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", v58);
          v62 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

          if (v62 == v6)
            v60 = v58;
          v59 |= v62 == v6;
          ++v58;
          -[MLCLayer biases](v41, "biases");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "count");

        }
        while (v58 < v64);
        if ((v59 & 1) != 0)
        {
          -[MLCLayer device](v41, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "computeEngine");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCLayer deviceOps](v41, "deviceOps");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lstmBiasGradient:mlcBiasIndex:", v16, v60);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.3();

  }
  v19 = 0;
LABEL_24:

  return (NSData *)v19;
}

- (MLCOptimizer)optimizer
{
  return self->_optimizer;
}

- (void)setOptimizer:(id)a3
{
  objc_storeStrong((id *)&self->_optimizer, a3);
}

- (NSMutableArray)optimizerUpdateLayerList
{
  return self->_optimizerUpdateLayerList;
}

- (void)setOptimizerUpdateLayerList:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerUpdateLayerList, a3);
}

- (NSMutableArray)optimizerParameterList
{
  return self->_optimizerParameterList;
}

- (void)setOptimizerParameterList:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerParameterList, a3);
}

- (NSMutableArray)rootSourceGradientTensor
{
  return self->_rootSourceGradientTensor;
}

- (void)setRootSourceGradientTensor:(id)a3
{
  objc_storeStrong((id *)&self->_rootSourceGradientTensor, a3);
}

- (NSMutableArray)lossLayersInTrainingGraph
{
  return self->_lossLayersInTrainingGraph;
}

- (void)setLossLayersInTrainingGraph:(id)a3
{
  objc_storeStrong((id *)&self->_lossLayersInTrainingGraph, a3);
}

- (NSMutableArray)stopGradientTensorList
{
  return self->_stopGradientTensorList;
}

- (void)setStopGradientTensorList:(id)a3
{
  objc_storeStrong((id *)&self->_stopGradientTensorList, a3);
}

- (MLCLayerCompiling)lossLayer
{
  return self->_lossLayer;
}

- (void)setLossLayer:(id)a3
{
  objc_storeStrong((id *)&self->_lossLayer, a3);
}

- (MLCLayer)dummyLayer
{
  return self->_dummyLayer;
}

- (unint64_t)firstTrainableLayerIndex
{
  return self->_firstTrainableLayerIndex;
}

- (void)setFirstTrainableLayerIndex:(unint64_t)a3
{
  self->_firstTrainableLayerIndex = a3;
}

- (BOOL)allocateResultGradientTensors
{
  return self->_allocateResultGradientTensors;
}

- (void)setAllocateResultGradientTensors:(BOOL)a3
{
  self->_allocateResultGradientTensors = a3;
}

- (BOOL)allocateOptimizerData
{
  return self->_allocateOptimizerData;
}

- (void)setAllocateOptimizerData:(BOOL)a3
{
  self->_allocateOptimizerData = a3;
}

- (BOOL)updateOptimizerTimeStep
{
  return self->_updateOptimizerTimeStep;
}

- (void)setUpdateOptimizerTimeStep:(BOOL)a3
{
  self->_updateOptimizerTimeStep = a3;
}

- (NSSet)optimizerUpdateDeviceList
{
  return self->_optimizerUpdateDeviceList;
}

- (void)setOptimizerUpdateDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerUpdateDeviceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerUpdateDeviceList, 0);
  objc_storeStrong((id *)&self->_dummyLayer, 0);
  objc_storeStrong((id *)&self->_lossLayer, 0);
  objc_storeStrong((id *)&self->_stopGradientTensorList, 0);
  objc_storeStrong((id *)&self->_lossLayersInTrainingGraph, 0);
  objc_storeStrong((id *)&self->_rootSourceGradientTensor, 0);
  objc_storeStrong((id *)&self->_optimizerParameterList, 0);
  objc_storeStrong((id *)&self->_optimizerUpdateLayerList, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
}

- (void)setTrainingTensorParameters:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: not an input tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)setTrainingTensorParameters:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: parameter list has already been specified", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileOptimizer:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Compiling an optimizer (%@) in graph that has not been compiled with", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileOptimizer:.cold.2()
{
  void *v0;
  SEL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_5_1(&dword_1D4999000, v4, v5, "%@: Compiling an optimizer (%@) in graph that has already been compiled with another device(%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10_3();
}

- (void)recompileWithOptions:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: graph was not compiled with MLCGraphCompilationOptionsLinkGraphs", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: training graph is not supported on the Apple Neural Engine", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: graph has already been compiled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: inputTensorsData must be specified if inputTensors is", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: YOLO loss layer must be the last layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:(const char *)a1 device:inputTensors:inputTensorsData:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Phi layer is not supported yet.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.6()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: compilation failure for layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.7()
{
  void *v0;
  SEL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_5_1(&dword_1D4999000, v4, v5, "%@: Compiling a layer (%@) in graph that has already been compiled with another device(%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10_3();
}

- (void)stopGradientForTensors:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: stop gradient tensor list must be specified before training graph is compiled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)stopGradientForTensors:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: gradient tensors have already been allocated, cannot change the stop gradient tensor list", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeGradientFromLayerIndex:(const char *)a1 resultStateIsTemporary:batchSize:executionOptions:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeForwardWithBatchSize:(const char *)a1 options:outputsData:completionHandler:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.3()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.9(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.10(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Layer (%@) is not trainable or has been fused", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Layer (%@) is not trainable", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)resultGradientTensorsForLayer:summedGradientForInputTensors:.cold.3()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Layer (%@) is not in graph", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)gradientTensorForInput:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Tensor (%@) is not an input tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)allocateUserGradientForTensor:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: This method must be called after linkWithOptions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateUserGradientForTensor:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: This method must be called after training graph has been compiled for execution", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

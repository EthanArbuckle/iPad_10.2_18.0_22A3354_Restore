@implementation MLCFullyConnectedLayer

+ (MLCFullyConnectedLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor
{
  MLCConvolutionDescriptor *v8;
  MLCTensor *v9;
  MLCTensor *v10;
  void *v11;

  v8 = descriptor;
  v9 = biases;
  v10 = weights;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeights:biases:descriptor:", v10, v9, v8);

  return (MLCFullyConnectedLayer *)v11;
}

- (MLCFullyConnectedLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  MLCFullyConnectedLayer *v21;
  MLCFullyConnectedLayer *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  MLCFullyConnectedLayer *v54;
  MLCFullyConnectedLayer *v55;
  uint64_t v56;
  MLCTensorParameter *weightsParameter;
  uint64_t v58;
  MLCTensorParameter *biasesParameter;
  MLCTensorParameter *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  id v69;
  objc_super v72;
  objc_super v73;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (v14 >= 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.1(a2);
    goto LABEL_11;
  }
  objc_msgSend(v8, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.2(a2);
    goto LABEL_11;
  }
  v69 = v10;
  if (v9)
  {
    objc_msgSend(v9, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    if (v20 >= 2)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.3(a2);
      goto LABEL_11;
    }
    objc_msgSend(v9, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");
    v28 = objc_msgSend(v10, "outputFeatureChannelCount");

    if (v27 != v28)
    {
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.7(a2);

      v21 = 0;
      v10 = v69;
      goto LABEL_12;
    }
    objc_msgSend(v9, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shape");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v68, "count");
    if (v30 >= 4)
    {
      objc_msgSend(v9, "descriptor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shape");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v33, "unsignedIntegerValue") > 1)
      {

        v10 = v69;
LABEL_28:
        +[MLCLog framework](MLCLog, "framework");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.4(a2);
        goto LABEL_11;
      }
      v61 = v33;
      v63 = v32;
      v64 = v31;
    }
    v67 = v30;
    objc_msgSend(v9, "descriptor", v61);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shape");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v36, "count") < 3)
    {
      v40 = 0;
    }
    else
    {
      objc_msgSend(v9, "descriptor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v29;
      objc_msgSend(v65, "shape");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (unint64_t)objc_msgSend(v38, "unsignedIntegerValue") > 1;

      v40 = v39;
      v29 = v66;
    }
    v10 = v69;

    if (v67 >= 4)
    {

    }
    if (v40)
      goto LABEL_28;
    objc_msgSend(v8, "childLayers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");
    objc_msgSend(v9, "childLayers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    if (v42 != v44)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v69;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v21 = 0;
LABEL_12:
        v22 = self;
        goto LABEL_13;
      }
LABEL_42:
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.5(a2);
      goto LABEL_11;
    }
    objc_msgSend(v8, "childLayers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (v46)
    {
      v47 = 0;
      while (1)
      {
        objc_msgSend(v8, "childLayers");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "childLayers");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectAtIndexedSubscript:", v47);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49 != v51)
          break;
        ++v47;
        objc_msgSend(v8, "childLayers");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "count");

        if (v47 >= v53)
          goto LABEL_35;
      }
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v69;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      goto LABEL_42;
    }
  }
LABEL_35:
  v73.receiver = self;
  v73.super_class = (Class)MLCFullyConnectedLayer;
  v54 = -[MLCLayer initWithLabel:](&v73, sel_initWithLabel_, CFSTR("FullyConnected"));
  v55 = v54;
  if (v54)
  {
    v54->_accumulatorPrecisionOption = 0;
    objc_storeStrong((id *)&v54->_weights, a3);
    objc_storeStrong((id *)&v55->_descriptor, a5);
    objc_storeStrong((id *)&v55->_biases, a4);
    +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v8);
    v56 = objc_claimAutoreleasedReturnValue();
    weightsParameter = v55->_weightsParameter;
    v55->_weightsParameter = (MLCTensorParameter *)v56;

    -[MLCTensor setIsLayerParameter:](v55->_weights, "setIsLayerParameter:", 1);
    if (v9)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v9);
      v58 = objc_claimAutoreleasedReturnValue();
      biasesParameter = v55->_biasesParameter;
      v55->_biasesParameter = (MLCTensorParameter *)v58;

      -[MLCTensor setIsLayerParameter:](v55->_biases, "setIsLayerParameter:", 1);
    }
    else
    {
      v60 = v55->_biasesParameter;
      v55->_biasesParameter = 0;

    }
    v72.receiver = v55;
    v72.super_class = (Class)MLCFullyConnectedLayer;
    -[MLCLayer setIsUpdatable:](&v72, sel_setIsUpdatable_, 1);
  }
  v22 = v55;
  v21 = v22;
  v10 = v69;
LABEL_13:

  return v21;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char isKindOfClass;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  id v86;
  objc_super v87;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MLCFullyConnectedLayer weights](self, "weights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parentLayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
    goto LABEL_7;
  }
  -[MLCFullyConnectedLayer biases](self, "biases");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parentLayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
    goto LABEL_7;
  }
  v85 = a2;
  v86 = v10;
  -[MLCFullyConnectedLayer biases](self, "biases");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "childLayers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    -[MLCFullyConnectedLayer weights](self, "weights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "childLayers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    -[MLCFullyConnectedLayer biases](self, "biases");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "childLayers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v26 != v29)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v86;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_7:
        v19 = 0;
        goto LABEL_8;
      }
LABEL_20:
      -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v85);
      goto LABEL_7;
    }
    -[MLCFullyConnectedLayer weights](self, "weights");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "childLayers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v33 = 0;
      while (1)
      {
        -[MLCFullyConnectedLayer weights](self, "weights");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "childLayers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer biases](self, "biases");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "childLayers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", v33);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36 != v39)
          break;
        ++v33;
        -[MLCFullyConnectedLayer weights](self, "weights");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "childLayers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        if (v33 >= v42)
          goto LABEL_15;
      }
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v86;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      goto LABEL_20;
    }
  }
LABEL_15:
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    -[MLCLayer fusedLayers](self, "fusedLayers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[MLCLayer fusedLayers](self, "fusedLayers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {

      -[MLCLayer fusedLayers](self, "fusedLayers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "count");

      if (v51 < 2)
      {
        v83 = 0;
      }
      else
      {
        -[MLCLayer fusedLayers](self, "fusedLayers");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "descriptor");
        v83 = objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v9, "computeEngine");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCFullyConnectedLayer descriptor](self, "descriptor");
      v84 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "mean");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "variance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "beta");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "gamma");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "varianceEpsilon");
      v63 = v62;
      objc_msgSend(v49, "momentum");
      v65 = v64;
      -[MLCFullyConnectedLayer weights](self, "weights");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCFullyConnectedLayer biases](self, "biases");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v81;
      LODWORD(v67) = v63;
      LODWORD(v68) = v65;
      v54 = (void *)v83;
      objc_msgSend(v81, "fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:mean:variance:beta:gamma:varianceEpsilon:momentum:neuronDescriptor:weights:biasTerms:", v84, v82, v80, v60, v61, v83, v67, v68, v79, v66);
      v15 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v84;
    }
    else
    {
      objc_opt_class();
      v57 = objc_opt_isKindOfClass();

      -[MLCLayer fusedLayers](self, "fusedLayers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "computeEngine");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v57 & 1) != 0)
      {
        -[MLCFullyConnectedLayer descriptor](self, "descriptor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer weights](self, "weights");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer biases](self, "biases");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "fusedFullyConnectedAndSoftmaxLayerWithDescriptor:weights:biasTerms:softmaxOp:", v55, v56, v59, objc_msgSend(v49, "operation"));
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v49, "descriptor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer descriptor](self, "descriptor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer weights](self, "weights");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCFullyConnectedLayer biases](self, "biases");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "fusedFullyConnectedAndNeuronLayerWithDescriptor:convolutionDescriptor:weights:biasTerms:", v55, v56, v59, v69);
        v15 = objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    objc_msgSend(v9, "computeEngine");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCFullyConnectedLayer descriptor](self, "descriptor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCFullyConnectedLayer weights](self, "weights");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCFullyConnectedLayer biases](self, "biases");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fullyConnectedLayerWithDescriptor:weights:biasTerms:", v54, v55, v56);
    v15 = objc_claimAutoreleasedReturnValue();
  }

  if (!v15 || !-[NSObject count](v15, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    v10 = v86;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(v85);

    goto LABEL_7;
  }
  objc_msgSend(v9, "computeEngine");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v86;
  v19 = objc_msgSend(v70, "compileLayerDeviceOps:sourceTensors:resultTensor:", v15, v86, v11);

  v87.receiver = self;
  v87.super_class = (Class)MLCFullyConnectedLayer;
  -[MLCLayer bindDevice:deviceOps:](&v87, sel_bindDevice_deviceOps_, v9, v15);
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "count");

  if (v72)
  {
    v73 = 0;
    do
    {
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "bindDevice:deviceOps:", v9, v15);

      ++v73;
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count");

    }
    while (v73 < v77);
  }
LABEL_8:

  return v19;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4;
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

  v4 = a3;
  -[MLCFullyConnectedLayer weightsParameter](self, "weightsParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allocateDataForOptimizer:device:isVector:", v4, v6, 1);

  -[MLCFullyConnectedLayer biases](self, "biases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MLCFullyConnectedLayer biasesParameter](self, "biasesParameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allocateDataForOptimizer:device:isVector:", v4, v9, 1);

  }
  -[MLCLayer device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computeEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCFullyConnectedLayer weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCFullyConnectedLayer biases](self, "biases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConvolutionLayerOptimizerDataForDeviceOps:weights:bias:", v12, v13, v14);

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  v6 = a4;
  -[MLCFullyConnectedLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");
  -[MLCFullyConnectedLayer biases](self, "biases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tensorAllocationSizeInBytes") + v9;

  if (v4)
    v12 *= objc_msgSend(v6, "numOptimizerDataBuffers") + 2;

  return v12;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  MLCFullyConnectedLayer *v36;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != 4)
    goto LABEL_6;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "unsignedIntegerValue") != 1)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shape");
  v36 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v35 = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v20, "unsignedIntegerValue");

  self = v36;
  if (v34 != 1)
  {
LABEL_6:
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[MLCFullyConnectedLayer descriptor](self, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v22, "outputFeatureChannelCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12 - 1;
    v24 = v8;
    v25 = v23;
    goto LABEL_7;
  }
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCFullyConnectedLayer descriptor](v36, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "outputFeatureChannelCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  v25 = v23;
  v26 = 1;
LABEL_7:
  objc_msgSend(v24, "setObject:atIndexedSubscript:", v25, v26);

  v28 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "descriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v28, objc_msgSend(v30, "dataType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCFullyConnectedLayer accumulatorPrecisionOption](self, "accumulatorPrecisionOption");
  -[MLCFullyConnectedLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCFullyConnectedLayer biases](self, "biases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCFullyConnectedLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { accumulatorPrecisionOption=%d : weights=%@ : biasTerms=%@ : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCFullyConnectedLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inputFeatureChannelCount");
  -[MLCFullyConnectedLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Input Feature Channel Count: %lu<BR />Output Feature Channel Count: %lu<BR /></FONT>>"), v5, v6, v8, objc_msgSend(v9, "outputFeatureChannelCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MLCFullyConnectedLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCFullyConnectedLayer biases](self, "biases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCFullyConnectedLayer biases](self, "biases");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", self);

  }
}

- (void)unlinkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MLCFullyConnectedLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCFullyConnectedLayer biases](self, "biases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCFullyConnectedLayer biases](self, "biases");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", self);

  }
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      v9 = v8 > 1;
      if (v8 <= 1)
        break;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (unint64_t)parametersCount
{
  void *v2;

  -[MLCFullyConnectedLayer biasesParameter](self, "biasesParameter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 2;
  else
    return 1;
}

- (MLCConvolutionDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)biases
{
  return self->_biases;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (MLCTensorParameter)biasesParameter
{
  return self->_biasesParameter;
}

- (int)accumulatorPrecisionOption
{
  return self->_accumulatorPrecisionOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameter, 0);
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weights batch size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: missing weights", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: biasTerms batch size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: biasTerms width or height size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.5(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weights and bias terms must be shared with the same convolution layers", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.7(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: number of channels in biasTerms does not match output feature channels", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weights and bias tensors must be associated with the same layers", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "biases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: biasTerms tensor used by FullyConnected cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: weights tensor used by FullyConnected cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

@end

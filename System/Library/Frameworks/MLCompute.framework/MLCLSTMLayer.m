@implementation MLCLSTMLayer

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights biases:(NSArray *)biases
{
  return (MLCLSTMLayer *)objc_msgSend(a1, "layerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:", descriptor, inputWeights, hiddenWeights, 0, biases);
}

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases
{
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  MLCLSTMDescriptor *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v12 = biases;
  v13 = peepholeWeights;
  v14 = hiddenWeights;
  v15 = inputWeights;
  v16 = descriptor;
  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = v17;
  v22[2] = v18;
  v22[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v16, v15, v14, v13, v12, v19, v18);

  return (MLCLSTMLayer *)v20;
}

+ (MLCLSTMLayer)layerWithDescriptor:(MLCLSTMDescriptor *)descriptor inputWeights:(NSArray *)inputWeights hiddenWeights:(NSArray *)hiddenWeights peepholeWeights:(NSArray *)peepholeWeights biases:(NSArray *)biases gateActivations:(NSArray *)gateActivations outputResultActivation:(MLCActivationDescriptor *)outputResultActivation
{
  MLCActivationDescriptor *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  MLCLSTMDescriptor *v22;
  void *v23;

  v16 = outputResultActivation;
  v17 = gateActivations;
  v18 = biases;
  v19 = peepholeWeights;
  v20 = hiddenWeights;
  v21 = inputWeights;
  v22 = descriptor;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v22, v21, v20, v19, v18, v17, v16);

  return (MLCLSTMLayer *)v23;
}

- (MLCLSTMLayer)initWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biases:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  MLCLSTMLayer *v29;
  NSObject *v30;
  void *v31;
  MLCLSTMLayer *v32;
  NSObject *v34;
  MLCLSTMLayer *v35;
  MLCLSTMLayer *v36;
  id *p_inputWeights;
  MLCLSTMLayer *v38;
  id *p_hiddenWeights;
  NSArray *peepholeWeights;
  NSArray *peepholeWeightsParameters;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *biasesParameters;
  uint64_t v59;
  NSArray *inputWeightsParameters;
  uint64_t v61;
  NSArray *hiddenWeightsParameters;
  id *p_biases;
  id v64;
  id obj;
  MLCLSTMLayer *obja;
  void *v68;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  objc_super v75;
  objc_super v76;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v73 = a6;
  v74 = a7;
  obj = a8;
  v72 = a8;
  v71 = a9;
  v18 = objc_msgSend(v15, "layerCount");
  v19 = v15;
  v20 = 4 * (v18 << objc_msgSend(v15, "isBidirectional"));
  v21 = v16;
  if (objc_msgSend(v16, "count") != v20)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.8();

    v29 = 0;
    v24 = v16;
    v25 = v19;
    v22 = v17;
    goto LABEL_16;
  }
  v22 = v17;
  if (objc_msgSend(v17, "count") != v20)
  {
    +[MLCLog framework](MLCLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.7();

    v29 = 0;
    v24 = v21;
    v25 = v19;
LABEL_16:
    v23 = v73;
LABEL_17:
    v27 = v72;
LABEL_18:
    v32 = self;
    v31 = v71;
    goto LABEL_19;
  }
  v23 = v73;
  if (v73 && objc_msgSend(v73, "count") != v20)
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    v24 = v21;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.6();
    goto LABEL_31;
  }
  v24 = v21;
  if (!v74)
  {
    v25 = v19;
    if ((objc_msgSend(v19, "usesBiases") & 1) != 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v72;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.1(a2);
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v74, "count") != v20)
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.5();
LABEL_31:

    v29 = 0;
    v25 = v19;
    goto LABEL_17;
  }
  v25 = v19;
  if ((objc_msgSend(v19, "usesBiases") & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v72;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.4(a2);
LABEL_34:

    v29 = 0;
    goto LABEL_18;
  }
LABEL_25:
  v27 = v72;
  if (objc_msgSend(v72, "count") != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.3(a2);
    goto LABEL_34;
  }
  if (v73)
  {
    +[MLCLog framework](MLCLog, "framework");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:].cold.2(a2);
    goto LABEL_34;
  }
  v76.receiver = self;
  v76.super_class = (Class)MLCLSTMLayer;
  v35 = -[MLCLayer initWithLabel:](&v76, sel_initWithLabel_, CFSTR("LSTM"));
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_descriptor, a3);
    v70 = v22;
    p_inputWeights = (id *)&v36->_inputWeights;
    objc_storeStrong((id *)&v36->_inputWeights, a4);
    v38 = v36;
    p_hiddenWeights = (id *)&v36->_hiddenWeights;
    objc_storeStrong(p_hiddenWeights, a5);
    peepholeWeights = v38->_peepholeWeights;
    v38->_peepholeWeights = 0;

    p_biases = (id *)&v38->_biases;
    objc_storeStrong((id *)&v38->_biases, a7);
    objc_storeStrong((id *)&v38->_gateActivations, obj);
    objc_storeStrong((id *)&v38->_outputResultActivation, a9);
    peepholeWeightsParameters = v38->_peepholeWeightsParameters;
    v42 = (void *)MEMORY[0x1E0C9AA60];
    obja = v38;
    v38->_peepholeWeightsParameters = (NSArray *)MEMORY[0x1E0C9AA60];

    v43 = (void *)objc_msgSend(v42, "mutableCopy");
    v44 = (void *)objc_msgSend(v42, "mutableCopy");
    v64 = (id)objc_msgSend(v42, "mutableCopy");
    if (objc_msgSend(v24, "count"))
    {
      v45 = 0;
      do
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:atIndexedSubscript:", v47, v45);

        objc_msgSend(v70, "objectAtIndexedSubscript:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:atIndexedSubscript:", v49, v45);

        objc_msgSend(*p_inputWeights, "objectAtIndexedSubscript:", v45);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setIsLayerParameter:", 1);

        objc_msgSend(*p_hiddenWeights, "objectAtIndexedSubscript:", v45);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setIsLayerParameter:", 1);

        ++v45;
      }
      while (v45 < objc_msgSend(v24, "count"));
    }
    v68 = v43;
    if (v74)
    {
      v52 = v64;
      if (objc_msgSend(v74, "count"))
      {
        v53 = 0;
        do
        {
          objc_msgSend(v74, "objectAtIndexedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:atIndexedSubscript:", v55, v53);

          objc_msgSend(*p_biases, "objectAtIndexedSubscript:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setIsLayerParameter:", 1);

          ++v53;
        }
        while (v53 < objc_msgSend(v74, "count"));
      }
      v57 = objc_msgSend(v64, "copy");
      v36 = obja;
      biasesParameters = obja->_biasesParameters;
      obja->_biasesParameters = (NSArray *)v57;
    }
    else
    {
      v52 = v64;
      v36 = obja;
      biasesParameters = obja->_biasesParameters;
      obja->_biasesParameters = 0;
    }
    v22 = v70;
    v27 = v72;

    v59 = objc_msgSend(v68, "copy");
    inputWeightsParameters = v36->_inputWeightsParameters;
    v36->_inputWeightsParameters = (NSArray *)v59;

    v61 = objc_msgSend(v44, "copy");
    hiddenWeightsParameters = v36->_hiddenWeightsParameters;
    v36->_hiddenWeightsParameters = (NSArray *)v61;

    v75.receiver = v36;
    v75.super_class = (Class)MLCLSTMLayer;
    -[MLCLayer setIsUpdatable:](&v75, sel_setIsUpdatable_, 1);

    v23 = v73;
  }
  v32 = v36;
  v29 = v32;
  v31 = v71;
LABEL_19:

  return v29;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v34 = a5;
  v11 = objc_msgSend(v10, "count");
  if (!v11)
  {
LABEL_10:
    objc_msgSend(v9, "computeEngine");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer inputWeights](self, "inputWeights");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer biases](self, "biases");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer gateActivations](self, "gateActivations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer outputResultActivation](self, "outputResultActivation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = -[MLCLayer compileForInferenceOnly](self, "compileForInferenceOnly");
    objc_msgSend(v33, "lstmLayerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biasTerms:gateActivations:outputResultActivation:inferenceOnly:", v18, v19, v20, v32, v21, v22, v23, v31);
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24 && -[NSObject count](v24, "count"))
    {
      objc_msgSend(v9, "computeEngine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v34;
      v27 = objc_msgSend(v25, "compileLayerDeviceOps:sourceTensors:resultTensor:", v24, v10, v34);

      v35.receiver = self;
      v35.super_class = (Class)MLCLSTMLayer;
      -[MLCLayer bindDevice:deviceOps:](&v35, sel_bindDevice_deviceOps_, v9, v24);
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v28 = objc_claimAutoreleasedReturnValue();
      v26 = v34;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1();

      v27 = 0;
    }
    goto LABEL_19;
  }
  v12 = v11;
  if (v11 == 2)
  {
    v12 = 1;
  }
  else
  {
    if (v11 != 4)
      goto LABEL_7;
    v12 = 3;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputeFlags:", objc_msgSend(v13, "computeFlags") | 8);

LABEL_7:
  v14 = 0;
  while (1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "dataType");

    if (!+[MLCLayer supportsDataType:onDevice:](MLCLSTMLayer, "supportsDataType:onDevice:", v17, v9))
      break;
    if (v12 == ++v14)
      goto LABEL_10;
  }
  +[MLCLog framework](MLCLog, "framework");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v30;
    v38 = 2048;
    v39 = v14;
    v40 = 1024;
    v41 = v17;
    v42 = 2112;
    v43 = v9;
    _os_log_error_impl(&dword_1D4999000, v24, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);

  }
  v27 = 0;
  v26 = v34;
LABEL_19:

  return v27;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  -[MLCLSTMLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "batchFirst");

  if ((v8 & 1) == 0)
  {
    if (a4 != 2)
      return a3;
LABEL_5:
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hiddenSize");
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = v10 << objc_msgSend(v11, "isBidirectional");

    return a3;
  }
  if (a4 == 1)
    goto LABEL_5;
  v13.receiver = self;
  v13.super_class = (Class)MLCLSTMLayer;
  return -[MLCLayer resultSizeFromSourceSize:dimension:](&v13, sel_resultSizeFromSourceSize_dimension_, a3, a4);
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  _QWORD v103[3];
  _QWORD v104[4];

  v104[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 3)
  {
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "returnsSequences");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    v16 = 1;
    v17 = -[MLCLSTMLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v15, 1);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v10)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shape");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v26, "unsignedIntegerValue");

    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "variableLengthSequences");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if ((v29 & 1) != 0)
    {
      v103[0] = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v103[1] = v100;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v103[2] = v98;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "descriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sequenceLengths");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "descriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "sortedSequences");
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v95 = v31;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "descriptor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v32;
      +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v32, v34, v37, objc_msgSend(v39, "dataType"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v104[0] = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v89;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v104[2] = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "descriptor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v91, objc_msgSend(v93, "dataType"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v41);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "shape");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    v46 = 0;
    if (v45 == 4)
    {
      -[MLCLSTMLayer descriptor](self, "descriptor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "returnsSequences");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "descriptor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "shape");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 1;
      objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "unsignedIntegerValue");

      v55 = -[MLCLSTMLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v54, 1);
      if (v48)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "descriptor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "shape");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", 3);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v59, "unsignedIntegerValue");

      }
      v60 = -[MLCLSTMLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v52, 3);
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "descriptor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "shape");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "unsignedIntegerValue");

      v66 = -[MLCLSTMLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v65, 2);
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "descriptor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "shape");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "unsignedIntegerValue");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "descriptor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v69) = objc_msgSend(v73, "variableLengthSequences");

      if ((_DWORD)v69)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "descriptor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "sequenceLengths");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102[0] = v101;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v55);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v102[1] = v99;
        v102[2] = &unk_1E98446C8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v78);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v102[3] = v97;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "descriptor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "sequenceLengths");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "descriptor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "sortedSequences");
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "descriptor");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v79, v82, v85, objc_msgSend(v87, "dataType"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v88);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[MLCTensor tensorWithWidth:height:featureChannelCount:batchSize:](MLCTensor, "tensorWithWidth:height:featureChannelCount:batchSize:", v60, v66, v55, v71);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v46;
}

- (id)resultStateTensorWithSources:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v27;
  void *v28;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layerCount");

  -[MLCLSTMLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBidirectional"))
    v8 = 2;
  else
    v8 = 1;

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  -[MLCLSTMLayer descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v14, "hiddenSize");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithShape:](MLCTensor, "tensorWithShape:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithShape:](MLCTensor, "tensorWithShape:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v20;
  v31[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");

  return v28;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
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
  void *v33;
  NSObject *v34;

  v5 = a3;
  -[MLCLSTMLayer inputWeights](self, "inputWeights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[MLCLSTMLayer inputWeights](self, "inputWeights");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        -[MLCLSTMLayer inputWeightsParameters](self, "inputWeightsParameters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer device](self, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allocateDataForOptimizer:device:isVector:", v5, v13, 0);

        -[MLCLSTMLayer hiddenWeightsParameters](self, "hiddenWeightsParameters");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer device](self, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allocateDataForOptimizer:device:isVector:", v5, v16, 0);

        ++v10;
        -[MLCLSTMLayer inputWeights](self, "inputWeights");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

      }
      while (v10 < v18);
    }
    -[MLCLSTMLayer biases](self, "biases");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[MLCLSTMLayer biases](self, "biases");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        v22 = 0;
        do
        {
          -[MLCLSTMLayer biasesParameters](self, "biasesParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCLayer device](self, "device");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allocateDataForOptimizer:device:isVector:", v5, v25, 0);

          ++v22;
          -[MLCLSTMLayer biases](self, "biases");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

        }
        while (v22 < v27);
      }
    }
    -[MLCLayer device](self, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "computeEngine");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer deviceOps](self, "deviceOps");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer inputWeights](self, "inputWeights");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLSTMLayer biases](self, "biases");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLSTMLayerOptimizerDataForDeviceOps:inputWeights:hiddenWeights:biasTerms:", v30, v31, v32, v33);

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer allocateDataForOptimizer:].cold.1(a2);

  }
  return v7 != 0;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
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
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;
  objc_super v47;
  objc_super v48;

  v4 = a3;
  -[MLCLSTMLayer inputWeights](self, "inputWeights", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      -[MLCLSTMLayer inputWeights](self, "inputWeights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v12, "tensorAllocationSizeInBytes");

      ++v8;
      -[MLCLSTMLayer inputWeights](self, "inputWeights");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v8 < v14);
  }
  else
  {
    v9 = 0;
  }
  -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v20, "tensorAllocationSizeInBytes");

      ++v17;
      -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v17 < v22);
  }
  -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = 0;
      do
      {
        -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "descriptor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v29, "tensorAllocationSizeInBytes");

        ++v26;
        -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

      }
      while (v26 < v31);
    }
  }
  -[MLCLSTMLayer biases](self, "biases");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[MLCLSTMLayer biases](self, "biases");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = 0;
      do
      {
        -[MLCLSTMLayer biases](self, "biases");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "descriptor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v38, "tensorAllocationSizeInBytes");

        ++v35;
        -[MLCLSTMLayer biases](self, "biases");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

      }
      while (v35 < v40);
    }
  }
  v48.receiver = self;
  v48.super_class = (Class)MLCLSTMLayer;
  -[MLCLayer device](&v48, sel_device);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v47.receiver = self;
    v47.super_class = (Class)MLCLSTMLayer;
    -[MLCLayer device](&v47, sel_device);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "computeEngine");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46.receiver = self;
    v46.super_class = (Class)MLCLSTMLayer;
    -[MLCLayer deviceOps](&v46, sel_deviceOps);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v9 += objc_msgSend(v43, "allocatedDeviceDataSizeForTraining:layer:", v4, v44);

  }
  return v9;
}

- (void)allocateGradientsForParameters
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MLCLSTMLayer inputWeights](self, "inputWeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "mutableCopy");

  -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v4);

  -[MLCLSTMLayer descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesBiases");

  if (v6)
  {
    -[MLCLSTMLayer biases](self, "biases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v7);

  }
  -[MLCLayer device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allocateParameterGradientsForDeviceOps:parameters:", v10, v11);

}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
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
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  NSObject *v55;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;

  v5 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v5;
  if (objc_msgSend(v8, "count") == 3)
  {

  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v5 = v68;
    if (v12 != 4)
    {
LABEL_37:
      v52 = 0;
      goto LABEL_39;
    }
  }
  v57 = a2;
  if (objc_msgSend(v5, "count") == 3 || objc_msgSend(v5, "count") == 4)
  {
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    if (objc_msgSend(v13, "isBidirectional"))
      v15 = 2;
    else
      v15 = 1;
    v73 = v15;

    -[MLCLSTMLayer descriptor](self, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v16, "layerCount");

    -[MLCLSTMLayer descriptor](self, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "batchFirst");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v18 ^ 1u);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v22, "unsignedIntegerValue");

    v5 = v68;
    -[MLCLSTMLayer descriptor](self, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v23, "hiddenSize");

    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "descriptor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shape");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count") == 4)
        goto LABEL_16;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shape");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "unsignedIntegerValue") != v73)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "descriptor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "shape");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "unsignedIntegerValue") == v67)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "descriptor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "shape");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndexedSubscript:", 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v63, "unsignedIntegerValue") == v62)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "descriptor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "shape");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "unsignedIntegerValue") == v58;

          v5 = v68;
        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

      if (v32)
        goto LABEL_37;
LABEL_21:
      if (++v14 == 3)
        goto LABEL_22;
    }

LABEL_16:
    goto LABEL_21;
  }
LABEL_22:
  if (objc_msgSend(v5, "count") != 2 && objc_msgSend(v5, "count") != 4)
  {
    v52 = 1;
    goto LABEL_39;
  }
  if (objc_msgSend(v5, "count") == 2)
    v33 = 1;
  else
    v33 = 3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSkipWritingToDevice:", 1);
  objc_msgSend(v34, "descriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "dataType");

  if (v36 != 7)
  {
    +[MLCLog framework](MLCLog, "framework");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[MLCLSTMLayer isSupportedShapeForTensorSources:].cold.1(v57);

    goto LABEL_37;
  }
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v34, "descriptor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "tensorAllocationSizeInBytes");
  objc_msgSend(v34, "descriptor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", objc_msgSend(v40, "dataType"));

  objc_msgSend(v34, "data");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v43 = objc_msgSend(v42, "bytes");

  if (v41 <= v39)
  {
    v44 = 0;
    if (v39 / v41 <= 1)
      v45 = 1;
    else
      v45 = v39 / v41;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v43 + 4 * v44));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:atIndexedSubscript:", v46, v44);

      ++v44;
    }
    while (v45 != v44);
  }
  objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "descriptor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "descriptor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 1;
  +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v49, v37, 1, objc_msgSend(v51, "dataType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setDescriptor:", v53);

LABEL_39:
  return v52;
}

- (void)linkAssociatedTensors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[MLCLSTMLayer inputWeights](self, "inputWeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v7), "childLayers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v5);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13), "childLayers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", self);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v19), "childLayers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", self);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MLCLSTMLayer biases](self, "biases", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "childLayers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", self);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v23);
  }

}

- (void)unlinkAssociatedTensors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[MLCLSTMLayer inputWeights](self, "inputWeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v7), "childLayers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v5);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[MLCLSTMLayer hiddenWeights](self, "hiddenWeights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13), "childLayers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObject:", self);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MLCLSTMLayer peepholeWeights](self, "peepholeWeights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v19), "childLayers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObject:", self);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MLCLSTMLayer biases](self, "biases", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "childLayers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObject:", self);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v23);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { lstmDescriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MLCLayer layerID](self, "layerID");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v27, "inputSize");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v26, "hiddenSize");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "layerCount");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "usesBiases");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "batchFirst");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBidirectional");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "returnsSequences");
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dropout");
  v13 = v12;
  -[MLCLSTMLayer descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MLCLSTMResultModeDebugDescription((MLCLSTMResultMode)objc_msgSend(v14, "resultMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Input Size: %lu     Hidden Size: %lu     Layer Count: %lu<BR />Uses Biases: %hhd    Batch First: %hhd    Bidirectional: %hhd<BR />Returns Sequences: %hhd                   Dropout: %.03f<BR />Result Mode: %@</FONT>>"), v23, v22, v21, v20, v19, v18, v6, v8, v10, *(_QWORD *)&v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)parametersCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[MLCLSTMLayer inputWeightsParameters](self, "inputWeightsParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[MLCLSTMLayer hiddenWeightsParameters](self, "hiddenWeightsParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  -[MLCLSTMLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "usesBiases");

  if ((_DWORD)v5)
    return v6 + 4;
  else
    return v6;
}

- (MLCLSTMDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSArray)gateActivations
{
  return self->_gateActivations;
}

- (MLCActivationDescriptor)outputResultActivation
{
  return self->_outputResultActivation;
}

- (NSArray)inputWeights
{
  return self->_inputWeights;
}

- (NSArray)hiddenWeights
{
  return self->_hiddenWeights;
}

- (NSArray)peepholeWeights
{
  return self->_peepholeWeights;
}

- (NSArray)biases
{
  return self->_biases;
}

- (NSArray)inputWeightsParameters
{
  return self->_inputWeightsParameters;
}

- (NSArray)hiddenWeightsParameters
{
  return self->_hiddenWeightsParameters;
}

- (NSArray)peepholeWeightsParameters
{
  return self->_peepholeWeightsParameters;
}

- (NSArray)biasesParameters
{
  return self->_biasesParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameters, 0);
  objc_storeStrong((id *)&self->_peepholeWeightsParameters, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsParameters, 0);
  objc_storeStrong((id *)&self->_inputWeightsParameters, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_peepholeWeights, 0);
  objc_storeStrong((id *)&self->_hiddenWeights, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_outputResultActivation, 0);
  objc_storeStrong((id *)&self->_gateActivations, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: LSTM descriptor bias is enabled but bias terms are nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: peephole weights are not supported for LSTM", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: gate activations array size must be %lu", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: LSTM descriptor bias is disabled but bias terms are not nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.5()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: bias terms array size must be %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.6()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: peephole weights array size must be %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.7()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: hidden weights array size must be %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)initWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:.cold.8()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: input weights array size must be %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)allocateDataForOptimizer:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: inputWeights are empty for LSTM", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)isSupportedShapeForTensorSources:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@the sequence length tensor must be of type MLCDataTypeInt32", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

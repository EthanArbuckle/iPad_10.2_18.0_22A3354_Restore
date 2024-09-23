@implementation MLCBatchNormalizationLayer

+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  return (MLCBatchNormalizationLayer *)objc_msgSend(a1, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", featureChannelCount, mean, variance, beta, gamma);
}

+ (MLCBatchNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
{
  MLCTensor *v16;
  MLCTensor *v17;
  MLCTensor *v18;
  MLCTensor *v19;
  id v20;
  double v21;
  double v22;
  void *v23;

  v16 = gamma;
  v17 = beta;
  v18 = variance;
  v19 = mean;
  v20 = objc_alloc((Class)a1);
  *(float *)&v21 = varianceEpsilon;
  *(float *)&v22 = momentum;
  v23 = (void *)objc_msgSend(v20, "initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", featureChannelCount, v19, v18, v17, v16, v21, v22);

  return (MLCBatchNormalizationLayer *)v23;
}

- (MLCBatchNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  MLCBatchNormalizationLayer *v26;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  BOOL v32;
  void *v33;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  _BOOL4 v63;
  BOOL v64;
  MLCBatchNormalizationLayer *v65;
  MLCBatchNormalizationLayer *v66;
  uint64_t v67;
  MLCTensorParameter *betaParameter;
  MLCTensorParameter *v69;
  uint64_t v70;
  MLCTensorParameter *gammaParameter;
  MLCTensorParameter *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id obj;
  MLCBatchNormalizationLayer *v83;
  objc_super v84;
  objc_super v85;

  v15 = a4;
  obj = a5;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v15, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v21, "unsignedIntegerValue") > 1)
    goto LABEL_4;
  v73 = a6;
  v74 = a7;
  v83 = self;
  objc_msgSend(v15, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v24, "unsignedIntegerValue") > 1)
  {

    self = v83;
LABEL_4:

    goto LABEL_5;
  }
  objc_msgSend(v15, "descriptor");
  v77 = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shape");
  v76 = v16;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 2);
  v75 = v17;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v18;
  v31 = objc_msgSend(v30, "unsignedIntegerValue");

  v17 = v75;
  v16 = v76;

  v15 = v77;
  v32 = v31 > 1;
  v18 = v78;
  self = v83;
  if (v32)
  {
LABEL_5:
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.1(a2);
LABEL_7:

    v26 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v76, "descriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "shape");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v35, "unsignedIntegerValue") > 1)
    goto LABEL_13;
  objc_msgSend(v76, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "shape");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v38, "unsignedIntegerValue") > 1)
  {

    self = v83;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v76, "descriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "shape");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedIntegerValue");

  v16 = v76;
  v15 = v77;

  v18 = v78;
  v32 = v42 > 1;
  v17 = v75;
  self = v83;
  if (v32)
  {
LABEL_14:
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.2(a2);
    goto LABEL_7;
  }
  if (v75)
  {
    objc_msgSend(v75, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "shape");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v45, "unsignedIntegerValue") > 1)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v75, "descriptor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "shape");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v48, "unsignedIntegerValue") > 1)
    {

      self = v83;
      goto LABEL_21;
    }
    objc_msgSend(v75, "descriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "unsignedIntegerValue");

    v16 = v76;
    v15 = v77;

    v18 = v78;
    v32 = v52 > 1;
    v17 = v75;
    self = v83;
    if (v32)
    {
LABEL_22:
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.3(a2);
      goto LABEL_7;
    }
  }
  if (v18)
  {
    objc_msgSend(v18, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "shape");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v55, "unsignedIntegerValue") > 1)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v18, "descriptor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "shape");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", 3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v58, "unsignedIntegerValue") > 1)
    {

      self = v83;
      goto LABEL_29;
    }
    objc_msgSend(v18, "descriptor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "shape");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndexedSubscript:", 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "unsignedIntegerValue");

    v16 = v76;
    v15 = v77;

    v18 = v78;
    v32 = v62 > 1;
    v17 = v75;
    self = v83;
    if (v32)
    {
LABEL_30:
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.4(a2);
      goto LABEL_7;
    }
  }
  v63 = v17 != 0;
  if (v18)
  {
    v63 = 0;
    v64 = v17 == 0;
  }
  else
  {
    v64 = 0;
  }
  if (v64 || v63)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCBatchNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.5(a2);
    goto LABEL_7;
  }
  v85.receiver = self;
  v85.super_class = (Class)MLCBatchNormalizationLayer;
  v65 = -[MLCLayer initWithLabel:](&v85, sel_initWithLabel_, CFSTR("BatchNorm"));
  v66 = v65;
  if (v65)
  {
    v65->_featureChannelCount = a3;
    objc_storeStrong((id *)&v65->_mean, a4);
    objc_storeStrong((id *)&v66->_variance, obj);
    objc_storeStrong((id *)&v66->_beta, v73);
    objc_storeStrong((id *)&v66->_gamma, v74);
    v66->_varianceEpsilon = a8;
    v66->_momentum = a9;
    -[MLCTensor setIsLayerParameter:](v66->_mean, "setIsLayerParameter:", 1);
    -[MLCTensor setIsLayerParameter:](v66->_variance, "setIsLayerParameter:", 1);
    if (v17)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v17);
      v67 = objc_claimAutoreleasedReturnValue();
      betaParameter = v66->_betaParameter;
      v66->_betaParameter = (MLCTensorParameter *)v67;

      -[MLCTensor setIsLayerParameter:](v66->_beta, "setIsLayerParameter:", 1);
    }
    else
    {
      v69 = v66->_betaParameter;
      v66->_betaParameter = 0;

    }
    if (v78)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v78);
      v70 = objc_claimAutoreleasedReturnValue();
      gammaParameter = v66->_gammaParameter;
      v66->_gammaParameter = (MLCTensorParameter *)v70;

      -[MLCTensor setIsLayerParameter:](v66->_gamma, "setIsLayerParameter:", 1);
    }
    else
    {
      v72 = v66->_gammaParameter;
      v66->_gammaParameter = 0;

    }
    v18 = v78;
    v84.receiver = v66;
    v84.super_class = (Class)MLCBatchNormalizationLayer;
    -[MLCLayer setIsUpdatable:](&v84, sel_setIsUpdatable_, 1);
  }
  self = v66;
  v26 = self;
LABEL_8:

  return v26;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  int v44;
  int v45;
  double v46;
  NSUInteger v47;
  uint64_t v48;
  void *v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  double v57;
  NSUInteger v58;
  uint64_t v59;
  double v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  void *v68;
  void *v69;
  NSUInteger v70;
  objc_super v71;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MLCBatchNormalizationLayer mean](self, "mean");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentLayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = objc_msgSend(&unk_1E9844A20, "mutableCopy");
    if (objc_msgSend(v8, "type") == 3)
      -[NSObject addObject:](v14, "addObject:", &unk_1E9843F90);
    -[MLCBatchNormalizationLayer mean](self, "mean");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isTensorDataTypeInListOfDataTypes:", v14);

    if ((v17 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.8();
      goto LABEL_13;
    }
    -[MLCBatchNormalizationLayer variance](self, "variance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentLayers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      +[MLCLog framework](MLCLog, "framework");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.7();
    }
    else
    {
      -[MLCBatchNormalizationLayer variance](self, "variance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isTensorDataTypeInListOfDataTypes:", v14);

      if ((v24 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.6();
        goto LABEL_13;
      }
      -[MLCBatchNormalizationLayer beta](self, "beta");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_24;
      -[MLCBatchNormalizationLayer beta](self, "beta");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isTensorDataTypeInListOfDataTypes:", v14);

      if ((v27 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5();
        goto LABEL_13;
      }
      -[MLCBatchNormalizationLayer beta](self, "beta");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "parentLayers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        +[MLCLog framework](MLCLog, "framework");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
      }
      else
      {
LABEL_24:
        -[MLCBatchNormalizationLayer gamma](self, "gamma");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_31;
        -[MLCBatchNormalizationLayer gamma](self, "gamma");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isTensorDataTypeInListOfDataTypes:", v14);

        if ((v33 & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.3();
          goto LABEL_13;
        }
        -[MLCBatchNormalizationLayer gamma](self, "gamma");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "parentLayers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (v36)
        {
          +[MLCLog framework](MLCLog, "framework");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.2();
        }
        else
        {
LABEL_31:
          -[MLCLayer fusedLayers](self, "fusedLayers");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (v38)
          {
            -[MLCLayer fusedLayers](self, "fusedLayers");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "computeEngine");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "descriptor");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = -[MLCBatchNormalizationLayer featureChannelCount](self, "featureChannelCount");
            -[MLCBatchNormalizationLayer mean](self, "mean");
            v41 = objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer variance](self, "variance");
            v65 = objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer beta](self, "beta");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer gamma](self, "gamma");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
            v44 = v43;
            -[MLCBatchNormalizationLayer momentum](self, "momentum");
            LODWORD(v46) = v45;
            v47 = v67;
            v68 = (void *)v41;
            v48 = v41;
            v49 = (void *)v65;
            LODWORD(v50) = v44;
            objc_msgSend(v40, "fusedBatchNormalizationAndNeuronLayerWithDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", v69, v47, v48, v65, v63, v42, v50, v46);
            v21 = objc_claimAutoreleasedReturnValue();

            v51 = v64;
          }
          else
          {
            objc_msgSend(v8, "computeEngine");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = -[MLCBatchNormalizationLayer featureChannelCount](self, "featureChannelCount");
            -[MLCBatchNormalizationLayer mean](self, "mean");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer variance](self, "variance");
            v52 = objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer beta](self, "beta");
            v53 = objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer gamma](self, "gamma");
            v66 = objc_claimAutoreleasedReturnValue();
            -[MLCBatchNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
            v55 = v54;
            -[MLCBatchNormalizationLayer momentum](self, "momentum");
            LODWORD(v57) = v56;
            v58 = v70;
            v68 = (void *)v53;
            v69 = (void *)v52;
            v59 = v53;
            v49 = (void *)v66;
            LODWORD(v60) = v55;
            objc_msgSend(v51, "batchNormalizationLayerWithChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", v58, v40, v52, v59, v66, v60, v57);
            v21 = objc_claimAutoreleasedReturnValue();
          }

          if (v21 && -[NSObject count](v21, "count"))
          {
            objc_msgSend(v8, "computeEngine");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v61, "compileLayerDeviceOps:sourceTensors:resultTensor:", v21, v9, v10);

            v71.receiver = self;
            v71.super_class = (Class)MLCBatchNormalizationLayer;
            -[MLCLayer bindDevice:deviceOps:](&v71, sel_bindDevice_deviceOps_, v8, v21);
            goto LABEL_14;
          }
          +[MLCLog framework](MLCLog, "framework");
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1();

        }
      }
    }
LABEL_13:
    v15 = 0;
LABEL_14:

    goto LABEL_15;
  }
  +[MLCLog framework](MLCLog, "framework");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.9();
  v15 = 0;
LABEL_15:

  return v15;
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
  void *v15;

  v4 = a3;
  -[MLCBatchNormalizationLayer beta](self, "beta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCBatchNormalizationLayer betaParameter](self, "betaParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allocateDataForOptimizer:device:isVector:", v4, v7, 1);

  }
  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLCBatchNormalizationLayer gammaParameter](self, "gammaParameter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allocateDataForOptimizer:device:isVector:", v4, v10, 1);

  }
  -[MLCLayer device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "computeEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer beta](self, "beta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNormalizationLayerOptimizerDataForDeviceOps:beta:gamma:", v13, v14, v15);

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;

  v31 = a3;
  v27 = a4;
  -[MLCBatchNormalizationLayer mean](self, "mean");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "tensorAllocationSizeInBytes");
  -[MLCBatchNormalizationLayer variance](self, "variance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v8, "tensorAllocationSizeInBytes");
  -[MLCBatchNormalizationLayer beta](self, "beta");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v10, "tensorAllocationSizeInBytes");
  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "tensorAllocationSizeInBytes");

  -[MLCBatchNormalizationLayer mean](self, "mean");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "tensorAllocationSizeInBytes");
  -[MLCBatchNormalizationLayer variance](self, "variance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v29 + v30 + v28 + v13 + v16 + objc_msgSend(v18, "tensorAllocationSizeInBytes");

  if (v31)
  {
    -[MLCBatchNormalizationLayer gamma](self, "gamma");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "tensorAllocationSizeInBytes");
    -[MLCBatchNormalizationLayer beta](self, "beta");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "tensorAllocationSizeInBytes") + v22;
    v19 += v25 * objc_msgSend(v27, "numOptimizerDataBuffers");

  }
  return v19;
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
  float v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer mean](self, "mean");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer variance](self, "variance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer beta](self, "beta");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCBatchNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  v11 = v10;
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { mean=%@ : variance=%@ : beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, *(_QWORD *)&v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  float v8;
  double v9;
  float v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  v7 = -[MLCBatchNormalizationLayer featureChannelCount](self, "featureChannelCount");
  -[MLCBatchNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  v9 = v8;
  -[MLCBatchNormalizationLayer momentum](self, "momentum");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Variance Epsilon: %.03f<BR />Momentum: %.03f</FONT>>"), v5, v6, v7, *(_QWORD *)&v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MLCBatchNormalizationLayer mean](self, "mean");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCBatchNormalizationLayer variance](self, "variance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", self);

  -[MLCBatchNormalizationLayer beta](self, "beta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", self);

  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", self);

}

- (void)unlinkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MLCBatchNormalizationLayer mean](self, "mean");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCBatchNormalizationLayer variance](self, "variance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", self);

  -[MLCBatchNormalizationLayer beta](self, "beta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", self);

  -[MLCBatchNormalizationLayer gamma](self, "gamma");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", self);

}

- (BOOL)isValidTrainingParameters
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MLCBatchNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLCBatchNormalizationLayer gamma](self, "gamma");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  void *v3;
  void *v4;
  unint64_t v5;

  -[MLCBatchNormalizationLayer betaParameter](self, "betaParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCBatchNormalizationLayer gammaParameter](self, "gammaParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3 != 0;
}

- (NSUInteger)featureChannelCount
{
  return self->_featureChannelCount;
}

- (MLCTensor)mean
{
  return self->_mean;
}

- (MLCTensor)variance
{
  return self->_variance;
}

- (MLCTensor)beta
{
  return self->_beta;
}

- (MLCTensor)gamma
{
  return self->_gamma;
}

- (MLCTensorParameter)betaParameter
{
  return self->_betaParameter;
}

- (MLCTensorParameter)gammaParameter
{
  return self->_gammaParameter;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (float)momentum
{
  return self->_momentum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaParameter, 0);
  objc_storeStrong((id *)&self->_betaParameter, 0);
  objc_storeStrong((id *)&self->_gamma, 0);
  objc_storeStrong((id *)&self->_beta, 0);
  objc_storeStrong((id *)&self->_variance, 0);
  objc_storeStrong((id *)&self->_mean, 0);
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: mean tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: variance tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: beta tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: gamma tensor batch size, width or height cannot be > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 mean:variance:beta:gamma:varianceEpsilon:momentum:.cold.5(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Both gamma and beta must either be null or non-null", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.1()
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
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "gamma");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v3, v4, "%@: gamma tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_12();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "gamma");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "gamma");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: gamma tensor (%@) in BatchNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "beta");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v3, v4, "%@: beta tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.5()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_12();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "beta");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "beta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: beta tensor (%@) in BatchNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.6()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_12();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "variance");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "variance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: variance tensor (%@) in BatchNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.7()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "variance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v3, v4, "%@: variance tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.8()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_12();
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "mean");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "mean");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: mean tensor (%@) in BatchNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.9()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "mean");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v3, v4, "%@: mean tensor used by BatchNormalization cannot have a parent layer=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_1();
}

@end

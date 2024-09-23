@implementation MLCInstanceNormalizationLayer

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  MLCTensor *v10;
  MLCTensor *v11;
  id v12;
  double v13;
  double v14;
  void *v15;

  v10 = gamma;
  v11 = beta;
  v12 = objc_alloc((Class)a1);
  LODWORD(v13) = 1065185444;
  *(float *)&v14 = varianceEpsilon;
  v15 = (void *)objc_msgSend(v12, "initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", featureChannelCount, 0, 0, v11, v10, v14, v13);

  return (MLCInstanceNormalizationLayer *)v15;
}

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
{
  MLCTensor *v12;
  MLCTensor *v13;
  id v14;
  double v15;
  double v16;
  void *v17;

  v12 = gamma;
  v13 = beta;
  v14 = objc_alloc((Class)a1);
  *(float *)&v15 = varianceEpsilon;
  *(float *)&v16 = momentum;
  v17 = (void *)objc_msgSend(v14, "initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", featureChannelCount, 0, 0, v13, v12, v15, v16);

  return (MLCInstanceNormalizationLayer *)v17;
}

+ (MLCInstanceNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount mean:(MLCTensor *)mean variance:(MLCTensor *)variance beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon momentum:(float)momentum
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

  return (MLCInstanceNormalizationLayer *)v23;
}

- (MLCInstanceNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MLCInstanceNormalizationLayer *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MLCInstanceNormalizationLayer *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MLCInstanceNormalizationLayer *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  BOOL v55;
  MLCInstanceNormalizationLayer *v56;
  MLCInstanceNormalizationLayer *v57;
  uint64_t v58;
  MLCTensorParameter *betaParameter;
  NSObject *v60;
  MLCInstanceNormalizationLayer *v61;
  MLCTensorParameter *v63;
  uint64_t v64;
  MLCTensorParameter *gammaParameter;
  MLCTensorParameter *v66;
  MLCInstanceNormalizationLayer *v67;
  id obj;
  id v71;
  id v72;
  id v74;
  objc_super v75;
  objc_super v76;

  v15 = a4;
  obj = a5;
  v16 = a5;
  v71 = a6;
  v74 = a6;
  v72 = a7;
  v17 = a7;
  if (v15)
  {
    objc_msgSend(v15, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "unsignedIntegerValue") >= 2)
    {

    }
    else
    {
      objc_msgSend(v15, "descriptor");
      v67 = self;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shape");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v23 = v17;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      v16 = v24;
      v17 = v23;

      self = v67;
      if (v26 < 2)
        goto LABEL_4;
    }
    +[MLCLog framework](MLCLog, "framework");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.5(a2);
    goto LABEL_35;
  }
LABEL_4:
  if (!v16)
    goto LABEL_7;
  objc_msgSend(v16, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shape");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v29, "unsignedIntegerValue") >= 2)
  {

LABEL_25:
    +[MLCLog framework](MLCLog, "framework", v67);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.4(a2);
    goto LABEL_35;
  }
  objc_msgSend(v16, "descriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "shape");
  v31 = self;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
  v33 = v17;
  v34 = v16;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (MLCInstanceNormalizationLayer *)objc_msgSend(v35, "unsignedIntegerValue");

  v16 = v34;
  v17 = v33;

  self = v31;
  if ((unint64_t)v67 >= 2)
    goto LABEL_25;
LABEL_7:
  if (!v74)
    goto LABEL_10;
  objc_msgSend(v74, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "shape");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v38, "unsignedIntegerValue") >= 2)
  {

LABEL_28:
    +[MLCLog framework](MLCLog, "framework", v67);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.1(a2);
    goto LABEL_35;
  }
  objc_msgSend(v74, "descriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "shape");
  v40 = self;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
  v42 = v17;
  v43 = v16;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (MLCInstanceNormalizationLayer *)objc_msgSend(v44, "unsignedIntegerValue");

  v16 = v43;
  v17 = v42;

  self = v40;
  if ((unint64_t)v67 >= 2)
    goto LABEL_28;
LABEL_10:
  if (!v17)
    goto LABEL_13;
  objc_msgSend(v17, "descriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "shape");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectAtIndexedSubscript:", 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v47, "unsignedIntegerValue") >= 2)
  {

LABEL_31:
    +[MLCLog framework](MLCLog, "framework", v67);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.2(a2);
    goto LABEL_35;
  }
  objc_msgSend(v17, "descriptor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v49 = self;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectAtIndexedSubscript:", 2);
  v51 = v17;
  v52 = v16;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (MLCInstanceNormalizationLayer *)objc_msgSend(v53, "unsignedIntegerValue");

  v16 = v52;
  v17 = v51;

  self = v49;
  if ((unint64_t)v67 >= 2)
    goto LABEL_31;
LABEL_13:
  v54 = v74 != 0;
  if (v17)
  {
    v54 = 0;
    v55 = v74 == 0;
  }
  else
  {
    v55 = 0;
  }
  if (v55 || v54)
  {
    +[MLCLog framework](MLCLog, "framework", v67);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCInstanceNormalizationLayer initWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:].cold.3(a2);
LABEL_35:

    v61 = 0;
    goto LABEL_36;
  }
  v76.receiver = self;
  v76.super_class = (Class)MLCInstanceNormalizationLayer;
  v56 = -[MLCLayer initWithLabel:](&v76, sel_initWithLabel_, CFSTR("InstanceNorm"));
  v57 = v56;
  if (v56)
  {
    v56->_featureChannelCount = a3;
    objc_storeStrong((id *)&v56->_mean, a4);
    objc_storeStrong((id *)&v57->_variance, obj);
    objc_storeStrong((id *)&v57->_beta, v71);
    objc_storeStrong((id *)&v57->_gamma, v72);
    v57->_varianceEpsilon = a8;
    v57->_momentum = a9;
    if (v74)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v74);
      v58 = objc_claimAutoreleasedReturnValue();
      betaParameter = v57->_betaParameter;
      v57->_betaParameter = (MLCTensorParameter *)v58;

      -[MLCTensor setIsLayerParameter:](v57->_beta, "setIsLayerParameter:", 1);
    }
    else
    {
      v63 = v57->_betaParameter;
      v57->_betaParameter = 0;

    }
    if (v17)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v17);
      v64 = objc_claimAutoreleasedReturnValue();
      gammaParameter = v57->_gammaParameter;
      v57->_gammaParameter = (MLCTensorParameter *)v64;

      -[MLCTensor setIsLayerParameter:](v57->_gamma, "setIsLayerParameter:", 1);
    }
    else
    {
      v66 = v57->_gammaParameter;
      v57->_gammaParameter = 0;

    }
    v75.receiver = v57;
    v75.super_class = (Class)MLCInstanceNormalizationLayer;
    -[MLCLayer setIsUpdatable:](&v75, sel_setIsUpdatable_, 1, v67);
  }
  self = v57;
  v61 = self;
LABEL_36:

  return v61;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  double v36;
  void *v37;
  NSUInteger v38;
  void *v39;
  double v40;
  void *v41;
  char v42;
  NSUInteger v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  double v50;
  double v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v57;
  id v58;
  objc_super v59;

  v8 = a3;
  v58 = a4;
  v57 = a5;
  v9 = (void *)objc_msgSend(&unk_1E9844C48, "mutableCopy");
  if (objc_msgSend(v8, "type") == 3)
    objc_msgSend(v9, "addObject:", &unk_1E9844710);
  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MLCInstanceNormalizationLayer beta](self, "beta");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isTensorDataTypeInListOfDataTypes:", v9);

    if ((v12 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
      goto LABEL_19;
    }
    -[MLCInstanceNormalizationLayer beta](self, "beta");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentLayers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
LABEL_19:
      v42 = 0;
      goto LABEL_20;
    }
  }
  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isTensorDataTypeInListOfDataTypes:", v9);

    if ((v19 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2, self);
      goto LABEL_19;
    }
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "parentLayers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCInstanceNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, self);
      goto LABEL_19;
    }
  }
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  v55 = v8;
  if (v24)
  {
    -[MLCLayer fusedLayers](self, "fusedLayers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "computeEngine");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "descriptor");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = -[MLCInstanceNormalizationLayer featureChannelCount](self, "featureChannelCount");
    -[MLCInstanceNormalizationLayer mean](self, "mean");
    v29 = objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer variance](self, "variance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer beta](self, "beta");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
    v34 = v33;
    -[MLCInstanceNormalizationLayer momentum](self, "momentum");
    LODWORD(v36) = v35;
    v37 = (void *)v27;
    v38 = v28;
    v39 = (void *)v29;
    LODWORD(v40) = v34;
    objc_msgSend(v26, "fusedInstanceNormalizationAndNeuronLayerWithDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", v27, v38, v29, v30, v31, v32, v40, v36);
    v16 = objc_claimAutoreleasedReturnValue();

    v41 = v54;
  }
  else
  {
    objc_msgSend(v8, "computeEngine");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MLCInstanceNormalizationLayer featureChannelCount](self, "featureChannelCount");
    -[MLCInstanceNormalizationLayer mean](self, "mean");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer variance](self, "variance");
    v45 = objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer beta](self, "beta");
    v46 = objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCInstanceNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
    v48 = v47;
    -[MLCInstanceNormalizationLayer momentum](self, "momentum");
    LODWORD(v50) = v49;
    v37 = (void *)v45;
    v39 = (void *)v46;
    LODWORD(v51) = v48;
    objc_msgSend(v41, "instanceNormalizationLayerWithChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", v44, v26, v45, v46, v30, v51, v50);
    v16 = objc_claimAutoreleasedReturnValue();
  }

  if (v16 && -[NSObject count](v16, "count"))
  {
    v8 = v55;
    objc_msgSend(v55, "computeEngine");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v52, "compileLayerDeviceOps:sourceTensors:resultTensor:", v16, v58, v57);

    v59.receiver = self;
    v59.super_class = (Class)MLCInstanceNormalizationLayer;
    -[MLCLayer bindDevice:deviceOps:](&v59, sel_bindDevice_deviceOps_, v55, v16);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);

    v42 = 0;
    v8 = v55;
  }
LABEL_20:

  return v42;
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
  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCInstanceNormalizationLayer betaParameter](self, "betaParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allocateDataForOptimizer:device:isVector:", v4, v7, 1);

  }
  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLCInstanceNormalizationLayer gammaParameter](self, "gammaParameter");
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
  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNormalizationLayerOptimizerDataForDeviceOps:beta:gamma:", v13, v14, v15);

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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  v6 = a4;
  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");
  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tensorAllocationSizeInBytes") + v9;

  if (v4)
  {
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "tensorAllocationSizeInBytes");
    -[MLCInstanceNormalizationLayer beta](self, "beta");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "tensorAllocationSizeInBytes") + v15;
    v12 += v18 * objc_msgSend(v6, "numOptimizerDataBuffers");

  }
  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCInstanceNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  v9 = v8;
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, *(_QWORD *)&v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  v7 = -[MLCInstanceNormalizationLayer featureChannelCount](self, "featureChannelCount");
  -[MLCInstanceNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  v9 = v8;
  -[MLCInstanceNormalizationLayer momentum](self, "momentum");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Variance Epsilon: %.03f<BR />Momentum: %.03f</FONT>>"), v5, v6, v7, *(_QWORD *)&v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", self);

}

- (void)unlinkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCInstanceNormalizationLayer gamma](self, "gamma");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", self);

}

- (BOOL)isValidTrainingParameters
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MLCInstanceNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLCInstanceNormalizationLayer gamma](self, "gamma");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)parametersCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[MLCInstanceNormalizationLayer betaParameter](self, "betaParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCInstanceNormalizationLayer gammaParameter](self, "gammaParameter");
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: beta tensor width or height cannot be > 1", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: gamma tensor width or height cannot be > 1", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Both gamma and beta must either be null or non-null", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: variance tensor width or height cannot be > 1", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: mean tensor width or height cannot be > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.2(const char *a1, void *a2)
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
  objc_msgSend(a2, "gamma");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: gamma tensor used by InstanceNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.3(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "gamma");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "gamma");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataType");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: gamma tensor (%@) in InstanceNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
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
  objc_msgSend(a2, "beta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: beta tensor used by InstanceNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "beta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "beta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataType");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: beta tensor (%@) in InstanceNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

@end

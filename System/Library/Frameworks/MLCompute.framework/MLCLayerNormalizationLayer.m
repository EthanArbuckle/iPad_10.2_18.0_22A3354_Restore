@implementation MLCLayerNormalizationLayer

+ (MLCLayerNormalizationLayer)layerWithNormalizedShape:(NSArray *)normalizedShape beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  MLCTensor *v10;
  MLCTensor *v11;
  NSArray *v12;
  id v13;
  double v14;
  void *v15;

  v10 = gamma;
  v11 = beta;
  v12 = normalizedShape;
  v13 = objc_alloc((Class)a1);
  *(float *)&v14 = varianceEpsilon;
  v15 = (void *)objc_msgSend(v13, "initWithNormalizedShape:beta:gamma:varianceEpsilon:", v12, v11, v10, v14);

  return (MLCLayerNormalizationLayer *)v15;
}

- (MLCLayerNormalizationLayer)initWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  MLCLayerNormalizationLayer *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  _BOOL4 v31;
  BOOL v32;
  MLCLayerNormalizationLayer *v33;
  MLCLayerNormalizationLayer *v34;
  uint64_t v35;
  MLCTensorParameter *betaParameter;
  NSObject *v37;
  MLCTensorParameter *v38;
  uint64_t v39;
  MLCTensorParameter *gammaParameter;
  MLCTensorParameter *v41;
  const char *v42;
  id v43;
  void *v44;
  objc_super v45;
  objc_super v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!objc_msgSend(v12, "count") || (unint64_t)objc_msgSend(v12, "count") >= 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.1(a2);
LABEL_5:

    v16 = 0;
    goto LABEL_6;
  }
  if (a6 < 0.0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.2(a2);
    goto LABEL_5;
  }
  v42 = a2;
  v18 = objc_msgSend(v12, "count");
  v43 = v14;
  v44 = v13;
  if (v13)
  {
    objc_msgSend(v13, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "dimensionCount");

    objc_msgSend(v44, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subarrayWithRange:", v20 - v18, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToArray:", v12);

    v14 = v43;
    v13 = v44;
    if ((v24 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.5(v42);
      goto LABEL_5;
    }
  }
  if (!v14)
    goto LABEL_14;
  objc_msgSend(v14, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "dimensionCount");

  objc_msgSend(v14, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shape");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "subarrayWithRange:", v26 - v18, v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToArray:", v12);

  v14 = v43;
  if ((v30 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.4(v42);

    v16 = 0;
    v13 = v44;
  }
  else
  {
LABEL_14:
    v13 = v44;
    v31 = v44 != 0;
    if (v14)
    {
      v31 = 0;
      v32 = v44 == 0;
    }
    else
    {
      v32 = 0;
    }
    if (v32 || v31)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCLayerNormalizationLayer initWithNormalizedShape:beta:gamma:varianceEpsilon:].cold.3(v42);
      goto LABEL_5;
    }
    v46.receiver = self;
    v46.super_class = (Class)MLCLayerNormalizationLayer;
    v33 = -[MLCLayer initWithLabel:](&v46, sel_initWithLabel_, CFSTR("LayerNorm"));
    v34 = v33;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_normalizedShape, a3);
      objc_storeStrong((id *)&v34->_beta, a4);
      objc_storeStrong((id *)&v34->_gamma, a5);
      v34->_varianceEpsilon = a6;
      if (v44)
      {
        +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v44);
        v35 = objc_claimAutoreleasedReturnValue();
        betaParameter = v34->_betaParameter;
        v34->_betaParameter = (MLCTensorParameter *)v35;

        -[MLCTensor setIsLayerParameter:](v34->_beta, "setIsLayerParameter:", 1);
      }
      else
      {
        v38 = v34->_betaParameter;
        v34->_betaParameter = 0;

      }
      if (v14)
      {
        +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v14);
        v39 = objc_claimAutoreleasedReturnValue();
        gammaParameter = v34->_gammaParameter;
        v34->_gammaParameter = (MLCTensorParameter *)v39;

        -[MLCTensor setIsLayerParameter:](v34->_gamma, "setIsLayerParameter:", 1);
      }
      else
      {
        v41 = v34->_gammaParameter;
        v34->_gammaParameter = 0;

      }
      v45.receiver = v34;
      v45.super_class = (Class)MLCLayerNormalizationLayer;
      -[MLCLayer setIsUpdatable:](&v45, sel_setIsUpdatable_, 1);
    }
    self = v34;
    v16 = self;
  }
LABEL_6:

  return v16;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char isKindOfClass;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  const char *v55;
  id v56;
  objc_super v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(&unk_1E9844AF8, "mutableCopy");
  if (objc_msgSend(v9, "type") == 3)
    objc_msgSend(v12, "addObject:", &unk_1E9844320);
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_8;
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTensorDataTypeInListOfDataTypes:", v12);

  if ((v15 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2, self);
    goto LABEL_21;
  }
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parentLayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
LABEL_8:
    -[MLCLayerNormalizationLayer gamma](self, "gamma");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[MLCLayerNormalizationLayer gamma](self, "gamma");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isTensorDataTypeInListOfDataTypes:", v12);

      if ((v22 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
        goto LABEL_21;
      }
      -[MLCLayerNormalizationLayer gamma](self, "gamma");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parentLayers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25)
      {
        +[MLCLog framework](MLCLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2, self);
        goto LABEL_21;
      }
    }
    v55 = a2;
    v56 = v11;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
    -[MLCLayerNormalizationLayer normalizedShape](self, "normalizedShape");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    -[NSObject descriptor](v19, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "dimensionCount");

    -[NSObject descriptor](v19, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "subarrayWithRange:", v29 - v27, v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayerNormalizationLayer normalizedShape](self, "normalizedShape");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqualToArray:", v33);

    if ((v34 & 1) != 0)
    {
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (!v36)
        goto LABEL_18;
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        -[MLCLayer fusedLayers](self, "fusedLayers");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "computeEngine");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "descriptor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer normalizedShape](self, "normalizedShape");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer beta](self, "beta");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer gamma](self, "gamma");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
        objc_msgSend(v41, "fusedLayerNormalizationAndNeuronLayerWithDescriptor:normalizedShape:beta:gamma:varianceEpsilon:", v42, v43, v53, v47);
        v44 = objc_claimAutoreleasedReturnValue();

        v40 = v54;
      }
      else
      {
LABEL_18:
        objc_msgSend(v9, "computeEngine");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer normalizedShape](self, "normalizedShape");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer beta](self, "beta");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer gamma](self, "gamma");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayerNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
        objc_msgSend(v40, "layerNormalizationLayerWithNormalizedShape:beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:", v41, v42, v43, 1);
        v44 = objc_claimAutoreleasedReturnValue();
      }

      if (v44 && -[NSObject count](v44, "count"))
      {
        objc_msgSend(v9, "computeEngine");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_opt_respondsToSelector();

        v11 = v56;
        if ((v49 & 1) != 0)
        {
          objc_msgSend(v9, "computeEngine");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v50, "compileLayerDeviceOps:sourceTensors:resultTensor:", v44, v10, v56);

        }
        else
        {
          v45 = 1;
        }
        v57.receiver = self;
        v57.super_class = (Class)MLCLayerNormalizationLayer;
        -[MLCLayer bindDevice:deviceOps:](&v57, sel_bindDevice_deviceOps_, v9, v44);
        goto LABEL_33;
      }
      +[MLCLog framework](MLCLog, "framework");
      v51 = objc_claimAutoreleasedReturnValue();
      v11 = v56;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(v55);

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      v11 = v56;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v55);
    }
    v45 = 0;
LABEL_33:

    goto LABEL_34;
  }
  +[MLCLog framework](MLCLog, "framework");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[MLCLayerNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
LABEL_21:
  v45 = 0;
LABEL_34:

  return v45;
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
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCLayerNormalizationLayer betaParameter](self, "betaParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allocateDataForOptimizer:device:isVector:", v4, v7, 1);

  }
  -[MLCLayerNormalizationLayer gamma](self, "gamma");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLCLayerNormalizationLayer gammaParameter](self, "gammaParameter");
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
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayerNormalizationLayer gamma](self, "gamma");
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

  v4 = a3;
  v6 = a4;
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");
  -[MLCLayerNormalizationLayer gamma](self, "gamma");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tensorAllocationSizeInBytes") + v9;

  if (v4)
    v12 += v12 * objc_msgSend(v6, "numOptimizerDataBuffers");

  return v12;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  return a3;
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
  -[MLCLayerNormalizationLayer beta](self, "beta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayerNormalizationLayer gamma](self, "gamma");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayerNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
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
  void *v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCLayerNormalizationLayer normalizedShape](self, "normalizedShape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayerNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Normalized Shape: %@<BR />Variance Epsilon: %.03f</FONT>>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MLCLayerNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCLayerNormalizationLayer gamma](self, "gamma");
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

  -[MLCLayerNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCLayerNormalizationLayer gamma](self, "gamma");
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

  -[MLCLayerNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLCLayerNormalizationLayer gamma](self, "gamma");
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

  -[MLCLayerNormalizationLayer betaParameter](self, "betaParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCLayerNormalizationLayer gammaParameter](self, "gammaParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3 != 0;
}

- (NSArray)normalizedShape
{
  return self->_normalizedShape;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaParameter, 0);
  objc_storeStrong((id *)&self->_betaParameter, 0);
  objc_storeStrong((id *)&self->_gamma, 0);
  objc_storeStrong((id *)&self->_beta, 0);
  objc_storeStrong((id *)&self->_normalizedShape, 0);
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: normalized shape size must be in range 1 to 3", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the variance must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.3(const char *a1)
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

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: shape of gamma does not match the normailzed shape", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithNormalizedShape:(const char *)a1 beta:gamma:varianceEpsilon:.cold.5(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: shape of beta does not match the normailzed shape", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: shape of the normalized dimensions of source tensor does not match the normailzed shape", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.3(const char *a1, void *a2)
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: gamma tensor used by LayerNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
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
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: gamma tensor (%@) in LayerNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
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
  objc_msgSend(a2, "beta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: beta tensor used by LayerNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.6(const char *a1, void *a2)
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
  OUTLINED_FUNCTION_3_1(&dword_1D4999000, v7, v8, "%@: beta tensor (%@) in LayerNormalization uses an unsupported data type=%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_5_0();
}

@end

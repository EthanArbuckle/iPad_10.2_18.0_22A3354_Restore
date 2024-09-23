@implementation MLCGroupNormalizationLayer

+ (MLCGroupNormalizationLayer)layerWithFeatureChannelCount:(NSUInteger)featureChannelCount groupCount:(NSUInteger)groupCount beta:(MLCTensor *)beta gamma:(MLCTensor *)gamma varianceEpsilon:(float)varianceEpsilon
{
  MLCTensor *v12;
  MLCTensor *v13;
  id v14;
  double v15;
  void *v16;

  v12 = gamma;
  v13 = beta;
  v14 = objc_alloc((Class)a1);
  *(float *)&v15 = varianceEpsilon;
  v16 = (void *)objc_msgSend(v14, "initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:", featureChannelCount, groupCount, v13, v12, v15);

  return (MLCGroupNormalizationLayer *)v16;
}

- (MLCGroupNormalizationLayer)initWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  id v14;
  id v15;
  NSObject *v16;
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
  MLCGroupNormalizationLayer *v29;
  MLCGroupNormalizationLayer *v30;
  uint64_t v31;
  MLCTensorParameter *betaParameter;
  MLCTensorParameter *v33;
  uint64_t v34;
  MLCTensorParameter *gammaParameter;
  MLCTensorParameter *v36;
  MLCGroupNormalizationLayer *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  objc_super v62;

  v14 = a5;
  v15 = a6;
  if (!a3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.1(a2);
    goto LABEL_45;
  }
  if (!a4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.2(a2);
    goto LABEL_45;
  }
  if (a4 > a3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.3(a2);
LABEL_45:

    v37 = 0;
    goto LABEL_46;
  }
  if (a3 % a4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.7(a2);
    goto LABEL_45;
  }
  if (a7 < 0.0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.4(a2);
    goto LABEL_45;
  }
  if (v14)
  {
    objc_msgSend(v14, "descriptor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "unsignedIntegerValue") == 1)
    {
      v55 = v18;
      v57 = v17;
      objc_msgSend(v14, "descriptor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "shape");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "unsignedIntegerValue") == 1)
      {
        v49 = v20;
        v51 = v19;
        objc_msgSend(v14, "descriptor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "shape");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "unsignedIntegerValue") == a3)
        {
          objc_msgSend(v14, "descriptor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "shape");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v22, "unsignedIntegerValue");

          if (v43 == 1)
            goto LABEL_21;
LABEL_32:
          +[MLCLog framework](MLCLog, "framework");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.6(a2);
          goto LABEL_45;
        }

        v20 = v49;
      }

      v18 = v55;
      v17 = v57;
    }

    goto LABEL_32;
  }
LABEL_21:
  if (v15)
  {
    objc_msgSend(v15, "descriptor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "unsignedIntegerValue") == 1)
    {
      v56 = v24;
      v58 = v23;
      objc_msgSend(v15, "descriptor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "shape");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "unsignedIntegerValue") == 1)
      {
        v50 = v26;
        v52 = v25;
        objc_msgSend(v15, "descriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "shape");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "unsignedIntegerValue") == a3)
        {
          objc_msgSend(v15, "descriptor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "shape");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v28, "unsignedIntegerValue");

          if (v44 == 1)
            goto LABEL_26;
LABEL_43:
          +[MLCLog framework](MLCLog, "framework");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[MLCGroupNormalizationLayer initWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:].cold.5(a2);
          goto LABEL_45;
        }

        v26 = v50;
      }

      v24 = v56;
      v23 = v58;
    }

    goto LABEL_43;
  }
LABEL_26:
  v62.receiver = self;
  v62.super_class = (Class)MLCGroupNormalizationLayer;
  v29 = -[MLCLayer initWithLabel:](&v62, sel_initWithLabel_, CFSTR("GroupNorm"));
  v30 = v29;
  if (v29)
  {
    v29->_featureChannelCount = a3;
    v29->_groupCount = a4;
    objc_storeStrong((id *)&v29->_beta, a5);
    objc_storeStrong((id *)&v30->_gamma, a6);
    v30->_varianceEpsilon = a7;
    if (v14)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v14);
      v31 = objc_claimAutoreleasedReturnValue();
      betaParameter = v30->_betaParameter;
      v30->_betaParameter = (MLCTensorParameter *)v31;

      -[MLCTensor setIsLayerParameter:](v30->_beta, "setIsLayerParameter:", 1);
    }
    else
    {
      v33 = v30->_betaParameter;
      v30->_betaParameter = 0;

    }
    if (v15)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v15);
      v34 = objc_claimAutoreleasedReturnValue();
      gammaParameter = v30->_gammaParameter;
      v30->_gammaParameter = (MLCTensorParameter *)v34;

      -[MLCTensor setIsLayerParameter:](v30->_gamma, "setIsLayerParameter:", 1);
    }
    else
    {
      v36 = v30->_gammaParameter;
      v30->_gammaParameter = 0;

    }
    v61.receiver = v30;
    v61.super_class = (Class)MLCGroupNormalizationLayer;
    -[MLCLayer setIsUpdatable:](&v61, sel_setIsUpdatable_, 1);
  }
  self = v30;
  v37 = self;
LABEL_46:

  return v37;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSUInteger v27;
  id v28;
  id v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  NSObject *v40;
  const char *v42;
  void *v43;
  objc_super v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MLCGroupNormalizationLayer beta](self, "beta");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MLCGroupNormalizationLayer beta](self, "beta");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentLayers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2, self);
LABEL_19:
      v39 = 0;
      goto LABEL_20;
    }
  }
  -[MLCGroupNormalizationLayer gamma](self, "gamma");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MLCGroupNormalizationLayer gamma](self, "gamma");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentLayers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, self);
      goto LABEL_19;
    }
  }
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v43 = v9;
  if (v22)
  {
    -[MLCLayer fusedLayers](self, "fusedLayers", a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "computeEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "descriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MLCGroupNormalizationLayer featureChannelCount](self, "featureChannelCount");
    v28 = v11;
    v29 = v10;
    v30 = -[MLCGroupNormalizationLayer groupCount](self, "groupCount");
    -[MLCGroupNormalizationLayer beta](self, "beta");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGroupNormalizationLayer gamma](self, "gamma");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGroupNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
    v33 = v30;
    v10 = v29;
    v11 = v28;
    objc_msgSend(v25, "fusedGroupNormalizationAndNeuronLayerWithDescriptor:featureChannelCount:groupCount:beta:gamma:varianceEpsilon:", v26, v27, v33, v31, v32);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "computeEngine", a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MLCGroupNormalizationLayer featureChannelCount](self, "featureChannelCount");
    v35 = -[MLCGroupNormalizationLayer groupCount](self, "groupCount");
    -[MLCGroupNormalizationLayer beta](self, "beta");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGroupNormalizationLayer gamma](self, "gamma");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGroupNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
    objc_msgSend(v24, "groupNormalizationLayerWithFeatureChannelCount:groupCount:beta:gamma:varianceEpsilon:", v34, v35, v25, v26);
    v16 = objc_claimAutoreleasedReturnValue();
  }

  if (!v16 || !-[NSObject count](v16, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v40 = objc_claimAutoreleasedReturnValue();
    v9 = v43;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(v42);

    goto LABEL_19;
  }
  v9 = v43;
  objc_msgSend(v43, "computeEngine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_respondsToSelector();

  if ((v37 & 1) != 0)
  {
    objc_msgSend(v43, "computeEngine");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "compileLayerDeviceOps:sourceTensors:resultTensor:", v16, v10, v11);

  }
  else
  {
    v39 = 1;
  }
  v44.receiver = self;
  v44.super_class = (Class)MLCGroupNormalizationLayer;
  -[MLCLayer bindDevice:deviceOps:](&v44, sel_bindDevice_deviceOps_, v43, v16);
LABEL_20:

  return v39;
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
  -[MLCGroupNormalizationLayer beta](self, "beta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCGroupNormalizationLayer betaParameter](self, "betaParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allocateDataForOptimizer:device:isVector:", v4, v7, 1);

  }
  -[MLCGroupNormalizationLayer gamma](self, "gamma");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLCGroupNormalizationLayer gammaParameter](self, "gammaParameter");
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
  -[MLCGroupNormalizationLayer beta](self, "beta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGroupNormalizationLayer gamma](self, "gamma");
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
  -[MLCGroupNormalizationLayer beta](self, "beta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");
  -[MLCGroupNormalizationLayer gamma](self, "gamma");
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
  NSUInteger v6;
  NSUInteger v7;
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
  v6 = -[MLCGroupNormalizationLayer featureChannelCount](self, "featureChannelCount");
  v7 = -[MLCGroupNormalizationLayer groupCount](self, "groupCount");
  -[MLCGroupNormalizationLayer beta](self, "beta");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGroupNormalizationLayer gamma](self, "gamma");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGroupNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  v11 = v10;
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { featureChannelCount=%lu : groupCount=%lu : beta=%@ : gamma=%@ : varianceEpsilon=%f : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, *(_QWORD *)&v11, v12, v13);
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
  NSUInteger v8;
  float v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  v7 = -[MLCGroupNormalizationLayer featureChannelCount](self, "featureChannelCount");
  v8 = -[MLCGroupNormalizationLayer groupCount](self, "groupCount");
  -[MLCGroupNormalizationLayer varianceEpsilon](self, "varianceEpsilon");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Feature Channel Count: %lu    Group Count: %lu<BR />Variance Epsilon: %.03f</FONT>>"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MLCGroupNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCGroupNormalizationLayer gamma](self, "gamma");
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

  -[MLCGroupNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCGroupNormalizationLayer gamma](self, "gamma");
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

  -[MLCGroupNormalizationLayer beta](self, "beta");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLCGroupNormalizationLayer gamma](self, "gamma");
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

  -[MLCGroupNormalizationLayer betaParameter](self, "betaParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGroupNormalizationLayer gammaParameter](self, "gammaParameter");
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

- (NSUInteger)groupCount
{
  return self->_groupCount;
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
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the number of channels must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the number of groups must be greater than zero", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the number of groups cannot exceed the number of channels", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.4(const char *a1)
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

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.5(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: gamma must be of size (1,C,1,1)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.6(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: beta must be of size (1,C,1,1)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFeatureChannelCount:(const char *)a1 groupCount:beta:gamma:varianceEpsilon:.cold.7(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: The number of channels must be divisible by the number of groups", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: gamma tensor used by GroupNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
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
  objc_msgSend(a2, "beta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: beta tensor used by GroupNormalization cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

@end

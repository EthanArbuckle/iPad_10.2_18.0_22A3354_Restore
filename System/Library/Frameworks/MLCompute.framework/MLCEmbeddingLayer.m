@implementation MLCEmbeddingLayer

+ (MLCEmbeddingLayer)layerWithDescriptor:(MLCEmbeddingDescriptor *)descriptor weights:(MLCTensor *)weights
{
  MLCTensor *v6;
  MLCEmbeddingDescriptor *v7;
  void *v8;

  v6 = weights;
  v7 = descriptor;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weight:", v7, v6);

  return (MLCEmbeddingLayer *)v8;
}

- (MLCEmbeddingLayer)initWithDescriptor:(id)a3 weight:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  MLCEmbeddingLayer *v22;
  MLCEmbeddingLayer *v23;
  uint64_t v24;
  MLCTensorParameter *weightsParameter;
  objc_super v27;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "paddingIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stride");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "dimensionCount") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v7, "paddingIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");
    objc_msgSend(v7, "embeddingDimension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue") * v16;

    objc_msgSend(v8, "data");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (void *)(objc_msgSend(v19, "bytes") + 4 * v18);
    objc_msgSend(v7, "embeddingDimension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    bzero(v20, objc_msgSend(v21, "unsignedIntegerValue") * v14);

  }
  v28.receiver = self;
  v28.super_class = (Class)MLCEmbeddingLayer;
  v22 = -[MLCLayer initWithLabel:](&v28, sel_initWithLabel_, CFSTR("Embedding"));
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_descriptor, a3);
    objc_storeStrong((id *)&v23->_weights, a4);
    +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v8);
    v24 = objc_claimAutoreleasedReturnValue();
    weightsParameter = v23->_weightsParameter;
    v23->_weightsParameter = (MLCTensorParameter *)v24;

    -[MLCTensor setIsLayerParameter:](v23->_weights, "setIsLayerParameter:", 1);
    v27.receiver = v23;
    v27.super_class = (Class)MLCEmbeddingLayer;
    -[MLCLayer setIsUpdatable:](&v27, sel_setIsUpdatable_, 1);
  }

  return v23;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
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
  int v47;
  void *v48;
  int v49;
  NSObject *v50;
  BOOL v51;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  MLCEmbeddingLayer *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  objc_super v77;

  v8 = a3;
  v76 = a4;
  v9 = a5;
  -[MLCEmbeddingLayer weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor descriptor](self->_weights, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v11;
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "dimensionCount") - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "embeddingDimension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 != objc_msgSend(v16, "unsignedIntegerValue"))
  {

    goto LABEL_13;
  }
  -[MLCEmbeddingLayer weights](self, "weights");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "descriptor");
  v70 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v67 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensor descriptor](self->_weights, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v19, "dimensionCount") - 2);
  v71 = v8;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v20, "unsignedIntegerValue");
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "embeddingCount");
  v60 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v22, "unsignedIntegerValue");

  v8 = v71;
  v9 = v70;

  if (v63 != v61)
  {
LABEL_13:
    +[MLCLog framework](MLCLog, "framework");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
    v51 = 0;
    v34 = v76;
    goto LABEL_16;
  }
  objc_msgSend(v70, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v25, "dimensionCount") - 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");
  -[MLCEmbeddingLayer descriptor](v60, "descriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "embeddingDimension");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedIntegerValue");

  if (v27 != v30)
  {
    +[MLCLog framework](MLCLog, "framework");
    v50 = objc_claimAutoreleasedReturnValue();
    v34 = v76;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    v51 = 0;
    v9 = v70;
    v8 = v71;
    goto LABEL_16;
  }
  objc_msgSend(v70, "descriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "shape");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "descriptor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v75, "dimensionCount") - 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v73, "unsignedIntegerValue");
  v34 = v76;
  objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "descriptor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "shape");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "descriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v37, "dimensionCount") - 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v70;
  if (v33 != objc_msgSend(v38, "unsignedIntegerValue"))
  {

LABEL_21:
    +[MLCLog framework](MLCLog, "framework");
    v50 = objc_claimAutoreleasedReturnValue();
    v8 = v71;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    goto LABEL_23;
  }
  objc_msgSend(v70, "descriptor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "shape");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
  v64 = v31;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v40, "unsignedIntegerValue");
  objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "descriptor");
  v59 = v32;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "shape");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v44, "unsignedIntegerValue");

  v34 = v76;
  v9 = v70;

  if (v62 != v58)
    goto LABEL_21;
  objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "descriptor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "dataType");

  v8 = v71;
  if (v47 != 5)
  {
    +[MLCLog framework](MLCLog, "framework");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
    goto LABEL_23;
  }
  if (objc_msgSend(v71, "type") == 1
    && !-[MLCLayer compileForInferenceOnly](v60, "compileForInferenceOnly"))
  {
    -[MLCEmbeddingLayer descriptor](v60, "descriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "scalesGradientByFrequency");

    if (v49)
    {
      +[MLCLog framework](MLCLog, "framework");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[MLCEmbeddingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
LABEL_23:
      v51 = 0;
      goto LABEL_16;
    }
  }
  objc_msgSend(v71, "computeEngine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](v60, "descriptor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer weights](v60, "weights");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "embeddingLayerWithDescriptor:weights:inferenceOnly:", v54, v55, -[MLCLayer compileForInferenceOnly](v60, "compileForInferenceOnly"));
  v50 = objc_claimAutoreleasedReturnValue();

  if (v50 && -[NSObject count](v50, "count"))
  {
    v77.receiver = v60;
    v77.super_class = (Class)MLCEmbeddingLayer;
    -[MLCLayer bindDevice:deviceOps:](&v77, sel_bindDevice_deviceOps_, v71, v50);
    -[MLCEmbeddingLayer weights](v60, "weights");
    v56 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDevice:](v56, "setDevice:", v71);
    v51 = 1;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v50, v56);
    v51 = 0;
  }

LABEL_16:
  return v51;
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

  v4 = a3;
  -[MLCEmbeddingLayer weightsParameter](self, "weightsParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allocateDataForOptimizer:device:isVector:", v4, v6, 0);

  -[MLCLayer device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "computeEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConvolutionLayerOptimizerDataForDeviceOps:weights:bias:", v9, v10, 0);

  return 1;
}

- (void)allocateGradientsForParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MLCLayer device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computeEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer weights](self, "weights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocateParameterGradientsForDeviceOps:parameters:", v5, v7);

}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v6 = a4;
  -[MLCEmbeddingLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");

  if (v4)
    v9 *= objc_msgSend(v6, "numOptimizerDataBuffers") + 2;

  return v9;
}

- (id)resultTensorFromSources:(id)a3
{
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

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddingDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  -[MLCEmbeddingLayer weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v7, objc_msgSend(v11, "dataType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { descriptor=%@ : weight=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
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
  void *v15;
  NSUInteger v16;
  void *v17;
  void *v18;
  void *v19;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLCLayer layerID](self, "layerID");
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "embeddingCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "embeddingDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paddingIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumNorm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pNorm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCEmbeddingLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Embedding Count: %@    Embedding Dimension: %@<BR />PaddingIndex: %@   Maximum Norm: %@   P Norm: %@<BR />Scale Gradient By Frequency: %hhd</FONT>>"), v15, v16, v4, v5, v7, v9, v11, objc_msgSend(v12, "scalesGradientByFrequency"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (void)linkAssociatedTensors
{
  void *v3;
  id v4;

  -[MLCEmbeddingLayer weights](self, "weights");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self);

}

- (void)unlinkAssociatedTensors
{
  void *v3;
  id v4;

  -[MLCEmbeddingLayer weights](self, "weights");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 5;
}

- (unint64_t)parametersCount
{
  return 1;
}

- (MLCEmbeddingDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: scaling gradient by frequency not supported by GPU", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensor data type must be MLCDataTypeInt64 for embedding layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: result tensor dimensions do not match the source tensor dimensions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: result tensor last dimension must be equal to embedding dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weight tensor must be of size embeddingCount x embeddingDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

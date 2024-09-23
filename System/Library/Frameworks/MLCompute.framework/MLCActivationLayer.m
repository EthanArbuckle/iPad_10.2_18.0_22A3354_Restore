@implementation MLCActivationLayer

+ (MLCActivationLayer)reluLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 0;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)relu6Layer
{
  double v2;
  double v3;
  void *v5;
  void *v6;

  LODWORD(v2) = 0;
  LODWORD(v3) = 6.0;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 10, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)leakyReLULayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 1008981770;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)leakyReLULayerWithNegativeSlope:(float)negativeSlope
{
  void *v4;
  void *v5;

  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)linearLayerWithScale:(float)scale bias:(float)bias
{
  void *v5;
  void *v6;

  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)sigmoidLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)hardSigmoidLayer
{
  double v2;
  double v3;
  void *v5;
  void *v6;

  LODWORD(v2) = 1045220557;
  LODWORD(v3) = 0.5;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 4, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)tanhLayer
{
  double v2;
  double v3;
  void *v5;
  void *v6;

  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 5, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)absoluteLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)softPlusLayer
{
  double v2;
  double v3;
  void *v5;
  void *v6;

  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 7, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)softPlusLayerWithBeta:(float)beta
{
  double v4;
  void *v5;
  void *v6;

  *(float *)&v4 = 1.0 / beta;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)softSignLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)eluLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 1.0;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 9, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)eluLayerWithA:(float)a
{
  void *v4;
  void *v5;

  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)relunLayerWithA:(float)a b:(float)b
{
  void *v5;
  void *v6;

  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)logSigmoidLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)seluLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)celuLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 1.0;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 13, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)celuLayerWithA:(float)a
{
  void *v4;
  void *v5;

  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)hardShrinkLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 0.5;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 14, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)hardShrinkLayerWithA:(float)a
{
  void *v4;
  void *v5;

  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)softShrinkLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 0.5;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 15, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)softShrinkLayerWithA:(float)a
{
  void *v4;
  void *v5;

  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)tanhShrinkLayer
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 0;
  +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 16, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)thresholdLayerWithThreshold:(float)threshold replacement:(float)replacement
{
  void *v5;
  void *v6;

  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)geluLayer
{
  double v2;
  double v3;
  void *v5;
  void *v6;

  LODWORD(v2) = *(_DWORD *)"*BL?";
  LODWORD(v3) = 1027024659;
  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 18, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)hardSwishLayer
{
  void *v3;
  void *v4;

  +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v3);

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)clampLayerWithMinValue:(float)minValue maxValue:(float)maxValue
{
  void *v5;
  void *v6;

  +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v5);

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)layerWithDescriptor:(MLCActivationDescriptor *)descriptor
{
  MLCActivationDescriptor *v4;
  void *v5;

  v4 = descriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCActivationLayer *)v5;
}

- (MLCActivationLayer)initWithDescriptor:(id)a3
{
  id v5;
  MLCActivationLayer *v6;
  MLCActivationLayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCActivationLayer;
  v6 = -[MLCLayer initWithLabel:](&v9, sel_initWithLabel_, CFSTR("Activation"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
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
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v31;
  objc_super v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCActivationLayer, "supportsDataType:onDevice:", v15, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v31;
      v36 = 1024;
      v37 = v15;
      v38 = 2112;
      v39 = v9;
      _os_log_error_impl(&dword_1D4999000, v23, OS_LOG_TYPE_ERROR, "%@: activation layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_20;
  }
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v33 = 0;
    *(_DWORD *)buf = 0;
    -[MLCLayer fusedLayers](self, "fusedLayers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (+[MLCPatternMatcher canTransformToReLUNFromLayer:stopGradientTensorList:fusedLayers:alpha:beta:](MLCPatternMatcher, "canTransformToReLUNFromLayer:stopGradientTensorList:fusedLayers:alpha:beta:", self, 0, v19, buf, &v33))
    {
      LODWORD(v21) = v33;
      LODWORD(v20) = *(_DWORD *)buf;
      +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 10, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (+[MLCPatternMatcher canTransformToHardSwishFromLayer:stopGradientTensorList:fusedLayers:inputTensor:](MLCPatternMatcher, "canTransformToHardSwishFromLayer:stopGradientTensorList:fusedLayers:inputTensor:", self, 0, v19, 0))
      {
        v24 = 19;
      }
      else
      {
        if (!+[MLCPatternMatcher canTransformToGELUFromLayer:stopGradientTensorList:fusedLayers:inputTensor:](MLCPatternMatcher, "canTransformToGELUFromLayer:stopGradientTensorList:fusedLayers:inputTensor:", self, 0, v19, 0))
        {
          +[MLCLog framework](MLCLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[MLCActivationLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
          goto LABEL_19;
        }
        v24 = 18;
      }
      +[MLCActivationDescriptor descriptorWithType:](MLCActivationDescriptor, "descriptorWithType:", v24);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v22;

    v12 = v25;
  }
  objc_msgSend(v9, "computeEngine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "neuronLayerWithDescriptor:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 || !objc_msgSend(v19, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCActivationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
LABEL_19:

LABEL_20:
    v28 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v9, "computeEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "compileLayerDeviceOps:sourceTensors:resultTensor:", v19, v10, v11);

  v32.receiver = self;
  v32.super_class = (Class)MLCActivationLayer;
  -[MLCLayer bindDevice:deviceOps:](&v32, sel_bindDevice_deviceOps_, v9, v19);

LABEL_21:
  return v28;
}

- (id)resultTensorFromSources:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (i >= v9)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v13, i);

  }
  v14 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, objc_msgSend(v16, "dataType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCActivationLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "a");
  v8 = v7;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "b");
  v11 = v10;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "c");
  v14 = v13;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { a=%f : b=%f : c=%f : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, *(_QWORD *)&v8, *(_QWORD *)&v11, *(_QWORD *)&v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCActivationLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MLCActivationTypeDebugDescription((MLCActivationType)objc_msgSend(v7, "activationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCActivationLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "a");
  v11 = v10;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "b");
  v14 = v13;
  -[MLCActivationLayer descriptor](self, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "c");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Activation Type: %@<BR />a: %.03f    b: %.03f    c: %.03f</FONT>>"), v5, v6, v8, *(_QWORD *)&v11, *(_QWORD *)&v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (MLCActivationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
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
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

}

@end

@implementation MLCLossLayer

+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor
{
  MLCLossDescriptor *v4;
  void *v5;

  v4 = lossDescriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v4, 0);

  return (MLCLossLayer *)v5;
}

+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor weights:(MLCTensor *)weights
{
  MLCTensor *v6;
  MLCLossDescriptor *v7;
  void *v8;

  v6 = weights;
  v7 = lossDescriptor;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v7, v6);

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight
{
  double v8;
  double v9;
  void *v10;
  void *v11;

  *(float *)&v8 = weight;
  *(float *)&v9 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 2, *(_QWORD *)&reductionType, classCount, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v10, 0);

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights
{
  uint64_t v8;
  MLCTensor *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v8 = *(_QWORD *)&reductionType;
  v10 = weights;
  LODWORD(v11) = 1.0;
  *(float *)&v12 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 2, v8, classCount, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v13, v10);

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight
{
  double v8;
  double v9;
  void *v10;
  void *v11;

  *(float *)&v8 = weight;
  *(float *)&v9 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 4, *(_QWORD *)&reductionType, classCount, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v10, 0);

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights
{
  uint64_t v8;
  MLCTensor *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v8 = *(_QWORD *)&reductionType;
  v10 = weights;
  LODWORD(v11) = 1.0;
  *(float *)&v12 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 4, v8, classCount, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v13, v10);

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weight:(float)weight
{
  double v7;
  double v8;
  void *v9;
  void *v10;

  *(float *)&v7 = weight;
  *(float *)&v8 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 3, *(_QWORD *)&reductionType, 1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v9, 0);

  return (MLCLossLayer *)v10;
}

+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weights:(MLCTensor *)weights
{
  uint64_t v6;
  MLCTensor *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v6 = *(_QWORD *)&reductionType;
  v8 = weights;
  LODWORD(v9) = 1.0;
  *(float *)&v10 = labelSmoothing;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 3, v6, 1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v11, v8);

  return (MLCLossLayer *)v12;
}

+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weight:(float)a4
{
  void *v5;
  void *v6;

  +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 4, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v5, 0);

  return v6;
}

+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weights:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", 4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v7, v6);

  return v8;
}

+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weight:(float)weight
{
  double v5;
  double v6;
  double v9;
  double v10;
  void *v11;
  void *v12;

  *(float *)&v5 = weight;
  LODWORD(v9) = 0;
  LODWORD(v6) = 1.0;
  LODWORD(v10) = LODWORD(v5);
  *(float *)&v5 = epsilon;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", 8, *(_QWORD *)&reductionType, 1, v10, v9, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v11, 0);

  return (MLCLossLayer *)v12;
}

+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weights:(MLCTensor *)weights
{
  uint64_t v6;
  MLCTensor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&reductionType;
  v8 = weights;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  *(float *)&v12 = epsilon;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", 8, v6, 1, v9, v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v13, v8);

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weight:(float)weight
{
  double v5;
  double v6;
  double v9;
  double v10;
  void *v11;
  void *v12;

  *(float *)&v6 = delta;
  LODWORD(v5) = 869711765;
  LODWORD(v9) = 0;
  *(float *)&v10 = weight;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", 6, *(_QWORD *)&reductionType, 1, v10, v9, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v11, 0);

  return (MLCLossLayer *)v12;
}

+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weights:(MLCTensor *)weights
{
  uint64_t v6;
  MLCTensor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&reductionType;
  v8 = weights;
  LODWORD(v9) = 869711765;
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 0;
  *(float *)&v12 = delta;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", 6, v6, 1, v10, v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v13, v8);

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  void *v5;
  void *v6;

  +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 0, *(_QWORD *)&reductionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v5, 0);

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4;
  MLCTensor *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&reductionType;
  v6 = weights;
  +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v7, v6);

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  void *v5;
  void *v6;

  +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 1, *(_QWORD *)&reductionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v5, 0);

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4;
  MLCTensor *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&reductionType;
  v6 = weights;
  +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", 1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v7, v6);

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  void *v5;
  void *v6;

  +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 5, *(_QWORD *)&reductionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v5, 0);

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4;
  MLCTensor *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&reductionType;
  v6 = weights;
  +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", 5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v7, v6);

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  uint64_t v5;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&reductionType;
  if (reductionType == MLCReductionTypeMean)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:].cold.1(a2);

  }
  *(float *)&v9 = weight;
  +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 7, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v10, 0);

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4;
  MLCTensor *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&reductionType;
  v7 = weights;
  if ((_DWORD)v4 == 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:].cold.1(a2);

  }
  +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", 7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:", v9, v7);

  return (MLCLossLayer *)v10;
}

- (MLCLossLayer)initWithDescriptor:(id)a3 weights:(id)a4
{
  id v8;
  id v9;
  NSObject *v10;
  MLCLossLayer *v11;
  MLCLossLayer *v12;
  MLCTensor *lossLabels;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "lossType") == 7 && objc_msgSend(v8, "reductionType") == 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:].cold.1(a2);

  }
  v15.receiver = self;
  v15.super_class = (Class)MLCLossLayer;
  v11 = -[MLCLayer initWithLabel:](&v15, sel_initWithLabel_, CFSTR("Loss"));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    lossLabels = v12->_lossLabels;
    v12->_lossLabels = 0;

    objc_storeStrong((id *)&v12->_weights, a4);
  }

  return v12;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  BOOL v45;
  void *v46;
  const char *aSelector;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    aSelector = a2;
    v12 = objc_msgSend(v10, "count");
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "descriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "dataType");

        if (!+[MLCLayer supportsDataType:onDevice:](MLCLossLayer, "supportsDataType:onDevice:", v17, v9))
          break;
        if (v13 == ++v14)
          goto LABEL_6;
      }
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v51 = v46;
        v52 = 2048;
        v53 = v14;
        v54 = 1024;
        v55 = v17;
        v56 = 2112;
        v57 = v9;
        _os_log_error_impl(&dword_1D4999000, v35, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);

      }
      goto LABEL_29;
    }
LABEL_6:
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (objc_msgSend(v10, "count"))
    {
      v22 = 0;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "descriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shape");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v21 != v26)
          break;
        if (++v22 >= (unint64_t)objc_msgSend(v10, "count"))
          goto LABEL_10;
      }
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.5();
      goto LABEL_29;
    }
LABEL_10:
    -[MLCLossLayer lossLabels](self, "lossLabels");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_12;
    v28 = (void *)v27;
    -[MLCLossLayer lossLabels](self, "lossLabels");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v21 == v32)
    {
LABEL_12:
      objc_msgSend(v9, "computeEngine");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLossLayer descriptor](self, "descriptor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lossLayerWithDescriptor:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35 && -[NSObject count](v35, "count"))
      {
        objc_msgSend(v9, "computeEngine");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "compileLayerDeviceOps:sourceTensors:resultTensor:", v35, v10, v11);

        if ((v37 & 1) != 0)
        {
          v49.receiver = self;
          v49.super_class = (Class)MLCLossLayer;
          -[MLCLayer bindDevice:deviceOps:](&v49, sel_bindDevice_deviceOps_, v9, v35);
          objc_msgSend(v9, "computeEngine");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "deviceList");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v40 >= 2)
          {
            -[MLCLossLayer descriptor](self, "descriptor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setMultiDeviceReductionType:", objc_msgSend(v41, "reductionType"));

          }
          -[MLCLossLayer weights](self, "weights");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            v45 = 1;
            goto LABEL_30;
          }
          -[MLCLossLayer weights](self, "weights");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "allocateDeviceMemory:", v9);

          -[MLCLossLayer weights](self, "weights");
          v44 = objc_claimAutoreleasedReturnValue();
          -[NSObject writeTensorDataToAllDevices:](v44, "writeTensorDataToAllDevices:", v9);
          v45 = 1;
          goto LABEL_34;
        }
        +[MLCLog framework](MLCLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.3(aSelector);
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.2();
      }
      v45 = 0;
LABEL_34:

      goto LABEL_30;
    }
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.1();
  }
LABEL_29:
  v45 = 0;
LABEL_30:

  return v45;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MLCLossLayer;
  v6 = -[MLCLayer resultSizeFromSourceSize:dimension:](&v13, sel_resultSizeFromSourceSize_dimension_, a3);
  -[MLCLossLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "reductionType");

  if (!v8)
  {
    if (a4 != 1)
      return (unint64_t)v6;
    -[MLCLossLayer descriptor](self, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "lossType") == 2)
    {

    }
    else
    {
      -[MLCLossLayer descriptor](self, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "lossType");

      if (v12 != 4)
        return (unint64_t)v6;
    }
  }
  return 1;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v9, "unsignedIntegerValue"), 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v11, 0);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15 == 2)
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v20, "unsignedIntegerValue"), 1);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    v24 = v22;
    v25 = 1;
LABEL_7:
    objc_msgSend(v23, "setObject:atIndexedSubscript:", v24, v25);

    goto LABEL_8;
  }
  v26 = objc_msgSend(v18, "count");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "descriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shape");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v26 == 3)
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v31, "unsignedIntegerValue"), 1);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "descriptor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "shape");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v36, "unsignedIntegerValue"), 2);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v38, 1);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    v24 = v22;
    v25 = 2;
    goto LABEL_7;
  }
  v39 = objc_msgSend(v29, "count");

  if (v39 == 4)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "shape");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v43, "unsignedIntegerValue"), 1);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "descriptor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "shape");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v48, "unsignedIntegerValue"), 2);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "shape");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v53, "unsignedIntegerValue"), 3);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v55, 1);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v49);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v56, 2);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    v24 = v22;
    v25 = 3;
    goto LABEL_7;
  }
LABEL_8:
  v57 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "descriptor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v57, objc_msgSend(v59, "dataType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLossLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { lossDescriptor=%@ : resultTensor=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  void *v21;
  NSUInteger v23;
  void *v24;
  void *v25;

  v24 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MLCLayer layerID](self, "layerID");
  -[MLCLossLayer descriptor](self, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  MLCLossTypeDebugDescription((MLCLossType)objc_msgSend(v25, "lossType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLossLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MLCReductionTypeDebugDescription((MLCReductionType)objc_msgSend(v6, "reductionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLossLayer descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weight");
  v10 = v9;
  -[MLCLossLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "labelSmoothing");
  v13 = v12;
  -[MLCLossLayer descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "classCount");
  -[MLCLossLayer descriptor](self, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "epsilon");
  v18 = v17;
  -[MLCLossLayer descriptor](self, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delta");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Loss Type: %@         Reduction Type: %@    Weight: %.03f\n<BR />Label Smoothing: %.03f    Class Count: %lu       Epsilon: %.03f<BR />Delta: %.03f</FONT>>"), v4, v23, v5, v7, *(_QWORD *)&v10, *(_QWORD *)&v13, v15, *(_QWORD *)&v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  id v5;

  -[MLCLossLayer lossLabels](self, "lossLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MLCLossLayer lossLabels](self, "lossLabels");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", self);

  }
}

- (void)unlinkAssociatedTensors
{
  void *v3;
  void *v4;
  id v5;

  -[MLCLossLayer lossLabels](self, "lossLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MLCLossLayer lossLabels](self, "lossLabels");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", self);

  }
}

- (MLCLossDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)lossLabels
{
  return self->_lossLabels;
}

- (void)setLossLabels:(id)a3
{
  objc_storeStrong((id *)&self->_lossLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossLabels, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)cosineDistanceLossWithReductionType:(const char *)a1 weight:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: MLCReductionTypeMean not supported with cosine distance loss", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: source tensors cannot be nil=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failure to compile loss layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: source and labels tensors in loss layer must have the same shape=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.5()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: source tensors in loss layer must have the same shape=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

@end

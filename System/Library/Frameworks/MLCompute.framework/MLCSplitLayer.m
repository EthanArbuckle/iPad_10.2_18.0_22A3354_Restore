@implementation MLCSplitLayer

+ (MLCSplitLayer)layerWithSplitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension
{
  return (MLCSplitLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSplitCount:splitSectionLengths:dimension:", splitCount, 0, dimension);
}

+ (MLCSplitLayer)layerWithSplitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension
{
  NSArray *v6;
  void *v7;

  v6 = splitSectionLengths;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSplitCount:splitSectionLengths:dimension:", -[NSArray count](v6, "count"), v6, dimension);

  return (MLCSplitLayer *)v7;
}

- (MLCSplitLayer)initWithSplitCount:(unint64_t)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5
{
  id v8;
  MLCSplitLayer *v9;
  MLCSplitLayer *v10;
  uint64_t v11;
  NSArray *splitSectionLengths;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLCSplitLayer;
  v9 = -[MLCLayer initWithLabel:](&v14, sel_initWithLabel_, CFSTR("Split"));
  v10 = v9;
  if (v9)
  {
    v9->_dimension = a5;
    v9->_splitCount = a3;
    if (v8)
    {
      v11 = objc_msgSend(v8, "copy");
      splitSectionLengths = v10->_splitSectionLengths;
      v10->_splitSectionLengths = (NSArray *)v11;
    }
    else
    {
      splitSectionLengths = v9->_splitSectionLengths;
      v9->_splitSectionLengths = 0;
    }

  }
  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCSplitLayer compileForDevice:sourceTensors:resultTensors:].cold.3(a2);
    goto LABEL_16;
  }
  objc_msgSend(v9, "computeEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
    v15 = 0;
    v17 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v9, "computeEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "splitLayerWithDimension:", -[MLCSplitLayer dimension](self, "dimension"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (!v15 || !-[NSObject count](v15, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v15, v18);

LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v9, "computeEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "compileLayerDeviceOps:sourceTensors:resultTensors:", v15, v10, v11);

LABEL_12:
  v20.receiver = self;
  v20.super_class = (Class)MLCSplitLayer;
  -[MLCLayer bindDevice:deviceOps:](&v20, sel_bindDevice_deviceOps_, v9, v15);
LABEL_17:

  return v17;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;

  v5 = a4;
  -[MLCLayer resultTensors](self, "resultTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v5, "computeEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer resultTensors](self, "resultTensors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v10, "deviceMemorySizeForTensor:", v12);

      ++v8;
      -[MLCLayer resultTensors](self, "resultTensors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v8 < v14);
  }
  else
  {
    v9 = 0;
  }
  if (!-[MLCLayer isTrainable](self, "isTrainable"))
    goto LABEL_18;
  -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = 0;
      v20 = 0;
      do
      {
        objc_msgSend(v5, "computeEngine");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 += objc_msgSend(v21, "deviceMemorySizeForTensor:", v23);

        ++v19;
        -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v19 < v25);
      goto LABEL_19;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (!v27)
    goto LABEL_18;
  v28 = 0;
  v20 = 0;
  do
  {
    -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sharedMemoryTensor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      objc_msgSend(v5, "computeEngine");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v20 += objc_msgSend(v32, "deviceMemorySizeForTensor:", v34);

    }
    ++v28;
    -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

  }
  while (v28 < v36);
LABEL_19:

  return v20 + v9;
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

- (BOOL)isStaticBatchSize
{
  return -[MLCSplitLayer dimension](self, "dimension") != 0;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCSplitLayer dimension](self, "dimension");
  v7 = -[MLCSplitLayer splitCount](self, "splitCount");
  -[MLCSplitLayer splitSectionLengths](self, "splitSectionLengths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dimension=%lu : splitCount=%lu : splitSectionLengths=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu    Split Count: %lu</FONT>>"), v5, -[MLCLayer layerID](self, "layerID"), -[MLCSplitLayer dimension](self, "dimension"), -[MLCSplitLayer splitCount](self, "splitCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCSplitLayer splitCount](self, "splitCount");
  -[MLCSplitLayer splitSectionLengths](self, "splitSectionLengths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSplitCount:splitSectionLengths:dimension:", v5, v6, -[MLCSplitLayer dimension](self, "dimension"));

  return v7;
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

- (NSUInteger)splitCount
{
  return self->_splitCount;
}

- (NSArray)splitSectionLengths
{
  return self->_splitSectionLengths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitSectionLengths, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensors:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensor count must be 1", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

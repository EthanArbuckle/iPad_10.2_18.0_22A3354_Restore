@implementation MLCReshapeLayer

+ (MLCReshapeLayer)layerWithShape:(NSArray *)shape
{
  NSArray *v4;
  void *v5;

  v4 = shape;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:", v4);

  return (MLCReshapeLayer *)v5;
}

- (MLCReshapeLayer)initWithShape:(id)a3
{
  id v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  unint64_t v12;
  MLCReshapeLayer *v13;
  MLCReshapeLayer *v14;
  MLCReshapeLayer *v15;
  objc_super v17;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "intValue");

      if (v10 == -1)
        ++v7;
      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
    if (v7 > 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MLCReshapeLayer initWithShape:].cold.2(a2);
LABEL_12:

      v13 = 0;
      goto LABEL_16;
    }
  }
  v12 = objc_msgSend(v6, "count");
  if (v12 > +[MLCTensorDescriptor maxTensorDimensions](MLCTensorDescriptor, "maxTensorDimensions"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MLCReshapeLayer initWithShape:].cold.1(a2);
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)MLCReshapeLayer;
  v14 = -[MLCLayer initWithLabel:](&v17, sel_initWithLabel_, CFSTR("Reshape"));
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_shape, a3);
  self = v15;
  v13 = self;
LABEL_16:

  return v13;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCReshapeLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
    goto LABEL_13;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "tensorAllocationSizeInBytes");
  objc_msgSend(v11, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "tensorAllocationSizeInBytes");

  if (v14 != v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "tensorAllocationSizeInBytes");
      objc_msgSend(v11, "descriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v22;
      v32 = 2048;
      v33 = v25;
      v34 = 2048;
      v35 = objc_msgSend(v26, "tensorAllocationSizeInBytes");
      _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%@: invalid result tensor size. sourceSize=%lu : resultSize=%lu", buf, 0x20u);

    }
    goto LABEL_13;
  }
  objc_msgSend(v9, "computeEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCReshapeLayer shape](self, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reshapeLayerWithShape:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  if (!v19 || !-[NSObject count](v19, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v19, v27);

LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v9, "computeEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "compileLayerDeviceOps:sourceTensors:resultTensor:", v19, v10, v11);

  v29.receiver = self;
  v29.super_class = (Class)MLCReshapeLayer;
  -[MLCLayer bindDevice:deviceOps:](&v29, sel_bindDevice_deviceOps_, v9, v19);
LABEL_14:

  return v21;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;

  -[MLCReshapeLayer shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
    return 1;
  -[MLCReshapeLayer shape](self, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  -[MLCReshapeLayer shape](self, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == -1)
  {
    v17 = objc_msgSend(v12, "count");

    if (v17)
    {
      v18 = 0;
      v19 = 1;
      do
      {
        if (a4 != v18)
        {
          -[MLCReshapeLayer shape](self, "shape");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 *= objc_msgSend(v21, "unsignedIntegerValue");

        }
        ++v18;
        -[MLCReshapeLayer shape](self, "shape");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      while (v18 < v23);
    }
    else
    {
      v19 = 1;
    }
    return a3 / v19;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    return v15;
  }
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "dimensionCount");

  if (v8)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shape");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 *= objc_msgSend(v14, "unsignedIntegerValue");

      ++v9;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "dimensionCount");

    }
    while (v9 < v17);
  }
  else
  {
    v10 = 1;
  }
  -[MLCReshapeLayer shape](self, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = 0;
    do
    {
      v21 = -[MLCReshapeLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v10, v20);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v22, v20);

      ++v20;
      -[MLCReshapeLayer shape](self, "shape");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v20 < v24);
  }
  v25 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, objc_msgSend(v27, "dataType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  return 0;
}

- (unint64_t)deviceMemorySizeForForward
{
  return 0;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[MLCLayer sourceTensors](self, "sourceTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v7 == objc_msgSend(v12, "unsignedIntegerValue");

  return v7;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return 1;
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
  -[MLCReshapeLayer shape](self, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { shape=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCReshapeLayer shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Shape: %@</FONT>>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

- (void)initWithShape:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: shape dimensions exceed max tensor dimensions currently supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithShape:(const char *)a1 .cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: invalid shape, more than one dimension with '-1' ", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: invalid source tensors count ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

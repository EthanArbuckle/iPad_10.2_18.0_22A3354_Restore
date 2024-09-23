@implementation MLCTransposeLayer

+ (MLCTransposeLayer)layerWithDimensions:(NSArray *)dimensions
{
  NSArray *v4;
  void *v5;

  v4 = dimensions;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDimensions:", v4);

  return (MLCTransposeLayer *)v5;
}

- (MLCTransposeLayer)initWithDimensions:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  MLCTransposeLayer *v11;
  uint64_t v12;
  NSArray *dimensions;
  MLCTransposeLayer *v14;
  NSObject *v15;
  objc_super v17;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MLCTransposeLayer initWithDimensions:].cold.1(a2);

LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
      v10 = objc_msgSend(v5, "count") - 1;

      if (v9 > v10)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_9;
    }
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCTransposeLayer initWithDimensions:].cold.2(a2);

    goto LABEL_15;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)MLCTransposeLayer;
  v11 = -[MLCLayer initWithLabel:](&v17, sel_initWithLabel_, CFSTR("Transpose"));
  if (v11)
  {
    v12 = objc_msgSend(v5, "copy");
    dimensions = v11->_dimensions;
    v11->_dimensions = (NSArray *)v12;

  }
  self = v11;
  v14 = self;
LABEL_16:

  return v14;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  if (objc_msgSend(a4, "type"))
    return a3 == 1;
  else
    return ((a3 - 1) & 0xFFFFFFFD) == 0;
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
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _BYTE v36[18];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MLCTransposeLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
    goto LABEL_17;
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
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "descriptor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "tensorAllocationSizeInBytes");
      objc_msgSend(v11, "descriptor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v25;
      v35 = 2048;
      *(_QWORD *)v36 = v28;
      *(_WORD *)&v36[8] = 2048;
      *(_QWORD *)&v36[10] = objc_msgSend(v29, "tensorAllocationSizeInBytes");
      _os_log_error_impl(&dword_1D4999000, v22, OS_LOG_TYPE_ERROR, "%@: invalid result tensor size. sourceSize=%lu : resultSize=%lu", buf, 0x20u);

LABEL_13:
    }
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "dataType");

  if (!+[MLCTransposeLayer supportsDataType:onDevice:](MLCTransposeLayer, "supportsDataType:onDevice:", v19, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v25;
      v35 = 1024;
      *(_DWORD *)v36 = v19;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = v9;
      _os_log_error_impl(&dword_1D4999000, v22, OS_LOG_TYPE_ERROR, "%@: transpose layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "computeEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTransposeLayer dimensions](self, "dimensions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transposeLayerWithShape:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  if (!v22 || !-[NSObject count](v22, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);

    goto LABEL_17;
  }
  objc_msgSend(v9, "computeEngine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "compileLayerDeviceOps:sourceTensors:resultTensor:", v22, v10, v11);

  v32.receiver = self;
  v32.super_class = (Class)MLCTransposeLayer;
  -[MLCLayer bindDevice:deviceOps:](&v32, sel_bindDevice_deviceOps_, v9, v22);
LABEL_18:

  return v24;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCTransposeLayer resultSizeFromSourceSize:dimension:].cold.1(a2);

  return 0;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v6 = a3;
  -[MLCTransposeLayer dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return v11;
}

- (id)resultTensorFromSources:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v5 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[MLCTransposeLayer dimensions](self, "dimensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 == v11)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    for (i = 0; ; ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (i >= v17)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[MLCTransposeLayer resultSizeFromSourceSizes:dimension:](self, "resultSizeFromSourceSizes:dimension:", v20, i);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v22, i);

    }
    v25 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, objc_msgSend(v27, "dataType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MLCTransposeLayer resultTensorFromSources:].cold.1(a2);

    v24 = 0;
  }

  return v24;
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
  -[MLCTransposeLayer dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dimensions=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
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
  -[MLCTransposeLayer dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Permutation: %@</FONT>>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)initWithDimensions:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: invalid dimensions, must be an array of size 2 ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDimensions:(const char *)a1 .cold.2(const char *a1)
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: invalid dimension value at index= %lu, must be a value between 1 and 3", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
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

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Please call resultSizeFromSourceSizes:dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)resultTensorFromSources:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Shape of dimensions specified when transpose layer was created does not match source tensor shape", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

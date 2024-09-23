@implementation MLCGatherLayer

+ (MLCGatherLayer)layerWithDimension:(NSUInteger)dimension
{
  return (MLCGatherLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:", dimension);
}

- (MLCGatherLayer)initWithDimension:(unint64_t)a3
{
  MLCGatherLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCGatherLayer;
  result = -[MLCLayer initWithLabel:](&v5, sel_initWithLabel_, CFSTR("Gather"));
  if (result)
    result->_dimension = a3;
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  const char *v33;
  MLCGatherLayer *v34;
  uint64_t v35;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") != 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    goto LABEL_21;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (v14 != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    goto LABEL_21;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "dataType");

  if (v17 != 7)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
    goto LABEL_21;
  }
  v33 = a2;
  v34 = self;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v20, "count");
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v35 != v24)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v33);
    goto LABEL_21;
  }
  objc_msgSend(v9, "computeEngine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
  {
    v28 = 0;
LABEL_18:
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v33, (uint64_t)v28, v31);

LABEL_21:
    v30 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v9, "computeEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "gatherLayerWithDimension:", -[MLCGatherLayer dimension](v34, "dimension"));
  v28 = objc_claimAutoreleasedReturnValue();

  if (!v28 || !-[NSObject count](v28, "count"))
    goto LABEL_18;
  objc_msgSend(v9, "computeEngine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "compileLayerDeviceOps:sourceTensors:resultTensor:", v28, v10, v11);

  v36.receiver = v34;
  v36.super_class = (Class)MLCGatherLayer;
  -[MLCLayer bindDevice:deviceOps:](&v36, sel_bindDevice_deviceOps_, v9, v28);
LABEL_22:

  return v30;
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
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (i >= v9)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
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
  NSUInteger v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCGatherLayer dimension](self, "dimension");
  -[MLCLayer resultTensors](self, "resultTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dimension=%lu : resultTensor=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>"), v5, -[MLCLayer layerID](self, "layerID"), -[MLCGatherLayer dimension](self, "dimension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (NSUInteger)dimension
{
  return self->_dimension;
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source and index tensor must have the same shape", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Indices tensor data type must be a 32-bit integer type", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source tensor data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Gather layer expects two tensors, a source tensor and an indices tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

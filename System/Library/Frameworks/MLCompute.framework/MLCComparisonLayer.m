@implementation MLCComparisonLayer

+ (MLCComparisonLayer)layerWithOperation:(MLCComparisonOperation)operation
{
  return (MLCComparisonLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOperation:", *(_QWORD *)&operation);
}

- (MLCComparisonLayer)initWithOperation:(int)a3
{
  MLCComparisonLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCComparisonLayer;
  result = -[MLCLayer initWithLabel:](&v5, sel_initWithLabel_, CFSTR("Compare"));
  if (result)
    result->_operation = a3;
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLCComparisonOperation v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[MLCComparisonLayer operation](self, "operation");
  if ((v12 - 6) >= 6)
  {
    if ((v12 - 2) <= 3)
    {
      if (objc_msgSend(v10, "count"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "descriptor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "dataType");

          v22 = v21 == 4;
          if (v21 == 4)
            break;
          ++v18;
        }
        while (v18 < objc_msgSend(v10, "count"));
      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v11, "descriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "dataType");

      if (v22 || v27 != 4)
      {
        +[MLCLog framework](MLCLog, "framework");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[MLCComparisonLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (objc_msgSend(v10, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "dataType");

        v17 = v16 != 4;
        if (v16 != 4)
          break;
        ++v13;
      }
      while (v13 < objc_msgSend(v10, "count"));
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v11, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "dataType");

    if (v17 || v24 != 4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCComparisonLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
LABEL_29:
      v30 = 0;
      goto LABEL_30;
    }
  }
  objc_msgSend(v9, "computeEngine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "compareLayerWithOperation:", -[MLCComparisonLayer operation](self, "operation"));
  v25 = objc_claimAutoreleasedReturnValue();

  if (!v25 || !-[NSObject count](v25, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v25, v31);

    goto LABEL_29;
  }
  objc_msgSend(v9, "computeEngine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "compileLayerDeviceOps:sourceTensors:resultTensor:", v25, v10, v11);

  v33.receiver = self;
  v33.super_class = (Class)MLCComparisonLayer;
  -[MLCLayer bindDevice:deviceOps:](&v33, sel_bindDevice_deviceOps_, v9, v25);
LABEL_30:

  return v30;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLCComparisonLayer;
  -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v4, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, a3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCComparisonLayer operation](self, "operation");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { compare operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
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
  MLCComparisonOperationDebugDescription(-[MLCComparisonLayer operation](self, "operation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Predicate: %@</FONT>>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 4 || a3 == 1;
}

- (MLCComparisonOperation)operation
{
  return self->_operation;
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

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Data type for comparison operation cannot be BOOLean", v4, v5, v6, v7, 2u);

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

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Data type for comparison operation must be BOOLean", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

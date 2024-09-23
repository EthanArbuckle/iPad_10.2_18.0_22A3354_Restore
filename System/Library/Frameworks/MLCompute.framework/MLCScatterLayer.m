@implementation MLCScatterLayer

+ (MLCScatterLayer)layerWithDimension:(NSUInteger)dimension reductionType:(MLCReductionType)reductionType
{
  void *v4;
  NSObject *v6;

  if (reductionType >= MLCReductionTypeMean)
  {
    +[MLCLog framework](MLCLog, "framework", dimension);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MLCScatterLayer layerWithDimension:reductionType:].cold.1(a2);

    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:reductionType:", dimension, *(_QWORD *)&reductionType);
  }
  return (MLCScatterLayer *)v4;
}

- (MLCScatterLayer)initWithDimension:(unint64_t)a3 reductionType:(int)a4
{
  MLCScatterLayer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLCScatterLayer;
  result = -[MLCLayer initWithLabel:](&v7, sel_initWithLabel_, CFSTR("Scatter"));
  if (result)
  {
    result->_dimension = a3;
    result->_reductionType = a4;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  char v41;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  MLCScatterLayer *v49;
  const char *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  objc_super v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") == 3)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "dataType");

    if (v16 == 1)
    {
      objc_msgSend(v13, "descriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "dataType");

      if (v18 == 7)
      {
        -[NSObject descriptor](v12, "descriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "dataType");

        if (v20 == 1)
        {
          v49 = self;
          v50 = a2;
          v51 = v14;
          v52 = v9;
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "descriptor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "shape");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v22, "count");
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "descriptor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "shape");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v53 != v26)
          {
            +[MLCLog framework](MLCLog, "framework");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.3(v50);
            v41 = 0;
            v9 = v52;
LABEL_28:
            v14 = v51;
            goto LABEL_23;
          }
          v48 = v13;
          v54 = v12;
          v56 = v11;
          v27 = 0;
          while (1)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "descriptor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "shape");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "count");

            if (v27 >= v31)
              break;
            objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "descriptor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "shape");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", v27);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "descriptor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "shape");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectAtIndexedSubscript:", v27);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            ++v27;
            if (v35 != v39)
            {
              +[MLCLog framework](MLCLog, "framework");
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.1(v50);
              v41 = 0;
              v9 = v52;
              v11 = v56;
              goto LABEL_12;
            }
          }
          v9 = v52;
          objc_msgSend(v52, "computeEngine");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_opt_respondsToSelector();

          if ((v44 & 1) != 0)
          {
            objc_msgSend(v52, "computeEngine");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "scatterLayerWithDimension:reduceType:", -[MLCScatterLayer dimension](v49, "dimension"), -[MLCScatterLayer reductionType](v49, "reductionType"));
            v40 = objc_claimAutoreleasedReturnValue();

            if (v40 && -[NSObject count](v40, "count"))
            {
              objc_msgSend(v52, "computeEngine");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v56;
              v41 = objc_msgSend(v46, "compileLayerDeviceOps:sourceTensors:resultTensor:", v40, v10, v56);

              v57.receiver = v49;
              v57.super_class = (Class)MLCScatterLayer;
              -[MLCLayer bindDevice:deviceOps:](&v57, sel_bindDevice_deviceOps_, v52, v40);
LABEL_12:
              v12 = v54;
              v13 = v48;
              goto LABEL_28;
            }
          }
          else
          {
            v40 = 0;
          }
          v12 = v54;
          v11 = v56;
          v13 = v48;
          v14 = v51;
          +[MLCLog framework](MLCLog, "framework");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v50, (uint64_t)v40, v47);

        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
        }
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
    }
    v41 = 0;
LABEL_23:

    goto LABEL_24;
  }
  +[MLCLog framework](MLCLog, "framework");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.7(a2);
  v41 = 0;
LABEL_24:

  return v41;
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
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (i >= v9)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
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
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
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
  v6 = -[MLCScatterLayer dimension](self, "dimension");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>"), v5, -[MLCLayer layerID](self, "layerID"), -[MLCScatterLayer dimension](self, "dimension"));
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

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

+ (void)layerWithDimension:(const char *)a1 reductionType:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Scatter layer only supports a reduce type of none or sum", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: index.size(d) <= src.size(d) for all dimensions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(uint64_t)a2 resultTensor:(NSObject *)a3 .cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceOps=%@", v6, 0x16u);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source and index tensor must have the same shape", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source tensor [0] data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source tensor [1] data type must be a 32-bit integer type", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source tensor [2] data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.7(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Scatter layer expects three tensors, a tensor to copy to result tensor, an indices tensor and source tensor whose elements are to be scattered into result tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

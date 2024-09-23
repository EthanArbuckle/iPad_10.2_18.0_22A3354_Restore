@implementation MLCConcatenationLayer

+ (MLCConcatenationLayer)layer
{
  return (MLCConcatenationLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:", 1);
}

+ (MLCConcatenationLayer)layerWithDimension:(NSUInteger)dimension
{
  return (MLCConcatenationLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:", dimension);
}

- (MLCConcatenationLayer)initWithDimension:(unint64_t)a3
{
  MLCConcatenationLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCConcatenationLayer;
  result = -[MLCLayer initWithLabel:](&v5, sel_initWithLabel_, CFSTR("Concat"));
  if (result)
    result->_dimension = a3;
  return result;
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
  void *v27;
  char v28;
  void *v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  NSObject *v41;
  const char *aSelector;
  objc_super v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
    goto LABEL_35;
  }
  if (!objc_msgSend(v10, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
    goto LABEL_35;
  }
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

      if (!+[MLCConcatenationLayer supportsDataType:onDevice:](MLCConcatenationLayer, "supportsDataType:onDevice:", v17, v9))break;
      if (v13 == ++v14)
        goto LABEL_7;
    }
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v47 = v37;
      v48 = 2048;
      v49 = v14;
      v50 = 1024;
      v51 = v17;
      v52 = 2112;
      v53 = v9;
      _os_log_error_impl(&dword_1D4999000, v34, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);

    }
    goto LABEL_35;
  }
LABEL_7:
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v22 = 1;
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
        goto LABEL_11;
    }
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(aSelector);
    goto LABEL_35;
  }
LABEL_11:
  objc_msgSend(v9, "computeEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  objc_msgSend(v9, "computeEngine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v28 & 1) == 0)
  {
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) == 0)
    {
      v34 = 0;
      v36 = 1;
      goto LABEL_31;
    }
    objc_msgSend(v9, "computeEngine");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "splitLayerWithDimension:", -[MLCConcatenationLayer dimension](self, "dimension"));
    v34 = objc_claimAutoreleasedReturnValue();

    if (v34 && -[NSObject count](v34, "count"))
    {
      objc_msgSend(v9, "computeEngine");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "compileLayerDeviceOps:sourceTensors:resultTensors:", v34, v10, v40);

      goto LABEL_25;
    }
    +[MLCLog framework](MLCLog, "framework");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    goto LABEL_33;
  }
  v30 = -[MLCConcatenationLayer dimension](self, "dimension");
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "shape");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "concatLayerWithConcatDimension:sourceShapeCount:", v30, objc_msgSend(v33, "count"));
  v34 = objc_claimAutoreleasedReturnValue();

  if (!v34 || !-[NSObject count](v34, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

LABEL_35:
      v36 = 0;
      goto LABEL_36;
    }
LABEL_33:
    -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.3(aSelector);
    goto LABEL_34;
  }
  objc_msgSend(v9, "computeEngine");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "compileLayerDeviceOps:sourceTensors:resultTensor:", v34, v10, v11);
LABEL_25:

LABEL_31:
  v44.receiver = self;
  v44.super_class = (Class)MLCConcatenationLayer;
  -[MLCLayer bindDevice:deviceOps:](&v44, sel_bindDevice_deviceOps_, v9, v34);
LABEL_36:

  return v36;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  unint64_t i;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = 0;
  v34 = 0u;
  v35 = 0u;
  while (1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0, v34, v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v6 >= v10)
      break;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v34 + v6) = objc_msgSend(v14, "unsignedIntegerValue");

    ++v6;
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v15 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "descriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shape");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", -[MLCConcatenationLayer dimension](self, "dimension"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      v21 = -[MLCConcatenationLayer dimension](self, "dimension");
      *((_QWORD *)&v34 + v21) += v20;

      ++v15;
    }
    while (v15 < objc_msgSend(v4, "count"));
  }
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (i >= v26)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((_QWORD *)&v34 + i));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v27, i);

  }
  v28 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "descriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v28, objc_msgSend(v30, "dataType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  return -[MLCConcatenationLayer dimension](self, "dimension") != 0;
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
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCConcatenationLayer dimension](self, "dimension");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dimension=%lu : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>"), v5, -[MLCLayer layerID](self, "layerID"), -[MLCConcatenationLayer dimension](self, "dimension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDimension:", -[MLCConcatenationLayer dimension](self, "dimension"));
}

- (NSUInteger)dimension
{
  return self->_dimension;
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

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, 2u);

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

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensors count must be >= 1", v4, v5, v6, v7, 2u);

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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
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

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the shape count of source tensros must match", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

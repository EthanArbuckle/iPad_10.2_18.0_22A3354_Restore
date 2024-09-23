@implementation MLCReductionLayer

+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimension:(NSUInteger)dimension
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v5 = *(_QWORD *)&reductionType;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", dimension);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithReduceType:dimensions:", v5, v8);

  return (MLCReductionLayer *)v9;
}

+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimensions:(NSArray *)dimensions
{
  uint64_t v4;
  NSArray *v6;
  void *v7;

  v4 = *(_QWORD *)&reductionType;
  v6 = dimensions;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReduceType:dimensions:", v4, v6);

  return (MLCReductionLayer *)v7;
}

- (MLCReductionLayer)initWithReduceType:(int)a3 dimensions:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  MLCReductionLayer *v10;
  MLCReductionLayer *v11;
  MLCReductionLayer *v12;
  uint64_t v13;
  NSArray *dimensions;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if ((a3 - 5) >= 2)
  {
    if (!a3)
      goto LABEL_3;
  }
  else if (objc_msgSend(v7, "count") != 1)
  {
LABEL_3:
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v16;
      v20 = 1024;
      v21 = a3;
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_1D4999000, v9, OS_LOG_TYPE_ERROR, "%@: failure to create reduction layer with reduceType = %d, dimensions = %@", buf, 0x1Cu);

    }
    v10 = 0;
    goto LABEL_10;
  }
  v17.receiver = self;
  v17.super_class = (Class)MLCReductionLayer;
  v11 = -[MLCLayer initWithLabel:](&v17, sel_initWithLabel_, CFSTR("Reduction"));
  v12 = v11;
  if (v11)
  {
    v11->_reductionType = a3;
    v13 = objc_msgSend(v8, "copy");
    dimensions = v12->_dimensions;
    v12->_dimensions = (NSArray *)v13;

  }
  self = v12;
  v10 = self;
LABEL_10:

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v27;
  NSObject *v28;
  const char *v30;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[MLCReductionLayer reductionType](self, "reductionType") == MLCReductionTypeAll
    || -[MLCReductionLayer reductionType](self, "reductionType") == MLCReductionTypeAny)
  {
    if (objc_msgSend(v10, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "descriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "dataType");

        v16 = v15 != 4;
        if (v15 != 4)
          break;
        ++v12;
      }
      while (v12 < objc_msgSend(v10, "count"));
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v11, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "dataType");

    if (v16 || v18 != 4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCReductionLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2, v25);
      goto LABEL_19;
    }
  }
  v30 = a2;
  objc_msgSend(v9, "computeEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MLCReductionLayer reductionType](self, "reductionType");
  -[MLCReductionLayer dimensions](self, "dimensions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reductionLayerWithReduceType:dimensions:sourceShapeCount:", v20, v21, objc_msgSend(v24, "count"));
  v25 = objc_claimAutoreleasedReturnValue();

  if (!v25 || !-[NSObject count](v25, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v30, (uint64_t)v25, v28);

LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v9, "computeEngine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "compileLayerDeviceOps:sourceTensors:resultTensor:", v25, v10, v11);

  v31.receiver = self;
  v31.super_class = (Class)MLCReductionLayer;
  -[MLCLayer bindDevice:deviceOps:](&v31, sel_bindDevice_deviceOps_, v9, v25);
LABEL_20:

  return v27;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[MLCReductionLayer dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    while (1)
    {
      -[MLCReductionLayer dimensions](self, "dimensions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      if (v12 == a4)
        break;
      ++v9;
      -[MLCReductionLayer dimensions](self, "dimensions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v9 >= v14)
        return a3;
    }
    return 1;
  }
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
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
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (i >= v10)
      break;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MLCReductionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v14, "unsignedIntegerValue"), i);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v16, i);

  }
  v17 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v17, objc_msgSend(v19, "dataType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCReductionLayer reductionType](self, "reductionType");
  -[MLCReductionLayer dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { reduceType=%d : dimension=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  MLCReductionTypeDebugDescription(-[MLCReductionLayer reductionType](self, "reductionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCReductionLayer dimensions](self, "dimensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Reduction Type: %@    Dimension: %@</FONT>>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (NSUInteger)dimension
{
  void *v2;
  void *v3;
  NSUInteger v4;

  -[MLCReductionLayer dimensions](self, "dimensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Data type for reduction type must be BOOLean", (uint8_t *)&v4, 0xCu);

}

@end

@implementation MLCSoftmaxLayer

+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation
{
  return (MLCSoftmaxLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSoftmaxOperation:dimension:", *(_QWORD *)&operation, 1);
}

+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation dimension:(NSUInteger)dimension
{
  return (MLCSoftmaxLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSoftmaxOperation:dimension:", *(_QWORD *)&operation, dimension);
}

- (MLCSoftmaxLayer)initWithSoftmaxOperation:(int)a3 dimension:(unint64_t)a4
{
  MLCSoftmaxLayer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLCSoftmaxLayer;
  result = -[MLCLayer initWithLabel:](&v7, sel_initWithLabel_, CFSTR("Softmax"));
  if (result)
  {
    result->_operation = a3;
    result->_dimension = a4;
  }
  return result;
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
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCSoftmaxLayer, "supportsDataType:onDevice:", v18, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      v29 = 1024;
      v30 = v18;
      v31 = 2112;
      v32 = v9;
      _os_log_error_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%@: softmax layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "computeEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "softmaxLayerWithOperation:dimension:sourceShapeCount:", -[MLCSoftmaxLayer operation](self, "operation"), -[MLCSoftmaxLayer dimension](self, "dimension"), v15);
  v20 = objc_claimAutoreleasedReturnValue();

  if (!v20 || !-[NSObject count](v20, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v20, v24);

LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v9, "computeEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "compileLayerDeviceOps:sourceTensors:resultTensor:", v20, v10, v11);

  v26.receiver = self;
  v26.super_class = (Class)MLCSoftmaxLayer;
  -[MLCLayer bindDevice:deviceOps:](&v26, sel_bindDevice_deviceOps_, v9, v20);
LABEL_11:

  return v22;
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
  v6 = -[MLCSoftmaxLayer operation](self, "operation");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
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
  MLCSoftmaxOperationDebugDescription(-[MLCSoftmaxLayer operation](self, "operation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Operation: %@    Dimension: %lu</FONT>>"), v5, v6, v7, -[MLCSoftmaxLayer dimension](self, "dimension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MLCSoftmaxOperation)operation
{
  return self->_operation;
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

@end

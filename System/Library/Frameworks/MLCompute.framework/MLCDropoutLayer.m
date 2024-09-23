@implementation MLCDropoutLayer

+ (MLCDropoutLayer)layerWithRate:(float)rate seed:(NSUInteger)seed
{
  id v6;
  double v7;

  v6 = objc_alloc((Class)a1);
  *(float *)&v7 = rate;
  return (MLCDropoutLayer *)(id)objc_msgSend(v6, "initWithRate:seed:", seed, v7);
}

- (MLCDropoutLayer)initWithRate:(float)a3 seed:(unint64_t)a4
{
  MLCDropoutLayer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLCDropoutLayer;
  result = -[MLCLayer initWithLabel:](&v7, sel_initWithLabel_, CFSTR("Dropout"));
  if (result)
  {
    result->_rate = a3;
    result->_seed = a4;
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
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSUInteger v18;
  double v19;
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
  v14 = objc_msgSend(v13, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCDropoutLayer, "supportsDataType:onDevice:", v14, v9))
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
      v30 = v14;
      v31 = 2112;
      v32 = v9;
      _os_log_error_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%@: dropout layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "computeEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDropoutLayer rate](self, "rate");
  v17 = v16;
  v18 = -[MLCDropoutLayer seed](self, "seed");
  LODWORD(v19) = v17;
  objc_msgSend(v15, "dropoutLayerWithRate:seed:", v18, v19);
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
  v26.super_class = (Class)MLCDropoutLayer;
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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  double v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDropoutLayer rate](self, "rate");
  v7 = v6;
  v8 = -[MLCDropoutLayer seed](self, "seed");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { rate=%f : seed=%lu : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, *(_QWORD *)&v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  float v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCDropoutLayer rate](self, "rate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Rate: %.03f    Seed: %lu</FONT>>"), v5, v6, v7, -[MLCDropoutLayer seed](self, "seed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (float)rate
{
  return self->_rate;
}

- (NSUInteger)seed
{
  return self->_seed;
}

@end

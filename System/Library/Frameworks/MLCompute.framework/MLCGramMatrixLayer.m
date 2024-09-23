@implementation MLCGramMatrixLayer

+ (MLCGramMatrixLayer)layerWithScale:(float)scale
{
  id v4;
  double v5;

  v4 = objc_alloc((Class)a1);
  *(float *)&v5 = scale;
  return (MLCGramMatrixLayer *)(id)objc_msgSend(v4, "initWithScaleFactor:", v5);
}

- (MLCGramMatrixLayer)initWithScaleFactor:(float)a3
{
  MLCGramMatrixLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCGramMatrixLayer;
  result = -[MLCLayer initWithLabel:](&v5, sel_initWithLabel_, CFSTR("GramMatrix"));
  if (result)
    result->_scale = a3;
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
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCGramMatrixLayer, "supportsDataType:onDevice:", v14, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v19;
      v25 = 1024;
      v26 = v14;
      v27 = 2112;
      v28 = v9;
      _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%@: GramMatrix layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "computeEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGramMatrixLayer scale](self, "scale");
  objc_msgSend(v15, "gramMatrixLayerWithScaleFactor:");
  v16 = objc_claimAutoreleasedReturnValue();

  if (!v16 || !-[NSObject count](v16, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v16, v20);

LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v9, "computeEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "compileLayerDeviceOps:sourceTensors:resultTensor:", v16, v10, v11);

  v22.receiver = self;
  v22.super_class = (Class)MLCGramMatrixLayer;
  -[MLCLayer bindDevice:deviceOps:](&v22, sel_bindDevice_deviceOps_, v9, v16);
LABEL_11:

  return v18;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCGramMatrixLayer resultSizeFromSourceSize:dimension:].cold.1(a2, v5);

  return 0;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    {
      v9 = a4 == 2;
      goto LABEL_7;
    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

LABEL_7:
  return v9;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

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
    v14 = objc_msgSend(v13, "count");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (i == 2 && v14 == 3)
      v19 = 3;
    else
      v19 = i;
    v20 = -[MLCGramMatrixLayer resultSizeFromSourceSizes:dimension:](self, "resultSizeFromSourceSizes:dimension:", v17, v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v21, i);

  }
  v22 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, objc_msgSend(v24, "dataType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGramMatrixLayer scale](self, "scale");
  v7 = v6;
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { scale=%f : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, *(_QWORD *)&v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  -[MLCGramMatrixLayer scale](self, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Scale: %.03f</FONT>>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (float)scale
{
  return self->_scale;
}

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Please call resultSizeFromSourceSizes:dimension", (uint8_t *)&v4, 0xCu);

}

@end

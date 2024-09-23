@implementation MLCRMSPropOptimizer

+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  MLCOptimizerDescriptor *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = optimizerDescriptor;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 1065185444;
  LODWORD(v7) = 841731191;
  LODWORD(v8) = 0;
  v9 = (void *)objc_msgSend(v5, "initWithDescriptor:momentumScale:alpha:epsilon:centered:", v4, 0, v8, v6, v7);

  return (MLCRMSPropOptimizer *)v9;
}

+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale alpha:(float)alpha epsilon:(float)epsilon isCentered:(BOOL)isCentered
{
  _BOOL8 v7;
  MLCOptimizerDescriptor *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v7 = isCentered;
  v12 = optimizerDescriptor;
  v13 = objc_alloc((Class)a1);
  *(float *)&v14 = momentumScale;
  *(float *)&v15 = alpha;
  *(float *)&v16 = epsilon;
  v17 = (void *)objc_msgSend(v13, "initWithDescriptor:momentumScale:alpha:epsilon:centered:", v12, v7, v14, v15, v16);

  return (MLCRMSPropOptimizer *)v17;
}

- (MLCRMSPropOptimizer)initWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  MLCRMSPropOptimizer *v14;
  MLCRMSPropOptimizer *v15;
  char *v16;
  char *v17;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;

  v7 = a7;
  v13 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MLCRMSPropOptimizer;
  v14 = -[MLCOptimizer initWithDescriptor:](&v24, sel_initWithDescriptor_, v13);
  v15 = v14;
  if (v14)
  {
    v14->_momentumScale = a4;
    v14->_alpha = a5;
    v14->_epsilon = a6;
    v14->_isCentered = v7;
    objc_storeStrong((id *)&v14->_optimizerDescriptor, a3);
    v23.receiver = v15;
    v23.super_class = (Class)MLCRMSPropOptimizer;
    -[MLCOptimizer setNumOptimizerDataBuffers:](&v23, sel_setNumOptimizerDataBuffers_, 1);
    if (v7)
    {
      v22.receiver = v15;
      v22.super_class = (Class)MLCRMSPropOptimizer;
      v16 = -[MLCOptimizer numOptimizerDataBuffers](&v22, sel_numOptimizerDataBuffers);
      v21.receiver = v15;
      v21.super_class = (Class)MLCRMSPropOptimizer;
      -[MLCOptimizer setNumOptimizerDataBuffers:](&v21, sel_setNumOptimizerDataBuffers_, v16 + 1);
    }
    if (a4 > 0.0)
    {
      v20.receiver = v15;
      v20.super_class = (Class)MLCRMSPropOptimizer;
      v17 = -[MLCOptimizer numOptimizerDataBuffers](&v20, sel_numOptimizerDataBuffers);
      v19.receiver = v15;
      v19.super_class = (Class)MLCRMSPropOptimizer;
      -[MLCOptimizer setNumOptimizerDataBuffers:](&v19, sel_setNumOptimizerDataBuffers_, v17 + 1);
    }
  }

  return v15;
}

- (BOOL)compileForDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  NSObject *v23;
  objc_super v25;

  v5 = a3;
  objc_msgSend(v5, "computeEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCRMSPropOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCRMSPropOptimizer momentumScale](self, "momentumScale");
  v9 = v8;
  -[MLCRMSPropOptimizer alpha](self, "alpha");
  v11 = v10;
  -[MLCRMSPropOptimizer epsilon](self, "epsilon");
  v13 = v12;
  v14 = -[MLCRMSPropOptimizer isCentered](self, "isCentered");
  LODWORD(v15) = v9;
  LODWORD(v16) = v11;
  LODWORD(v17) = v13;
  objc_msgSend(v6, "optimizerRMSPropWithDescriptor:momentumScale:alpha:epsilon:centered:", v7, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && objc_msgSend(v18, "count"))
  {
    objc_msgSend(v5, "computeEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v5, "computeEngine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "compileOptimizerDeviceOps:", v18);

    }
    else
    {
      v22 = 1;
    }
    v25.receiver = self;
    v25.super_class = (Class)MLCRMSPropOptimizer;
    -[MLCOptimizer bindDevice:deviceOps:](&v25, sel_bindDevice_deviceOps_, v5, v18);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v18, v23);

    v22 = 0;
  }

  return v22;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCRMSPropOptimizer momentumScale](self, "momentumScale");
  v7 = v6;
  -[MLCRMSPropOptimizer alpha](self, "alpha");
  v9 = v8;
  -[MLCRMSPropOptimizer epsilon](self, "epsilon");
  v11 = v10;
  v12 = -[MLCRMSPropOptimizer isCentered](self, "isCentered");
  -[MLCRMSPropOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { momentumScale=%f : alpha=%f : epsilon=%f : centered=%d : optimizerDescriptor=%@ }"), v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCRMSPropOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCRMSPropOptimizer momentumScale](self, "momentumScale");
  v7 = v6;
  -[MLCRMSPropOptimizer alpha](self, "alpha");
  v9 = v8;
  -[MLCRMSPropOptimizer epsilon](self, "epsilon");
  v11 = v10;
  v12 = -[MLCRMSPropOptimizer isCentered](self, "isCentered");
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  LODWORD(v15) = v11;
  v16 = (void *)objc_msgSend(v4, "initWithDescriptor:momentumScale:alpha:epsilon:centered:", v5, v12, v13, v14, v15);

  return v16;
}

- (float)momentumScale
{
  return self->_momentumScale;
}

- (float)alpha
{
  return self->_alpha;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (MLCOptimizerDescriptor)optimizerDescriptor
{
  return self->_optimizerDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerDescriptor, 0);
}

@end

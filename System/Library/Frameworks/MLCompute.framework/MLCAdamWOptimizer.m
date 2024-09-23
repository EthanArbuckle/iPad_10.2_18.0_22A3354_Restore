@implementation MLCAdamWOptimizer

+ (MLCAdamWOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  MLCOptimizerDescriptor *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = optimizerDescriptor;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 1063675494;
  LODWORD(v7) = 1065336439;
  LODWORD(v8) = 841731191;
  v9 = (void *)objc_msgSend(v5, "initWithDescriptor:beta1:beta2:epsilon:usesAMSGrad:timeStep:", v4, 0, 1, v6, v7, v8);

  return (MLCAdamWOptimizer *)v9;
}

+ (MLCAdamWOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor beta1:(float)beta1 beta2:(float)beta2 epsilon:(float)epsilon usesAMSGrad:(BOOL)usesAMSGrad timeStep:(NSUInteger)timeStep
{
  _BOOL8 v9;
  MLCOptimizerDescriptor *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v9 = usesAMSGrad;
  v14 = optimizerDescriptor;
  v15 = objc_alloc((Class)a1);
  *(float *)&v16 = beta1;
  *(float *)&v17 = beta2;
  *(float *)&v18 = epsilon;
  v19 = (void *)objc_msgSend(v15, "initWithDescriptor:beta1:beta2:epsilon:usesAMSGrad:timeStep:", v14, v9, timeStep, v16, v17, v18);

  return (MLCAdamWOptimizer *)v19;
}

- (MLCAdamWOptimizer)initWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 usesAMSGrad:(BOOL)a7 timeStep:(unint64_t)a8
{
  _BOOL4 v9;
  id v15;
  MLCAdamWOptimizer *v16;
  MLCAdamWOptimizer *v17;
  uint64_t v18;
  objc_super v20;
  objc_super v21;

  v9 = a7;
  v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLCAdamWOptimizer;
  v16 = -[MLCOptimizer initWithDescriptor:](&v21, sel_initWithDescriptor_, v15);
  v17 = v16;
  if (v16)
  {
    v16->_beta1 = a4;
    v16->_beta2 = a5;
    v16->_epsilon = a6;
    v16->_usesAMSGrad = v9;
    v16->_timeStep = a8;
    objc_storeStrong((id *)&v16->_optimizerDescriptor, a3);
    if (v9)
      v18 = 3;
    else
      v18 = 2;
    v20.receiver = v17;
    v20.super_class = (Class)MLCAdamWOptimizer;
    -[MLCOptimizer setNumOptimizerDataBuffers:](&v20, sel_setNumOptimizerDataBuffers_, v18);
  }

  return v17;
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
  NSUInteger v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  NSObject *v24;
  objc_super v26;

  v5 = a3;
  objc_msgSend(v5, "computeEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCAdamWOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCAdamWOptimizer beta1](self, "beta1");
  v9 = v8;
  -[MLCAdamWOptimizer beta2](self, "beta2");
  v11 = v10;
  -[MLCAdamWOptimizer epsilon](self, "epsilon");
  v13 = v12;
  v14 = -[MLCAdamWOptimizer usesAMSGrad](self, "usesAMSGrad");
  v15 = -[MLCAdamWOptimizer timeStep](self, "timeStep");
  LODWORD(v16) = v9;
  LODWORD(v17) = v11;
  LODWORD(v18) = v13;
  objc_msgSend(v6, "optimizerAdamWithDescriptor:beta1:beta2:epsilon:amsgrad:timeStep:isAdamW:", v7, v14, v15, 1, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && objc_msgSend(v19, "count"))
  {
    objc_msgSend(v5, "computeEngine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(v5, "computeEngine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "compileOptimizerDeviceOps:", v19);

    }
    else
    {
      v23 = 1;
    }
    v26.receiver = self;
    v26.super_class = (Class)MLCAdamWOptimizer;
    -[MLCOptimizer bindDevice:deviceOps:](&v26, sel_bindDevice_deviceOps_, v5, v19);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v19, v24);

    v23 = 0;
  }

  return v23;
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
  NSUInteger v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCAdamWOptimizer beta1](self, "beta1");
  v7 = v6;
  -[MLCAdamWOptimizer beta2](self, "beta2");
  v9 = v8;
  -[MLCAdamWOptimizer epsilon](self, "epsilon");
  v11 = v10;
  v12 = -[MLCAdamWOptimizer usesAMSGrad](self, "usesAMSGrad");
  v13 = -[MLCAdamWOptimizer timeStep](self, "timeStep");
  -[MLCAdamWOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { beta1=%f : beta2=%f : epsilon=%f : usesAMSGrad=%d : timeStep=%lu : optimizerDescriptor=%@ }"), v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
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
  NSUInteger v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCAdamWOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCAdamWOptimizer beta1](self, "beta1");
  v7 = v6;
  -[MLCAdamWOptimizer beta2](self, "beta2");
  v9 = v8;
  -[MLCAdamWOptimizer epsilon](self, "epsilon");
  v11 = v10;
  v12 = -[MLCAdamWOptimizer usesAMSGrad](self, "usesAMSGrad");
  v13 = -[MLCAdamWOptimizer timeStep](self, "timeStep");
  LODWORD(v14) = v7;
  LODWORD(v15) = v9;
  LODWORD(v16) = v11;
  v17 = (void *)objc_msgSend(v4, "initWithDescriptor:beta1:beta2:epsilon:usesAMSGrad:timeStep:", v5, v12, v13, v14, v15, v16);

  return v17;
}

- (float)beta1
{
  return self->_beta1;
}

- (float)beta2
{
  return self->_beta2;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (BOOL)usesAMSGrad
{
  return self->_usesAMSGrad;
}

- (NSUInteger)timeStep
{
  return self->_timeStep;
}

- (void)setTimeStep:(unint64_t)a3
{
  self->_timeStep = a3;
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

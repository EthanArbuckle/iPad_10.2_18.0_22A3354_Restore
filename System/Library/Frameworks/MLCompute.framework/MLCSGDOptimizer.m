@implementation MLCSGDOptimizer

+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  MLCOptimizerDescriptor *v4;
  id v5;
  double v6;
  void *v7;

  v4 = optimizerDescriptor;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 0;
  v7 = (void *)objc_msgSend(v5, "initWithMomentumScale:useNesterovMomentum:optimizerDescriptor:", 0, v4, v6);

  return (MLCSGDOptimizer *)v7;
}

+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale usesNesterovMomentum:(BOOL)usesNesterovMomentum
{
  _BOOL8 v5;
  MLCOptimizerDescriptor *v8;
  id v9;
  double v10;
  void *v11;

  v5 = usesNesterovMomentum;
  v8 = optimizerDescriptor;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = momentumScale;
  v11 = (void *)objc_msgSend(v9, "initWithMomentumScale:useNesterovMomentum:optimizerDescriptor:", v5, v8, v10);

  return (MLCSGDOptimizer *)v11;
}

- (MLCSGDOptimizer)initWithMomentumScale:(float)a3 useNesterovMomentum:(BOOL)a4 optimizerDescriptor:(id)a5
{
  id v9;
  MLCSGDOptimizer *v10;
  MLCSGDOptimizer *v11;
  objc_super v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MLCSGDOptimizer;
  v10 = -[MLCOptimizer initWithDescriptor:](&v14, sel_initWithDescriptor_, v9);
  v11 = v10;
  if (v10)
  {
    v10->_momentumScale = a3;
    v10->_usesNesterovMomentum = a4;
    objc_storeStrong((id *)&v10->_optimizerDescriptor, a5);
    v13.receiver = v11;
    v13.super_class = (Class)MLCSGDOptimizer;
    -[MLCOptimizer setNumOptimizerDataBuffers:](&v13, sel_setNumOptimizerDataBuffers_, 1);
  }

  return v11;
}

- (BOOL)compileForDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _BOOL8 v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  NSObject *v17;
  objc_super v19;

  v5 = a3;
  objc_msgSend(v5, "computeEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSGDOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSGDOptimizer momentumScale](self, "momentumScale");
  v9 = v8;
  v10 = -[MLCSGDOptimizer usesNesterovMomentum](self, "usesNesterovMomentum");
  LODWORD(v11) = v9;
  objc_msgSend(v6, "optimizerSGDWithDescriptor:momentunScale:useNesterovMomentum:", v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v5, "computeEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v5, "computeEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "compileOptimizerDeviceOps:", v12);

    }
    else
    {
      v16 = 1;
    }
    v19.receiver = self;
    v19.super_class = (Class)MLCSGDOptimizer;
    -[MLCOptimizer bindDevice:deviceOps:](&v19, sel_bindDevice_deviceOps_, v5, v12);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v12, v17);

    v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSGDOptimizer momentumScale](self, "momentumScale");
  v7 = v6;
  v8 = -[MLCSGDOptimizer usesNesterovMomentum](self, "usesNesterovMomentum");
  -[MLCSGDOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { momentumScale=%f : useNesterovMomentum=%d : optimizerDescriptor=%@ }"), v5, *(_QWORD *)&v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int v5;
  int v6;
  _BOOL8 v7;
  void *v8;
  double v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCSGDOptimizer momentumScale](self, "momentumScale");
  v6 = v5;
  v7 = -[MLCSGDOptimizer usesNesterovMomentum](self, "usesNesterovMomentum");
  -[MLCSGDOptimizer optimizerDescriptor](self, "optimizerDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v6;
  v10 = (void *)objc_msgSend(v4, "initWithMomentumScale:useNesterovMomentum:optimizerDescriptor:", v7, v8, v9);

  return v10;
}

- (float)momentumScale
{
  return self->_momentumScale;
}

- (BOOL)usesNesterovMomentum
{
  return self->_usesNesterovMomentum;
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

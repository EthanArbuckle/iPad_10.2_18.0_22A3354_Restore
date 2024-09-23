@implementation MLCOptimizer

- (MLCOptimizer)initWithDescriptor:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v4 = a3;
  objc_msgSend(v4, "learningRate");
  v6 = v5;
  objc_msgSend(v4, "gradientRescale");
  v8 = v7;
  v9 = objc_msgSend(v4, "appliesGradientClipping");
  objc_msgSend(v4, "gradientClipMax");
  v11 = v10;
  objc_msgSend(v4, "gradientClipMin");
  v13 = v12;
  objc_msgSend(v4, "regularizationScale");
  v15 = v14;
  v16 = objc_msgSend(v4, "regularizationType");
  v17 = objc_msgSend(v4, "gradientClippingType");
  objc_msgSend(v4, "maximumClippingNorm");
  v19 = v18;
  objc_msgSend(v4, "customGlobalNorm");
  v21 = v20;

  LODWORD(v22) = v6;
  LODWORD(v23) = v8;
  LODWORD(v24) = v11;
  LODWORD(v25) = v13;
  LODWORD(v26) = v15;
  LODWORD(v27) = v19;
  LODWORD(v28) = v21;
  return -[MLCOptimizer initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationScale:regularizationType:gradientClippingType:maximumClippingNorm:customGlobalNorm:](self, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationScale:regularizationType:gradientClippingType:maximumClippingNorm:customGlobalNorm:", v9, v16, v17, v22, v23, v24, v25, v26, v27, v28);
}

- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12
{
  MLCOptimizer *result;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MLCOptimizer;
  result = -[MLCOptimizer init](&v23, sel_init);
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a8;
    result->_numOptimizerDataBuffers = 0;
    result->_regularizationType = a9;
    result->_gradientClippingType = a10;
    result->_maximumClippingNorm = a11;
    result->_customGlobalNorm = a12;
  }
  return result;
}

- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9
{
  MLCOptimizer *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MLCOptimizer;
  result = -[MLCOptimizer init](&v17, sel_init);
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a8;
    result->_regularizationType = a9;
    result->_numOptimizerDataBuffers = 0;
  }
  return result;
}

- (void)bindDevice:(id)a3 deviceOps:(id)a4
{
  id v6;

  v6 = a4;
  -[MLCOptimizer setDevice:](self, "setDevice:", a3);
  -[MLCOptimizer setDeviceOps:](self, "setDeviceOps:", v6);

  -[MLCOptimizer setOneStepOptimizerBuffers:](self, "setOneStepOptimizerBuffers:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  double v10;
  _BOOL4 v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  float v21;
  double v22;
  float v23;
  void *v24;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCOptimizer device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCOptimizer learningRate](self, "learningRate");
  v8 = v7;
  -[MLCOptimizer gradientRescale](self, "gradientRescale");
  v10 = v9;
  v11 = -[MLCOptimizer appliesGradientClipping](self, "appliesGradientClipping");
  -[MLCOptimizer gradientClipMax](self, "gradientClipMax");
  v13 = v12;
  -[MLCOptimizer gradientClipMin](self, "gradientClipMin");
  v15 = v14;
  -[MLCOptimizer regularizationScale](self, "regularizationScale");
  v17 = v16;
  v18 = -[MLCOptimizer regularizationType](self, "regularizationType");
  -[MLCOptimizer deviceOps](self, "deviceOps");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MLCOptimizer gradientClippingType](self, "gradientClippingType");
  -[MLCOptimizer maximumClippingNorm](self, "maximumClippingNorm");
  v22 = v21;
  -[MLCOptimizer customGlobalNorm](self, "customGlobalNorm");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { device=%@ : learningRate=%f : gradientRescale=%f : applyGradientClipping=%d : gradientClipMax=%f : gradientClipMin=%f : regularizationScale=%f : regularizationType=%d : deviceOps=%@ : gradientClippingType=%d : maximumClippingNorm=%f : customGlobalNorm=%f}"), v5, v6, *(_QWORD *)&v8, *(_QWORD *)&v10, v11, *(_QWORD *)&v13, *(_QWORD *)&v15, *(_QWORD *)&v17, v18, v19, v20, *(_QWORD *)&v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _BOOL8 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCOptimizer learningRate](self, "learningRate");
  v6 = v5;
  -[MLCOptimizer gradientRescale](self, "gradientRescale");
  v8 = v7;
  v9 = -[MLCOptimizer appliesGradientClipping](self, "appliesGradientClipping");
  -[MLCOptimizer gradientClipMax](self, "gradientClipMax");
  v11 = v10;
  -[MLCOptimizer gradientClipMin](self, "gradientClipMin");
  v13 = v12;
  -[MLCOptimizer regularizationScale](self, "regularizationScale");
  v15 = v14;
  v16 = -[MLCOptimizer regularizationType](self, "regularizationType");
  v17 = -[MLCOptimizer gradientClippingType](self, "gradientClippingType");
  -[MLCOptimizer maximumClippingNorm](self, "maximumClippingNorm");
  v19 = v18;
  -[MLCOptimizer customGlobalNorm](self, "customGlobalNorm");
  LODWORD(v21) = v20;
  LODWORD(v22) = v6;
  LODWORD(v23) = v8;
  LODWORD(v24) = v11;
  LODWORD(v25) = v13;
  LODWORD(v26) = v15;
  LODWORD(v27) = v19;
  return (id)objc_msgSend(v4, "initWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationScale:regularizationType:gradientClippingType:maximumClippingNorm:customGlobalNorm:", v9, v16, v17, v22, v23, v24, v25, v26, v27, v21);
}

- (float)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(float)learningRate
{
  self->_learningRate = learningRate;
}

- (float)gradientRescale
{
  return self->_gradientRescale;
}

- (BOOL)appliesGradientClipping
{
  return self->_appliesGradientClipping;
}

- (void)setAppliesGradientClipping:(BOOL)appliesGradientClipping
{
  self->_appliesGradientClipping = appliesGradientClipping;
}

- (float)gradientClipMax
{
  return self->_gradientClipMax;
}

- (float)gradientClipMin
{
  return self->_gradientClipMin;
}

- (float)regularizationScale
{
  return self->_regularizationScale;
}

- (MLCRegularizationType)regularizationType
{
  return self->_regularizationType;
}

- (MLCGradientClippingType)gradientClippingType
{
  return self->_gradientClippingType;
}

- (float)maximumClippingNorm
{
  return self->_maximumClippingNorm;
}

- (float)customGlobalNorm
{
  return self->_customGlobalNorm;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOps, a3);
}

- (unint64_t)numOptimizerDataBuffers
{
  return self->_numOptimizerDataBuffers;
}

- (void)setNumOptimizerDataBuffers:(unint64_t)a3
{
  self->_numOptimizerDataBuffers = a3;
}

- (NSMutableArray)oneStepOptimizerBuffers
{
  return self->_oneStepOptimizerBuffers;
}

- (void)setOneStepOptimizerBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_oneStepOptimizerBuffers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneStepOptimizerBuffers, 0);
  objc_storeStrong((id *)&self->_deviceOps, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

@implementation MLCTensorOptimizerDeviceData

+ (id)optimizerDeviceData
{
  return objc_alloc_init((Class)a1);
}

- (MLCTensorOptimizerDeviceData)init
{
  MLCTensorOptimizerDeviceData *v2;
  MLCTensorOptimizerDeviceData *v3;
  NSArray *momentumVectors;
  NSArray *velocityVectors;
  NSArray *centerWeightVectors;
  id gpuOps;
  NSMutableArray *momentumData;
  NSMutableArray *momentumDataBytes;
  NSData *sourceBNNSDesc;
  NSData *gradientBNNSDesc;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MLCTensorOptimizerDeviceData;
  v2 = -[MLCTensorOptimizerDeviceData init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    momentumVectors = v2->_momentumVectors;
    v2->_momentumVectors = 0;

    velocityVectors = v3->_velocityVectors;
    v3->_velocityVectors = 0;

    centerWeightVectors = v3->_centerWeightVectors;
    v3->_centerWeightVectors = 0;

    gpuOps = v3->_gpuOps;
    v3->_gpuOps = 0;

    momentumData = v3->_momentumData;
    v3->_momentumData = 0;

    momentumDataBytes = v3->_momentumDataBytes;
    v3->_momentumDataBytes = 0;

    sourceBNNSDesc = v3->_sourceBNNSDesc;
    v3->_sourceBNNSDesc = 0;

    gradientBNNSDesc = v3->_gradientBNNSDesc;
    v3->_gradientBNNSDesc = 0;

  }
  return v3;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (NSArray)momentumVectors
{
  return self->_momentumVectors;
}

- (void)setMomentumVectors:(id)a3
{
  objc_storeStrong((id *)&self->_momentumVectors, a3);
}

- (NSArray)velocityVectors
{
  return self->_velocityVectors;
}

- (void)setVelocityVectors:(id)a3
{
  objc_storeStrong((id *)&self->_velocityVectors, a3);
}

- (NSArray)centerWeightVectors
{
  return self->_centerWeightVectors;
}

- (void)setCenterWeightVectors:(id)a3
{
  objc_storeStrong((id *)&self->_centerWeightVectors, a3);
}

- (id)gpuOps
{
  return self->_gpuOps;
}

- (void)setGpuOps:(id)a3
{
  objc_storeStrong(&self->_gpuOps, a3);
}

- (NSMutableArray)momentumData
{
  return self->_momentumData;
}

- (void)setMomentumData:(id)a3
{
  objc_storeStrong((id *)&self->_momentumData, a3);
}

- (NSMutableArray)momentumDataBytes
{
  return self->_momentumDataBytes;
}

- (void)setMomentumDataBytes:(id)a3
{
  objc_storeStrong((id *)&self->_momentumDataBytes, a3);
}

- (NSData)sourceBNNSDesc
{
  return self->_sourceBNNSDesc;
}

- (void)setSourceBNNSDesc:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBNNSDesc, a3);
}

- (NSData)gradientBNNSDesc
{
  return self->_gradientBNNSDesc;
}

- (void)setGradientBNNSDesc:(id)a3
{
  objc_storeStrong((id *)&self->_gradientBNNSDesc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientBNNSDesc, 0);
  objc_storeStrong((id *)&self->_sourceBNNSDesc, 0);
  objc_storeStrong((id *)&self->_momentumDataBytes, 0);
  objc_storeStrong((id *)&self->_momentumData, 0);
  objc_storeStrong(&self->_gpuOps, 0);
  objc_storeStrong((id *)&self->_centerWeightVectors, 0);
  objc_storeStrong((id *)&self->_velocityVectors, 0);
  objc_storeStrong((id *)&self->_momentumVectors, 0);
}

@end

@implementation VCPMAMLFeatureProvider

- (VCPMAMLFeatureProvider)init
{

  return 0;
}

- (VCPMAMLFeatureProvider)initWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4
{
  id v7;
  VCPMAMLFeatureProvider *v8;
  VCPMAMLFeatureProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VCPMAMLFeatureProvider;
  v8 = -[VCPMAMLFeatureProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_featureName, a4);
    v9->_buffer = CVPixelBufferRetain(a3);
  }

  return v9;
}

+ (id)featureProviderWithCVPixelBuffer:(__CVBuffer *)a3 andFeatureName:(id)a4
{
  id v5;
  VCPMAMLFeatureProvider *v6;

  v5 = a4;
  v6 = -[VCPMAMLFeatureProvider initWithCVPixelBuffer:andFeatureName:]([VCPMAMLFeatureProvider alloc], "initWithCVPixelBuffer:andFeatureName:", a3, v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)VCPMAMLFeatureProvider;
  -[VCPMAMLFeatureProvider dealloc](&v3, sel_dealloc);
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_featureName);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", self->_featureName) && self->_buffer)
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end

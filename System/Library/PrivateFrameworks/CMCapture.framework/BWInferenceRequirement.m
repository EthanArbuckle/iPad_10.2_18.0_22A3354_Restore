@implementation BWInferenceRequirement

- (BWInferenceProvider)provider
{
  return self->_provider;
}

- (BWInferenceRequirement)initWithProvider:(id)a3 configuration:(id)a4
{
  BWInferenceRequirement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceRequirement;
  v6 = -[BWInferenceRequirement init](&v8, sel_init);
  if (v6)
  {
    v6->_provider = (BWInferenceProvider *)a3;
    v6->_configuration = (BWInferenceConfiguration *)a4;
  }
  return v6;
}

- (BWInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceRequirement;
  -[BWInferenceRequirement dealloc](&v3, sel_dealloc);
}

@end

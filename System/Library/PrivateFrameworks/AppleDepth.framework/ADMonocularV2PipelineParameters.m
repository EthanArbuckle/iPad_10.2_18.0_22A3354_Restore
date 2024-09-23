@implementation ADMonocularV2PipelineParameters

- (unint64_t)networkVariantOverride
{
  return self->_networkVariantOverride;
}

- (ADMonocularV2PipelineParameters)init
{
  ADMonocularV2PipelineParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADMonocularV2PipelineParameters;
  result = -[ADPipelineParameters init](&v3, sel_init);
  if (result)
    result->_networkVariantOverride = 0;
  return result;
}

- (void)setNetworkVariantOverride:(unint64_t)a3
{
  self->_networkVariantOverride = a3;
}

@end

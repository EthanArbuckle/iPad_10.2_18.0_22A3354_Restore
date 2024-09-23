@implementation BWStillImageConditionalRouterConfiguration

- (unsigned)numberOfOutputs
{
  return self->_numberOfOutputs;
}

- (void)setShouldEmitSampleBufferDecisionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BWStillImageConditionalRouterConfiguration)initWithNumberOfOutputs:(unsigned int)a3
{
  BWStillImageConditionalRouterConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterConfiguration;
  result = -[BWStillImageConditionalRouterConfiguration init](&v5, sel_init);
  if (result)
    result->_numberOfOutputs = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageConditionalRouterConfiguration;
  -[BWStillImageConditionalRouterConfiguration dealloc](&v3, sel_dealloc);
}

- (id)shouldEmitSampleBufferDecisionProvider
{
  return self->_shouldEmitSampleBufferDecisionProvider;
}

- (unsigned)numberOfInputs
{
  return self->_numberOfInputs;
}

- (id)shouldEmitNodeErrorDecisionProvider
{
  return self->_shouldEmitNodeErrorDecisionProvider;
}

- (void)setShouldEmitNodeErrorDecisionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end

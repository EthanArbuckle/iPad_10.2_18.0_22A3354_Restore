@implementation __HMHomeManagerRefreshRequest

- (__HMHomeManagerRefreshRequest)initWithGenerationCounter:(unint64_t)a3 timeout:(double)a4
{
  __HMHomeManagerRefreshRequest *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__HMHomeManagerRefreshRequest;
  result = -[HMFOperation initWithTimeout:](&v6, sel_initWithTimeout_, a4);
  if (result)
    result->_generationCounter = a3;
  return result;
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

@end
